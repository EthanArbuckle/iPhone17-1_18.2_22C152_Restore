@interface SHToggleManager
- (BOOL)isToggleOn;
- (SHManagedSession)session;
- (SHToggleManager)init;
- (SHToggleManagerDelegate)delegate;
- (int64_t)toggleState;
- (void)finishedManagedSession:(id)a3;
- (void)playStartRecordingSystemSound;
- (void)playStopRecordingSystemSound;
- (void)playSystemSoundWithID:(unsigned int)a3 completion:(id)a4;
- (void)recognitionDidFinish;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setToggleState:(int64_t)a3;
- (void)stop;
- (void)switchToggleOff;
- (void)toggleRecognitionState;
- (void)toggleToState:(int64_t)a3;
@end

@implementation SHToggleManager

- (SHToggleManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)SHToggleManager;
  result = [(SHToggleManager *)&v3 init];
  if (result) {
    result->_toggleState = 1;
  }
  return result;
}

- (void)toggleRecognitionState
{
  v10[1] = *MEMORY[0x263EF8340];
  [(SHToggleManager *)self setToggleState:[(SHToggleManager *)self isToggleOn]];
  if ([(SHToggleManager *)self isToggleOn])
  {
    [(SHToggleManager *)self playStartRecordingSystemSound];
    objc_super v3 = [(SHToggleManager *)self session];
    [v3 matchAmbientAudioSnippet];
  }
  else
  {
    [(SHToggleManager *)self stop];
    [(SHToggleManager *)self playStopRecordingSystemSound];
  }
  v4 = (void *)MEMORY[0x263F6C480];
  uint64_t v5 = *MEMORY[0x263F6C4E8];
  uint64_t v9 = *MEMORY[0x263F6C508];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SHToggleManager isToggleOn](self, "isToggleOn"));
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 sendEvent:v5 withPayload:v7];

  v8 = [(SHToggleManager *)self delegate];
  objc_msgSend(v8, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));
}

- (void)toggleToState:(int64_t)a3
{
  if ([(SHToggleManager *)self toggleState] != a3)
  {
    [(SHToggleManager *)self setToggleState:a3];
    id v5 = [(SHToggleManager *)self delegate];
    objc_msgSend(v5, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));
  }
}

- (BOOL)isToggleOn
{
  return [(SHToggleManager *)self toggleState] == 0;
}

- (void)switchToggleOff
{
}

- (void)playStartRecordingSystemSound
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    MEMORY[0x270F9A6D0](self, sel_playSystemSoundWithID_completion_);
  }
}

- (void)playStopRecordingSystemSound
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    MEMORY[0x270F9A6D0](self, sel_playSystemSoundWithID_completion_);
  }
}

- (void)playSystemSoundWithID:(unsigned int)a3 completion:(id)a4
{
}

- (void)stop
{
  v2 = [(SHToggleManager *)self session];
  [v2 cancel];

  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 postNotificationName:@"com.apple.musicrecognition.cancelLiveActivity" object:0];
}

- (void)recognitionDidFinish
{
  if ([(SHToggleManager *)self isToggleOn])
  {
    [(SHToggleManager *)self switchToggleOff];
    id v3 = [(SHToggleManager *)self delegate];
    objc_msgSend(v3, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));

    [(SHToggleManager *)self playStopRecordingSystemSound];
  }
}

- (SHManagedSession)session
{
  session = self->_session;
  if (!session)
  {
    v4 = (SHManagedSession *)objc_alloc_init(MEMORY[0x263F17780]);
    id v5 = self->_session;
    self->_session = v4;

    [(SHManagedSession *)self->_session setEnableLiveActivity:1];
    [(SHManagedSession *)self->_session setDelegate:self];
    session = self->_session;
  }

  return session;
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = shcore_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_24069F000, v6, OS_LOG_TYPE_DEBUG, "SHToggleManager session didFindMatch %@", (uint8_t *)&v7, 0xCu);
  }

  [(SHToggleManager *)self recognitionDidFinish];
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = shcore_log_object();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_24069F000, v9, OS_LOG_TYPE_DEBUG, "SHToggleManager session didNotFindMatchForSignature %@ error %@", (uint8_t *)&v10, 0x16u);
  }

  [(SHToggleManager *)self recognitionDidFinish];
}

- (void)finishedManagedSession:(id)a3
{
  v4 = shcore_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_24069F000, v4, OS_LOG_TYPE_DEBUG, "SHToggleManager session finishedManagedSession", v5, 2u);
  }

  [(SHToggleManager *)self recognitionDidFinish];
}

- (SHToggleManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHToggleManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(int64_t)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end