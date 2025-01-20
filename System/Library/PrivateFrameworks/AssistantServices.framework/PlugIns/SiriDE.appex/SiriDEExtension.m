@interface SiriDEExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation SiriDEExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = [objc_alloc((Class)DEAttachmentItem) initWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/assistant_dump.log"];
  [v3 setDisplayName:@"State Snapshot"];
  id v4 = [objc_alloc((Class)DEAttachmentItem) initWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs"];
  [v4 setDisplayName:@"Speech Logs"];
  id v5 = [objc_alloc((Class)DEAttachmentItem) initWithPath:@"/private/var/mobile/Library/VoiceTrigger/SAT"];
  [v5 setDisplayName:@"Voice Profiles"];
  v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, v5, 0);

  return v6;
}

@end