@interface FPImportProgressReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isStreamResetRunning;
- (BOOL)latestFolderSelectedForImportIsMonitored;
- (BOOL)latestFolderSelectedForImportWasModifiedOnDisk;
- (BOOL)latestFolderSelectedForImportWasModifiedRemotely;
- (BOOL)xpcActivityIsActive;
- (BOOL)xpcActivityRegisteredWithDuet;
- (FPImportProgressReport)init;
- (FPImportProgressReport)initWithCoder:(id)a3;
- (NSArray)errorDetails;
- (NSArray)itemsPendingReconciliation;
- (NSArray)itemsPendingScanningDisk;
- (NSArray)itemsPendingScanningProvider;
- (NSDictionary)json;
- (int64_t)dbCreationTimestamp;
- (int64_t)latestFolderSelectedForImport;
- (int64_t)latestFolderSelectedForImportState;
- (int64_t)latestFolderSelectedForImportTimestamp;
- (int64_t)numberOfItemsInError;
- (int64_t)numberOfItemsPendingReconciliation;
- (int64_t)numberOfItemsPendingScanningDisk;
- (int64_t)numberOfItemsPendingScanningProvider;
- (int64_t)numberOfItemsPendingSelection;
- (int64_t)numberOfItemsReconciled;
- (int64_t)stateOfDownloadJobs;
- (int64_t)stateOfOtherJobs;
- (int64_t)stateOfUploadJobs;
- (int64_t)status;
- (int64_t)xpcActivityDasdContext;
- (unint64_t)xpcActivityTimeSinceLastAbleToRun;
- (unint64_t)xpcActivityTimeSinceLastActivation;
- (unint64_t)xpcActivityTimeSinceLastRegistration;
- (void)encodeWithCoder:(id)a3;
- (void)setDbCreationTimestamp:(int64_t)a3;
- (void)setErrorDetails:(id)a3;
- (void)setIsStreamResetRunning:(BOOL)a3;
- (void)setItemsPendingReconciliation:(id)a3;
- (void)setItemsPendingScanningDisk:(id)a3;
- (void)setItemsPendingScanningProvider:(id)a3;
- (void)setLatestFolderSelectedForImport:(int64_t)a3;
- (void)setLatestFolderSelectedForImportIsMonitored:(BOOL)a3;
- (void)setLatestFolderSelectedForImportState:(int64_t)a3;
- (void)setLatestFolderSelectedForImportTimestamp:(int64_t)a3;
- (void)setLatestFolderSelectedForImportWasModifiedOnDisk:(BOOL)a3;
- (void)setLatestFolderSelectedForImportWasModifiedRemotely:(BOOL)a3;
- (void)setNumberOfItemsInError:(int64_t)a3;
- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3;
- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3;
- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3;
- (void)setNumberOfItemsPendingSelection:(int64_t)a3;
- (void)setNumberOfItemsReconciled:(int64_t)a3;
- (void)setStateOfDownloadJobs:(int64_t)a3;
- (void)setStateOfOtherJobs:(int64_t)a3;
- (void)setStateOfUploadJobs:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
- (void)setXpcActivityDasdContext:(int64_t)a3;
- (void)setXpcActivityIsActive:(BOOL)a3;
- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3;
- (void)setXpcActivityTimeSinceLastAbleToRun:(unint64_t)a3;
- (void)setXpcActivityTimeSinceLastActivation:(unint64_t)a3;
- (void)setXpcActivityTimeSinceLastRegistration:(unint64_t)a3;
@end

@implementation FPImportProgressReport

