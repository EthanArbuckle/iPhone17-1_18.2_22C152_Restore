@interface MPAudioDeviceController
- (BOOL)wirelessRouteIsPicked;
- (id)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MPAudioDeviceController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (BOOL)wirelessRouteIsPicked
{
  return 0;
}

@end