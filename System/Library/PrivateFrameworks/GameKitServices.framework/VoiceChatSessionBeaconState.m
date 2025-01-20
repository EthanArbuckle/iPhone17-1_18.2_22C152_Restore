@interface VoiceChatSessionBeaconState
- (BOOL)needsSend;
- (VoiceChatSessionBeaconState)init;
- (tagVoiceChatBeacon)lastReceivedBeacon;
- (unsigned)receivedState;
- (unsigned)sentState;
- (unsigned)typeToSend;
- (void)dealloc;
- (void)setLastReceivedBeacon:(tagVoiceChatBeacon *)a3;
- (void)setNeedsSend:(BOOL)a3;
- (void)setReceivedState:(unsigned int)a3;
- (void)setSentState:(unsigned int)a3;
- (void)setTypeToSend:(unsigned int)a3;
@end

@implementation VoiceChatSessionBeaconState

- (VoiceChatSessionBeaconState)init
{
  v5.receiver = self;
  v5.super_class = (Class)VoiceChatSessionBeaconState;
  v2 = [(VoiceChatSessionBeaconState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->typeToSend = 0;
    *(void *)&v2->sentState = 0;
    v2->needsSend = 0;
    v2->lastReceivedBeacon = (tagVoiceChatBeacon *)malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
  }
  return v3;
}

- (void)dealloc
{
  lastReceivedBeacon = self->lastReceivedBeacon;
  if (lastReceivedBeacon) {
    free(lastReceivedBeacon);
  }
  v4.receiver = self;
  v4.super_class = (Class)VoiceChatSessionBeaconState;
  [(VoiceChatSessionBeaconState *)&v4 dealloc];
}

- (tagVoiceChatBeacon)lastReceivedBeacon
{
  return self->lastReceivedBeacon;
}

- (void)setLastReceivedBeacon:(tagVoiceChatBeacon *)a3
{
  lastReceivedBeacon = self->lastReceivedBeacon;
  long long v4 = *(_OWORD *)&a3->var0;
  lastReceivedBeacon->var4 = a3->var4;
  *(_OWORD *)&lastReceivedBeacon->var0 = v4;
}

- (unsigned)sentState
{
  return self->sentState;
}

- (void)setSentState:(unsigned int)a3
{
  self->sentState = a3;
}

- (unsigned)receivedState
{
  return self->receivedState;
}

- (void)setReceivedState:(unsigned int)a3
{
  self->receivedState = a3;
}

- (BOOL)needsSend
{
  return self->needsSend;
}

- (void)setNeedsSend:(BOOL)a3
{
  self->needsSend = a3;
}

- (unsigned)typeToSend
{
  return self->typeToSend;
}

- (void)setTypeToSend:(unsigned int)a3
{
  self->typeToSend = a3;
}

@end