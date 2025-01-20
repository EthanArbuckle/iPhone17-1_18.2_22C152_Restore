@interface VideoConferenceManager
+ (id)defaultVideoConferenceManager;
+ (void)addNSError:(id)a3 toConferenceXPCArgumentDictionary:(id)a4;
- (BOOL)hasVideoConference:(id)a3;
- (BOOL)isSIPHandleValid:(tagHANDLE *)a3;
- (ICEResultWaitQueue)resultQueue;
- (NSMutableArray)vcList;
- (VideoConference)activeConference;
- (VideoConference)conferenceWithMic;
- (VideoConferenceManager)init;
- (id)conferenceForCallID:(unsigned int)a3;
- (id)conferenceForParticipantID:(id)a3;
- (id)conferenceForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (tagHANDLE)SIPHandle;
- (void)addVideoConference:(id)a3;
- (void)broadcastCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4;
- (void)cleanupVTP;
- (void)createSIPWithPacketMultiplexMode:(int)a3;
- (void)getClientUUID:(unsigned __int8)a3[16];
- (void)pauseVideoConferences:(BOOL)a3;
- (void)registerBlocksForConference;
- (void)removeVideoConference:(id)a3;
- (void)setActiveConference:(id)a3;
- (void)setConferenceWithMic:(id)a3;
- (void)setupVTPCallback;
- (void)startSIPWithPacketMultiplexMode:(int)a3 transportType:(unsigned int)a4;
- (void)stopSIPWithTransportType:(unsigned int)a3;
- (void)videoConference:(id)a3 cancelRelayRequest:(unsigned int)a4 requestDict:(id)a5;
- (void)videoConference:(id)a3 closeConnectionForCallID:(unsigned int)a4;
- (void)videoConference:(id)a3 didChangeLocalVariablesForCallID:(unsigned int)a4;
- (void)videoConference:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 didReceiveData:(id)a4 forCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 didReceiveFirstRemoteFrameForCallID:(unsigned int)a4;
- (void)videoConference:(id)a3 didRemoteScreenAttributesChange:(id)a4 forCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 didRemoteVideoAttributesChange:(id)a4 forCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6;
- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 withUserInfo:(id)a6 error:(id)a7;
- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5 callMetadata:(id)a6;
- (void)videoConference:(id)a3 inititiateRelayRequest:(unsigned int)a4 requestDict:(id)a5;
- (void)videoConference:(id)a3 isRemoteAudioBelowThreshold:(BOOL)a4;
- (void)videoConference:(id)a3 localAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5 error:(id)a6;
- (void)videoConference:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 receivedNoRemotePacketsForTime:(double)a4 callID:(unsigned int)a5;
- (void)videoConference:(id)a3 remoteAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(unsigned int)a5;
- (void)videoConference:(id)a3 remoteCallingModeChanged:(unsigned int)a4 forCallID:(unsigned int)a5;
- (void)videoConference:(id)a3 remoteMediaStalled:(BOOL)a4 callID:(unsigned int)a5;
- (void)videoConference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(unsigned int)a5;
- (void)videoConference:(id)a3 sendRelayUpdate:(unsigned int)a4 updateDict:(id)a5;
- (void)videoConference:(id)a3 updateInputFrequencyLevel:(id)a4;
- (void)videoConference:(id)a3 updateInputMeterLevel:(float)a4;
- (void)videoConference:(id)a3 updateOutputFrequencyLevel:(id)a4;
- (void)videoConference:(id)a3 updateOutputMeterLevel:(float)a4;
- (void)videoConference:(id)a3 videoQualityNotificationForCallID:(unsigned int)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseAudio:(BOOL)a5 error:(id)a6;
- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseVideo:(BOOL)a5 error:(id)a6;
- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 isSendingAudio:(BOOL)a5 error:(id)a6;
- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5;
@end

@implementation VideoConferenceManager

+ (id)defaultVideoConferenceManager
{
  id result = (id)defaultVideoConferenceManager__VideoConferenceManager;
  if (!defaultVideoConferenceManager__VideoConferenceManager)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVideoConferenceManager__VideoConferenceManager) {
      defaultVideoConferenceManager__VideoConferenceManager = objc_alloc_init(VideoConferenceManager);
    }
    objc_sync_exit(v3);
    return (id)defaultVideoConferenceManager__VideoConferenceManager;
  }
  return result;
}

- (VideoConferenceManager)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VideoConferenceManager;
  v2 = [(VideoConferenceManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    v2->sipRefCount = 0;
    v2->vcList = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->resultQueue = objc_alloc_init(ICEResultWaitQueue);
    uuid_clear(v3->_clientUUID);
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VideoConferenceManager.xpcCommandQueue", v4);
    v7.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v7.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v3->stateLock, &v7);
    pthread_mutex_init(&v3->sipLock, &v7);
    pthread_mutexattr_destroy(&v7);
    v3->isVTPInitialized = 0;
  }
  return v3;
}

+ (void)addNSError:(id)a3 toConferenceXPCArgumentDictionary:(id)a4
{
  if (a3)
  {
    pthread_mutexattr_t v7 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(a3, "code"));
    objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), @"conferenceErrorDomain", v7, @"conferenceErrorCode", objc_msgSend(a3, "userInfo"), @"conferenceErrorUserInfo", 0);
    [a4 setObject:v6 forKeyedSubscript:@"conferenceError"];
  }
}

