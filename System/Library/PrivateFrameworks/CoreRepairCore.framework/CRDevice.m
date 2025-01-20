@interface CRDevice
- (BOOL)populateLookupDictionary:(id)a3;
- (CRDevice)initWithComponents:(id)a3;
- (NSArray)components;
- (NSDictionary)typeToComponent;
- (id)getComponentByType:(int)a3;
- (void)setComponents:(id)a3;
- (void)setTypeToComponent:(id)a3;
@end

@implementation CRDevice

- (CRDevice)initWithComponents:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRDevice;
  v6 = [(CRDevice *)&v12 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_components, a3),
        !objc_msgSend_populateLookupDictionary_(v7, v8, (uint64_t)v5, v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)populateLookupDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v5, v6, v7);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = (NSDictionary *)v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v19 = NSNumber;
        uint64_t v20 = objc_msgSend_type(v18, v12, v13, v14, (void)v40);
        v23 = objc_msgSend_numberWithUnsignedInt_(v19, v21, v20, v22);
        v26 = objc_msgSend_objectForKey_(v8, v24, (uint64_t)v23, v25);

        if (v26)
        {
          BOOL v38 = 0;
          typeToComponent = v9;
          goto LABEL_11;
        }
        v30 = NSNumber;
        uint64_t v31 = objc_msgSend_type(v18, v27, v28, v29);
        v34 = objc_msgSend_numberWithUnsignedInt_(v30, v32, v31, v33);
        objc_msgSend_setObject_forKeyedSubscript_(v8, v35, (uint64_t)v18, (uint64_t)v34);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v40, (uint64_t)v44, 16);
      if (v15) {
        continue;
      }
      break;
    }
  }

  v36 = v8;
  typeToComponent = self->_typeToComponent;
  self->_typeToComponent = v36;
  BOOL v38 = 1;
LABEL_11:

  return v38;
}

- (id)getComponentByType:(int)a3
{
  typeToComponent = self->_typeToComponent;
  id v5 = objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3);
  v8 = objc_msgSend_objectForKey_(typeToComponent, v6, (uint64_t)v5, v7);

  return v8;
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (NSDictionary)typeToComponent
{
  return self->_typeToComponent;
}

- (void)setTypeToComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeToComponent, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end