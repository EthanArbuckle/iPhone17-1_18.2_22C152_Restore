@interface _IDSRegisteredDevice
- (BOOL)defaultLocalDevice;
- (BOOL)defaultPariedDevice;
- (BOOL)isActivePairedDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHSATrustedDevice;
- (BOOL)locallyPresent;
- (NSData)pushToken;
- (NSDictionary)privateDeviceData;
- (NSNumber)maximumCompatibilityVersion;
- (NSNumber)minimumCompatibilityVersion;
- (NSNumber)pairingProtocolVersion;
- (NSNumber)pairingType;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)idsIdentifierOverride;
- (NSString)nsuuid;
- (NSString)selfHandle;
- (_IDSRegisteredDevice)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (void)setDefaultLocalDevice:(BOOL)a3;
- (void)setDefaultPariedDevice:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setIdsIdentifierOverride:(id)a3;
- (void)setIsActivePairedDevice:(BOOL)a3;
- (void)setIsHSATrustedDevice:(BOOL)a3;
- (void)setLocallyPresent:(BOOL)a3;
- (void)setMaximumCompatibilityVersion:(id)a3;
- (void)setMinimumCompatibilityVersion:(id)a3;
- (void)setNsuuid:(id)a3;
- (void)setPairingProtocolVersion:(id)a3;
- (void)setPairingType:(id)a3;
- (void)setPrivateDeviceData:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setSelfHandle:(id)a3;
@end

@implementation _IDSRegisteredDevice

