@interface DMCEnrollmentConfirmationView
- (BOOL)inProgress;
- (BOOL)isConfirmationButtonEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DMCEnrollmentConfirmationView)initWithConfirmationText:(id)a3 cancelText:(id)a4 confirmationAction:(id)a5 cancelAction:(id)a6;
- (NSString)confirmationText;
- (OBBoldTrayButton)confirmationButton;
- (UIButton)cancelButton;
- (id)cancelAction;
- (id)confirmationAction;
- (void)cancelButtonTapped:(id)a3;
- (void)confirmationButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setCancelAction:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setConfirmationAction:(id)a3;
- (void)setConfirmationButton:(id)a3;
- (void)setConfirmationButtonEnabled:(BOOL)a3;
- (void)setConfirmationText:(id)a3;
- (void)setInProgress:(BOOL)a3;
@end

@implementation DMCEnrollmentConfirmationView

- (DMCEnrollmentConfirmationView)initWithConfirmationText:(id)a3 cancelText:(id)a4 confirmationAction:(id)a5 cancelAction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = -[DMCEnrollmentConfirmationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x263F5B898] boldButton];
    confirmationButton = v15->_confirmationButton;
    v15->_confirmationButton = (OBBoldTrayButton *)v16;

    [(OBBoldTrayButton *)v15->_confirmationButton setTitle:v11 forState:0];
    v18 = v15->_confirmationButton;
    v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11];
    [(OBBoldTrayButton *)v18 setAttributedTitle:v19 forState:2];

    [(OBBoldTrayButton *)v15->_confirmationButton setTranslatesAutoresizingMaskIntoConstraints:1];
    [(OBBoldTrayButton *)v15->_confirmationButton addTarget:v15 action:sel_confirmationButtonTapped_ forControlEvents:64];
    [(DMCEnrollmentConfirmationView *)v15 addSubview:v15->_confirmationButton];
    if (v12 && v14)
    {
      uint64_t v20 = [MEMORY[0x263F5B8D0] linkButton];
      cancelButton = v15->_cancelButton;
      v15->_cancelButton = (UIButton *)v20;

      [(UIButton *)v15->_cancelButton setTitle:v12 forState:0];
      [(UIButton *)v15->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:1];
      [(UIButton *)v15->_cancelButton addTarget:v15 action:sel_cancelButtonTapped_ forControlEvents:64];
      [(DMCEnrollmentConfirmationView *)v15 addSubview:v15->_cancelButton];
    }
    objc_storeStrong((id *)&v15->_confirmationText, a3);
    uint64_t v22 = MEMORY[0x223C90320](v13);
    id confirmationAction = v15->_confirmationAction;
    v15->_id confirmationAction = (id)v22;

    uint64_t v24 = MEMORY[0x223C90320](v14);
    id cancelAction = v15->_cancelAction;
    v15->_id cancelAction = (id)v24;

    v15->_confirmationButtonEnabled = 1;
  }

  return v15;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)DMCEnrollmentConfirmationView;
  [(DMCEnrollmentConfirmationView *)&v18 layoutSubviews];
  uint64_t v3 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
  [(id)v3 intrinsicContentSize];
  double v5 = v4;

  LOBYTE(v3) = [MEMORY[0x263F38B98] isPad];
  [(DMCEnrollmentConfirmationView *)self bounds];
  double Width = CGRectGetWidth(v19);
  if (v3)
  {
    double v7 = (Width + -360.0) * 0.5;
    v8 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
    double v9 = 360.0;
  }
  else
  {
    double v9 = Width + -10.0;
    v8 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
    double v7 = 5.0;
  }
  objc_msgSend(v8, "setFrame:", v7, 0.0, v9, v5);

  v10 = [(DMCEnrollmentConfirmationView *)self cancelButton];

  if (v10)
  {
    id v11 = [(DMCEnrollmentConfirmationView *)self cancelButton];
    [v11 intrinsicContentSize];
    double v13 = v12;

    id v14 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
    [v14 frame];
    CGFloat v15 = CGRectGetMaxY(v20) + 3.0;
    [(DMCEnrollmentConfirmationView *)self bounds];
    CGFloat v16 = CGRectGetWidth(v21) + -10.0;
    v17 = [(DMCEnrollmentConfirmationView *)self cancelButton];
    objc_msgSend(v17, "setFrame:", 5.0, v15, v16, v13);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
  [v5 intrinsicContentSize];
  double v7 = v6;

  v8 = [(DMCEnrollmentConfirmationView *)self cancelButton];

  if (v8)
  {
    double v9 = [(DMCEnrollmentConfirmationView *)self cancelButton];
    [v9 intrinsicContentSize];
    double v11 = v10;

    double v12 = v11 + 3.0;
  }
  else
  {
    double v12 = 0.0;
  }
  double v13 = v7 + v12;
  double v14 = width;
  result.height = v13;
  result.CGFloat width = v14;
  return result;
}

