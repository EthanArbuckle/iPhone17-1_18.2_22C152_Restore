@interface GDSourceListenerConfigIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGDSourceListenerConfigIdentifier:(id)a3;
- (GDSourceListenerConfigIdentifier)initWithCoder:(id)a3;
- (GDSourceListenerConfigIdentifier)initWithView:(id)a3 sourceType:(id)a4 index:(int)a5 updateType:(id)a6 sourceIdentifier:(id)a7;
- (NSString)sourceIdentifier;
- (NSString)sourceType;
- (NSString)updateType;
- (NSString)view;
- (id)description;
- (int)index;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDSourceListenerConfigIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_updateType, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

- (void)encodeWithCoder:(id)a3
{
  view = self->_view;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_view);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)view, (uint64_t)v6, v8);

  sourceType = self->_sourceType;
  v10 = NSStringFromSelector(sel_sourceType);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)sourceType, (uint64_t)v10, v12);

  uint64_t index = self->_index;
  v14 = NSStringFromSelector(sel_index);
  objc_msgSend_encodeInt_forKey_(v5, v15, index, (uint64_t)v14, v16);

  updateType = self->_updateType;
  v18 = NSStringFromSelector(sel_updateType);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)updateType, (uint64_t)v18, v20);

  sourceIdentifier = self->_sourceIdentifier;
  NSStringFromSelector(sel_sourceIdentifier);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)sourceIdentifier, (uint64_t)v24, v23);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GDSourceListenerConfigIdentifier *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToGDSourceListenerConfigIdentifier = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToGDSourceListenerConfigIdentifier = objc_msgSend_isEqualToGDSourceListenerConfigIdentifier_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToGDSourceListenerConfigIdentifier = 0;
  }

  return isEqualToGDSourceListenerConfigIdentifier;
}

- (BOOL)isEqualToGDSourceListenerConfigIdentifier:(id)a3
{
  v4 = (id *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  view = self->_view;
  uint64_t v7 = (NSString *)v4[2];
  if (view == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    v9 = view;
    char isEqual = objc_msgSend_isEqual_(v9, v10, (uint64_t)v8, v11, v12);

    if ((isEqual & 1) == 0) {
      goto LABEL_16;
    }
  }
  sourceType = self->_sourceType;
  v15 = (NSString *)v5[3];
  if (sourceType == v15)
  {
  }
  else
  {
    uint64_t v16 = v15;
    v17 = sourceType;
    char v21 = objc_msgSend_isEqual_(v17, v18, (uint64_t)v16, v19, v20);

    if ((v21 & 1) == 0) {
      goto LABEL_16;
    }
  }
  sourceIdentifier = self->_sourceIdentifier;
  uint64_t v23 = (NSString *)v5[5];
  if (sourceIdentifier == v23)
  {
  }
  else
  {
    id v24 = v23;
    v25 = sourceIdentifier;
    char v29 = objc_msgSend_isEqual_(v25, v26, (uint64_t)v24, v27, v28);

    if ((v29 & 1) == 0) {
      goto LABEL_16;
    }
  }
  updateType = self->_updateType;
  v31 = (NSString *)v5[4];
  if (updateType == v31)
  {

    goto LABEL_19;
  }
  v32 = v31;
  v33 = updateType;
  char v37 = objc_msgSend_isEqual_(v33, v34, (uint64_t)v32, v35, v36);

  if (v37)
  {
LABEL_19:
    BOOL v42 = objc_msgSend_index(v5, v38, v39, v40, v41) == self->_index;
    goto LABEL_17;
  }
LABEL_16:
  BOOL v42 = 0;
LABEL_17:

  return v42;
}

- (int)index
{
  return self->_index;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v7 = objc_msgSend_initWithFormat_(v3, v4, @"<GDSourceListenerConfigIdentifier v: %@, s: %@, u: %@ idx: %tu, sId: \"%@\">", v5, v6, self->_view, self->_sourceType, self->_updateType, self->_index, self->_sourceIdentifier);

  return v7;
}

- (GDSourceListenerConfigIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_view);
  v9 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, (uint64_t)v7, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

  if (v9
    && (objc_msgSend_error(v4, v10, v11, v12, v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_sourceType);
    uint64_t v20 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v16, v19, v17, (uint64_t)v18, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

    if (!v20) {
      goto LABEL_7;
    }
    v25 = objc_msgSend_error(v4, v21, v22, v23, v24);

    if (v25
      || (NSStringFromSelector(sel_index),
          v26 = objc_claimAutoreleasedReturnValue(),
          uint64_t v30 = objc_msgSend_decodeIntForKey_(v4, v27, (uint64_t)v26, v28, v29),
          v26,
          objc_msgSend_error(v4, v31, v32, v33, v34),
          uint64_t v35 = objc_claimAutoreleasedReturnValue(),
          v35,
          v35))
    {
LABEL_7:
      v15 = 0;
    }
    else
    {
      char v37 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = NSStringFromSelector(sel_updateType);
      uint64_t v41 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v37, v40, v38, (uint64_t)v39, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

      if (v41
        && (objc_msgSend_error(v4, v42, v43, v44, v45),
            v46 = objc_claimAutoreleasedReturnValue(),
            v46,
            !v46))
      {
        v47 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v48 = objc_opt_class();
        v49 = NSStringFromSelector(sel_sourceIdentifier);
        v51 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v47, v50, v48, (uint64_t)v49, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

        if (v51
          && (objc_msgSend_error(v4, v52, v53, v54, v55),
              v56 = objc_claimAutoreleasedReturnValue(),
              v56,
              !v56))
        {
          self = (GDSourceListenerConfigIdentifier *)(id)objc_msgSend_initWithView_sourceType_index_updateType_sourceIdentifier_(self, v57, (uint64_t)v9, (uint64_t)v20, v30, v41, v51);
          v15 = self;
        }
        else
        {
          v15 = 0;
        }
      }
      else
      {
        v15 = 0;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (GDSourceListenerConfigIdentifier)initWithView:(id)a3 sourceType:(id)a4 index:(int)a5 updateType:(id)a6 sourceIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)GDSourceListenerConfigIdentifier;
  uint64_t v20 = [(GDSourceListenerConfigIdentifier *)&v42 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v12, v16, v17, v18, v19);
    view = v20->_view;
    v20->_view = (NSString *)v21;

    uint64_t v27 = objc_msgSend_copy(v13, v23, v24, v25, v26);
    sourceType = v20->_sourceType;
    v20->_sourceType = (NSString *)v27;

    v20->_uint64_t index = a5;
    uint64_t v33 = objc_msgSend_copy(v14, v29, v30, v31, v32);
    updateType = v20->_updateType;
    v20->_updateType = (NSString *)v33;

    uint64_t v39 = objc_msgSend_copy(v15, v35, v36, v37, v38);
    sourceIdentifier = v20->_sourceIdentifier;
    v20->_sourceIdentifier = (NSString *)v39;
  }
  return v20;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_view, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_sourceType, v7, v8, v9, v10) - v6 + 32 * v6;
  uint64_t v16 = objc_msgSend_hash(self->_sourceIdentifier, v12, v13, v14, v15) - v11 + 32 * v11;
  uint64_t v21 = objc_msgSend_hash(self->_updateType, v17, v18, v19, v20);
  return self->_index - (v21 - v16 + 32 * v16) + 32 * (v21 - v16 + 32 * v16);
}

- (NSString)view
{
  return self->_view;
}

- (NSString)sourceType
{
  return self->_sourceType;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)updateType
{
  return self->_updateType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end