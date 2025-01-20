@interface DDTextMessageAction
+ (BOOL)isShowMessageURL:(id)a3;
+ (BOOL)supportsURL:(id)a3;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)matchingSchemes;
- (BOOL)canBePerformedByOpeningURL;
- (DDTextMessageAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)_serviceIdentifier;
- (id)actionMessagingAppIsMessages;
- (id)baseServiceMenuName;
- (id)compactTitle;
- (id)defaultMessagingApp;
- (id)defaultMessagingAppIsMessages;
- (id)handleString;
- (id)iconName;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (id)serviceCompactName;
- (id)serviceIdentifier;
- (id)serviceName;
- (id)subtitle;
- (id)viewController;
- (int)interactionType;
- (uint64_t)defaultAppClientAdoptionReady;
- (uint64_t)shouldAddDefaultApps;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)performFromView:(id)a3;
@end

@implementation DDTextMessageAction

+ (id)matchingSchemes
{
  return &unk_1EF510CC8;
}

+ (BOOL)isShowMessageURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:@"sms"])
  {
    v6 = [v3 resourceSpecifier];
    v7 = [v6 componentsSeparatedByString:@"?"];
    v8 = [v7 firstObject];
    v9 = [v8 componentsSeparatedByString:@"/"];
    v10 = [v9 lastObject];
    char v11 = [v10 isEqualToString:@"open"];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  v6 = [v5 lowercaseString];

  if (!v6) {
    goto LABEL_7;
  }
  v7 = [a1 matchingSchemes];
  char v8 = [v7 containsObject:v6];

  if (v8)
  {
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_8;
  }
  if (![v6 isEqualToString:@"sip"])
  {
    char v11 = objc_msgSend(v4, "dd_emailFromMailtoScheme");
    char IsChatBot = dd_handleIsChatBot(v11);

    if (IsChatBot) {
      goto LABEL_6;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  uint64_t v14 = 0;
  id v9 = (id)objc_msgSend(v4, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v14, 0);
  BOOL v10 = v14 != 0;
LABEL_8:

  return v10;
}

- (DDTextMessageAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  char v8 = (NSURL *)a3;
  v21.receiver = self;
  v21.super_class = (Class)DDTextMessageAction;
  id v9 = [(DDTelephoneNumberAction *)&v21 initWithURL:v8 result:a4 context:a5];
  BOOL v10 = v9;
  if (v9)
  {
    url = v9->super.super._url;
    if (url)
    {
      v12 = url;
    }
    else
    {
      _DDURLFromResult((uint64_t)a4);
      v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    uint64_t v14 = [(NSURL *)v13 scheme];
    phoneNumber = [v14 lowercaseString];
    if (![phoneNumber isEqualToString:@"mailto"]) {
      goto LABEL_9;
    }
    int IsChatBot = dd_handleIsChatBot(v10->super._phoneNumber);

    if (IsChatBot)
    {
      uint64_t v17 = [(NSString *)v10->super._phoneNumber dd_encodedEmail];
      serviceID = v10->super._serviceID;
      v10->super._serviceID = (NSString *)v17;

      uint64_t v14 = [(NSString *)v10->super._serviceID componentsSeparatedByString:@"@"];
      uint64_t v19 = [v14 firstObject];
      phoneNumber = v10->super._phoneNumber;
      v10->super._phoneNumber = (NSString *)v19;
LABEL_9:
    }
  }
  else
  {
    v13 = v8;
  }

  return v10;
}

- (id)handleString
{
  serviceID = self->super._serviceID;
  if (!serviceID) {
    serviceID = self->super._phoneNumber;
  }
  return serviceID;
}

- (id)serviceName
{
  id v3 = [(LSApplicationRecord *)self->_notificationURLHandler localizedName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(LSApplicationRecord *)self->_defaultMessagingApp localizedName];
  }
  v6 = v5;

  return v6;
}

- (id)serviceCompactName
{
  id v3 = [(DDTextMessageAction *)self serviceName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DDTextMessageAction;
    id v5 = [(DDAction *)&v8 serviceCompactName];
  }
  v6 = v5;

  return v6;
}

- (id)localizedName
{
  id v3 = [(DDTelephoneNumberAction *)self bizItem];

  if (v3)
  {
    id v4 = [(DDTelephoneNumberAction *)self bizItem];
    id v5 = [v4 messageTitle];
  }
  else
  {
    id v5 = -[DDTextMessageAction baseServiceMenuName](self);
  }
  return v5;
}

- (id)baseServiceMenuName
{
  if (a1)
  {
    a1 = DDLocalizedString(@"Message");
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)subtitle
{
  v2 = [(DDTelephoneNumberAction *)self bizItem];
  id v3 = [v2 messageSubtitle];

  return v3;
}

- (id)compactTitle
{
  id v3 = [(DDTextMessageAction *)self serviceCompactName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DDTextMessageAction;
    id v5 = [(DDTelephoneNumberAction *)&v8 compactTitle];
  }
  v6 = v5;

  return v6;
}

- (id)iconName
{
  return @"message";
}

- (id)defaultMessagingApp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = a1;
    if (!*((unsigned char *)a1 + 168))
    {
      int isLSTrusted = dd_isLSTrusted();
      if (isLSTrusted)
      {
        uint64_t v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        id v9 = 0;
        id v4 = [v1 defaultApplicationForCategory:3 error:&v9];
        id v5 = v9;
      }
      else
      {
        id v5 = 0;
        id v4 = 0;
      }
      objc_storeStrong(v2 + 20, v4);
      if (isLSTrusted)
      {
      }
      if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v6 = [MEMORY[0x1E4F28B50] mainBundle];
        v7 = [v6 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        char v11 = v7;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get default messaging app from %@. Error: %@", buf, 0x16u);
      }
      *((unsigned char *)v2 + 168) = 1;
    }
    a1 = (id *)v2[20];
  }
  return a1;
}

- (id)defaultMessagingAppIsMessages
{
  if (result)
  {
    uint64_t v1 = -[DDTextMessageAction defaultMessagingApp](result);
    v2 = [v1 bundleIdentifier];
    uint64_t v3 = [v2 isEqualToString:@"com.apple.MobileSMS"];

    return (id *)v3;
  }
  return result;
}

- (id)actionMessagingAppIsMessages
{
  if (result)
  {
    if (result[22])
    {
      uint64_t v1 = [result[22] bundleIdentifier];
      uint64_t v2 = [v1 isEqualToString:@"com.apple.MobileSMS"];

      return (id *)v2;
    }
    else
    {
      return -[DDTextMessageAction defaultMessagingAppIsMessages](result);
    }
  }
  return result;
}

- (int)interactionType
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];

  char v5 = [v4 isEqualToString:@"com.apple.MobileSMS.MessagesNotificationExtension"];
  int v6 = 0;
  if (self && (v5 & 1) == 0)
  {
    if (-[DDTextMessageAction actionMessagingAppIsMessages]((id *)&self->super.super.super.isa)
      && ![(NSString *)self->super._phoneNumber isEqualToString:@"open"])
    {
      double Helper_x8__OBJC_CLASS___MFMessageComposeViewController = gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(v7);
      if (objc_msgSend(*(id *)(v9 + 248), "canSendText", Helper_x8__OBJC_CLASS___MFMessageComposeViewController))int v6 = 2; {
      else
      }
        int v6 = 0;
    }
    else
    {
      int v6 = 0;
    }
  }

  return v6;
}

