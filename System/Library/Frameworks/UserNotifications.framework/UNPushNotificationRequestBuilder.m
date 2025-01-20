@interface UNPushNotificationRequestBuilder
- (UNPushNotificationRequestBuilder)initWithIdentifier:(id)a3 payload:(id)a4 bundleIdentifier:(id)a5;
- (id)_sanitizeAPSDictionary:(id)a3;
- (id)_sanitizeAlert:(id)a3;
- (id)_sanitizeFlag:(id)a3;
- (id)_sanitizeInterruptionLevelString:(id)a3;
- (id)_sanitizeLocalizationArgumentsArray:(id)a3;
- (id)_sanitizeRelevanceScore:(id)a3;
- (id)_sanitizeSound:(id)a3;
- (id)_sanitizeStringArray:(id)a3;
- (id)_sanitizeTopicIdentifier:(id)a3;
- (id)_sanitizeUnsignedInteger:(id)a3;
- (id)_sanitizeVolume:(id)a3;
- (id)buildNotificationRequest;
- (id)buildSafePayload;
- (unint64_t)_interruptionLevelForString:(id)a3;
@end

@implementation UNPushNotificationRequestBuilder

- (UNPushNotificationRequestBuilder)initWithIdentifier:(id)a3 payload:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNPushNotificationRequestBuilder;
  v11 = [(UNPushNotificationRequestBuilder *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v14;

    uint64_t v16 = [v10 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v16;
  }
  return v11;
}

- (id)buildNotificationRequest
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v3 = [(UNPushNotificationRequestBuilder *)self buildSafePayload];
  if (!v3)
  {
    v5 = 0;
    goto LABEL_54;
  }
  v72 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:self->_bundleIdentifier];
  v71 = [v72 bundleURL];
  if (v71) {
    uint64_t Unique = _CFBundleCreateUnique();
  }
  else {
    uint64_t Unique = 0;
  }
  v6 = objc_alloc_init(UNMutableNotificationContent);
  [(UNMutableNotificationContent *)v6 setUserInfo:self->_payload];
  v7 = objc_msgSend(v3, "un_safeCastObjectForKey:class:", @"aps", objc_opt_class());
  uint64_t v8 = [v7 objectForKey:@"alert"];
  CFTypeRef cf = (CFTypeRef)Unique;
  v70 = (void *)v8;
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = objc_opt_class();
    v11 = UNSafeCast(v10, v9);
    if (v11)
    {
      [(UNMutableNotificationContent *)v6 setBody:v11];
    }
    else
    {
      v64 = v3;
      id v12 = v9;
      uint64_t v13 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"body", objc_opt_class());
      v68 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"loc-key", objc_opt_class());
      if (v68 && Unique)
      {
        uint64_t v14 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"loc-args", objc_opt_class());
        uint64_t v15 = +[UNLocalizedStringFactory localizedUserNotificationStringForKey:v68 arguments:v14 cfBundle:Unique defaultValue:v13];
        uint64_t v16 = (void *)v13;
        uint64_t v13 = v15;
      }
      [(UNMutableNotificationContent *)v6 setBody:v13];
      uint64_t v17 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"subtitle", objc_opt_class());
      v66 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"subtitle-loc-key", objc_opt_class());
      v63 = (void *)v13;
      if (v66 && Unique)
      {
        objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"subtitle-loc-args", objc_opt_class());
        objc_super v19 = v18 = (void *)v17;
        uint64_t v20 = +[UNLocalizedStringFactory localizedUserNotificationStringForKey:v66 arguments:v19 cfBundle:Unique defaultValue:v18];

        uint64_t v17 = v20;
      }
      [(UNMutableNotificationContent *)v6 setSubtitle:v17];
      v21 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"title", objc_opt_class());
      v22 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"title-loc-key", objc_opt_class());
      v62 = (void *)v17;
      if (v22 && cf)
      {
        v23 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"title-loc-args", objc_opt_class());
        uint64_t v24 = +[UNLocalizedStringFactory localizedUserNotificationStringForKey:v22 arguments:v23 cfBundle:cf defaultValue:v21];

        v21 = (void *)v24;
      }
      [(UNMutableNotificationContent *)v6 setTitle:v21];
      v25 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"summary-arg", objc_opt_class());
      [(UNMutableNotificationContent *)v6 setSummaryArgument:v25];

      v26 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"summary-arg-count", objc_opt_class());
      -[UNMutableNotificationContent setSummaryArgumentCount:](v6, "setSummaryArgumentCount:", [v26 unsignedIntegerValue]);

      v27 = objc_msgSend(v12, "un_safeCastObjectForKey:class:", @"launch-image", objc_opt_class());
      [(UNMutableNotificationContent *)v6 setLaunchImageName:v27];

      v3 = v64;
    }
  }
  v28 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"badge", objc_opt_class());
  [(UNMutableNotificationContent *)v6 setBadge:v28];

  v29 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"category", objc_opt_class());
  [(UNMutableNotificationContent *)v6 setCategoryIdentifier:v29];

  v30 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"thread-id", objc_opt_class());
  [(UNMutableNotificationContent *)v6 setThreadIdentifier:v30];

  v31 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"target-content-id", objc_opt_class());
  [(UNMutableNotificationContent *)v6 setTargetContentIdentifier:v31];

  uint64_t v32 = [v7 objectForKey:@"interruption-level"];
  v69 = (void *)v32;
  if (v32) {
    unint64_t v33 = [(UNPushNotificationRequestBuilder *)self _interruptionLevelForString:v32];
  }
  else {
    unint64_t v33 = 1;
  }
  [(UNMutableNotificationContent *)v6 setInterruptionLevel:v33];
  v34 = [v7 objectForKey:@"relevance-score"];
  v35 = v34;
  if (v34)
  {
    [v34 doubleValue];
    -[UNMutableNotificationContent setRelevanceScore:](v6, "setRelevanceScore:");
  }
  v67 = v35;
  v36 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"filter-criteria", objc_opt_class());
  [(UNMutableNotificationContent *)v6 setFilterCriteria:v36];

  v37 = [v7 objectForKey:@"sound"];
  if (v37)
  {
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = UNSafeCast(v38, v37);
    if (v39)
    {
      v40 = (void *)v39;
      v41 = 0;
      int v42 = 0;
    }
    else
    {
      v65 = v3;
      id v43 = v37;
      v40 = objc_msgSend(v43, "un_safeCastObjectForKey:class:", @"name", objc_opt_class());
      v44 = objc_msgSend(v43, "un_safeCastObjectForKey:class:", @"critical", objc_opt_class());
      int v42 = [v44 BOOLValue];

      v41 = objc_msgSend(v43, "un_safeCastObjectForKey:class:", @"volume", objc_opt_class());

      if (!v40)
      {
        BOOL v46 = v33 == 3;
        v3 = v65;
        goto LABEL_38;
      }
      v3 = v65;
    }
    int v45 = [v40 isEqualToString:@"default"];
    BOOL v46 = v33 == 3;
    if (!v45)
    {
      char v47 = v42 ^ 1;
      if (v33 == 3) {
        char v47 = 0;
      }
      if (v47)
      {
        uint64_t v48 = +[UNNotificationSound soundNamed:v40];
        goto LABEL_43;
      }
      if (v41)
      {
        [v41 floatValue];
        uint64_t v48 = +[UNNotificationSound criticalSoundNamed:withAudioVolume:](UNNotificationSound, "criticalSoundNamed:withAudioVolume:", v40);
LABEL_43:
        v49 = (void *)v48;
        [(UNMutableNotificationContent *)v6 setSound:v48];

LABEL_44:
        goto LABEL_45;
      }
      uint64_t v61 = +[UNNotificationSound criticalSoundNamed:v40];
LABEL_59:
      v41 = (void *)v61;
      [(UNMutableNotificationContent *)v6 setSound:v61];
      goto LABEL_44;
    }
LABEL_38:
    if (!v46 && !v42)
    {
      uint64_t v48 = +[UNNotificationSound defaultSound];
      goto LABEL_43;
    }
    if (v41)
    {
      [v41 floatValue];
      uint64_t v48 = +[UNNotificationSound defaultCriticalSoundWithAudioVolume:](UNNotificationSound, "defaultCriticalSoundWithAudioVolume:");
      goto LABEL_43;
    }
    uint64_t v61 = +[UNNotificationSound defaultCriticalSound];
    goto LABEL_59;
  }
