@interface EKConferencePersistence
+ (id)deserializeConference:(id)a3;
+ (id)serializeConference:(id)a3;
@end

@implementation EKConferencePersistence

+ (id)serializeConference:(id)a3
{
  id v3 = a3;
  v4 = +[ConferenceDatatypeConverter calVirtualConferenceFromEKVirtualConference:v3];
  v5 = [v3 joinMethods];
  v6 = [v5 firstObject];
  v7 = [v6 URL];
  v8 = +[EKConferenceUtils synchronousAppTitleOnlyForURL:v7 incomplete:0];

  v9 = EKBundle();
  v10 = [v9 localizedStringForKey:@"Video Call" value:&stru_1EF932508 table:0];

  v11 = [v3 serializationBlockTitle];

  if (v8) {
    v12 = v8;
  }
  else {
    v12 = v10;
  }
  if (v11) {
    v12 = v11;
  }
  id v13 = v12;

  v14 = [MEMORY[0x1E4F57698] serializeConference:v4 serializationBlockTitle:v13];

  return v14;
}

+ (id)deserializeConference:(id)a3
{
  id v3 = [MEMORY[0x1E4F57698] deserializeConference:a3];
  v4 = +[ConferenceDatatypeConverter ekDeserializationResultFromCalDeserializationResult:v3];

  return v4;
}

@end