- (id)notificationTitle
{
  uint64_t v3 = self->super._phoneNumber;
  if ([(NSString *)self->super._phoneNumber isEqualToString:@"open"])
  {
    id v4 = NSString;
    char v5 = DDLocalizedString(@"Show in Messages");
    int v6 = [v4 stringWithFormat:v5];
  }
  else
  {
    char v5 = [(DDTelephoneNumberAction *)self contactAndLabelForPhoneNumber:0];
    if (v5)
    {
      double v7 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
      if ([v7 length])
      {
        objc_super v8 = v7;

        uint64_t v3 = v8;
      }
    }
    uint64_t v9 = [(DDTextMessageAction *)self serviceName];
    BOOL v10 = NSString;
    if (v9)
    {
      char v11 = DDLocalizedString(@"Compose a message to “%@” in %@");
      objc_msgSend(v10, "stringWithFormat:", v11, v3, v9);
    }
    else
    {
      char v11 = DDLocalizedString(@"Compose a message to “%@”");
      objc_msgSend(v10, "stringWithFormat:", v11, v3, v13);
    int v6 = };
  }
  return v6;
}

- (id)notificationIconBundleIdentifier
{
  uint64_t v2 = [(DDTextMessageAction *)self serviceIdentifier];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"com.apple.MobileSMS";
  }
  id v4 = v2;

  return v4;
}

- (id)_serviceIdentifier
{
  uint64_t v2 = [(DDTextMessageAction *)self serviceIdentifier];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"default.textmessage.service";
  }
  id v4 = v2;

  return v4;
}

