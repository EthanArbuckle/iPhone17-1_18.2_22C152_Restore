@interface STTTRDelegate
- (STStorageOtherDetailController)controller;
- (void)enableOptionForTip:(id)a3;
- (void)setController:(id)a3;
@end

@implementation STTTRDelegate

- (void)enableOptionForTip:(id)a3
{
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v5 = [WeakRetained otherSize];
  [v5 longLongValue];
  v6 = STFormattedSize();
  id v11 = +[NSString stringWithFormat:@"[Large System Data]: %@ of System Data", v6];

  id v7 = objc_loadWeakRetained((id *)p_controller);
  v8 = [v7 detailedText];
  v9 = STTapToRadarURLWithTitleAndContent();

  v10 = +[LSApplicationWorkspace defaultWorkspace];
  [v10 openURL:v9 configuration:0 completionHandler:0];
}

- (STStorageOtherDetailController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (STStorageOtherDetailController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end