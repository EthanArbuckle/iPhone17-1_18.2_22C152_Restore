@interface CLBAlertViewController
+ (int)tokenFromDictionary:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)hasAlternateResponse;
- (BOOL)hasOtherResponse;
- (CLBSound)sound;
- (NSArray)textFieldValues;
- (NSDictionary)vibrationPattern;
- (NSString)alertMessage;
- (NSString)alertTitle;
- (NSString)alternateButtonTitle;
- (NSString)alternateTitleKey;
- (NSString)defaultButtonTitle;
- (NSString)defaultTitleKey;
- (NSString)otherButtonTitle;
- (NSString)otherTitleKey;
- (NSString)soundAlertTopic;
- (NSString)soundPath;
- (double)soundRepeatDuration;
- (id)_localizedStringValue:(id)a3;
- (id)_localizedValue:(id)a3;
- (id)completionBlock;
- (id)initFromDictionary:(id)a3 replyPort:(unsigned int)a4;
- (id)makeSwiftUIViewController;
- (int)token;
- (int64_t)soundAlertType;
- (unsigned)soundID;
- (unsigned)soundIDBehavior;
- (void)alternateResponse;
- (void)cancel;
- (void)defaultResponse;
- (void)otherResponse;
- (void)replyWithResult:(unint64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setToken:(int)a3;
@end

@implementation CLBAlertViewController

+ (int)tokenFromDictionary:(id)a3
{
  v3 = [a3 objectForKey:off_10017B310];
  int v4 = [v3 intValue];

  return v4;
}

- (id)initFromDictionary:(id)a3 replyPort:(unsigned int)a4
{
  id v6 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CLBAlertViewController;
  v7 = [(CLBAlertViewController *)&v54 init];
  v8 = v7;
  if (v7)
  {
    v7->_replyPort = a4;
    if (v6)
    {
      v9 = [v6 objectForKey:off_10017B310];
      v8->_token = [v9 intValue];

      v10 = [v6 objectForKey:off_10017B318];
      if (v10)
      {
        v11 = (BSCFBundle *)[objc_alloc((Class)BSCFBundle) initWithPath:v10];
        localizationBundle = v8->_localizationBundle;
        v8->_localizationBundle = v11;
      }
      v13 = [v6 objectForKey:kCFUserNotificationAlertHeaderKey];
      v14 = [(CLBAlertViewController *)v8 _localizedValue:v13];

      if (v14) {
        v15 = v14;
      }
      else {
        v15 = &stru_100167328;
      }
      objc_storeStrong((id *)&v8->_alertTitle, v15);
      v16 = [v6 objectForKey:kCFUserNotificationAlertMessageKey];
      v17 = [(CLBAlertViewController *)v8 _localizedValue:v16];

      if (v17) {
        v18 = v17;
      }
      else {
        v18 = &stru_100167328;
      }
      objc_storeStrong((id *)&v8->_alertMessage, v18);
      uint64_t v19 = objc_msgSend(v6, "bs_safeStringForKey:", kCFUserNotificationSoundPathKey);
      soundPath = v8->_soundPath;
      v8->_soundPath = (NSString *)v19;

      v21 = objc_msgSend(v6, "bs_safeNumberForKey:", @"SBUserNotificationSystemSoundID");
      v8->_soundID = [v21 unsignedIntValue];

      v22 = objc_msgSend(v6, "bs_safeNumberForKey:", @"SBUserNotificationSystemSoundBehavior");
      v23 = v22;
      if (v22) {
        unsigned int v24 = [v22 unsignedIntValue];
      }
      else {
        unsigned int v24 = 1;
      }
      v8->_soundIDBehavior = v24;
      uint64_t v25 = objc_msgSend(v6, "bs_safeDictionaryForKey:", @"SBUserNotificationSoundVibrationPattern");
      vibrationPattern = v8->_vibrationPattern;
      v8->_vibrationPattern = (NSDictionary *)v25;

      objc_msgSend(v6, "bs_safeNumberForKey:", @"SBUserNotificationSoundAlertTypeKey");
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27) {
        id v27 = [v27 integerValue];
      }
      v8->_soundAlertType = (int64_t)v27;
      uint64_t v29 = objc_msgSend(v6, "bs_safeStringForKey:", @"SBUserNotificationSoundAlertTopicKey");
      soundAlertTopic = v8->_soundAlertTopic;
      v8->_soundAlertTopic = (NSString *)v29;

      v31 = objc_msgSend(v6, "bs_safeNumberForKey:", @"SBUserNotificationSoundRepeatDuration");
      [v31 doubleValue];
      v8->_soundRepeatDuration = v32;

      uint64_t v33 = [v6 objectForKey:kCFUserNotificationDefaultButtonTitleKey];
      defaultTitleKey = v8->_defaultTitleKey;
      v8->_defaultTitleKey = (NSString *)v33;

      uint64_t v35 = [(CLBAlertViewController *)v8 _localizedValue:v8->_defaultTitleKey];
      v36 = (void *)v35;
      if (v35) {
        v37 = (__CFString *)v35;
      }
      else {
        v37 = @"OK";
      }
      objc_storeStrong((id *)&v8->_defaultButtonTitle, v37);

      uint64_t v38 = [v6 objectForKey:kCFUserNotificationAlternateButtonTitleKey];
      alternateTitleKey = v8->_alternateTitleKey;
      v8->_alternateTitleKey = (NSString *)v38;

      uint64_t v40 = [(CLBAlertViewController *)v8 _localizedValue:v8->_alternateTitleKey];
      alternateButtonTitle = v8->_alternateButtonTitle;
      v8->_alternateButtonTitle = (NSString *)v40;

      uint64_t v42 = [v6 objectForKey:kCFUserNotificationOtherButtonTitleKey];
      otherTitleKey = v8->_otherTitleKey;
      v8->_otherTitleKey = (NSString *)v42;

      uint64_t v44 = [(CLBAlertViewController *)v8 _localizedValue:v8->_otherTitleKey];
      otherButtonTitle = v8->_otherButtonTitle;
      v8->_otherButtonTitle = (NSString *)v44;

      v46 = [v6 objectForKey:kCFUserNotificationTextFieldValuesKey];
      uint64_t v47 = [(CLBAlertViewController *)v8 _localizedValue:v46];
      textFieldValues = v8->_textFieldValues;
      v8->_textFieldValues = (NSArray *)v47;

      v49 = [(CLBAlertViewController *)v8 makeSwiftUIViewController];
      [(CLBAlertViewController *)v8 addChildViewController:v49];
      v50 = [v49 view];
      v51 = [(CLBAlertViewController *)v8 view];
      [v51 bounds];
      objc_msgSend(v50, "setFrame:");

      [v50 setAutoresizingMask:18];
      v52 = [(CLBAlertViewController *)v8 view];
      [v52 addSubview:v50];

      [v49 didMoveToParentViewController:v8];
    }
    else
    {
      [(CLBAlertViewController *)v7 cancel];
    }
  }

  return v8;
}

