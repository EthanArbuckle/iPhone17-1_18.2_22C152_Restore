@interface IDSQualifiedContactsMetric
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetric:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)emergencyHandleMsgCount;
- (NSNumber)emergencyHandlesCount;
- (NSNumber)familyHandlesCount;
- (NSNumber)handlesCount;
- (NSNumber)primaryHandleMsgCount;
- (NSNumber)primaryHandlesCount;
- (NSNumber)qualifiedEmergencyHandles;
- (NSNumber)qualifiedEmergencyHandlesIML;
- (NSNumber)qualifiedHandleMsgCount;
- (NSNumber)qualifiedHandlesCount;
- (NSNumber)qualifiedHandlesIML;
- (NSNumber)qualifiedPrimaryHandles;
- (NSNumber)qualifiedPrimaryHandlesIML;
- (NSString)description;
- (NSString)name;
- (void)setEmergencyHandleMsgCount:(id)a3;
- (void)setEmergencyHandlesCount:(id)a3;
- (void)setFamilyHandlesCount:(id)a3;
- (void)setHandlesCount:(id)a3;
- (void)setPrimaryHandleMsgCount:(id)a3;
- (void)setPrimaryHandlesCount:(id)a3;
- (void)setQualifiedEmergencyHandles:(id)a3;
- (void)setQualifiedEmergencyHandlesIML:(id)a3;
- (void)setQualifiedHandleMsgCount:(id)a3;
- (void)setQualifiedHandlesCount:(id)a3;
- (void)setQualifiedHandlesIML:(id)a3;
- (void)setQualifiedPrimaryHandles:(id)a3;
- (void)setQualifiedPrimaryHandlesIML:(id)a3;
@end

@implementation IDSQualifiedContactsMetric

- (NSString)name
{
  return (NSString *)@"QualifiedContacts";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  qualifiedHandlesCount = self->_qualifiedHandlesCount;
  if (qualifiedHandlesCount) {
    CFDictionarySetValue(v3, @"qualifiedHandlesCount", qualifiedHandlesCount);
  }
  qualifiedHandlesIML = self->_qualifiedHandlesIML;
  if (qualifiedHandlesIML) {
    CFDictionarySetValue(v4, @"qualifiedHandlesIML", qualifiedHandlesIML);
  }
  handlesCount = self->_handlesCount;
  if (handlesCount) {
    CFDictionarySetValue(v4, @"handlesCount", handlesCount);
  }
  qualifiedEmergencyHandles = self->_qualifiedEmergencyHandles;
  if (qualifiedEmergencyHandles) {
    CFDictionarySetValue(v4, @"qualifiedEmergencyHandles", qualifiedEmergencyHandles);
  }
  qualifiedEmergencyHandlesIML = self->_qualifiedEmergencyHandlesIML;
  if (qualifiedEmergencyHandlesIML) {
    CFDictionarySetValue(v4, @"qualifiedEmergencyHandlesIML", qualifiedEmergencyHandlesIML);
  }
  emergencyHandlesCount = self->_emergencyHandlesCount;
  if (emergencyHandlesCount) {
    CFDictionarySetValue(v4, @"emergencyHandlesCount", emergencyHandlesCount);
  }
  qualifiedPrimaryHandles = self->_qualifiedPrimaryHandles;
  if (qualifiedPrimaryHandles) {
    CFDictionarySetValue(v4, @"qualifiedPrimaryHandles", qualifiedPrimaryHandles);
  }
  qualifiedPrimaryHandlesIML = self->_qualifiedPrimaryHandlesIML;
  if (qualifiedPrimaryHandlesIML) {
    CFDictionarySetValue(v4, @"qualifiedPrimaryHandlesIML", qualifiedPrimaryHandlesIML);
  }
  primaryHandlesCount = self->_primaryHandlesCount;
  if (primaryHandlesCount) {
    CFDictionarySetValue(v4, @"primaryHandlesCount", primaryHandlesCount);
  }
  familyHandlesCount = self->_familyHandlesCount;
  if (familyHandlesCount) {
    CFDictionarySetValue(v4, @"familyHandlesCount", familyHandlesCount);
  }
  emergencyHandleMsgCount = self->_emergencyHandleMsgCount;
  if (emergencyHandleMsgCount) {
    CFDictionarySetValue(v4, @"emergencyHandleMsgCount", emergencyHandleMsgCount);
  }
  primaryHandleMsgCount = self->_primaryHandleMsgCount;
  if (primaryHandleMsgCount) {
    CFDictionarySetValue(v4, @"primaryHandleMsgCount", primaryHandleMsgCount);
  }
  qualifiedHandleMsgCount = self->_qualifiedHandleMsgCount;
  if (qualifiedHandleMsgCount) {
    CFDictionarySetValue(v4, @"qualifiedHandleMsgCount", qualifiedHandleMsgCount);
  }
  return (NSDictionary *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToMetric = objc_msgSend_isEqualToMetric_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToMetric = 0;
  }

  return isEqualToMetric;
}

