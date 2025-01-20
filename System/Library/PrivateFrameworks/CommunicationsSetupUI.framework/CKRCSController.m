@interface CKRCSController
- (BOOL)_contextIsCurrentDataSubscription:(id)a3;
- (BOOL)_shouldShowRCSActivationProblemForSpecifier:(id)a3;
- (CKLazuliEnablementManager)lazuliEnablementManager;
- (NSArray)ctSubscriptions;
- (NSString)controllerTitle;
- (NSString)multiSimHeaderKey;
- (id)_contextForSpecifier:(id)a3;
- (id)isEnabledForSubscription:(id)a3;
- (id)isRCSEnabled:(id)a3;
- (id)rcsBusinessMessagesEnabled:(id)a3;
- (id)specifiers;
- (void)_showRCSLearnMore;
- (void)appendFooterLinkToCellularDataSettingsIfNecessaryFor:(id)a3 contextSpecifier:(id)a4 groupSpecifier:(id)a5;
- (void)appendRCSSubtitleIfNecessaryFor:(id)a3 contextSpecifier:(id)a4;
- (void)setControllerTitle:(id)a3;
- (void)setCtSubscriptions:(id)a3;
- (void)setLazuliEnablementManager:(id)a3;
- (void)setMultiSimHeaderKey:(id)a3;
- (void)setRCSBusinessMessagesEnabled:(id)a3 specifier:(id)a4;
- (void)setRCSEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation CKRCSController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CKRCSController;
  [(CKRCSController *)&v7 viewDidLoad];
  v3 = CommunicationsSetupUIBundle();
  v4 = [v3 localizedStringForKey:self->_controllerTitle value:self->_controllerTitle table:@"Messages"];

  [(CKRCSController *)self setTitle:v4];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_lazuliRegistrationDidChange_ name:@"CNFLazuliRegistrationStateChangedNotification" object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_lazuliMessagingCapabilitiesDidChange_ name:@"CNFLazuliMessagesCapabilitiesStateChangedNotification" object:0];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [(CKRCSController *)v2 ctSubscriptions];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      v8 = MessagesSettingsLocalizedString(@"RCS_FOOTER_LEARN_MORE");
      v9 = MessagesSettingsLocalizedString(@"RCS_FOOTER_TEXT");
      v10 = [NSString stringWithFormat:@"\n%@", v8];
      v11 = [v9 stringByAppendingString:v10];

      NSUInteger v12 = [v11 rangeOfString:v8];
      NSUInteger v14 = v13;
      v15 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"RCS" name:&stru_26D05D4F8];
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v15 setProperty:v17 forKey:*MEMORY[0x263F600C0]];

      v79.location = v12;
      v79.length = v14;
      v18 = NSStringFromRange(v79);
      [v15 setProperty:v18 forKey:*MEMORY[0x263F600D0]];

      [v15 setProperty:v11 forKey:*MEMORY[0x263F600E8]];
      v19 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v2];
      [v15 setProperty:v19 forKey:*MEMORY[0x263F600E0]];

      v20 = NSStringFromSelector(sel__showRCSLearnMore);
      [v15 setProperty:v20 forKey:*MEMORY[0x263F600C8]];

      v71 = v15;
      [v5 addObject:v15];
      id v21 = objc_alloc(MEMORY[0x263F5FC40]);
      v22 = MessagesSettingsLocalizedString(@"RCS_MESSAGING");
      v23 = (void *)[v21 initWithName:v22 target:v2 set:sel_setRCSEnabled_specifier_ get:sel_isRCSEnabled_ detail:0 cell:6 edit:0];

      v24 = [(CKRCSController *)v2 ctSubscriptions];
      v25 = [v24 objectAtIndexedSubscript:0];

      v26 = [v25 phoneNumber];
      [v23 setProperty:v26 forKey:@"phoneNumber"];

      v27 = [v25 labelID];
      [v23 setProperty:v27 forKey:@"simID"];

      [(CKRCSController *)v2 appendRCSSubtitleIfNecessaryFor:v25 contextSpecifier:v23];
      [v5 addObject:v23];
    }
    else
    {
      uint64_t v69 = v3;
      v28 = CommunicationsSetupUIBundle();
      uint64_t v29 = [v28 localizedStringForKey:v2->_multiSimHeaderKey value:v2->_multiSimHeaderKey table:@"Messages"];

      v68 = (void *)v29;
      v30 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v29 target:v2 set:0 get:0 detail:0 cell:0 edit:0];
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      [v30 setProperty:v32 forKey:*MEMORY[0x263F600C0]];

      [v30 setProperty:0 forKey:@"RCSFooterMultiHyperlinkViewSIMLabelKey"];
      v71 = v30;
      [v5 addObject:v30];
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obj = [(CKRCSController *)v2 ctSubscriptions];
      uint64_t v33 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v73 != v35) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            v38 = (void *)MEMORY[0x263F4AF40];
            v39 = [v37 phoneNumber];
            v40 = [v37 labelID];
            v41 = [v38 IMUniqueIdentifierForPhoneNumber:v39 simID:v40];

            if (v41)
            {
              v42 = v5;
              v43 = (void *)MEMORY[0x263F5FC40];
              uint64_t v44 = [v37 label];
              v45 = v2;
              v46 = (void *)v44;
              v47 = v45;
              v48 = objc_msgSend(v43, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, 0);

              v49 = [NSString stringWithFormat:@"%@%@", @"RCSEnabled-", v41];
              [v48 setIdentifier:v49];
              v50 = [v37 labelID];

              if (v50)
              {
                v51 = [v37 labelID];
                [v48 setProperty:v51 forKey:@"simID"];
              }
              v52 = [v37 phoneNumber];

              if (v52)
              {
                v53 = [v37 phoneNumber];
                [v48 setProperty:v53 forKey:@"phoneNumber"];
              }
              v2 = v47;
              [(CKRCSController *)v47 appendRCSSubtitleIfNecessaryFor:v37 contextSpecifier:v48];
              [(CKRCSController *)v47 appendFooterLinkToCellularDataSettingsIfNecessaryFor:v37 contextSpecifier:v48 groupSpecifier:v71];
              id v5 = v42;
              [v42 addObject:v48];
            }
          }
          uint64_t v34 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v34);
      }

      uint64_t v3 = v69;
    }
    v54 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
    int v55 = [v54 isLazuliEnabled];

    if (v55)
    {
      v56 = [(CKRCSController *)v2 lazuliEnablementManager];
      int v57 = [v56 isRCSBusinessMessagingSupported];

      if (v57)
      {
        v58 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BusinessRCSMessages" name:0];
        v59 = MessagesSettingsLocalizedString(@"RCS_BUSINESS_MESSAGES_GROUP_FOOTER");
        [v58 setProperty:v59 forKey:*MEMORY[0x263F600F8]];

        [v5 addObject:v58];
        v60 = (void *)MEMORY[0x263F5FC40];
        v61 = MessagesSettingsLocalizedString(@"RCS_BUSINESS_MESSAGES_SWITCH");
        v62 = [v60 preferenceSpecifierNamed:v61 target:v2 set:sel_setRCSBusinessMessagesEnabled_specifier_ get:sel_rcsBusinessMessagesEnabled_ detail:0 cell:6 edit:0];

        v63 = [(CKRCSController *)v2 lazuliEnablementManager];
        char v64 = [v63 isRCSEnabledForAnyActiveSubscription];

        if ((v64 & 1) == 0) {
          [v62 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
        }
        [v5 addObject:v62];
      }
    }
    uint64_t v65 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
    v66 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v65;

    v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)appendRCSSubtitleIfNecessaryFor:(id)a3 contextSpecifier:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  uint64_t v7 = [(CKRCSController *)self isRCSEnabled:v12];
  int v8 = [v7 BOOLValue];

  v9 = [(CKRCSController *)self lazuliEnablementManager];
  v10 = [v9 rcsMessagingCapabilitiesForContext:v6];

  if (v8 && !v10)
  {
    v11 = MessagesSettingsLocalizedString(@"RCS_SWITCH_STATUS_IN_PROGRESS");
    [v12 setProperty:v11 forKey:*MEMORY[0x263F602C8]];

    [v12 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  }
}

