@interface EKEventViewController
- (BOOL)allowsCalendarPreview;
- (BOOL)allowsEditing;
- (BOOL)allowsInviteResponses;
- (BOOL)allowsSubitems;
- (BOOL)calendarPreviewIsInlineDayView;
- (BOOL)canManagePresentationStyle;
- (BOOL)eventEditViewPresented;
- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter;
- (BOOL)isICSPreview;
- (BOOL)isLargeDayView;
- (BOOL)minimalMode;
- (BOOL)noninteractivePlatterMode;
- (BOOL)showsAddToCalendarForICSPreview;
- (BOOL)showsDelegateMessage;
- (BOOL)showsDelegatorMessage;
- (BOOL)showsDeleteForICSPreview;
- (BOOL)showsDetectedConferenceItem;
- (BOOL)showsDoneButton;
- (BOOL)showsOutOfDateMessage;
- (BOOL)showsUpdateCalendarForICSPreview;
- (BOOL)wantsManagement;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKEventViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (EKEventViewController)initWithRemoteUI:(BOOL)a3;
- (EKUIViewControllerNavigationDelegate)navigationDelegate;
- (NSDictionary)context;
- (UIScrollView)eventDetailsScrollView;
- (UIViewController)eventDetailsViewController;
- (id)delegate;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (unint64_t)supportedInterfaceOrientations;
- (void)_performEditKeyCommand;
- (void)commonInit;
- (void)doneButtonTapped;
- (void)editButtonTapped;
- (void)fullReloadWithNewEvent:(id)a3;
- (void)loadView;
- (void)openAttendeesDetailItem;
- (void)performAddToCalendar;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setAllowsCalendarPreview:(BOOL)allowsCalendarPreview;
- (void)setAllowsEditing:(BOOL)allowsEditing;
- (void)setAllowsInviteResponses:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEditorHideTransition:(int)a3;
- (void)setEditorShowTransition:(int)a3;
- (void)setEvent:(EKEvent *)event;
- (void)setEventEditViewPresented:(BOOL)a3;
- (void)setICSPreview:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setIsLargeDayView:(BOOL)a3;
- (void)setMinimalMode:(BOOL)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setNeedsReload;
- (void)setNoninteractivePlatterMode:(BOOL)a3;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4;
- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3;
- (void)setShowsDelegateMessage:(BOOL)a3;
- (void)setShowsDelegatorMessage:(BOOL)a3;
- (void)setShowsDeleteForICSPreview:(BOOL)a3;
- (void)setShowsDetectedConferenceItem:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShowsOutOfDateMessage:(BOOL)a3;
- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation EKEventViewController

- (EKEventViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EKEventViewController;
  v4 = [(EKEventViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = +[SwappableViewControllerImplementationFactory eventViewControllerImpl];
    impl = v4->_impl;
    v4->_impl = (EKEventViewControllerImpl *)v5;

    [(EKEventViewController *)v4 addChildViewController:v4->_impl];
    [(EKEventViewControllerImpl *)v4->_impl didMoveToParentViewController:v4];
    [(EKEventViewController *)v4 commonInit];
  }
  return v4;
}

- (EKEventViewController)initWithRemoteUI:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKEventViewController;
  v4 = [(EKEventViewController *)&v8 initWithNibName:0 bundle:0];
  if (v4)
  {
    uint64_t v5 = +[SwappableViewControllerImplementationFactory eventViewControllerImplWithRemoteUI:v3];
    impl = v4->_impl;
    v4->_impl = (EKEventViewControllerImpl *)v5;

    [(EKEventViewController *)v4 addChildViewController:v4->_impl];
    [(EKEventViewControllerImpl *)v4->_impl didMoveToParentViewController:v4];
    [(EKEventViewController *)v4 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  EKUILogInitIfNeeded();
  [(EKEventViewController *)self setCalendarPreviewIsInlineDayView:1];
  [(EKEventViewController *)self setInlineDayViewRespectsSelectedCalendarsFilter:1];
  [(EKEventViewController *)self setAllowsSubitems:1];
  [(EKEventViewController *)self setAllowsInviteResponses:1];
  [(EKEventViewController *)self setShowsDoneButton:1];
  [(EKEventViewController *)self setEditorShowTransition:8];

  [(EKEventViewController *)self setEditorHideTransition:9];
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)EKEventViewController;
  [(EKEventViewController *)&v28 loadView];
  BOOL v3 = [(EKEventViewController *)self view];
  v4 = [(EKEventViewControllerImpl *)self->_impl view];
  [v3 addSubview:v4];

  uint64_t v5 = [(EKEventViewControllerImpl *)self->_impl view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(EKEventViewControllerImpl *)self->_impl view];
  v25 = [v27 leadingAnchor];
  v26 = [(EKEventViewController *)self view];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v29[0] = v23;
  v22 = [(EKEventViewControllerImpl *)self->_impl view];
  v20 = [v22 trailingAnchor];
  v21 = [(EKEventViewController *)self view];
  v19 = [v21 trailingAnchor];
  v17 = [v20 constraintEqualToAnchor:v19];
  v29[1] = v17;
  v16 = [(EKEventViewControllerImpl *)self->_impl view];
  v6 = [v16 topAnchor];
  v7 = [(EKEventViewController *)self view];
  objc_super v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v29[2] = v9;
  v10 = [(EKEventViewControllerImpl *)self->_impl view];
  v11 = [v10 bottomAnchor];
  v12 = [(EKEventViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v29[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v18 activateConstraints:v15];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)EKEventViewController;
  [(EKEventViewController *)&v2 viewDidLoad];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EKEventViewController;
  [(EKEventViewController *)&v11 viewIsAppearing:a3];
  v4 = [MEMORY[0x1E4F57B90] shared];
  int v5 = [v4 isCurrentProcessAnApplicationExtension];

  if (v5)
  {
    v6 = +[EKUIApplicationExtensionOverrides shared];
    v7 = [v6 viewHierarchyOrOverride];

    objc_super v8 = objc_msgSend(v7, "ekui_tintColor");
    v9 = [(EKEventViewController *)self view];
    v10 = [v9 window];
    [v10 setTintColor:v8];
  }
  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp]) {
    [(UIViewController *)self ekui_adjustNavAndToolBarToTransparentStyles];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventViewController;
  [(EKEventViewController *)&v3 viewDidAppear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest]) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_57);
  }
}

