@interface IDSFamilyEndpointData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTo:(id)a3;
- (IDSFamilyEndpointData)initWithCoder:(id)a3;
- (IDSFamilyEndpointData)initWithDeviceName:(id)a3 privateDeviceData:(id)a4;
- (IDSFamilyEndpointData)initWithDictionary:(id)a3;
- (NSString)buildVersion;
- (NSString)deviceColor;
- (NSString)deviceName;
- (NSString)deviceUniqueID;
- (NSString)productVersion;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setProductVersion:(id)a3;
@end

@implementation IDSFamilyEndpointData

- (IDSFamilyEndpointData)initWithDeviceName:(id)a3 privateDeviceData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IDSFamilyEndpointData;
  v9 = [(IDSFamilyEndpointData *)&v34 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceName, a3);
    v13 = objc_msgSend_objectForKey_(v8, v11, @"dt", v12);
    v10->_deviceType = objc_msgSend_integerValue(v13, v14, v15, v16);

    uint64_t v19 = objc_msgSend__stringForKey_(v8, v17, @"c", v18);
    deviceColor = v10->_deviceColor;
    v10->_deviceColor = (NSString *)v19;

    uint64_t v23 = objc_msgSend__stringForKey_(v8, v21, @"pb", v22);
    buildVersion = v10->_buildVersion;
    v10->_buildVersion = (NSString *)v23;

    uint64_t v27 = objc_msgSend__stringForKey_(v8, v25, @"pv", v26);
    productVersion = v10->_productVersion;
    v10->_productVersion = (NSString *)v27;

    uint64_t v31 = objc_msgSend__stringForKey_(v8, v29, @"u", v30);
    deviceUniqueID = v10->_deviceUniqueID;
    v10->_deviceUniqueID = (NSString *)v31;
  }
  return v10;
}