- (void)defaultResponse
{
}

- (BOOL)hasAlternateResponse
{
  return self->_alternateButtonTitle != 0;
}

- (void)alternateResponse
{
}

- (BOOL)hasOtherResponse
{
  return self->_otherButtonTitle != 0;
}

- (void)otherResponse
{
}

- (void)cancel
{
}

- (void)replyWithResult:(unint64_t)a3
{
  mach_msg_id_t v3 = a3;
  if (a3 == 3
    || ([(CLBAlertViewController *)self textFieldValues],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        !v6))
  {
    id v14 = 0;
    mach_msg_size_t v10 = 28;
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = [(CLBAlertViewController *)self textFieldValues];
    [v7 setObject:v8 forKey:kCFUserNotificationTextFieldValuesKey];

    v9 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:100 options:0 error:0];
    id v14 = v9;
    if (v9) {
      mach_msg_size_t v10 = (([v9 length] + 3) & 0xFFFFFFFC) + 28;
    }
    else {
      mach_msg_size_t v10 = 28;
    }
  }
  v11 = (mach_msg_header_t *)malloc_type_calloc(v10, 1uLL, 0xB212DE29uLL);
  if (v11)
  {
    v12 = v11;
    v11->msgh_bits = 18;
    v11->msgh_size = v10;
    *(void *)&v11->msgh_remote_port = self->_replyPort;
    v11->msgh_id = v3;
    v11[1].msgh_bits = 0;
    if (v14) {
      objc_msgSend(v14, "getBytes:length:", &v11[1].msgh_size, objc_msgSend(v14, "length"));
    }
    if (!mach_msg(v12, 1, v10, 0, 0, 0, 0)) {
      self->_replyPort = 0;
    }
    free(v12);
  }
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock) {
    completionBlock[2]();
  }
}

