@interface INPlayMediaIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (BOOL)_shouldForwardIntentToApp;
- (INPlayMediaIntentResponse)initWithBackingStore:(id)a3;
- (INPlayMediaIntentResponse)initWithCode:(INPlayMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INPlayMediaIntentResponse)initWithCoder:(id)a3;
- (INPlayMediaIntentResponseCode)code;
- (NSDictionary)nowPlayingInfo;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)init;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (void)_intents_prepareResponse;
- (void)encodeWithCoder:(id)a3;
- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo;
@end

@implementation INPlayMediaIntentResponse

- (id)_dictionaryRepresentation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"code";
  INPlayMediaIntentResponseCode v3 = [(INPlayMediaIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 < (INPlayMediaIntentResponseCodeFailureUnknownMediaType|INPlayMediaIntentResponseCodeSuccess))
  {
    v5 = off_1E551E460[v3];
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v11[1] = @"nowPlayingInfo";
  v12[0] = v5;
  v7 = [(INPlayMediaIntentResponse *)self nowPlayingInfo];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (!v7) {

  }
  if (v4 >= 0xC) {

  }
  return v9;
}

- (void)setNowPlayingInfo:(NSDictionary *)nowPlayingInfo
{
  unint64_t v4 = nowPlayingInfo;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDictionary(v4);

  [v5 setNowPlayingInfo:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSDictionary)nowPlayingInfo
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  INPlayMediaIntentResponseCode v3 = [v2 nowPlayingInfo];
  unint64_t v4 = INIntentSlotValueTransformFromDictionary(v3);

  return (NSDictionary *)v4;
}

- (BOOL)_shouldForwardIntentToApp
{
  return [(INPlayMediaIntentResponse *)self code] == INPlayMediaIntentResponseCodeHandleInApp;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INPlayMediaIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INPlayMediaIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeInProgress"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeSuccess"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeHandleInApp"]) {
    uint64_t v4 = 5;
  }
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailure"]) {
    uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailureUnknownMediaType"])
  }
    uint64_t v4 = 8;
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailureNoUnplayedContent"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailureRestrictedContent"])int64_t v5 = 10;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INPlayMediaIntentResponseCodeFailureMaxStreamLimitReached"];

  if (v6) {
    return 11;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  INPlayMediaIntentResponseCode v2 = [(INPlayMediaIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_18CFC4D60[v2 - 1];
  }
}

- (INPlayMediaIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPlayMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INPlayMediaIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INPlayMediaIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INPlayMediaIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INPlayMediaIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INPlayMediaIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INPlayMediaIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INPlayMediaIntentResponse)initWithCode:(INPlayMediaIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = userActivity;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)code > INPlayMediaIntentResponseCodeFailureMaxStreamLimitReached) {
      v9 = 0;
    }
    else {
      v9 = off_1E551E460[code];
    }
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INPlayMediaIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    INPlayMediaIntentResponseCode v17 = code;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INPlayMediaIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:code userActivity:v6];

  return v11;
}

- (id)init
{
  return [(INPlayMediaIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 7;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 4) {
    return a3 - 7;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return 3;
  }
  else {
    return dword_18CFC4D30[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 4;
      break;
    case 1:
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 6;
      if (a5) {
        int64_t v7 = 7;
      }
      if (v6 >= 4) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 8;
      }
      break;
    case 2:
      int64_t result = 3;
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_prepareResponse
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(INPlayMediaIntentResponse *)self nowPlayingInfo];
  if (![v3 count] || !MediaRemoteLibrary() || !MediaPlayerLibrary()) {
    goto LABEL_29;
  }
  objc_super v4 = getMPMediaItemPropertyArtwork();
  v24 = [v3 objectForKeyedSubscript:v4];

  if (!v24)
  {
    objc_super v5 = [v3 objectForKeyedSubscript:getkMRMediaRemoteNowPlayingInfoArtworkData()];
    if (v5)
    {
      v24 = +[INImage imageWithImageData:v5];
      uint64_t v6 = [v3 objectForKeyedSubscript:getkMRMediaRemoteNowPlayingInfoArtworkDataWidth()];
      int64_t v7 = [v3 objectForKeyedSubscript:getkMRMediaRemoteNowPlayingInfoArtworkDataHeight()];
      if (v7 && v6)
      {
        [v6 doubleValue];
        double v9 = v8;
        [v7 doubleValue];
        objc_msgSend(v24, "_setImageSize:", v9, v10);
      }
    }
    else
    {
      v24 = 0;
    }
  }
  v11 = (void *)[v3 mutableCopy];
  v12 = getMPMediaItemPropertyArtwork();
  [v11 removeObjectForKey:v12];

  [v11 removeObjectForKey:getkMRMediaRemoteNowPlayingInfoArtworkData()];
  [v11 removeObjectForKey:getkMRMediaRemoteNowPlayingInfoArtworkDataHeight()];
  [v11 removeObjectForKey:getkMRMediaRemoteNowPlayingInfoArtworkDataWidth()];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  objc_super v13 = (void *)getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr;
  v37 = (void *)getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr;
  if (!getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_block_invoke;
    v32 = &unk_1E5520EB8;
    v33 = &v34;
    v14 = (void *)MediaRemoteLibrary();
    v35[3] = (uint64_t)dlsym(v14, "kMRMediaRemoteNowPlayingInfoArtworkMIMEType");
    getkMRMediaRemoteNowPlayingInfoArtworkMIMETypeSymbolLoc_ptr = *(void *)(v33[1] + 24);
    objc_super v13 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v13)
  {
    dlerror();
    abort_report_np();
    goto LABEL_32;
  }
  [v11 removeObjectForKey:*v13];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v3;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v19 hasPrefix:@"kMRMediaRemote"]) {
          goto LABEL_28;
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v38 count:16];
    }
    while (v16);
  }

  id v20 = v11;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  v21 = (void (*)(id))getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr;
  v37 = getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr;
  if (!getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_block_invoke;
    v32 = &unk_1E5520EB8;
    v33 = &v34;
    uint64_t v22 = (void *)MediaPlayerLibrary();
    v23 = dlsym(v22, "MPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionary");
    *(void *)(v33[1] + 24) = v23;
    getMPNowPlayingInfoDictionaryToMRNowPlayingInfoDictionarySymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
    v21 = (void (*)(id))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v21)
  {
    dlerror();
    abort_report_np();
LABEL_32:
    __break(1u);
  }
  v21(v20);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (void *)[v15 mutableCopy];
LABEL_28:

  [v11 setObject:v24 forKeyedSubscript:@"artwork"];
  [(INPlayMediaIntentResponse *)self setNowPlayingInfo:v11];

LABEL_29:
}

@end