- (void)videoConference:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  pthread_mutexattr_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a4, @"conferenceCallNewBlob", v8, @"conferenceCallID", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceLocalIPChange", v7, a3);
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = (id)[objc_alloc(NSNumber) initWithBool:a4];
  v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v7];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"conferenceConnectionStarted", v9, 0);
  +[VideoConferenceManager addNSError:a6 toConferenceXPCArgumentDictionary:v10];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStartConnection", v10, a3);
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 withUserInfo:(id)a6 error:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v13 = (id)[objc_alloc(NSNumber) initWithBool:a4];
  id v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v9];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v13, @"conferenceConnectionStarted", a6, @"conferenceUserInfo", v11, @"conferenceCallID", 0);
  +[VideoConferenceManager addNSError:a7 toConferenceXPCArgumentDictionary:v12];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStartConnection", v12, a3);
}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5 callMetadata:(id)a6
{
  id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v10, @"conferenceCallID", a6, @"conferenceCallMetadata", 0);
  +[VideoConferenceManager addNSError:a5 toConferenceXPCArgumentDictionary:v9];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStopConnection", v9, a3);
}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"conferenceCallID", v9, @"conferenceAudioPause", 0);
  +[VideoConferenceManager addNSError:a6 toConferenceXPCArgumentDictionary:v10];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidPauseAudio", v10, a3);
}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 isSendingAudio:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"conferenceCallID", v9, @"conferenceAudioSending", 0);
  +[VideoConferenceManager addNSError:a6 toConferenceXPCArgumentDictionary:v10];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceIsSendingAudio", v10, a3);
}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseVideo:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  uint64_t v9 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"conferenceCallID", v9, @"conferenceVideoPause", 0);
  +[VideoConferenceManager addNSError:a6 toConferenceXPCArgumentDictionary:v10];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidPauseVideo", v10, a3);
}

- (void)videoConference:(id)a3 receivedNoRemotePacketsForTime:(double)a4 callID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  id v8 = (void *)[objc_alloc(NSNumber) initWithDouble:a4];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"conferenceCallID", v8, @"conferenceNoRemotePacketsTime", 0);
  if ([a3 shouldReinitializeCallWithDuration:v5 forCallID:a4]) {
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReinitializeCall", v9, a3);
  }
}

- (void)videoConference:(id)a3 remoteMediaStalled:(BOOL)a4 callID:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceIsRemoteMediaStalled", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteMediaStalled", v8, a3);
}

- (void)videoConference:(id)a3 didReceiveFirstRemoteFrameForCallID:(unsigned int)a4
{
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"conferenceCallID", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidReceiveRemoteFrame", v5, a3);
}

- (void)videoConference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceAudioPause", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteAudioPause", v8, a3);
}

- (void)videoConference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceVideoPause", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteVideoPause", v8, a3);
}

- (void)videoConference:(id)a3 didRemoteVideoAttributesChange:(id)a4 forCallID:(unsigned int)a5
{
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[a4 copyEncodedDictionary];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceRemoteVideoAttributes", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteAttributesChange", v8, a3);
}

- (void)videoConference:(id)a3 didRemoteScreenAttributesChange:(id)a4 forCallID:(unsigned int)a5
{
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[a4 copyEncodedDictionary];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceRemoteScreenAttributes", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteScreenAttributesChange", v8, a3);
}

- (void)videoConference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"conferenceInputFreqMetering", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateInputFrequencyMetering", v5, a3);
}

- (void)videoConference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"conferenceOutputFreqMetering", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateOutputFrequencyMetering", v5, a3);
}

- (void)videoConference:(id)a3 updateInputMeterLevel:(float)a4
{
  id v6 = objc_alloc(NSNumber);
  *(float *)&double v7 = a4;
  id v9 = (id)[v6 initWithFloat:v7];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceInputMetering", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateInputMetering", v8, a3);
}

- (void)videoConference:(id)a3 updateOutputMeterLevel:(float)a4
{
  id v6 = objc_alloc(NSNumber);
  *(float *)&double v7 = a4;
  id v9 = (id)[v6 initWithFloat:v7];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceOutputMetering", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateOutputMetering", v8, a3);
}

- (void)videoConference:(id)a3 isRemoteAudioBelowThreshold:(BOOL)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"conferenceAudioBelowThreshold";
  v6[0] = [NSNumber numberWithBool:a4];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteAudioBelowThreshold", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1), a3);
}

- (void)videoConference:(id)a3 inititiateRelayRequest:(unsigned int)a4 requestDict:(id)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceCallID", a5, @"conferenceRelayRequest", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceInitiateRelayRequest", v7, a3);
}

- (void)videoConference:(id)a3 sendRelayUpdate:(unsigned int)a4 updateDict:(id)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceCallID", a5, @"conferenceRelayRequest", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceSendRelayUpdate", v7, a3);
}

- (void)videoConference:(id)a3 cancelRelayRequest:(unsigned int)a4 requestDict:(id)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceCallID", a5, @"conferenceRelayRequest", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceCancelRelayRequest", v7, a3);
}

- (void)videoConference:(id)a3 videoQualityNotificationForCallID:(unsigned int)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  id v10 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  id v12 = (id)[objc_alloc(NSNumber) initWithBool:v6];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v10, @"conferenceIsVideoDegraded", v12, @"conferenceIsRemote", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceVideoDegraded", v11, a3);
}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  id v9 = (id)[objc_alloc(NSNumber) initWithBool:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceCallID", v9, @"conferenceNetworkHint", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceNetworkHint", v8, a3);
}

- (void)videoConference:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    id v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      v17 = "-[VideoConferenceManager videoConference:didReceiveARPLData:fromCallID:]";
      __int16 v18 = 1024;
      int v19 = 445;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> Relaying incoming ARPL data from VideoConference to AVConference via XPC (in VideoConferenceManager) <<<<<", buf, 0x1Cu);
    }
  }
  if (!a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    id v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      v17 = "-[VideoConferenceManager videoConference:didReceiveARPLData:fromCallID:]";
      __int16 v18 = 1024;
      int v19 = 448;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> DATA ERROR (in VideoConferenceManager) <<<<<", buf, 0x1Cu);
    }
  }
  id v12 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
  id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v12, @"conferenceCallID", a4, @"conferenceARPLData", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReceivedARPL", v13, a3);
}

