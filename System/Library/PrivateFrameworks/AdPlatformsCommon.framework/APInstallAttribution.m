@interface APInstallAttribution
+ (BOOL)supportsSecureCoding;
- (APInstallAttribution)initWithCoder:(id)a3;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)version;
- (NSUUID)contextIdentifier;
- (unint64_t)adamId;
- (unint64_t)campaignId;
- (unint64_t)sourceAppAdamId;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAdNetworkId:(id)a3;
- (void)setAdamId:(unint64_t)a3;
- (void)setAttributionSignature:(id)a3;
- (void)setCampaignId:(unint64_t)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setSourceAppAdamId:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation APInstallAttribution

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_adamId(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInt64_forKey_(v4, v12, v11, @"adamId", v13, v14, v15);
  uint64_t v22 = objc_msgSend_campaignId(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt64_forKey_(v4, v23, v22, @"campaignId", v24, v25, v26);
  uint64_t v33 = objc_msgSend_sourceAppAdamId(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v4, v34, v33, @"sourceAppAdamId", v35, v36, v37);
  uint64_t v44 = objc_msgSend_timestamp(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v4, v45, v44, @"timestamp", v46, v47, v48);
  v55 = objc_msgSend_adNetworkId(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"adNetworkId", v57, v58, v59);

  v66 = objc_msgSend_attributionSignature(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, @"attributionSignature", v68, v69, v70);

  v77 = objc_msgSend_contextIdentifier(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"contextIdentifier", v79, v80, v81);

  objc_msgSend_version(self, v82, v83, v84, v85, v86, v87);
  id v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v92, @"version", v89, v90, v91);
}

- (APInstallAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)APInstallAttribution;
  uint64_t v8 = [(APInstallAttribution *)&v55 init];
  if (v8)
  {
    v8->_adamId = objc_msgSend_decodeInt64ForKey_(v4, v5, @"adamId", v6, v7, v9, v10);
    v8->_campaignId = objc_msgSend_decodeInt64ForKey_(v4, v11, @"campaignId", v12, v13, v14, v15);
    v8->_sourceAppAdamId = objc_msgSend_decodeInt64ForKey_(v4, v16, @"sourceAppAdamId", v17, v18, v19, v20);
    v8->_timestamp = objc_msgSend_decodeInt64ForKey_(v4, v21, @"timestamp", v22, v23, v24, v25);
    uint64_t v26 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"adNetworkId", v28, v29, v30);
    adNetworkId = v8->_adNetworkId;
    v8->_adNetworkId = (NSString *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"attributionSignature", v35, v36, v37);
    attributionSignature = v8->_attributionSignature;
    v8->_attributionSignature = (NSString *)v38;

    uint64_t v40 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"contextIdentifier", v42, v43, v44);
    contextIdentifier = v8->_contextIdentifier;
    v8->_contextIdentifier = (NSUUID *)v45;

    uint64_t v47 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, @"version", v49, v50, v51);
    version = v8->_version;
    v8->_version = (NSString *)v52;
  }
  return v8;
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(unint64_t)a3
{
  self->_adamId = a3;
}

- (unint64_t)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(unint64_t)a3
{
  self->_campaignId = a3;
}

- (unint64_t)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (void)setSourceAppAdamId:(unint64_t)a3
{
  self->_sourceAppAdamId = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);
  objc_storeStrong((id *)&self->_adNetworkId, 0);
}

@end