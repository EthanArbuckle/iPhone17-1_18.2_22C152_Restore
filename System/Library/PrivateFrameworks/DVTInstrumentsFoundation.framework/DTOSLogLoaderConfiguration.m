@interface DTOSLogLoaderConfiguration
- (BOOL)enableBacktraceReplacement;
- (BOOL)trackPidToExecNameMapping;
- (DTOSLogLoaderConfiguration)initWithFilterPredicate:(id)a3 signpostConfig:(unint64_t)a4 loaderExclusions:(unint64_t)a5 columnInclusions:(unint64_t)a6 mode:(unint64_t)a7 enableBacktraceReplacement:(BOOL)a8 machTimebase:(mach_timebase_info)a9 machContinuousStart:(unint64_t)a10 importedFileURL:(id)a11 importForcedStartDate:(id)a12 importForcedEndDate:(id)a13 trackPidToExecNameMapping:(BOOL)a14 dynamicTracingEnabledSubsystems:(id)a15 logSubsystemCategoryPairsToEnable:(id)a16 signpostSubsystemCategoryPairsToEnable:(id)a17;
- (NSArray)dynamicTracingEnabledSubsystems;
- (NSDate)importForcedEndDate;
- (NSDate)importForcedStartDate;
- (NSDictionary)logSubsystemCategoryPairsToEnable;
- (NSDictionary)signpostSubsystemCategoryPairsToEnable;
- (NSPredicate)filterPredicate;
- (NSURL)importedFileURL;
- (mach_timebase_info)machTimebase;
- (unint64_t)columnInclusions;
- (unint64_t)loaderExclusions;
- (unint64_t)machContinuousStart;
- (unint64_t)mode;
- (unint64_t)signpostConfig;
- (void)setFilterPredicate:(id)a3;
@end

@implementation DTOSLogLoaderConfiguration

- (DTOSLogLoaderConfiguration)initWithFilterPredicate:(id)a3 signpostConfig:(unint64_t)a4 loaderExclusions:(unint64_t)a5 columnInclusions:(unint64_t)a6 mode:(unint64_t)a7 enableBacktraceReplacement:(BOOL)a8 machTimebase:(mach_timebase_info)a9 machContinuousStart:(unint64_t)a10 importedFileURL:(id)a11 importForcedStartDate:(id)a12 importForcedEndDate:(id)a13 trackPidToExecNameMapping:(BOOL)a14 dynamicTracingEnabledSubsystems:(id)a15 logSubsystemCategoryPairsToEnable:(id)a16 signpostSubsystemCategoryPairsToEnable:(id)a17
{
  id v19 = a3;
  id v33 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a15;
  id v32 = a16;
  id v31 = a17;
  v34.receiver = self;
  v34.super_class = (Class)DTOSLogLoaderConfiguration;
  v23 = [(DTOSLogLoaderConfiguration *)&v34 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_filterPredicate, a3);
    v24->_signpostConfig = a4;
    v24->_loaderExclusions = a5;
    v24->_columnInclusions = a6;
    v24->_mode = a7;
    v24->_enableBacktraceReplacement = a8;
    v24->_machTimebase = a9;
    v24->_machContinuousStart = a10;
    objc_storeStrong((id *)&v24->_importedFileURL, a11);
    objc_storeStrong((id *)&v24->_importForcedStartDate, a12);
    objc_storeStrong((id *)&v24->_importForcedEndDate, a13);
    v24->_trackPidToExecNameMapping = a14;
    objc_storeStrong((id *)&v24->_dynamicTracingEnabledSubsystems, a15);
    objc_storeStrong((id *)&v24->_logSubsystemCategoryPairsToEnable, a16);
    objc_storeStrong((id *)&v24->_signpostSubsystemCategoryPairsToEnable, a17);
  }

  return v24;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
}

- (unint64_t)signpostConfig
{
  return self->_signpostConfig;
}

- (unint64_t)loaderExclusions
{
  return self->_loaderExclusions;
}

- (unint64_t)columnInclusions
{
  return self->_columnInclusions;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)enableBacktraceReplacement
{
  return self->_enableBacktraceReplacement;
}

- (mach_timebase_info)machTimebase
{
  return self->_machTimebase;
}

- (unint64_t)machContinuousStart
{
  return self->_machContinuousStart;
}

- (NSURL)importedFileURL
{
  return self->_importedFileURL;
}

- (NSDate)importForcedStartDate
{
  return self->_importForcedStartDate;
}

- (NSDate)importForcedEndDate
{
  return self->_importForcedEndDate;
}

- (BOOL)trackPidToExecNameMapping
{
  return self->_trackPidToExecNameMapping;
}

- (NSArray)dynamicTracingEnabledSubsystems
{
  return self->_dynamicTracingEnabledSubsystems;
}

- (NSDictionary)logSubsystemCategoryPairsToEnable
{
  return self->_logSubsystemCategoryPairsToEnable;
}

- (NSDictionary)signpostSubsystemCategoryPairsToEnable
{
  return self->_signpostSubsystemCategoryPairsToEnable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostSubsystemCategoryPairsToEnable, 0);
  objc_storeStrong((id *)&self->_logSubsystemCategoryPairsToEnable, 0);
  objc_storeStrong((id *)&self->_dynamicTracingEnabledSubsystems, 0);
  objc_storeStrong((id *)&self->_importForcedEndDate, 0);
  objc_storeStrong((id *)&self->_importForcedStartDate, 0);
  objc_storeStrong((id *)&self->_importedFileURL, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end