LABEL_45:
  v50 = [v7 objectForKey:@"topic-id"];
  if (v50)
  {
    uint64_t v51 = objc_opt_class();
    v52 = UNSafeCast(v51, v50);
    if (!v52)
    {
      v74[0] = v50;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
    }
    v53 = [(UNPushNotificationRequestBuilder *)self _sanitizeStringArray:v52];
    if (v53)
    {
      v54 = [MEMORY[0x1E4F1CAD0] setWithArray:v53];
      [(UNMutableNotificationContent *)v6 setTopicIdentifiers:v54];
    }
  }
  v55 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"content-available", objc_opt_class());
  uint64_t v56 = [v55 isEqual:&unk_1F0637618];

  v57 = objc_msgSend(v7, "un_safeCastObjectForKey:class:", @"mutable-content", objc_opt_class());
  uint64_t v58 = [v57 isEqual:&unk_1F0637618];

  v59 = +[UNPushNotificationTrigger triggerWithContentAvailable:v56 mutableContent:v58];
  v5 = +[UNNotificationRequest requestWithIdentifier:self->_identifier content:v6 trigger:v59];
  if (cf) {
    CFRelease(cf);
  }

LABEL_54:

  return v5;
}

- (id)buildSafePayload
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = [(NSDictionary *)self->_payload un_safeCastObjectForKey:@"aps" class:objc_opt_class()];
  v4 = -[UNPushNotificationRequestBuilder _sanitizeAPSDictionary:](self, "_sanitizeAPSDictionary:");
  objc_msgSend(v3, "un_safeSetObject:forKey:", v4, @"aps");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSDictionary *)self->_payload allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v10 isEqualToString:@"aps"] & 1) == 0)
        {
          v11 = [(NSDictionary *)self->_payload objectForKey:v10];
          [v3 setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v12 = objc_msgSend(v3, "un_nonEmptyCopy");

  return v12;
}

- (id)_sanitizeAPSDictionary:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v30 = [v4 objectForKey:@"alert"];
  v29 = -[UNPushNotificationRequestBuilder _sanitizeAlert:](self, "_sanitizeAlert:");
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  uint64_t v28 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"badge", objc_opt_class());
  objc_msgSend(v5, "un_safeSetObject:forKey:", v28 & ~(objc_msgSend((id)v28, "integerValue") >> 63), @"badge");
  v27 = [v4 objectForKey:@"sound"];
  v26 = -[UNPushNotificationRequestBuilder _sanitizeSound:](self, "_sanitizeSound:");
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  v25 = [v4 objectForKey:@"content-available"];
  uint64_t v24 = -[UNPushNotificationRequestBuilder _sanitizeFlag:](self, "_sanitizeFlag:");
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  v23 = [v4 objectForKey:@"mutable-content"];
  v22 = -[UNPushNotificationRequestBuilder _sanitizeFlag:](self, "_sanitizeFlag:");
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  uint64_t v6 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"category", objc_opt_class());
  v21 = v6;
  if ([v6 length]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  objc_msgSend(v5, "un_safeSetObject:forKey:", v7, @"category");
  uint64_t v8 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"thread-id", objc_opt_class());
  uint64_t v20 = v8;
  if ([v8 length]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(v5, "un_safeSetObject:forKey:", v9, @"thread-id");
  objc_super v19 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"target-content-id", objc_opt_class());
  objc_msgSend(v5, "un_safeSetObject:forKey:");
  uint64_t v10 = [v4 objectForKey:@"topic-id"];
  v11 = [(UNPushNotificationRequestBuilder *)self _sanitizeTopicIdentifier:v10];
  objc_msgSend(v5, "un_safeSetObject:forKey:", v11, @"topic-id");
  id v12 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"interruption-level", objc_opt_class());
  uint64_t v13 = [(UNPushNotificationRequestBuilder *)self _sanitizeInterruptionLevelString:v12];
  if (v13) {
    objc_msgSend(v5, "un_safeSetObject:forKey:", v13, @"interruption-level");
  }
  uint64_t v14 = [v4 objectForKey:@"relevance-score"];
  long long v15 = [(UNPushNotificationRequestBuilder *)self _sanitizeRelevanceScore:v14];
  objc_msgSend(v5, "un_safeSetObject:forKey:", v15, @"relevance-score");
  long long v16 = objc_msgSend(v4, "un_safeCastObjectForKey:class:", @"filter-criteria", objc_opt_class());
  objc_msgSend(v5, "un_safeSetObject:forKey:", v16, @"filter-criteria");
  long long v17 = objc_msgSend(v5, "un_nonEmptyCopy");

  return v17;
}

