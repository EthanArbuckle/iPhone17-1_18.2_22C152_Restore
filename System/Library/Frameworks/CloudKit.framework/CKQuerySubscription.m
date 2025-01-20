@interface CKQuerySubscription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKQuerySubscription)initWithCoder:(NSCoder *)aDecoder;
- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate options:(CKQuerySubscriptionOptions)querySubscriptionOptions;
- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate subscriptionID:(CKSubscriptionID)subscriptionID options:(CKQuerySubscriptionOptions)querySubscriptionOptions;
- (CKQuerySubscriptionOptions)querySubscriptionOptions;
- (NSPredicate)predicate;
- (id)CKPropertiesDescription;
- (id)_predicateWithoutCopy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_validateQuerySubscriptionOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicate_modelMutation:(id)a3;
- (void)setQuerySubscriptionOptions_modelMutation:(unint64_t)a3;
- (void)setRecordType:(id)a3;
- (void)setRecordType_modelMutation:(id)a3;
@end

@implementation CKQuerySubscription

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate subscriptionID:(CKSubscriptionID)subscriptionID options:(CKQuerySubscriptionOptions)querySubscriptionOptions
{
  v10 = recordType;
  v11 = predicate;
  v12 = subscriptionID;
  id v40 = 0;
  char v13 = _CKCheckArgument((uint64_t)"recordType", v10, 1, 1, 0, &v40);
  id v14 = v40;
  if ((v13 & 1) == 0)
  {
    v24 = v14;
    v25 = [CKException alloc];
    uint64_t v29 = objc_msgSend_code(v24, v26, v27, v28);
    v33 = objc_msgSend_localizedDescription(v24, v30, v31, v32);
    id v35 = (id)objc_msgSend_initWithCode_format_(v25, v34, v29, @"%@", v33);

    objc_exception_throw(v35);
  }

  if (!v11)
  {
    v36 = [CKException alloc];
    id v38 = (id)objc_msgSend_initWithName_format_(v36, v37, *MEMORY[0x1E4F1C3C8], @"Predicate can not be nil. Use [NSPredicate predicateWithValue:YES] / NSPredicate(value: true) to query all records");
    objc_exception_throw(v38);
  }
  v39.receiver = self;
  v39.super_class = (Class)CKQuerySubscription;
  v18 = [(CKSubscription *)&v39 _initWithSubscriptionID:v12 subscriptionType:1 recordType:v10 zoneID:0];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_CKDeepCopy(v11, v15, v16, v17);
    v20 = v18->_predicate;
    v18->_predicate = (NSPredicate *)v19;

    objc_msgSend__validateQuerySubscriptionOptions_(v18, v21, querySubscriptionOptions, v22);
    v18->_querySubscriptionOptions = querySubscriptionOptions;
  }

  return v18;
}

- (CKQuerySubscription)initWithRecordType:(CKRecordType)recordType predicate:(NSPredicate *)predicate options:(CKQuerySubscriptionOptions)querySubscriptionOptions
{
  v8 = predicate;
  v9 = recordType;
  v10 = CKCreateGUID();
  v12 = (CKQuerySubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(self, v11, (uint64_t)v9, (uint64_t)v8, v10, querySubscriptionOptions);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKQuerySubscription)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v14.receiver = self;
  v14.super_class = (Class)CKQuerySubscription;
  v5 = [(CKSubscription *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = CKAcceptablePredicateValueClasses();
    uint64_t v9 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v8, (uint64_t)v7, @"predicate");
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v9;

    v5->_querySubscriptionOptions = objc_msgSend_decodeInt64ForKey_(v4, v11, @"options", v12);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v9 = objc_msgSend_recordType(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);

  if (!v13)
  {
    uint64_t v29 = [CKException alloc];
    id v31 = (id)objc_msgSend_initWithName_format_(v29, v30, *MEMORY[0x1E4F1C3C8], @"Query subscriptions must have a valid record type");
    objc_exception_throw(v31);
  }
  v32.receiver = self;
  v32.super_class = (Class)CKQuerySubscription;
  [(CKSubscription *)&v32 encodeWithCoder:v4];
  uint64_t v17 = objc_msgSend__predicateWithoutCopy(self, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v17, @"predicate");

  uint64_t SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v19, v20, v21);
  objc_msgSend_encodeInt64_forKey_(v4, v23, SubscriptionOptions, @"options");
  uint64_t v27 = objc_msgSend_zoneID(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v27, @"ZoneID");
}

