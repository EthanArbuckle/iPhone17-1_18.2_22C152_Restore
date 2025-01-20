@interface CKDPCSMemoryCacheEntry
- (CKDPCSData)pcsData;
- (CKDPCSMemoryCacheEntry)init;
- (double)lastAccess;
- (id)CKPropertiesDescription;
- (id)description;
- (void)setLastAccess:(double)a3;
- (void)setPcsData:(id)a3;
@end

@implementation CKDPCSMemoryCacheEntry

- (CKDPCSMemoryCacheEntry)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKDPCSMemoryCacheEntry;
  v4 = [(CKDPCSMemoryCacheEntry *)&v7 init];
  if (v4)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v2, v3);
    v4->_lastAccess = v5;
  }
  return v4;
}

- (id)CKPropertiesDescription
{
  uint64_t v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 2);
  v4 = NSString;
  objc_super v7 = objc_msgSend_pcsData(self, v5, v6);
  v10 = objc_msgSend_itemID(v7, v8, v9);
  v12 = objc_msgSend_stringWithFormat_(v4, v11, @"PCSItem=%@", v10);
  objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

  v14 = NSString;
  objc_msgSend_lastAccess(self, v15, v16);
  v19 = objc_msgSend_stringWithFormat_(v14, v17, @"lastAccess=%0.0f", v18);
  objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

  v22 = objc_msgSend_componentsJoinedByString_(v3, v21, @", ");

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPCSMemoryCacheEntry *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDPCSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
}

- (double)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(double)a3
{
  self->_lastAccess = a3;
}

- (void).cxx_destruct
{
}

@end