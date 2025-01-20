@interface MPMusicMediaPickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (MPMediaPickerController)mediaPickerController;
- (void)remoteMediaPickerDidCancel;
- (void)remoteMediaPickerDidPickMediaItems:(id)a3;
- (void)remoteMediaPickerDidPickPlaybackArchive:(id)a3;
- (void)setMediaPickerController:(id)a3;
@end

@implementation MPMusicMediaPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return +[MPMusicMediaPickerXPCInterfaces serviceInterface];
}

+ (id)exportedInterface
{
  return +[MPMusicMediaPickerXPCInterfaces clientInterface];
}

- (void).cxx_destruct
{
}

- (void)setMediaPickerController:(id)a3
{
}

- (MPMediaPickerController)mediaPickerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);

  return (MPMediaPickerController *)WeakRetained;
}

- (void)remoteMediaPickerDidPickPlaybackArchive:(id)a3
{
  p_mediaPickerController = &self->_mediaPickerController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaPickerController);
  [WeakRetained remoteMediaPickerDidPickPlaybackArchive:v4];
}

- (void)remoteMediaPickerDidPickMediaItems:(id)a3
{
  p_mediaPickerController = &self->_mediaPickerController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mediaPickerController);
  [WeakRetained remoteMediaPickerDidPickMediaItems:v4];
}

- (void)remoteMediaPickerDidCancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPickerController);
  [WeakRetained remoteMediaPickerDidCancel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end