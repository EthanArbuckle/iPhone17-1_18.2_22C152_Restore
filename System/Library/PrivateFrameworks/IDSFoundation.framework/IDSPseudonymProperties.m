@interface IDSPseudonymProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenExpiredForAtLeast:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudonymProperties:(id)a3;
- (BOOL)willBeExpiredIn:(double)a3;
- (IDSPseudonymProperties)initWithCoder:(id)a3;
- (IDSPseudonymProperties)initWithDictionaryRepresentation:(id)a3;
- (IDSPseudonymProperties)initWithFeatureID:(id)a3 scopeID:(id)a4 expiryEpoch:(double)a5 allowedServices:(id)a6;
- (NSArray)allowedServices;
- (NSDate)expirationDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)featureID;
- (NSString)scopeID;
- (double)expiryEpoch;
- (id)description;
- (id)withUpdatedAllowedServices:(id)a3;
- (id)withUpdatedExpiryEpoch:(double)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPseudonymProperties

- (IDSPseudonymProperties)initWithFeatureID:(id)a3 scopeID:(id)a4 expiryEpoch:(double)a5 allowedServices:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a6;
  if (!v11)
  {
    v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, v39, self, @"IDSPseudonym.m", 19, @"Invalid parameter not satisfying: %@", @"featureID");
  }
  if (!objc_msgSend_count(v15, v13, v14, v16))
  {
    v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, v42, self, @"IDSPseudonym.m", 20, @"Invalid parameter not satisfying: %@", @"[allowedServices count]");
  }
  v43.receiver = self;
  v43.super_class = (Class)IDSPseudonymProperties;
  v22 = [(IDSPseudonymProperties *)&v43 init];
  if (v22)
  {
    uint64_t v24 = objc_msgSend_copy(v11, v20, v21, v23);
    featureID = v22->_featureID;
    v22->_featureID = (NSString *)v24;

    uint64_t v29 = objc_msgSend_copy(v12, v26, v27, v28);
    scopeID = v22->_scopeID;
    v22->_scopeID = (NSString *)v29;

    v22->_expiryEpoch = a5;
    uint64_t v34 = objc_msgSend_copy(v15, v31, v32, v33);
    allowedServices = v22->_allowedServices;
    v22->_allowedServices = (NSArray *)v34;
  }
  return v22;
}

- (id)withUpdatedExpiryEpoch:(double)a3
{
  v5 = [IDSPseudonymProperties alloc];
  v7 = objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(v5, v6, (uint64_t)self->_featureID, a3, self->_scopeID, self->_allowedServices);
  return v7;
}

- (id)withUpdatedAllowedServices:(id)a3
{
  id v4 = a3;
  v5 = [IDSPseudonymProperties alloc];
  v7 = objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(v5, v6, (uint64_t)self->_featureID, self->_expiryEpoch, self->_scopeID, v4);

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v21 = *(_OWORD *)&self->_featureID;
  allowedServices = self->_allowedServices;
  double expiryEpoch = self->_expiryEpoch;
  v10 = objc_msgSend_expirationDate(self, v8, v9, *(double *)&self->_featureID);
  uint64_t v14 = objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], v11, v12, v13);
  v17 = objc_msgSend_descriptionWithLocale_(v10, v15, (uint64_t)v14, v16);
  double v19 = objc_msgSend_stringWithFormat_(v3, v18, @"<%@: %p featureID: %@, scopeID: %@, allowedServices: %@, expiryEpoch: %fll, expirationDate: %@>", *(double *)&v21, v5, self, v21, allowedServices, *(void *)&expiryEpoch, v17);

  return v19;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], a2, v2, self->_expiryEpoch);
}

- (BOOL)hasBeenExpiredForAtLeast:(double)a3
{
  v5 = objc_msgSend_expirationDate(self, a2, v3, a3);
  objc_msgSend_timeIntervalSinceNow(v5, v6, v7, v8);
  BOOL v10 = v9 < -a3;

  return v10;
}

- (BOOL)willBeExpiredIn:(double)a3
{
  v5 = objc_msgSend_expirationDate(self, a2, v3, a3);
  objc_msgSend_timeIntervalSinceNow(v5, v6, v7, v8);
  BOOL v10 = v9 < a3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToPseudonymProperties = objc_msgSend_isEqualToPseudonymProperties_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToPseudonymProperties = 0;
  }

  return isEqualToPseudonymProperties;
}

