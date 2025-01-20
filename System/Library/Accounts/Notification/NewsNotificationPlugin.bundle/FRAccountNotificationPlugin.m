@interface FRAccountNotificationPlugin
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation FRAccountNotificationPlugin

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a4 == 2)
  {
    uint64_t v11 = *MEMORY[0x263EFB458];
    char v12 = [a6 isProvisionedForDataclass:*MEMORY[0x263EFB458]];
    int v13 = [v9 isProvisionedForDataclass:v11];
    BOOL v14 = 0;
    if ((v12 & 1) == 0 && v13)
    {
      uint64_t v15 = [v9 isEnabledForDataclass:v11];
      [v9 setEnabled:1 forDataclass:v11];
      v16 = [v10 dataclassActionsForAccountSave:v9];
      v17 = [v16 objectForKeyedSubscript:v11];
      unint64_t v18 = [v17 count];
      BOOL v14 = v18 < 2;
      if (v18 >= 2) {
        [v9 setEnabled:v15 forDataclass:v11];
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end