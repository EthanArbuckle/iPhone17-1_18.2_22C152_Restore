@interface DSSnapshotRequestTelemetryReporter
+ (id)telemetryReporterForSnapshotRequest:(id)a3;
- (BOOL)snapshotPowerAssertionsDidTimeOut;
- (DSSnapshotRequest)__snapshotRequest;
- (NSDate)snapshotDateEnd;
- (NSString)__eventName;
- (double)snapshotMetadataAPFSSnapshotInfoDurationSec;
- (double)snapshotMetadataAPFSVolumeInfoDurationSec;
- (double)snapshotMetadataATCDurationSec;
- (double)snapshotMetadataCacheDeleteDurationSec;
- (double)snapshotMetadataIndirectionTableStatsDurationSec;
- (double)snapshotMetadataUnlinkedOpenFilesDurationSec;
- (double)snapshotMetadataVolumeInfoDurationSec;
- (id)_eventDictionary;
- (int64_t)snapshotExitCode;
- (unint64_t)snapshotArchiveSizeBytes;
- (unint64_t)snapshotFSListingsEntryCount;
- (unint64_t)snapshotVolumeCount;
- (void)setSnapshotArchiveSizeBytes:(unint64_t)a3;
- (void)setSnapshotDateEnd:(id)a3;
- (void)setSnapshotExitCode:(int64_t)a3;
- (void)setSnapshotFSListingsEntryCount:(unint64_t)a3;
- (void)setSnapshotMetadataAPFSSnapshotInfoDurationSec:(double)a3;
- (void)setSnapshotMetadataAPFSVolumeInfoDurationSec:(double)a3;
- (void)setSnapshotMetadataATCDurationSec:(double)a3;
- (void)setSnapshotMetadataCacheDeleteDurationSec:(double)a3;
- (void)setSnapshotMetadataIndirectionTableStatsDurationSec:(double)a3;
- (void)setSnapshotMetadataUnlinkedOpenFilesDurationSec:(double)a3;
- (void)setSnapshotMetadataVolumeInfoDurationSec:(double)a3;
- (void)setSnapshotPowerAssertionsDidTimeOut:(BOOL)a3;
- (void)setSnapshotVolumeCount:(unint64_t)a3;
- (void)set__snapshotRequest:(id)a3;
- (void)submit;
@end

@implementation DSSnapshotRequestTelemetryReporter

- (NSString)__eventName
{
  return (NSString *)@"com.apple.diskspacediagnostics.fsmetasnapshot.v1_1";
}

- (id)_eventDictionary
{
  v29[0] = @"1008";
  v28[0] = @"DiskSpaceDiagnosticsVersion";
  v28[1] = @"DurationSec";
  snapshotDateEnd = self->_snapshotDateEnd;
  p_snapshotRequest = &self->___snapshotRequest;
  id WeakRetained = objc_loadWeakRetained((id *)&self->___snapshotRequest);
  v26 = [WeakRetained beginDate];
  [(NSDate *)snapshotDateEnd timeIntervalSinceDate:v26];
  v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v29[1] = v25;
  v28[2] = @"ExitCode";
  v24 = +[NSNumber numberWithInteger:self->_snapshotExitCode];
  v29[2] = v24;
  v28[3] = @"FormatVersion";
  id v23 = objc_loadWeakRetained((id *)p_snapshotRequest);
  v22 = [v23 formatVersion];
  v29[3] = v22;
  v28[4] = @"VolumeCount";
  v21 = +[NSNumber numberWithUnsignedLongLong:self->_snapshotVolumeCount];
  v29[4] = v21;
  v28[5] = @"FSListingsEntriesCount";
  v20 = +[NSNumber numberWithUnsignedLongLong:self->_snapshotFSListingsEntryCount];
  v29[5] = v20;
  v28[6] = @"HasHashedFSListings";
  id v19 = objc_loadWeakRetained((id *)p_snapshotRequest);
  v18 = [v19 options];
  v17 = [v18 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionShouldHashVolumeListings"];
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v17 BOOLValue]);
  v29[6] = v16;
  v28[7] = @"PowerAssertionsDidTimeout";
  v15 = +[NSNumber numberWithBool:self->_snapshotPowerAssertionsDidTimeOut];
  v29[7] = v15;
  v28[8] = @"ArchiveSizeBytes";
  v5 = +[NSNumber numberWithUnsignedLongLong:self->_snapshotArchiveSizeBytes];
  v29[8] = v5;
  v28[9] = @"MetadataIndTableStatsDurationSec";
  v6 = +[NSNumber numberWithDouble:self->_snapshotMetadataIndirectionTableStatsDurationSec];
  v29[9] = v6;
  v28[10] = @"MetadataAPFSSnapshotInfoDurationSec";
  v7 = +[NSNumber numberWithDouble:self->_snapshotMetadataAPFSSnapshotInfoDurationSec];
  v29[10] = v7;
  v28[11] = @"MetadataAPFSVolumeInfoDurationSec";
  v8 = +[NSNumber numberWithDouble:self->_snapshotMetadataAPFSVolumeInfoDurationSec];
  v29[11] = v8;
  v28[12] = @"MetadataVolumeInfoDurationSec";
  v9 = +[NSNumber numberWithDouble:self->_snapshotMetadataVolumeInfoDurationSec];
  v29[12] = v9;
  v28[13] = @"MetadataUnlinkedOpenFilesDurationSec";
  v10 = +[NSNumber numberWithDouble:self->_snapshotMetadataUnlinkedOpenFilesDurationSec];
  v29[13] = v10;
  v28[14] = @"MetadataCacheDeleteDurationSec";
  v11 = +[NSNumber numberWithDouble:self->_snapshotMetadataCacheDeleteDurationSec];
  v29[14] = v11;
  v28[15] = @"MetadataATCDurationSec";
  v12 = +[NSNumber numberWithDouble:self->_snapshotMetadataATCDurationSec];
  v29[15] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:16];

  return v13;
}

+ (id)telemetryReporterForSnapshotRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(DSSnapshotRequestTelemetryReporter);
  [(DSSnapshotRequestTelemetryReporter *)v4 set__snapshotRequest:v3];

  return v4;
}

- (void)submit
{
  id v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(DSSnapshotRequestTelemetryReporter *)self __eventName];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Submitting %@ to CoreAnalytics", buf, 0xCu);
  }
  v5 = [(DSSnapshotRequestTelemetryReporter *)self __eventName];
  AnalyticsSendEventLazy();
}

- (NSDate)snapshotDateEnd
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSnapshotDateEnd:(id)a3
{
}

- (int64_t)snapshotExitCode
{
  return self->_snapshotExitCode;
}

- (void)setSnapshotExitCode:(int64_t)a3
{
  self->_snapshotExitCode = a3;
}

- (unint64_t)snapshotVolumeCount
{
  return self->_snapshotVolumeCount;
}

- (void)setSnapshotVolumeCount:(unint64_t)a3
{
  self->_snapshotVolumeCount = a3;
}

- (unint64_t)snapshotFSListingsEntryCount
{
  return self->_snapshotFSListingsEntryCount;
}

- (void)setSnapshotFSListingsEntryCount:(unint64_t)a3
{
  self->_snapshotFSListingsEntryCount = a3;
}

- (BOOL)snapshotPowerAssertionsDidTimeOut
{
  return self->_snapshotPowerAssertionsDidTimeOut;
}

- (void)setSnapshotPowerAssertionsDidTimeOut:(BOOL)a3
{
  self->_snapshotPowerAssertionsDidTimeOut = a3;
}

- (unint64_t)snapshotArchiveSizeBytes
{
  return self->_snapshotArchiveSizeBytes;
}

- (void)setSnapshotArchiveSizeBytes:(unint64_t)a3
{
  self->_snapshotArchiveSizeBytes = a3;
}

- (double)snapshotMetadataIndirectionTableStatsDurationSec
{
  return self->_snapshotMetadataIndirectionTableStatsDurationSec;
}

- (void)setSnapshotMetadataIndirectionTableStatsDurationSec:(double)a3
{
  self->_snapshotMetadataIndirectionTableStatsDurationSec = a3;
}

- (double)snapshotMetadataAPFSSnapshotInfoDurationSec
{
  return self->_snapshotMetadataAPFSSnapshotInfoDurationSec;
}

- (void)setSnapshotMetadataAPFSSnapshotInfoDurationSec:(double)a3
{
  self->_snapshotMetadataAPFSSnapshotInfoDurationSec = a3;
}

- (double)snapshotMetadataAPFSVolumeInfoDurationSec
{
  return self->_snapshotMetadataAPFSVolumeInfoDurationSec;
}

- (void)setSnapshotMetadataAPFSVolumeInfoDurationSec:(double)a3
{
  self->_snapshotMetadataAPFSVolumeInfoDurationSec = a3;
}

- (double)snapshotMetadataVolumeInfoDurationSec
{
  return self->_snapshotMetadataVolumeInfoDurationSec;
}

- (void)setSnapshotMetadataVolumeInfoDurationSec:(double)a3
{
  self->_snapshotMetadataVolumeInfoDurationSec = a3;
}

- (double)snapshotMetadataUnlinkedOpenFilesDurationSec
{
  return self->_snapshotMetadataUnlinkedOpenFilesDurationSec;
}

- (void)setSnapshotMetadataUnlinkedOpenFilesDurationSec:(double)a3
{
  self->_snapshotMetadataUnlinkedOpenFilesDurationSec = a3;
}

- (double)snapshotMetadataCacheDeleteDurationSec
{
  return self->_snapshotMetadataCacheDeleteDurationSec;
}

- (void)setSnapshotMetadataCacheDeleteDurationSec:(double)a3
{
  self->_snapshotMetadataCacheDeleteDurationSec = a3;
}

- (double)snapshotMetadataATCDurationSec
{
  return self->_snapshotMetadataATCDurationSec;
}

- (void)setSnapshotMetadataATCDurationSec:(double)a3
{
  self->_snapshotMetadataATCDurationSec = a3;
}

- (DSSnapshotRequest)__snapshotRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->___snapshotRequest);

  return (DSSnapshotRequest *)WeakRetained;
}

- (void)set__snapshotRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->___snapshotRequest);

  objc_storeStrong((id *)&self->_snapshotDateEnd, 0);
}

@end