- (FPImportProgressReport)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPImportProgressReport;
  result = [(FPImportProgressReport *)&v3 init];
  if (result)
  {
    result->_stateOfOtherJobs = -1;
    result->_xpcActivityTimeSinceLastRegistration = 0;
    result->_xpcActivityTimeSinceLastActivation = 0;
    result->_xpcActivityTimeSinceLastAbleToRun = 0;
    result->_xpcActivityDasdContext = -1;
    result->_latestFolderSelectedForImport = -1;
    result->_latestFolderSelectedForImportTimestamp = -1;
    result->_latestFolderSelectedForImportState = -1;
    *(_DWORD *)&result->_isStreamResetRunning = 0;
    *(_WORD *)&result->_latestFolderSelectedForImportWasModifiedRemotely = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeInteger:self->_status forKey:@"_status"];
  [v9 encodeInteger:self->_numberOfItemsReconciled forKey:@"_numberOfItemsReconciled"];
  [v9 encodeInteger:self->_numberOfItemsInError forKey:@"_numberOfItemsInError"];
  errorDetails = self->_errorDetails;
  if (errorDetails) {
    [v9 encodeObject:errorDetails forKey:@"_errorDetails"];
  }
  [v9 encodeInteger:self->_dbCreationTimestamp forKey:@"_dbCreationTimestamp"];
  [v9 encodeBool:self->_isStreamResetRunning forKey:@"_isStreamResetRunning"];
  [v9 encodeInteger:self->_stateOfDownloadJobs forKey:@"_stateOfDownloadJobs"];
  [v9 encodeInteger:self->_stateOfUploadJobs forKey:@"_stateOfUploadJobs"];
  [v9 encodeInteger:self->_stateOfOtherJobs forKey:@"_stateOfOtherJobs"];
  [v9 encodeInteger:self->_numberOfItemsPendingReconciliation forKey:@"_numberOfItemsPendingReconciliation"];
  [v9 encodeInteger:self->_numberOfItemsPendingSelection forKey:@"_numberOfItemsPendingSelection"];
  [v9 encodeInteger:self->_numberOfItemsPendingScanningDisk forKey:@"_numberOfItemsPendingScanningDisk"];
  [v9 encodeInteger:self->_numberOfItemsPendingScanningProvider forKey:@"_numberOfItemsPendingScanningProvider"];
  [v9 encodeBool:self->_xpcActivityRegisteredWithDuet forKey:@"_xpcActivityRegisteredWithDuet"];
  [v9 encodeInteger:self->_xpcActivityTimeSinceLastRegistration forKey:@"_xpcActivityTimeSinceLastRegistration"];
  [v9 encodeBool:self->_xpcActivityIsActive forKey:@"_xpcActivityIsActive"];
  [v9 encodeInteger:self->_xpcActivityTimeSinceLastActivation forKey:@"_xpcActivityTimeSinceLastActivation"];
  [v9 encodeInteger:self->_xpcActivityTimeSinceLastAbleToRun forKey:@"_xpcActivityTimeSinceLastAbleToRun"];
  [v9 encodeInteger:self->_xpcActivityDasdContext forKey:@"_xpcActivityDasdContext"];
  itemsPendingReconciliation = self->_itemsPendingReconciliation;
  if (itemsPendingReconciliation) {
    [v9 encodeObject:itemsPendingReconciliation forKey:@"_itemsPendingReconciliation"];
  }
  itemsPendingScanningDisk = self->_itemsPendingScanningDisk;
  if (itemsPendingScanningDisk) {
    [v9 encodeObject:itemsPendingScanningDisk forKey:@"_itemsPendingScanningDisk"];
  }
  itemsPendingScanningProvider = self->_itemsPendingScanningProvider;
  v8 = v9;
  if (itemsPendingScanningProvider)
  {
    [v9 encodeObject:itemsPendingScanningProvider forKey:@"_itemsPendingScanningProvider"];
    v8 = v9;
  }
  [v8 encodeInteger:self->_latestFolderSelectedForImport forKey:@"_latestFolderSelectedForImport"];
  [v9 encodeInteger:self->_latestFolderSelectedForImportTimestamp forKey:@"_latestFolderSelectedForImportTimestamp"];
  [v9 encodeInteger:self->_latestFolderSelectedForImportState forKey:@"_latestFolderSelectedForImportState"];
  [v9 encodeBool:self->_latestFolderSelectedForImportWasModifiedOnDisk forKey:@"_latestFolderSelectedForImportWasModifiedOnDisk"];
  [v9 encodeBool:self->_latestFolderSelectedForImportWasModifiedRemotely forKey:@"_latestFolderSelectedForImportWasModifiedRemotely"];
  [v9 encodeBool:self->_latestFolderSelectedForImportIsMonitored forKey:@"_latestFolderSelectedForImportIsMonitored"];
}