- (void)appendFooterLinkToCellularDataSettingsIfNecessaryFor:(id)a3 contextSpecifier:(id)a4 groupSpecifier:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if ([(CKRCSController *)self _shouldShowRCSActivationProblemForSpecifier:a4])
  {
    v9 = [v10 label];
    [v8 setProperty:v9 forKey:@"RCSFooterMultiHyperlinkViewSIMLabelKey"];
  }
}

- (BOOL)_shouldShowRCSActivationProblemForSpecifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CKRCSController *)self _contextForSpecifier:v4];
  if (v5)
  {
    id v6 = [(CKRCSController *)self lazuliEnablementManager];
    uint64_t v7 = [v6 rcsMessagingCapabilitiesForContext:v5];

    id v8 = [MEMORY[0x263F4AF48] sharedInstance];
    v9 = (void *)[v8 copyIsoCountryCodeForSubscriptionContext:v5];

    int v10 = [v9 isEqualToString:@"cn"];
    v11 = [(CKRCSController *)self isRCSEnabled:v4];
    int v12 = [v11 BOOLValue];

    BOOL v13 = [(CKRCSController *)self _contextIsCurrentDataSubscription:v5];
    if (IMOSLoggingEnabled())
    {
      NSUInteger v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = @"No";
        if (v10) {
          v16 = @"Yes";
        }
        else {
          v16 = @"No";
        }
        int v22 = 136316162;
        v23 = "-[CKRCSController _shouldShowRCSActivationProblemForSpecifier:]";
        if (v12) {
          v17 = @"Yes";
        }
        else {
          v17 = @"No";
        }
        __int16 v24 = 2112;
        v25 = v16;
        if (v7) {
          v18 = @"No";
        }
        else {
          v18 = @"Yes";
        }
        __int16 v26 = 2112;
        v27 = v17;
        __int16 v28 = 2112;
        if (!v13) {
          v15 = @"Yes";
        }
        uint64_t v29 = v18;
        __int16 v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_INFO, "%s: enabled: %@ region: %@ state: %@, notCurrent: %@", (uint8_t *)&v22, 0x34u);
      }
    }
    if (v7) {
      char v19 = 0;
    }
    else {
      char v19 = v10 & v12;
    }

    BOOL v20 = v19 & !v13;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)_contextForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 properties];
  id v5 = [v4 objectForKey:@"simID"];

  id v6 = [v3 properties];

  uint64_t v7 = [v6 objectForKey:@"phoneNumber"];

  id v8 = [MEMORY[0x263F4AF48] sharedInstance];
  v9 = [v8 ctSubscriptionInfo];
  int v10 = objc_msgSend(v9, "__im_subscriptionContextForForSimID:phoneNumber:", v5, v7);

  return v10;
}

