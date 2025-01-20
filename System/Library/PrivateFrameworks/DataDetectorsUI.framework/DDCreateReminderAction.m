@interface DDCreateReminderAction
+ (BOOL)isAvailable;
- (BOOL)canBePerformedByOpeningURL;
- (id)iconName;
- (id)localizedName;
- (int)interactionType;
- (void)prepareViewControllerForActionController:(id)a3;
@end

@implementation DDCreateReminderAction

- (id)localizedName
{
  return DDLocalizedString(@"Add to Reminders");
}

- (id)iconName
{
  return @"list.bullet";
}

- (int)interactionType
{
  return 1;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable];
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3 = +[DDRemoteActionViewController prepareViewController:@"DDReminderViewController" forAction:self actionController:a3];
}

@end