- (id)_sanitizeAlert:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = UNSafeCast(v5, v4);
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 length]) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v11 = UNSafeCast(v10, v4);
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v13 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"body", objc_opt_class());
      BOOL v46 = v13;
      if ([v13 length]) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v14, @"body");
      long long v15 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"loc-key", objc_opt_class());
      int v45 = v15;
      if (![v15 length]) {
        long long v15 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v15, @"loc-key");
      if (v15)
      {
        long long v16 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"loc-args", objc_opt_class());
        long long v17 = [(UNPushNotificationRequestBuilder *)self _sanitizeLocalizationArgumentsArray:v16];
        objc_msgSend(v12, "un_safeSetObject:forKey:", v17, @"loc-args");
      }
      long long v18 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"action-loc-key", objc_opt_class());
      v44 = v18;
      if ([v18 length]) {
        objc_super v19 = v18;
      }
      else {
        objc_super v19 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v19, @"action-loc-key");
      uint64_t v20 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"launch-image", objc_opt_class());
      id v43 = v20;
      if ([v20 length]) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v21, @"launch-image");
      v22 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"subtitle", objc_opt_class());
      int v42 = v22;
      if ([v22 length]) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v23, @"subtitle");
      uint64_t v24 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"subtitle-loc-key", objc_opt_class());
      v41 = v24;
      if ([v24 length]) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v25, @"subtitle-loc-key");
      if (v25)
      {
        v26 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"subtitle-loc-args", objc_opt_class());
        v27 = [(UNPushNotificationRequestBuilder *)self _sanitizeLocalizationArgumentsArray:v26];
        objc_msgSend(v12, "un_safeSetObject:forKey:", v27, @"subtitle-loc-args");
      }
      uint64_t v28 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"title", objc_opt_class());
      v40 = v28;
      if ([v28 length]) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v29, @"title");
      v30 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"title-loc-key", objc_opt_class());
      v31 = self;
      if ([v30 length]) {
        uint64_t v32 = v30;
      }
      else {
        uint64_t v32 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v32, @"title-loc-key");
      if (v32)
      {
        unint64_t v33 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"title-loc-args", objc_opt_class());
        v34 = [(UNPushNotificationRequestBuilder *)v31 _sanitizeLocalizationArgumentsArray:v33];
        objc_msgSend(v12, "un_safeSetObject:forKey:", v34, @"title-loc-args");
      }
      v35 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"summary-arg", objc_opt_class());
      if ([v35 length]) {
        v36 = v35;
      }
      else {
        v36 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v36, @"summary-arg");
      v37 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"summary-arg-count", objc_opt_class());
      uint64_t v38 = [(UNPushNotificationRequestBuilder *)v31 _sanitizeUnsignedInteger:v37];
      objc_msgSend(v12, "un_safeSetObject:forKey:", v38, @"summary-arg-count");
      objc_msgSend(v12, "un_nonEmptyCopy");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)_sanitizeSound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = UNSafeCast(v5, v4);
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 length]) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v11 = UNSafeCast(v10, v4);
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_super v19 = [v11 objectForKey:@"critical"];
      uint64_t v13 = [(UNPushNotificationRequestBuilder *)self _sanitizeFlag:v19];
      objc_msgSend(v12, "un_safeSetObject:forKey:", v13, @"critical");
      uint64_t v14 = objc_msgSend(v11, "un_safeCastObjectForKey:class:", @"name", objc_opt_class());
      if ([v14 length]) {
        long long v15 = v14;
      }
      else {
        long long v15 = 0;
      }
      objc_msgSend(v12, "un_safeSetObject:forKey:", v15, @"name");
      long long v16 = [v11 objectForKey:@"volume"];
      long long v17 = [(UNPushNotificationRequestBuilder *)self _sanitizeVolume:v16];
      objc_msgSend(v12, "un_safeSetObject:forKey:", v17, @"volume");
      objc_msgSend(v12, "un_nonEmptyCopy");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)_sanitizeTopicIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = UNSafeCast(v5, v4);
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 length]) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v11 = UNSafeCast(v10, v4);
    if (v11)
    {
      id v9 = [(UNPushNotificationRequestBuilder *)self _sanitizeStringArray:v11];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)_sanitizeStringArray:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "un_safeArrayContainingClass:", objc_opt_class());

  uint64_t v5 = objc_msgSend(v4, "un_filter:", &__block_literal_global_4);
  uint64_t v6 = objc_msgSend(v5, "un_nonEmptyCopy");

  return v6;
}

