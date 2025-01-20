@interface FLApprovedItemsDecorator
+ (void)_updateForExternalUsage:(id)a3;
+ (void)_updateForInternalUsage:(id)a3;
+ (void)decorateUnknownItem:(id)a3;
@end

@implementation FLApprovedItemsDecorator

+ (void)decorateUnknownItem:(id)a3
{
  id v8 = a3;
  v4 = +[FLEnvironment currentEnvironment];
  if ([v4 isInternal])
  {
    v5 = +[FLEnvironment currentEnvironment];
    int v6 = [v5 shouldShowUnapprovedItems];

    id v7 = v8;
    if (v6)
    {
      [a1 _updateForInternalUsage:v8];
      goto LABEL_6;
    }
  }
  else
  {

    id v7 = v8;
  }
  [a1 _updateForExternalUsage:v7];
LABEL_6:
}

+ (void)_updateForInternalUsage:(id)a3
{
  v3 = NSString;
  id v11 = a3;
  v4 = [v11 informativeText];
  v5 = [v3 stringWithFormat:@"%@\n%@", @"**Internal Only - Follow Up not approved**", v4];
  [v11 setInformativeText:v5];

  int v6 = NSString;
  id v7 = [v11 notification];
  id v8 = [v7 title];
  v9 = [v6 stringWithFormat:@"%@\n%@", @"**Internal Only - Follow Up not approved**", v8];
  v10 = [v11 notification];
  [v10 setTitle:v9];

  [v11 setGroupIdentifier:@"com.apple.followup.group.unknown"];
}

+ (void)_updateForExternalUsage:(id)a3
{
  id v3 = a3;
  [v3 setTargetBundleIdentifier:0];
  [v3 setNotification:0];
}

@end