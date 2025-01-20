@interface _MPCReportingController
- (MPCLyricsReportingController)lyricsReportingController;
- (MPCPlaybackEngine)playbackEngine;
- (_MPCReportingController)initWithPlaybackEngine:(id)a3;
- (void)recordLyricsViewEvent:(id)a3;
- (void)setLyricsReportingController:(id)a3;
@end

@implementation _MPCReportingController

- (_MPCReportingController)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MPCReportingController;
  v5 = [(_MPCReportingController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v7 = objc_alloc_init(MPCLyricsReportingController);
    lyricsReportingController = v6->_lyricsReportingController;
    v6->_lyricsReportingController = v7;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsReportingController, 0);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (void)setLyricsReportingController:(id)a3
{
}

- (MPCLyricsReportingController)lyricsReportingController
{
  return self->_lyricsReportingController;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (void)recordLyricsViewEvent:(id)a3
{
}

@end