BOOL __57__UNPushNotificationRequestBuilder__sanitizeStringArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (id)_sanitizeLocalizationArgumentsArray:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__UNPushNotificationRequestBuilder__sanitizeLocalizationArgumentsArray___block_invoke;
  v10[3] = &unk_1E5F062D0;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v4, "un_map:", v10);

  return v8;
}

__CFString *__72__UNPushNotificationRequestBuilder__sanitizeLocalizationArgumentsArray___block_invoke(uint64_t a1, void *a2)
{
  UNSafeCastAny(*(void **)(a1 + 32), a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1F062A810;
  }
  id v4 = v2;

  return v4;
}

- (id)_sanitizeFlag:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = UNSafeCast(v4, v3);

  if (v5)
  {
    uint64_t v6 = [(id)v5 integerValue];
    id v7 = (id)(v5 & ~(v6 >> 63));
    if (v6 < 0)
    {
      id v9 = 0;
    }
    else
    {
      if ([(id)v5 integerValue] <= 0)
      {
        id v8 = (id)v5;
      }
      else
      {
        id v8 = [NSNumber numberWithInteger:1];
      }
      id v9 = v8;
    }
  }
  else if (v3)
  {
    id v9 = [NSNumber numberWithInteger:1];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_sanitizeVolume:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = UNSafeCast(v4, v3);

  if (!v5)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  [v5 floatValue];
  if (v6 >= 0.0)
  {
    [v5 floatValue];
    if (*(float *)&v8 <= 1.0)
    {
      id v10 = v5;
      goto LABEL_9;
    }
    id v7 = NSNumber;
    LODWORD(v8) = 1.0;
  }
  else
  {
    id v7 = NSNumber;
    double v8 = 0.0;
  }
  id v10 = [v7 numberWithFloat:v8];
LABEL_9:
  id v9 = v10;
LABEL_10:

  return v9;
}

- (id)_sanitizeUnsignedInteger:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = UNSafeCast(v4, v3);

  if (v5)
  {
    float v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  else
  {
    float v6 = 0;
  }

  return v6;
}

- (id)_sanitizeInterruptionLevelString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && (([v3 isEqualToString:@"passive"] & 1) != 0
     || ([v4 isEqualToString:@"active"] & 1) != 0
     || ([v4 isEqualToString:@"time-sensitive"] & 1) != 0
     || [v4 isEqualToString:@"critical"]))
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (unint64_t)_interruptionLevelForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"passive"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"active"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"time-sensitive"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"critical"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (id)_sanitizeRelevanceScore:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = UNSafeCast(v4, v3);

  if (!v5)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  [v5 doubleValue];
  if (v6 >= 0.0)
  {
    [v5 doubleValue];
    if (v10 <= 1.0)
    {
      id v11 = v5;
      goto LABEL_9;
    }
    id v7 = NSNumber;
    double v8 = 1.0;
  }
  else
  {
    id v7 = NSNumber;
    double v8 = 0.0;
  }
  id v11 = [v7 numberWithDouble:v8];
LABEL_9:
  id v9 = v11;
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end