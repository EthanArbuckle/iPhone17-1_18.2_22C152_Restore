@interface _AFSiriClientState
- (BOOL)hasActiveSession;
- (BOOL)isListening;
- (BOOL)isSpeaking;
- (_AFSiriClientState)init;
- (unint64_t)notifyState;
- (void)addRequestUUID:(id)a3;
- (void)removeRequestUUID:(id)a3;
- (void)setHasActiveSession:(BOOL)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setIsSpeaking:(BOOL)a3;
@end

@implementation _AFSiriClientState

- (void).cxx_destruct
{
}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_isSpeaking = a3;
}

- (BOOL)isSpeaking
{
  return self->_isSpeaking;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setHasActiveSession:(BOOL)a3
{
  self->_hasActiveSession = a3;
}

- (BOOL)hasActiveSession
{
  return self->_hasActiveSession;
}

- (unint64_t)notifyState
{
  BOOL hasActiveSession = self->_hasActiveSession;
  unint64_t v4 = ([(NSMutableSet *)self->_requestUUIDs count] != 0) | (unint64_t)(2 * hasActiveSession);
  if (self->_isListening) {
    v4 |= 4uLL;
  }
  if (self->_isSpeaking) {
    return v4 | 8;
  }
  else {
    return v4;
  }
}

- (void)removeRequestUUID:(id)a3
{
}

- (void)addRequestUUID:(id)a3
{
}

- (_AFSiriClientState)init
{
  v6.receiver = self;
  v6.super_class = (Class)_AFSiriClientState;
  v2 = [(_AFSiriClientState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requestUUIDs = v2->_requestUUIDs;
    v2->_requestUUIDs = v3;
  }
  return v2;
}

@end