- (_IDSRegisteredDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_IDSRegisteredDevice;
  v5 = [(_IDSRegisteredDevice *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE20]];
    v5->_defaultLocalDevice = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE28]];
    v5->_defaultPariedDevice = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE50]];
    v5->_isActivePairedDevice = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE58]];
    v5->_isHSATrustedDevice = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE68]];
    v5->_locallyPresent = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE88]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_deviceName, v11);
    }
    v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE30]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_hardwareVersion, v12);
    }
    v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE38]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_idsIdentifierOverride, v13);
    }
    v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AEB0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_selfHandle, v14);
    }
    v24 = v14;
    v26 = v11;
    v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE80]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_nsuuid, v15);
    }
    v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE90]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_pairingProtocolVersion, v16);
    }
    v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE78]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_minimumCompatibilityVersion, v17);
    }
    v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE70]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_maximumCompatibilityVersion, v18);
    }
    v25 = v13;
    v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AE98]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_pairingType, v19);
    }
    v20 = v12;
    v21 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AEA8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_pushToken, v21);
    }
    v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AEA0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_privateDeviceData, v22);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_IDSRegisteredDevice *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (self == v4)
  {
    char v11 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    char v11 = 0;
    goto LABEL_12;
  }
  v6 = v5;
  BOOL v7 = [(_IDSRegisteredDevice *)self defaultLocalDevice];
  if (v7 == [(_IDSRegisteredDevice *)v6 defaultLocalDevice])
  {
    BOOL v8 = [(_IDSRegisteredDevice *)self defaultPariedDevice];
    if (v8 == [(_IDSRegisteredDevice *)v6 defaultPariedDevice])
    {
      BOOL v9 = [(_IDSRegisteredDevice *)self isActivePairedDevice];
      if (v9 == [(_IDSRegisteredDevice *)v6 isActivePairedDevice])
      {
        BOOL v10 = [(_IDSRegisteredDevice *)self locallyPresent];
        if (v10 == [(_IDSRegisteredDevice *)v6 locallyPresent])
        {
          v13 = [(_IDSRegisteredDevice *)self deviceName];
          v14 = [(_IDSRegisteredDevice *)v6 deviceName];
          if (v13 != v14)
          {
            v15 = [(_IDSRegisteredDevice *)self deviceName];
            v88 = [(_IDSRegisteredDevice *)v6 deviceName];
            if (!objc_msgSend(v15, "isEqual:"))
            {
              char v11 = 0;
              goto LABEL_71;
            }
            v85 = v15;
          }
          uint64_t v16 = [(_IDSRegisteredDevice *)self hardwareVersion];
          v89 = [(_IDSRegisteredDevice *)v6 hardwareVersion];
          v90 = (void *)v16;
          if ((void *)v16 != v89)
          {
            v17 = [(_IDSRegisteredDevice *)self hardwareVersion];
            v18 = [(_IDSRegisteredDevice *)v6 hardwareVersion];
            if (![v17 isEqual:v18])
            {
              char v11 = 0;
LABEL_69:

LABEL_70:
              v15 = v85;
              if (v13 == v14)
              {
LABEL_72:

                goto LABEL_9;
              }
LABEL_71:

              goto LABEL_72;
            }
            v83 = v18;
            v84 = v17;
          }
          uint64_t v19 = [(_IDSRegisteredDevice *)self idsIdentifierOverride];
          v86 = [(_IDSRegisteredDevice *)v6 idsIdentifierOverride];
          v87 = (void *)v19;
          if ((void *)v19 != v86)
          {
            v20 = [(_IDSRegisteredDevice *)self idsIdentifierOverride];
            v80 = [(_IDSRegisteredDevice *)v6 idsIdentifierOverride];
            v81 = v20;
            if (!objc_msgSend(v20, "isEqual:"))
            {
              char v11 = 0;
LABEL_67:

LABEL_68:
              v18 = v83;
              v17 = v84;
              if (v90 == v89) {
                goto LABEL_70;
              }
              goto LABEL_69;
            }
          }
          v21 = [(_IDSRegisteredDevice *)self selfHandle];
          v22 = [(_IDSRegisteredDevice *)v6 selfHandle];
          v82 = v21;
          if (v21 != v22)
          {
            v23 = [(_IDSRegisteredDevice *)self selfHandle];
            [(_IDSRegisteredDevice *)v6 selfHandle];
            v77 = v78 = v23;
            if (!objc_msgSend(v23, "isEqual:"))
            {
              char v11 = 0;
LABEL_65:

LABEL_66:
              if (v87 == v86) {
                goto LABEL_68;
              }
              goto LABEL_67;
            }
          }
          uint64_t v24 = [(_IDSRegisteredDevice *)self nsuuid];
          uint64_t v25 = [(_IDSRegisteredDevice *)v6 nsuuid];
          v79 = (void *)v24;
          BOOL v26 = v24 == v25;
          objc_super v27 = (void *)v25;
          if (!v26)
          {
            v28 = [(_IDSRegisteredDevice *)self nsuuid];
            v75 = [(_IDSRegisteredDevice *)v6 nsuuid];
            v76 = v28;
            if (!objc_msgSend(v28, "isEqual:"))
            {
              v29 = v27;
              char v11 = 0;
              v30 = v79;
LABEL_63:

LABEL_64:
              v21 = v82;
              if (v82 == v22) {
                goto LABEL_66;
              }
              goto LABEL_65;
            }
          }
          uint64_t v31 = [(_IDSRegisteredDevice *)self pairingProtocolVersion];
          v32 = [(_IDSRegisteredDevice *)v6 pairingProtocolVersion];
          v74 = v22;
          if ((void *)v31 != v32)
          {
            v33 = [(_IDSRegisteredDevice *)self pairingProtocolVersion];
            v72 = [(_IDSRegisteredDevice *)v6 pairingProtocolVersion];
            v73 = v33;
            if (!objc_msgSend(v33, "isEqual:"))
            {
              v29 = v27;
              v34 = (void *)v31;
              char v11 = 0;
              v22 = v74;
LABEL_61:

LABEL_62:
              v30 = v79;
              if (v79 == v29) {
                goto LABEL_64;
              }
              goto LABEL_63;
            }
          }
          v35 = [(_IDSRegisteredDevice *)self minimumCompatibilityVersion];
          uint64_t v70 = [(_IDSRegisteredDevice *)v6 minimumCompatibilityVersion];
          v71 = v32;
          if (v35 != (void *)v70)
          {
            v36 = [(_IDSRegisteredDevice *)self minimumCompatibilityVersion];
            v68 = [(_IDSRegisteredDevice *)v6 minimumCompatibilityVersion];
            v69 = v36;
            if (!objc_msgSend(v36, "isEqual:"))
            {
              v37 = v27;
              v34 = (void *)v31;
              char v11 = 0;
              v38 = (void *)v70;
              goto LABEL_58;
            }
          }
          uint64_t v39 = [(_IDSRegisteredDevice *)self maximumCompatibilityVersion];
          uint64_t v66 = [(_IDSRegisteredDevice *)v6 maximumCompatibilityVersion];
          v67 = (void *)v39;
          v65 = v35;
          if (v39 != v66)
          {
            v40 = [(_IDSRegisteredDevice *)self maximumCompatibilityVersion];
            v61 = [(_IDSRegisteredDevice *)v6 maximumCompatibilityVersion];
            v62 = v40;
            if (!objc_msgSend(v40, "isEqual:"))
            {
              v42 = (void *)v66;
              v41 = v67;
              v37 = v27;
              char v11 = 0;
              goto LABEL_55;
            }
          }
          uint64_t v43 = [(_IDSRegisteredDevice *)self pairingType];
          uint64_t v63 = [(_IDSRegisteredDevice *)v6 pairingType];
          v64 = (void *)v43;
          if (v43 != v63)
          {
            v44 = [(_IDSRegisteredDevice *)self pairingType];
            v59 = [(_IDSRegisteredDevice *)v6 pairingType];
            v60 = v44;
            if (!objc_msgSend(v44, "isEqual:"))
            {
              char v11 = 0;
              v49 = (void *)v63;
              goto LABEL_52;
            }
          }
          uint64_t v45 = [(_IDSRegisteredDevice *)self pushToken];
          uint64_t v57 = [(_IDSRegisteredDevice *)v6 pushToken];
          v58 = (void *)v45;
          if (v45 == v57
            || ([(_IDSRegisteredDevice *)self pushToken],
                v46 = objc_claimAutoreleasedReturnValue(),
                [(_IDSRegisteredDevice *)v6 pushToken],
                v55 = objc_claimAutoreleasedReturnValue(),
                v56 = v46,
                objc_msgSend(v46, "isEqual:")))
          {
            v50 = [(_IDSRegisteredDevice *)self privateDeviceData];
            uint64_t v51 = [(_IDSRegisteredDevice *)v6 privateDeviceData];
            if (v50 == (void *)v51)
            {

              char v11 = 1;
            }
            else
            {
              v52 = (void *)v51;
              v54 = [(_IDSRegisteredDevice *)self privateDeviceData];
              v53 = [(_IDSRegisteredDevice *)v6 privateDeviceData];
              char v11 = [v54 isEqual:v53];
            }
            v48 = (void *)v57;
            v47 = v58;
            if (v58 == (void *)v57)
            {
LABEL_51:

              v49 = (void *)v63;
              if (v64 == (void *)v63)
              {
                v37 = v27;
LABEL_54:

                v42 = (void *)v66;
                v41 = v67;
                if (v67 == (void *)v66)
                {
                  v34 = (void *)v31;
LABEL_57:

                  v35 = v65;
                  v38 = (void *)v70;
                  if (v65 == (void *)v70)
                  {
                    v29 = v37;
LABEL_60:

                    v32 = v71;
                    v22 = v74;
                    if (v34 == v71) {
                      goto LABEL_62;
                    }
                    goto LABEL_61;
                  }
LABEL_58:
                  v29 = v37;

                  goto LABEL_60;
                }
LABEL_55:
                v34 = (void *)v31;

                goto LABEL_57;
              }
LABEL_52:
              v37 = v27;

              goto LABEL_54;
            }
          }
          else
          {
            char v11 = 0;
            v48 = (void *)v57;
            v47 = v58;
          }

          goto LABEL_51;
        }
      }
    }
  }
  char v11 = 0;
