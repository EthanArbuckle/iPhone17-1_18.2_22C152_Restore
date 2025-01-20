@interface AVMomentCaptureMovieFileOutputDelegateWrapper
+ (id)wrapperWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5;
- (AVMomentCaptureMovieFileOutputDelegateWrapper)initWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5;
- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings;
- (BOOL)didFinishWritingMovieCallbackFired;
- (BOOL)didFinishWritingSpatialOverCaptureMovieCallbackFired;
- (NSArray)spatialOverCaptureMovieMetadata;
- (NSString)videoCodecType;
- (NSURL)spatialOverCaptureMovieFileURL;
- (void)dealloc;
- (void)setDidFinishWritingMovieCallbackFired:(BOOL)a3;
- (void)setDidFinishWritingSpatialOverCaptureMovieCallbackFired:(BOOL)a3;
- (void)setResolvedSettings:(id)a3;
@end

@implementation AVMomentCaptureMovieFileOutputDelegateWrapper

+ (id)wrapperWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSettings:a3 delegate:a4 connections:a5];

  return v5;
}

- (AVMomentCaptureMovieFileOutputDelegateWrapper)initWithSettings:(id)a3 delegate:(id)a4 connections:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVMomentCaptureMovieFileOutputDelegateWrapper;
  v7 = -[AVCaptureFileOutputDelegateWrapper initWithURL:delegate:settingsID:connections:](&v11, sel_initWithURL_delegate_settingsID_connections_, [a3 movieFileURL], 0, objc_msgSend(a3, "uniqueID"), a5);
  v8 = v7;
  if (v7)
  {
    v9 = [(AVCaptureFileOutputDelegateWrapper *)v7 delegateStorage];
    [(AVWeakReferencingDelegateStorage *)v9 setDelegate:a4 queue:MEMORY[0x1E4F14428]];
    v8->_videoCodecType = (NSString *)(id)[a3 videoCodecType];
    -[AVCaptureFileOutputDelegateWrapper setMetadata:](v8, "setMetadata:", [a3 movieMetadata]);
    if ([a3 isAutoSpatialOverCaptureEnabled])
    {
      v8->_spatialOverCaptureMovieFileURL = (NSURL *)(id)[a3 spatialOverCaptureMovieFileURL];
      v8->_spatialOverCaptureMovieMetadata = (NSArray *)(id)[a3 spatialOverCaptureMovieMetadata];
    }
    if (!v8->_spatialOverCaptureMovieFileURL) {
      v8->_didFinishWritingSpatialOverCaptureMovieCallbackFired = 1;
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieFileOutputDelegateWrapper;
  [(AVCaptureFileOutputDelegateWrapper *)&v3 dealloc];
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (NSURL)spatialOverCaptureMovieFileURL
{
  return self->_spatialOverCaptureMovieFileURL;
}

- (NSArray)spatialOverCaptureMovieMetadata
{
  return self->_spatialOverCaptureMovieMetadata;
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (void)setResolvedSettings:(id)a3
{
}

- (BOOL)didFinishWritingMovieCallbackFired
{
  return self->_didFinishWritingMovieCallbackFired;
}

- (void)setDidFinishWritingMovieCallbackFired:(BOOL)a3
{
  self->_didFinishWritingMovieCallbackFired = a3;
}

- (BOOL)didFinishWritingSpatialOverCaptureMovieCallbackFired
{
  return self->_didFinishWritingSpatialOverCaptureMovieCallbackFired;
}

- (void)setDidFinishWritingSpatialOverCaptureMovieCallbackFired:(BOOL)a3
{
  self->_didFinishWritingSpatialOverCaptureMovieCallbackFired = a3;
}

@end