- (FPImportProgressReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPImportProgressReport;
  v5 = [(FPImportProgressReport *)&v15 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"_status"];
    v5->_numberOfItemsReconciled = [v4 decodeIntegerForKey:@"_numberOfItemsReconciled"];
    v5->_numberOfItemsInError = [v4 decodeIntegerForKey:@"_numberOfItemsInError"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_errorDetails"];
    errorDetails = v5->_errorDetails;
    v5->_errorDetails = (NSArray *)v6;

    v5->_dbCreationTimestamp = [v4 decodeIntegerForKey:@"_dbCreationTimestamp"];
    v5->_isStreamResetRunning = [v4 decodeBoolForKey:@"_isStreamResetRunning"];
    v5->_stateOfDownloadJobs = [v4 decodeIntegerForKey:@"_stateOfDownloadJobs"];
    v5->_stateOfUploadJobs = [v4 decodeIntegerForKey:@"_stateOfUploadJobs"];
    v5->_stateOfOtherJobs = [v4 decodeIntegerForKey:@"_stateOfOtherJobs"];
    v5->_numberOfItemsPendingReconciliation = [v4 decodeIntegerForKey:@"_numberOfItemsPendingReconciliation"];
    v5->_numberOfItemsPendingSelection = [v4 decodeIntegerForKey:@"_numberOfItemsPendingSelection"];
    v5->_numberOfItemsPendingScanningDisk = [v4 decodeIntegerForKey:@"_numberOfItemsPendingScanningDisk"];
    v5->_numberOfItemsPendingScanningProvider = [v4 decodeIntegerForKey:@"_numberOfItemsPendingScanningProvider"];
    v5->_xpcActivityRegisteredWithDuet = [v4 decodeBoolForKey:@"_xpcActivityRegisteredWithDuet"];
    v5->_xpcActivityTimeSinceLastRegistration = [v4 decodeIntegerForKey:@"_xpcActivityTimeSinceLastRegistration"];
    v5->_xpcActivityIsActive = [v4 decodeBoolForKey:@"_xpcActivityIsActive"];
    v5->_xpcActivityTimeSinceLastActivation = [v4 decodeIntegerForKey:@"_xpcActivityTimeSinceLastActivation"];
    v5->_xpcActivityTimeSinceLastAbleToRun = [v4 decodeIntegerForKey:@"_xpcActivityTimeSinceLastAbleToRun"];
    v5->_xpcActivityDasdContext = [v4 decodeIntegerForKey:@"_xpcActivityDasdContext"];
    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_itemsPendingReconciliation"];
    itemsPendingReconciliation = v5->_itemsPendingReconciliation;
    v5->_itemsPendingReconciliation = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_itemsPendingScanningDisk"];
    itemsPendingScanningDisk = v5->_itemsPendingScanningDisk;
    v5->_itemsPendingScanningDisk = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_itemsPendingScanningProvider"];
    itemsPendingScanningProvider = v5->_itemsPendingScanningProvider;
    v5->_itemsPendingScanningProvider = (NSArray *)v12;

    v5->_latestFolderSelectedForImport = [v4 decodeIntegerForKey:@"_latestFolderSelectedForImport"];
    v5->_latestFolderSelectedForImportTimestamp = [v4 decodeIntegerForKey:@"_latestFolderSelectedForImportTimestamp"];
    v5->_latestFolderSelectedForImportState = [v4 decodeIntegerForKey:@"_latestFolderSelectedForImportState"];
    v5->_latestFolderSelectedForImportWasModifiedOnDisk = [v4 decodeBoolForKey:@"_latestFolderSelectedForImportWasModifiedOnDisk"];
    v5->_latestFolderSelectedForImportWasModifiedRemotely = [v4 decodeBoolForKey:@"_latestFolderSelectedForImportWasModifiedRemotely"];
    v5->_latestFolderSelectedForImportIsMonitored = [v4 decodeBoolForKey:@"_latestFolderSelectedForImportIsMonitored"];
  }

  return v5;
}

