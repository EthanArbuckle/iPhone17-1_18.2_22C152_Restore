@interface FigCaptureSessionMovieFileSinkPipeline
- (BOOL)checkIfFileAlreadyExistForMFO;
- (BOOL)momentCaptureMovieRecordingEnabled;
- (BOOL)recordedWhileMultitasking;
- (BOOL)recording;
- (NSMutableArray)pendingIrisRecordings;
- (void)dealloc;
- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3;
- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3;
- (void)setPendingIrisRecordings:(id)a3;
- (void)setRecordedWhileMultitasking:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
@end

@implementation FigCaptureSessionMovieFileSinkPipeline

- (BOOL)momentCaptureMovieRecordingEnabled
{
  return self->_momentCaptureMovieRecordingEnabled;
}

- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3
{
  self->_checkIfFileAlreadyExistForMFO = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionMovieFileSinkPipeline;
  [(FigCaptureMovieFileSinkPipeline *)&v3 dealloc];
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
  -[FigCaptureMovieFileSinkPipeline setRecordingForAllTailPipelines:]((unint64_t)self, a3);
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3
{
  self->_momentCaptureMovieRecordingEnabled = a3;
}

- (BOOL)recordedWhileMultitasking
{
  return self->_recordedWhileMultitasking;
}

- (void)setRecordedWhileMultitasking:(BOOL)a3
{
  self->_recordedWhileMultitasking = a3;
}

- (NSMutableArray)pendingIrisRecordings
{
  return self->_pendingIrisRecordings;
}

- (void)setPendingIrisRecordings:(id)a3
{
}

- (BOOL)checkIfFileAlreadyExistForMFO
{
  return self->_checkIfFileAlreadyExistForMFO;
}

@end