@interface DDCallAction
+ (BOOL)isAvailable;
+ (id)callProvider;
- (BOOL)_titleFitsInActionSheet:(BOOL)a1;
- (BOOL)canBePerformedByOpeningURL;
- (BOOL)isEmail;
- (__CFString)notificationTitleTargetString;
- (double)_systemFontSize;
- (id)callProvider;
- (id)defaultAction;
- (id)dialRequest;
- (id)dialRequestWithProvider:(id)a3;
- (id)handle;
- (id)localizedCallStringForName:(int)a3 usingCallRelay:;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (id)subtitle;
- (int)interactionType;
- (int64_t)TTYType;
- (void)performFromView:(id)a3;
@end

@implementation DDCallAction

- (id)defaultAction
{
  uint64_t v3 = [(id)objc_opt_class() actionWithURL:self->super.super._url result:self->super.super._result context:self->super.super._context];
  objc_storeStrong((id *)(v3 + 152), self->_handle);
  *(unsigned char *)(v3 + 160) = self->_preferNonDefaultApp;
  *(unsigned char *)(v3 + 82) = 1;
  return (id)v3;
}

- (id)handle
{
  handle = self->_handle;
  if (!handle)
  {
    if (self->super._phoneNumber)
    {
      objc_msgSend(MEMORY[0x1E4FADBD8], "normalizedHandleWithDestinationID:");
      v4 = (TUHandle *)objc_claimAutoreleasedReturnValue();
      v5 = self->_handle;
      self->_handle = v4;

      handle = self->_handle;
    }
    else
    {
      handle = 0;
    }
  }
  return handle;
}

- (double)_systemFontSize
{
  if (!a1) {
    return 0.0;
  }
  v1 = [MEMORY[0x1E4F42738] sharedApplication];
  v2 = [v1 preferredContentSizeCategory];

  double v3 = 21.0;
  if (([v2 isEqualToString:*MEMORY[0x1E4F437A8]] & 1) == 0
    && ([v2 isEqualToString:*MEMORY[0x1E4F437C8]] & 1) == 0
    && ([v2 isEqualToString:*MEMORY[0x1E4F437B8]] & 1) == 0
    && ([v2 isEqualToString:*MEMORY[0x1E4F437B0]] & 1) == 0)
  {
    double v3 = 22.0;
    if (([v2 isEqualToString:*MEMORY[0x1E4F437A0]] & 1) == 0)
    {
      if ([v2 isEqualToString:*MEMORY[0x1E4F43798]]) {
        double v3 = 23.0;
      }
      else {
        double v3 = 24.0;
      }
    }
  }

  return v3;
}

- (BOOL)_titleFitsInActionSheet:(BOOL)a1
{
  BOOL v2 = a1;
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v3 = (void *)MEMORY[0x1E4F42A30];
    id v4 = a2;
    v5 = [v3 systemFontOfSize:-[DDCallAction _systemFontSize](v2)];
    uint64_t v10 = *MEMORY[0x1E4F42508];
    v11[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v4 sizeWithAttributes:v6];
    double v8 = v7;

    BOOL v2 = v8 <= 304.0;
  }
  return v2;
}