- (id)_localizedStringValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    localizationBundle = self->_localizationBundle;
    if (localizationBundle)
    {
      id v6 = [(BSCFBundle *)localizationBundle localizedStringForKey:v4 value:&stru_100167328 table:0];
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_localizedValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[CLBAlertViewController _localizedStringValue:](self, "_localizedStringValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = [(CLBAlertViewController *)self _localizedStringValue:v4];
  }

  return v5;
}

- (CLBSound)sound
{
  if (!self->_sound)
  {
    mach_msg_id_t v3 = [(CLBAlertViewController *)self soundPath];

    if (v3)
    {
      id v4 = [(CLBAlertViewController *)self soundPath];
      v5 = +[NSURL fileURLWithPath:v4];

      if (v5)
      {
        int64_t v6 = [(CLBAlertViewController *)self soundAlertType];
        id v7 = objc_alloc((Class)TLAlertConfiguration);
        if (v6)
        {
          id v8 = objc_msgSend(v7, "initWithType:", -[CLBAlertViewController soundAlertType](self, "soundAlertType"));
          uint64_t v9 = [(CLBAlertViewController *)self soundAlertTopic];
          [v8 setTopic:v9];
        }
        else
        {
          id v8 = [v7 initWithType:16];
          [v8 setTopic:TLAlertTopicSystemNotificationGeneric];
        }
        [v8 setExternalToneFileURL:v5];
        [(CLBAlertViewController *)self soundRepeatDuration];
        [v8 setShouldRepeat:v16 > 0.0];
        [(CLBAlertViewController *)self soundRepeatDuration];
        -[NSObject setMaximumDuration:](v8, "setMaximumDuration:");
        v17 = [(CLBAlertViewController *)self vibrationPattern];

        if (v17)
        {
          v18 = [(CLBAlertViewController *)self vibrationPattern];
          [v8 setExternalVibrationPattern:v18];
        }
        else
        {
          [v8 setVibrationIdentifier:TLVibrationIdentifierNone];
        }
        uint64_t v19 = [[CLBSound alloc] initWithToneAlertConfiguration:v8];
        sound = self->_sound;
        self->_sound = v19;
      }
      else
      {
        id v8 = +[CLFLog commonLog];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000FFC20(self, v8);
        }
      }
    }
    else if ([(CLBAlertViewController *)self soundID])
    {
      mach_msg_size_t v10 = [CLBSound alloc];
      uint64_t v11 = [(CLBAlertViewController *)self soundID];
      uint64_t v12 = [(CLBAlertViewController *)self soundIDBehavior];
      long long v13 = [(CLBAlertViewController *)self vibrationPattern];
      long long v14 = [(CLBSound *)v10 initWithSystemSoundID:v11 behavior:v12 vibrationPattern:v13];
      long long v15 = self->_sound;
      self->_sound = v14;
    }
  }
  v21 = self->_sound;

  return v21;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (NSString)otherTitleKey
{
  return self->_otherTitleKey;
}

- (NSString)alternateTitleKey
{
  return self->_alternateTitleKey;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)defaultTitleKey
{
  return self->_defaultTitleKey;
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (NSString)soundPath
{
  return self->_soundPath;
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (NSString)soundAlertTopic
{
  return self->_soundAlertTopic;
}

- (double)soundRepeatDuration
{
  return self->_soundRepeatDuration;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (unsigned)soundID
{
  return self->_soundID;
}

- (unsigned)soundIDBehavior
{
  return self->_soundIDBehavior;
}

- (NSArray)textFieldValues
{
  return self->_textFieldValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldValues, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_soundAlertTopic, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultTitleKey, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_alternateTitleKey, 0);
  objc_storeStrong((id *)&self->_otherTitleKey, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_sound, 0);

  objc_storeStrong((id *)&self->_localizationBundle, 0);
}

- (id)makeSwiftUIViewController
{
  v2 = self;
  id v3 = sub_100047070();

  return v3;
}

@end