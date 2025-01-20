@interface BWLivePhotoMovieAnalyticsPayload
- (BOOL)hasStillImagePTS;
- (BOOL)longPressMovie;
- (BOOL)originalRecording;
- (BOOL)overlappingCapture;
- (BOOL)recordingSucceeded;
- (BWLivePhotoMovieAnalyticsPayload)init;
- (NSDictionary)transitionVitalityFeatures;
- (NSNumber)retimingRecipeIdentifier;
- (NSString)stillCapturePortType;
- (double)averageVideoFrameDurationInMilliseconds;
- (double)fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds;
- (double)fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds;
- (double)fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds;
- (double)fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds;
- (double)maxVideoFrameDurationInMilliseconds;
- (double)medianVideoFrameDurationInMilliseconds;
- (double)minVideoFrameDurationInMilliseconds;
- (double)movieDurationInSeconds;
- (double)stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds;
- (double)stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
- (double)stillTimeOffsetInSeconds;
- (double)stillTimeOffsetToAudioPrerollStartInMilliseconds;
- (double)stillTimeOffsetToAudioPrerollStopInMilliseconds;
- (double)stillTimeOffsetToVideoPrerollStartInMilliseconds;
- (double)stillTimeOffsetToVideoPrerollStopInMilliseconds;
- (double)targetFrameRate;
- (double)transitionVitalityScoreV1;
- (double)videoFrameDurationStandardDeviationInMilliseconds;
- (id)eventDictionary;
- (id)eventName;
- (int)clientIDType;
- (int)errorStatus;
- (int)maxSystemPressureLevel;
- (int)sessionStatus;
- (int)stillCaptureResolutionFlavor;
- (int)stillCaptureType;
- (int64_t)fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples;
- (int64_t)stagingNodeOverallNumberOfVideoFramesReceived;
- (int64_t)stagingNodeValveActiveNumberOfVideoFramesReceived;
- (unsigned)numberOfFramesDropped;
- (unsigned)stillCaptureLuxLevel;
- (void)dealloc;
- (void)reset;
- (void)setAverageVideoFrameDurationInMilliseconds:(double)a3;
- (void)setClientIDType:(int)a3;
- (void)setErrorStatus:(int)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds:(double)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds:(double)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds:(double)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyNumberOfSamples:(int64_t)a3;
- (void)setFileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds:(double)a3;
- (void)setHasStillImagePTS:(BOOL)a3;
- (void)setLongPressMovie:(BOOL)a3;
- (void)setMaxSystemPressureLevel:(int)a3;
- (void)setMaxVideoFrameDurationInMilliseconds:(double)a3;
- (void)setMedianVideoFrameDurationInMilliseconds:(double)a3;
- (void)setMinVideoFrameDurationInMilliseconds:(double)a3;
- (void)setMovieDurationInSeconds:(double)a3;
- (void)setNumberOfFramesDropped:(unsigned int)a3;
- (void)setOriginalRecording:(BOOL)a3;
- (void)setOverlappingCapture:(BOOL)a3;
- (void)setRecordingSucceeded:(BOOL)a3;
- (void)setRetimingRecipeIdentifier:(id)a3;
- (void)setSessionStatus:(int)a3;
- (void)setStagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeOverallNumberOfVideoFramesReceived:(int64_t)a3;
- (void)setStagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStagingNodeValveActiveNumberOfVideoFramesReceived:(int64_t)a3;
- (void)setStagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3;
- (void)setStillCaptureLuxLevel:(unsigned int)a3;
- (void)setStillCapturePortType:(id)a3;
- (void)setStillCaptureResolutionFlavor:(int)a3;
- (void)setStillCaptureType:(int)a3;
- (void)setStillTimeOffsetInSeconds:(double)a3;
- (void)setStillTimeOffsetToAudioPrerollStartInMilliseconds:(double)a3;
- (void)setStillTimeOffsetToAudioPrerollStopInMilliseconds:(double)a3;
- (void)setStillTimeOffsetToVideoPrerollStartInMilliseconds:(double)a3;
- (void)setStillTimeOffsetToVideoPrerollStopInMilliseconds:(double)a3;
- (void)setTargetFrameRate:(double)a3;
- (void)setTransitionVitalityFeatures:(id)a3;
- (void)setTransitionVitalityScoreV1:(double)a3;
- (void)setVideoFrameDurationStandardDeviationInMilliseconds:(double)a3;
@end

