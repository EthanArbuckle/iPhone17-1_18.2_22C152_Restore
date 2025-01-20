@interface HMIVideoFrameTrackerDelegateAdapter
- (id)frameTrackerDidTrackFrame;
- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7;
- (void)setFrameTrackerDidTrackFrame:(id)a3;
@end

@implementation HMIVideoFrameTrackerDelegateAdapter

- (void)frameTracker:(id)a3 didTrackFrame:(opaqueCMSampleBuffer *)a4 background:(opaqueCMSampleBuffer *)a5 motionDetections:(id)a6 tracks:(id)a7
{
  id v16 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = [(HMIVideoFrameTrackerDelegateAdapter *)self frameTrackerDidTrackFrame];

  if (v14)
  {
    v15 = [(HMIVideoFrameTrackerDelegateAdapter *)self frameTrackerDidTrackFrame];
    ((void (**)(void, id, opaqueCMSampleBuffer *, opaqueCMSampleBuffer *, id, id))v15)[2](v15, v16, a4, a5, v12, v13);
  }
}

- (id)frameTrackerDidTrackFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameTrackerDidTrackFrame:(id)a3
{
}

- (void).cxx_destruct
{
}

@end