- (void)_validateQuerySubscriptionOptions:(unint64_t)a3
{
  if ((a3 & 7) == 0)
  {
    uint64_t v3 = [CKException alloc];
    id v5 = (id)objc_msgSend_initWithName_format_(v3, v4, *MEMORY[0x1E4F1C3C8], @"Query subscriptions options must include at least one firing behavior");
    objc_exception_throw(v5);
  }
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_msgSend_CKDeepCopy(self->_predicate, a2, v2, v3);
}

- (id)_predicateWithoutCopy
{
  return self->_predicate;
}

- (void)setRecordType:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v8 = [CKException alloc];
    id v10 = (id)objc_msgSend_initWithName_format_(v8, v9, *MEMORY[0x1E4F1C3C8], @"Query subscriptions must have a valid record type");
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)CKQuerySubscription;
  [(CKSubscription *)&v11 setRecordType:v4];
}

- (id)CKPropertiesDescription
{
  id v5 = NSString;
  uint64_t v6 = objc_msgSend_recordType(self, a2, v2, v3);
  id v10 = objc_msgSend__predicateWithoutCopy(self, v7, v8, v9);
  uint64_t SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v11, v12, v13);
  v18 = objc_msgSend_subscriptionID(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_zoneID(self, v19, v20, v21);
  objc_msgSend_stringWithFormat_(v5, v23, @"; Query Subscription: recordType=%@, predicate=%@, subscriptionOptions=%x, subscriptionID=%@, zoneID=%@",
    v24,
    v6,
    v10,
    SubscriptionOptions,
    v18,
  uint64_t v25 = v22);

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKQuerySubscription;
  id v4 = [(CKSubscription *)&v14 copyWithZone:a3];
  uint64_t v8 = objc_msgSend__predicateWithoutCopy(self, v5, v6, v7);
  uint64_t v9 = (void *)v4[6];
  v4[6] = v8;

  v4[7] = objc_msgSend_querySubscriptionOptions(self, v10, v11, v12);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKQuerySubscription *)a3;
  if (self == v4)
  {
    char v30 = 1;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)CKQuerySubscription;
    if ([(CKSubscription *)&v32 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = v4;
      uint64_t v9 = objc_msgSend__predicateWithoutCopy(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend__predicateWithoutCopy(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (uint64_t SubscriptionOptions = objc_msgSend_querySubscriptionOptions(self, v15, v16, v17),
            SubscriptionOptions == objc_msgSend_querySubscriptionOptions(v5, v19, v20, v21)))
      {
        uint64_t v25 = objc_msgSend_zoneID(self, v22, v23, v24);
        uint64_t v29 = objc_msgSend_zoneID(v5, v26, v27, v28);
        char v30 = CKObjectsAreBothNilOrEqual(v25, v29);
      }
      else
      {
        char v30 = 0;
      }
    }
    else
    {
      char v30 = 0;
    }
  }

  return v30;
}

- (void)setRecordType_modelMutation:(id)a3
{
}

- (void)setPredicate_modelMutation:(id)a3
{
  objc_msgSend_CKDeepCopy(a3, a2, (uint64_t)a3, v3);
  id v5 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v5;

  MEMORY[0x1F41817F8](v5, predicate);
}

- (void)setQuerySubscriptionOptions_modelMutation:(unint64_t)a3
{
  self->_queryuint64_t SubscriptionOptions = a3;
}

- (CKQuerySubscriptionOptions)querySubscriptionOptions
{
  return self->_querySubscriptionOptions;
}

- (void).cxx_destruct
{
}

@end