- (id)serviceIdentifier
{
  uint64_t v3 = [(LSApplicationRecord *)self->_notificationURLHandler bundleIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = [(DDTextMessageAction *)self notificationURL];
    double v7 = [v6 scheme];
    objc_super v8 = [v7 lowercaseString];
    if ([v8 isEqualToString:@"im"])
    {
      uint64_t v9 = -[DDTextMessageAction defaultMessagingApp]((id *)&self->super.super.super.isa);
      id v5 = [v9 bundleIdentifier];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)notificationURL
{
  p_cachedNotificationURL = &self->_cachedNotificationURL;
  cachedNotificationURL = self->_cachedNotificationURL;
  if (cachedNotificationURL)
  {
    id v4 = cachedNotificationURL;
    goto LABEL_43;
  }
  if (self->super._serviceID
    || ([(DDTelephoneNumberAction *)self bizItem],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 messagesOpenURL],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    int v6 = [(NSURL *)self->super.super._url scheme];
    double v7 = [v6 lowercaseString];

    if (self->super._serviceID)
    {
      p_ignoreDefaultApps = &self->_ignoreDefaultApps;
      self->_ignoreDefaultApps = 1;
      goto LABEL_19;
    }
    if ([v7 isEqualToString:@"sms"])
    {
      BOOL v11 = [(NSString *)self->super._phoneNumber isEqualToString:@"open"];
      p_ignoreDefaultApps = &self->_ignoreDefaultApps;
      self->_ignoreDefaultApps = v11;
      if (v11) {
        goto LABEL_19;
      }
    }
    else
    {
      p_ignoreDefaultApps = &self->_ignoreDefaultApps;
      self->_ignoreDefaultApps = 0;
    }
    phoneNumber = self->super._phoneNumber;
    if (phoneNumber)
    {
      uint64_t v13 = phoneNumber;
      if ([(NSString *)v13 containsString:@"@"]) {
        uint64_t v14 = 3;
      }
      else {
        uint64_t v14 = 2;
      }
      v15 = (void *)[objc_alloc(MEMORY[0x1E4FADBD8]) initWithType:v14 value:v13];
      v16 = +[DDCallKitAudioAction providersIfHandleIsEmergency:v15];
      if ([v16 count]) {
        BOOL *p_ignoreDefaultApps = 1;
      }
    }
LABEL_19:
    if (self->super._serviceID)
    {
      if ([v7 isEqualToString:@"sip"])
      {
        uint64_t v17 = [NSString stringWithFormat:@"sms:%@?service_id=%@", self->super._phoneNumber, self->super._serviceID];
        body = self->super._body;
        if (body)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          v20 = [(NSString *)body stringByAddingPercentEncodingWithAllowedCharacters:v19];
          uint64_t v21 = [v17 stringByAppendingFormat:@"&body=%@", v20];

          uint64_t v17 = (void *)v21;
        }
        if (self->super._suggestions)
        {
          uint64_t v22 = [v17 stringByAppendingFormat:@"&suggestions=%@", self->super._suggestions];

          uint64_t v17 = (void *)v22;
        }
        uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
        goto LABEL_39;
      }
      if ([v7 isEqualToString:@"sms"])
      {
LABEL_36:
        v27 = self->super.super._url;
LABEL_41:
        objc_storeStrong((id *)p_cachedNotificationURL, v27);
        id v4 = v27;

        goto LABEL_42;
      }
      v25 = [MEMORY[0x1E4F29088] componentsWithURL:self->super.super._url resolvingAgainstBaseURL:0];
      uint64_t v17 = v25;
      v26 = @"sms";
    }
    else
    {
      if (*p_ignoreDefaultApps
        || ([v7 isEqualToString:@"im"] & 1) != 0
        || ([v7 isEqualToString:@"Messages"] & 1) != 0)
      {
        goto LABEL_36;
      }
      v24 = @"im";
      if (!self->_notificationURLHandler
        && -[DDTextMessageAction defaultMessagingAppIsMessages]((id *)&self->super.super.super.isa))
      {
        v24 = @"sms";
      }
      if ([v7 isEqualToString:v24]) {
        goto LABEL_36;
      }
      if (![v7 isEqualToString:@"sms"])
      {
        uint64_t v17 = [(NSURL *)self->super.super._url webSafeTelephoneURL];
        v29 = (void *)MEMORY[0x1E4F1CB10];
        v30 = NSString;
        v31 = @"im";
        if (!self->_notificationURLHandler
          && -[DDTextMessageAction defaultMessagingAppIsMessages]((id *)&self->super.super.super.isa))
        {
          v31 = @"sms";
        }
        v32 = [v17 resourceSpecifier];
        v33 = [v30 stringWithFormat:@"%@:%@", v31, v32];
        v27 = [v29 URLWithString:v33];

        goto LABEL_40;
      }
      v25 = [MEMORY[0x1E4F29088] componentsWithURL:self->super.super._url resolvingAgainstBaseURL:0];
      uint64_t v17 = v25;
      v26 = @"im";
    }
    [v25 setScheme:v26];
    uint64_t v23 = [v17 URL];
LABEL_39:
    v27 = (NSURL *)v23;
LABEL_40:

    goto LABEL_41;
  }
  self->_ignoreDefaultApps = 1;
  objc_storeStrong((id *)p_cachedNotificationURL, v10);
  id v4 = v10;
LABEL_42:

LABEL_43:
  return v4;
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  id v5 = [(DDTextMessageAction *)self notificationURL];
  [(DDAction *)self _performFromView:v4 byOpeningURL:v5];
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)viewController
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (!self->super.super._viewController
    && self->super._phoneNumber
    && -[DDTextMessageAction actionMessagingAppIsMessages]((id *)&self->super.super.super.isa))
  {
    gotLoadHelper_x8__OBJC_CLASS___MFMessageComposeViewController(v5);
    double v7 = (UIViewController *)objc_alloc_init(*(Class *)(v6 + 248));
    objc_super v8 = [(NSString *)self->super._phoneNumber dd_userFriendlyEmail];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(UIViewController *)v7 setRecipients:v9];

    [(UIViewController *)v7 setBody:self->super._body];
    [(UIViewController *)v7 setServiceId:self->super._serviceID];
    [(UIViewController *)v7 setSuggestions:self->super._suggestions];
    [(UIViewController *)v7 setMessageComposeDelegate:self];
    viewController = self->super.super._viewController;
    self->super.super._viewController = v7;
  }
  uint64_t v3 = self->super.super._viewController;
  return v3;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  objc_msgSend(a3, "setMessageComposeDelegate:", 0, a4);
  uint64_t v5 = [(DDAction *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    double v7 = [(DDAction *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(DDAction *)self delegate];
      [v9 actionDidFinish:self];
    }
  }
}