- (NSDictionary)json
{
  objc_super v3 = objc_opt_new();
  id v4 = v3;
  unint64_t status = self->_status;
  if (status <= 2) {
    [v3 setObject:off_1E5AF3BB0[status] forKeyedSubscript:@"status"];
  }
  uint64_t v6 = [NSNumber numberWithInteger:self->_numberOfItemsReconciled];
  [v4 setObject:v6 forKeyedSubscript:@"numberOfItemsReconciled"];

  v7 = [NSNumber numberWithInteger:self->_numberOfItemsInError];
  [v4 setObject:v7 forKeyedSubscript:@"numberOfItemsInError"];

  errorDetails = self->_errorDetails;
  if (errorDetails)
  {
    id v9 = [(NSArray *)errorDetails fp_map:&__block_literal_global_28];
    [v4 setObject:v9 forKeyedSubscript:@"errorDetails"];
  }
  uint64_t v10 = [NSNumber numberWithInteger:self->_dbCreationTimestamp];
  [v4 setObject:v10 forKeyedSubscript:@"dbCreationTimestamp"];

  v11 = [NSNumber numberWithBool:self->_isStreamResetRunning];
  [v4 setObject:v11 forKeyedSubscript:@"isStreamResetRunning"];

  uint64_t v12 = [NSNumber numberWithInteger:self->_stateOfDownloadJobs];
  [v4 setObject:v12 forKeyedSubscript:@"stateOfDownloadJobs"];

  v13 = [NSNumber numberWithInteger:self->_stateOfUploadJobs];
  [v4 setObject:v13 forKeyedSubscript:@"stateOfUploadJobs"];

  v14 = [NSNumber numberWithInteger:self->_stateOfOtherJobs];
  [v4 setObject:v14 forKeyedSubscript:@"stateOfOtherJobs"];

  objc_super v15 = [NSNumber numberWithInteger:self->_numberOfItemsPendingReconciliation];
  [v4 setObject:v15 forKeyedSubscript:@"numberOfItemsPendingReconciliation"];

  v16 = [NSNumber numberWithInteger:self->_numberOfItemsPendingSelection];
  [v4 setObject:v16 forKeyedSubscript:@"numberOfItemsPendingSelection"];

  v17 = [NSNumber numberWithInteger:self->_numberOfItemsPendingScanningDisk];
  [v4 setObject:v17 forKeyedSubscript:@"numberOfItemsPendingScanningDisk"];

  v18 = [NSNumber numberWithInteger:self->_numberOfItemsPendingScanningProvider];
  [v4 setObject:v18 forKeyedSubscript:@"numberOfItemsPendingScanningProvider"];

  v19 = [NSNumber numberWithBool:self->_xpcActivityRegisteredWithDuet];
  [v4 setObject:v19 forKeyedSubscript:@"xpcActivityRegisteredWithDuet"];

  v20 = [NSNumber numberWithUnsignedInteger:self->_xpcActivityTimeSinceLastRegistration];
  [v4 setObject:v20 forKeyedSubscript:@"xpcActivityTimeSinceLastRegistration"];

  v21 = [NSNumber numberWithBool:self->_xpcActivityIsActive];
  [v4 setObject:v21 forKeyedSubscript:@"xpcActivityIsActive"];

  v22 = [NSNumber numberWithUnsignedInteger:self->_xpcActivityTimeSinceLastActivation];
  [v4 setObject:v22 forKeyedSubscript:@"xpcActivityTimeSinceLastActivation"];

  v23 = [NSNumber numberWithUnsignedInteger:self->_xpcActivityTimeSinceLastAbleToRun];
  [v4 setObject:v23 forKeyedSubscript:@"xpcActivityTimeSinceLastAbleToRun"];

  v24 = [NSNumber numberWithInteger:self->_xpcActivityDasdContext];
  [v4 setObject:v24 forKeyedSubscript:@"xpcActivityDasdContext"];

  itemsPendingReconciliation = self->_itemsPendingReconciliation;
  if (itemsPendingReconciliation)
  {
    v26 = [(NSArray *)itemsPendingReconciliation fp_map:&__block_literal_global_499];
    [v4 setObject:v26 forKeyedSubscript:@"itemsPendingReconciliation"];
  }
  itemsPendingScanningDisk = self->_itemsPendingScanningDisk;
  if (itemsPendingScanningDisk)
  {
    v28 = [(NSArray *)itemsPendingScanningDisk fp_map:&__block_literal_global_505];
    [v4 setObject:v28 forKeyedSubscript:@"itemsPendingScanningDisk"];
  }
  itemsPendingScanningProvider = self->_itemsPendingScanningProvider;
  if (itemsPendingScanningProvider)
  {
    v30 = [(NSArray *)itemsPendingScanningProvider fp_map:&__block_literal_global_511];
    [v4 setObject:v30 forKeyedSubscript:@"itemsPendingScanningProvider"];
  }
  v31 = [NSNumber numberWithInteger:self->_latestFolderSelectedForImport];
  [v4 setObject:v31 forKeyedSubscript:@"latestFolderSelectedForImport"];

  v32 = [NSNumber numberWithInteger:self->_latestFolderSelectedForImportTimestamp];
  [v4 setObject:v32 forKeyedSubscript:@"latestFolderSelectedForImportTimestamp"];

  v33 = [NSNumber numberWithInteger:self->_latestFolderSelectedForImportState];
  [v4 setObject:v33 forKeyedSubscript:@"latestFolderSelectedForImportState"];

  v34 = [NSNumber numberWithBool:self->_latestFolderSelectedForImportWasModifiedOnDisk];
  [v4 setObject:v34 forKeyedSubscript:@"latestFolderSelectedForImportWasModifiedOnDisk"];

  v35 = [NSNumber numberWithBool:self->_latestFolderSelectedForImportWasModifiedRemotely];
  [v4 setObject:v35 forKeyedSubscript:@"latestFolderSelectedForImportWasModifiedRemotely"];

  v36 = [NSNumber numberWithBool:self->_latestFolderSelectedForImportIsMonitored];
  [v4 setObject:v36 forKeyedSubscript:@"latestFolderSelectedForImportIsMonitored"];

  return (NSDictionary *)v4;
}

