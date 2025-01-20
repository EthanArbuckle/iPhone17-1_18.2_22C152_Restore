@interface EKUIProposedTimeEventViewController
- (CGSize)preferredContentSize;
- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee;
- (EKEvent)event;
- (EKEventViewDelegate)delegate;
- (EKUIProposedTimeEventViewController)initWithProposedTimeAttendee:(id)a3;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (EKViewControllerRemoteUIDelegate)remoteUIDelegate;
- (id)completionBlock;
- (unint64_t)supportedInterfaceOrientations;
- (void)acceptButtonTapped;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)rejectButtonTapped;
- (void)replyButtonTapped;
- (void)setCompletionBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setRemoteUIDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation EKUIProposedTimeEventViewController

- (EKUIProposedTimeEventViewController)initWithProposedTimeAttendee:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIProposedTimeEventViewController;
  v5 = [(EKUIProposedTimeEventViewController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[SwappableViewControllerImplementationFactory proposedTimeEventViewControllerImpl];
    impl = v5->_impl;
    v5->_impl = (EKUIProposedTimeEventViewControllerImpl *)v6;

    [(EKUIProposedTimeEventViewController *)v5 addChildViewController:v5->_impl];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl didMoveToParentViewController:v5];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl setProposedTimeAttendee:v4];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl setCalendarPreviewIsInlineDayView:1];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl setAllowsEditing:1];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl setAllowsCalendarPreview:1];
    [(EKUIProposedTimeEventViewControllerImpl *)v5->_impl setShowsDetectedConferenceItem:1];
  }

  return v5;
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)EKUIProposedTimeEventViewController;
  [(EKUIProposedTimeEventViewController *)&v28 loadView];
  v3 = [(EKUIProposedTimeEventViewController *)self view];
  id v4 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  [v3 addSubview:v4];

  v5 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  v25 = [v27 leadingAnchor];
  v26 = [(EKUIProposedTimeEventViewController *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v29[0] = v23;
  v22 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  v20 = [v22 trailingAnchor];
  v21 = [(EKUIProposedTimeEventViewController *)self view];
  v19 = [v21 trailingAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v29[1] = v17;
  v16 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  uint64_t v6 = [v16 topAnchor];
  v7 = [(EKUIProposedTimeEventViewController *)self view];
  v8 = [v7 topAnchor];
  objc_super v9 = [v6 constraintEqualToAnchor:v8];
  v29[2] = v9;
  v10 = [(EKUIProposedTimeEventViewControllerImpl *)self->_impl view];
  v11 = [v10 bottomAnchor];
  v12 = [(EKUIProposedTimeEventViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v29[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v18 activateConstraints:v15];
}

- (CGSize)preferredContentSize
{
  [(EKUIProposedTimeEventViewControllerImpl *)self->_impl preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKUIProposedTimeEventViewController;
  id v4 = a3;
  [(EKUIProposedTimeEventViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[EKUIProposedTimeEventViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIProposedTimeEventViewController;
  [(EKUIProposedTimeEventViewController *)&v3 viewDidAppear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest]) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_61);
  }
}

void __53__EKUIProposedTimeEventViewController_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"EKEventViewControllerDidAppearNotification" object:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  double v2 = [(EKUIProposedTimeEventViewController *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)setDelegate:(id)a3
{
}

- (EKEventViewDelegate)delegate
{
  return (EKEventViewDelegate *)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl delegate];
}

- (void)setEvent:(id)a3
{
}

- (EKEvent)event
{
  return (EKEvent *)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl event];
}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return (EKCalendarEventInvitationNotificationAttendee *)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl proposedTimeAttendee];
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return (id)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl completionBlock];
}

- (void)setRemoteUIDelegate:(id)a3
{
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl remoteUIDelegate];
}

- (void)setNavigationDelegate:(id)a3
{
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)[(EKUIProposedTimeEventViewControllerImpl *)self->_impl navigationDelegate];
}

- (void)acceptButtonTapped
{
}

- (void)replyButtonTapped
{
}

- (void)rejectButtonTapped
{
}

- (void).cxx_destruct
{
}

@end