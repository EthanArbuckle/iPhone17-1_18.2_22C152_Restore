@interface CNDataclassActionDefinition
+ (ACDataclassAction)cancel;
+ (ACDataclassAction)cancelDueToRestrictions;
+ (ACDataclassAction)createSyncDataStore;
+ (ACDataclassAction)createSyncDataStoreDeleteLocalData;
+ (ACDataclassAction)createSyncDataStoreKeepLocalData;
+ (ACDataclassAction)deleteSyncData;
+ (ACDataclassAction)mergeLocalDataIntoSyncData;
+ (ACDataclassAction)mergeSyncDataIntoLocalData;
@end

@implementation CNDataclassActionDefinition

+ (ACDataclassAction)createSyncDataStore
{
  return +[ACDataclassAction actionWithType:1];
}

+ (ACDataclassAction)createSyncDataStoreKeepLocalData
{
  return +[ACDataclassAction actionWithType:4];
}

+ (ACDataclassAction)createSyncDataStoreDeleteLocalData
{
  return (ACDataclassAction *)+[ACDataclassAction destructiveActionWithType:6];
}

+ (ACDataclassAction)mergeLocalDataIntoSyncData
{
  return +[ACDataclassAction actionWithType:5];
}

+ (ACDataclassAction)mergeSyncDataIntoLocalData
{
  return +[ACDataclassAction actionWithType:2];
}

+ (ACDataclassAction)deleteSyncData
{
  return (ACDataclassAction *)+[ACDataclassAction destructiveActionWithType:3];
}

+ (ACDataclassAction)cancel
{
  return +[ACDataclassAction actionWithType:0];
}

+ (ACDataclassAction)cancelDueToRestrictions
{
  v2 = +[ACDataclassAction actionWithType:0];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"SCREENTIME_SIGNOUT_RESTRICTIONS_ENABLED_ALERT_TITLE" value:&stru_10790 table:0];
  [v2 setUndoAlertTitle:v4];

  v5 = [v3 localizedStringForKey:@"SCREENTIME_SIGNOUT_RESTRICTIONS_ENABLED_ALERT_MESSAGE" value:&stru_10790 table:0];
  [v2 setUndoAlertMessage:v5];

  return (ACDataclassAction *)v2;
}

@end