LABEL_9:

LABEL_12:
  return v11;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_IDSRegisteredDevice defaultLocalDevice](self, "defaultLocalDevice"));
  if (v4) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE20], v4);
  }

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_IDSRegisteredDevice defaultPariedDevice](self, "defaultPariedDevice"));
  if (v5) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE28], v5);
  }

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_IDSRegisteredDevice isActivePairedDevice](self, "isActivePairedDevice"));
  if (v6) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE50], v6);
  }

  BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_IDSRegisteredDevice isHSATrustedDevice](self, "isHSATrustedDevice"));
  if (v7) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE58], v7);
  }

  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_IDSRegisteredDevice locallyPresent](self, "locallyPresent"));
  if (v8) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE68], v8);
  }

  BOOL v9 = [(_IDSRegisteredDevice *)self deviceName];
  if (v9) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE88], v9);
  }

  BOOL v10 = [(_IDSRegisteredDevice *)self hardwareVersion];
  if (v10) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE30], v10);
  }

  char v11 = [(_IDSRegisteredDevice *)self idsIdentifierOverride];
  if (v11) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE38], v11);
  }

  v12 = [(_IDSRegisteredDevice *)self selfHandle];
  if (v12) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AEB0], v12);
  }

  v13 = [(_IDSRegisteredDevice *)self pushToken];
  if (v13) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AEA8], v13);
  }

  v14 = [(_IDSRegisteredDevice *)self privateDeviceData];
  if (v14) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AEA0], v14);
  }

  v15 = [(_IDSRegisteredDevice *)self nsuuid];
  if (v15) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE80], v15);
  }

  uint64_t v16 = [(_IDSRegisteredDevice *)self pairingProtocolVersion];
  if (v16) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE90], v16);
  }

  v17 = [(_IDSRegisteredDevice *)self minimumCompatibilityVersion];
  if (v17) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE78], v17);
  }

  v18 = [(_IDSRegisteredDevice *)self maximumCompatibilityVersion];
  if (v18) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE70], v18);
  }

  uint64_t v19 = [(_IDSRegisteredDevice *)self pairingType];
  if (v19) {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E4F6AE98], v19);
  }

  return v3;
}

