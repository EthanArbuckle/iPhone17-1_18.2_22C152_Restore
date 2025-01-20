@interface CKSubscription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKNotificationInfo)notificationInfo;
- (CKRecordZoneID)zoneID;
- (CKSubscription)init;
- (CKSubscription)initWithCoder:(id)a3;
- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 options:(unint64_t)a5;
- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 subscriptionID:(id)a5 options:(unint64_t)a6;
- (CKSubscription)initWithZoneID:(id)a3 options:(unint64_t)a4;
- (CKSubscription)initWithZoneID:(id)a3 subscriptionID:(id)a4 options:(unint64_t)a5;
- (CKSubscriptionID)subscriptionID;
- (CKSubscriptionType)subscriptionType;
- (NSString)recordType;
- (id)_initWithSubscriptionID:(id)a3 subscriptionType:(int64_t)a4 recordType:(id)a5 zoneID:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)predicate;
- (unint64_t)hash;
- (unint64_t)subscriptionOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setNotificationInfo:(CKNotificationInfo *)notificationInfo;
- (void)setRecordType:(id)a3;
- (void)setSubscriptionID_modelMutation:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKSubscription

+ (void)initialize
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 3);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 0);
}

- (id)_initWithSubscriptionID:(id)a3 subscriptionType:(int64_t)a4 recordType:(id)a5 zoneID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v45 = 0;
  char v13 = _CKCheckArgument((uint64_t)"subscriptionID", v10, 0, 1, 0, &v45);
  id v14 = v45;
  if ((v13 & 1) == 0)
  {
    v32 = v14;
    v33 = [CKException alloc];
    uint64_t v37 = objc_msgSend_code(v32, v34, v35, v36);
    v41 = objc_msgSend_localizedDescription(v32, v38, v39, v40);
    id v43 = (id)objc_msgSend_initWithCode_format_(v33, v42, v37, @"%@", v41);

    objc_exception_throw(v43);
  }

  v44.receiver = self;
  v44.super_class = (Class)CKSubscription;
  v18 = [(CKSubscription *)&v44 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v10, v15, v16, v17);
    subscriptionID = v18->_subscriptionID;
    v18->_subscriptionID = (NSString *)v19;

    v18->_subscriptionType = a4;
    uint64_t v24 = objc_msgSend_copy(v11, v21, v22, v23);
    recordType = v18->_recordType;
    v18->_recordType = (NSString *)v24;

    uint64_t v29 = objc_msgSend_copy(v12, v26, v27, v28);
    zoneID = v18->_zoneID;
    v18->_zoneID = (CKRecordZoneID *)v29;
  }
  return v18;
}

- (id)debugDescription
{
  v5 = (void *)MEMORY[0x1E4F28E78];
  v6 = objc_msgSend_description(self, a2, v2, v3);
  v9 = objc_msgSend_stringWithString_(v5, v7, (uint64_t)v6, v8);

  v15 = objc_msgSend_notificationInfo(self, v10, v11, v12);
  if (v15)
  {
    objc_msgSend_appendString_(v9, v13, @"\n{\n", v14);
    uint64_t v19 = objc_msgSend_debugDescription(v15, v16, v17, v18);
    objc_msgSend_appendString_(v9, v20, (uint64_t)v19, v21);

    objc_msgSend_appendString_(v9, v22, @"\n}", v23);
  }

  return v9;
}

- (id)description
{
  return (id)((uint64_t (*)(CKSubscription *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKSubscription)init
{
  uint64_t v2 = [CKException alloc];
  id v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E4F1C3C8], @"You must instantiate one of the CKSubscription subclasses");
  objc_exception_throw(v4);
}

- (CKRecordZoneID)zoneID
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v6 = [CKException alloc];
    id v8 = (id)objc_msgSend_initWithName_format_(v6, v7, *MEMORY[0x1E4F1C3C8], @"You may not call -zoneID on a CKSubscription");
    objc_exception_throw(v8);
  }
  zoneID = self->_zoneID;

  return zoneID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKSubscription *)a3;
  if (self == v4)
  {
    char v32 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v9 = objc_msgSend_recordType(self, v6, v7, v8);
      char v13 = objc_msgSend_recordType(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_subscriptionID(self, v15, v16, v17),
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_subscriptionID(v5, v19, v20, v21),
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        uint64_t v27 = objc_msgSend_notificationInfo(self, v24, v25, v26);
        v31 = objc_msgSend_notificationInfo(v5, v28, v29, v30);
        char v32 = CKObjectsAreBothNilOrEqual(v27, v31);
      }
      else
      {
        char v32 = 0;
      }
    }
    else
    {
      char v32 = 0;
    }
  }

  return v32;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_subscriptionID(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v8 = objc_msgSend_subscriptionID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_subscriptionType(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_recordType(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_zoneID(self, v17, v18, v19);
  uint64_t v22 = objc_msgSend__initWithSubscriptionID_subscriptionType_recordType_zoneID_(v4, v21, (uint64_t)v8, v12, v16, v20);

  uint64_t v26 = objc_msgSend_notificationInfo(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);
  v31 = (void *)v22[3];
  v22[3] = v30;

  uint64_t v35 = objc_msgSend_zoneID(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_copy(v35, v36, v37, v38);
  uint64_t v40 = (void *)v22[5];
  v22[5] = v39;

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKSubscription;
  v5 = [(CKSubscription *)&v26 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"serverID");
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v9;

    v5->_subscriptionType = objc_msgSend_decodeInt64ForKey_(v4, v11, @"subscriptionType", v12);
    uint64_t v13 = objc_opt_class();
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"recordType");
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"notificationInfo");
    notificationInfo = v5->_notificationInfo;
    v5->_notificationInfo = (CKNotificationInfo *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"ZoneID");
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v23;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  unint64_t v8 = objc_msgSend_subscriptionID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)v8, @"serverID");

  uint64_t v13 = objc_msgSend_subscriptionType(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v25, v14, v13, @"subscriptionType");
  uint64_t v18 = objc_msgSend_recordType(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v25, v19, (uint64_t)v18, @"recordType");

  uint64_t v23 = objc_msgSend_notificationInfo(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v25, v24, (uint64_t)v23, @"notificationInfo");
}

