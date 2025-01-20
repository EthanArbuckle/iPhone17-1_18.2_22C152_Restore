@interface HMDPhotoLibraryImportingPersonsImportedLogEvent
- (HMDPhotoLibraryImportingPersonsImportedLogEvent)initWithTotalNumberOfImportedPersons:(int64_t)a3 numberOfNamedImportedPersons:(int64_t)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)numberOfNamedImportedPersons;
- (int64_t)totalNumberOfImportedPersons;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDPhotoLibraryImportingPersonsImportedLogEvent

- (int64_t)numberOfNamedImportedPersons
{
  return self->_numberOfNamedImportedPersons;
}

- (int64_t)totalNumberOfImportedPersons
{
  return self->_totalNumberOfImportedPersons;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"totalNumberOfImportedPersons";
  v3 = +[HMDLogEventHistograms lowVolumeHistogram];
  v4 = objc_msgSend(v3, "intervalIndexForValue:", -[HMDPhotoLibraryImportingPersonsImportedLogEvent totalNumberOfImportedPersons](self, "totalNumberOfImportedPersons"));
  v9[1] = @"numberOfNamedImportedPersons";
  v10[0] = v4;
  v5 = +[HMDLogEventHistograms lowVolumeHistogram];
  v6 = objc_msgSend(v5, "intervalIndexForValue:", -[HMDPhotoLibraryImportingPersonsImportedLogEvent numberOfNamedImportedPersons](self, "numberOfNamedImportedPersons"));
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.photoLibraryImporting.personsImported";
}

- (HMDPhotoLibraryImportingPersonsImportedLogEvent)initWithTotalNumberOfImportedPersons:(int64_t)a3 numberOfNamedImportedPersons:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDPhotoLibraryImportingPersonsImportedLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_totalNumberOfImportedPersons = a3;
    result->_numberOfNamedImportedPersons = a4;
  }
  return result;
}

@end