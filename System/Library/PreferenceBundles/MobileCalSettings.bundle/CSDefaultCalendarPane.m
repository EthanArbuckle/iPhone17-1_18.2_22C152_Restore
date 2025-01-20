@interface CSDefaultCalendarPane
- (BOOL)drawLabel;
- (CSDefaultCalendarPane)initWithFrame:(CGRect)a3;
- (id)childViewControllerForHostingViewController;
- (id)preferenceValue;
- (void)_updateCheckedCalendarForSource:(id)a3;
- (void)setPreferenceSpecifier:(id)a3;
@end

@implementation CSDefaultCalendarPane

- (CSDefaultCalendarPane)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDefaultCalendarPane;
  v3 = -[CSDefaultCalendarPane initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
    store = v3->_store;
    v3->_store = v4;
  }
  return v3;
}

- (void)_updateCheckedCalendarForSource:(id)a3
{
  uint64_t v4 = [(EKEventStore *)self->_store defaultCalendarForNewEventsInDelegateSource:a3];
  if (v4)
  {
    v5 = +[NSSet setWithObject:v4];
    [(EKCalendarChooser *)self->_chooser setSelectedCalendars:v5];
  }

  _objc_release_x1();
}

- (id)childViewControllerForHostingViewController
{
  return self->_chooser;
}

- (BOOL)drawLabel
{
  return 0;
}

- (void)setPreferenceSpecifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CSDefaultCalendarPane;
  [(CSDefaultCalendarPane *)&v20 setPreferenceSpecifier:v4];
  if (v4)
  {
    v5 = [v4 propertyForKey:@"CSSourceKey"];
    BYTE2(v19) = 0;
    LOWORD(v19) = 0;
    v6 = (EKCalendarChooser *)objc_msgSend(objc_alloc((Class)EKCalendarChooser), "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", 0, 1, 0, 0, self->_store, v5, v19);
    chooser = self->_chooser;
    self->_chooser = v6;

    [(CSDefaultCalendarPane *)self frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(EKCalendarChooser *)self->_chooser view];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    [(EKCalendarChooser *)self->_chooser setDisableCalendarEditing:1];
    if (v5) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    [(EKCalendarChooser *)self->_chooser setExplanatoryTextMode:v17];
    v18 = [(EKCalendarChooser *)self->_chooser view];
    [(CSDefaultCalendarPane *)self addSubview:v18];

    [(CSDefaultCalendarPane *)self _updateCheckedCalendarForSource:v5];
  }
}

- (id)preferenceValue
{
  v3 = [(EKCalendarChooser *)self->_chooser selectedCalendars];
  id v4 = [v3 anyObject];

  if (self->_dontSetDefaultCalendar)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectID];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chooser, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end