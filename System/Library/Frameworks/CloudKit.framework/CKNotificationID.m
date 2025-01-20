@interface CKNotificationID
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKNotificationID)initWithCoder:(id)a3;
- (CKNotificationID)initWithNotificationUUID:(id)a3;
- (NSString)notificationUUID;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKNotificationID

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKNotificationID)initWithNotificationUUID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationID;
  v8 = [(CKNotificationID *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    notificationUUID = v8->_notificationUUID;
    v8->_notificationUUID = (NSString *)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKNotificationID *)a3;
  if (self == v4)
  {
    char isEqualToString = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_msgSend_notificationUUID(self, v5, v6, v7);
      v15 = objc_msgSend_notificationUUID(v4, v9, v10, v11);
      if (v8 == v15)
      {
        char isEqualToString = 1;
      }
      else
      {
        v16 = objc_msgSend_notificationUUID(self, v12, v13, v14);
        v20 = objc_msgSend_notificationUUID(v4, v17, v18, v19);
        char isEqualToString = objc_msgSend_isEqualToString_(v16, v21, (uint64_t)v20, v22);
      }
    }
    else
    {
      char isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_notificationUUID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)CKPropertiesDescription
{
  id v4 = NSString;
  v5 = objc_msgSend_notificationUUID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"UUID=%@", v7, v5);

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKNotificationID *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  unint64_t v8 = objc_msgSend_notificationUUID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, @"UUID");
}

- (CKNotificationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationID;
  v5 = [(CKNotificationID *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"UUID");
    notificationUUID = v5->_notificationUUID;
    v5->_notificationUUID = (NSString *)v9;
  }

  return v5;
}

- (NSString)notificationUUID
{
  return self->_notificationUUID;
}

- (void).cxx_destruct
{
}

@end