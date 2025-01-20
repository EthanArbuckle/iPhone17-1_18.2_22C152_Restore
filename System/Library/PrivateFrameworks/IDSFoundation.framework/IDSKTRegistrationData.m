@interface IDSKTRegistrationData
+ (BOOL)supportsSecureCoding;
- (BOOL)needsKVSUpload;
- (BOOL)uploadedToKVS;
- (IDSKTRegistrationData)init;
- (IDSKTRegistrationData)initWithCoder:(id)a3;
- (IDSKTRegistrationData)initWithDataRepresentation:(id)a3 error:(id *)a4;
- (NSData)ktDataForRegistration;
- (NSData)ktDataSignature;
- (NSData)ktPublicAccountKey;
- (NSDate)ktAccountKeyTimestamp;
- (NSDate)ktOptInTimestamp;
- (NSDate)registeredTime;
- (NSNumber)ktAccountKeyErrorCode;
- (NSNumber)ktOptInErrorCode;
- (NSString)dsid;
- (id)dataRepresentationWithError:(id *)a3;
- (id)description;
- (unint64_t)ktOptInStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setDsid:(id)a3;
- (void)setKtAccountKeyErrorCode:(id)a3;
- (void)setKtAccountKeyTimestamp:(id)a3;
- (void)setKtDataForRegistration:(id)a3;
- (void)setKtDataSignature:(id)a3;
- (void)setKtOptInErrorCode:(id)a3;
- (void)setKtOptInStatus:(unint64_t)a3;
- (void)setKtOptInTimestamp:(id)a3;
- (void)setKtPublicAccountKey:(id)a3;
- (void)setRegisteredTime:(id)a3;
- (void)setUploadedToKVS:(BOOL)a3;
@end

@implementation IDSKTRegistrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTRegistrationData)init
{
  v13.receiver = self;
  v13.super_class = (Class)IDSKTRegistrationData;
  v2 = [(IDSKTRegistrationData *)&v13 init];
  v3 = v2;
  if (v2)
  {
    ktDataForRegistration = v2->_ktDataForRegistration;
    v2->_ktDataForRegistration = 0;

    ktPublicAccountKey = v3->_ktPublicAccountKey;
    v3->_ktPublicAccountKey = 0;

    ktDataSignature = v3->_ktDataSignature;
    v3->_ktDataSignature = 0;

    v3->_uploadedToKVS = 0;
    registeredTime = v3->_registeredTime;
    v3->_registeredTime = 0;

    ktAccountKeyTimestamp = v3->_ktAccountKeyTimestamp;
    v3->_ktAccountKeyTimestamp = 0;

    ktOptInTimestamp = v3->_ktOptInTimestamp;
    v3->_ktOptInTimestamp = 0;

    v3->_ktOptInStatus = 0;
    ktOptInErrorCode = v3->_ktOptInErrorCode;
    v3->_ktOptInErrorCode = 0;

    ktAccountKeyErrorCode = v3->_ktAccountKeyErrorCode;
    v3->_ktAccountKeyErrorCode = 0;
  }
  return v3;
}

