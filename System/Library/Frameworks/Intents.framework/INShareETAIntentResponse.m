@interface INShareETAIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INShareETAIntentResponse)init;
- (INShareETAIntentResponse)initWithBackingStore:(id)a3;
- (INShareETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INShareETAIntentResponse)initWithCoder:(id)a3;
- (NSArray)recipients;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (unint64_t)mediums;
- (void)encodeWithCoder:(id)a3;
- (void)setMediums:(unint64_t)a3;
- (void)setRecipients:(id)a3;
@end

@implementation INShareETAIntentResponse

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"code";
  unint64_t v3 = [(INShareETAIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 < 0x10)
  {
    v5 = *(&off_1E551FF10 + v3);
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v14[0] = v5;
  v13[1] = @"recipients";
  v7 = [(INShareETAIntentResponse *)self recipients];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"mediums";
  v9 = INShareETAMediumOptionsGetNames([(INShareETAIntentResponse *)self mediums]);
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v9) {

  }
  if (!v7) {
  if (v4 >= 0x10)
  }

  return v11;
}

- (void)setMediums:(unint64_t)a3
{
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearMediums];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__INShareETAIntentResponse_setMediums___block_invoke;
  v8[3] = &unk_1E5520C28;
  v8[4] = self;
  INShareETAMediumOptionsEnumerateBackingTypes(a3, v8);
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v6 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

void __39__INShareETAIntentResponse_setMediums___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _responseMessagePBRepresentation];
  [v3 addMedium:a2];
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToContacts(v4);

  [v5 setRecipients:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (unint64_t)mediums
{
  id v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v4 = [v3 mediumsCount];

  unint64_t v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
      switch([v7 mediumAtIndex:i])
      {
        case 0u:
          v5 |= 1uLL;
          break;
        case 1u:
          v5 |= 2uLL;
          break;
        case 2u:
          v5 |= 4uLL;
          break;
        case 3u:
          v5 |= 8uLL;
          break;
        default:
          break;
      }
    }
  }
  return v5;
}

- (NSArray)recipients
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 recipients];
  uint64_t v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INShareETAIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INShareETAIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureUnknownError"])
  }
    uint64_t v4 = 6;
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureUnsupportedOs"]) {
    uint64_t v4 = 7;
  }
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureUnsupportedOsVersion"])uint64_t v4 = 8; {
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureShareEtaDisabled"])
  }
    uint64_t v4 = 9;
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureShareEtaDisabledRemotely"])uint64_t v4 = 10; {
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureNotNavigating"])
  }
    uint64_t v4 = 11;
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureUnsupportedTransportationMode"])uint64_t v4 = 12; {
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureIcloudSignedOff"])
  }
    uint64_t v4 = 13;
  if ([v3 isEqualToString:@"INShareETAIntentResponseCodeFailureiMessageDisabled"]) {
    int64_t v5 = 14;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INShareETAIntentResponseCodeFailureAlreadySharing"];

  if (v6) {
    return 15;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INShareETAIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xE) {
    return 0;
  }
  else {
    return qword_18CFC5370[v2 - 1];
  }
}

- (INShareETAIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INShareETAIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INShareETAIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INShareETAIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INShareETAIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INShareETAIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INShareETAIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INShareETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 0xF) {
      v9 = 0;
    }
    else {
      v9 = *(&off_1E551FF10 + a3);
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INShareETAIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INShareETAIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:a3 userActivity:v6];

  return v11;
}

- (INShareETAIntentResponse)init
{
  return [(INShareETAIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) >= 0xA) {
    return 0x7FFFFFFF;
  }
  else {
    return a3 - 6;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return 3;
  }
  else {
    return dword_18CFC5330[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 3;
      break;
    case 1:
      int64_t v6 = 4;
      if (a5) {
        int64_t v6 = 5;
      }
      if (a4 >= 0xA) {
        int64_t result = v6;
      }
      else {
        int64_t result = a4 + 6;
      }
      break;
    case 2:
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

@end