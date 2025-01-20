@interface WebBookmarksAccountNotificationObserver
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation WebBookmarksAccountNotificationObserver

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v20 = a3;
  id v8 = a6;
  if (v20) {
    v9 = v20;
  }
  else {
    v9 = v8;
  }
  id v10 = v9;
  int v11 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x263F25618]);
  v12 = [v10 accountType];
  v13 = [v12 identifier];
  int v14 = [v13 isEqualToString:*MEMORY[0x263EFAE58]];

  if (v14) {
    BOOL v15 = v11 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    uint64_t v16 = *MEMORY[0x263EFB3C0];
    uint64_t v17 = [v20 isEnabledForDataclass:*MEMORY[0x263EFB3C0]];
    int v18 = [v8 isEnabledForDataclass:v16];
    if (a4 == 1 && (v17 & 1) != 0)
    {
      uint64_t v17 = 1;
    }
    else if (a4 != 2 || ((v17 ^ v18) & 1) == 0)
    {
      if (a4 == 3) {
        int v19 = v18;
      }
      else {
        int v19 = 0;
      }
      if (v19 != 1) {
        goto LABEL_19;
      }
      uint64_t v17 = 0;
    }
    [MEMORY[0x263F861D0] didToggleCloudTabs:v17];
  }
LABEL_19:
}

@end