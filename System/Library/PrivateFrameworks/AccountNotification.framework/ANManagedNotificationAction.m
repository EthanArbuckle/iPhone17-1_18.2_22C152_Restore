@interface ANManagedNotificationAction
- (void)takeValuesFromNotificationAction:(id)a3;
@end

@implementation ANManagedNotificationAction

- (void)takeValuesFromNotificationAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v5 absoluteString];
  [(ANManagedNotificationAction *)self setUrl:v6];

  v7 = [v4 options];
  [(ANManagedNotificationAction *)self setOptions:v7];

  v8 = NSNumber;
  uint64_t v9 = [v4 isInternalURL];

  id v10 = [v8 numberWithBool:v9];
  [(ANManagedNotificationAction *)self setIsInternal:v10];
}

@end