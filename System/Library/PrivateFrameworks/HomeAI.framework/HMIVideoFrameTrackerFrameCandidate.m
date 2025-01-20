@interface HMIVideoFrameTrackerFrameCandidate
- (HMIVideoFrameTrackerFrameCandidate)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 score:(float)a4 motionDetections:(id)a5 tracks:(id)a6;
- (NSArray)motionDetections;
- (NSSet)tracks;
- (float)score;
- (id)description;
- (opaqueCMSampleBuffer)sbuf;
- (void)dealloc;
@end

@implementation HMIVideoFrameTrackerFrameCandidate

- (HMIVideoFrameTrackerFrameCandidate)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 score:(float)a4 motionDetections:(id)a5 tracks:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoFrameTrackerFrameCandidate;
  v13 = [(HMIVideoFrameTrackerFrameCandidate *)&v15 init];
  if (v13)
  {
    v13->_sbuf = (opaqueCMSampleBuffer *)CFRetain(a3);
    v13->_score = a4;
    objc_storeStrong((id *)&v13->_motionDetections, a5);
    objc_storeStrong((id *)&v13->_tracks, a6);
  }

  return v13;
}

- (void)dealloc
{
  CFRelease(self->_sbuf);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoFrameTrackerFrameCandidate;
  [(HMIVideoFrameTrackerFrameCandidate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = HMICMSampleBufferTinyDescription([(HMIVideoFrameTrackerFrameCandidate *)self sbuf]);
  [(HMIVideoFrameTrackerFrameCandidate *)self score];
  v6 = [v3 stringWithFormat:@"%@ - %f", v4, v5];

  return v6;
}

- (opaqueCMSampleBuffer)sbuf
{
  return self->_sbuf;
}

- (float)score
{
  return self->_score;
}

- (NSArray)motionDetections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)tracks
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_motionDetections, 0);
}

@end