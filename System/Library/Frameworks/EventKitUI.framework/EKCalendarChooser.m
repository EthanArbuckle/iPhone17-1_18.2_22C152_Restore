@interface EKCalendarChooser
- (BOOL)allSelected;
- (BOOL)allowsPullToRefresh;
- (BOOL)disableCalendarEditing;
- (BOOL)disableCalendarsUnselectedByFocus;
- (BOOL)onlyShowUnmanagedAccounts;
- (BOOL)showAccountStatus;
- (BOOL)showDetailAccessories;
- (BOOL)showsCancelButton;
- (BOOL)showsCompletedRemindersSetting;
- (BOOL)showsDeclinedEventsSetting;
- (BOOL)showsDoneButton;
- (CGSize)preferredContentSize;
- (EKCalendar)selectedCalendar;
- (EKCalendarChooser)initWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12;
- (EKCalendarChooser)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11;
- (EKCalendarChooserSelectionStyle)selectionStyle;
- (EKEventStore)eventStore;
- (NSSet)collapsedSectionIdentifiers;
- (NSSet)selectedCalendars;
- (id)centeredCalendar;
- (id)delegate;
- (id)displayedEditor;
- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)selectionStyle displayStyle:(EKCalendarChooserDisplayStyle)displayStyle eventStore:(EKEventStore *)eventStore;
- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)style displayStyle:(EKCalendarChooserDisplayStyle)displayStyle entityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore;
- (id)sourceForSelectedIdentity;
- (int)explanatoryTextMode;
- (int64_t)chooserMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)centerOnCalendar:(id)a3;
- (void)focusModeConfigurationChanged;
- (void)identityChanged:(id)a3;
- (void)loadView;
- (void)openAddRegularCalendarWithTitle:(id)a3;
- (void)redisplayEditor:(id)a3 completion:(id)a4;
- (void)setAllowsPullToRefresh:(BOOL)a3;
- (void)setChooserMode:(int64_t)a3;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisableCalendarEditing:(BOOL)a3;
- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3;
- (void)setEventStore:(id)a3;
- (void)setExplanatoryTextMode:(int)a3;
- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3;
- (void)setSelectedCalendar:(id)a3;
- (void)setSelectedCalendars:(NSSet *)selectedCalendars;
- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5;
- (void)setShowAccountStatus:(BOOL)a3;
- (void)setShowDetailAccessories:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)showsCancelButton;
- (void)setShowsCompletedRemindersSetting:(BOOL)a3;
- (void)setShowsDeclinedEventsSetting:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)showsDoneButton;
- (void)showAddSubscribedCalendarWithURL:(id)a3;
- (void)showAllButtonPressed;
- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation EKCalendarChooser

- (EKCalendarChooser)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)EKCalendarChooser;
  v20 = [(EKCalendarChooser *)&v25 initWithNibName:0 bundle:0];
  if (v20)
  {
    *(_WORD *)((char *)&v24 + 1) = __PAIR16__(a11, a10);
    LOBYTE(v24) = a9;
    uint64_t v21 = +[SwappableViewControllerImplementationFactory calendarChooserImplWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](SwappableViewControllerImplementationFactory, "calendarChooserImplWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, v17, v18, v19, v24);
    impl = v20->_impl;
    v20->_impl = (EKCalendarChooserImpl *)v21;

    [(EKCalendarChooser *)v20 addChildViewController:v20->_impl];
    [(EKCalendarChooserImpl *)v20->_impl didMoveToParentViewController:v20];
    [(EKCalendarChooser *)v20 commonInit];
  }

  return v20;
}

- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)style displayStyle:(EKCalendarChooserDisplayStyle)displayStyle entityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore
{
  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooser initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", style, displayStyle, entityType, 0, eventStore, 0, v7);
}

- (id)initWithSelectionStyle:(EKCalendarChooserSelectionStyle)selectionStyle displayStyle:(EKCalendarChooserDisplayStyle)displayStyle eventStore:(EKEventStore *)eventStore
{
  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooser initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", selectionStyle, displayStyle, 0, 0, eventStore, 0, v6);
}

