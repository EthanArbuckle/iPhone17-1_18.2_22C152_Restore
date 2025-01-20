@interface PCNativeElement
+ (BOOL)supportsSecureCoding;
- (APTapAction)tapAction;
- (NSString)accessibleCaption;
- (NSString)caption;
- (NSURL)actionURL;
- (PCNativeAsset)asset;
- (PCNativeButton)button;
- (PCNativeElement)initWithCoder:(id)a3;
- (PCNativeStyle)style;
- (int64_t)elementID;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibleCaption:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setAsset:(id)a3;
- (void)setButton:(id)a3;
- (void)setCaption:(id)a3;
- (void)setElementID:(int64_t)a3;
- (void)setStyle:(id)a3;
- (void)setTapAction:(id)a3;
@end

@implementation PCNativeElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v11 = (PCNativeElement *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"accessibleCaption", v14, v15, v16);
    accessibleCaption = v11->_accessibleCaption;
    v11->_accessibleCaption = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"actionURL", v21, v22, v23);
    actionURL = v11->_actionURL;
    v11->_actionURL = (NSURL *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"asset", v28, v29, v30);
    asset = v11->_asset;
    v11->_asset = (PCNativeAsset *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"button", v35, v36, v37);
    button = v11->_button;
    v11->_button = (PCNativeButton *)v38;

    uint64_t v40 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"caption", v42, v43, v44);
    caption = v11->_caption;
    v11->_caption = (NSString *)v45;

    v11->_elementID = (int)objc_msgSend_decodeIntForKey_(v4, v47, @"elementID", v48, v49, v50, v51);
    uint64_t v52 = objc_opt_class();
    uint64_t v57 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, @"style", v54, v55, v56);
    style = v11->_style;
    v11->_style = (PCNativeStyle *)v57;

    uint64_t v59 = objc_opt_class();
    uint64_t v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, @"tapAction", v61, v62, v63);
    tapAction = v11->_tapAction;
    v11->_tapAction = (APTapAction *)v64;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11 = objc_msgSend_accessibleCaption(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"accessibleCaption", v13, v14, v15);

  double v22 = objc_msgSend_actionURL(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"actionURL", v24, v25, v26);

  uint64_t v33 = objc_msgSend_asset(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"asset", v35, v36, v37);

  double v44 = objc_msgSend_button(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"button", v46, v47, v48);

  double v55 = objc_msgSend_caption(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"caption", v57, v58, v59);

  uint64_t v66 = objc_msgSend_elementID(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeInteger_forKey_(v4, v67, v66, @"elementID", v68, v69, v70);
  v77 = objc_msgSend_style(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"style", v79, v80, v81);

  objc_msgSend_tapAction(self, v82, v83, v84, v85, v86, v87);
  id v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v92, @"tapAction", v89, v90, v91);
}

- (NSString)accessibleCaption
{
  return self->_accessibleCaption;
}

- (void)setAccessibleCaption:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (PCNativeAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (PCNativeButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (int64_t)elementID
{
  return self->_elementID;
}

- (void)setElementID:(int64_t)a3
{
  self->_elementID = a3;
}

- (PCNativeStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (APTapAction)tapAction
{
  return self->_tapAction;
}

- (void)setTapAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapAction, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_accessibleCaption, 0);
}

@end