- (IDSKTRegistrationData)initWithDataRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v59 = 0;
  v9 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v7, (uint64_t)v6, v8, 0, 0, &v59);
  id v12 = v59;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = objc_msgSend__dataForKey_(v9, v10, @"kKTDataForReg", v13);
    uint64_t v17 = objc_msgSend__dataForKey_(v9, v15, @"kKTDataPubKeyForReg", v16);
    v20 = objc_msgSend__dataForKey_(v9, v18, @"kKTDataSigForReg", v19);
    v23 = objc_msgSend__numberForKey_(v9, v21, @"kKTDataKVSUploaded", v22);
    v55 = v23;
    if (v23) {
      char v54 = objc_msgSend_BOOLValue(v23, v24, v25, v26);
    }
    else {
      char v54 = 0;
    }
    v56 = (void *)v17;
    v29 = objc_msgSend__numberForKey_(v9, v24, @"kKTDataRegTime", v26);
    v33 = v29;
    if (v29)
    {
      objc_msgSend_doubleValue(v29, v30, v31, v32);
      if (v32 > 0.0)
      {
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v30, v34, v32);
      }
    }
    objc_msgSend_objectForKey_(v9, v30, @"kKTDataAccountKeyTimestamp", v32);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_objectForKey_(v9, v35, @"kKTDataOptInTimestamp", v36);
    v40 = objc_msgSend__numberForKey_(v9, v38, @"kKTDataOptInStatus", v39);
    uint64_t v53 = objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43);

    v46 = objc_msgSend__numberForKey_(v9, v44, @"kKTDataOptInErrorCode", v45);
    v49 = objc_msgSend__numberForKey_(v9, v47, @"kKTDataAccountKeyErrorCode", v48);
    v58.receiver = self;
    v58.super_class = (Class)IDSKTRegistrationData;
    v50 = [(IDSKTRegistrationData *)&v58 init];
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_ktDataForRegistration, v14);
      objc_storeStrong((id *)&v51->_ktPublicAccountKey, v56);
      objc_storeStrong((id *)&v51->_ktDataSignature, v20);
      v51->_uploadedToKVS = v54;
      objc_storeStrong((id *)&v51->_ktAccountKeyTimestamp, obj);
      objc_storeStrong((id *)&v51->_ktOptInTimestamp, v37);
      v51->_ktOptInStatus = v53;
      objc_storeStrong((id *)&v51->_ktOptInErrorCode, v46);
      objc_storeStrong((id *)&v51->_ktAccountKeyErrorCode, v49);
    }
    self = v51;

    v28 = self;
  }
  else
  {
    v27 = objc_msgSend_KeyTransparency(IDSFoundationLog, v10, v11, v13);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v61 = v12;
      __int16 v62 = 2112;
      id v63 = v6;
      __int16 v64 = 2112;
      v65 = v9;
      _os_log_error_impl(&dword_19D9BE000, v27, OS_LOG_TYPE_ERROR, "Failed to deserialize plist - failed to create IDSKTRegistrationData from data { error: %@, dataRepresentation: %@, dict: %@ }", buf, 0x20u);
    }

    v28 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v28;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v6 = *(_OWORD *)&self->_ktDataForRegistration;
  ktDataSignature = self->_ktDataSignature;
  if (self->_uploadedToKVS) {
    return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; ktDataForRegistration: %@; ktPublicAccountKey: %@; ktDataSignature: %@; uploadedToKVS: %@; ktAccountKeyTimestamp: %@; ktOptInTimestamp: %@; ktOptInStatus: %lu; ktOptInAbsentReason: %@; ktAccountKeyAbsentReason: %@ >",
  }
                 *(double *)&v6,
                 v4,
                 self,
                 v6,
                 ktDataSignature,
                 @"YES",
                 self->_ktAccountKeyTimestamp,
                 self->_ktOptInTimestamp,
                 self->_ktOptInStatus,
                 self->_ktOptInErrorCode,
                 self->_ktAccountKeyErrorCode);
  else {
    return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; ktDataForRegistration: %@; ktPublicAccountKey: %@; ktDataSignature: %@; uploadedToKVS: %@; ktAccountKeyTimestamp: %@; ktOptInTimestamp: %@; ktOptInStatus: %lu; ktOptInAbsentReason: %@; ktAccountKeyAbsentReason: %@ >",
  }
                 *(double *)&v6,
                 v4,
                 self,
                 v6,
                 ktDataSignature,
                 @"NO",
                 self->_ktAccountKeyTimestamp,
                 self->_ktOptInTimestamp,
                 self->_ktOptInStatus,
                 self->_ktOptInErrorCode,
                 self->_ktAccountKeyErrorCode);
}