- (EKCalendarChooser)initWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12
{
  BOOL v16 = a3;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)EKCalendarChooser;
  uint64_t v21 = [(EKCalendarChooser *)&v26 initWithNibName:0 bundle:0];
  if (v21)
  {
    *(_WORD *)((char *)&v25 + 1) = __PAIR16__(a12, a11);
    LOBYTE(v25) = a10;
    uint64_t v22 = +[SwappableViewControllerImplementationFactory calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](SwappableViewControllerImplementationFactory, "calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", v16, a4, a5, a6, v18, v19, v20, v25);
    impl = v21->_impl;
    v21->_impl = (EKCalendarChooserImpl *)v22;

    [(EKCalendarChooser *)v21 addChildViewController:v21->_impl];
    [(EKCalendarChooserImpl *)v21->_impl didMoveToParentViewController:v21];
    [(EKCalendarChooser *)v21 commonInit];
  }

  return v21;
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)EKCalendarChooser;
  [(EKCalendarChooser *)&v28 loadView];
  v3 = [(EKCalendarChooser *)self view];
  v4 = [(EKCalendarChooserImpl *)self->_impl view];
  [v3 addSubview:v4];

  v5 = [(EKCalendarChooserImpl *)self->_impl view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v18 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(EKCalendarChooserImpl *)self->_impl view];
  uint64_t v25 = [v27 leadingAnchor];
  objc_super v26 = [(EKCalendarChooser *)self view];
  uint64_t v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v29[0] = v23;
  uint64_t v22 = [(EKCalendarChooserImpl *)self->_impl view];
  id v20 = [v22 trailingAnchor];
  uint64_t v21 = [(EKCalendarChooser *)self view];
  id v19 = [v21 trailingAnchor];
  id v17 = [v20 constraintEqualToAnchor:v19];
  v29[1] = v17;
  BOOL v16 = [(EKCalendarChooserImpl *)self->_impl view];
  uint64_t v6 = [v16 topAnchor];
  uint64_t v7 = [(EKCalendarChooser *)self view];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  v29[2] = v9;
  v10 = [(EKCalendarChooserImpl *)self->_impl view];
  v11 = [v10 bottomAnchor];
  v12 = [(EKCalendarChooser *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v29[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v18 activateConstraints:v15];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarChooser;
  [(EKCalendarChooser *)&v11 viewIsAppearing:a3];
  v4 = [MEMORY[0x1E4F57B90] shared];
  int v5 = [v4 isCurrentProcessAnApplicationExtension];

  if (v5)
  {
    uint64_t v6 = +[EKUIApplicationExtensionOverrides shared];
    uint64_t v7 = [v6 viewHierarchyOrOverride];

    v8 = objc_msgSend(v7, "ekui_tintColor");
    v9 = [(EKCalendarChooser *)self view];
    v10 = [v9 window];
    [v10 setTintColor:v8];
  }
}

- (CGSize)preferredContentSize
{
  [(EKCalendarChooserImpl *)self->_impl preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(EKCalendarChooserImpl *)self->_impl supportedInterfaceOrientations];
}

- (EKCalendarChooserSelectionStyle)selectionStyle
{
  return [(EKCalendarChooserImpl *)self->_impl selectionStyle];
}

- (id)delegate
{
  return (id)[(EKCalendarChooserImpl *)self->_impl delegate];
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)showsDoneButton
{
  return [(EKCalendarChooserImpl *)self->_impl showsDoneButton];
}

- (void)setShowsDoneButton:(BOOL)showsDoneButton
{
}

- (BOOL)showsCancelButton
{
  return [(EKCalendarChooserImpl *)self->_impl showsCancelButton];
}

- (void)setShowsCancelButton:(BOOL)showsCancelButton
{
}

- (NSSet)selectedCalendars
{
  return (NSSet *)[(EKCalendarChooserImpl *)self->_impl selectedCalendars];
}

- (void)setSelectedCalendars:(NSSet *)selectedCalendars
{
}

- (NSSet)collapsedSectionIdentifiers
{
  return (NSSet *)[(EKCalendarChooserImpl *)self->_impl collapsedSectionIdentifiers];
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5
{
}

- (BOOL)showDetailAccessories
{
  return [(EKCalendarChooserImpl *)self->_impl showDetailAccessories];
}

- (void)setShowDetailAccessories:(BOOL)a3
{
}

- (int64_t)chooserMode
{
  return [(EKCalendarChooserImpl *)self->_impl chooserMode];
}

- (void)setChooserMode:(int64_t)a3
{
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  return [(EKCalendarChooserImpl *)self->_impl disableCalendarsUnselectedByFocus];
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
}

- (BOOL)allowsPullToRefresh
{
  return [(EKCalendarChooserImpl *)self->_impl allowsPullToRefresh];
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
}

- (EKCalendar)selectedCalendar
{
  return (EKCalendar *)[(EKCalendarChooserImpl *)self->_impl selectedCalendar];
}

- (void)setSelectedCalendar:(id)a3
{
}

- (BOOL)disableCalendarEditing
{
  return [(EKCalendarChooserImpl *)self->_impl disableCalendarEditing];
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
}

- (BOOL)showsDeclinedEventsSetting
{
  return [(EKCalendarChooserImpl *)self->_impl showsDeclinedEventsSetting];
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
}

- (BOOL)showsCompletedRemindersSetting
{
  return [(EKCalendarChooserImpl *)self->_impl showsCompletedRemindersSetting];
}

- (void)setShowsCompletedRemindersSetting:(BOOL)a3
{
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)[(EKCalendarChooserImpl *)self->_impl eventStore];
}

- (int)explanatoryTextMode
{
  return [(EKCalendarChooserImpl *)self->_impl explanatoryTextMode];
}

- (void)setExplanatoryTextMode:(int)a3
{
}

- (BOOL)showAccountStatus
{
  return [(EKCalendarChooserImpl *)self->_impl showAccountStatus];
}

- (void)setShowAccountStatus:(BOOL)a3
{
}

- (BOOL)onlyShowUnmanagedAccounts
{
  return [(EKCalendarChooserImpl *)self->_impl onlyShowUnmanagedAccounts];
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
}

- (void)showAllButtonPressed
{
}

- (BOOL)allSelected
{
  return [(EKCalendarChooserImpl *)self->_impl allSelected];
}

- (void)focusModeConfigurationChanged
{
}

- (id)centeredCalendar
{
  return (id)[(EKCalendarChooserImpl *)self->_impl centeredCalendar];
}

- (void)centerOnCalendar:(id)a3
{
}

- (id)displayedEditor
{
  return (id)[(EKCalendarChooserImpl *)self->_impl displayedEditor];
}

- (void)redisplayEditor:(id)a3 completion:(id)a4
{
}

- (id)sourceForSelectedIdentity
{
  return (id)[(EKCalendarChooserImpl *)self->_impl sourceForSelectedIdentity];
}

- (void)identityChanged:(id)a3
{
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
}

- (void)setEventStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);

  objc_storeStrong((id *)&self->_impl, 0);
}

@end