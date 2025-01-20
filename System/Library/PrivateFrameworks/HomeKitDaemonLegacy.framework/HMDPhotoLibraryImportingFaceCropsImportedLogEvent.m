@interface HMDPhotoLibraryImportingFaceCropsImportedLogEvent
- (HMDPhotoLibraryImportingFaceCropsImportedLogEvent)initWithNumberOfImportedFaceCrops:(int64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)numberOfImportedFaceCrops;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDPhotoLibraryImportingFaceCropsImportedLogEvent

- (int64_t)numberOfImportedFaceCrops
{
  return self->_numberOfImportedFaceCrops;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"numberOfImportedFaceCrops";
  v3 = +[HMDLogEventHistograms lowVolumeHistogram];
  v4 = objc_msgSend(v3, "intervalIndexForValue:", -[HMDPhotoLibraryImportingFaceCropsImportedLogEvent numberOfImportedFaceCrops](self, "numberOfImportedFaceCrops"));
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.photoLibraryImporting.faceCropsImported";
}

- (HMDPhotoLibraryImportingFaceCropsImportedLogEvent)initWithNumberOfImportedFaceCrops:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDPhotoLibraryImportingFaceCropsImportedLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_numberOfImportedFaceCrops = a3;
  }
  return result;
}

@end