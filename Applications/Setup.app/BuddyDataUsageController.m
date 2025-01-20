@interface BuddyDataUsageController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BYCapabilities)capabilities;
- (BYRunState)runState;
- (BuddyExistingSettings)existingSettings;
- (void)continueTapped:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setRunState:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyDataUsageController

- (void)viewDidLoad
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDataUsageController;
  [(BuddyDataUsageController *)&v5 viewDidLoad];
  v2 = v7;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"continueTapped:"];
}

- (void)continueTapped:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyWelcomeController *)v5 delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:v5];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupiMessageAndFaceTime;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyDataUsageController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 mgHasGreenTea];
  char v6 = 0;
  char v4 = 0;
  if (v3)
  {
    v7 = [(BuddyDataUsageController *)self runState];
    char v6 = 1;
    char v4 = [(BYRunState *)v7 hasCompletedInitialRun] ^ 1;
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end