uint64_t __30__FPImportProgressReport_json__block_invoke(uint64_t a1, void *a2)
{
  return [a2 json];
}

uint64_t __30__FPImportProgressReport_json__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 json];
}

uint64_t __30__FPImportProgressReport_json__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 json];
}

uint64_t __30__FPImportProgressReport_json__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 json];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_unint64_t status = a3;
}

- (int64_t)numberOfItemsReconciled
{
  return self->_numberOfItemsReconciled;
}

- (void)setNumberOfItemsReconciled:(int64_t)a3
{
  self->_numberOfItemsReconciled = a3;
}

- (int64_t)numberOfItemsInError
{
  return self->_numberOfItemsInError;
}

- (void)setNumberOfItemsInError:(int64_t)a3
{
  self->_numberOfItemsInError = a3;
}

- (NSArray)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
}

- (int64_t)dbCreationTimestamp
{
  return self->_dbCreationTimestamp;
}

- (void)setDbCreationTimestamp:(int64_t)a3
{
  self->_dbCreationTimestamp = a3;
}

- (BOOL)isStreamResetRunning
{
  return self->_isStreamResetRunning;
}

- (void)setIsStreamResetRunning:(BOOL)a3
{
  self->_isStreamResetRunning = a3;
}

- (int64_t)stateOfDownloadJobs
{
  return self->_stateOfDownloadJobs;
}

- (void)setStateOfDownloadJobs:(int64_t)a3
{
  self->_stateOfDownloadJobs = a3;
}

- (int64_t)stateOfUploadJobs
{
  return self->_stateOfUploadJobs;
}

- (void)setStateOfUploadJobs:(int64_t)a3
{
  self->_stateOfUploadJobs = a3;
}

- (int64_t)stateOfOtherJobs
{
  return self->_stateOfOtherJobs;
}

- (void)setStateOfOtherJobs:(int64_t)a3
{
  self->_stateOfOtherJobs = a3;
}

- (int64_t)numberOfItemsPendingReconciliation
{
  return self->_numberOfItemsPendingReconciliation;
}

- (void)setNumberOfItemsPendingReconciliation:(int64_t)a3
{
  self->_numberOfItemsPendingReconciliation = a3;
}

- (int64_t)numberOfItemsPendingSelection
{
  return self->_numberOfItemsPendingSelection;
}

- (void)setNumberOfItemsPendingSelection:(int64_t)a3
{
  self->_numberOfItemsPendingSelection = a3;
}

- (int64_t)numberOfItemsPendingScanningDisk
{
  return self->_numberOfItemsPendingScanningDisk;
}

- (void)setNumberOfItemsPendingScanningDisk:(int64_t)a3
{
  self->_numberOfItemsPendingScanningDisk = a3;
}

- (int64_t)numberOfItemsPendingScanningProvider
{
  return self->_numberOfItemsPendingScanningProvider;
}