- (void)setSubscriptionID_modelMutation:(id)a3
{
  v5 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  subscriptionID = self->_subscriptionID;
  self->_subscriptionID = v5;

  MEMORY[0x1F41817F8](v5, subscriptionID);
}

- (CKSubscriptionID)subscriptionID
{
  return (CKSubscriptionID)objc_getProperty(self, a2, 8, 1);
}

- (CKSubscriptionType)subscriptionType
{
  return self->_subscriptionType;
}

- (CKNotificationInfo)notificationInfo
{
  return (CKNotificationInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationInfo:(CKNotificationInfo *)notificationInfo
{
}

- (NSString)recordType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecordType:(id)a3
{
}

- (void)setZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_notificationInfo, 0);

  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

- (CKSubscription)initWithZoneID:(id)a3 options:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    uint64_t v13 = v7;
    uint64_t v14 = NSStringFromSelector(a2);
    int v15 = 138543362;
    uint64_t v16 = v14;
    _os_log_fault_impl(&dword_18AF10000, v13, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKRecordZoneSubscription", (uint8_t *)&v15, 0xCu);
  }
  unint64_t v8 = [CKRecordZoneSubscription alloc];
  uint64_t v9 = CKCreateGUID();
  uint64_t v11 = (CKSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(v8, v10, (uint64_t)v6, (uint64_t)v9);

  return v11;
}

- (CKSubscription)initWithZoneID:(id)a3 subscriptionID:(id)a4 options:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    int v15 = v10;
    uint64_t v16 = NSStringFromSelector(a2);
    int v17 = 138543362;
    uint64_t v18 = v16;
    _os_log_fault_impl(&dword_18AF10000, v15, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKRecordZoneSubscription", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v11 = [CKRecordZoneSubscription alloc];
  uint64_t v13 = (CKSubscription *)objc_msgSend_initWithZoneID_subscriptionID_(v11, v12, (uint64_t)v8, (uint64_t)v9);

  return v13;
}

- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 options:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v11 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    int v17 = v11;
    uint64_t v18 = NSStringFromSelector(a2);
    int v19 = 138543362;
    uint64_t v20 = v18;
    _os_log_fault_impl(&dword_18AF10000, v17, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v12 = [CKQuerySubscription alloc];
  uint64_t v13 = CKCreateGUID();
  int v15 = (CKSubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v12, v14, (uint64_t)v9, (uint64_t)v10, v13, a5);

  return v15;
}

- (CKSubscription)initWithRecordType:(id)a3 predicate:(id)a4 subscriptionID:(id)a5 options:(unint64_t)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    int v19 = v14;
    uint64_t v20 = NSStringFromSelector(a2);
    int v21 = 138543362;
    uint64_t v22 = v20;
    _os_log_fault_impl(&dword_18AF10000, v19, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v21, 0xCu);
  }
  int v15 = [CKQuerySubscription alloc];
  int v17 = (CKSubscription *)objc_msgSend_initWithRecordType_predicate_subscriptionID_options_(v15, v16, (uint64_t)v11, (uint64_t)v12, v13, a6);

  return v17;
}

- (unint64_t)subscriptionOptions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    id v9 = v4;
    id v10 = NSStringFromSelector(a2);
    int v11 = 138543362;
    id v12 = v10;
    _os_log_fault_impl(&dword_18AF10000, v9, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to querySubscriptionOptions", (uint8_t *)&v11, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return objc_msgSend_querySubscriptionOptions(self, v5, v6, v7);
  }
  else {
    return 0;
  }
}

- (id)predicate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    id v10 = v4;
    int v11 = NSStringFromSelector(a2);
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_fault_impl(&dword_18AF10000, v10, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.  Please move to CKQuerySubscription", (uint8_t *)&v12, 0xCu);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_msgSend_predicate(self, v5, v6, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end