- (uint64_t)defaultAppClientAdoptionReady
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 56) objectForKeyedSubscript:@"HeyBarcodeSheet"];
    int v3 = [v2 BOOLValue];

    if (v3)
    {
      id v4 = [*(id *)(v1 + 56) objectForKeyedSubscript:@"135842921"];
      uint64_t v5 = [v4 BOOLValue];

      return v5;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)shouldAddDefaultApps
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v2 = [a1 notificationURL];
    if (v2 && !*(unsigned char *)(v1 + 184))
    {
      int v3 = -[DDTextMessageAction defaultMessagingApp]((id *)v1);
      id v4 = [v3 bundleIdentifier];
      if (v4) {
        uint64_t v1 = -[DDTextMessageAction defaultAppClientAdoptionReady](v1);
      }
      else {
        uint64_t v1 = 0;
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v33 = (objc_class *)a1;
  v34 = a4;
  v35 = v8;
  BOOL v10 = (id *)[objc_alloc((Class)a1) initWithURL:v8 result:a4 context:v9];
  BOOL v11 = [v10 handleString];

  if (v11)
  {
    __int16 v12 = [v9 objectForKeyedSubscript:@"defaultActionOnly"];

    if (v12)
    {
      v43[0] = v10;
      BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    }
    else
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
      if (-[DDTextMessageAction shouldAddDefaultApps](v10))
      {
        v31 = v13;
        v32 = v10;
        -[DDTextMessageAction defaultMessagingApp](v10);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v30 bundleIdentifier];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id obj = [MEMORY[0x1E4F223C8] enumeratorForViableDefaultAppsForCategory:3 options:0];
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v38 != v17) {
                objc_enumerationMutation(obj);
              }
              uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              v20 = [v19 bundleIdentifier];
              uint64_t v21 = v20;
              if (v20 && ([v20 isEqualToString:v14] & 1) == 0)
              {
                id v22 = v9;
                uint64_t v23 = (id *)[[v33 alloc] initWithURL:v35 result:v34 context:v9];
                v24 = [v32 handleString];

                if (v24)
                {
                  objc_storeStrong(v23 + 22, v19);
                  objc_storeStrong(v32 + 22, v30);
                  id v25 = v32[19];
                  v32[19] = 0;

                  [v31 addObject:v23];
                }

                id v9 = v22;
              }
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v16);
        }

        uint64_t v13 = v31;
        BOOL v10 = v32;
      }
      v26 = [v9 objectForKeyedSubscript:@"HeyBarcodeSheet"];
      int v27 = [v26 BOOLValue];

      if (v27)
      {
        v41 = v10;
        id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
      }
      else
      {
        id v28 = v13;
      }
      BOOL v11 = v28;
    }
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationURLHandler, 0);
  objc_storeStrong((id *)&self->_defaultMessagingApp, 0);
  objc_storeStrong((id *)&self->_cachedNotificationURL, 0);
}

@end