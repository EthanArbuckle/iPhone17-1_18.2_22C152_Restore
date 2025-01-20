@interface MTRServerAttribute
+ (id)newFeatureMapAttributeWithInitialValue:(id)a3;
- (BOOL)addToCluster:(const ConcreteClusterPath *)a3;
- (BOOL)associateWithController:(id)a3;
- (BOOL)isWritable;
- (BOOL)setValue:(id)a3;
- (NSDictionary)value;
- (NSNumber)attributeID;
- (const)parentCluster;
- (id).cxx_construct;
- (id)description;
- (id)initReadonlyAttributeWithID:(id)a3 initialValue:(id)a4 requiredPrivilege:(unsigned __int8)a5;
- (id)serializedValue;
- (unsigned)requiredReadPrivilege;
- (void)invalidate;
- (void)updateParentCluster:(const ConcreteClusterPath *)a3;
@end

@implementation MTRServerAttribute

- (id)initReadonlyAttributeWithID:(id)a3 initialValue:(id)a4 requiredPrivilege:(unsigned __int8)a5
{
  return sub_2446DC614((os_unfair_lock_s *)self, a3, a4, a5, 0);
}

- (BOOL)setValue:(id)a3
{
  return sub_2446DCAFC((os_unfair_lock_s *)self, a3, 1);
}

+ (id)newFeatureMapAttributeWithInitialValue:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MTRServerAttribute alloc];
  v10[0] = @"type";
  v10[1] = @"value";
  v11[0] = @"UnsignedInteger";
  v11[1] = v3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v11, v10, 2);
  inited = objc_msgSend_initReadonlyAttributeWithID_initialValue_requiredPrivilege_(v4, v7, (uint64_t)&unk_26F9C8530, v6, 1);

  return inited;
}

- (NSDictionary)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend_copy(self->_value, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v6;
}

- (BOOL)associateWithController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (WeakRetained)
  {
    v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend_uniqueIdentifier(v4, v8, v9);
      v13 = objc_msgSend_uniqueIdentifier(WeakRetained, v11, v12);
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerAttribute with controller %@; already associated with controller %@",
        buf,
        0x16u);
    }
    if (sub_244CC4E58(1u))
    {
      v16 = objc_msgSend_uniqueIdentifier(v4, v14, v15);
      v22 = objc_msgSend_uniqueIdentifier(WeakRetained, v17, v18);
      sub_244CC4DE0(0, 1);

LABEL_10:
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_deviceController, v4);
    v19 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = sub_2446DD32C((os_unfair_lock *)self);
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_2446BD000, v19, OS_LOG_TYPE_DEFAULT, "Associated %@ with controller", buf, 0xCu);
    }
    if (sub_244CC4E58(2u))
    {
      v16 = sub_2446DD32C((os_unfair_lock *)self);
      sub_244CC4DE0(0, 2);
      goto LABEL_10;
    }
  }

  os_unfair_lock_unlock(p_lock);
  return WeakRetained == 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_deviceController, 0);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addToCluster:(const ConcreteClusterPath *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int mClusterId = self->_parentCluster.mClusterId;
  if (mClusterId == -1)
  {
    self->_parentCluster = *a3;
  }
  else
  {
    v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int mClusterId_high = HIWORD(a3->mClusterId);
      int v9 = (unsigned __int16)a3->mClusterId;
      unsigned int v10 = HIWORD(self->_parentCluster.mClusterId);
      int v11 = (unsigned __int16)self->_parentCluster.mClusterId;
      *(_DWORD *)buf = 67109888;
      unsigned int v14 = mClusterId_high;
      __int16 v15 = 1024;
      int v16 = v9;
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      __int16 v19 = 1024;
      int v20 = v11;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Cannot add attribute to cluster 0x%04X_%04X; already added to cluster 0x%04X_%04X",
        buf,
        0x1Au);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return mClusterId == -1;
}

- (void)updateParentCluster:(const ConcreteClusterPath *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_parentCluster = *a3;

  os_unfair_lock_unlock(p_lock);
}

- (const)parentCluster
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return &self->_parentCluster;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = sub_2446DD32C((os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)attributeID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)requiredReadPrivilege
{
  return self->_requiredReadPrivilege;
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (id)serializedValue
{
  return self->_serializedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serializedValue, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_destroyWeak((id *)&self->_deviceController);
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  *((_DWORD *)self + 9) = 0;
  return self;
}

@end