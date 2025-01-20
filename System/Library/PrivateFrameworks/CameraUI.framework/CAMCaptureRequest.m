@interface CAMCaptureRequest
+ (BOOL)shouldPersistToIncomingDirectoryWithPersistenceOptions:(int64_t)a3 temporaryPersistenceOptions:(int64_t)a4;
- (BOOL)capturedFromPhotoBooth;
- (BOOL)isCaptureMirrored;
- (BOOL)shouldDelayRemotePersistence;
- (BOOL)shouldExtractDiagnosticsFromMetadata;
- (BOOL)shouldPersistDiagnosticsToSidecar;
- (BOOL)shouldPersistToIncomingDirectory;
- (BOOL)shouldProtectPersistence;
- (CAMAnalyticsCaptureEvent)analyticsEvent;
- (CAMCaptureRequest)init;
- (CAMCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5;
- (CAMCaptureRequest)initWithType:(int64_t)a3;
- (CLHeading)heading;
- (CLLocation)location;
- (NSArray)contactIDsInProximity;
- (NSDictionary)sharedLibraryDiagnostics;
- (NSString)persistenceUUID;
- (NSURL)localDestinationURL;
- (id)distinctPersistenceCopy;
- (int64_t)captureDevice;
- (int64_t)captureDevicePosition;
- (int64_t)captureMode;
- (int64_t)captureOrientation;
- (int64_t)origin;
- (int64_t)persistenceOptions;
- (int64_t)photoEncodingBehavior;
- (int64_t)pressType;
- (int64_t)rawFileFormatBehavior;
- (int64_t)sharedLibraryMode;
- (int64_t)temporaryPersistenceOptions;
- (int64_t)type;
- (int64_t)videoEncodingBehavior;
- (unint64_t)audioConfiguration;
- (unint64_t)deferredPersistenceOptions;
- (unsigned)assertionIdentifier;
- (unsigned)sessionIdentifier;
@end

@implementation CAMCaptureRequest

- (CAMCaptureRequest)initWithType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMCaptureRequest;
  v4 = [(CAMCaptureRequest *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_captureDevice = 0;
    v4->_captureMode = 0;
    v4->_captureOrientation = 1;
    v4->_captureMirrored = 0;
    v4->_pressType = -1;
    v4->_origin = 0;
    v4->_deferredPersistenceOptions = 0;
    v4->_temporaryPersistenceOptions = 0;
    v4->_persistenceOptions = 2;
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    persistenceUUID = v5->_persistenceUUID;
    v5->_persistenceUUID = (NSString *)v7;

    *(_WORD *)&v5->_shouldExtractDiagnosticsFromMetadata = 257;
    v5->_shouldDelayRemotePersistence = 0;
    v5->_audioConfiguration = 0;
    v9 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (int64_t)origin
{
  return self->_origin;
}

- (int64_t)videoEncodingBehavior
{
  return self->_videoEncodingBehavior;
}

- (int64_t)photoEncodingBehavior
{
  return self->_photoEncodingBehavior;
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSString)persistenceUUID
{
  return self->_persistenceUUID;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (unint64_t)deferredPersistenceOptions
{
  return self->_deferredPersistenceOptions;
}

- (int64_t)temporaryPersistenceOptions
{
  return self->_temporaryPersistenceOptions;
}

- (BOOL)shouldExtractDiagnosticsFromMetadata
{
  return self->_shouldExtractDiagnosticsFromMetadata;
}

- (BOOL)shouldPersistDiagnosticsToSidecar
{
  return self->_shouldPersistDiagnosticsToSidecar;
}

- (BOOL)shouldDelayRemotePersistence
{
  return self->_shouldDelayRemotePersistence;
}

- (CLLocation)location
{
  return self->_location;
}

- (CLHeading)heading
{
  return self->_heading;
}

- (BOOL)capturedFromPhotoBooth
{
  return self->_capturedFromPhotoBooth;
}

- (unsigned)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (BOOL)shouldPersistToIncomingDirectory
{
  v3 = objc_opt_class();
  int64_t v4 = [(CAMCaptureRequest *)self persistenceOptions];
  int64_t v5 = [(CAMCaptureRequest *)self temporaryPersistenceOptions];
  return [v3 shouldPersistToIncomingDirectoryWithPersistenceOptions:v4 temporaryPersistenceOptions:v5];
}

+ (BOOL)shouldPersistToIncomingDirectoryWithPersistenceOptions:(int64_t)a3 temporaryPersistenceOptions:(int64_t)a4
{
  return (a4 | 2) == 2 && a3 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_persistenceUUID, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
  objc_storeStrong((id *)&self->_heading, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_sharedLibraryDiagnostics, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
}

- (BOOL)shouldProtectPersistence
{
  return [(CAMCaptureRequest *)self persistenceOptions] == 2;
}

- (CAMCaptureRequest)init
{
  return 0;
}

- (CAMCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CAMCaptureRequest;
  v9 = [(CAMCaptureRequest *)&v31 init];
  if (v9)
  {
    v9->_type = [v8 type];
    v9->_captureDevice = [v8 captureDevice];
    v9->_captureMode = [v8 captureMode];
    v9->_captureOrientation = [v8 captureOrientation];
    v9->_captureMirrored = [v8 isCaptureMirrored];
    v9->_pressType = [v8 pressType];
    v9->_origin = [v8 origin];
    v9->_videoEncodingBehavior = [v8 videoEncodingBehavior];
    v9->_photoEncodingBehavior = [v8 photoEncodingBehavior];
    uint64_t v10 = [v8 localDestinationURL];
    localDestinationURL = v9->_localDestinationURL;
    v9->_localDestinationURL = (NSURL *)v10;

    if (a4)
    {
      v12 = [MEMORY[0x263F08C38] UUID];
      uint64_t v13 = [v12 UUIDString];
      persistenceUUID = v9->_persistenceUUID;
      v9->_persistenceUUID = (NSString *)v13;
    }
    else
    {
      uint64_t v15 = [v8 persistenceUUID];
      v12 = v9->_persistenceUUID;
      v9->_persistenceUUID = (NSString *)v15;
    }

    v9->_sessionIdentifier = [v8 sessionIdentifier];
    v9->_persistenceOptions = [v8 persistenceOptions];
    v9->_deferredPersistenceOptions = [v8 deferredPersistenceOptions];
    v9->_temporaryPersistenceOptions = [v8 temporaryPersistenceOptions];
    v9->_shouldExtractDiagnosticsFromMetadata = [v8 shouldExtractDiagnosticsFromMetadata];
    v9->_shouldPersistDiagnosticsToSidecar = [v8 shouldPersistDiagnosticsToSidecar];
    v9->_shouldDelayRemotePersistence = [v8 shouldDelayRemotePersistence];
    uint64_t v16 = [v8 location];
    location = v9->_location;
    v9->_location = (CLLocation *)v16;

    uint64_t v18 = [v8 heading];
    heading = v9->_heading;
    v9->_heading = (CLHeading *)v18;

    v9->_capturedFromPhotoBooth = [v8 capturedFromPhotoBooth];
    v9->_assertionIdentifier = [v8 assertionIdentifier];
    uint64_t v20 = [v8 contactIDsInProximity];
    contactIDsInProximity = v9->_contactIDsInProximity;
    v9->_contactIDsInProximity = (NSArray *)v20;

    v9->_sharedLibraryMode = [v8 sharedLibraryMode];
    uint64_t v22 = [v8 sharedLibraryDiagnostics];
    sharedLibraryDiagnostics = v9->_sharedLibraryDiagnostics;
    v9->_sharedLibraryDiagnostics = (NSDictionary *)v22;

    v9->_audioConfiguration = [v8 audioConfiguration];
    if (v5)
    {
      v24 = [v8 analyticsEvent];

      if (v24)
      {
        v25 = [CAMAnalyticsCaptureEvent alloc];
        v26 = [v8 analyticsEvent];
        uint64_t v27 = [(CAMAnalyticsCaptureEvent *)v25 initWithEvent:v26];
        analyticsEvent = v9->_analyticsEvent;
        v9->_analyticsEvent = (CAMAnalyticsCaptureEvent *)v27;
      }
    }
    v29 = v9;
  }

  return v9;
}

- (int64_t)captureDevicePosition
{
  int64_t v2 = [(CAMCaptureRequest *)self captureDevice];
  if ((unint64_t)(v2 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_209C7AAB0[v2 - 1];
  }
}

- (id)distinctPersistenceCopy
{
  int64_t v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequest:self distinctPersistence:1 includeAnalytics:0];
  return v2;
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (CAMAnalyticsCaptureEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (NSDictionary)sharedLibraryDiagnostics
{
  return self->_sharedLibraryDiagnostics;
}

- (int64_t)rawFileFormatBehavior
{
  return self->_rawFileFormatBehavior;
}

@end