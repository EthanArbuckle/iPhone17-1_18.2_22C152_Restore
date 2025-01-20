@interface EKEventReportJunkView
- (BOOL)isLargeDayView;
- (EKEventReportJunkView)initWithViewController:(id)a3;
- (void)didMoveToSuperview;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)tapped:(id)a3;
- (void)updateActionText;
@end

@implementation EKEventReportJunkView

- (EKEventReportJunkView)initWithViewController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKEventReportJunkView;
  v6 = -[EKEventReportJunkView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v8 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(EKEventReportJunkView *)v7 setBackgroundColor:v8];

    uint64_t v9 = objc_opt_new();
    control = v7->_control;
    v7->_control = (EKEventDetailsHighlightControl *)v9;

    [(EKEventDetailsHighlightControl *)v7->_control setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKEventDetailsHighlightControl *)v7->_control setEnabled:0];
    LODWORD(v11) = 1148846080;
    [(EKEventDetailsHighlightControl *)v7->_control setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(EKEventReportJunkView *)v7 setContentCompressionResistancePriority:1 forAxis:v12];
    [(EKEventReportJunkView *)v7 addSubview:v7->_control];
    v13 = _NSDictionaryOfVariableBindings(&cfstr_Control.isa, v7->_control, 0);
    v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_control]-(16)-|" options:0 metrics:0 views:v13];
    [(EKEventReportJunkView *)v7 addConstraints:v14];

    v15 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_control]|" options:0 metrics:0 views:v13];
    [(EKEventReportJunkView *)v7 addConstraints:v15];

    v16 = v7->_control;
    v17 = EventKitUIBundle();
    v18 = [v17 localizedStringForKey:@"This invitation is from an unknown contact." value:&stru_1F0CC2140 table:0];
    [(EKEventDetailsHighlightControl *)v16 setTitleText:v18];

    [(EKEventReportJunkView *)v7 updateActionText];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v7 action:sel_tapped_];
    [v19 setNumberOfTapsRequired:1];
    [(EKEventReportJunkView *)v7 addGestureRecognizer:v19];
  }
  return v7;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventReportJunkView;
  [(EKEventReportJunkView *)&v3 didMoveToSuperview];
  [(EKEventReportJunkView *)self updateActionText];
}

- (void)updateActionText
{
  control = self->_control;
  EventKitUIBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v6 localizedStringForKey:@"Report Junk…" value:&stru_1F0CC2140 table:0];
  id v5 = [(EKEventReportJunkView *)self tintColor];
  [(EKEventDetailsHighlightControl *)control setActionText:v4 color:v5];
}

- (void)tapped:(id)a3
{
  BOOL v4 = [(EKEventReportJunkView *)self isLargeDayView];
  id v5 = [(EKEventViewController *)self->_controller event];
  controller = self->_controller;
  id v7 = v5;
  if (v4) {
    PresentJunkAlertDialogForEvent(v5, controller);
  }
  else {
    PresentJunkAlertControllerForEvent(v5, controller);
  }
}

- (BOOL)isLargeDayView
{
  return self->_isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->_isLargeDayView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_control, 0);
}

@end