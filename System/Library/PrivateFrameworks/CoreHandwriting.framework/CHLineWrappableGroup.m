@interface CHLineWrappableGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)canWrapToNextGroup;
- (CHLineWrappableGroup)initWithCoder:(id)a3;
- (CHLineWrappableGroup)initWithLines:(id)a3;
- (CRNormalizedQuad)boundingQuad;
- (NSArray)subregions;
- (NSString)text;
- (NSUUID)uuid;
- (unint64_t)layoutDirection;
- (unint64_t)textRegionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHLineWrappableGroup

- (CHLineWrappableGroup)initWithLines:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CHLineWrappableGroup;
  v6 = [(CHLineWrappableGroup *)&v33 init];
  v12 = v6;
  if (v6)
  {
    v6->_canWrapToNextGroup = 1;
    v18 = objc_msgSend_firstObject(v5, v7, v8, v9, v10, v11);
    if (v18)
    {
      v19 = objc_msgSend_firstObject(v5, v13, v14, v15, v16, v17);
      v12->_layoutDirection = objc_msgSend_layoutDirection(v19, v20, v21, v22, v23, v24);
    }
    else
    {
      v12->_layoutDirection = 0;
    }

    objc_storeStrong((id *)&v12->_subregions, a3);
    v12->_textRegionType = 3;
    uint64_t v30 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v25, v26, v27, v28, v29);
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v30;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_boundingQuad(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, @"boundingQuad", v12, v13);

  uint64_t canWrapToNextGroup = objc_msgSend_canWrapToNextGroup(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, canWrapToNextGroup, @"canWrapToNextGroup", v21, v22);
  uint64_t v28 = objc_msgSend_layoutDirection(self, v23, v24, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, @"layoutDirection", v30, v31);
  v37 = objc_msgSend_subregions(self, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"subregions", v39, v40);

  v46 = objc_msgSend_text(self, v41, v42, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v46, @"text", v48, v49);

  uint64_t v55 = objc_msgSend_textRegionType(self, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInteger_forKey_(v4, v56, v55, @"textRegionType", v57, v58);
  objc_msgSend_uuid(self, v59, v60, v61, v62, v63);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v64, (uint64_t)v67, @"uuid", v65, v66);
}

- (CHLineWrappableGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CHLineWrappableGroup;
  uint64_t v9 = [(CHLineWrappableGroup *)&v43 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_decodeObjectForKey_(v4, v5, @"boundingQuad", v6, v7, v8);
    boundingQuad = v9->_boundingQuad;
    v9->_boundingQuad = (CRNormalizedQuad *)v10;

    v9->_uint64_t canWrapToNextGroup = objc_msgSend_decodeBoolForKey_(v4, v12, @"canWrapToNextGroup", v13, v14, v15);
    v9->_layoutDirection = objc_msgSend_decodeIntegerForKey_(v4, v16, @"layoutDirection", v17, v18, v19);
    uint64_t v20 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, @"subregions", v22, v23);
    subregions = v9->_subregions;
    v9->_subregions = (NSArray *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"text", v28, v29);
    text = v9->_text;
    v9->_text = (NSString *)v30;

    v9->_textRegionType = objc_msgSend_decodeIntegerForKey_(v4, v32, @"textRegionType", v33, v34, v35);
    uint64_t v36 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"uuid", v38, v39);
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v40;
  }
  return v9;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end