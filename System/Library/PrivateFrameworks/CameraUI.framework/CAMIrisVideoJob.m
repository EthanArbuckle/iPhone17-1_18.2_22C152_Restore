@interface CAMIrisVideoJob
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime;
- (BOOL)isCTMVideo;
- (CAMIrisVideoJob)initWithCoder:(id)a3;
- (CAMIrisVideoJob)initWithVideoURL:(id)a3 stillImagePersistenceUUID:(id)a4 videoPersistenceUUID:(id)a5 irisIdentifier:(id)a6 captureDevice:(int64_t)a7 captureOrientation:(int64_t)a8 duration:(id *)a9 stillImageDisplayTime:(id *)a10 captureTime:(double)a11 captureError:(id)a12 filterName:(id)a13 filteredVideoURL:(id)a14 persistenceOptions:(int64_t)a15 temporaryPersistenceOptions:(int64_t)a16 bundleIdentifier:(id)a17;
- (NSError)captureError;
- (NSString)bundleIdentifier;
- (NSString)filterName;
- (NSString)irisIdentifier;
- (NSString)stillImagePersistenceUUID;
- (NSString)videoPersistenceUUID;
- (NSURL)filteredVideoURL;
- (NSURL)videoURL;
- (double)captureTime;
- (id)description;
- (int64_t)captureDevice;
- (int64_t)captureOrientation;
- (int64_t)persistenceOptions;
- (int64_t)temporaryPersistenceOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setPersistenceOptions:(int64_t)a3;
- (void)setTemporaryPersistenceOptions:(int64_t)a3;
@end

@implementation CAMIrisVideoJob

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMIrisVideoJob)initWithVideoURL:(id)a3 stillImagePersistenceUUID:(id)a4 videoPersistenceUUID:(id)a5 irisIdentifier:(id)a6 captureDevice:(int64_t)a7 captureOrientation:(int64_t)a8 duration:(id *)a9 stillImageDisplayTime:(id *)a10 captureTime:(double)a11 captureError:(id)a12 filterName:(id)a13 filteredVideoURL:(id)a14 persistenceOptions:(int64_t)a15 temporaryPersistenceOptions:(int64_t)a16 bundleIdentifier:(id)a17
{
  id v42 = a3;
  id obj = a4;
  id v23 = a4;
  id v24 = a5;
  id v38 = a6;
  id v25 = a6;
  id v26 = a12;
  id v27 = a13;
  id v41 = a14;
  id v28 = a17;
  v43.receiver = self;
  v43.super_class = (Class)CAMIrisVideoJob;
  v29 = [(CAMIrisVideoJob *)&v43 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_videoURL, a3);
    objc_storeStrong((id *)&v30->_stillImagePersistenceUUID, obj);
    objc_storeStrong((id *)&v30->_videoPersistenceUUID, a5);
    objc_storeStrong((id *)&v30->_irisIdentifier, v38);
    v30->_captureDevice = a7;
    v30->_captureOrientation = a8;
    long long v31 = *(_OWORD *)&a9->var0;
    v30->_duration.epoch = a9->var3;
    *(_OWORD *)&v30->_duration.value = v31;
    int64_t var3 = a10->var3;
    *(_OWORD *)&v30->_stillImageDisplayTime.value = *(_OWORD *)&a10->var0;
    v30->_stillImageDisplayTime.epoch = var3;
    v30->_captureTime = a11;
    objc_storeStrong((id *)&v30->_captureError, a12);
    objc_storeStrong((id *)&v30->_filterName, a13);
    objc_storeStrong((id *)&v30->_filteredVideoURL, a14);
    v30->_persistenceOptions = a15;
    v30->_temporaryPersistenceOptions = a16;
    uint64_t v33 = [v28 copy];
    bundleIdentifier = v30->_bundleIdentifier;
    v30->_bundleIdentifier = (NSString *)v33;

    v35 = v30;
  }

  return v30;
}

