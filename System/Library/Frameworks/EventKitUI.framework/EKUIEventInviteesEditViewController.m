@interface EKUIEventInviteesEditViewController
- (EKUIEventInviteesEditViewController)initWithEvent:(id)a3;
- (NSDate)selectedEndDate;
- (NSDate)selectedStartDate;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EKUIEventInviteesEditViewController

- (EKUIEventInviteesEditViewController)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIEventInviteesEditViewController;
  v6 = [(EKUIEventInviteesEditViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (void)loadView
{
  v3 = [[EKUIEventInviteesViewController alloc] initWithEvent:self->_event fromDetail:0 model:0];
  [(EKUIEventInviteesViewController *)v3 setParentController:self];
  [(EKUIEventInviteesViewController *)v3 setUsesCustomToolbar:1];
  if ([(EKEvent *)self->_event isNew]) {
    [(EKUIEventInviteesViewController *)v3 setUsesRaisedCustomToolbar:1];
  }
  [(EKUIEventInviteesViewController *)v3 setHidesManagedAttendeesSection:1];
  v4 = [(EKUIEventInviteesViewController *)v3 title];
  [(EKUIEventInviteesEditViewController *)self setTitle:v4];

  [(EKUIEventInviteesEditViewController *)self addChildViewController:v3];
  id v8 = [(EKUIEventInviteesViewController *)v3 view];
  [v8 setAutoresizingMask:18];
  id v5 = [EKUIInviteesEditView alloc];
  v6 = -[EKUIInviteesEditView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(EKUIInviteesEditView *)v6 setAutoresizingMask:18];
  [(EKUIInviteesEditView *)v6 addSubview:v8];
  controller = self->_controller;
  self->_controller = v3;

  [(EKUIEventInviteesEditViewController *)self setView:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKUIEventInviteesViewController *)self->_controller didMoveToParentViewController:self];
  v5.receiver = self;
  v5.super_class = (Class)EKUIEventInviteesEditViewController;
  [(EKUIEventInviteesEditViewController *)&v5 viewDidAppear:v3];
}

- (NSDate)selectedStartDate
{
  return [(EKUIEventInviteesViewController *)self->_controller selectedStartDate];
}

- (NSDate)selectedEndDate
{
  return [(EKUIEventInviteesViewController *)self->_controller selectedEndDate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end