- (id)dataRepresentationWithError:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v8 = v5;
  ktDataForRegistration = self->_ktDataForRegistration;
  if (ktDataForRegistration) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)ktDataForRegistration, v7, @"kKTDataForReg");
  }
  ktPublicAccountKey = self->_ktPublicAccountKey;
  if (ktPublicAccountKey) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v6, (uint64_t)ktPublicAccountKey, v7, @"kKTDataPubKeyForReg");
  }
  ktDataSignature = self->_ktDataSignature;
  if (ktDataSignature) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v6, (uint64_t)ktDataSignature, v7, @"kKTDataSigForReg");
  }
  id v12 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_uploadedToKVS, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v8, v13, (uint64_t)v12, v14, @"kKTDataKVSUploaded");

  objc_msgSend_timeIntervalSinceReferenceDate(self->_registeredTime, v15, v16, v17);
  v21 = objc_msgSend_numberWithDouble_(NSNumber, v18, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v8, v22, (uint64_t)v21, v23, @"kKTDataRegTime");

  ktAccountKeyTimestamp = self->_ktAccountKeyTimestamp;
  if (ktAccountKeyTimestamp) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktAccountKeyTimestamp, v25, @"kKTDataAccountKeyTimestamp");
  }
  ktOptInTimestamp = self->_ktOptInTimestamp;
  if (ktOptInTimestamp) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktOptInTimestamp, v25, @"kKTDataOptInTimestamp");
  }
  unint64_t ktOptInStatus = self->_ktOptInStatus;
  if (ktOptInStatus)
  {
    v29 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v24, ktOptInStatus, v25);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v30, (uint64_t)v29, v31, @"kKTDataOptInStatus");
  }
  ktOptInErrorCode = self->_ktOptInErrorCode;
  if (ktOptInErrorCode) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktOptInErrorCode, v25, @"kKTDataOptInErrorCode");
  }
  ktAccountKeyErrorCode = self->_ktAccountKeyErrorCode;
  if (ktAccountKeyErrorCode) {
    objc_msgSend_setObject_forKeyedSubscript_(v8, v24, (uint64_t)ktAccountKeyErrorCode, v25, @"kKTDataAccountKeyErrorCode");
  }
  uint64_t v34 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v24, (uint64_t)v8, v25, 200, 0, a3);
  v38 = v34;
  if (v34)
  {
    id v39 = v34;
  }
  else
  {
    v40 = objc_msgSend_KeyTransparency(IDSFoundationLog, v35, v36, v37);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v42 = *a3;
      }
      else {
        id v42 = 0;
      }
      int v43 = 138412802;
      id v44 = v42;
      __int16 v45 = 2112;
      v46 = v8;
      __int16 v47 = 2112;
      double v48 = self;
      _os_log_error_impl(&dword_19D9BE000, v40, OS_LOG_TYPE_ERROR, "Failed to create plist - failed to serialize IDSKTRegistrationData { error: %@, dict: %@, ktRegistrationData: %@ }", (uint8_t *)&v43, 0x20u);
    }
  }
  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  ktDataForRegistration = self->_ktDataForRegistration;
  id v25 = a3;
  objc_msgSend_encodeObject_forKey_(v25, v5, (uint64_t)ktDataForRegistration, v6, @"kKTDataForReg");
  objc_msgSend_encodeObject_forKey_(v25, v7, (uint64_t)self->_ktPublicAccountKey, v8, @"kKTDataPubKeyForReg");
  objc_msgSend_encodeObject_forKey_(v25, v9, (uint64_t)self->_ktDataSignature, v10, @"kKTDataSigForReg");
  objc_msgSend_encodeBool_forKey_(v25, v11, self->_uploadedToKVS, v12, @"kKTDataKVSUploaded");
  objc_msgSend_encodeObject_forKey_(v25, v13, (uint64_t)self->_registeredTime, v14, @"kKTDataRegTime");
  objc_msgSend_encodeObject_forKey_(v25, v15, (uint64_t)self->_ktAccountKeyTimestamp, v16, @"kKTDataAccountKeyTimestamp");
  objc_msgSend_encodeObject_forKey_(v25, v17, (uint64_t)self->_ktOptInTimestamp, v18, @"kKTDataOptInTimestamp");
  objc_msgSend_encodeInteger_forKey_(v25, v19, self->_ktOptInStatus, v20, @"kKTDataOptInStatus");
  objc_msgSend_encodeObject_forKey_(v25, v21, (uint64_t)self->_ktOptInErrorCode, v22, @"kKTDataOptInErrorCode");
  objc_msgSend_encodeObject_forKey_(v25, v23, (uint64_t)self->_ktAccountKeyErrorCode, v24, @"kKTDataAccountKeyErrorCode");
}

