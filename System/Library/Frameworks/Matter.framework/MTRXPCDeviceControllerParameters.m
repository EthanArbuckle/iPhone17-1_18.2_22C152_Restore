@interface MTRXPCDeviceControllerParameters
- (MTRXPCDeviceControllerParameters)initWithXPConnectionBlock:(id)a3 uniqueIdentifier:(id)a4;
- (NSUUID)uniqueIdentifier;
- (id)xpcConnectionBlock;
@end

@implementation MTRXPCDeviceControllerParameters

- (MTRXPCDeviceControllerParameters)initWithXPConnectionBlock:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MTRXPCDeviceControllerParameters;
  v10 = [(MTRDeviceControllerAbstractParameters *)&v18 _initInternal];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    id xpcConnectionBlock = v10->_xpcConnectionBlock;
    v10->_id xpcConnectionBlock = (id)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSUUID *)v15;
  }
  return v10;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)xpcConnectionBlock
{
  return self->_xpcConnectionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcConnectionBlock, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end