@implementation BWLivePhotoMovieAnalyticsPayload

- (BWLivePhotoMovieAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWLivePhotoMovieAnalyticsPayload;
  v2 = [(BWLivePhotoMovieAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWLivePhotoMovieAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLivePhotoMovieAnalyticsPayload;
  [(BWLivePhotoMovieAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_clientIDType = 0;
  self->_recordingSucceeded = 0;
  *(void *)&self->_errorStatus = 0;
  *(int *)((char *)&self->_sessionStatus + 3) = 0;
  *(_OWORD *)&self->_movieDurationInSeconds = 0u;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStartInMilliseconds = 0u;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStartInMilliseconds = 0u;
  self->_overlappingCapture = 0;
  *(_OWORD *)&self->_stagingNodeOverallNumberOfVideoFramesReceived = 0u;
  *(_OWORD *)&self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples = 0u;
  *(_OWORD *)&self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds = 0u;
  self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds = 0.0;
  self->_transitionVitalityScoreV1 = -1.0;

  self->_transitionVitalityFeatures = 0;
  self->_stillCaptureLuxLevel = 0;
  self->_targetFrameRate = 0.0;
  self->_numberOfFramesDropped = 0;
  self->_stillCapturePortType = 0;
  *(void *)&self->_stillCaptureType = 0;
  self->_maxSystemPressureLevel = 0;
  *(_OWORD *)&self->_retimingRecipeIdentifier = 0u;
  *(_OWORD *)&self->_maxVideoFrameDurationInMilliseconds = 0u;
  *(_OWORD *)&self->_medianVideoFrameDurationInMilliseconds = 0u;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.LivePhotoMovie";
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_clientIDType), @"clientIDType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_recordingSucceeded), @"recordingSucceeded");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_errorStatus), @"errorStatus");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_sessionStatus), @"sessionStatus");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_longPressMovie), @"longPressMovie");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_originalRecording), @"originalRecording");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasStillImagePTS), @"hasStillImagePTS");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_movieDurationInSeconds), @"movieDurationInSeconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stillTimeOffsetInSeconds), @"stillTimeOffsetInSeconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stillTimeOffsetToVideoPrerollStartInMilliseconds), @"stillTimeOffsetToVideoPrerollStartInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stillTimeOffsetToVideoPrerollStopInMilliseconds), @"stillTimeOffsetToVideoPrerollStopInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stillTimeOffsetToAudioPrerollStartInMilliseconds), @"stillTimeOffsetToAudioPrerollStartInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stillTimeOffsetToAudioPrerollStopInMilliseconds), @"stillTimeOffsetToAudioPrerollStopInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_overlappingCapture), @"overlappingCapture");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_stagingNodeOverallNumberOfVideoFramesReceived), @"stagingNodeOverallNumberOfVideoFramesReceived");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds), @"stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds), @"stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds), @"stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds), @"stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_stagingNodeValveActiveNumberOfVideoFramesReceived), @"stagingNodeValveActiveNumberOfVideoFramesReceived");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds), @"stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds), @"stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds), @"stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds), @"stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples), @"fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds), @"fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds), @"fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds), @"fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds), @"fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds");
  if (self->_transitionVitalityScoreV1 >= 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"transitionVitalityScoreV1");
  }
  transitionVitalityFeatures = self->_transitionVitalityFeatures;
  if (transitionVitalityFeatures)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](transitionVitalityFeatures, "objectForKeyedSubscript:", @"deltaF"), @"transitionVitalityDeltaF");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_transitionVitalityFeatures, "objectForKeyedSubscript:", @"thetaMax"), @"transitionVitalityThetaMax");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_transitionVitalityFeatures, "objectForKeyedSubscript:", @"motionAnalysisRMS"), @"transitionVitalitySubjectMotionRMS");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_stillCaptureLuxLevel), @"stillCaptureLuxLevel");
  stillCapturePortType = self->_stillCapturePortType;
  if (stillCapturePortType) {
    [v3 setObject:stillCapturePortType forKeyedSubscript:@"stillCapturePortType"];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_stillCaptureType), @"stillCaptureType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_stillCaptureResolutionFlavor), @"stillCaptureResolutionFlavor");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_maxSystemPressureLevel), @"maxSystemPressureLevel");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_targetFrameRate), @"targetFrameRate");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfFramesDropped), @"numberOfFramesDropped");
  retimingRecipeIdentifier = self->_retimingRecipeIdentifier;
  if (retimingRecipeIdentifier) {
    [v3 setObject:retimingRecipeIdentifier forKeyedSubscript:@"retimingRecipeIdentifier"];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_minVideoFrameDurationInMilliseconds), @"videoFrameDurationMinInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_maxVideoFrameDurationInMilliseconds), @"videoFrameDurationMaxInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_averageVideoFrameDurationInMilliseconds), @"videoFrameDurationAverageInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_medianVideoFrameDurationInMilliseconds), @"videoFrameDurationMedianInMilliseconds");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_videoFrameDurationStandardDeviationInMilliseconds), @"videoFrameDurationStandardDeviationInMilliseconds");
  return v3;
}