- (void)videoConference:(id)a3 didChangeLocalVariablesForCallID:(unsigned int)a4
{
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"conferenceCallID", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidChangeLocalVariables", v5, a3);
}

- (void)videoConference:(id)a3 didReceiveData:(id)a4 forCallID:(unsigned int)a5
{
  id v8 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"conferenceCallID", a4, @"conferenceData", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReceivedData", v7, a3);
}

- (void)videoConference:(id)a3 remoteAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithBool:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"conferenceCallID", v7, @"conferenceAudioEnabled", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteAudioEnabled", v8, a3);
}

- (void)videoConference:(id)a3 localAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v11 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a5];
  id v9 = (void *)[objc_alloc(NSNumber) initWithBool:v7];
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"conferenceCallID", v9, @"conferenceAudioEnabled", 0);
  +[VideoConferenceManager addNSError:a6 toConferenceXPCArgumentDictionary:v10];
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceLocalAudioEnabled", v10, a3);
}

- (void)videoConference:(id)a3 closeConnectionForCallID:(unsigned int)a4
{
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"conferenceCallID", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceCloseConnection", v5, a3);
}

- (void)videoConference:(id)a3 remoteCallingModeChanged:(unsigned int)a4 forCallID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:*(void *)&a4];
  BOOL v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceCallID", v9, @"conferenceCallingMode", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteCallingModeChanged", v8, a3);
}

- (tagHANDLE)SIPHandle
{
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  hSIP = self->hSIP;
  pthread_mutex_unlock(p_stateLock);
  return hSIP;
}

- (void)setupVTPCallback
{
}

- (void)createSIPWithPacketMultiplexMode:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      __int16 v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
      __int16 v19 = 1024;
      int v20 = 554;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being asserted by SIP", (uint8_t *)&v15, 0x1Cu);
    }
  }
  [+[VCNetworkAgent sharedInstance] addAssertion];
  if (!self->isVTPInitialized)
  {
    +[VCVTPWrapper startVTP];
    VTP_SetCallback((uint64_t)VTPCallback, (uint64_t)self);
    self->isVTPInitialized = 1;
  }
  self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
  p_hSIP = &self->hSIP;
  int v8 = SIPCreateHandle((uint64_t *)&self->hSIP, (uint64_t)SIPCallback, (uint64_t)self, 0);
  if (v8)
  {
    int v9 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      id v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        __int16 v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
        __int16 v19 = 1024;
        int v20 = 566;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SOMETHING WENT WRONG MAKING THE SIP HANDLE!%08x", (uint8_t *)&v15, 0x22u);
      }
    }
    SIPCloseHandle();
    *p_hSIP = (tagHANDLE *)0xFFFFFFFFLL;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    id v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *p_hSIP;
      int v15 = 136315906;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      __int16 v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
      __int16 v19 = 1024;
      int v20 = 571;
      __int16 v21 = 1024;
      int v22 = (int)v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIP Handle created:0x%x", (uint8_t *)&v15, 0x22u);
    }
  }
  SIPSetPacketMultiplexMode((uint64_t)self->hSIP, a3);
  SIPSetAllowSameSourceDestination((uint64_t)self->hSIP, 1);
  SIPSetCellConditionChangeHandler((uint64_t)self->hSIP, (uint64_t)CellConditionChangeCallback, (uint64_t)self);
  self->sipRefCount = 0;
}

- (void)startSIPWithPacketMultiplexMode:(int)a3 transportType:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int sipRefCount = self->sipRefCount;
      int v11 = 136315906;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      v14 = "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]";
      __int16 v15 = 1024;
      int v16 = 585;
      __int16 v17 = 1024;
      int v18 = sipRefCount;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceManager:  starting sip with refCount = %d", (uint8_t *)&v11, 0x22u);
    }
  }
  pthread_mutex_lock(&self->sipLock);
  hSIP = self->hSIP;
  if (hSIP != (tagHANDLE *)0xFFFFFFFFLL
    || ([(VideoConferenceManager *)self createSIPWithPacketMultiplexMode:v5],
        hSIP = self->hSIP,
        hSIP != (tagHANDLE *)0xFFFFFFFFLL))
  {
    if ((SIPStartListen((uint64_t)hSIP, a4 != 0, self->_clientUUID) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]();
        }
      }
      SIPCloseHandle();
      self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    }
    else
    {
      ++self->sipRefCount;
    }
  }
  pthread_mutex_unlock(&self->sipLock);
}

- (BOOL)isSIPHandleValid:(tagHANDLE *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  hSIP = self->hSIP;
  BOOL v4 = hSIP != a3 || hSIP == (tagHANDLE *)0xFFFFFFFFLL;
  BOOL v5 = !v4;
  if (v4)
  {
    int v6 = (int)a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v11 = self->hSIP;
        int v12 = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = "-[VideoConferenceManager isSIPHandleValid:]";
        __int16 v16 = 1024;
        int v17 = 609;
        __int16 v18 = 1024;
        int v19 = v6;
        __int16 v20 = 1024;
        int v21 = (int)v11;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d SIPCallback tried to use stale/invalid handle %d. actual is %d", (uint8_t *)&v12, 0x28u);
      }
    }
  }
  return v5;
}

- (void)cleanupVTP
{
  v5[5] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__VideoConferenceManager_cleanupVTP__block_invoke;
  v5[3] = &unk_1E6DB3DC8;
  v5[4] = self;
  dispatch_after(v3, global_queue, v5);
}

