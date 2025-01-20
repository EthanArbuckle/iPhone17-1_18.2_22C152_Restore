@interface AVCaptureFileOutputDelegateWrapper
+ (id)wrapperWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6;
- (AVCaptureFileOutputDelegateWrapper)initWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6;
- (AVWeakReferencingDelegateStorage)delegateStorage;
- (BOOL)isPaused;
- (BOOL)isRecording;
- (BOOL)isTrueVideoCaptureEnabled;
- (NSArray)connections;
- (NSArray)metadata;
- (NSString)outputFileType;
- (NSURL)outputFileURL;
- (OpaqueFigCaptureSession)pendingDidStopRecordingUnregistrationCaptureSession;
- (int64_t)settingsID;
- (void)dealloc;
- (void)setMetadata:(id)a3;
- (void)setOutputFileType:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPendingDidStopRecordingUnregistrationCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setRecording:(BOOL)a3;
- (void)setTrueVideoCaptureEnabled:(BOOL)a3;
@end

@implementation AVCaptureFileOutputDelegateWrapper

+ (id)wrapperWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:a3 delegate:a4 settingsID:a5 connections:a6];

  return v6;
}

- (AVCaptureFileOutputDelegateWrapper)initWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureFileOutputDelegateWrapper;
  v10 = [(AVCaptureFileOutputDelegateWrapper *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_settingsID = a5;
    v10->_outputFileURL = (NSURL *)[a3 copy];
    v11->_connections = (NSArray *)a6;
    v12 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
    v11->_delegateStorage = v12;
    if (a4) {
      [(AVWeakReferencingDelegateStorage *)v12 setDelegate:a4 queue:MEMORY[0x1E4F14428]];
    }
  }
  return v11;
}

- (void)dealloc
{
  pendingDidStopRecordingUnregistrationCaptureSession = self->_pendingDidStopRecordingUnregistrationCaptureSession;
  if (pendingDidStopRecordingUnregistrationCaptureSession) {
    CFRelease(pendingDidStopRecordingUnregistrationCaptureSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFileOutputDelegateWrapper;
  [(AVCaptureFileOutputDelegateWrapper *)&v4 dealloc];
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (NSString)outputFileType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutputFileType:(id)a3
{
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (NSArray)connections
{
  return self->_connections;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (OpaqueFigCaptureSession)pendingDidStopRecordingUnregistrationCaptureSession
{
  return self->_pendingDidStopRecordingUnregistrationCaptureSession;
}

- (void)setPendingDidStopRecordingUnregistrationCaptureSession:(OpaqueFigCaptureSession *)a3
{
}

- (BOOL)isTrueVideoCaptureEnabled
{
  return self->_trueVideoCaptureEnabled;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  self->_trueVideoCaptureEnabled = a3;
}

@end