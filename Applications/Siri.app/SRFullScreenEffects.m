@interface SRFullScreenEffects
- (id)_effectForIdentifier:(id)a3;
- (id)_fullscreenEffectMap;
- (id)effectForAceObject:(id)a3;
@end

@implementation SRFullScreenEffects

- (id)effectForAceObject:(id)a3
{
  v4 = [a3 fullScreenEffectType];
  if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeCONFETTIValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKConfettiEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeLASERSValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKLasersEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeFIREWORKSValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKFireworksEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeSHOOTINGSTARValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKShootingStarEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeBALLOONSValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKHappyBirthdayEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeSPARKLESValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKSparklesEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeLOVEValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKHeartEffect";
  }
  else if ([v4 isEqualToString:SAUIShowFullScreenEffectEffectTypeSPOTLIGHTValue])
  {
    CFStringRef v5 = @"com.apple.messages.effect.CKSpotlightEffect";
  }
  else
  {
    CFStringRef v5 = 0;
  }
  v6 = [(SRFullScreenEffects *)self _effectForIdentifier:v5];

  return v6;
}

- (id)_effectForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFStringRef v5 = [(SRFullScreenEffects *)self _fullscreenEffectMap];
    v6 = [v5 objectForKey:v4];

    if (v6)
    {
      if (([v6 isLoaded] & 1) == 0) {
        [v6 load];
      }
      id v7 = objc_alloc_init((Class)[v6 principalClass]);
      [v7 setIdentifier:v4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_fullscreenEffectMap
{
  fullscreenEffectMapInternal = self->_fullscreenEffectMapInternal;
  if (!fullscreenEffectMapInternal)
  {
    v18 = self;
    id v4 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v5 = +[NSFileManager defaultManager];
    v6 = +[NSURL fileURLWithPath:@"/System/Library/Messages/iMessageEffects"];
    id v7 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:7 errorHandler:&stru_100143970];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [objc_alloc((Class)NSBundle) initWithURL:*(void *)(*((void *)&v19 + 1) + 8 * (void)v12)];
          v14 = [v13 bundleIdentifier];
          if (v14)
          {
            [(NSDictionary *)v4 setObject:v13 forKey:v14];
          }
          else
          {
            v15 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "-[SRFullScreenEffects _fullscreenEffectMap]";
              __int16 v25 = 2112;
              id v26 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failed to get bundle identifier for %@", buf, 0x16u);
            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v10);
    }

    v16 = v18->_fullscreenEffectMapInternal;
    v18->_fullscreenEffectMapInternal = v4;

    fullscreenEffectMapInternal = v18->_fullscreenEffectMapInternal;
  }

  return fullscreenEffectMapInternal;
}

- (void).cxx_destruct
{
}

@end