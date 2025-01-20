@interface CHLineWrappableLine
+ (BOOL)supportsSecureCoding;
- (CHLineWrappableLine)initWithCoder:(id)a3;
- (CHLineWrappableLine)initWithQuad:(id)a3 text:(id)a4 locale:(id)a5;
- (CRNormalizedQuad)boundingQuad;
- (NSLocale)locale;
- (NSString)text;
- (NSUUID)uuid;
- (unint64_t)layoutDirection;
- (unint64_t)lineWrappingType;
- (unint64_t)textRegionType;
- (void)encodeWithCoder:(id)a3;
- (void)setLineWrappingType:(unint64_t)a3;
@end

@implementation CHLineWrappableLine

- (CHLineWrappableLine)initWithQuad:(id)a3 text:(id)a4 locale:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CHLineWrappableLine;
  v12 = [(CHLineWrappableLine *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_boundingQuad, a3);
    *(_OWORD *)&v13->_layoutDirection = xmmword_1C4C39D70;
    objc_storeStrong((id *)&v13->_locale, a5);
    objc_storeStrong((id *)&v13->_text, a4);
    v13->_textRegionType = 2;
    uint64_t v19 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v14, v15, v16, v17, v18);
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v19;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v10 = objc_msgSend_boundingQuad(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, @"boundingQuad", v12, v13);

  uint64_t v19 = objc_msgSend_layoutDirection(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeInteger_forKey_(v4, v20, v19, @"layoutDirection", v21, v22);
  uint64_t v28 = objc_msgSend_lineWrappingType(self, v23, v24, v25, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v4, v29, v28, @"lineWrappingType", v30, v31);
  v37 = objc_msgSend_locale(self, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"locale", v39, v40);

  v46 = objc_msgSend_text(self, v41, v42, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v46, @"text", v48, v49);

  uint64_t v55 = objc_msgSend_textRegionType(self, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInteger_forKey_(v4, v56, v55, @"textRegionType", v57, v58);
  objc_msgSend_uuid(self, v59, v60, v61, v62, v63);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v64, (uint64_t)v67, @"uuid", v65, v66);
}

- (CHLineWrappableLine)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CHLineWrappableLine;
  v5 = [(CHLineWrappableLine *)&v43 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"boundingQuad", v8, v9);
    boundingQuad = v5->_boundingQuad;
    v5->_boundingQuad = (CRNormalizedQuad *)v10;

    v5->_layoutDirection = objc_msgSend_decodeIntegerForKey_(v4, v12, @"layoutDirection", v13, v14, v15);
    v5->_lineWrappingType = objc_msgSend_decodeIntegerForKey_(v4, v16, @"lineWrappingType", v17, v18, v19);
    uint64_t v20 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"locale", v22, v23);
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"text", v28, v29);
    text = v5->_text;
    v5->_text = (NSString *)v30;

    v5->_textRegionType = objc_msgSend_decodeIntegerForKey_(v4, v32, @"textRegionType", v33, v34, v35);
    uint64_t v36 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"uuid", v38, v39);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v40;
  }
  return v5;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unint64_t)lineWrappingType
{
  return self->_lineWrappingType;
}

- (void)setLineWrappingType:(unint64_t)a3
{
  self->_lineWrappingType = a3;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 32, 1);
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
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end