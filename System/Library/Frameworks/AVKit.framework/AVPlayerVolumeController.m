@interface AVPlayerVolumeController
+ (id)volumeController;
- (AVObservationController)keyValueObservationController;
- (AVPlayerController)playerController;
- (AVPlayerVolumeController)init;
- (BOOL)currentRouteHasVolumeControl;
- (BOOL)isChangingVolume;
- (BOOL)prefersSystemVolumeHUDHidden;
- (float)volume;
- (void)beginChangingVolume;
- (void)dealloc;
- (void)endChangingVolume;
- (void)setChangingVolume:(BOOL)a3;
- (void)setKeyValueObservationController:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3;
- (void)setTargetVolume:(float)a3;
@end

@implementation AVPlayerVolumeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueObservationController, 0);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (void)setKeyValueObservationController:(id)a3
{
}

- (AVObservationController)keyValueObservationController
{
  return self->_keyValueObservationController;
}

- (void)setChangingVolume:(BOOL)a3
{
  self->_changingVolume = a3;
}

- (BOOL)isChangingVolume
{
  return self->_changingVolume;
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  self->_prefersSystemVolumeHUDHidden = a3;
}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (void)endChangingVolume
{
}

- (void)beginChangingVolume
{
}

- (BOOL)currentRouteHasVolumeControl
{
  v2 = [(AVPlayerVolumeController *)self playerController];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setTargetVolume:(float)a3
{
  id v4 = [(AVPlayerVolumeController *)self playerController];
  objc_msgSend(v4, "setVolume:", fmin(fmax(a3, 0.0), 1.0));
}

- (float)volume
{
  v2 = [(AVPlayerVolumeController *)self playerController];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)dealloc
{
  [(AVObservationController *)self->_keyValueObservationController stopAllObservation];
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerVolumeController;
  [(AVPlayerVolumeController *)&v3 dealloc];
}

- (AVPlayerVolumeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerVolumeController;
  v2 = [(AVPlayerVolumeController *)&v7 init];
  if (v2)
  {
    objc_super v3 = [[AVObservationController alloc] initWithOwner:v2];
    keyValueObservationController = v2->_keyValueObservationController;
    v2->_keyValueObservationController = v3;

    id v5 = [(AVObservationController *)v2->_keyValueObservationController startObserving:v2 keyPath:@"playerController.volume" includeInitialValue:0 observationHandler:&__block_literal_global_12337];
  }
  return v2;
}

void __32__AVPlayerVolumeController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28EB8];
  id v3 = a2;
  id v4 = [v2 defaultCenter];
  [v4 postNotificationName:@"AVVolumeControllerVolumeChangedNotification" object:v3];
}

+ (id)volumeController
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end