- (BOOL)defaultLocalDevice
{
  return self->_defaultLocalDevice;
}

- (void)setDefaultLocalDevice:(BOOL)a3
{
  self->_defaultLocalDevice = a3;
}

- (BOOL)locallyPresent
{
  return self->_locallyPresent;
}

- (void)setLocallyPresent:(BOOL)a3
{
  self->_locallyPresent = a3;
}

- (BOOL)defaultPariedDevice
{
  return self->_defaultPariedDevice;
}

- (void)setDefaultPariedDevice:(BOOL)a3
{
  self->_defaultPariedDevice = a3;
}

- (BOOL)isActivePairedDevice
{
  return self->_isActivePairedDevice;
}

- (void)setIsActivePairedDevice:(BOOL)a3
{
  self->_isActivePairedDevice = a3;
}

- (BOOL)isHSATrustedDevice
{
  return self->_isHSATrustedDevice;
}

- (void)setIsHSATrustedDevice:(BOOL)a3
{
  self->_isHSATrustedDevice = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)idsIdentifierOverride
{
  return self->_idsIdentifierOverride;
}

- (void)setIdsIdentifierOverride:(id)a3
{
}

- (NSString)selfHandle
{
  return self->_selfHandle;
}

- (void)setSelfHandle:(id)a3
{
}

- (NSString)nsuuid
{
  return self->_nsuuid;
}

- (void)setNsuuid:(id)a3
{
}

- (NSNumber)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (void)setPairingProtocolVersion:(id)a3
{
}

- (NSNumber)minimumCompatibilityVersion
{
  return self->_minimumCompatibilityVersion;
}

- (void)setMinimumCompatibilityVersion:(id)a3
{
}

- (NSNumber)maximumCompatibilityVersion
{
  return self->_maximumCompatibilityVersion;
}

- (void)setMaximumCompatibilityVersion:(id)a3
{
}

- (NSNumber)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSDictionary)privateDeviceData
{
  return self->_privateDeviceData;
}

- (void)setPrivateDeviceData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDeviceData, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pairingType, 0);
  objc_storeStrong((id *)&self->_maximumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_minimumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_pairingProtocolVersion, 0);
  objc_storeStrong((id *)&self->_nsuuid, 0);
  objc_storeStrong((id *)&self->_selfHandle, 0);
  objc_storeStrong((id *)&self->_idsIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end