- (BOOL)isEqualToPseudonymProperties:(id)a3
{
  double v6 = (IDSPseudonymProperties *)a3;
  if (self != v6)
  {
    double v8 = objc_msgSend_featureID(self, v4, v5, v7);
    uint64_t v12 = objc_msgSend_featureID(v6, v9, v10, v11);
    if (!objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14)) {
      goto LABEL_6;
    }
    objc_msgSend_expiryEpoch(self, v15, v16, v17);
    double v19 = v18;
    objc_msgSend_expiryEpoch(v6, v20, v21, v18);
    double v25 = v19 - v24;
    if (v25 < 0.0) {
      double v25 = -v25;
    }
    if (v25 > 0.5)
    {
LABEL_6:
      char isEqualToString = 0;
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v27 = objc_msgSend_allowedServices(self, v22, v23, v25);
    v31 = objc_msgSend___imSetFromArray(v27, v28, v29, v30);
    v35 = objc_msgSend_allowedServices(v6, v32, v33, v34);
    double v39 = objc_msgSend___imSetFromArray(v35, v36, v37, v38);
    if (!objc_msgSend_isEqualToSet_(v31, v40, (uint64_t)v39, v41))
    {
      char isEqualToString = 0;
LABEL_22:

      goto LABEL_23;
    }
    v47 = objc_msgSend_scopeID(self, v42, v43, v44);
    if (!v47)
    {
      v68 = objc_msgSend_scopeID(v6, v45, v46, v48);
      if (!v68)
      {
        v68 = 0;
        char isEqualToString = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    uint64_t v49 = objc_msgSend_scopeID(self, v45, v46, v48);
    if (v49)
    {
      v53 = (void *)v49;
      uint64_t v54 = objc_msgSend_scopeID(v6, v50, v51, v52);
      if (v54)
      {
        v66 = (void *)v54;
        v65 = objc_msgSend_scopeID(self, v55, v56, v57);
        objc_msgSend_scopeID(v6, v58, v59, v60);
        v61 = v67 = v47;
        char isEqualToString = objc_msgSend_isEqualToString_(v65, v62, (uint64_t)v61, v63);

        v47 = v67;
        if (!v67) {
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    char isEqualToString = 0;
    if (!v47) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  char isEqualToString = 1;
LABEL_24:

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_featureID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8) + 31;

  double v13 = objc_msgSend_scopeID(self, v10, v11, v12);

  if (v13)
  {
    double v17 = objc_msgSend_scopeID(self, v14, v15, v16);
    uint64_t v9 = objc_msgSend_hash(v17, v18, v19, v20) - v9 + 32 * v9;
  }
  uint64_t v21 = objc_msgSend_allowedServices(self, v14, v15, v16);
  double v25 = objc_msgSend___imSetFromArray(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_hash(v25, v26, v27, v28) - v9 + 32 * v9;

  objc_msgSend_expiryEpoch(self, v30, v31, v32);
  return (unint64_t)(v33 + (double)(unint64_t)(31 * v29));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonymProperties)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend__stringForKey_(v4, v5, @"f", v6);
  uint64_t v10 = objc_msgSend__stringForKey_(v4, v8, @"s", v9);
  double v13 = objc_msgSend__numberForKey_(v4, v11, @"p", v12);
  objc_msgSend_doubleValue(v13, v14, v15, v16);
  double v18 = v17;

  uint64_t v21 = objc_msgSend__arrayForKey_(v4, v19, @"a", v20);

  if (v7 && objc_msgSend_count(v21, v22, v23, v24))
  {
    self = (IDSPseudonymProperties *)(id)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(self, v25, (uint64_t)v7, v18, v10, v21);
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (IDSPseudonymProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"f");
  uint64_t v9 = objc_opt_class();
  double v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"s");
  objc_msgSend_decodeDoubleForKey_(v4, v13, @"p", v14);
  double v16 = v15;
  double v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v22 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
  double v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, v24, @"a");

  if (v8 && objc_msgSend_count(v25, v26, v27, v28))
  {
    self = (IDSPseudonymProperties *)(id)objc_msgSend_initWithFeatureID_scopeID_expiryEpoch_allowedServices_(self, v29, (uint64_t)v8, v16, v12, v25);
    double v30 = self;
  }
  else
  {
    double v30 = 0;
  }

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  featureID = self->_featureID;
  id v12 = a3;
  objc_msgSend_encodeObject_forKey_(v12, v5, (uint64_t)featureID, v6, @"f");
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)self->_scopeID, v8, @"s");
  objc_msgSend_encodeDouble_forKey_(v12, v9, @"p", self->_expiryEpoch);
  objc_msgSend_encodeObject_forKey_(v12, v10, (uint64_t)self->_allowedServices, v11, @"a");
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = self->_featureID;
  if (v4)
  {
    CFDictionarySetValue(v3, @"f", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB828B4();
  }

  scopeID = self->_scopeID;
  if (scopeID) {
    CFDictionarySetValue(v3, @"s", scopeID);
  }
  double v7 = objc_msgSend_numberWithDouble_(NSNumber, v5, (uint64_t)scopeID, self->_expiryEpoch);
  if (v7)
  {
    CFDictionarySetValue(v3, @"p", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB8282C();
  }

  double v8 = self->_allowedServices;
  if (v8)
  {
    CFDictionarySetValue(v3, @"a", v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_19DB827A4();
  }

  id v12 = objc_msgSend_copy(v3, v9, v10, v11);
  return (NSDictionary *)v12;
}

- (NSString)featureID
{
  return self->_featureID;
}

- (NSString)scopeID
{
  return self->_scopeID;
}

- (NSArray)allowedServices
{
  return self->_allowedServices;
}

- (double)expiryEpoch
{
  return self->_expiryEpoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedServices, 0);
  objc_storeStrong((id *)&self->_scopeID, 0);
  objc_storeStrong((id *)&self->_featureID, 0);
}

@end