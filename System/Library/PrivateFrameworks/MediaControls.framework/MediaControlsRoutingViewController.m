@interface MediaControlsRoutingViewController
- (BOOL)_canShowWhileLocked;
- (id)_createVolumeSlider;
@end

@implementation MediaControlsRoutingViewController

- (id)_createVolumeSlider
{
  v2 = [MediaControlsVolumeSlider alloc];
  v3 = -[MPVolumeSlider initWithFrame:style:endpointRoute:outputDeviceRoute:](v2, "initWithFrame:style:endpointRoute:outputDeviceRoute:", 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end