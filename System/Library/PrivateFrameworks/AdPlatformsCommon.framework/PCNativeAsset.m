@interface PCNativeAsset
+ (BOOL)supportsSecureCoding;
- (NSArray)assetInformation;
- (NSString)name;
- (NSString)treatment;
- (PCNativeAsset)init;
- (PCNativeAsset)initWithCoder:(id)a3;
- (int64_t)location;
- (unint64_t)adamID;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(unint64_t)a3;
- (void)setAssetInformation:(id)a3;
- (void)setLocation:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setTreatment:(id)a3;
@end

@implementation PCNativeAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeAsset)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCNativeAsset;
  result = [(PCNativeAsset *)&v3 init];
  if (result) {
    result->_location = -1;
  }
  return result;
}

- (PCNativeAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v11 = (PCNativeAsset *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"name", v14, v15, v16);
    name = v11->_name;
    v11->_name = (NSString *)v17;

    v11->_location = (int)objc_msgSend_decodeInt32ForKey_(v4, v19, @"location", v20, v21, v22, v23);
    id v24 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v32 = objc_msgSend_initWithObjects_(v24, v27, v25, v28, v29, v30, v31, v26, 0);
    uint64_t v37 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, @"assetInformation", v34, v35, v36);
    assetInformation = v11->_assetInformation;
    v11->_assetInformation = (NSArray *)v37;

    v11->_adamID = objc_msgSend_decodeInt64ForKey_(v4, v39, @"adamID", v40, v41, v42, v43);
    uint64_t v44 = objc_opt_class();
    uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"treatment", v46, v47, v48);
    treatment = v11->_treatment;
    v11->_treatment = (NSString *)v49;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11 = objc_msgSend_name(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"name", v13, v14, v15);

  uint64_t v22 = objc_msgSend_location(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt32_forKey_(v4, v23, v22, @"location", v24, v25, v26);
  v33 = objc_msgSend_assetInformation(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"assetInformation", v35, v36, v37);

  uint64_t v44 = objc_msgSend_adamID(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeInt64_forKey_(v4, v45, v44, @"adamID", v46, v47, v48);
  objc_msgSend_treatment(self, v49, v50, v51, v52, v53, v54);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v59, @"treatment", v56, v57, v58);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (NSArray)assetInformation
{
  return self->_assetInformation;
}

- (void)setAssetInformation:(id)a3
{
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end