- (IDSFamilyEndpointData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IDSFamilyEndpointData;
  v6 = [(IDSFamilyEndpointData *)&v33 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_objectForKey_(v4, v5, @"FamilyDeviceNameKey", v7);
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v8;

    double v12 = objc_msgSend_objectForKey_(v4, v10, @"FamilyDeviceTypeKey", v11);
    v6->_deviceType = objc_msgSend_integerValue(v12, v13, v14, v15);

    uint64_t v18 = objc_msgSend_objectForKey_(v4, v16, @"FamilyDeviceColorKey", v17);
    deviceColor = v6->_deviceColor;
    v6->_deviceColor = (NSString *)v18;

    uint64_t v22 = objc_msgSend_objectForKey_(v4, v20, @"FamilyDeviceBuildVersionKey", v21);
    buildVersion = v6->_buildVersion;
    v6->_buildVersion = (NSString *)v22;

    uint64_t v26 = objc_msgSend_objectForKey_(v4, v24, @"FamilyDeviceProductVersionKey", v25);
    productVersion = v6->_productVersion;
    v6->_productVersion = (NSString *)v26;

    uint64_t v30 = objc_msgSend_objectForKey_(v4, v28, @"FamilyDeviceUniqueIDKey", v29);
    deviceUniqueID = v6->_deviceUniqueID;
    v6->_deviceUniqueID = (NSString *)v30;
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    CFDictionarySetValue(v3, @"FamilyDeviceNameKey", deviceName);
  }
  uint64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v4, self->_deviceType, v5);
  if (v8) {
    CFDictionarySetValue(v6, @"FamilyDeviceTypeKey", v8);
  }

  deviceColor = self->_deviceColor;
  if (deviceColor) {
    CFDictionarySetValue(v6, @"FamilyDeviceColorKey", deviceColor);
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    CFDictionarySetValue(v6, @"FamilyDeviceBuildVersionKey", buildVersion);
  }
  deviceUniqueID = self->_deviceUniqueID;
  if (deviceUniqueID) {
    CFDictionarySetValue(v6, @"FamilyDeviceUniqueIDKey", deviceUniqueID);
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    CFDictionarySetValue(v6, @"FamilyDeviceProductVersionKey", productVersion);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSFamilyEndpointData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"FamilyDeviceNameKey");
  v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = objc_opt_class();
  v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, v12, @"FamilyDeviceColorKey");
  if (v13) {
    CFDictionarySetValue(v9, @"c", v13);
  }

  uint64_t v14 = NSNumber;
  uint64_t v17 = objc_msgSend_decodeIntegerForKey_(v4, v15, @"FamilyDeviceTypeKey", v16);
  v20 = objc_msgSend_numberWithInteger_(v14, v18, v17, v19);
  if (v20) {
    CFDictionarySetValue(v9, @"dt", v20);
  }

  uint64_t v21 = objc_opt_class();
  v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, @"FamilyDeviceBuildVersionKey");
  if (v24) {
    CFDictionarySetValue(v9, @"pb", v24);
  }

  uint64_t v25 = objc_opt_class();
  v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, v27, @"FamilyDeviceUniqueIDKey");
  if (v28) {
    CFDictionarySetValue(v9, @"u", v28);
  }

  uint64_t v29 = objc_opt_class();
  v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, v31, @"FamilyDeviceProductVersionKey");
  if (v32) {
    CFDictionarySetValue(v9, @"pv", v32);
  }

  v35 = (IDSFamilyEndpointData *)objc_msgSend_initWithDeviceName_privateDeviceData_(self, v33, (uint64_t)v8, v34, v9);
  return v35;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)deviceName, v6, @"FamilyDeviceNameKey");
  objc_msgSend_encodeInteger_forKey_(v17, v7, self->_deviceType, v8, @"FamilyDeviceTypeKey");
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_deviceColor, v10, @"FamilyDeviceColorKey");
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_buildVersion, v12, @"FamilyDeviceBuildVersionKey");
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_deviceUniqueID, v14, @"FamilyDeviceUniqueIDKey");
  objc_msgSend_encodeObject_forKey_(v17, v15, (uint64_t)self->_productVersion, v16, @"FamilyDeviceProductVersionKey");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualTo = objc_msgSend_isEqualTo_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualTo = 0;
  }

  return isEqualTo;
}