uint64_t __36__VideoConferenceManager_cleanupVTP__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    dispatch_time_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = *(unsigned __int8 *)(v4 + 216);
      LODWORD(v4) = *(void *)(v4 + 192) == 0xFFFFFFFFLL;
      int v10 = 136316162;
      uint64_t v11 = v2;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VideoConferenceManager cleanupVTP]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 620;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Entering cleanupVTP...with isVTPInitialized = %d and sip is invalid = %d", (uint8_t *)&v10, 0x28u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 192) == 0xFFFFFFFFLL)
  {
    if (*(unsigned char *)(v6 + 216))
    {
      +[VCVTPWrapper stopVTP];
      *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          uint64_t v13 = "-[VideoConferenceManager cleanupVTP]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 628;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished cleanupVTP...", (uint8_t *)&v10, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
}

- (void)stopSIPWithTransportType:(unsigned int)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "-[VideoConferenceManager stopSIPWithTransportType:]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int sipRefCount = self->sipRefCount;
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VideoConferenceManager stopSIPWithTransportType:]";
      __int16 v21 = 1024;
      int v22 = 638;
      __int16 v23 = 1024;
      int v24 = sipRefCount;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceManager:  stopping sip with refCount = %d", buf, 0x22u);
    }
  }
  pthread_mutex_lock(&self->sipLock);
  int v8 = self->sipRefCount;
  BOOL v9 = __OFSUB__(v8, 1);
  int v10 = v8 - 1;
  if (v10 < 0 == v9) {
    self->int sipRefCount = v10;
  }
  hSIP = self->hSIP;
  if (hSIP == (tagHANDLE *)0xFFFFFFFFLL
    || (SIPStopListen((uint64_t)hSIP, a3 != 0), __int16 v12 = self->hSIP, v12 == (tagHANDLE *)0xFFFFFFFFLL)
    || self->sipRefCount > 0)
  {
    pthread_mutex_unlock(&self->sipLock);
  }
  else
  {
    self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    self->int sipRefCount = 0;
    pthread_mutex_unlock(&self->sipLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VideoConferenceManager stopSIPWithTransportType:]";
        __int16 v21 = 1024;
        int v22 = 656;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being un-asserted by SIP", buf, 0x1Cu);
      }
    }
    [+[VCNetworkAgent sharedInstance] removeAssertion];
    global_queue = dispatch_get_global_queue(0, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__VideoConferenceManager_stopSIPWithTransportType___block_invoke;
    v16[3] = &unk_1E6DB4568;
    v16[4] = self;
    v16[5] = v12;
    dispatch_async(global_queue, v16);
  }
}

void __51__VideoConferenceManager_stopSIPWithTransportType___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_alloc_init(SnapshotTimer);
  [(SnapshotTimer *)v2 checkinWithTimeout:@"Closing SIP Handle" forTask:45.0];
  SIPCloseHandle();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      BOOL v9 = "-[VideoConferenceManager stopSIPWithTransportType:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 669;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIP Handle closed:0x%x", (uint8_t *)&v6, 0x22u);
    }
  }
  [*(id *)(a1 + 32) cleanupVTP];
  [(SnapshotTimer *)v2 checkout];
}

- (void)addVideoConference:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  if (([(NSMutableArray *)self->vcList containsObject:a3] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        int v11 = "-[VideoConferenceManager addVideoConference:]";
        __int16 v12 = 1024;
        int v13 = 688;
        __int16 v14 = 2112;
        id v15 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being asserted by addVideoConference '%@'", (uint8_t *)&v8, 0x26u);
      }
    }
    [+[VCNetworkAgent sharedInstance] addAssertion];
    [(NSMutableArray *)self->vcList addObject:a3];
  }
  pthread_mutex_unlock(p_stateLock);
}

- (void)removeVideoConference:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  if ([(NSMutableArray *)self->vcList containsObject:a3])
  {
    [(NSMutableArray *)self->vcList removeObject:a3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        int v11 = "-[VideoConferenceManager removeVideoConference:]";
        __int16 v12 = 1024;
        int v13 = 702;
        __int16 v14 = 2112;
        id v15 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being un-asserted by removeVideoConference '%@'", (uint8_t *)&v8, 0x26u);
      }
    }
    [+[VCNetworkAgent sharedInstance] removeAssertion];
  }
  if ([a3 isEqual:self->activeConference]) {
    self->activeConference = 0;
  }
  if ([a3 isEqual:self->conferenceWithMic]) {
    self->conferenceWithMic = 0;
  }
  pthread_mutex_unlock(p_stateLock);
}

- (void)setConferenceWithMic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  self->conferenceWithMic = (VideoConference *)a3;
  if (a3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    vcList = self->vcList;
    uint64_t v8 = [(NSMutableArray *)vcList countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(vcList);
          }
          id v12 = *(id *)(*((void *)&v23 + 1) + 8 * i);
          if (v12 != a3 && [*(id *)(*((void *)&v23 + 1) + 8 * i) hasMic]) {
            [v5 addObject:v12];
          }
        }
        uint64_t v9 = [(NSMutableArray *)vcList countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v9);
    }
  }
  pthread_mutex_unlock(p_stateLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * j) setHasMic:0];
      }
      uint64_t v14 = [v5 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v14);
  }
}

- (VideoConference)conferenceWithMic
{
  return self->conferenceWithMic;
}

- (id)conferenceForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  uint64_t v6 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->vcList];
  pthread_mutex_unlock(p_stateLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v6);
    }
    int v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    if ([v11 matchesCallID:v3]) {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)hasVideoConference:(id)a3
{
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  LOBYTE(a3) = [(NSMutableArray *)self->vcList containsObject:a3];
  pthread_mutex_unlock(p_stateLock);
  return (char)a3;
}

