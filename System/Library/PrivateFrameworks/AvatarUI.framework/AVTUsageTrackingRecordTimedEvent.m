@interface AVTUsageTrackingRecordTimedEvent
- (AVTAvatarRecord)record;
- (AVTUsageTrackingRecordTimedEvent)initWithStartTime:(id)a3 record:(id)a4;
- (BOOL)paused;
- (NSDate)currentStartTime;
- (double)totalElapsedTimeAtTime:(id)a3;
- (double)totalTime;
- (void)pauseAtTime:(id)a3;
- (void)resumeAtTime:(id)a3;
- (void)setCurrentStartTime:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTotalTime:(double)a3;
@end

@implementation AVTUsageTrackingRecordTimedEvent

- (AVTUsageTrackingRecordTimedEvent)initWithStartTime:(id)a3 record:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTUsageTrackingRecordTimedEvent;
  v9 = [(AVTUsageTrackingRecordTimedEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentStartTime, a3);
    objc_storeStrong((id *)&v10->_record, a4);
  }

  return v10;
}

- (void)pauseAtTime:(id)a3
{
  id v8 = a3;
  if (![(AVTUsageTrackingRecordTimedEvent *)self paused])
  {
    [(AVTUsageTrackingRecordTimedEvent *)self setPaused:1];
    v4 = [(AVTUsageTrackingRecordTimedEvent *)self currentStartTime];
    [v8 timeIntervalSinceDate:v4];
    double v6 = v5;

    [(AVTUsageTrackingRecordTimedEvent *)self totalTime];
    [(AVTUsageTrackingRecordTimedEvent *)self setTotalTime:v6 + v7];
  }
}

- (void)resumeAtTime:(id)a3
{
  id v4 = a3;
  if ([(AVTUsageTrackingRecordTimedEvent *)self paused])
  {
    [(AVTUsageTrackingRecordTimedEvent *)self setPaused:0];
    [(AVTUsageTrackingRecordTimedEvent *)self setCurrentStartTime:v4];
  }
}

- (double)totalElapsedTimeAtTime:(id)a3
{
  id v4 = a3;
  if (![(AVTUsageTrackingRecordTimedEvent *)self paused]) {
    [(AVTUsageTrackingRecordTimedEvent *)self pauseAtTime:v4];
  }
  [(AVTUsageTrackingRecordTimedEvent *)self totalTime];
  double v6 = v5;

  return v6;
}

- (AVTAvatarRecord)record
{
  return self->_record;
}

- (NSDate)currentStartTime
{
  return self->_currentStartTime;
}

- (void)setCurrentStartTime:(id)a3
{
}

- (double)totalTime
{
  return self->_totalTime;
}

- (void)setTotalTime:(double)a3
{
  self->_totalTime = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStartTime, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end