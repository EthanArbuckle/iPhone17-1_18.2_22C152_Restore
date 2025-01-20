@interface CKLastSentCapabilitiesAndUsage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKLastSentCapabilitiesAndUsage)initWithCapabilitySet:(id)a3 savedDate:(id)a4 usageSavedDate:(id)a5;
- (CKLastSentCapabilitiesAndUsage)initWithCoder:(id)a3;
- (CKLastSentCapabilitiesAndUsage)initWithLastSentCapabilitiesAndUsageEntry:(id)a3;
- (NSArray)capabilitySet;
- (NSDate)capabilitySetSavedDate;
- (NSDate)usageSavedDate;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUsageSavedDate:(id)a3;
@end

@implementation CKLastSentCapabilitiesAndUsage

- (CKLastSentCapabilitiesAndUsage)initWithLastSentCapabilitiesAndUsageEntry:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F19F58];
  id v5 = a3;
  v8 = objc_msgSend_deviceCapabilityStringSet(v5, v6, v7);
  v10 = objc_msgSend_fromSqliteRepresentations_(v4, v9, (uint64_t)v8);

  v13 = objc_msgSend_capabilitySetSavedDate(v5, v11, v12);
  v16 = objc_msgSend_usageSavedDate(v5, v14, v15);

  v18 = (CKLastSentCapabilitiesAndUsage *)objc_msgSend_initWithCapabilitySet_savedDate_usageSavedDate_(self, v17, (uint64_t)v10, v13, v16);
  return v18;
}

- (CKLastSentCapabilitiesAndUsage)initWithCapabilitySet:(id)a3 savedDate:(id)a4 usageSavedDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CKLastSentCapabilitiesAndUsage;
  v13 = [(CKLastSentCapabilitiesAndUsage *)&v25 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v11, v12);
    capabilitySet = v13->_capabilitySet;
    v13->_capabilitySet = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_copy(v9, v16, v17);
    capabilitySetSavedDate = v13->_capabilitySetSavedDate;
    v13->_capabilitySetSavedDate = (NSDate *)v18;

    uint64_t v22 = objc_msgSend_copy(v10, v20, v21);
    usageSavedDate = v13->_usageSavedDate;
    v13->_usageSavedDate = (NSDate *)v22;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v11 = objc_msgSend_capabilitySet(self, v7, v8);
    if (v11 || (objc_msgSend_capabilitySet(v6, v9, v10), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F19F58];
      v13 = objc_msgSend_capabilitySet(self, v9, v10);
      v16 = objc_msgSend_capabilitySet(v6, v14, v15);
      int isCapabilitySet_equalTo = objc_msgSend_isCapabilitySet_equalTo_(v12, v17, (uint64_t)v13, v16);

      if (v11)
      {

        if (isCapabilitySet_equalTo) {
          goto LABEL_6;
        }
      }
      else
      {

        if (isCapabilitySet_equalTo) {
          goto LABEL_6;
        }
      }
      char v29 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_6:
    v19 = objc_msgSend_capabilitySetSavedDate(self, v9, v10);
    uint64_t v22 = objc_msgSend_capabilitySetSavedDate(v6, v20, v21);
    if (CKObjectsAreBothNilOrEqual())
    {
      objc_super v25 = objc_msgSend_usageSavedDate(self, v23, v24);
      v28 = objc_msgSend_usageSavedDate(v6, v26, v27);
      char v29 = CKObjectsAreBothNilOrEqual();
    }
    else
    {
      char v29 = 0;
    }

    goto LABEL_13;
  }
  char v29 = 0;
LABEL_14:

  return v29;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_capabilitySet(self, v5, v6);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v8, @"capabilitySet", v7, 0);

  v11 = objc_msgSend_capabilitySetSavedDate(self, v9, v10);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v12, @"capabilitySavedDate", v11, 0);

  objc_msgSend_usageSavedDate(self, v13, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v15, @"usageSavedDate", v16, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKLastSentCapabilitiesAndUsage *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKLastSentCapabilitiesAndUsage *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v7 = objc_msgSend_capabilitySet(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)v7, @"CapabilitySet");

  v11 = objc_msgSend_capabilitySetSavedDate(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v17, v12, (uint64_t)v11, @"CapabilitySavedDate");

  uint64_t v15 = objc_msgSend_usageSavedDate(self, v13, v14);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v15, @"UsageSavedDate");
}

- (CKLastSentCapabilitiesAndUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKLastSentCapabilitiesAndUsage;
  id v5 = [(CKLastSentCapabilitiesAndUsage *)&v25 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v11, v8, v9, v10, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"CapabilitySet");
    capabilitySet = v5->_capabilitySet;
    v5->_capabilitySet = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"CapabilitySavedDate");
    capabilitySetSavedDate = v5->_capabilitySetSavedDate;
    v5->_capabilitySetSavedDate = (NSDate *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"UsageSavedDate");
    usageSavedDate = v5->_usageSavedDate;
    v5->_usageSavedDate = (NSDate *)v22;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CKLastSentCapabilitiesAndUsage alloc];
  uint64_t v7 = objc_msgSend_capabilitySet(self, v5, v6);
  uint64_t v10 = objc_msgSend_capabilitySetSavedDate(self, v8, v9);
  v13 = objc_msgSend_usageSavedDate(self, v11, v12);
  uint64_t v15 = objc_msgSend_initWithCapabilitySet_savedDate_usageSavedDate_(v4, v14, (uint64_t)v7, v10, v13);

  return v15;
}

- (NSArray)capabilitySet
{
  return self->_capabilitySet;
}

- (NSDate)capabilitySetSavedDate
{
  return self->_capabilitySetSavedDate;
}

- (NSDate)usageSavedDate
{
  return self->_usageSavedDate;
}

- (void)setUsageSavedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageSavedDate, 0);
  objc_storeStrong((id *)&self->_capabilitySetSavedDate, 0);
  objc_storeStrong((id *)&self->_capabilitySet, 0);
}

@end