- (IDSKTRegistrationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)IDSKTRegistrationData;
  id v5 = [(IDSKTRegistrationData *)&v51 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"kKTDataForReg");
    ktDataForRegistration = v5->_ktDataForRegistration;
    v5->_ktDataForRegistration = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, @"kKTDataPubKeyForReg");
    ktPublicAccountKey = v5->_ktPublicAccountKey;
    v5->_ktPublicAccountKey = (NSData *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, @"kKTDataSigForReg");
    ktDataSignature = v5->_ktDataSignature;
    v5->_ktDataSignature = (NSData *)v19;

    v5->_uploadedToKVS = objc_msgSend_decodeBoolForKey_(v4, v21, @"kKTDataKVSUploaded", v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, v25, @"kKTDataRegTime");
    registeredTime = v5->_registeredTime;
    v5->_registeredTime = (NSDate *)v26;

    uint64_t v28 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, v30, @"kKTDataAccountKeyTimestamp");
    ktAccountKeyTimestamp = v5->_ktAccountKeyTimestamp;
    v5->_ktAccountKeyTimestamp = (NSDate *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, v35, @"kKTDataOptInTimestamp");
    ktOptInTimestamp = v5->_ktOptInTimestamp;
    v5->_ktOptInTimestamp = (NSDate *)v36;

    v5->_unint64_t ktOptInStatus = objc_msgSend_decodeIntegerForKey_(v4, v38, @"kKTDataOptInStatus", v39);
    uint64_t v40 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, v42, @"kKTDataOptInErrorCode");
    ktOptInErrorCode = v5->_ktOptInErrorCode;
    v5->_ktOptInErrorCode = (NSNumber *)v43;

    uint64_t v45 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, v47, @"kKTDataAccountKeyErrorCode");
    ktAccountKeyErrorCode = v5->_ktAccountKeyErrorCode;
    v5->_ktAccountKeyErrorCode = (NSNumber *)v48;
  }
  return v5;
}

- (BOOL)needsKVSUpload
{
  return !self->_uploadedToKVS && self->_ktDataSignature && self->_ktPublicAccountKey;
}

- (NSData)ktDataForRegistration
{
  return self->_ktDataForRegistration;
}

- (void)setKtDataForRegistration:(id)a3
{
}

- (NSData)ktPublicAccountKey
{
  return self->_ktPublicAccountKey;
}

- (void)setKtPublicAccountKey:(id)a3
{
}

- (NSData)ktDataSignature
{
  return self->_ktDataSignature;
}

- (void)setKtDataSignature:(id)a3
{
}

- (NSDate)registeredTime
{
  return self->_registeredTime;
}

- (void)setRegisteredTime:(id)a3
{
}

- (BOOL)uploadedToKVS
{
  return self->_uploadedToKVS;
}

- (void)setUploadedToKVS:(BOOL)a3
{
  self->_uploadedToKVS = a3;
}

- (NSDate)ktAccountKeyTimestamp
{
  return self->_ktAccountKeyTimestamp;
}

- (void)setKtAccountKeyTimestamp:(id)a3
{
}

- (NSDate)ktOptInTimestamp
{
  return self->_ktOptInTimestamp;
}

- (void)setKtOptInTimestamp:(id)a3
{
}

- (unint64_t)ktOptInStatus
{
  return self->_ktOptInStatus;
}

- (void)setKtOptInStatus:(unint64_t)a3
{
  self->_unint64_t ktOptInStatus = a3;
}

- (NSNumber)ktAccountKeyErrorCode
{
  return self->_ktAccountKeyErrorCode;
}

- (void)setKtAccountKeyErrorCode:(id)a3
{
}

- (NSNumber)ktOptInErrorCode
{
  return self->_ktOptInErrorCode;
}

- (void)setKtOptInErrorCode:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_ktOptInErrorCode, 0);
  objc_storeStrong((id *)&self->_ktAccountKeyErrorCode, 0);
  objc_storeStrong((id *)&self->_ktOptInTimestamp, 0);
  objc_storeStrong((id *)&self->_ktAccountKeyTimestamp, 0);
  objc_storeStrong((id *)&self->_registeredTime, 0);
  objc_storeStrong((id *)&self->_ktDataSignature, 0);
  objc_storeStrong((id *)&self->_ktPublicAccountKey, 0);
  objc_storeStrong((id *)&self->_ktDataForRegistration, 0);
}

@end