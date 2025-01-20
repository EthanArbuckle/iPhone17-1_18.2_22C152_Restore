@interface BDSMutableSecureEngagementData
+ (BOOL)supportsSecureCoding;
- (BDSMutableSecureEngagementData)initWithCloudData:(id)a3;
- (BDSMutableSecureEngagementData)initWithCoder:(id)a3;
- (BDSMutableSecureEngagementData)initWithRecord:(id)a3;
- (BDSMutableSecureEngagementData)initWithStartTimestampString:(id)a3 durationInterval:(double)a4;
- (NSData)value;
- (NSString)description;
- (NSString)startTimestampString;
- (double)durationInterval;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setDurationInterval:(double)a3;
- (void)setStartTimestampString:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BDSMutableSecureEngagementData

- (BDSMutableSecureEngagementData)initWithStartTimestampString:(id)a3 durationInterval:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    v19.receiver = self;
    v19.super_class = (Class)BDSMutableSecureEngagementData;
    v14 = [(BCMutableCloudData *)&v19 init];
    if (v14)
    {
      uint64_t v15 = objc_msgSend_copy(v6, v7, v8, v9, v10, v11, v12, v13);
      startTimestampString = v14->_startTimestampString;
      v14->_startTimestampString = (NSString *)v15;

      v14->_durationInterval = a4;
    }
  }
  else
  {
    v17 = BDSCloudKitLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2361F8A44();
    }

    v14 = 0;
  }

  return v14;
}

- (BDSMutableSecureEngagementData)initWithCloudData:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = [(BCMutableCloudData *)&v51 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v14 = v6;
    if (v6)
    {
      uint64_t v15 = objc_msgSend_startTimestampString(v6, v7, v8, v9, v10, v11, v12, v13);
      uint64_t v23 = objc_msgSend_copy(v15, v16, v17, v18, v19, v20, v21, v22);
      startTimestampString = v5->_startTimestampString;
      v5->_startTimestampString = (NSString *)v23;

      objc_msgSend_durationInterval(v14, v25, v26, v27, v28, v29, v30, v31);
      v5->_durationInterval = v32;
      v40 = objc_msgSend_value(v14, v33, v34, v35, v36, v37, v38, v39);
      uint64_t v48 = objc_msgSend_copy(v40, v41, v42, v43, v44, v45, v46, v47);
      p_super = &v5->_value->super;
      v5->_value = (NSData *)v48;
    }
    else
    {
      p_super = BDSCloudKitLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_2361F88C8();
      }
      v40 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BDSMutableSecureEngagementData)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    p_super = BDSCloudKitLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_2361F8A78();
    }
    goto LABEL_9;
  }
  v60.receiver = self;
  v60.super_class = (Class)BDSMutableSecureEngagementData;
  uint64_t v11 = [(BCMutableCloudData *)&v60 initWithRecord:v4];
  if (v11)
  {
    objc_msgSend_objectForKey_(v4, v5, @"value", v6, v7, v8, v9, v10);
    self = (BDSMutableSecureEngagementData *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEngagementTimeSliceDataEmpty_(BDSSecureEngagementDataHelper, v12, (uint64_t)self, v13, v14, v15, v16, v17) & 1) == 0)
    {
      p_super = objc_msgSend_localIdentifierFromRecord_(BCCloudData, v18, (uint64_t)v4, v19, v20, v21, v22, v23);
      uint64_t v33 = objc_msgSend_copy(p_super, v26, v27, v28, v29, v30, v31, v32);
      startTimestampString = v11->_startTimestampString;
      v11->_startTimestampString = (NSString *)v33;

      v41 = objc_msgSend_objectForKey_(v4, v35, @"durationInterval", v36, v37, v38, v39, v40);
      objc_msgSend_doubleValue(v41, v42, v43, v44, v45, v46, v47, v48);
      v11->_durationInterval = v49;

      uint64_t v57 = objc_msgSend_copy(self, v50, v51, v52, v53, v54, v55, v56);
      value = v11->_value;
      v11->_value = (NSData *)v57;

      goto LABEL_11;
    }
    v24 = BDSCloudKitLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_2361F8AAC();
    }

    p_super = &v11->super.super;
LABEL_9:
    uint64_t v11 = 0;
LABEL_11:
  }
  return v11;
}

- (NSString)description
{
  uint64_t v9 = NSString;
  uint64_t v10 = objc_msgSend_startTimestampString(self, a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_durationInterval(self, v11, v12, v13, v14, v15, v16, v17);
  v25 = objc_msgSend_stringWithFormat_(v9, v18, @"start timestamp: %@, duration interval: %.1lf", v19, v20, v21, v22, v23, v10, v24);

  return (NSString *)v25;
}

- (id)recordType
{
  return @"SecureEngagement";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (id)configuredRecordFromAttributes
{
  v39.receiver = self;
  v39.super_class = (Class)BDSMutableSecureEngagementData;
  uint64_t v3 = [(BCMutableCloudData *)&v39 configuredRecordFromAttributes];
  uint64_t v4 = NSNumber;
  objc_msgSend_durationInterval(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithDouble_(v4, v12, v13, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKey_(v3, v20, (uint64_t)v19, @"durationInterval", v21, v22, v23, v24);

  uint64_t v32 = objc_msgSend_value(self, v25, v26, v27, v28, v29, v30, v31);
  objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v32, @"value", v34, v35, v36, v37);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)BDSMutableSecureEngagementData;
  id v4 = a3;
  [(BCMutableCloudData *)&v31 encodeWithCoder:v4];
  objc_msgSend_durationInterval(self, v5, v6, v7, v8, v9, v10, v11, v31.receiver, v31.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v12, @"durationInterval", v13, v14, v15, v16, v17);
  v25 = objc_msgSend_value(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"value", v27, v28, v29, v30);
}

- (BDSMutableSecureEngagementData)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BDSMutableSecureEngagementData;
  uint64_t v5 = [(BCMutableCloudData *)&v40 initWithCoder:v4];
  uint64_t v13 = v5;
  if (v5)
  {
    uint64_t v14 = objc_msgSend_localRecordID(v5, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v22 = objc_msgSend_copy(v14, v15, v16, v17, v18, v19, v20, v21);
    startTimestampString = v13->_startTimestampString;
    v13->_startTimestampString = (NSString *)v22;

    objc_msgSend_decodeDoubleForKey_(v4, v24, @"durationInterval", v25, v26, v27, v28, v29);
    v13->_durationInterval = v30;
    uint64_t v31 = objc_opt_class();
    uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"value", v33, v34, v35, v36);
    value = v13->_value;
    v13->_value = (NSData *)v37;
  }
  return v13;
}

- (NSString)startTimestampString
{
  return self->_startTimestampString;
}

- (void)setStartTimestampString:(id)a3
{
}

- (double)durationInterval
{
  return self->_durationInterval;
}

- (void)setDurationInterval:(double)a3
{
  self->_durationInterval = a3;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_startTimestampString, 0);
}

@end