- (BOOL)_contextIsCurrentDataSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(CKRCSController *)self lazuliEnablementManager];
  id v6 = [v5 client];
  uint64_t v13 = 0;
  uint64_t v7 = [v6 getCurrentDataSubscriptionContextSync:&v13];
  uint64_t v8 = v13;

  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    int v10 = [v7 uuid];
    v11 = [v4 uuid];
    BOOL v9 = [v10 compare:v11] == 0;
  }
  return v9;
}

- (id)isRCSEnabled:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      int v10 = "-[CKRCSController isRCSEnabled:]";
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [(CKRCSController *)self lazuliEnablementManager];
  uint64_t v7 = [v6 isRCSEnabled:v4];

  return v7;
}

- (void)setRCSEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKRCSController setRCSEnabled:specifier:]";
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  if (v6)
  {
    int v9 = [(CKRCSController *)self lazuliEnablementManager];
    [v9 setRCSEnabled:v6 specifier:v7];

    [(CKRCSController *)self reloadSpecifiers];
    if ([v6 BOOLValue]
      && [(CKRCSController *)self _shouldShowRCSActivationProblemForSpecifier:v7])
    {
      v23 = [(CKRCSController *)self _contextForSpecifier:v7];
      int v10 = [v23 label];
      uint64_t v11 = MessagesSettingsLocalizedString(@"RCS_DUAL_SIM_ACTIVATION_ERROR_CELLULAR_DATA_SETTINGS");
      int v12 = NSString;
      uint64_t v13 = MessagesSettingsLocalizedString(@"RCS_DUAL_SIM_ACTIVATION_ERROR_TITLE");
      int v22 = objc_msgSend(v12, "stringWithFormat:", v13, v10);

      NSUInteger v14 = NSString;
      v15 = MessagesSettingsLocalizedString(@"RCS_DUAL_SIM_ACTIVATION_ERROR_TEXT");
      v16 = objc_msgSend(v14, "stringWithFormat:", v15, v10, v11);

      v17 = MessagesSettingsLocalizedString(@"RCS_DUAL_SIM_ACTIVATION_ERROR_NOT_NOW");
      v18 = [MEMORY[0x263F82418] alertControllerWithTitle:v22 message:v16 preferredStyle:1];
      char v19 = [MEMORY[0x263F82400] actionWithTitle:v11 style:0 handler:&__block_literal_global_10];
      [v18 addAction:v19];

      BOOL v20 = [MEMORY[0x263F82400] actionWithTitle:v17 style:1 handler:0];
      [v18 addAction:v20];

      [(CKRCSController *)self presentViewController:v18 animated:1 completion:0];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v21, OS_LOG_TYPE_INFO, "Ignoring attempt to set RCS enablement to NULL", buf, 2u);
    }
  }
}

void __43__CKRCSController_setRCSEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_INFO, "Navigating to settings", v6, 2u);
    }
  }
  id v4 = [MEMORY[0x263F01880] defaultWorkspace];
  id v5 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Cellular"];
  [v4 openSensitiveURL:v5 withOptions:0 error:0];
}

- (void)setRCSBusinessMessagesEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_INFO, "Set RCS Business Messages Enabled: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  int v9 = [(CKRCSController *)self lazuliEnablementManager];
  int v10 = [v9 client];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(CKRCSController *)self lazuliEnablementManager];
    [v12 setRCSBusinessMessagingEnabled:v6 specifier:v7];
  }
  else
  {
    int v12 = [MEMORY[0x263EFFA40] messagesAppDomain];
    [v12 setObject:v6 forKey:@"RCSForBusinessEnabled"];
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.RCSForBusinessEnabled.changed", 0, 0, 1u);
}

- (id)rcsBusinessMessagesEnabled:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CKRCSController *)self lazuliEnablementManager];
  int v6 = [v5 isRCSEnabledForAnyActiveSubscription];

  if (!v6)
  {
    int v14 = (void *)MEMORY[0x263EFFA80];
    goto LABEL_25;
  }
  id v7 = [(CKRCSController *)self lazuliEnablementManager];
  uint64_t v8 = [v7 getSubscriptionWithRCSBusinessMessaging];

  if (!v8)
  {
    id v12 = 0;
LABEL_9:
    char v11 = 0;
    goto LABEL_10;
  }
  int v9 = [(CKRCSController *)self lazuliEnablementManager];
  int v10 = [v9 client];
  id v27 = 0;
  char v11 = [v10 getSystemConfiguration:v8 withError:&v27];
  id v12 = v27;

  if (v12)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CKLazuliEnablementManager fetchSystemConfiguration:]((uint64_t)v12, v13);
    }

    goto LABEL_9;
  }
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = [(CKRCSController *)self lazuliEnablementManager];
    uint64_t v24 = [v23 isRCSBusinessMessagingEnabledByUserPreference];

    if (v24 == 1)
    {
      id v12 = 0;
      uint64_t v17 = 1;
    }
    else if (v24 == -1)
    {
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_INFO, "Setting RCS Business Messages from CoreTelephony SPI", buf, 2u);
        }
      }
      uint64_t v26 = [(CKRCSController *)self lazuliEnablementManager];
      uint64_t v17 = [v26 isRCSBusinessMessagingEnabledByDefault];

      id v12 = 0;
    }
    else
    {
      id v12 = 0;
      uint64_t v17 = 0;
    }
    goto LABEL_18;
  }
  id v12 = 0;
LABEL_10:
  id v15 = [MEMORY[0x263EFFA40] messagesAppDomain];
  uint64_t v16 = [v15 objectForKey:@"RCSForBusinessEnabled"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [v16 BOOLValue];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_INFO, "Setting RCS Business Messages from Carrier Bundle", buf, 2u);
      }
    }
    char v19 = [(CKRCSController *)self lazuliEnablementManager];
    uint64_t v17 = [v19 isRCSBusinessMessagingEnabledByDefault];
  }
LABEL_18:
  if (IMOSLoggingEnabled())
  {
    BOOL v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      if (v17) {
        id v21 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v21;
      _os_log_impl(&dword_21ED18000, v20, OS_LOG_TYPE_INFO, "RCS Business Messages Enabled: %@", buf, 0xCu);
    }
  }
  int v14 = [NSNumber numberWithBool:v17];

LABEL_25:
  return v14;
}

- (void)_showRCSLearnMore
{
  id v2 = NSURL;
  id v3 = MessagesSettingsLocalizedString(@"RCS_LEARN_MORE_URL");
  id v5 = [v2 URLWithString:v3];

  id v4 = v5;
  if (v5)
  {
    [(id)*MEMORY[0x263F83300] openURL:v5 withCompletionHandler:0];
    id v4 = v5;
  }
}

- (id)isEnabledForSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(CKRCSController *)self lazuliEnablementManager];
  int v6 = [v5 isRCSEnabled:v4];

  return v6;
}

- (NSString)multiSimHeaderKey
{
  return self->_multiSimHeaderKey;
}

- (void)setMultiSimHeaderKey:(id)a3
{
}

- (NSString)controllerTitle
{
  return self->_controllerTitle;
}

- (void)setControllerTitle:(id)a3
{
}

- (NSArray)ctSubscriptions
{
  return self->_ctSubscriptions;
}

- (void)setCtSubscriptions:(id)a3
{
}

- (CKLazuliEnablementManager)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
  objc_storeStrong((id *)&self->_ctSubscriptions, 0);
  objc_storeStrong((id *)&self->_controllerTitle, 0);
  objc_storeStrong((id *)&self->_multiSimHeaderKey, 0);
}

@end