@interface INSendAnnouncementIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INSendAnnouncementIntentResponse)init;
- (INSendAnnouncementIntentResponse)initWithBackingStore:(id)a3;
- (INSendAnnouncementIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INSendAnnouncementIntentResponse)initWithCoder:(id)a3;
- (NSArray)sentAnnouncements;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (void)encodeWithCoder:(id)a3;
- (void)setSentAnnouncements:(id)a3;
@end

@implementation INSendAnnouncementIntentResponse

- (id)_dictionaryRepresentation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"code";
  unint64_t v3 = [(INSendAnnouncementIntentResponse *)self code];
  unint64_t v4 = v3;
  if (v3 < 0xF)
  {
    v5 = *(&off_1E5520090 + v3);
    v6 = v5;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    v6 = 0;
  }
  v11[1] = @"sentAnnouncements";
  v12[0] = v5;
  v7 = [(INSendAnnouncementIntentResponse *)self sentAnnouncements];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (!v7) {

  }
  if (v4 >= 0xF) {

  }
  return v9;
}

- (void)setSentAnnouncements:(id)a3
{
  id v4 = a3;
  v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToAnnouncementRecords(v4);

  [v5 setSentAnnouncements:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (NSArray)sentAnnouncements
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 sentAnnouncements];
  id v4 = INIntentSlotValueTransformFromAnnouncementRecords(v3);

  return (NSArray *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeInProgress"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeSuccess"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailure"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRecipientsUnreachable"])uint64_t v4 = 6;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRecipientsAnnouncementsDisabled"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureSenderAnnouncementsDisabled"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRecipientCannotReceiveAnnouncements"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureNoHomepod"])
  }
    uint64_t v4 = 10;
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRecipientHomepodsUpdateRequired"])uint64_t v4 = 11; {
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureRemoteAccessNotAllowed"])uint64_t v4 = 12;
  }
  if ([v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureNoOtherHomepodToReceiveAnnouncements"])int64_t v5 = 13; {
  else
  }
    int64_t v5 = v4;
  int v6 = [v3 isEqualToString:@"INSendAnnouncementIntentResponseCodeFailureOnlyAnnouncersDeviceIsAvailable"];

  if (v6) {
    return 14;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INSendAnnouncementIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0xD) {
    return 0;
  }
  else {
    return qword_18CFC54E0[v2 - 1];
  }
}

- (INSendAnnouncementIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendAnnouncementIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSendAnnouncementIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSendAnnouncementIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSendAnnouncementIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendAnnouncementIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSendAnnouncementIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSendAnnouncementIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 0xE) {
      v9 = 0;
    }
    else {
      v9 = *(&off_1E5520090 + a3);
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315906;
    v15 = "-[INSendAnnouncementIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INSendAnnouncementIntentResponse;
  v11 = [(INIntentResponse *)&v13 _initWithCode:a3 userActivity:v6];

  return v11;
}

- (INSendAnnouncementIntentResponse)init
{
  return [(INSendAnnouncementIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 5;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) < 9) {
    return a3 - 5;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD) {
    return 3;
  }
  else {
    return dword_18CFC54A8[a3 - 1];
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
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 4;
      if (a5) {
        int64_t v7 = 5;
      }
      if (v6 >= 9) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 6;
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