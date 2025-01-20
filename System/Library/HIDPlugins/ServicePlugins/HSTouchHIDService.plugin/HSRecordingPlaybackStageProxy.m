@interface HSRecordingPlaybackStageProxy
- (float)playbackProgress;
- (int)mode;
- (unint64_t)recordingSize;
- (void)playbackSetProgress:(float)a3 dispatchEvent:(BOOL)a4;
- (void)recordingSetMaxSize:(unint64_t)a3;
- (void)setMode:(int)a3;
@end

@implementation HSRecordingPlaybackStageProxy

- (int)mode
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = [(HSRecordingPlaybackStageProxy *)self HSRecordingPlaybackStageProxy_0mode];
  int v3 = HSProxySynth::Unbox<HSRecordingPlaybackStageMode>(location[0]);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)setMode:(int)a3
{
  v5 = HSProxySynth::Box<HSRecordingPlaybackStageMode>(a3);
  v7 = v5;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v3 = -[HSRecordingPlaybackStageProxy HSRecordingPlaybackStageProxy_setMode:](self, "HSRecordingPlaybackStageProxy_setMode:");
}

- (void)recordingSetMaxSize:(unint64_t)a3
{
  v5 = HSProxySynth::Box<unsigned long>((HSProxySynth *)a3);
  v7 = v5;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v3 = -[HSRecordingPlaybackStageProxy HSRecordingPlaybackStageProxy_recordingSetMaxSize:](self, "HSRecordingPlaybackStageProxy_recordingSetMaxSize:");
}

- (unint64_t)recordingSize
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = [(HSRecordingPlaybackStageProxy *)self HSRecordingPlaybackStageProxy_0recordingSize];
  id v3 = HSProxySynth::Unbox<unsigned long>(location[0]);
  objc_storeStrong(location, 0);
  return (unint64_t)v3;
}

- (float)playbackProgress
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = [(HSRecordingPlaybackStageProxy *)self HSRecordingPlaybackStageProxy_0playbackProgress];
  float v3 = HSProxySynth::Unbox<float>(location[0]);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)playbackSetProgress:(float)a3 dispatchEvent:(BOOL)a4
{
  BOOL v9 = a4;
  v7 = HSProxySynth::Box<float>((HSProxySynth *)self, *(double *)&a3);
  v10[0] = v7;
  v6 = HSProxySynth::Box<BOOL>(v9);
  v10[1] = v6;
  v5 = +[NSArray arrayWithObjects:v10 count:2];
  id v4 = -[HSRecordingPlaybackStageProxy HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent:](self, "HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent:");
}

@end