- (int)clientIDType
{
  return self->_clientIDType;
}

- (void)setClientIDType:(int)a3
{
  self->_clientIDType = a3;
}

- (BOOL)recordingSucceeded
{
  return self->_recordingSucceeded;
}

- (void)setRecordingSucceeded:(BOOL)a3
{
  self->_recordingSucceeded = a3;
}

- (int)errorStatus
{
  return self->_errorStatus;
}

- (void)setErrorStatus:(int)a3
{
  self->_errorStatus = a3;
}

- (int)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(int)a3
{
  self->_sessionStatus = a3;
}

- (BOOL)longPressMovie
{
  return self->_longPressMovie;
}

- (void)setLongPressMovie:(BOOL)a3
{
  self->_longPressMovie = a3;
}

- (BOOL)originalRecording
{
  return self->_originalRecording;
}

- (void)setOriginalRecording:(BOOL)a3
{
  self->_originalRecording = a3;
}

- (BOOL)hasStillImagePTS
{
  return self->_hasStillImagePTS;
}

- (void)setHasStillImagePTS:(BOOL)a3
{
  self->_hasStillImagePTS = a3;
}

- (double)movieDurationInSeconds
{
  return self->_movieDurationInSeconds;
}

- (void)setMovieDurationInSeconds:(double)a3
{
  self->_movieDurationInSeconds = a3;
}

- (double)stillTimeOffsetInSeconds
{
  return self->_stillTimeOffsetInSeconds;
}

- (void)setStillTimeOffsetInSeconds:(double)a3
{
  self->_stillTimeOffsetInSeconds = a3;
}

- (double)stillTimeOffsetToVideoPrerollStartInMilliseconds
{
  return self->_stillTimeOffsetToVideoPrerollStartInMilliseconds;
}

- (void)setStillTimeOffsetToVideoPrerollStartInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToVideoPrerollStartInMilliseconds = a3;
}

- (double)stillTimeOffsetToVideoPrerollStopInMilliseconds
{
  return self->_stillTimeOffsetToVideoPrerollStopInMilliseconds;
}

- (void)setStillTimeOffsetToVideoPrerollStopInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToVideoPrerollStopInMilliseconds = a3;
}

- (double)stillTimeOffsetToAudioPrerollStartInMilliseconds
{
  return self->_stillTimeOffsetToAudioPrerollStartInMilliseconds;
}

- (void)setStillTimeOffsetToAudioPrerollStartInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToAudioPrerollStartInMilliseconds = a3;
}

- (double)stillTimeOffsetToAudioPrerollStopInMilliseconds
{
  return self->_stillTimeOffsetToAudioPrerollStopInMilliseconds;
}

- (void)setStillTimeOffsetToAudioPrerollStopInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToAudioPrerollStopInMilliseconds = a3;
}