- (void)setNumberOfItemsPendingScanningProvider:(int64_t)a3
{
  self->_numberOfItemsPendingScanningProvider = a3;
}

- (BOOL)xpcActivityRegisteredWithDuet
{
  return self->_xpcActivityRegisteredWithDuet;
}

- (void)setXpcActivityRegisteredWithDuet:(BOOL)a3
{
  self->_xpcActivityRegisteredWithDuet = a3;
}

- (unint64_t)xpcActivityTimeSinceLastRegistration
{
  return self->_xpcActivityTimeSinceLastRegistration;
}

- (void)setXpcActivityTimeSinceLastRegistration:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastRegistration = a3;
}

- (BOOL)xpcActivityIsActive
{
  return self->_xpcActivityIsActive;
}

- (void)setXpcActivityIsActive:(BOOL)a3
{
  self->_xpcActivityIsActive = a3;
}

- (unint64_t)xpcActivityTimeSinceLastActivation
{
  return self->_xpcActivityTimeSinceLastActivation;
}

- (void)setXpcActivityTimeSinceLastActivation:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastActivation = a3;
}

- (unint64_t)xpcActivityTimeSinceLastAbleToRun
{
  return self->_xpcActivityTimeSinceLastAbleToRun;
}

- (void)setXpcActivityTimeSinceLastAbleToRun:(unint64_t)a3
{
  self->_xpcActivityTimeSinceLastAbleToRun = a3;
}

- (int64_t)xpcActivityDasdContext
{
  return self->_xpcActivityDasdContext;
}

- (void)setXpcActivityDasdContext:(int64_t)a3
{
  self->_xpcActivityDasdContext = a3;
}

- (NSArray)itemsPendingReconciliation
{
  return self->_itemsPendingReconciliation;
}

- (void)setItemsPendingReconciliation:(id)a3
{
}

- (NSArray)itemsPendingScanningDisk
{
  return self->_itemsPendingScanningDisk;
}

- (void)setItemsPendingScanningDisk:(id)a3
{
}

- (NSArray)itemsPendingScanningProvider
{
  return self->_itemsPendingScanningProvider;
}

- (void)setItemsPendingScanningProvider:(id)a3
{
}

- (int64_t)latestFolderSelectedForImport
{
  return self->_latestFolderSelectedForImport;
}

- (void)setLatestFolderSelectedForImport:(int64_t)a3
{
  self->_latestFolderSelectedForImport = a3;
}

- (int64_t)latestFolderSelectedForImportTimestamp
{
  return self->_latestFolderSelectedForImportTimestamp;
}

- (void)setLatestFolderSelectedForImportTimestamp:(int64_t)a3
{
  self->_latestFolderSelectedForImportTimestamp = a3;
}

- (int64_t)latestFolderSelectedForImportState
{
  return self->_latestFolderSelectedForImportState;
}

- (void)setLatestFolderSelectedForImportState:(int64_t)a3
{
  self->_latestFolderSelectedForImportState = a3;
}

- (BOOL)latestFolderSelectedForImportWasModifiedOnDisk
{
  return self->_latestFolderSelectedForImportWasModifiedOnDisk;
}

- (void)setLatestFolderSelectedForImportWasModifiedOnDisk:(BOOL)a3
{
  self->_latestFolderSelectedForImportWasModifiedOnDisk = a3;
}

- (BOOL)latestFolderSelectedForImportWasModifiedRemotely
{
  return self->_latestFolderSelectedForImportWasModifiedRemotely;
}

- (void)setLatestFolderSelectedForImportWasModifiedRemotely:(BOOL)a3
{
  self->_latestFolderSelectedForImportWasModifiedRemotely = a3;
}

- (BOOL)latestFolderSelectedForImportIsMonitored
{
  return self->_latestFolderSelectedForImportIsMonitored;
}

- (void)setLatestFolderSelectedForImportIsMonitored:(BOOL)a3
{
  self->_latestFolderSelectedForImportIsMonitored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsPendingScanningProvider, 0);
  objc_storeStrong((id *)&self->_itemsPendingScanningDisk, 0);
  objc_storeStrong((id *)&self->_itemsPendingReconciliation, 0);

  objc_storeStrong((id *)&self->_errorDetails, 0);
}

@end