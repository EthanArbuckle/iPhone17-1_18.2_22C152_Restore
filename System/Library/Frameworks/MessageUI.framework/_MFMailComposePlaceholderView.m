@interface _MFMailComposePlaceholderView
- (_MFMailComposePlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSubject:(id)a3;
@end

@implementation _MFMailComposePlaceholderView

- (_MFMailComposePlaceholderView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)_MFMailComposePlaceholderView;
  v3 = -[_MFMailComposePlaceholderView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_MFMailComposePlaceholderView *)v3 setAutoresizingMask:18];
    v5 = [MEMORY[0x1E4FB1618] mailGeneralBackgroundColor];
    [(_MFMailComposePlaceholderView *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 bounds];
    double v8 = v7;
    +[MFMailComposeView preferredHeaderHeight];
    double v10 = v9;

    v11 = [MFMailComposeHeaderView alloc];
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    uint64_t v14 = -[MFMailComposeHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DAD8], v13, v8, v10);
    toField = v4->_toField;
    v4->_toField = (MFMailComposeHeaderView *)v14;

    v16 = -[MFMailComposeHeaderView initWithFrame:]([MFMailComposeHeaderView alloc], "initWithFrame:", v12, v13, v8, v10);
    multiView = v4->_multiView;
    v4->_multiView = v16;

    v18 = -[MFComposeSubjectView initWithFrame:]([MFComposeSubjectView alloc], "initWithFrame:", v12, v13, v8, v10);
    subjectView = v4->_subjectView;
    v4->_subjectView = v18;

    v20 = v4->_toField;
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"TO" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeHeaderView *)v20 setLabel:v22];

    v23 = v4->_multiView;
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"CC/BCC" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeHeaderView *)v23 setLabel:v25];

    v26 = [(MFComposeSubjectView *)v4->_subjectView textView];
    [v26 setUserInteractionEnabled:0];

    [(_MFMailComposePlaceholderView *)v4 addSubview:v4->_toField];
    [(_MFMailComposePlaceholderView *)v4 addSubview:v4->_multiView];
    [(_MFMailComposePlaceholderView *)v4 addSubview:v4->_subjectView];
  }
  return v4;
}

- (void)setSubject:(id)a3
{
}

- (void)layoutSubviews
{
  +[MFMailComposeView preferredHeaderHeight];
  double v4 = v3;
  [(_MFMailComposePlaceholderView *)self bounds];
  double v6 = v5;
  -[MFMailComposeHeaderView setFrame:](self->_toField, "setFrame:", 0.0, 0.0);
  -[MFMailComposeHeaderView setFrame:](self->_multiView, "setFrame:", 0.0, v4 + 0.0, v6, v4);
  subjectView = self->_subjectView;

  -[MFComposeSubjectView setFrame:](subjectView, "setFrame:", 0.0, v4 + v4 + 0.0, v6, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_multiView, 0);

  objc_storeStrong((id *)&self->_toField, 0);
}

@end