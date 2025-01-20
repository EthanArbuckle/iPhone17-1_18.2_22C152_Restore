@interface CKQueryCursor
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CKQueryCursor)init;
- (CKQueryCursor)initWithCoder:(id)a3;
- (CKQueryCursor)initWithData:(id)a3 zoneID:(id)a4;
- (CKRecordZoneID)zoneID;
- (NSData)data;
- (id)CKPropertiesDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKQueryCursor

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKQueryCursor)init
{
  v2 = [CKException alloc];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, @"You can't call init on %@", v4);

  objc_exception_throw(v6);
}

- (CKQueryCursor)initWithData:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKQueryCursor;
  v11 = [(CKQueryCursor *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    data = v11->_data;
    v11->_data = (NSData *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    zoneID = v11->_zoneID;
    v11->_zoneID = (CKRecordZoneID *)v17;
  }
  return v11;
}

- (id)CKPropertiesDescription
{
  v5 = objc_msgSend_data(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_CKSHA256(v5, v6, v7, v8);

  if (v9)
  {
    int v13 = objc_msgSend_length(v9, v10, v11, v12);
    if (v13 >= 16) {
      int v16 = 16;
    }
    else {
      int v16 = v13;
    }
    uint64_t v17 = objc_msgSend_substringToIndex_(v9, v14, v16, v15);
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = NSString;
  v19 = objc_msgSend_zoneID(self, v10, v11, v12);
  v22 = objc_msgSend_stringWithFormat_(v18, v20, @"id=%@, zone=%@", v21, v17, v19);

  return v22;
}

- (id)description
{
  return (id)((uint64_t (*)(CKQueryCursor *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_data(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"CursorData");

  int v13 = objc_msgSend_zoneID(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v15, v14, (uint64_t)v13, @"ZoneID");
}

- (CKQueryCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKQueryCursor;
  v5 = [(CKQueryCursor *)&v16 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"CursorData");
    data = v5->_data;
    v5->_data = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"ZoneID");
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v13;
  }

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end