- (BOOL)isEqualToMetric:(id)a3
{
  double v6 = (IDSQualifiedContactsMetric *)a3;
  if (v6 == self)
  {
    char isEqualToNumber = 1;
  }
  else
  {
    v8 = objc_msgSend_handlesCount(self, v4, v5, v7);
    v12 = objc_msgSend_handlesCount(v6, v9, v10, v11);
    if (objc_msgSend_isEqualToNumber_(v8, v13, (uint64_t)v12, v14))
    {
      v18 = objc_msgSend_qualifiedHandlesCount(self, v15, v16, v17);
      v22 = objc_msgSend_qualifiedHandlesCount(v6, v19, v20, v21);
      if (objc_msgSend_isEqualToNumber_(v18, v23, (uint64_t)v22, v24))
      {
        v28 = objc_msgSend_qualifiedHandlesIML(self, v25, v26, v27);
        v32 = objc_msgSend_qualifiedHandlesIML(v6, v29, v30, v31);
        if (objc_msgSend_isEqualToNumber_(v28, v33, (uint64_t)v32, v34))
        {
          v38 = objc_msgSend_primaryHandlesCount(self, v35, v36, v37);
          v42 = objc_msgSend_primaryHandlesCount(v6, v39, v40, v41);
          if (objc_msgSend_isEqualToNumber_(v38, v43, (uint64_t)v42, v44))
          {
            v109 = v38;
            v48 = objc_msgSend_qualifiedPrimaryHandles(self, v45, v46, v47);
            v110 = objc_msgSend_qualifiedPrimaryHandles(v6, v49, v50, v51);
            v111 = v48;
            if (objc_msgSend_isEqualToNumber_(v48, v52, (uint64_t)v110, v53))
            {
              v57 = objc_msgSend_qualifiedPrimaryHandlesIML(self, v54, v55, v56);
              v107 = objc_msgSend_qualifiedPrimaryHandlesIML(v6, v58, v59, v60);
              v108 = v57;
              if (objc_msgSend_isEqualToNumber_(v57, v61, (uint64_t)v107, v62))
              {
                v66 = objc_msgSend_familyHandlesCount(self, v63, v64, v65);
                v105 = objc_msgSend_familyHandlesCount(v6, v67, v68, v69);
                v106 = v66;
                if (objc_msgSend_isEqualToNumber_(v66, v70, (uint64_t)v105, v71))
                {
                  v75 = objc_msgSend_emergencyHandlesCount(self, v72, v73, v74);
                  v103 = objc_msgSend_emergencyHandlesCount(v6, v76, v77, v78);
                  v104 = v75;
                  if (objc_msgSend_isEqualToNumber_(v75, v79, (uint64_t)v103, v80))
                  {
                    v102 = objc_msgSend_qualifiedEmergencyHandles(self, v81, v82, v83);
                    v101 = objc_msgSend_qualifiedEmergencyHandles(v6, v84, v85, v86);
                    if (objc_msgSend_isEqualToNumber_(v102, v87, (uint64_t)v101, v88))
                    {
                      v92 = objc_msgSend_qualifiedEmergencyHandlesIML(self, v89, v90, v91);
                      v100 = objc_msgSend_qualifiedEmergencyHandlesIML(v6, v93, v94, v95);
                      char isEqualToNumber = objc_msgSend_isEqualToNumber_(v92, v96, (uint64_t)v100, v97);
                    }
                    else
                    {
                      char isEqualToNumber = 0;
                    }
                    v38 = v109;
                  }
                  else
                  {
                    char isEqualToNumber = 0;
                    v38 = v109;
                  }
                }
                else
                {
                  char isEqualToNumber = 0;
                  v38 = v109;
                }
              }
              else
              {
                char isEqualToNumber = 0;
                v38 = v109;
              }
            }
            else
            {
              char isEqualToNumber = 0;
              v38 = v109;
            }
          }
          else
          {
            char isEqualToNumber = 0;
          }
        }
        else
        {
          char isEqualToNumber = 0;
        }
      }
      else
      {
        char isEqualToNumber = 0;
      }
    }
    else
    {
      char isEqualToNumber = 0;
    }
  }
  return isEqualToNumber;
}

