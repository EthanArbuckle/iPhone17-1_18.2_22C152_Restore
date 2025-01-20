@interface RCSettingsListItemsController
- (void)_updateSettingsPage;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation RCSettingsListItemsController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCSettingsListItemsController;
  [(RCSettingsListItemsController *)&v4 viewDidLoad];
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_updateSettingsPage" name:RCVoiceMemosSettingsDidChangeNotification object:0];
}

- (void)_updateSettingsPage
{
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:RCVoiceMemosSettingsDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)RCSettingsListItemsController;
  [(RCSettingsListItemsController *)&v4 dealloc];
}

@end