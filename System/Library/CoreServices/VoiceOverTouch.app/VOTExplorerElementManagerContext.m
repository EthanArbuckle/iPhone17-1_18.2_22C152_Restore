@interface VOTExplorerElementManagerContext
+ (id)context;
- (BOOL)attemptToSetNativeFocus;
- (BOOL)interruptsCurrentSpeech;
- (BOOL)readFromCurrentExplorerElement;
- (BOOL)userInitiated;
- (double)beginTimestamp;
- (void)setAttemptToSetNativeFocus:(BOOL)a3;
- (void)setBeginTimestamp:(double)a3;
- (void)setInterruptsCurrentSpeech:(BOOL)a3;
- (void)setReadFromCurrentExplorerElement:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation VOTExplorerElementManagerContext

+ (id)context
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)interruptsCurrentSpeech
{
  return self->_interruptsCurrentSpeech;
}

- (void)setInterruptsCurrentSpeech:(BOOL)a3
{
  self->_interruptsCurrentSpeech = a3;
}

- (BOOL)attemptToSetNativeFocus
{
  return self->_attemptToSetNativeFocus;
}

- (void)setAttemptToSetNativeFocus:(BOOL)a3
{
  self->_attemptToSetNativeFocus = a3;
}

- (BOOL)readFromCurrentExplorerElement
{
  return self->_readFromCurrentExplorerElement;
}

- (void)setReadFromCurrentExplorerElement:(BOOL)a3
{
  self->_readFromCurrentExplorerElement = a3;
}

- (double)beginTimestamp
{
  return self->_beginTimestamp;
}

- (void)setBeginTimestamp:(double)a3
{
  self->_beginTimestamp = a3;
}

@end