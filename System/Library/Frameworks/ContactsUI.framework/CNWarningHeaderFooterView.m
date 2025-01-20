@interface CNWarningHeaderFooterView
+ (id)exclamationMark;
- (BOOL)shouldDisplayWarningIcon;
- (NSString)warningText;
- (id)warningAttributedText;
- (void)setShouldDisplayWarningIcon:(BOOL)a3;
- (void)setWarningText:(id)a3;
@end

@implementation CNWarningHeaderFooterView

+ (id)exclamationMark
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v3 = (void *)MEMORY[0x1E4FB1818];
  v4 = [MEMORY[0x1E4FB1618] redColor];
  v5 = objc_msgSend(v3, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"exclamationmark.circle", 1, v4, 0);
  [v2 setImage:v5];

  return v2;
}

- (void).cxx_destruct
{
}

- (NSString)warningText
{
  return self->_warningText;
}

- (void)setShouldDisplayWarningIcon:(BOOL)a3
{
  self->_shouldDisplayWarningIcon = a3;
}

- (BOOL)shouldDisplayWarningIcon
{
  return self->_shouldDisplayWarningIcon;
}

- (void)setWarningText:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_warningText] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_warningText, a3);
    v5 = [(CNWarningHeaderFooterView *)self warningAttributedText];
    [(CNContactTableViewHeaderFooterView *)self setAttributedString:v5];
  }
}

- (id)warningAttributedText
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4FB0700];
  v3 = +[CNUIColorRepository contactStyleDefaultDisabledTextColor];
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E4FB06F8];
  v4 = +[CNUIFontRepository contactCardWarningHeaderLabelFont];
  v17[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  if ([(CNWarningHeaderFooterView *)self shouldDisplayWarningIcon])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v7 = (void *)MEMORY[0x1E4F28B18];
    v8 = [(id)objc_opt_class() exclamationMark];
    v9 = [v7 attributedStringWithAttachment:v8];
    [v6 appendAttributedString:v9];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v5];
    [v6 appendAttributedString:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = [(CNWarningHeaderFooterView *)self warningText];
    v13 = (void *)[v11 initWithString:v12 attributes:v5];
    [v6 appendAttributedString:v13];
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = [(CNWarningHeaderFooterView *)self warningText];
    id v6 = (id)[v14 initWithString:v12 attributes:v5];
  }

  return v6;
}

@end