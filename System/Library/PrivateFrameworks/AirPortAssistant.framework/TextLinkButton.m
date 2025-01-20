@interface TextLinkButton
- (NSString)urlString;
- (TextLinkButton)initWithCoder:(id)a3;
- (TextLinkButton)initWithFrame:(CGRect)a3;
- (TextLinkButtonDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setUrlString:(id)a3;
- (void)tapAction:(id)a3;
@end

@implementation TextLinkButton

- (TextLinkButton)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)TextLinkButton;
  v3 = -[TextLinkButton initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    objc_msgSend_addTarget_action_forControlEvents_(v3, v4, (uint64_t)v3, sel_tapAction_, 64);
    uint64_t v8 = objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v6, v7);
    objc_msgSend_setTitleColor_forState_(v5, v9, v8, 0);
    v12 = objc_msgSend_titleLabel(v5, v10, v11);
    objc_msgSend_setTextAlignment_(v12, v13, 1);
    v16 = objc_msgSend_titleLabel(v5, v14, v15);
    uint64_t v19 = objc_msgSend_boldSystemFontOfSize_(MEMORY[0x263F1C658], v17, v18, 14.0);
    objc_msgSend_setFont_(v16, v20, v19);
    v23 = objc_msgSend_titleLabel(v5, v21, v22);
    objc_msgSend_setLineBreakMode_(v23, v24, 0);
    v27 = objc_msgSend_titleLabel(v5, v25, v26);
    uint64_t v30 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v28, v29);
    objc_msgSend_setBackgroundColor_(v27, v31, v30);
  }
  return v5;
}

- (TextLinkButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TextLinkButton;
  v3 = [(TextLinkButton *)&v7 initWithCoder:a3];
  v5 = v3;
  if (v3) {
    objc_msgSend_addTarget_action_forControlEvents_(v3, v4, (uint64_t)v3, sel_tapAction_, 64);
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend_setUrlString_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)TextLinkButton;
  [(TextLinkButton *)&v3 dealloc];
}

- (void)tapAction:(id)a3
{
  v4 = objc_msgSend_urlString(self, a2, (uint64_t)a3);
  if (objc_msgSend_length(v4, v5, v6))
  {
    v9 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v7, v8);
    v10 = NSURL;
    uint64_t v13 = objc_msgSend_urlString(self, v11, v12);
    uint64_t v15 = objc_msgSend_URLWithString_(v10, v14, v13);
    if (objc_msgSend_canOpenURL_(v9, v16, v15))
    {
      objc_msgSend_dictionary(NSDictionary, v17, v18);
      MEMORY[0x270F9A6D0](v9, sel_openURL_options_completionHandler_, v15);
    }
  }
  else if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    MEMORY[0x270F9A6D0](delegate, sel_handleTextLinkTap, v19);
  }
}

- (TextLinkButtonDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TextLinkButtonDelegate *)a3;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

@end