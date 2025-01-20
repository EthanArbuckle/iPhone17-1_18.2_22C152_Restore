@interface VOTOutputComponent
- (AXVoiceOverActivity)lastUsedActivity;
- (BOOL)determineOutputMutedForActivity:(id)a3;
- (BOOL)stringIsInSupportedCharacters:(id)a3;
- (VOTOutputComponent)init;
- (double)lastUsedActivityTime;
- (double)outputMutedActivityLastToggleTime;
- (id)determineActivityForAction:(id)a3;
- (id)determineLanguageForAction:(id)a3 overrideLanguage:(id)a4 targetLanguage:(id)a5;
- (id)determineLanguageForEvent:(id)a3;
- (id)outputMutedActivityValue:(id)a3;
- (void)notifyActionComplete:(id)a3;
- (void)notifyRangeWillOutput:(_NSRange)a3 container:(id)a4;
- (void)performAction:(id)a3 owner:(id)a4;
- (void)setCurrentOutputActionID:(unint64_t)a3;
- (void)setLastUsedActivity:(id)a3;
- (void)setLastUsedActivityTime:(double)a3;
@end

@implementation VOTOutputComponent

- (VOTOutputComponent)init
{
  v6.receiver = self;
  v6.super_class = (Class)VOTOutputComponent;
  v2 = [(VOTOutputComponent *)&v6 init];
  v3 = (SCRCThreadKey *)[objc_allocWithZone((Class)SCRCThreadKey) initWithObject:v2];
  threadKey = v2->_threadKey;
  v2->_threadKey = v3;

  return v2;
}

- (void)performAction:(id)a3 owner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VOTOutputComponent *)self preprocessAction:v7];
  -[VOTOutputComponent setCurrentOutputActionID:](self, "setCurrentOutputActionID:", [v7 outputActionID]);
  id v11 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:6];
  id v8 = [objc_allocWithZone((Class)AXIndexMap) init];
  [v8 setObject:v11 forIndex:1];
  [v8 setObject:v7 forIndex:14];
  [v8 setObject:v6 forIndex:13];

  v9 = [v7 outputRequest];

  v10 = [v9 language];
  [v8 setObject:v10 forIndex:15];

  [(VOTOutputComponent *)self performSelector:"handleEvent:" withThreadKey:self->_threadKey waitTime:0 cancelMask:1 count:v8 objects:kSCRCThreadNoWait];
}

- (BOOL)determineOutputMutedForActivity:(id)a3
{
  v4 = [(VOTOutputComponent *)self determineActivityForAction:a3];
  v5 = [(VOTOutputComponent *)self outputMutedActivityValue:v4];

  if (v5)
  {
    id v6 = [(VOTOutputComponent *)self lastUsedActivity];
    unsigned __int8 v7 = [v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(VOTOutputComponent *)self setLastUsedActivity:v4];
      [(VOTOutputComponent *)self setLastUsedActivityTime:CFAbsoluteTimeGetCurrent()];
    }
    [(VOTOutputComponent *)self outputMutedActivityLastToggleTime];
    double v9 = v8;
    [(VOTOutputComponent *)self lastUsedActivityTime];
    if (v9 <= v10)
    {
      v13 = [(VOTOutputComponent *)self outputMutedActivityValue:v4];
      unsigned __int8 v12 = [v13 BOOLValue];

      goto LABEL_11;
    }
    id v11 = VOTLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not using activity speech mute because we toggled speech muted more recently", v15, 2u);
    }
  }
  else
  {
    [(VOTOutputComponent *)self setLastUsedActivity:0];
  }
  unsigned __int8 v12 = 0;
LABEL_11:

  return v12;
}

