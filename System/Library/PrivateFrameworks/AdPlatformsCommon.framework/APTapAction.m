@interface APTapAction
+ (BOOL)supportsSecureCoding;
- (APTapAction)initWithCoder:(id)a3;
- (BOOL)opensInstalledApp;
- (NSDictionary)iTunesMetadata;
- (NSNumber)adamIdentifier;
- (NSURL)actionURL;
- (double)confirmedClickInterval;
- (int64_t)actionType;
- (int64_t)templateType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setActionURL:(id)a3;
- (void)setAdamIdentifier:(id)a3;
- (void)setConfirmedClickInterval:(double)a3;
- (void)setITunesMetadata:(id)a3;
- (void)setOpensInstalledApp:(BOOL)a3;
- (void)setTemplateType:(int64_t)a3;
@end

@implementation APTapAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTapAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)APTapAction;
  v8 = [(APTapAction *)&v62 init];
  if (v8)
  {
    v8->_actionType = (int)objc_msgSend_decodeIntForKey_(v4, v5, @"actionType", v6, v7, v9, v10);
    uint64_t v17 = objc_msgSend_classForCoder(NSURL, v11, v12, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"actionURL", v19, v20, v21);
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v22;

    objc_msgSend_decodeDoubleForKey_(v4, v24, @"confirmedClickInterval", v25, v26, v27, v28);
    v8->_confirmedClickInterval = v29;
    v8->_opensInstalledApp = objc_msgSend_decodeBoolForKey_(v4, v30, @"kOpensInstalledAppKey", v31, v32, v29, v33);
    uint64_t v34 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"kAdamIdentifier", v36, v37, v38);
    adamIdentifier = v8->_adamIdentifier;
    v8->_adamIdentifier = (NSNumber *)v39;

    v8->_templateType = (int)objc_msgSend_decodeIntForKey_(v4, v41, @"kTemplateTypeKey", v42, v43, v44, v45);
    v46 = (void *)MEMORY[0x263EFFA08];
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    v54 = objc_msgSend_setWithObjects_(v46, v49, v47, v50, v51, v52, v53, v48, 0);
    uint64_t v59 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, @"kiTunesMetadata", v56, v57, v58);
    iTunesMetadata = v8->_iTunesMetadata;
    v8->_iTunesMetadata = (NSDictionary *)v59;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t actionType_low = LODWORD(self->_actionType);
  id v33 = a3;
  objc_msgSend_encodeInt_forKey_(v33, v5, actionType_low, @"actionType", v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v33, v9, (uint64_t)self->_actionURL, @"actionURL", v10, v11, v12);
  objc_msgSend_encodeDouble_forKey_(v33, v13, @"confirmedClickInterval", v14, v15, self->_confirmedClickInterval, v16);
  objc_msgSend_encodeBool_forKey_(v33, v17, self->_opensInstalledApp, @"kOpensInstalledAppKey", v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v33, v21, (uint64_t)self->_adamIdentifier, @"kAdamIdentifier", v22, v23, v24);
  objc_msgSend_encodeInt_forKey_(v33, v25, LODWORD(self->_templateType), @"kTemplateTypeKey", v26, v27, v28);
  objc_msgSend_encodeObject_forKey_(v33, v29, (uint64_t)self->_iTunesMetadata, @"kiTunesMetadata", v30, v31, v32);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSURL)actionURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionURL:(id)a3
{
}

- (double)confirmedClickInterval
{
  return self->_confirmedClickInterval;
}

- (void)setConfirmedClickInterval:(double)a3
{
  self->_confirmedClickInterval = a3;
}

- (BOOL)opensInstalledApp
{
  return self->_opensInstalledApp;
}

- (void)setOpensInstalledApp:(BOOL)a3
{
  self->_opensInstalledApp = a3;
}

- (NSNumber)adamIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdamIdentifier:(id)a3
{
}

- (int64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(int64_t)a3
{
  self->_templateType = a3;
}

- (NSDictionary)iTunesMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setITunesMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end