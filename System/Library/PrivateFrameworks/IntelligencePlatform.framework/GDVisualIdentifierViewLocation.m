@interface GDVisualIdentifierViewLocation
- (NSString)label;
- (id)description;
- (void)setLabel:(id)a3;
@end

@implementation GDVisualIdentifierViewLocation

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  v16 = objc_msgSend_names(self, v8, v9, v10, v11);
  v17 = &stru_1F0AE2ED0;
  if (v16)
  {
    v55 = objc_msgSend_names(self, v12, v13, v14, v15);
    objc_msgSend_componentsJoinedByString_(v55, v18, @"|", v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_1F0AE2ED0;
  }
  uint64_t v22 = objc_msgSend_label(self, v12, v13, v14, v15);
  v27 = (void *)v22;
  if (v22) {
    v17 = (__CFString *)v22;
  }
  v28 = objc_msgSend_addresses(self, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_count(v28, v29, v30, v31, v32);
  v38 = objc_msgSend_addresses(self, v34, v35, v36, v37);
  v43 = v38;
  if (v33 == 1)
  {
    uint64_t v44 = objc_msgSend_firstObject(v38, v39, v40, v41, v42);
LABEL_10:
    v52 = (void *)v44;
    v53 = objc_msgSend_stringWithFormat_(v6, v45, @"<GDVisualIdentifierViewLocation id:%@ n:%@ l:%@ a:%@>", v46, v47, v7, v21, v17, v44);

    goto LABEL_12;
  }
  if (objc_msgSend_count(v38, v39, v40, v41, v42))
  {
    uint64_t v44 = objc_msgSend_addresses(self, v48, v49, v50, v51);
    goto LABEL_10;
  }
  v53 = objc_msgSend_stringWithFormat_(v6, v48, @"<GDVisualIdentifierViewLocation id:%@ n:%@ l:%@ a:%@>", v50, v51, v7, v21, v17, &stru_1F0AE2ED0);
LABEL_12:

  if (v16)
  {
  }

  return v53;
}

@end