void __39__EKEventViewController_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"EKEventViewControllerDidAppearNotification" object:0];
}

- (CGSize)preferredContentSize
{
  [(EKEventViewControllerImpl *)self->_impl preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKEventViewController;
  id v4 = a3;
  [(EKEventViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[EKEventViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (unint64_t)supportedInterfaceOrientations
{
  double v2 = [(EKEventViewController *)self view];
  BOOL IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)setEventEditViewPresented:(BOOL)a3
{
}

- (BOOL)eventEditViewPresented
{
  return [(EKEventViewControllerImpl *)self->_impl eventEditViewPresented];
}

- (void)setEvent:(EKEvent *)event
{
}

- (EKEvent)event
{
  return (EKEvent *)[(EKEventViewControllerImpl *)self->_impl event];
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
}

- (BOOL)allowsEditing
{
  return [(EKEventViewControllerImpl *)self->_impl allowsEditing];
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  return (id)[(EKEventViewControllerImpl *)self->_impl delegate];
}

- (void)setAllowsCalendarPreview:(BOOL)allowsCalendarPreview
{
}

- (BOOL)allowsCalendarPreview
{
  return [(EKEventViewControllerImpl *)self->_impl allowsCalendarPreview];
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return [(EKEventViewControllerImpl *)self->_impl calendarPreviewIsInlineDayView];
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return [(EKEventViewControllerImpl *)self->_impl inlineDayViewRespectsSelectedCalendarsFilter];
}

- (void)setICSPreview:(BOOL)a3
{
}

- (BOOL)isICSPreview
{
  return [(EKEventViewControllerImpl *)self->_impl isICSPreview];
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
}

- (BOOL)allowsInviteResponses
{
  return [(EKEventViewControllerImpl *)self->_impl allowsInviteResponses];
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return [(EKEventViewControllerImpl *)self->_impl showsAddToCalendarForICSPreview];
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return [(EKEventViewControllerImpl *)self->_impl showsUpdateCalendarForICSPreview];
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
}

- (BOOL)showsDeleteForICSPreview
{
  return [(EKEventViewControllerImpl *)self->_impl showsDeleteForICSPreview];
}

- (void)setAllowsSubitems:(BOOL)a3
{
}

- (BOOL)allowsSubitems
{
  return [(EKEventViewControllerImpl *)self->_impl allowsSubitems];
}

- (void)setShowsDoneButton:(BOOL)a3
{
}

- (BOOL)showsDoneButton
{
  return [(EKEventViewControllerImpl *)self->_impl showsDoneButton];
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
}

- (BOOL)showsOutOfDateMessage
{
  return [(EKEventViewControllerImpl *)self->_impl showsOutOfDateMessage];
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
}

- (BOOL)showsDelegatorMessage
{
  return [(EKEventViewControllerImpl *)self->_impl showsDelegatorMessage];
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
}

- (BOOL)showsDelegateMessage
{
  return [(EKEventViewControllerImpl *)self->_impl showsDelegateMessage];
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
}

- (BOOL)showsDetectedConferenceItem
{
  return [(EKEventViewControllerImpl *)self->_impl showsDetectedConferenceItem];
}

- (void)setMinimalMode:(BOOL)a3
{
}

- (BOOL)minimalMode
{
  return [(EKEventViewControllerImpl *)self->_impl minimalMode];
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
}

- (BOOL)noninteractivePlatterMode
{
  return [(EKEventViewControllerImpl *)self->_impl noninteractivePlatterMode];
}

- (void)setIsLargeDayView:(BOOL)a3
{
}

- (BOOL)isLargeDayView
{
  return [(EKEventViewControllerImpl *)self->_impl isLargeDayView];
}

- (void)setEditorShowTransition:(int)a3
{
}

- (int)editorShowTransition
{
  return [(EKEventViewControllerImpl *)self->_impl editorShowTransition];
}

- (void)setEditorHideTransition:(int)a3
{
}

- (int)editorHideTransition
{
  return [(EKEventViewControllerImpl *)self->_impl editorHideTransition];
}

- (UIScrollView)eventDetailsScrollView
{
  return (UIScrollView *)[(EKEventViewControllerImpl *)self->_impl eventDetailsScrollView];
}

- (UIViewController)eventDetailsViewController
{
  return (UIViewController *)[(EKEventViewControllerImpl *)self->_impl eventDetailsViewController];
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)context
{
  return (NSDictionary *)[(EKEventViewControllerImpl *)self->_impl context];
}

- (void)setNavigationDelegate:(id)a3
{
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)[(EKEventViewControllerImpl *)self->_impl navigationDelegate];
}

- (void)_performEditKeyCommand
{
}

- (void)doneButtonTapped
{
}

- (void)editButtonTapped
{
}

- (void)openAttendeesDetailItem
{
}

- (void)setNeedsReload
{
}

- (void)fullReloadWithNewEvent:(id)a3
{
}

- (void)performAddToCalendar
{
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (void).cxx_destruct
{
}

@end