- (id)localizedCallStringForName:(int)a3 usingCallRelay:
{
  id v5 = a2;
  if (a1)
  {
    if (!a3
      || ([MEMORY[0x1E4FADA80] supplementalDialTelephonyCallStringForDestination:v5 isPhoneNumber:0],
          (v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v7 = NSString;
      double v8 = DDLocalizedStringWithDefaultValue(@"CALL_PERSON", 0, 0, @"Call %@");
      v6 = objc_msgSend(v7, "stringWithFormat:", v8, v5);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)subtitle
{
  BOOL v2 = [(DDTelephoneNumberAction *)self bizItem];
  double v3 = [v2 callSubtitle];

  return v3;
}

- (id)localizedName
{
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __29__DDCallAction_localizedName__block_invoke;
  activity_block[3] = &unk_1E5A85F48;
  activity_block[4] = self;
  activity_block[5] = &v22;
  activity_block[6] = &v34;
  activity_block[7] = &v28;
  _os_activity_initiate(&dword_1A1709000, "searching for name in Contacts to display Call label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  int v3 = [MEMORY[0x1E4FADA88] supportsPrimaryCalling];
  if ([(id)v35[5] length])
  {
    if ([(id)v23[5] length])
    {
      id v4 = NSString;
      id v5 = DDLocalizedString(@"%@ (%@)");
      v6 = objc_msgSend(v4, "stringWithFormat:", v5, v35[5], v23[5]);

      double v7 = -[DDCallAction localizedCallStringForName:usingCallRelay:]((uint64_t)self, v6, v3 ^ 1);
      if (v7 && -[DDCallAction _titleFitsInActionSheet:]((BOOL)self, v7))
      {
        id v8 = v7;

        goto LABEL_36;
      }
    }
    else
    {
      double v7 = 0;
    }
    v9 = -[DDCallAction localizedCallStringForName:usingCallRelay:]((uint64_t)self, (void *)v35[5], v3 ^ 1);

    if (v9 && -[DDCallAction _titleFitsInActionSheet:]((BOOL)self, v9)) {
      goto LABEL_34;
    }
  }
  else
  {
    v9 = 0;
  }
  if (![(id)v29[5] length])
  {
LABEL_16:
    if (v3)
    {
LABEL_20:
      if (v9) {
        goto LABEL_43;
      }
      if ([(DDCallAction *)self isEmail])
      {
        v14 = self->super._phoneNumber;
      }
      else
      {
        v15 = [(NSURL *)self->super.super._url dd_formattedPhoneNumber];
        phoneNumber = v15;
        if (!v15) {
          phoneNumber = self->super._phoneNumber;
        }
        v14 = phoneNumber;
      }
      if (![(NSString *)v14 length])
      {

        v9 = 0;
        if (v3)
        {
LABEL_32:
          if (!v9)
          {
            v9 = DDLocalizedString(@"Call");
          }
          goto LABEL_34;
        }
LABEL_31:
        uint64_t v19 = [MEMORY[0x1E4FADA80] supplementalDialTelephonyCallString];

        v9 = (void *)v19;
        goto LABEL_32;
      }
      v17 = NSString;
      v18 = DDLocalizedStringWithDefaultValue(@"CALL_NUMBER", 0, 0, @"Call %@");
      v9 = objc_msgSend(v17, "stringWithFormat:", v18, v14);

      if (v9)
      {
LABEL_43:
        if (-[DDCallAction _titleFitsInActionSheet:]((BOOL)self, v9))
        {
LABEL_34:
          id v11 = v9;
          goto LABEL_35;
        }
      }
      if (v3) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
LABEL_17:
    v12 = self->super._phoneNumber;
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4FADA80] supplementalDialTelephonyCallStringForDestination:v12 isPhoneNumber:1];

      v9 = (void *)v13;
    }
    goto LABEL_20;
  }
  uint64_t v10 = -[DDCallAction localizedCallStringForName:usingCallRelay:]((uint64_t)self, (void *)v29[5], v3 ^ 1);

  if (!v10)
  {
    v9 = 0;
    goto LABEL_16;
  }
  if (!-[DDCallAction _titleFitsInActionSheet:]((BOOL)self, v10))
  {
    v9 = v10;
    if (v3) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  id v11 = v10;
LABEL_35:
  id v8 = v11;
LABEL_36:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v8;
}

void __29__DDCallAction_localizedName__block_invoke(void *a1)
{
  BOOL v2 = (void *)a1[4];
  if ([v2 treatAsMenu])
  {
    int v3 = [v2 contactAndLabelForPhoneNumber:0];
  }
  else
  {
    uint64_t v4 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v4 + 40);
    int v3 = [v2 contactAndLabelForPhoneNumber:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
  }
  uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  uint64_t v6 = *(void *)(a1[6] + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:1000];
  uint64_t v9 = *(void *)(a1[7] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (__CFString)notificationTitleTargetString
{
  if (a1)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    v18 = __Block_byref_object_dispose__5;
    id v19 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__5;
    v12[4] = __Block_byref_object_dispose__5;
    id v13 = 0;
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __45__DDCallAction_notificationTitleTargetString__block_invoke;
    activity_block[3] = &unk_1E5A85F70;
    activity_block[4] = a1;
    activity_block[5] = v12;
    activity_block[6] = &v14;
    _os_activity_initiate(&dword_1A1709000, "searching for name in Contacts to display Call label", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    int v2 = [a1 isEmail];
    int v3 = (void *)a1[14];
    if (v2)
    {
      uint64_t v4 = v3;
    }
    else if (v3)
    {
      uint64_t v5 = TUFormattedPhoneNumber();
      uint64_t v6 = v5;
      if (!v5) {
        uint64_t v6 = (void *)a1[14];
      }
      uint64_t v4 = v6;
    }
    else
    {
      uint64_t v4 = 0;
    }
    if ([(id)v15[5] length])
    {
      double v7 = [NSString stringWithFormat:@"%@\n%@", v15[5], v4];
    }
    else
    {
      uint64_t v8 = &stru_1EF5023D8;
      if (v4) {
        uint64_t v8 = v4;
      }
      double v7 = v8;
    }
    uint64_t v9 = v7;

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

void __45__DDCallAction_notificationTitleTargetString__block_invoke(void *a1)
{
  int v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 contactAndLabelForPhoneNumber:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
  uint64_t v6 = *(void *)(a1[6] + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)notificationTitle
{
  uint64_t v3 = NSString;
  uint64_t v4 = DDLocalizedString(@"Call %@");
  uint64_t v5 = -[DDCallAction notificationTitleTargetString](self);
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)dialRequest
{
  if (self->super._phoneNumber)
  {
    uint64_t v3 = [(DDCallAction *)self callProvider];
    uint64_t v4 = [(DDCallAction *)self dialRequestWithProvider:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)callProvider
{
  int v2 = objc_opt_class();
  return (id)[v2 callProvider];
}

- (id)dialRequestWithProvider:(id)a3
{
  id v4 = a3;
  if (v4 && self->super._phoneNumber)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithProvider:v4];
    uint64_t v6 = [(DDCallAction *)self handle];
    [v5 setHandle:v6];

    [v5 setPerformDialAssist:1];
    objc_msgSend(v5, "setTtyType:", -[DDCallAction TTYType](self, "TTYType"));
    [v5 setShowUIPrompt:self->super.super._isDefaultAction];
    [v5 setVideo:0];
    [v5 setPreferDefaultApp:!self->_preferNonDefaultApp];
    double v7 = [(NSURL *)self->super.super._url scheme];
    uint64_t v8 = [v7 lowercaseString];

    if ((DDResultHasType() & 1) != 0 || [MEMORY[0x1E4F1CB10] isDefaultAppScheme:v8])
    {
      if (self->super.super._isDefaultAction) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = dd_hostApplicationCanListCallProviders() ^ 1;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v5 setAllowProviderFallback:v9];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDCallAction *)self dialRequest];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDCallAction performFromView:]((uint64_t)v5);
  }
  uint64_t v6 = [MEMORY[0x1E4FADA90] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__DDCallAction_performFromView___block_invoke;
  v9[3] = &unk_1E5A85F98;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 launchAppForDialRequest:v8 completion:v9];
}

void __32__DDCallAction_performFromView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __32__DDCallAction_performFromView___block_invoke_cold_1(a1, v3);
    }
    id v4 = [*(id *)(a1 + 32) URL];

    if (v4)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      id v7 = [*(id *)(a1 + 32) URL];
      [v6 _performFromView:v5 byOpeningURL:v7];
    }
  }
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.mobilephone";
}

- (id)notificationURL
{
  id v3 = [(DDCallAction *)self dialRequest];
  url = [v3 URL];
  uint64_t v5 = url;
  if (!url) {
    url = self->super.super._url;
  }
  id v6 = url;

  return v6;
}

- (int)interactionType
{
  return 0;
}

- (int64_t)TTYType
{
  return !self->super.super._isDefaultAction;
}

+ (id)callProvider
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
  id v3 = [v2 telephonyProvider];

  return v3;
}

+ (BOOL)isAvailable
{
  if (![MEMORY[0x1E4FADA88] supportsTelephonyCalls]) {
    return 0;
  }
  id v3 = [a1 callProvider];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isEmail
{
  return [(NSString *)self->super._phoneNumber containsString:@"@"];
}

- (void).cxx_destruct
{
}

- (void)performFromView:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Will initiate call with dial request '%@'", (uint8_t *)&v1, 0xCu);
}

void __32__DDCallAction_performFromView___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 localizedDescription];
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "An error occurred while trying to launch external app with dial request '%@': %@", (uint8_t *)&v4, 0x16u);
}

@end