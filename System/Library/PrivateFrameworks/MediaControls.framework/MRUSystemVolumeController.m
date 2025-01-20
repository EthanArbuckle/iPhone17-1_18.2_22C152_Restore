@interface MRUSystemVolumeController
+ (id)packageStateForVolumeValue:(float)a3;
- (MPVolumeController)primaryVolumeController;
- (MPVolumeController)secondaryVolumeController;
- (MPVolumeController)systemVolumeController;
- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController;
- (MRUSystemVolumeController)initWithOutputDeviceRouteController:(id)a3;
- (MRUSystemVolumeControllerDelegate)delegate;
- (NSString)volumeAudioCategory;
- (float)volumeValueForType:(int64_t)a3;
- (id)volumeControllerForType:(int64_t)a3;
- (int64_t)typeForVolumeController:(id)a3;
- (unsigned)volumeCapabilitiesForType:(int64_t)a3;
- (void)decreaseVolume;
- (void)increaseVolume;
- (void)setDelegate:(id)a3;
- (void)setVolumeValue:(float)a3 forType:(int64_t)a4;
- (void)updateVolumeControllers;
- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRUSystemVolumeController

- (unsigned)volumeCapabilitiesForType:(int64_t)a3
{
  v3 = [(MRUSystemVolumeController *)self volumeControllerForType:a3];
  unsigned int v4 = [v3 volumeCapabilities];

  return v4;
}

- (id)volumeControllerForType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self = (MRUSystemVolumeController *)*((id *)&self->_systemVolumeController + a3);
  }
  return self;
}

- (MRUSystemVolumeController)initWithOutputDeviceRouteController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRUSystemVolumeController;
  v6 = [(MRUSystemVolumeController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    [(MRUSystemOutputDeviceRouteController *)v7->_outputDeviceRouteController addObserver:v7];
    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Audio/Video", @"MediaPlayback", @"Alarm", @"Ringtone", @"PhoneCall", @"VoiceCommand", 0);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F31A80]) initWithVolumeAudioCategories:v8];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F31A70]) initWithDataSource:v9];
    systemVolumeController = v7->_systemVolumeController;
    v7->_systemVolumeController = (MPVolumeController *)v10;

    [(MPVolumeController *)v7->_systemVolumeController setDelegate:v7];
    [(MRUSystemVolumeController *)v7 updateVolumeControllers];
  }
  return v7;
}

- (NSString)volumeAudioCategory
{
  return [(MPVolumeController *)self->_systemVolumeController volumeAudioCategory];
}

- (float)volumeValueForType:(int64_t)a3
{
  uint64_t v3 = [(MRUSystemVolumeController *)self volumeControllerForType:a3];
  char v4 = [v3 volumeCapabilities];
  [v3 volumeValue];
  if ((v4 & 2) != 0) {
    float v6 = v5;
  }
  else {
    float v6 = 1.0;
  }

  return v6;
}

- (void)setVolumeValue:(float)a3 forType:(int64_t)a4
{
  id v7 = [(MRUSystemVolumeController *)self volumeControllerForType:a4];
  LODWORD(v5) = 1036831949;
  *(float *)&double v6 = a3;
  [v7 setVolume:v6 withNotificationDelay:v5];
}

- (void)increaseVolume
{
}

- (void)decreaseVolume
{
}

+ (id)packageStateForVolumeValue:(float)a3
{
  if (a3 <= 0.00000011921) {
    return @"mute";
  }
  if (a3 < 0.33) {
    return @"min";
  }
  if (a3 >= 1.0) {
    char v4 = @"max";
  }
  else {
    char v4 = @"full";
  }
  if (a3 >= 0.66) {
    return v4;
  }
  else {
    return @"half";
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v6 = a3;
  int64_t v7 = [(MRUSystemVolumeController *)self typeForVolumeController:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [v6 volumeCapabilities];

  *(float *)&double v9 = a4;
  [WeakRetained systemVolumeController:self didChangeVolumeControlCapabilities:v8 effectiveVolumeValue:v7 forType:v9];
}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v11 = a3;
  int64_t v6 = -[MRUSystemVolumeController typeForVolumeController:](self, "typeForVolumeController:");
  float v7 = 1.0;
  if ((v4 & 2) != 0)
  {
    [v11 volumeValue];
    float v7 = v8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&double v10 = v7;
  [WeakRetained systemVolumeController:self didChangeVolumeControlCapabilities:v4 effectiveVolumeValue:v6 forType:v10];
}

- (void)updateVolumeControllers
{
  if ([(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController isSplitRoute])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F31A78]);
    uint64_t v4 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController systemRoute];
    double v5 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
    uint64_t v16 = [v3 initWithGroupRoute:v4 outputDeviceRoute:v5];

    int64_t v6 = (MPVolumeController *)[objc_alloc(MEMORY[0x1E4F31A70]) initWithDataSource:v16];
    primaryVolumeController = self->_primaryVolumeController;
    self->_primaryVolumeController = v6;

    [(MPVolumeController *)self->_primaryVolumeController setDelegate:self];
    id v8 = objc_alloc(MEMORY[0x1E4F31A78]);
    double v9 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController systemRoute];
    double v10 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController secondaryOutputDeviceRoute];
    id v11 = (void *)[v8 initWithGroupRoute:v9 outputDeviceRoute:v10];

    v12 = (MPVolumeController *)[objc_alloc(MEMORY[0x1E4F31A70]) initWithDataSource:v11];
    secondaryVolumeController = self->_secondaryVolumeController;
    self->_secondaryVolumeController = v12;

    [(MPVolumeController *)self->_secondaryVolumeController setDelegate:self];
    v14 = (MPVolumeController *)v16;
  }
  else
  {
    [(MPVolumeController *)self->_primaryVolumeController setDelegate:0];
    v15 = self->_primaryVolumeController;
    self->_primaryVolumeController = 0;

    [(MPVolumeController *)self->_secondaryVolumeController setDelegate:0];
    v14 = self->_secondaryVolumeController;
    self->_secondaryVolumeController = 0;
  }
}

- (int64_t)typeForVolumeController:(id)a3
{
  if (self->_primaryVolumeController == a3) {
    return 1;
  }
  else {
    return 2 * (self->_secondaryVolumeController == a3);
  }
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (MRUSystemVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUSystemVolumeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPVolumeController)systemVolumeController
{
  return self->_systemVolumeController;
}

- (MPVolumeController)primaryVolumeController
{
  return self->_primaryVolumeController;
}

- (MPVolumeController)secondaryVolumeController
{
  return self->_secondaryVolumeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryVolumeController, 0);
  objc_storeStrong((id *)&self->_primaryVolumeController, 0);
  objc_storeStrong((id *)&self->_systemVolumeController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end