- (id)conferenceForParticipantID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  uint64_t v6 = self->activeConference;
  pthread_mutex_unlock(p_stateLock);
  if (!v6 || ![(VideoConference *)v6 matchesParticipantID:a3])
  {
    pthread_mutex_lock(p_stateLock);
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->vcList];
    pthread_mutex_unlock(p_stateLock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v6 = *(VideoConference **)(*((void *)&v14 + 1) + 8 * v11);
        if ([(VideoConference *)v6 matchesParticipantID:a3]) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
          uint64_t v6 = 0;
          if (v9) {
            goto LABEL_5;
          }
          return v6;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)conferenceForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  uint64_t v6 = self->activeConference;
  pthread_mutex_unlock(p_stateLock);
  if (!v6
    || ![(VideoConference *)v6 conferenceMatchesSourceDestinationInfo:a3])
  {
    pthread_mutex_lock(p_stateLock);
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->vcList];
    pthread_mutex_unlock(p_stateLock);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v12 conferenceMatchesSourceDestinationInfo:a3]) {
            return v12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    if (![(VideoConference *)v6 hasSessionWaitingForSIPInvite])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v18 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
LABEL_14:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v7);
          }
          uint64_t v6 = *(VideoConference **)(*((void *)&v19 + 1) + 8 * v16);
          if ([(VideoConference *)v6 hasSessionWaitingForSIPInvite]) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v7 countByEnumeratingWithState:&v19 objects:v18 count:16];
            uint64_t v6 = 0;
            if (v14) {
              goto LABEL_14;
            }
            return v6;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

- (void)pauseVideoConferences:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VideoConferenceManager pauseVideoConferences:]";
      __int16 v15 = 1024;
      int v16 = 824;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterruptMe: (%d) pauseVideoConferences begin", buf, 0x22u);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__VideoConferenceManager_pauseVideoConferences___block_invoke;
  v9[3] = &unk_1E6DB3DF0;
  v9[4] = self;
  BOOL v10 = v3;
  dispatch_async(global_queue, v9);
}

void __48__VideoConferenceManager_pauseVideoConferences___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 160)];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 24));
  size_t v3 = [v2 count];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VideoConferenceManager_pauseVideoConferences___block_invoke_2;
  block[3] = &unk_1E6DB5FD0;
  block[4] = v2;
  char v6 = *(unsigned char *)(a1 + 40);
  dispatch_apply(v3, global_queue, block);
}

void __48__VideoConferenceManager_pauseVideoConferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v4 setPauseAudio:*(unsigned __int8 *)(a1 + 40)];
  [v4 setPauseVideo:*(unsigned __int8 *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    char v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 40);
      if ([*(id *)(a1 + 32) objectAtIndex:a2]) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2), "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VideoConferenceManager pauseVideoConferences:]_block_invoke_2";
      __int16 v13 = 1024;
      int v14 = 839;
      __int16 v15 = 1024;
      int v16 = v7;
      __int16 v17 = 2080;
      BOOL v18 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterruptMe: (%d) Pausing audio and video for conference %s", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)broadcastCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->vcList];
  pthread_mutex_unlock(p_stateLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v12++) handleCellTechChange:v5 cellularMaxPktLen:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v10);
  }
}

- (void)getClientUUID:(unsigned __int8)a3[16]
{
  p_sipLock = &self->sipLock;
  pthread_mutex_lock(&self->sipLock);
  uuid_copy(a3, self->_clientUUID);

  pthread_mutex_unlock(p_sipLock);
}

- (VideoConference)activeConference
{
  return self->activeConference;
}

- (void)setActiveConference:(id)a3
{
  self->activeConference = (VideoConference *)a3;
}

- (ICEResultWaitQueue)resultQueue
{
  return self->resultQueue;
}

- (NSMutableArray)vcList
{
  return self->vcList;
}

