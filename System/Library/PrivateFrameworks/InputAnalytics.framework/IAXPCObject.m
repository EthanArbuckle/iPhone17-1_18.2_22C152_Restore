@interface IAXPCObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IAXPCObject)init;
- (IAXPCObject)initWithCoder:(id)a3;
- (IAXPCObject)initWithTimestamp:(id)a3;
- (NSDate)timestamp;
- (NSString)appBundleId;
- (NSString)description;
- (NSUUID)appSessionId;
- (NSUUID)textInputSessionId;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setAppSessionId:(id)a3;
- (void)setTextInputSessionId:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation IAXPCObject

- (IAXPCObject)init
{
  v20.receiver = self;
  v20.super_class = (Class)IAXPCObject;
  v5 = [(IAXPCObject *)&v20 init];
  if (v5)
  {
    v6 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v2, v3, v4);
    v10 = objc_msgSend_bundleIdentifier(v6, v7, v8, v9);
    objc_msgSend_setAppBundleId_(v5, v11, (uint64_t)v10, v12);

    v16 = objc_msgSend_now(MEMORY[0x263EFF910], v13, v14, v15);
    objc_msgSend_setTimestamp_(v5, v17, (uint64_t)v16, v18);
  }
  return v5;
}

- (IAXPCObject)initWithTimestamp:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IAXPCObject;
  uint64_t v8 = [(IAXPCObject *)&v19 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v5, v6, v7);
    v13 = objc_msgSend_bundleIdentifier(v9, v10, v11, v12);
    objc_msgSend_setAppBundleId_(v8, v14, (uint64_t)v13, v15);

    objc_msgSend_setTimestamp_(v8, v16, (uint64_t)v4, v17);
  }

  return v8;
}

- (NSString)description
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_textInputSessionId(self, a2, v2, v3);
  v10 = objc_msgSend_appSessionId(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_appBundleId(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_description(self->timestamp, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"textInputSessionId='%@', appSessionId='%@', appBundleId='%@', timestamp='%@'", v20, v6, v10, v14, v18);

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    uint64_t v16 = objc_msgSend_textInputSessionId(self, v10, v11, v12);
    if (v16
      || (objc_msgSend_textInputSessionId(v9, v13, v14, v15), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = objc_msgSend_textInputSessionId(self, v13, v14, v15);
      v5 = objc_msgSend_textInputSessionId(v9, v17, v18, v19);
      char isEqual = objc_msgSend_isEqual_(v4, v20, (uint64_t)v5, v21);

      if (v16)
      {
LABEL_12:

        v30 = objc_msgSend_appSessionId(self, v24, v25, v26);
        if (v30
          || (objc_msgSend_appSessionId(v9, v27, v28, v29), (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v5 = objc_msgSend_appSessionId(self, v27, v28, v29);
          v34 = objc_msgSend_appSessionId(v9, v31, v32, v33);
          char v37 = objc_msgSend_isEqual_(v5, v35, (uint64_t)v34, v36);

          if (v30)
          {
LABEL_18:

            v44 = objc_msgSend_appBundleId(self, v38, v39, v40);
            if (v44
              || (objc_msgSend_appBundleId(v9, v41, v42, v43), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v45 = objc_msgSend_appBundleId(self, v41, v42, v43);
              v49 = objc_msgSend_appBundleId(v9, v46, v47, v48);
              char v52 = objc_msgSend_isEqual_(v45, v50, (uint64_t)v49, v51);

              if (v44)
              {
LABEL_24:

                v59 = objc_msgSend_timestamp(self, v53, v54, v55);
                if (v59
                  || (objc_msgSend_timestamp(v9, v56, v57, v58),
                      (v5 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v60 = objc_msgSend_timestamp(self, v56, v57, v58);
                  v64 = objc_msgSend_timestamp(v9, v61, v62, v63);
                  char v67 = objc_msgSend_isEqual_(v60, v65, (uint64_t)v64, v66);

                  if (v59)
                  {
LABEL_30:

                    char v23 = isEqual & v37 & v52 & v67;
                    goto LABEL_31;
                  }
                }
                else
                {
                  char v67 = 1;
                }

                goto LABEL_30;
              }
            }
            else
            {
              char v52 = 1;
            }

            goto LABEL_24;
          }
        }
        else
        {
          char v37 = 1;
        }

        goto LABEL_18;
      }
    }
    else
    {
      char isEqual = 1;
    }

    goto LABEL_12;
  }
  char v23 = 0;
LABEL_31:

  return v23;
}

- (IAXPCObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IAXPCObject;
  v5 = [(IAXPCObject *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"textInputSessionId");
    textInputSessionId = v5->textInputSessionId;
    v5->textInputSessionId = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"appSessionId");
    appSessionId = v5->appSessionId;
    v5->appSessionId = (NSUUID *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"appBundleId");
    appBundleId = v5->appBundleId;
    v5->appBundleId = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"timestamp");
    timestamp = v5->timestamp;
    v5->timestamp = (NSDate *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  textInputSessionId = self->textInputSessionId;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)textInputSessionId, @"textInputSessionId");
  objc_msgSend_encodeObject_forKey_(v9, v6, (uint64_t)self->appSessionId, @"appSessionId");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->appBundleId, @"appBundleId");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->timestamp, @"timestamp");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleId
{
  return self->appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSUUID)appSessionId
{
  return self->appSessionId;
}

- (void)setAppSessionId:(id)a3
{
}

- (NSUUID)textInputSessionId
{
  return self->textInputSessionId;
}

- (void)setTextInputSessionId:(id)a3
{
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->textInputSessionId, 0);
  objc_storeStrong((id *)&self->appSessionId, 0);
  objc_storeStrong((id *)&self->appBundleId, 0);
}

@end