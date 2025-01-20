@interface ShortcutsCloudKitAccountNotifier
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation ShortcutsCloudKitAccountNotifier

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v9 = (unint64_t)a3;
  id v10 = a5;
  unint64_t v11 = (unint64_t)a6;
  v12 = (void *)v11;
  BOOL v13 = (v9 | v11) != 0;
  v14 = (void *)MEMORY[0x263EFAEA0];
  if (v9)
  {
    v15 = [(id)v9 accountType];
    v16 = [v15 identifier];
    int v17 = [v16 isEqualToString:*v14];

    if (v12)
    {
LABEL_3:
      v18 = [v12 accountType];
      v19 = [v18 identifier];
      int v20 = [v19 isEqualToString:*v14];

      goto LABEL_6;
    }
  }
  else
  {
    int v17 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  int v20 = 0;
LABEL_6:
  if ((v13 & (v17 | v20)) == 1)
  {
    switch(a4)
    {
      case 1:
        v21 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
          _os_log_impl(&dword_2405EB000, v21, OS_LOG_TYPE_INFO, "%s CloudKit account was added. Resetting all local sync state and requesting a resync.", (uint8_t *)&v26, 0xCu);
        }

        v22 = (id *)MEMORY[0x263F855F8];
        goto LABEL_14;
      case 2:
        v23 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 136315138;
          v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
          _os_log_impl(&dword_2405EB000, v23, OS_LOG_TYPE_INFO, "%s CloudKit account was modified. Requesting a resync.", (uint8_t *)&v26, 0xCu);
        }

        v22 = (id *)MEMORY[0x263F85600];
LABEL_14:
        notify_post((const char *)[*v22 UTF8String]);
        goto LABEL_23;
      case 3:
        v24 = getWFVoiceShortcutClientLogObject();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        int v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit account was deleted. Nothing to do.";
        break;
      case 4:
        v24 = getWFVoiceShortcutClientLogObject();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        int v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit account save failed. Nothing to do.";
        break;
      case 5:
        v24 = getWFVoiceShortcutClientLogObject();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_22;
        }
        int v26 = 136315138;
        v27 = "-[ShortcutsCloudKitAccountNotifier account:didChangeWithType:inStore:oldAccount:]";
        v25 = "%s CloudKit warming up. Nothing to do.";
        break;
      default:
        goto LABEL_23;
    }
    _os_log_impl(&dword_2405EB000, v24, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v26, 0xCu);
LABEL_22:
  }
LABEL_23:
}

@end