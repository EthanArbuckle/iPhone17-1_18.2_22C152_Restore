@interface BWFileSinkNode
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration;
- (BWNodeFileWriterStatusDelegate)recordingStatusDelegate;
- (unint64_t)lastFileSize;
- (void)setRecordingStatusDelegate:(id)a3;
@end

@implementation BWFileSinkNode

- (void)setRecordingStatusDelegate:(id)a3
{
  self->_recordingStatusDelegate = (BWNodeFileWriterStatusDelegate *)a3;
}

- (unint64_t)lastFileSize
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (BWNodeFileWriterStatusDelegate)recordingStatusDelegate
{
  return self->_recordingStatusDelegate;
}

@end