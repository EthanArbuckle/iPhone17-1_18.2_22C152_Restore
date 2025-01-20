@interface SCLSetupListViewController
+ (id)defaultSetupViewModel;
- (SCLSettingsViewModel)viewModel;
- (SCLSetupListViewController)init;
- (SCLSetupPrincipleClass)flowController;
- (void)doneButtonSelected:(id)a3;
- (void)loadSpecifierSource;
- (void)setFlowController:(id)a3;
@end

@implementation SCLSetupListViewController

- (SCLSetupListViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLSetupListViewController;
  v2 = [(SCLSetupListViewController *)&v6 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v2 action:"doneButtonSelected:"];
    v4 = [(SCLSetupListViewController *)v2 navigationItem];
    [v4 setRightBarButtonItem:v3];
  }
  return v2;
}

- (void)loadSpecifierSource
{
  id v3 = [(id)objc_opt_class() defaultSetupViewModel];
  viewModel = self->_viewModel;
  self->_viewModel = v3;
  v5 = v3;

  objc_super v6 = [[SCLSetupSpecifierDataSource alloc] initWithListController:self viewModel:v5];
  [(SCLSetupSpecifierDataSource *)v6 setActive:1];
  [(SCLSetupListViewController *)self setSpecifierSource:v6];
}

- (void)doneButtonSelected:(id)a3
{
  id v5 = [(SCLSetupListViewController *)self flowController];
  v4 = [(SCLSetupListViewController *)self viewModel];
  [v5 commitViewModel:v4];
}

+ (id)defaultSetupViewModel
{
  id v2 = objc_alloc_init((Class)SCLSettingsViewModel);
  [v2 setEnabled:1];
  id v3 = +[NSCalendar currentCalendar];
  id v4 = objc_msgSend(v3, "SCL_nonWeekendDays");

  id v5 = +[SCLTimeIntervalModel defaultTimeInterval];
  v9 = v5;
  objc_super v6 = +[NSArray arrayWithObjects:&v9 count:1];

  [v2 setScheduleType:2];
  [v2 setRepeatSchedule:v4];
  [v2 setTimeIntervals:v6];
  id v7 = [objc_alloc((Class)SCLRecurrenceSchedule) initWithTimeIntervals:v6 repeatSchedule:v4];
  [v2 setCustomSchedule:v7];

  return v2;
}

- (SCLSetupPrincipleClass)flowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);

  return (SCLSetupPrincipleClass *)WeakRetained;
}

- (void)setFlowController:(id)a3
{
}

- (SCLSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_destroyWeak((id *)&self->_flowController);
}

@end