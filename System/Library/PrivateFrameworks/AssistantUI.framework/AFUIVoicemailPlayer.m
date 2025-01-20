@interface AFUIVoicemailPlayer
- (VMVoicemail)_voicemailObject;
- (id)_audioCategory;
- (id)_audioURL;
- (id)_voicemailManager;
- (int64_t)_voicemailID;
- (unint64_t)_audioOptions;
- (void)_setVoicemailObject:(id)a3;
- (void)_updateVoicemailPlayedState:(id)a3 finished:(BOOL)a4;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)setPlaybackCommand:(id)a3;
@end

@implementation AFUIVoicemailPlayer

- (void)setPlaybackCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AFUIVoicemailPlayer;
    [(AFUIAudioPlayer *)&v5 setPlaybackCommand:v4];
    [(AFUIVoicemailPlayer *)self _setVoicemailObject:0];
  }
}

- (id)_voicemailManager
{
  voicemailManager = self->_voicemailManager;
  if (!voicemailManager)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getVMVoicemailManagerClass_softClass;
    uint64_t v13 = getVMVoicemailManagerClass_softClass;
    if (!getVMVoicemailManagerClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getVMVoicemailManagerClass_block_invoke;
      v9[3] = &unk_264691928;
      v9[4] = &v10;
      __getVMVoicemailManagerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    objc_super v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (VMVoicemailManager *)objc_alloc_init(v5);
    v7 = self->_voicemailManager;
    self->_voicemailManager = v6;

    voicemailManager = self->_voicemailManager;
  }

  return voicemailManager;
}

- (int64_t)_voicemailID
{
  v2 = [(AFUIVoicemailPlayer *)self _audioURL];
  v3 = [v2 URLByDeletingPathExtension];

  id v4 = [v3 lastPathComponent];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (VMVoicemail)_voicemailObject
{
  voicemailObject = self->_voicemailObject;
  if (!voicemailObject)
  {
    id v4 = [(AFUIVoicemailPlayer *)self _voicemailManager];
    objc_msgSend(v4, "voicemailWithIdentifier:", -[AFUIVoicemailPlayer _voicemailID](self, "_voicemailID"));
    int64_t v5 = (VMVoicemail *)objc_claimAutoreleasedReturnValue();
    v6 = self->_voicemailObject;
    self->_voicemailObject = v5;

    voicemailObject = self->_voicemailObject;
  }

  return voicemailObject;
}

- (void)_updateVoicemailPlayedState:(id)a3 finished:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 duration];
  double v8 = v7;
  [v6 currentTime];
  double v10 = v9;

  if (a4 || v8 != 0.0 && v10 / v8 > 0.75)
  {
    v11 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [(AFUIVoicemailPlayer *)self _audioURL];
      int v17 = 136315394;
      v18 = "-[AFUIVoicemailPlayer _updateVoicemailPlayedState:finished:]";
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s Marking voicemail as played %@", (uint8_t *)&v17, 0x16u);
    }
    v14 = [(AFUIVoicemailPlayer *)self _voicemailManager];
    v15 = [(AFUIVoicemailPlayer *)self _voicemailObject];
    id v16 = (id)[v14 markVoicemailAsRead:v15];
  }
}

- (id)_audioURL
{
  v3 = [(AFUIAudioPlayer *)self playbackCommand];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int64_t v5 = [(AFUIAudioPlayer *)self playbackCommand];
    id v6 = [v5 voiceMailId];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_audioCategory
{
  return (id)*MEMORY[0x263EF9088];
}

- (unint64_t)_audioOptions
{
  return 17;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AFUIVoicemailPlayer *)self _updateVoicemailPlayedState:v6 finished:v4];
  v7.receiver = self;
  v7.super_class = (Class)AFUIVoicemailPlayer;
  [(AFUIAudioPlayer *)&v7 audioPlayerDidFinishPlaying:v6 successfully:v4];
}

- (void)_setVoicemailObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailObject, 0);

  objc_storeStrong((id *)&self->_voicemailManager, 0);
}

@end