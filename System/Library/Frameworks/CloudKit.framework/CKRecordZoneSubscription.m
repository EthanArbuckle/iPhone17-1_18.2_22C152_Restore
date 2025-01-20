@interface CKRecordZoneSubscription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKRecordZoneSubscription)initWithCoder:(NSCoder *)aDecoder;
- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID;
- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID subscriptionID:(CKSubscriptionID)subscriptionID;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordType:(CKRecordType)recordType;
@end

@implementation CKRecordZoneSubscription

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID subscriptionID:(CKSubscriptionID)subscriptionID
{
  v5.receiver = self;
  v5.super_class = (Class)CKRecordZoneSubscription;
  return (CKRecordZoneSubscription *)[(CKSubscription *)&v5 _initWithSubscriptionID:subscriptionID subscriptionType:2 recordType:0 zoneID:zoneID];
}

- (CKRecordZoneSubscription)initWithZoneID:(CKRecordZoneID *)zoneID
{
  v4 = zoneID;
  objc_super v5 = CKCreateGUID();
  v7 = (CKRecordZoneSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(self, v6, (uint64_t)v4, (uint64_t)v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKRecordZoneSubscription)initWithCoder:(NSCoder *)aDecoder
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecordZoneSubscription;
  return [(CKSubscription *)&v4 initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x18C12ADA0]();
  v15.receiver = self;
  v15.super_class = (Class)CKRecordZoneSubscription;
  [(CKSubscription *)&v15 encodeWithCoder:v4];
  uint64_t v9 = objc_msgSend_zoneID(self, v6, v7, v8);
  if (!v9)
  {
    v12 = [CKException alloc];
    id v14 = (id)objc_msgSend_initWithName_format_(v12, v13, *MEMORY[0x1E4F1C3C8], @"RecordZone subscriptions must have a valid zoneID");
    objc_exception_throw(v14);
  }
  v11 = (void *)v9;
  objc_msgSend_encodeObject_forKey_(v4, v10, v9, @"ZoneID");
}

- (void)setRecordType:(CKRecordType)recordType
{
  id v4 = recordType;
  uint64_t v8 = v4;
  if (v4 && !objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v9 = [CKException alloc];
    id v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E4F1C3C8], @"Subscriptions must not have a zero-length record type (did you mean to set nil?)");
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKRecordZoneSubscription;
  [(CKSubscription *)&v12 setRecordType:v8];
}

- (id)CKPropertiesDescription
{
  objc_super v5 = NSString;
  uint64_t v6 = objc_msgSend_zoneID(self, a2, v2, v3);
  v10 = objc_msgSend_recordType(self, v7, v8, v9);
  id v14 = objc_msgSend_subscriptionID(self, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v5, v15, @"; RecordZone Subscription: zoneID=%@, recordType=%@, subscriptionID=%@",
    v16,
    v6,
    v10,
  v17 = v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKRecordZoneSubscription *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CKRecordZoneSubscription;
    if ([(CKSubscription *)&v16 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v5 = v4;
      uint64_t v9 = objc_msgSend_zoneID(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_zoneID(v5, v10, v11, v12);

      char v14 = CKObjectsAreBothNilOrEqual(v9, v13);
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKRecordZoneSubscription;
  return [(CKSubscription *)&v4 copyWithZone:a3];
}

@end