- (BOOL)overlappingCapture
{
  return self->_overlappingCapture;
}

- (void)setOverlappingCapture:(BOOL)a3
{
  self->_overlappingCapture = a3;
}

- (int64_t)stagingNodeOverallNumberOfVideoFramesReceived
{
  return self->_stagingNodeOverallNumberOfVideoFramesReceived;
}

- (void)setStagingNodeOverallNumberOfVideoFramesReceived:(int64_t)a3
{
  self->_stagingNodeOverallNumberOfVideoFramesReceived = a3;
}

- (double)stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (int64_t)stagingNodeValveActiveNumberOfVideoFramesReceived
{
  return self->_stagingNodeValveActiveNumberOfVideoFramesReceived;
}

- (void)setStagingNodeValveActiveNumberOfVideoFramesReceived:(int64_t)a3
{
  self->_stagingNodeValveActiveNumberOfVideoFramesReceived = a3;
}

- (double)stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (int64_t)fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyNumberOfSamples:(int64_t)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds = a3;
}

- (double)transitionVitalityScoreV1
{
  return self->_transitionVitalityScoreV1;
}

- (void)setTransitionVitalityScoreV1:(double)a3
{
  self->_transitionVitalityScoreV1 = a3;
}

- (NSDictionary)transitionVitalityFeatures
{
  return self->_transitionVitalityFeatures;
}

- (void)setTransitionVitalityFeatures:(id)a3
{
}

- (unsigned)stillCaptureLuxLevel
{
  return self->_stillCaptureLuxLevel;
}

- (void)setStillCaptureLuxLevel:(unsigned int)a3
{
  self->_stillCaptureLuxLevel = a3;
}

- (int)stillCaptureType
{
  return self->_stillCaptureType;
}

- (void)setStillCaptureType:(int)a3
{
  self->_stillCaptureType = a3;
}

- (NSString)stillCapturePortType
{
  return self->_stillCapturePortType;
}

- (void)setStillCapturePortType:(id)a3
{
}

- (int)stillCaptureResolutionFlavor
{
  return self->_stillCaptureResolutionFlavor;
}

- (void)setStillCaptureResolutionFlavor:(int)a3
{
  self->_stillCaptureResolutionFlavor = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (double)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(double)a3
{
  self->_targetFrameRate = a3;
}

- (unsigned)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unsigned int)a3
{
  self->_numberOfFramesDropped = a3;
}

- (NSNumber)retimingRecipeIdentifier
{
  return self->_retimingRecipeIdentifier;
}

- (void)setRetimingRecipeIdentifier:(id)a3
{
}

- (double)minVideoFrameDurationInMilliseconds
{
  return self->_minVideoFrameDurationInMilliseconds;
}

- (void)setMinVideoFrameDurationInMilliseconds:(double)a3
{
  self->_minVideoFrameDurationInMilliseconds = a3;
}

- (double)maxVideoFrameDurationInMilliseconds
{
  return self->_maxVideoFrameDurationInMilliseconds;
}

- (void)setMaxVideoFrameDurationInMilliseconds:(double)a3
{
  self->_maxVideoFrameDurationInMilliseconds = a3;
}

- (double)averageVideoFrameDurationInMilliseconds
{
  return self->_averageVideoFrameDurationInMilliseconds;
}

- (void)setAverageVideoFrameDurationInMilliseconds:(double)a3
{
  self->_averageVideoFrameDurationInMilliseconds = a3;
}

- (double)medianVideoFrameDurationInMilliseconds
{
  return self->_medianVideoFrameDurationInMilliseconds;
}

- (void)setMedianVideoFrameDurationInMilliseconds:(double)a3
{
  self->_medianVideoFrameDurationInMilliseconds = a3;
}

- (double)videoFrameDurationStandardDeviationInMilliseconds
{
  return self->_videoFrameDurationStandardDeviationInMilliseconds;
}

- (void)setVideoFrameDurationStandardDeviationInMilliseconds:(double)a3
{
  self->_videoFrameDurationStandardDeviationInMilliseconds = a3;
}

@end