- (void)registerBlocksForConference
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke;
  v4[3] = &unk_1E6DB5478;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceInitialize", v4, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceTerminate", &__block_literal_global_91, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceWarmUpForCall", &__block_literal_global_35_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceInitializeNewCall", &__block_literal_global_38_1, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsUsingBlobFormat", &__block_literal_global_51, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsUsingBlobFormat", &__block_literal_global_58, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetReportingIdentifier", &__block_literal_global_61, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetSessionID", &__block_literal_global_70, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceAddGKSCallEvent", &__block_literal_global_73, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetConnectionBlob", &__block_literal_global_79, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetInviteData", &__block_literal_global_88, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetCallMetadata", &__block_literal_global_98, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPeerCN", &__block_literal_global_104, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceNetworkQualityForCall", &__block_literal_global_110_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRequiresWifi", &__block_literal_global_116, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetRequiresWifi", &__block_literal_global_122, self->_xpcCommandQueue);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_13;
  v3[3] = &unk_1E6DB5478;
  v3[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceStartConnectionUsingInviteData", v3, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceStopCallID", &__block_literal_global_149, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceCancelCallID", &__block_literal_global_152, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRemoteCancelledCallID", &__block_literal_global_155, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetCallReport", &__block_literal_global_158, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetActive", &__block_literal_global_170, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRemoteIPChange", &__block_literal_global_176, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsOutputMeteringEnabled", &__block_literal_global_179, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsOutputMeteringEnabled", &__block_literal_global_185, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsInputMeteringEnabled", &__block_literal_global_188, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:", "conferenceSetIsInputMeteringEnabled", &__block_literal_global_194);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsInputFrequencyMeteringEnabled", &__block_literal_global_197, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsInputFrequencyMeteringEnabled", &__block_literal_global_203, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsOutputFrequencyMeteringEnabled", &__block_literal_global_206, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsOutputFrequencyMeteringEnabled", &__block_literal_global_212, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetOutputMeterLevel", &__block_literal_global_215, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetInputMeterLevel", &__block_literal_global_218, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsMicrophoneMuted", &__block_literal_global_221, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsMicrophoneMuted", &__block_literal_global_227, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameRate", &__block_literal_global_230, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalBitRate", &__block_literal_global_236, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameRate", &__block_literal_global_242, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteBitRate", &__block_literal_global_248, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalPacketLossRate", &__block_literal_global_254, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemotePacketLossRate", &__block_literal_global_260_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRoundTripTime", &__block_literal_global_263, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetStatsForCallID", &__block_literal_global_269, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsSpeakerEnabled", &__block_literal_global_275_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsSpeakerEnabled", &__block_literal_global_281, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetNATType", &__block_literal_global_284, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetAudioSending", &__block_literal_global_290, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPauseAudio", &__block_literal_global_296, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPauseVideo", &__block_literal_global_302, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetServerInfo", &__block_literal_global_308, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameWidth", &__block_literal_global_315, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameHeight", &__block_literal_global_321_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameWidth", &__block_literal_global_327, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameHeight", &__block_literal_global_333, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceProcessRelayRequestResponse", &__block_literal_global_339, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceProcessRelayRequestUpdate", &__block_literal_global_342_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSendARPL", &__block_literal_global_345, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSendData", &__block_literal_global_352, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLastActiveCallID", &__block_literal_global_362_1, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetLastActiveCallID", &__block_literal_global_366, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRelayedCallType", &__block_literal_global_370, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceUpdateCapabilities", &__block_literal_global_377, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceShouldSendBlackFrame", &__block_literal_global_381, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetState", &__block_literal_global_388, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetVisualRectangle", &__block_literal_global_395, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPeerProtocolVersion", &__block_literal_global_402, self->_xpcCommandQueue);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v5 = [a2 objectForKeyedSubscript:@"conferenceClientUUID"];
  if (v5)
  {
    memset(src, 170, 16);
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    [v6 getUUIDBytes:src];
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
    uuid_copy((unsigned __int8 *)(*(void *)(a1 + 32) + 8), src);
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 88));
  }
  int v7 = -[VideoConference initWithClientPid:]([VideoConference alloc], "initWithClientPid:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"));
  [(VideoConference *)v7 setDelegate:+[VideoConferenceManager defaultVideoConferenceManager]];
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "addVideoConference:", v7);
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"conferenceTransportType"];
  -[VideoConference setTransportType:](v7, "setTransportType:", [v8 unsignedIntValue]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v8 unsignedIntValue];
      *(_DWORD *)src = 136316162;
      *(void *)&src[4] = v9;
      *(_WORD *)&src[12] = 2080;
      *(void *)&src[14] = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 59;
      __int16 v19 = 2048;
      long long v20 = v7;
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d allocated new VideoConference object %p, with transportType %d", src, 0x2Cu);
    }
  }
  uint64_t v12 = (void *)[objc_alloc(NSNumber) initWithBool:1];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[VideoConference inputAudioPowerSpectrumToken](v7, "inputAudioPowerSpectrumToken"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[VideoConference outputAudioPowerSpectrumToken](v7, "outputAudioPowerSpectrumToken"));
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", v12, @"conferenceInitialized", v13, @"conferenceInputAudioPowerSpectrumToken", v14, @"conferenceOutputAudioPowerSpectrumToken", 0);

  return v4;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 stopAllCalls:0];
    [v5 setDelegate:0];
    [v5 startDeallocTimerWithTimeout:15];

    objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "removeVideoConference:", v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 100;
        __int16 v15 = 2048;
        long long v16 = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d released old VideoConference object %p", buf, 0x26u);
      }
    }
  }
  return v3;
}

{
  void *v4;
  void *v5;
  uint64_t v6;

  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isMicrophoneMuted"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceMicrophoneMute", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_33(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "warmupForCall");
  }
  return 0;
}

{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "localBitrateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  int v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceLocalBitRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceDeviceRole"];
  uint64_t v6 = [a2 objectForKeyedSubscript:@"conferenceReportingHierarchyToken"];
  int v7 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v4, "initializeNewCallWithDeviceRole:reportingHierarchyToken:", objc_msgSend(v5, "intValue"), v6));
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceCallID", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      int v14 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke_2";
      __int16 v15 = 1024;
      int v16 = 129;
      __int16 v17 = 1024;
      int v18 = [v5 intValue];
      __int16 v19 = 1024;
      int v20 = [v7 intValue];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initializeNewCallWithDeviceRole:%d (server side) callID=%d", buf, 0x28u);
    }
  }

  return v3;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_49(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "useViceroyBlobFormat"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceUsingBlobFormat", 0);

  return v6;
}

{
  double v4;
  void *v5;
  uint64_t v6;

  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "remoteFrameSizeForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"));
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithInt:(int)v4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceRemoteFrameWidth", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2_56(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    id v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceUsingBlobFormat"];
    if (v4) {
      objc_msgSend(v3, "setUseViceroyBlobFormat:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_3(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "setPeerReportingID:sessionID:callID:", objc_msgSend(a2, "objectForKeyedSubscript:", @"conferencePeerReportingIdentifier"), objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceSessionID"), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_4(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"conferenceSessionID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "setSessionID:callID:", v4, objc_msgSend(v5, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_5(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    [a2 objectForKeyedSubscript:@"conferenceSessionID"];
    [a2 objectForKeyedSubscript:@"conferenceCallEvent"];
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v7 = [a2 objectForKeyedSubscript:@"conferenceParticipantID"];
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v5 = 0;
  if (v7 && v8)
  {
    unsigned int v13 = [v8 unsignedIntValue];
    uint64_t v9 = (void *)[v6 inviteDataForParticipantID:v7 callID:&v13 remoteInviteData:0 nonCellularCandidateTimeout:a3 error:0.0];
    id v10 = objc_alloc(NSNumber);
    __int16 v11 = (void *)[v10 initWithUnsignedInt:v13];
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend(v9, "objectForKeyedSubscript:", @"InviteDataConnectionBlob"), @"conferenceConnectionBlob", v11, @"conferenceCallID", 0);
  }
  return v5;
}

