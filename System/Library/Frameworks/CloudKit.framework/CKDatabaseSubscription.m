@interface CKDatabaseSubscription
+ (BOOL)supportsSecureCoding;
+ (CKDatabaseSubscription)new;
+ (void)initialize;
- (CKDatabaseSubscription)init;
- (CKDatabaseSubscription)initWithCoder:(NSCoder *)aDecoder;
- (CKDatabaseSubscription)initWithSubscriptionID:(CKSubscriptionID)subscriptionID;
- (id)CKPropertiesDescription;
- (void)setRecordType:(CKRecordType)recordType;
@end

@implementation CKDatabaseSubscription

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKDatabaseSubscription)init
{
  uint64_t v3 = CKCreateGUID();
  v6 = (CKDatabaseSubscription *)objc_msgSend_initWithSubscriptionID_(self, v4, (uint64_t)v3, v5);

  return v6;
}

+ (CKDatabaseSubscription)new
{
  id v2 = objc_alloc((Class)a1);
  uint64_t v3 = CKCreateGUID();
  v6 = (CKDatabaseSubscription *)objc_msgSend_initWithSubscriptionID_(v2, v4, (uint64_t)v3, v5);

  return v6;
}

- (CKDatabaseSubscription)initWithSubscriptionID:(CKSubscriptionID)subscriptionID
{
  v4.receiver = self;
  v4.super_class = (Class)CKDatabaseSubscription;
  return (CKDatabaseSubscription *)[(CKSubscription *)&v4 _initWithSubscriptionID:subscriptionID subscriptionType:3 recordType:0 zoneID:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDatabaseSubscription)initWithCoder:(NSCoder *)aDecoder
{
  v4.receiver = self;
  v4.super_class = (Class)CKDatabaseSubscription;
  return [(CKSubscription *)&v4 initWithCoder:aDecoder];
}

- (void)setRecordType:(CKRecordType)recordType
{
  objc_super v4 = recordType;
  v8 = v4;
  if (v4 && !objc_msgSend_length(v4, v5, v6, v7))
  {
    v9 = [CKException alloc];
    id v11 = (id)objc_msgSend_initWithName_format_(v9, v10, *MEMORY[0x1E4F1C3C8], @"Subscriptions must not have a nil or valid record type");
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CKDatabaseSubscription;
  [(CKSubscription *)&v12 setRecordType:v8];
}

- (id)CKPropertiesDescription
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_recordType(self, a2, v2, v3);
  v10 = objc_msgSend_subscriptionID(self, v7, v8, v9);
  objc_msgSend_stringWithFormat_(v5, v11, @"; Database Subscription: recordType=%@, subscriptionID=%@",
    v12,
    v6,
  v13 = v10);

  return v13;
}

@end