- (id)determineActivityForAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForVariant:81];

  if (v4)
  {
    v5 = [v3 objectForVariant:81];
  }
  else
  {
    v5 = [(id)VOTSharedWorkspace selectedActivity];
    if (!v5)
    {
      uint64_t v6 = [v3 objectForVariant:79];
      if (!v6) {
        goto LABEL_6;
      }
      unsigned __int8 v7 = (void *)v6;
      double v8 = [(id)VOTSharedWorkspace activities];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000B7BC;
      v19[3] = &unk_1001B3370;
      v19[4] = v7;
      double v9 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", v19);
      v5 = [v9 firstObject];

      if (!v5)
      {
LABEL_6:
        double v10 = [v3 objectForVariant:43];
        if (v10)
        {
          id v11 = [(id)VOTSharedWorkspace activities];
          v14 = _NSConcreteStackBlock;
          uint64_t v15 = 3221225472;
          v16 = sub_10000B800;
          v17 = &unk_1001B3370;
          id v18 = v10;
          unsigned __int8 v12 = objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &v14);
          v5 = objc_msgSend(v12, "firstObject", v14, v15, v16, v17);
        }
        else
        {
          v5 = 0;
        }
      }
    }
    [v3 setObject:v5 forVariant:81];
  }

  return v5;
}

- (void)setCurrentOutputActionID:(unint64_t)a3
{
  self->_currentOutputActionID = a3;
}

- (void)notifyRangeWillOutput:(_NSRange)a3 container:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a4;
  uint64_t v6 = [v10 objectForIndex:13];
  if (v6)
  {
    id v7 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:22];
    id v8 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:5];
    double v9 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", location, length);
    [v10 setObject:v9 forIndex:14];

    [v10 setObject:v7 forIndex:10];
    [v10 setObject:v8 forIndex:1];
    [v6 performSelector:"handleEvent:" withThreadKey:v6 count:1 objects:v10];
  }
}

- (void)notifyActionComplete:(id)a3
{
  id v8 = a3;
  id v3 = [v8 objectForIndex:13];
  if (v3)
  {
    id v4 = v8;
    if (!v8) {
      id v4 = [objc_allocWithZone((Class)AXIndexMap) init];
    }
    id v8 = v4;
    id v5 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:19];
    id v6 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:5];
    id v7 = [v8 objectForIndex:11];
    [v8 setObject:v7 forIndex:14];

    [v8 setObject:v5 forIndex:10];
    [v8 setObject:v6 forIndex:1];
    [v3 performSelector:"handleEvent:" withThreadKey:v3 count:1 objects:v8];
  }
}

- (id)determineLanguageForAction:(id)a3 overrideLanguage:(id)a4 targetLanguage:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  if (v9)
  {
    id v10 = (id)v9;
    char v11 = 1;
  }
  else
  {
    unsigned __int8 v12 = [(id)VOTSharedWorkspace selectedLanguage];

    if (v12)
    {
      v13 = [(id)VOTSharedWorkspace selectedLanguage];
      v14 = AXLanguageConvertToCanonicalForm();

      if ([v14 length]) {
        goto LABEL_10;
      }
    }
    id v10 = v8;
    if (!v10)
    {
      id v10 = [v7 objectForVariant:15];
    }
    uint64_t v15 = +[AXSettings sharedInstance];
    char v11 = [v15 voiceOverLanguageDetectionEnabled] ^ 1;
  }
  v16 = [v7 string];
  v17 = +[VOTOutputManager outputManager];
  id v18 = [v17 currentLanguageMap];
  v14 = sub_1000510DC(v10, v16, v11, v7, v18);

LABEL_10:

  return v14;
}

- (id)determineLanguageForEvent:(id)a3
{
  id v4 = [a3 objectForIndex:14];
  id v5 = [v4 objectForVariant:16];
  id v6 = [v4 objectForVariant:15];
  id v7 = [(VOTOutputComponent *)self determineLanguageForAction:v4 overrideLanguage:v5 targetLanguage:v6];

  return v7;
}

- (BOOL)stringIsInSupportedCharacters:(id)a3
{
  return 1;
}

- (AXVoiceOverActivity)lastUsedActivity
{
  return self->_lastUsedActivity;
}

- (void)setLastUsedActivity:(id)a3
{
}

- (double)lastUsedActivityTime
{
  return self->_lastUsedActivityTime;
}

- (void)setLastUsedActivityTime:(double)a3
{
  self->_lastUsedActivityTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedActivity, 0);

  objc_storeStrong((id *)&self->_threadKey, 0);
}

- (id)outputMutedActivityValue:(id)a3
{
  return 0;
}

- (double)outputMutedActivityLastToggleTime
{
  return 0.0;
}

@end