- (CAMIrisVideoJob)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CAMIrisVideoJob;
  v5 = [(CAMIrisVideoJob *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobVideoURL"];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobStillImagePersistenceUUID"];
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobVideoPersistenceUUID"];
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobIrisIdentifier"];
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    *((void *)v5 + 5) = [v4 decodeIntegerForKey:@"CAMIrisVideoJobCaptureDevice"];
    *((void *)v5 + 6) = [v4 decodeIntegerForKey:@"CAMIrisVideoJobCaptureOrientation"];
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobDuration"];
    v15 = v14;
    v16 = v5 + 112;
    if (v14)
    {
      [v14 CMTimeValue];
      _OWORD *v16 = v35;
      uint64_t v17 = v36;
    }
    else
    {
      uint64_t v18 = MEMORY[0x263F01090];
      _OWORD *v16 = *MEMORY[0x263F01090];
      uint64_t v17 = *(void *)(v18 + 16);
    }
    *((void *)v5 + 16) = v17;
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobStillImageDisplayTime"];
    v20 = v19;
    v21 = v5 + 136;
    if (v19)
    {
      [v19 CMTimeValue];
      _OWORD *v21 = v35;
      uint64_t v22 = v36;
    }
    else
    {
      uint64_t v23 = MEMORY[0x263F01090];
      _OWORD *v21 = *MEMORY[0x263F01090];
      uint64_t v22 = *(void *)(v23 + 16);
    }
    *((void *)v5 + 19) = v22;
    [v4 decodeDoubleForKey:@"CAMIrisVideoJobCaptureTime"];
    *((void *)v5 + 7) = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobCaptureError"];
    id v26 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobFilterName"];
    id v28 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobFilteredVideoURL"];
    v30 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v29;

    *((void *)v5 + 11) = [v4 decodeIntegerForKey:@"CAMIrisVideoJobPersistenceOptions"];
    *((void *)v5 + 12) = [v4 decodeIntegerForKey:@"CAMIrisVideoJobTemporaryPersistenceOptions"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMIrisVideoJobBundleIdentifier"];
    v32 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v31;

    uint64_t v33 = v5;
  }

  return (CAMIrisVideoJob *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08D40];
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_duration;
  id v5 = a3;
  uint64_t v6 = [v4 valueWithCMTime:&duration];
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_stillImageDisplayTime;
  v7 = [MEMORY[0x263F08D40] valueWithCMTime:&duration];
  [v5 encodeObject:self->_videoURL forKey:@"CAMIrisVideoJobVideoURL"];
  [v5 encodeObject:self->_stillImagePersistenceUUID forKey:@"CAMIrisVideoJobStillImagePersistenceUUID"];
  [v5 encodeObject:self->_videoPersistenceUUID forKey:@"CAMIrisVideoJobVideoPersistenceUUID"];
  [v5 encodeObject:self->_irisIdentifier forKey:@"CAMIrisVideoJobIrisIdentifier"];
  [v5 encodeInteger:self->_captureDevice forKey:@"CAMIrisVideoJobCaptureDevice"];
  [v5 encodeInteger:self->_captureOrientation forKey:@"CAMIrisVideoJobCaptureOrientation"];
  [v5 encodeObject:v6 forKey:@"CAMIrisVideoJobDuration"];
  [v5 encodeObject:v7 forKey:@"CAMIrisVideoJobStillImageDisplayTime"];
  [v5 encodeDouble:@"CAMIrisVideoJobCaptureTime" forKey:self->_captureTime];
  [v5 encodeObject:self->_captureError forKey:@"CAMIrisVideoJobCaptureError"];
  [v5 encodeObject:self->_filterName forKey:@"CAMIrisVideoJobFilterName"];
  [v5 encodeObject:self->_filteredVideoURL forKey:@"CAMIrisVideoJobFilteredVideoURL"];
  [v5 encodeInteger:self->_persistenceOptions forKey:@"CAMIrisVideoJobPersistenceOptions"];
  [v5 encodeInteger:self->_temporaryPersistenceOptions forKey:@"CAMIrisVideoJobTemporaryPersistenceOptions"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"CAMIrisVideoJobBundleIdentifier"];
}

- (id)description
{
  v3 = [(CAMIrisVideoJob *)self videoURL];
  id v4 = [(CAMIrisVideoJob *)self filterName];
  id v5 = NSString;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMIrisVideoJob;
    uint64_t v6 = [(CAMIrisVideoJob *)&v11 description];
    [v5 stringWithFormat:@"%@: videoURL=%@ (%@)", v6, v3, v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMIrisVideoJob;
    uint64_t v6 = [(CAMIrisVideoJob *)&v10 description];
    [v5 stringWithFormat:@"%@: videoURL=%@", v6, v3, v9];
  v7 = };

  return v7;
}

- (BOOL)isCTMVideo
{
  v3 = [(CAMIrisVideoJob *)self stillImagePersistenceUUID];
  id v4 = [(CAMIrisVideoJob *)self videoPersistenceUUID];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)stillImagePersistenceUUID
{
  return self->_stillImagePersistenceUUID;
}

- (NSString)videoPersistenceUUID
{
  return self->_videoPersistenceUUID;
}

- (NSString)irisIdentifier
{
  return self->_irisIdentifier;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (double)captureTime
{
  return self->_captureTime;
}

- (NSError)captureError
{
  return self->_captureError;
}

- (NSString)filterName
{
  return self->_filterName;
}

- (NSURL)filteredVideoURL
{
  return self->_filteredVideoURL;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (void)setPersistenceOptions:(int64_t)a3
{
  self->_persistenceOptions = a3;
}

- (int64_t)temporaryPersistenceOptions
{
  return self->_temporaryPersistenceOptions;
}

- (void)setTemporaryPersistenceOptions:(int64_t)a3
{
  self->_temporaryPersistenceOptions = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_filteredVideoURL, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_captureError, 0);
  objc_storeStrong((id *)&self->_irisIdentifier, 0);
  objc_storeStrong((id *)&self->_videoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_stillImagePersistenceUUID, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
}

@end