- (NSString)description
{
  double v47 = NSString;
  uint64_t v46 = objc_opt_class();
  v48 = objc_msgSend_handlesCount(self, v3, v4, v5);
  v9 = objc_msgSend_qualifiedHandlesCount(self, v6, v7, v8);
  v13 = objc_msgSend_qualifiedHandlesIML(self, v10, v11, v12);
  double v17 = objc_msgSend_primaryHandlesCount(self, v14, v15, v16);
  double v21 = objc_msgSend_qualifiedPrimaryHandles(self, v18, v19, v20);
  v25 = objc_msgSend_qualifiedPrimaryHandlesIML(self, v22, v23, v24);
  v29 = objc_msgSend_familyHandlesCount(self, v26, v27, v28);
  v33 = objc_msgSend_emergencyHandlesCount(self, v30, v31, v32);
  double v37 = objc_msgSend_qualifiedEmergencyHandles(self, v34, v35, v36);
  double v41 = objc_msgSend_qualifiedEmergencyHandlesIML(self, v38, v39, v40);
  objc_msgSend_stringWithFormat_(v47, v42, @"<%@: %p; handlesCount = %@; qualifiedHandlesCount = %@; qualifiedHandlesIML = %@; primaryHandlesCount = %@; qualifiedPrimaryHandles = %@; qualifiedPrimaryHandlesIML = %@; familyHandlesCount = %@; emergencyHandlesCount = %@; qualifiedEmergencyHandles = %@; qualifiedEmergencyHandlesIML = %@>",
    v43,
    v46,
    self,
    v48,
    v9,
    v13,
    v17,
    v21,
    v25,
    v29,
    v33,
    v37,
  double v44 = v41);

  return (NSString *)v44;
}

- (NSNumber)qualifiedHandlesCount
{
  return self->_qualifiedHandlesCount;
}

- (void)setQualifiedHandlesCount:(id)a3
{
}

- (NSNumber)qualifiedHandlesIML
{
  return self->_qualifiedHandlesIML;
}

- (void)setQualifiedHandlesIML:(id)a3
{
}

- (NSNumber)handlesCount
{
  return self->_handlesCount;
}

- (void)setHandlesCount:(id)a3
{
}

- (NSNumber)qualifiedEmergencyHandles
{
  return self->_qualifiedEmergencyHandles;
}

- (void)setQualifiedEmergencyHandles:(id)a3
{
}

- (NSNumber)qualifiedEmergencyHandlesIML
{
  return self->_qualifiedEmergencyHandlesIML;
}

- (void)setQualifiedEmergencyHandlesIML:(id)a3
{
}

- (NSNumber)emergencyHandlesCount
{
  return self->_emergencyHandlesCount;
}

- (void)setEmergencyHandlesCount:(id)a3
{
}

- (NSNumber)qualifiedPrimaryHandles
{
  return self->_qualifiedPrimaryHandles;
}

- (void)setQualifiedPrimaryHandles:(id)a3
{
}

- (NSNumber)qualifiedPrimaryHandlesIML
{
  return self->_qualifiedPrimaryHandlesIML;
}

- (void)setQualifiedPrimaryHandlesIML:(id)a3
{
}

- (NSNumber)primaryHandlesCount
{
  return self->_primaryHandlesCount;
}

- (void)setPrimaryHandlesCount:(id)a3
{
}

- (NSNumber)familyHandlesCount
{
  return self->_familyHandlesCount;
}

- (void)setFamilyHandlesCount:(id)a3
{
}

- (NSNumber)emergencyHandleMsgCount
{
  return self->_emergencyHandleMsgCount;
}

- (void)setEmergencyHandleMsgCount:(id)a3
{
}

- (NSNumber)primaryHandleMsgCount
{
  return self->_primaryHandleMsgCount;
}

- (void)setPrimaryHandleMsgCount:(id)a3
{
}

- (NSNumber)qualifiedHandleMsgCount
{
  return self->_qualifiedHandleMsgCount;
}

- (void)setQualifiedHandleMsgCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiedHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_primaryHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_emergencyHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_familyHandlesCount, 0);
  objc_storeStrong((id *)&self->_primaryHandlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandles, 0);
  objc_storeStrong((id *)&self->_handlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedHandlesCount, 0);
}

@end