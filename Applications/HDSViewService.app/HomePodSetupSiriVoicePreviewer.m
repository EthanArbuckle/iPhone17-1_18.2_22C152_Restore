@interface HomePodSetupSiriVoicePreviewer
- (SFSession)session;
- (SUICVoicePreviewingDelegate)delegate;
- (void)_updatePowerOutputLevel;
- (void)previewVoice:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation HomePodSetupSiriVoicePreviewer

- (void)previewVoice:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSMutableDictionary dictionary];
  v10 = [v7 languageCode];
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"siriVL"];
  }
  v11 = [v7 name];

  if (v11) {
    [v9 setObject:v11 forKeyedSubscript:@"siriVN"];
  }
  id v12 = [v7 gender];
  if (v12)
  {
    v13 = +[NSNumber numberWithInteger:v12];
    [v9 setObject:v13 forKeyedSubscript:@"siriVG"];
  }
  if (![(NSTimer *)self->_powerLevelUpdaterTimer isValid])
  {
    v14 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_updatePowerOutputLevel" selector:0 userInfo:1 repeats:0.0166666675];
    powerLevelUpdaterTimer = self->_powerLevelUpdaterTimer;
    self->_powerLevelUpdaterTimer = v14;
  }
  objc_storeStrong((id *)&self->_voicePreviewing, a3);
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009428;
  v19[3] = &unk_1000D9C68;
  objc_copyWeak(&v22, &location);
  id v17 = v7;
  id v20 = v17;
  id v18 = v8;
  id v21 = v18;
  [WeakRetained sendRequestID:@"_pvoice" options:&off_1000DF078 request:v9 responseHandler:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_updatePowerOutputLevel
{
  if (self->_voicePreviewing)
  {
    float v3 = (float)(int)arc4random_uniform(0x32u) + -60.0;
  }
  else
  {
    [(NSTimer *)self->_powerLevelUpdaterTimer invalidate];
    powerLevelUpdaterTimer = self->_powerLevelUpdaterTimer;
    self->_powerLevelUpdaterTimer = 0;

    float v3 = -60.0;
  }
  id v6 = [(HomePodSetupSiriVoicePreviewer *)self delegate];
  *(float *)&double v5 = v3;
  [v6 voicePreviewerAudioOutputDidChangePowerLevel:v5];
}

- (SUICVoicePreviewingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voicePreviewerDelegate);

  return (SUICVoicePreviewingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (SFSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_voicePreviewing, 0);
  objc_destroyWeak((id *)&self->_voicePreviewerDelegate);

  objc_storeStrong((id *)&self->_powerLevelUpdaterTimer, 0);
}

@end