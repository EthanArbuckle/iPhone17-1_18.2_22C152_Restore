@interface LiveSpeechCaptionsClient
+ (LiveSpeechCaptionsClient)shared;
- (BOOL)startLiveCaptionsAndReturnError:(id *)a3;
- (BOOL)startLiveSpeechAndReturnError:(id *)a3;
- (BOOL)stopLiveCaptionsAndReturnError:(id *)a3;
- (BOOL)stopLiveSpeechAndReturnError:(id *)a3;
- (LiveSpeechCaptionsClient)init;
- (NSString)serviceName;
- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
@end

@implementation LiveSpeechCaptionsClient

+ (LiveSpeechCaptionsClient)shared
{
  if (qword_26B270B18 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B270B10;

  return (LiveSpeechCaptionsClient *)v2;
}

- (LiveSpeechCaptionsClient)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient__client) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LiveSpeechCaptionsClient *)&v5 init];
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_254F09A74();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(LiveSpeechCaptionsClient *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

- (BOOL)startLiveSpeechAndReturnError:(id *)a3
{
  v3 = self;
  LiveSpeechCaptionsClient.startLiveSpeech()();

  return 1;
}

- (BOOL)stopLiveSpeechAndReturnError:(id *)a3
{
  v3 = self;
  LiveSpeechCaptionsClient.stopLiveSpeech()();

  return 1;
}

- (BOOL)startLiveCaptionsAndReturnError:(id *)a3
{
  v3 = self;
  LiveSpeechCaptionsClient.startLiveCaptions()();

  return 1;
}

- (BOOL)stopLiveCaptionsAndReturnError:(id *)a3
{
  v3 = self;
  LiveSpeechCaptionsClient.stopLiveCaptions()();

  return 1;
}

- (NSString)serviceName
{
  v2 = (void *)sub_254F101C0();

  return (NSString *)v2;
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  id v4 = objc_msgSend(self, sel_mainAccessQueue);

  return v4;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5 = a3;
  v6 = self;
  LiveSpeechCaptionsClient.connectionWithServiceWasInterrupted(forUserInterfaceClient:)((uint64_t)a3);
}

@end