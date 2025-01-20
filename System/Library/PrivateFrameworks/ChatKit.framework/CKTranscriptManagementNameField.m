@interface CKTranscriptManagementNameField
+ (double)preferredHeight;
- (BOOL)isEnabled;
- (BOOL)isOverlay;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CKTranscriptManagementNameField)initWithFrame:(CGRect)a3;
- (CKTranscriptManagementNameFieldDelegate)delegate;
- (NSString)groupName;
- (UILabel)fieldLabel;
- (UITextField)textField;
- (UIView)bottomSeparator;
- (UIView)topSeparator;
- (_UIBackdropView)backdropView;
- (void)commitGroupName;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setBottomSeparator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFieldLabel:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIsOverlay:(BOOL)a3;
- (void)setTextField:(id)a3;
- (void)setTopSeparator:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation CKTranscriptManagementNameField

+ (double)preferredHeight
{
  return 44.0;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptManagementNameField;
  [(CKTranscriptManagementNameField *)&v3 dealloc];
}

- (CKTranscriptManagementNameField)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)CKTranscriptManagementNameField;
  objc_super v3 = -[CKTranscriptManagementNameField initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKTranscriptManagementNameField *)v3 setEnabled:1];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2010];
    [(CKTranscriptManagementNameField *)v4 setBackdropView:v5];
    [(CKTranscriptManagementNameField *)v4 addSubview:v5];
    id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    v12 = +[CKUIBehavior sharedBehaviors];
    v13 = [v12 nameFieldFont];
    [v11 setFont:v13];

    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [v11 setBackgroundColor:v14];

    v15 = [MEMORY[0x1E4F428B8] darkGrayColor];
    [v11 setTextColor:v15];

    v16 = CKFrameworkBundle();
    v17 = [v16 localizedStringForKey:@"GROUP_NAME_LABEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v11 setText:v17];

    [(CKTranscriptManagementNameField *)v4 addSubview:v11];
    [(CKTranscriptManagementNameField *)v4 setFieldLabel:v11];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F10]), "initWithFrame:", v7, v8, v9, v10);
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 nameFieldFont];
    [v18 setFont:v20];

    v21 = [MEMORY[0x1E4F428B8] clearColor];
    [v18 setBackgroundColor:v21];

    v22 = CKFrameworkBundle();
    v23 = [v22 localizedStringForKey:@"GROUP_NAME_PLACEHOLDER" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v18 setPlaceholder:v23];

    [v18 setReturnKeyType:9];
    [v18 setClearButtonMode:1];
    [v18 setDelegate:v4];
    [(CKTranscriptManagementNameField *)v4 addSubview:v18];
    [(CKTranscriptManagementNameField *)v4 setTextField:v18];
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
    v25 = +[CKUIBehavior sharedBehaviors];
    v26 = [v25 theme];
    v27 = [v26 recipientsDividerColor];
    [v24 setBackgroundColor:v27];

    [(CKTranscriptManagementNameField *)v4 setTopSeparator:v24];
    v28 = [(CKTranscriptManagementNameField *)v4 topSeparator];
    [(CKTranscriptManagementNameField *)v4 addSubview:v28];

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
    v30 = +[CKUIBehavior sharedBehaviors];
    v31 = [v30 theme];
    v32 = [v31 recipientsDividerColor];
    [v29 setBackgroundColor:v32];

    [(CKTranscriptManagementNameField *)v4 setBottomSeparator:v29];
    v33 = [(CKTranscriptManagementNameField *)v4 bottomSeparator];
    [(CKTranscriptManagementNameField *)v4 addSubview:v33];

    [(CKTranscriptManagementNameField *)v4 setBackgroundColor:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)CKTranscriptManagementNameField;
  [(CKTranscriptManagementNameField *)&v40 layoutSubviews];
  [(CKTranscriptManagementNameField *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = MEMORY[0x1E4F1DB28];
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  double v9 = [(CKTranscriptManagementNameField *)self fieldLabel];
  [(CKTranscriptManagementNameField *)self bounds];
  objc_msgSend(v9, "sizeThatFits:", v10, 1.79769313e308);
  double v12 = v11;

  v13 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v14 = [v13 userInterfaceLayoutDirection];

  if (v14)
  {
    CGFloat v15 = *(double *)(v7 + 8);
    [(CKTranscriptManagementNameField *)self bounds];
    double MaxX = CGRectGetMaxX(v41);
    v42.size.height = 44.0;
    v42.origin.x = v8;
    v42.origin.y = v15;
    v42.size.width = v12;
    double v17 = MaxX - CGRectGetWidth(v42) - v6;
  }
  else
  {
    double v17 = v4;
  }
  double v39 = v8;
  [(CKTranscriptManagementNameField *)self bounds];
  double v19 = v18 + -44.0 + -1.0;
  v20 = [(CKTranscriptManagementNameField *)self fieldLabel];
  objc_msgSend(v20, "setFrame:", v17, v19, v12, 44.0);

  if (v14)
  {
    [(CKTranscriptManagementNameField *)self bounds];
    double v22 = v21;
    [(CKTranscriptManagementNameField *)self bounds];
    double v23 = v4;
    double v25 = v24 - v6;
    v43.origin.x = v17;
    v43.origin.y = v19;
    v43.size.width = v12;
    v43.size.height = 44.0;
    double v26 = v25 - CGRectGetWidth(v43) + v23 * -2.0;
    double v27 = v6;
  }
  else
  {
    v44.origin.x = v17;
    v44.origin.y = v19;
    v44.size.width = v12;
    v44.size.height = 44.0;
    double v27 = CGRectGetMaxX(v44) + 5.0;
    [(CKTranscriptManagementNameField *)self bounds];
    double v22 = v28;
    [(CKTranscriptManagementNameField *)self bounds];
    double v26 = v29 - v27 - v6;
  }
  v30 = [(CKTranscriptManagementNameField *)self textField];
  objc_msgSend(v30, "setFrame:", v27, v22 + -44.0, v26, 44.0);

  [(CKTranscriptManagementNameField *)self bounds];
  double v32 = v31;
  if (CKPixelWidth_once_1 != -1) {
    dispatch_once(&CKPixelWidth_once_1, &__block_literal_global_21);
  }
  double v33 = *(double *)&CKPixelWidth_sPixel_1;
  [(CKTranscriptManagementNameField *)self bounds];
  double v35 = v34;
  if (CKPixelWidth_once_1 != -1) {
    dispatch_once(&CKPixelWidth_once_1, &__block_literal_global_21);
  }
  double v36 = v35 - *(double *)&CKPixelWidth_sPixel_1;
  v37 = [(CKTranscriptManagementNameField *)self bottomSeparator];
  objc_msgSend(v37, "setFrame:", v39, v36, v32, v33);

  v38 = [(CKTranscriptManagementNameField *)self topSeparator];
  objc_msgSend(v38, "setFrame:", v39, 0.0, v32, v33);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v6 = [(CKTranscriptManagementNameField *)self delegate];
  double v5 = [v4 text];

  [v6 nameField:self didCommitGroupName:v5];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[CKTranscriptManagementNameField setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    double v5 = [(CKTranscriptManagementNameField *)self textField];
    [v5 setUserInteractionEnabled:v3];

    LODWORD(v5) = [(CKTranscriptManagementNameField *)self isEnabled];
    id v6 = [(CKTranscriptManagementNameField *)self fieldLabel];
    if (v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] darkGrayColor];
      [v6 setTextColor:v7];

      id v10 = [(CKTranscriptManagementNameField *)self textField];
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else
    {
      CGFloat v8 = [MEMORY[0x1E4F428B8] lightGrayColor];
      [v6 setTextColor:v8];

      id v10 = [(CKTranscriptManagementNameField *)self textField];
      [MEMORY[0x1E4F428B8] lightGrayColor];
    double v9 = };
    [v10 setTextColor:v9];
  }
}

