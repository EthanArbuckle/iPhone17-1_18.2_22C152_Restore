@interface INReportIncidentIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (CLPlacemark)location;
- (INReportIncidentIntentResponse)init;
- (INReportIncidentIntentResponse)initWithBackingStore:(id)a3;
- (INReportIncidentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INReportIncidentIntentResponse)initWithCoder:(id)a3;
- (NSArray)supportedTypes;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (unint64_t)transportTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
- (void)setSupportedTypes:(id)a3;
- (void)setTransportTypes:(unint64_t)a3;
@end

@implementation INReportIncidentIntentResponse

- (id)_dictionaryRepresentation
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"code";
  unint64_t v3 = [(INReportIncidentIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 < 0xE)
  {
    v5 = off_1E5520C48[v3];
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v16[0] = v5;
  v15[1] = @"transportTypes";
  v7 = INMapsTransportTypeOptionsGetNames([(INReportIncidentIntentResponse *)self transportTypes]);
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v8;
  v15[2] = @"location";
  v9 = [(INReportIncidentIntentResponse *)self location];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v10;
  v15[3] = @"supportedTypes";
  v11 = [(INReportIncidentIntentResponse *)self supportedTypes];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (!v11) {

  }
  if (!v9) {
  if (!v7)
  }

  if (v4 >= 0xE) {

  }
  return v13;
}

- (void)setSupportedTypes:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToSupportedTrafficIncidentTypes(v4);

  [v5 setSupportedTypes:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToLocation(v4);

  [v5 setLocation:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setTransportTypes:(unint64_t)a3
{
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 clearTransportTypes];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__INReportIncidentIntentResponse_setTransportTypes___block_invoke;
  v8[3] = &unk_1E5520C28;
  v8[4] = self;
  INMapsTransportTypeOptionsEnumerateBackingTypes(a3, v8);
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v6 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

void __52__INReportIncidentIntentResponse_setTransportTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _responseMessagePBRepresentation];
  [v3 addTransportType:a2];
}

- (NSArray)supportedTypes
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 supportedTypes];
  id v4 = INIntentSlotValueTransformFromSupportedTrafficIncidentTypes(v3);

  return (NSArray *)v4;
}

- (CLPlacemark)location
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v3 = [v2 location];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (unint64_t)transportTypes
{
  id v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  uint64_t v4 = [v3 transportTypesCount];

  unint64_t v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
      switch([v7 transportTypeAtIndex:i])
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        case 5u:
          v5 |= 0x10uLL;
          break;
        default:
          break;
      }
    }
  }
  return v5;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INReportIncidentIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INReportIncidentIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeUserConfirmationRequired"])uint64_t v4 = 3; {
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailure"])
  }
    uint64_t v4 = 4;
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureUnknownError"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureMapsLocationDisabled"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureMapsCoarseMode"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureMapsNotInstalled"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureUnsupportedIncidentType"])uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureUnsupportedRegion"])uint64_t v4 = 11; {
  if ([v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureUnsupportedTransportType"])int64_t v5 = 12;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INReportIncidentIntentResponseCodeFailureUnsupportedUpdate"];

  if (v6) {
    return 13;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INReportIncidentIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xC) {
    return 0;
  }
  else {
    return qword_18CFC56D8[v2 - 1];
  }
}

- (INReportIncidentIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INReportIncidentIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INReportIncidentIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INReportIncidentIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INReportIncidentIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INReportIncidentIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INReportIncidentIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INReportIncidentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 0xD) {
      v9 = 0;
    }
    else {
      v9 = off_1E5520C48[a3];
    }
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INReportIncidentIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INReportIncidentIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:a3 userActivity:v6];

  return v11;
}

- (INReportIncidentIntentResponse)init
{
  return [(INReportIncidentIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) >= 8) {
    return 0x7FFFFFFF;
  }
  else {
    return a3 - 6;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC) {
    return 3;
  }
  else {
    return dword_18CFC56A4[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 1:
      int64_t v6 = 4;
      if (a5) {
        int64_t v6 = 5;
      }
      if (a4 >= 8) {
        int64_t result = v6;
      }
      else {
        int64_t result = a4 + 6;
      }
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    case 7:
      int64_t result = 3;
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