- (BOOL)isEqualTo:(id)a3
{
  id v5 = a3;
  v9 = objc_msgSend_deviceName(self, v6, v7, v8);
  v13 = objc_msgSend_deviceName(v5, v10, v11, v12);
  char isEqualToString = objc_msgSend_isEqualToString_(v9, v14, (uint64_t)v13, v15);
  if ((isEqualToString & 1) == 0)
  {
    v20 = objc_msgSend_deviceName(self, v16, v17, v19);
    uint64_t v24 = objc_msgSend_deviceName(v5, v21, v22, v23);
    if (v20 != (void *)v24)
    {
      v3 = (void *)v24;
      BOOL v25 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v3 = v20;
  }
  uint64_t v26 = objc_msgSend_deviceType(self, v16, v17, v19);
  if (v26 != objc_msgSend_deviceType(v5, v27, v28, v29))
  {
    BOOL v25 = 0;
    goto LABEL_29;
  }
  objc_super v33 = objc_msgSend_deviceColor(self, v30, v31, v32);
  v37 = objc_msgSend_deviceColor(v5, v34, v35, v36);
  char v42 = objc_msgSend_isEqualToString_(v33, v38, (uint64_t)v37, v39);
  if ((v42 & 1) == 0)
  {
    v44 = objc_msgSend_deviceColor(self, v40, v41, v43);
    v48 = objc_msgSend_deviceColor(v5, v45, v46, v47);
    if (v44 != v48)
    {
      BOOL v25 = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v98 = v44;
  }
  v49 = objc_msgSend_buildVersion(self, v40, v41, v43);
  v103 = objc_msgSend_buildVersion(v5, v50, v51, v52);
  v104 = v49;
  char v102 = objc_msgSend_isEqualToString_(v49, v53, (uint64_t)v103, v54);
  if (v102)
  {
LABEL_15:
    char v101 = v42;
    v63 = objc_msgSend_deviceUniqueID(self, v55, v56, v57);
    v99 = objc_msgSend_deviceUniqueID(v5, v64, v65, v66);
    v100 = v63;
    char v71 = objc_msgSend_isEqualToString_(v63, v67, (uint64_t)v99, v68);
    if ((v71 & 1) == 0)
    {
      v73 = objc_msgSend_deviceUniqueID(self, v69, v70, v72);
      v77 = objc_msgSend_deviceUniqueID(v5, v74, v75, v76);
      if (v73 != v77)
      {
        BOOL v25 = 0;
        goto LABEL_23;
      }
      id v95 = v73;
    }
    v97 = v37;
    v78 = objc_msgSend_productVersion(self, v69, v70, v72);
    v82 = objc_msgSend_productVersion(v5, v79, v80, v81);
    if (objc_msgSend_isEqualToString_(v78, v83, (uint64_t)v82, v84))
    {

      BOOL v25 = 1;
    }
    else
    {
      objc_msgSend_productVersion(self, v85, v86, v87);
      v88 = v94 = v33;
      v92 = objc_msgSend_productVersion(v5, v89, v90, v91);
      BOOL v25 = v88 == v92;

      objc_super v33 = v94;
    }
    v77 = v95;
    v73 = v95;
    v37 = v97;
    if (v71)
    {
LABEL_24:

      v62 = v96;
      v58 = v96;
      char v42 = v101;
      if (v102) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  v58 = objc_msgSend_buildVersion(self, v55, v56, v57);
  v62 = objc_msgSend_buildVersion(v5, v59, v60, v61);
  if (v58 == v62)
  {
    id v96 = v58;
    goto LABEL_15;
  }
  BOOL v25 = 0;
LABEL_25:

LABEL_26:
  v48 = v98;
  v44 = v98;
  if ((v42 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_28:

LABEL_29:
  v20 = v3;
  if ((isEqualToString & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:

  return v25;
}

- (id)debugDescription
{
  id v5 = NSString;
  double v6 = objc_msgSend_deviceName(self, a2, v2, v3);
  v9 = objc_msgSend_stringWithFormat_(v5, v7, @"device-name = %@", v8, v6);

  double v10 = NSString;
  uint64_t v14 = objc_msgSend_deviceType(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v10, v15, @"device-type = %ld", v16, v14);
  uint64_t v18 = NSString;
  uint64_t v22 = objc_msgSend_deviceColor(self, v19, v20, v21);
  BOOL v25 = objc_msgSend_stringWithFormat_(v18, v23, @"device-color = %@", v24, v22);

  uint64_t v26 = NSString;
  uint64_t v30 = objc_msgSend_buildVersion(self, v27, v28, v29);
  objc_super v33 = objc_msgSend_stringWithFormat_(v26, v31, @"device-build-version = %@", v32, v30);

  double v34 = NSString;
  v38 = objc_msgSend_deviceUniqueID(self, v35, v36, v37);
  uint64_t v41 = objc_msgSend_stringWithFormat_(v34, v39, @"device-unique-id = %@", v40, v38);

  char v42 = NSString;
  uint64_t v46 = objc_msgSend_productVersion(self, v43, v44, v45);
  v49 = objc_msgSend_stringWithFormat_(v42, v47, @"device-product-version = %@", v48, v46);

  double v52 = objc_msgSend_stringWithFormat_(NSString, v50, @"%@\n%@\n%@\n%@\n%@\n%@\n", v51, v9, v17, v25, v33, v49, v41);

  return v52;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)deviceUniqueID
{
  return self->_deviceUniqueID;
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end