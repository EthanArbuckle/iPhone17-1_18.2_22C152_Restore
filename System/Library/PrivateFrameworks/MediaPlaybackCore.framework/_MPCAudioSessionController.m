@interface _MPCAudioSessionController
- (AVAudioSession)audioSession;
- (NSString)category;
- (_MPCAudioSessionController)init;
- (id)lostObserver;
- (id)resetObserver;
- (unint64_t)categoryOptions;
- (unint64_t)routeSharingPolicy;
- (void)dealloc;
- (void)restoreSessionSettingsFromSnapshot;
- (void)setAudioSession:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryOptions:(unint64_t)a3;
- (void)setLostObserver:(id)a3;
- (void)setResetObserver:(id)a3;
- (void)setRouteSharingPolicy:(unint64_t)a3;
- (void)setupObservations;
- (void)snapshotSessionSettings;
- (void)tearDownObservations;
- (void)updateAudioSession:(id)a3 options:(unint64_t)a4 routeSharingPolicy:(unint64_t)a5;
@end

@implementation _MPCAudioSessionController

- (void)dealloc
{
  [(_MPCAudioSessionController *)self tearDownObservations];
  v3.receiver = self;
  v3.super_class = (Class)_MPCAudioSessionController;
  [(_MPCAudioSessionController *)&v3 dealloc];
}

- (void)tearDownObservations
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(_MPCAudioSessionController *)self lostObserver];
  [v3 removeObserver:v4];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [(_MPCAudioSessionController *)self resetObserver];
  [v6 removeObserver:v5];
}

- (id)resetObserver
{
  return self->_resetObserver;
}

- (id)lostObserver
{
  return self->_lostObserver;
}

- (_MPCAudioSessionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MPCAudioSessionController;
  v2 = [(_MPCAudioSessionController *)&v5 init];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x263EF93E0] sharedInstance];
    [(_MPCAudioSessionController *)v2 setAudioSession:v3];

    [(_MPCAudioSessionController *)v2 setupObservations];
  }
  return v2;
}

- (void)setupObservations
{
  objc_initWeak(&location, self);
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [(_MPCAudioSessionController *)self audioSession];
  uint64_t v5 = *MEMORY[0x263EF90E8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47___MPCAudioSessionController_setupObservations__block_invoke;
  v13[3] = &unk_2643C09F8;
  objc_copyWeak(&v14, &location);
  id v6 = [v3 addObserverForName:v5 object:v4 queue:0 usingBlock:v13];
  [(_MPCAudioSessionController *)self setLostObserver:v6];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  v8 = [(_MPCAudioSessionController *)self audioSession];
  uint64_t v9 = *MEMORY[0x263EF90F8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47___MPCAudioSessionController_setupObservations__block_invoke_2;
  v11[3] = &unk_2643C09F8;
  objc_copyWeak(&v12, &location);
  v10 = [v7 addObserverForName:v9 object:v8 queue:0 usingBlock:v11];
  [(_MPCAudioSessionController *)self setResetObserver:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setResetObserver:(id)a3
{
}

- (void)setLostObserver:(id)a3
{
}

- (void)setAudioSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetObserver, 0);
  objc_storeStrong(&self->_lostObserver, 0);

  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)setRouteSharingPolicy:(unint64_t)a3
{
  self->_routeSharingPolicy = a3;
}

- (unint64_t)routeSharingPolicy
{
  return self->_routeSharingPolicy;
}

- (void)setCategoryOptions:(unint64_t)a3
{
  self->_categoryOptions = a3;
}

- (unint64_t)categoryOptions
{
  return self->_categoryOptions;
}

- (void)setCategory:(id)a3
{
  self->_category = (NSString *)a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)restoreSessionSettingsFromSnapshot
{
  id v3 = [(_MPCAudioSessionController *)self category];
  [(_MPCAudioSessionController *)self updateAudioSession:v3 options:[(_MPCAudioSessionController *)self categoryOptions] routeSharingPolicy:[(_MPCAudioSessionController *)self routeSharingPolicy]];
}

- (void)snapshotSessionSettings
{
  id v3 = [(_MPCAudioSessionController *)self audioSession];
  v4 = [v3 category];
  [(_MPCAudioSessionController *)self setCategory:v4];

  uint64_t v5 = [(_MPCAudioSessionController *)self audioSession];
  -[_MPCAudioSessionController setCategoryOptions:](self, "setCategoryOptions:", [v5 categoryOptions]);

  id v6 = [(_MPCAudioSessionController *)self audioSession];
  -[_MPCAudioSessionController setRouteSharingPolicy:](self, "setRouteSharingPolicy:", [v6 routeSharingPolicy]);
}

- (void)updateAudioSession:(id)a3 options:(unint64_t)a4 routeSharingPolicy:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(_MPCAudioSessionController *)self audioSession];
  [v9 setCategory:v8 mode:*MEMORY[0x263EF9108] routeSharingPolicy:a5 options:a4 error:0];
}

@end