- (void)confirmationButtonTapped:(id)a3
{
  double v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    -[DMCEnrollmentConfirmationView confirmationButtonTapped:]();
  }
  double v5 = [(DMCEnrollmentConfirmationView *)self confirmationAction];
  v5[2]();
}

- (void)cancelButtonTapped:(id)a3
{
  double v4 = (os_log_t *)DMCLogObjects();
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
    -[DMCEnrollmentConfirmationView cancelButtonTapped:]();
  }
  double v5 = [(DMCEnrollmentConfirmationView *)self cancelAction];
  v5[2]();
}

- (void)setInProgress:(BOOL)a3
{
  if (self->_inProgress != a3)
  {
    self->_inProgress = a3;
    if (a3)
    {
      confirmationButton = self->_confirmationButton;
      double v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
      [(OBBoldTrayButton *)confirmationButton setAttributedTitle:v5 forState:2];

      double v6 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
      [v6 showsBusyIndicator];

      id v10 = [(DMCEnrollmentConfirmationView *)self cancelButton];
      [v10 setEnabled:0];
    }
    else
    {
      double v7 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
      [v7 hidesBusyIndicator];

      v8 = [(DMCEnrollmentConfirmationView *)self cancelButton];
      [v8 setEnabled:1];

      double v9 = self->_confirmationButton;
      id v10 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:self->_confirmationText];
      -[OBBoldTrayButton setAttributedTitle:forState:](v9, "setAttributedTitle:forState:");
    }
  }
}

- (void)setConfirmationButtonEnabled:(BOOL)a3
{
  if (self->_confirmationButtonEnabled != a3)
  {
    BOOL v3 = a3;
    self->_confirmationButtonEnabled = a3;
    id v4 = [(DMCEnrollmentConfirmationView *)self confirmationButton];
    [v4 setEnabled:v3];
  }
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (BOOL)isConfirmationButtonEnabled
{
  return self->_confirmationButtonEnabled;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (void)setConfirmationText:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (id)confirmationAction
{
  return self->_confirmationAction;
}

- (void)setConfirmationAction:(id)a3
{
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (OBBoldTrayButton)confirmationButton
{
  return self->_confirmationButton;
}

- (void)setConfirmationButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationButton, 0);
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong(&self->_confirmationAction, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
}

- (void)confirmationButtonTapped:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "/Library/Caches/com.apple.xbs/Sources/DeviceManagementClientTools/DeviceManagementClientTools/DMC Enrollment Prov"
       "ider/DMC UI Utilities/Views/Functional Views/DMCEnrollmentConfirmationView.m";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = 116;
  _os_log_debug_impl(&dword_221CC5000, v0, OS_LOG_TYPE_DEBUG, "<%s %s:%lu>", v1, 0x20u);
}

- (void)cancelButtonTapped:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = "/Library/Caches/com.apple.xbs/Sources/DeviceManagementClientTools/DeviceManagementClientTools/DMC Enrollment Prov"
       "ider/DMC UI Utilities/Views/Functional Views/DMCEnrollmentConfirmationView.m";
  __int16 v3 = 2080;
  OUTLINED_FUNCTION_0();
  uint64_t v4 = 121;
  _os_log_debug_impl(&dword_221CC5000, v0, OS_LOG_TYPE_DEBUG, "<%s %s:%lu>", v1, 0x20u);
}

@end