- (void)setIsOverlay:(BOOL)a3
{
  self->_isOverlay = a3;
  if (a3)
  {
    [(CKTranscriptManagementNameField *)self setBackgroundColor:0];
    id v4 = [(CKTranscriptManagementNameField *)self backdropView];
    [v4 setHidden:0];

    double v5 = [(CKTranscriptManagementNameField *)self bottomSeparator];
    [v5 setHidden:0];

    id v6 = [(CKTranscriptManagementNameField *)self topSeparator];
    id v11 = v6;
    uint64_t v7 = 1;
  }
  else
  {
    CGFloat v8 = [MEMORY[0x1E4F428B8] whiteColor];
    [(CKTranscriptManagementNameField *)self setBackgroundColor:v8];

    double v9 = [(CKTranscriptManagementNameField *)self backdropView];
    [v9 setHidden:1];

    id v10 = [(CKTranscriptManagementNameField *)self bottomSeparator];
    [v10 setHidden:1];

    id v6 = [(CKTranscriptManagementNameField *)self topSeparator];
    id v11 = v6;
    uint64_t v7 = 0;
  }
  [v6 setHidden:v7];
}

- (NSString)groupName
{
  v2 = [(CKTranscriptManagementNameField *)self textField];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTranscriptManagementNameField *)self textField];
  [v5 setText:v4];
}

- (void)commitGroupName
{
  id v2 = [(CKTranscriptManagementNameField *)self textField];
  [v2 resignFirstResponder];
}

- (CKTranscriptManagementNameFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptManagementNameFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UILabel)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setFieldLabel:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (UIView)topSeparator
{
  return self->_topSeparator;
}

- (void)setTopSeparator:(id)a3
{
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end