id __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v7 = [a2 objectForKeyedSubscript:@"conferenceParticipantID"];
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v9 = [a2 objectForKeyedSubscript:@"conferenceInviteData"];
  uint64_t v10 = [a2 objectForKeyedSubscript:@"conferenceNonCellularCandidateTimeout"];
  id v5 = 0;
  if (v7 && v8)
  {
    __int16 v11 = (void *)v10;
    unsigned int v16 = [v8 unsignedIntValue];
    [v11 doubleValue];
    uint64_t v12 = objc_msgSend(v6, "inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:", v7, &v16, v9, a3);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = objc_alloc(NSNumber);
    uint64_t v14 = (void *)[v13 initWithUnsignedInt:v16];
    if (v14) {
      [v5 setObject:v14 forKeyedSubscript:@"conferenceCallID"];
    }
    if (v12) {
      [v5 setObject:v12 forKeyedSubscript:@"conferenceInviteData"];
    }
  }
  return v5;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_8(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "callMetadataForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"));
  return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"conferenceCallMetadata", 0);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_9(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"conferencePeerCN"];
    id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "setPeerCN:callID:", v4, objc_msgSend(v5, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_10(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  if (!v5) {
    return 0;
  }
  objc_msgSend(v4, "networkQualityForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithDouble:v6];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceNetworkQuality", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_11(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "requiresWifi"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceRequiresWifi", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_12(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceRequiresWifi"];
    if (v4) {
      objc_msgSend(v3, "setRequiresWifi:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  long long v24 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"conferenceOldCallID"];
  uint64_t v9 = (void *)[a2 objectForKeyedSubscript:@"conferenceIsCaller"];
  uint64_t v10 = [a2 objectForKeyedSubscript:@"conferenceParticipantID"];
  uint64_t v23 = [a2 objectForKeyedSubscript:@"conferenceInviteData"];
  uint64_t v22 = [a2 objectForKeyedSubscript:@"conferenceRelayRequest"];
  uint64_t v11 = [a2 objectForKeyedSubscript:@"conferenceCapabilities"];
  uint64_t v12 = [a2 objectForKeyedSubscript:@"conferenceDestination"];
  id v13 = (void *)[a2 objectForKeyedSubscript:@"USERXPCARGUMENTS"];
  if (v13) {
    int v14 = xpc_dictionary_dup_fd(v13, "FILEDESCRIPTOR");
  }
  else {
    int v14 = -1;
  }
  __int16 v15 = [[VCCapabilities alloc] initWithEncodedDictionary:v11];
  unsigned int v16 = v15;
  if (v7 && v8 && v9 && v10 && v15)
  {
    LODWORD(v21) = v14;
    LOBYTE(v20) = 1;
    uint64_t v17 = objc_msgSend(v24, "startConnectionWithParticipantID:callID:oldCallID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", v10, objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v8, "unsignedIntValue"), v23, objc_msgSend(v9, "BOOLValue"), v22, v20, v15, v21, v12, a3);
    int v18 = (void *)[objc_alloc(NSNumber) initWithBool:v17];
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v18, @"conferenceConnectionStarted", 0);

    [v24 setDelegate:*(void *)(a1 + 32)];
  }
  else
  {
    close(v14);
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4) {
      objc_msgSend(v3, "stopCallID:", objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4) {
      objc_msgSend(v3, "cancelCallID:", objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_16(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4) {
      objc_msgSend(v3, "remoteCancelledCallID:", objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_17(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"conferenceCallReport"];
    uint64_t v6 = [a2 objectForKeyedSubscript:@"conferenceCallReportProtobuf"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallReportProtobufID"];
    if (v4 && v5) {
      objc_msgSend(v3, "setCallReport:withReport:", objc_msgSend(v4, "unsignedIntValue"), v5);
    }
    if (v4 && v6 && v7) {
      objc_msgSend(v3, "setCallReportProtobuf:withProtobufData:forMetricID:", objc_msgSend(v4, "unsignedIntValue"), v6, objc_msgSend(v7, "integerValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_18(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceActive"];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(v4, "setActive:", objc_msgSend(v5, "BOOLValue"));
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithBool:v6];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceActive", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_19(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"conferenceConnectionBlob"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "processRemoteIPChange:callID:", v5, objc_msgSend(v4, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_20(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isOutputMeteringEnabled"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceOutputMetering", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_21(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceOutputMetering"];
    if (v4) {
      objc_msgSend(v3, "setOutputMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_22(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isInputMeteringEnabled"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceInputMetering", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_23(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceInputMetering"];
    if (v4) {
      objc_msgSend(v3, "setInputMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_24(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isInputFrequencyMeteringEnabled"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceInputFreqMetering", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_25(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceInputFreqMetering"];
    if (v4) {
      objc_msgSend(v3, "setInputFrequencyMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_26(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isOutputFrequencyMeteringEnabled"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceOutputFreqMetering", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_27(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceOutputFreqMetering"];
    if (v4) {
      objc_msgSend(v3, "setOutputFrequencyMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_28(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_alloc(NSNumber);
  [v4 outputMeterLevel];
  uint64_t v6 = objc_msgSend(v5, "initWithFloat:");
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"conferenceOutputMetering", 0);

  return v7;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_29(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_alloc(NSNumber);
  [v4 inputMeterLevel];
  uint64_t v6 = objc_msgSend(v5, "initWithFloat:");
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"conferenceInputMetering", 0);

  return v7;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_31(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceMicrophoneMute"];
    if (v4) {
      objc_msgSend(v3, "setMicrophoneMuted:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_32(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "localFramerateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceLocalFrameRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_34(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "remoteFramerateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceRemoteFrameRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_35(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "remoteBitrateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceRemoteBitRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_36(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "localPacketLossRateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceRemotePacketLossRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_37(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "remotePacketLossRateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceRemotePacketLossRate", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_38(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
  id v6 = objc_alloc(NSNumber);
  objc_msgSend(v4, "roundTripTimeForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  uint64_t v7 = objc_msgSend(v6, "initWithDouble:");
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"conferenceRoundTripTime", 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_39(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "statsForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"));
  return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"conferenceCallStats", 0);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_40(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceSpeakerEnabled"];
    if (v4) {
      objc_msgSend(v3, "setEnableSpeakerPhone:", objc_msgSend(v4, "BOOLValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_41(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v4, "isSpeakerPhoneEnabled"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceSpeakerEnabled", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_42(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v4, "natType"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceNATType", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_43(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceAudioSending"];
    id v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "setSendAudio:forCallID:", objc_msgSend(v4, "BOOLValue"), objc_msgSend(v5, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_44(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"conferenceAudioPause"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v6)
    {
      if (v7) {
        objc_msgSend(v5, "setPauseAudio:callID:error:", objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "unsignedIntValue"), a3);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_45(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v5 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"conferenceVideoPause"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v6)
    {
      if (v7) {
        objc_msgSend(v5, "setPauseVideo:callID:error:", objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "unsignedIntValue"), a3);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_46(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = [a2 objectForKeyedSubscript:@"conferenceServerInfo"];
    if (v3) {
      +[GKSConnectivitySettings setServerAddresses:v3];
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_47(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v4, "localFrameWidth"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceLocalFrameWidth", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_48(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  id v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v4, "localFrameHeight"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceLocalFrameHeight", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_50(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "remoteFrameSizeForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"));
  id v5 = (void *)[objc_alloc(NSNumber) initWithInt:(int)v4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceRemoteFrameHeight", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_51(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    double v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"conferenceRelayRequest"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "processRelayRequestResponse:responseDict:didOriginateRequest:", objc_msgSend(v4, "unsignedIntValue"), v5, 1);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_52(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    double v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = [a2 objectForKeyedSubscript:@"conferenceRelayRequest"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "processRelayUpdate:updateDict:didOriginateRequest:", objc_msgSend(v4, "unsignedIntValue"), v5, 1);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      double v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v3;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 1071;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> [incomingArgs objectForKey:CLIENT_DIED_KEY] != nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
  }
  else
  {
    if (!a2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v5;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke_53";
        __int16 v22 = 1024;
        int v23 = 1049;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: Incoming arguments are nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v8 = [a2 objectForKeyedSubscript:@"conferenceARPLData"];
    if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 1057;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: Call ID is nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    uint64_t v11 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if (!v11 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      id v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 1063;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: VideoConference context is nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v7 intValue];
        int v18 = 136315906;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 1066;
        __int16 v24 = 1024;
        int v25 = v16;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> Relaying outgoing ARPL data from AVConference via XPC to VideoConference with callID=%d (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x22u);
      }
    }
    objc_msgSend(v11, "sendARPLData:toCallID:", v8, objc_msgSend(v7, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_350(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "sendData:toCallID:encrypted:", objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceData"), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceCallID"), "unsignedIntValue"), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"conferenceEncryptData"), "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2_360(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  double v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v4, "lastActiveCall"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"conferenceCallID", 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_3_364(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    double v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    if (v4) {
      objc_msgSend(v3, "setLastActiveCall:", objc_msgSend(v4, "unsignedIntegerValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_4_368(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    double v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceRelayedCallType"];
    if (v4) {
      objc_msgSend(v3, "updateRelayedCallType:forCallID:", objc_msgSend(v5, "unsignedCharValue"), objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_5_375(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    double v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = -[VCCapabilities initWithEncodedDictionary:]([VCCapabilities alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"conferenceCapabilities"]);
    if (v4) {
      objc_msgSend(v3, "updateCapabilities:forCallID:", v5, objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_6_379(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceShouldSendBlackFrameState"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "shouldSendBlackFrame:callID:", objc_msgSend(v5, "BOOLValue"), v4);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_7_386(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceState"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "setConferenceState:forCallID:", objc_msgSend(v5, "unsignedIntValue"), objc_msgSend(v4, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_8_393(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceVisualRectangle"];
    if (v4)
    {
      uint64_t v6 = v5;
      if (v5)
      {
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "doubleValue");
        double v8 = v7;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 1), "doubleValue");
        double v10 = v9;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 2), "doubleValue");
        double v12 = v11;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 3), "doubleValue");
        objc_msgSend(v3, "setConferenceVisualRectangle:forCallID:", objc_msgSend(v4, "unsignedIntValue"), v8, v10, v12, v13);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_9_400(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"conferenceCallID"];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"conferenceProtocolVersion"];
    if (v4)
    {
      if (v5) {
        objc_msgSend(v3, "setPeerProtocolVersion:forCallID:", objc_msgSend(v5, "unsignedIntValue"), objc_msgSend(v4, "unsignedIntValue"));
      }
    }
  }
  return 0;
}

- (void)startSIPWithPacketMultiplexMode:transportType:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]";
  __int16 v4 = 1024;
  int v5 = 595;
  __int16 v6 = 1024;
  int v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d SOMETHING WENT WRONG IN SIP LISTEN! %08x", v2, 0x22u);
}

@end