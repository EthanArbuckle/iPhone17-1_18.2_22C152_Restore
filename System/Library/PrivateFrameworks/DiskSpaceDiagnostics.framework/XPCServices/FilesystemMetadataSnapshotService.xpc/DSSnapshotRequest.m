@interface DSSnapshotRequest
- (BOOL)__collectSpaceAttributionSnapshot:(id *)a3;
- (BOOL)__createPreSnapshotVolumeManagerUsingProvider:(id)a3 error:(id *)a4;
- (BOOL)__createSnapshotFileManagerUsingProvider:(id)a3 error:(id *)a4;
- (BOOL)_setupManagersAndProgress:(id)a3 volumeManagerProvider:(id)a4 error:(id *)a5;
- (DSSnapshotFileManager)snapshotFileManager;
- (DSSnapshotRequest)initWithOptions:(id)a3;
- (DSSnapshotRequestTelemetryReporter)_telemetryReporter;
- (DSVolumeManager)_volumeManager;
- (NSDate)__endDate;
- (NSDate)__requestDate;
- (NSDate)beginDate;
- (NSDictionary)options;
- (NSMutableArray)__powerAssertionIDs;
- (NSProgress)__archivingProgress;
- (NSProgress)__atcProgress;
- (NSProgress)__cacheDeleteProgress;
- (NSProgress)__miscProgress;
- (NSProgress)__spaceAttributionProgress;
- (NSProgress)progress;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)formatVersion;
- (id)__createVolumeManagerUsingProvider:(id)a3 error:(id *)a4;
- (id)__doDataCollection:(id *)a3;
- (id)__fetchMetadata;
- (id)__stockSnapshotFileManagerProvider;
- (id)__stockVolumeManagerProvider;
- (id)executeWithError:(id *)a3;
- (void)__createPowerAssertions;
- (void)__incrementProgress:(id)a3 byPercent:(float)a4;
- (void)__initializeProgress;
- (void)__releasePowerAssertions;
- (void)set__archivingProgress:(id)a3;
- (void)set__atcProgress:(id)a3;
- (void)set__cacheDeleteProgress:(id)a3;
- (void)set__miscProgress:(id)a3;
- (void)set__spaceAttributionProgress:(id)a3;
@end

@implementation DSSnapshotRequest

- (id)__stockSnapshotFileManagerProvider
{
  if (qword_10006A720 != -1) {
    dispatch_once(&qword_10006A720, &stru_1000647F8);
  }
  id v2 = objc_retainBlock((id)qword_10006A718);

  return v2;
}

- (id)__stockVolumeManagerProvider
{
  if (qword_10006A730 != -1) {
    dispatch_once(&qword_10006A730, &stru_100064858);
  }
  id v2 = objc_retainBlock((id)qword_10006A728);

  return v2;
}

- (id)__fetchMetadata
{
  id v2 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching metadata", buf, 2u);
  }

  v3 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v4 = fprintf((FILE *)[v3 sharedLogFile], "%s\t%s\n", "Version:", "1008") == -1;

  if (v4)
  {
    __error();
    if ((byte_10006A738 & 1) == 0)
    {
      byte_10006A738 = 1;
      v5 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v6 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v7 = fprintf((FILE *)[v6 sharedLogFile], "%s\t%s\n", "Snapshot Version:", (const char *)objc_msgSend(@"2.7", "UTF8String")) == -1;

  if (v7)
  {
    __error();
    if ((byte_10006A739 & 1) == 0)
    {
      byte_10006A739 = 1;
      v8 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  id v137 = +[NSMutableDictionary dictionaryWithCapacity:10];
  [v137 setObject:@"1008" forKeyedSubscript:@"DiskSpaceDiagnosticsVersion"];
  [v137 setObject:@"2.7" forKeyedSubscript:@"SnapshotVersion"];
  v9 = [(DSSnapshotRequest *)self options];
  v10 = [v9 objectForKeyedSubscript:@"FilesystemMetadatSnapshotOptionShouldHashVolumeListings"];
  v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 BOOLValue]);
  [v137 setObject:v11 forKeyedSubscript:@"HasHashedFSListings"];

  v12 = [(DSSnapshotRequest *)self beginDate];
  v13 = +[NSTimeZone systemTimeZone];
  v14 = +[NSISO8601DateFormatter stringFromDate:v12 timeZone:v13 formatOptions:3955];
  [v137 setObject:v14 forKeyedSubscript:@"TimestampBegin"];

  v15 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching device info", buf, 2u);
  }

  v136 = (void *)MGCopyAnswer();
  v135 = (void *)MGCopyAnswer();
  v134 = (void *)MGCopyAnswer();
  v133 = (void *)MGCopyAnswer();
  v132 = (void *)MGCopyAnswer();
  v131 = (void *)MGCopyAnswer();
  v130 = (void *)MGCopyAnswer();
  [v137 setObject:v136 forKeyedSubscript:@"HardwareModel"];
  [v137 setObject:v135 forKeyedSubscript:@"MarketingName"];
  v16 = +[NSString stringWithFormat:@"%@ %@ %@ (%@)", v134, v133, v132, v131];
  [v137 setObject:v16 forKeyedSubscript:@"OSVersion"];

  [v137 setObject:v130 forKeyedSubscript:@"InternalBuild"];
  v17 = [(DSSnapshotRequest *)self __miscProgress];
  LODWORD(v18) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v17 byPercent:v18];

  v19 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching indirection table stats", buf, 2u);
  }

  v20 = +[NSDate now];
  v21 = indirectionTableStatistics();
  [v137 addEntriesFromDictionary:v21];

  v22 = +[NSDate now];
  [v22 timeIntervalSinceDate:v20];
  double v24 = v23;
  v25 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v26 = fprintf((FILE *)[v25 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] Indirection table stats", v24) == -1;

  if (v26)
  {
    __error();
    if ((byte_10006A73A & 1) == 0)
    {
      byte_10006A73A = 1;
      v27 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v28 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Indirection table stats";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v24;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataIndirectionTableStatsDurationSec:v24];
  v29 = [(DSSnapshotRequest *)self __miscProgress];
  LODWORD(v30) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v29 byPercent:v30];

  v31 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Fetching apfs volume info", buf, 2u);
  }

  v32 = +[NSDate now];
  v33 = [(DSSnapshotRequest *)self snapshotFileManager];
  v34 = apfsVolumeInfo((FILE *)[v33 sharedLogFile]);
  [v137 addEntriesFromDictionary:v34];

  v35 = +[NSDate now];
  [v35 timeIntervalSinceDate:v32];
  double v37 = v36;
  v38 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v39 = fprintf((FILE *)[v38 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] APFS volume info", v37) == -1;

  if (v39)
  {
    __error();
    if ((byte_10006A73B & 1) == 0)
    {
      byte_10006A73B = 1;
      v40 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v41 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] APFS volume info";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v37;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataAPFSVolumeInfoDurationSec:v37];
  v42 = [(DSSnapshotRequest *)self __miscProgress];
  LODWORD(v43) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v42 byPercent:v43];

  v44 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Fetching snapshot info", buf, 2u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  v159 = 0;
  id v45 = objc_alloc_init((Class)NSMutableDictionary);
  v46 = [(DSSnapshotRequest *)self _volumeManager];
  v47 = [v46 volumesForSnapshotting];
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_10000B98C;
  v144[3] = &unk_1000648C0;
  id v48 = v45;
  id v145 = v48;
  v146 = self;
  v147 = buf;
  [v47 enumerateObjectsUsingBlock:v144];

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataAPFSSnapshotInfoDurationSec:*(double *)(*(void *)&buf[8] + 24)];
  CFStringRef v156 = @"FSSnapshots";
  id v157 = v48;
  v49 = +[NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
  [v137 addEntriesFromDictionary:v49];

  _Block_object_dispose(buf, 8);
  v50 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Fetching volume info", buf, 2u);
  }

  v51 = +[NSDate now];
  v52 = [(DSSnapshotRequest *)self _volumeManager];
  v53 = [v52 allVolumesInfoDict];
  [v137 addEntriesFromDictionary:v53];

  v54 = [(DSSnapshotRequest *)self __stockVolumeManagerProvider];
  v55 = [(DSSnapshotRequest *)self __createVolumeManagerUsingProvider:v54 error:0];

  v56 = [v55 allVolumesInfoDict];
  CFStringRef v154 = @"VolumesPostSnapshot";
  v57 = [v56 objectForKeyedSubscript:@"Volumes"];
  v155 = v57;
  v58 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];

  [v137 addEntriesFromDictionary:v58];
  v59 = +[NSDate now];
  [v59 timeIntervalSinceDate:v51];
  double v61 = v60;
  v62 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v63 = fprintf((FILE *)[v62 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] Volume info", v61) == -1;

  if (v63)
  {
    __error();
    if ((byte_10006A73D & 1) == 0)
    {
      byte_10006A73D = 1;
      v64 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v65 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Volume info";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v61;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataVolumeInfoDurationSec:v61];
  v66 = [(DSSnapshotRequest *)self __miscProgress];
  LODWORD(v67) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v66 byPercent:v67];

  v68 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Fetching unlinked-open-files", buf, 2u);
  }

  v69 = +[NSDate now];
  v70 = [(DSSnapshotRequest *)self snapshotFileManager];
  v71 = unlinkedOpenFiles((FILE *)[v70 sharedLogFile]);
  [v137 addEntriesFromDictionary:v71];

  v72 = +[NSDate now];
  [v72 timeIntervalSinceDate:v69];
  double v74 = v73;
  v75 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v76 = fprintf((FILE *)[v75 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] Unlinked open files", v74) == -1;

  if (v76)
  {
    __error();
    if ((byte_10006A73E & 1) == 0)
    {
      byte_10006A73E = 1;
      v77 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v78 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] Unlinked open files";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v74;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataUnlinkedOpenFilesDurationSec:v74];
  v79 = [(DSSnapshotRequest *)self __miscProgress];
  LODWORD(v80) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v79 byPercent:v80];

  v81 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Fetching CacheDelete info", buf, 2u);
  }

  v129 = +[NSDate now];
  v82 = +[NSMutableArray array];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v83 = [(DSSnapshotRequest *)self _volumeManager];
  id obj = [v83 volumesForSnapshotting];

  id v84 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
  if (v84)
  {
    uint64_t v85 = *(void *)v141;
    do
    {
      v86 = 0;
      do
      {
        if (*(void *)v141 != v85) {
          objc_enumerationMutation(obj);
        }
        v87 = *(void **)(*((void *)&v140 + 1) + 8 * (void)v86);
        v89 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v87;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Fetching CacheDelete info for %{public}@", buf, 0xCu);
        }

        v90 = +[NSDate now];
        v91 = [v87 mountPoint];
        v92 = cacheDeleteInfo(v91);
        [v82 addObject:v92];

        v93 = [(DSSnapshotRequest *)self __cacheDeleteProgress];
        v94 = [v87 progress];
        objc_msgSend(v93, "setCompletedUnitCount:", (uint64_t)((double)(uint64_t)objc_msgSend(v93, "completedUnitCount")+ (double)(uint64_t)objc_msgSend(v94, "totalUnitCount") * 0.1));

        v95 = +[NSDate now];
        [v95 timeIntervalSinceDate:v90];
        double v97 = v96;
        v98 = [(DSSnapshotRequest *)self snapshotFileManager];
        LODWORD(v92) = fprintf((FILE *)[v98 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] CacheDeleteInfo for volume", v97) == -1;

        if (v92)
        {
          v99 = __error();
          if ((byte_10006A73F & 1) == 0)
          {
            int v100 = *v99;
            byte_10006A73F = 1;
            v101 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v100;
              _os_log_fault_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", buf, 8u);
            }
          }
        }
        v102 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "[Metadata] CacheDeleteInfo for volume";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v97;
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
        }

        v103 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
          sub_1000307FC((uint64_t)v152, (uint64_t)self);
        }

        v86 = (char *)v86 + 1;
      }
      while (v84 != v86);
      id v84 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
    }
    while (v84);
  }

  v104 = +[NSDate now];
  [v104 timeIntervalSinceDate:v129];
  double v106 = v105;
  v107 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v108 = fprintf((FILE *)[v107 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] CacheDeleteInfo", v106) == -1;

  if (v108)
  {
    __error();
    if ((byte_10006A740 & 1) == 0)
    {
      byte_10006A740 = 1;
      v109 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v110 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] CacheDeleteInfo";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v106;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataCacheDeleteDurationSec:v106];
  [v137 setObject:v82 forKeyedSubscript:@"CacheDeletePerVolumeInfo"];

  v112 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Fetching ATC assetMetrics", buf, 2u);
  }

  v113 = +[NSDate now];
  uint64_t v148 = 0;
  v149 = &v148;
  uint64_t v150 = 0x2050000000;
  v114 = (void *)qword_10006A750;
  uint64_t v151 = qword_10006A750;
  if (!qword_10006A750)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10000F158;
    v159 = &unk_100064910;
    v160 = &v148;
    sub_10000F158((uint64_t)buf);
    v114 = (void *)v149[3];
  }
  v115 = v114;
  _Block_object_dispose(&v148, 8);
  id v116 = objc_alloc_init(v115);
  v117 = [v116 getAssetMetrics];
  [v137 setObject:v117 forKeyedSubscript:@"AssetMetrics"];

  v118 = +[NSDate now];
  [v118 timeIntervalSinceDate:v113];
  double v120 = v119;
  v121 = [(DSSnapshotRequest *)self snapshotFileManager];
  BOOL v122 = fprintf((FILE *)[v121 sharedLogFile], "%s duration: %.0f seconds\n", "[Metadata] ATC AssetMetrics", v120) == -1;

  if (v122)
  {
    __error();
    if ((byte_10006A741 & 1) == 0)
    {
      byte_10006A741 = 1;
      v123 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v124 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "[Metadata] ATC AssetMetrics";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v120;
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
  }

  [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotMetadataATCDurationSec:v120];
  v125 = [(DSSnapshotRequest *)self __atcProgress];
  LODWORD(v126) = 10.0;
  [(DSSnapshotRequest *)self __incrementProgress:v125 byPercent:v126];

  id v127 = v137;

  return v127;
}

- (BOOL)__collectSpaceAttributionSnapshot:(id *)a3
{
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = sub_10000C518;
  double v67 = sub_10000C528;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  double v60 = sub_10000C518;
  double v61 = sub_10000C528;
  id v62 = 0;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10000C530;
  v56[3] = &unk_1000648E8;
  v56[4] = &v63;
  v56[5] = &v57;
  +[SAReporter reportSnapshot:v56];
  if (!v64[5] && v58[5])
  {
    v16 = [(DSSnapshotRequest *)self snapshotFileManager];
    v17 = (id *)(v64 + 5);
    id obj = (id)v64[5];
    double v18 = [v16 fileURLForFileNamed:@"SpaceAttributionSnapshot.plist" error:&obj];
    objc_storeStrong(v17, obj);

    if (v18)
    {
      v19 = (void *)v58[5];
      v20 = (id *)(v64 + 5);
      id v54 = (id)v64[5];
      unsigned __int8 v21 = [v19 writeToURL:v18 error:&v54];
      objc_storeStrong(v20, v54);
      if (v21)
      {
        v22 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Successfully collected SpaceAttribution snapshot", buf, 2u);
        }

        BOOL v15 = 1;
        goto LABEL_52;
      }
      v34 = [(DSSnapshotRequest *)self snapshotFileManager];
      v35 = (FILE *)[v34 sharedLogFile];
      id v36 = [(id)v64[5] localizedDescription];
      double v37 = (const char *)[v36 UTF8String];
      id v38 = [(id)v58[5] description];
      LODWORD(v35) = fprintf(v35, "Error: Failed to write SpaceAttribution snapshot to file: %s\n%s\n", v37, (const char *)[v38 UTF8String]) == -1;

      if (v35)
      {
        __error();
        if ((byte_10006A746 & 1) == 0)
        {
          byte_10006A746 = 1;
          BOOL v39 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v40 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v50 = [(id)v64[5] localizedDescription];
        id v51 = [v50 UTF8String];
        id v52 = [(id)v58[5] description];
        id v53 = [v52 UTF8String];
        *(_DWORD *)buf = 136315394;
        id v70 = v51;
        __int16 v71 = 2080;
        id v72 = v53;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Error: Failed to write SpaceAttribution snapshot to file: %s\n%s", buf, 0x16u);
      }
      if (a3)
      {
        id v33 = (id) v64[5];
        goto LABEL_50;
      }
    }
    else
    {
      double v23 = [(DSSnapshotRequest *)self snapshotFileManager];
      double v24 = (FILE *)[v23 sharedLogFile];
      id v25 = [(id)v64[5] localizedDescription];
      LODWORD(v24) = fprintf(v24, "Error: Failed to get file URL for writing SpaceAttribution snapshot: %s\n", (const char *)[v25 UTF8String]) == -1;

      if (v24)
      {
        __error();
        if ((byte_10006A744 & 1) == 0)
        {
          byte_10006A744 = 1;
          BOOL v26 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v27 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v46 = [(id)v64[5] localizedDescription];
        id v47 = [v46 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v70 = v47;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error: Failed to get file URL for writing SpaceAttribution snapshot: %s", buf, 0xCu);
      }
      v28 = [(DSSnapshotRequest *)self snapshotFileManager];
      v29 = (FILE *)[v28 sharedLogFile];
      id v30 = [(id)v58[5] description];
      LODWORD(v29) = fprintf(v29, "SpaceAttribution snapshot: %s\n", (const char *)[v30 UTF8String]) == -1;

      if (v29)
      {
        __error();
        if ((byte_10006A745 & 1) == 0)
        {
          byte_10006A745 = 1;
          v31 = shared_filesystem_metadata_snapshot_service_log_handle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            sub_1000302A4();
          }
        }
      }
      v32 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v48 = [(id)v58[5] description];
        id v49 = [v48 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v70 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "SpaceAttribution snapshot: %s", buf, 0xCu);
      }
      if (a3)
      {
        id v33 = (id) v64[5];
LABEL_50:
        BOOL v15 = 0;
        *a3 = v33;
LABEL_52:

        goto LABEL_53;
      }
    }
    BOOL v15 = 0;
    goto LABEL_52;
  }
  v5 = [(DSSnapshotRequest *)self snapshotFileManager];
  v6 = (FILE *)[v5 sharedLogFile];
  id v7 = [(id)v64[5] localizedDescription];
  LODWORD(v6) = fprintf(v6, "Error: Failed to collect SpaceAttribution snapshot: %s\n", (const char *)[v7 UTF8String]) == -1;

  if (v6)
  {
    __error();
    if ((byte_10006A742 & 1) == 0)
    {
      byte_10006A742 = 1;
      v8 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v9 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v42 = [(id)v64[5] localizedDescription];
    id v43 = [v42 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v70 = v43;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error: Failed to collect SpaceAttribution snapshot: %s", buf, 0xCu);
  }
  v10 = [(DSSnapshotRequest *)self snapshotFileManager];
  v11 = (FILE *)[v10 sharedLogFile];
  id v12 = [(id)v58[5] description];
  LODWORD(v11) = fprintf(v11, "SpaceAttribution snapshot: %s\n", (const char *)[v12 UTF8String]) == -1;

  if (v11)
  {
    __error();
    if ((byte_10006A743 & 1) == 0)
    {
      byte_10006A743 = 1;
      v13 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  v14 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v44 = [(id)v58[5] description];
    id v45 = [v44 UTF8String];
    *(_DWORD *)buf = 136315138;
    id v70 = v45;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "SpaceAttribution snapshot: %s", buf, 0xCu);
  }
  BOOL v15 = 0;
  if (a3) {
    *a3 = (id) v64[5];
  }
LABEL_53:
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v15;
}

- (void)__incrementProgress:(id)a3 byPercent:(float)a4
{
  id v6 = a3;
  [v6 fractionCompleted];
  if (v7 < 1.0) {
    objc_msgSend(v6, "setCompletedUnitCount:", (char *)objc_msgSend(v6, "completedUnitCount")+ (uint64_t)((double)(uint64_t)objc_msgSend(v6, "totalUnitCount") * 0.01 * a4));
  }
  v8 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }
}

- (void)__initializeProgress
{
  v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up NSProgress", buf, 2u);
  }

  BOOL v4 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Calculating total units for each volume", buf, 2u);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v5 = [(DSSnapshotRequest *)self _volumeManager];
  id v6 = [v5 volumesForSnapshotting];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v7)
  {
    double v60 = v2;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v13 = [v12 progress];
        v9 += (uint64_t)[v13 totalUnitCount];

        v14 = [(DSSnapshotRequest *)self progress];
        BOOL v15 = [v12 progress];
        objc_msgSend(v14, "setTotalUnitCount:", (char *)objc_msgSend(v15, "totalUnitCount") + (void)objc_msgSend(v14, "totalUnitCount"));

        v16 = [(DSSnapshotRequest *)self progress];
        v17 = [v12 progress];
        double v18 = [v12 progress];
        objc_msgSend(v16, "addChild:withPendingUnitCount:", v17, objc_msgSend(v18, "totalUnitCount"));

        v19 = [v12 progress];
        uint64_t v8 = (uint64_t)((double)v8 + (double)(uint64_t)[v19 totalUnitCount] * 0.1);
      }
      id v7 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v7);
    id v7 = (id)(uint64_t)((double)v9 * 0.1);
    id v2 = v60;
  }
  else
  {
    uint64_t v8 = 0;
  }

  v20 = +[NSProgress progressWithTotalUnitCount:v7];
  [(DSSnapshotRequest *)self set__atcProgress:v20];

  unsigned __int8 v21 = [(DSSnapshotRequest *)self progress];
  v22 = [(DSSnapshotRequest *)self __atcProgress];
  objc_msgSend(v21, "setTotalUnitCount:", (char *)objc_msgSend(v22, "totalUnitCount") + (void)objc_msgSend(v21, "totalUnitCount"));

  double v23 = [(DSSnapshotRequest *)self progress];
  double v24 = [(DSSnapshotRequest *)self __atcProgress];
  id v25 = [(DSSnapshotRequest *)self __atcProgress];
  objc_msgSend(v23, "addChild:withPendingUnitCount:", v24, objc_msgSend(v25, "totalUnitCount"));

  BOOL v26 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100030AE8(self);
  }

  v27 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }

  v28 = +[NSProgress progressWithTotalUnitCount:v8];
  [(DSSnapshotRequest *)self set__cacheDeleteProgress:v28];

  v29 = [(DSSnapshotRequest *)self progress];
  id v30 = [(DSSnapshotRequest *)self __cacheDeleteProgress];
  objc_msgSend(v29, "setTotalUnitCount:", (char *)objc_msgSend(v30, "totalUnitCount") + (void)objc_msgSend(v29, "totalUnitCount"));

  v31 = [(DSSnapshotRequest *)self progress];
  v32 = [(DSSnapshotRequest *)self __cacheDeleteProgress];
  id v33 = [(DSSnapshotRequest *)self __cacheDeleteProgress];
  objc_msgSend(v31, "addChild:withPendingUnitCount:", v32, objc_msgSend(v33, "totalUnitCount"));

  v34 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_100030A64(self);
  }

  v35 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }

  id v36 = +[NSProgress progressWithTotalUnitCount:v7];
  [(DSSnapshotRequest *)self set__archivingProgress:v36];

  double v37 = [(DSSnapshotRequest *)self progress];
  id v38 = [(DSSnapshotRequest *)self __archivingProgress];
  objc_msgSend(v37, "setTotalUnitCount:", (char *)objc_msgSend(v38, "totalUnitCount") + (void)objc_msgSend(v37, "totalUnitCount"));

  BOOL v39 = [(DSSnapshotRequest *)self progress];
  v40 = [(DSSnapshotRequest *)self __archivingProgress];
  v41 = [(DSSnapshotRequest *)self __archivingProgress];
  objc_msgSend(v39, "addChild:withPendingUnitCount:", v40, objc_msgSend(v41, "totalUnitCount"));

  id v42 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    sub_1000309E0(self);
  }

  id v43 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }

  id v44 = +[NSProgress progressWithTotalUnitCount:v7];
  [(DSSnapshotRequest *)self set__spaceAttributionProgress:v44];

  id v45 = [(DSSnapshotRequest *)self progress];
  id v46 = [(DSSnapshotRequest *)self __spaceAttributionProgress];
  objc_msgSend(v45, "setTotalUnitCount:", (char *)objc_msgSend(v46, "totalUnitCount") + (void)objc_msgSend(v45, "totalUnitCount"));

  id v47 = [(DSSnapshotRequest *)self progress];
  id v48 = [(DSSnapshotRequest *)self __spaceAttributionProgress];
  id v49 = [(DSSnapshotRequest *)self __spaceAttributionProgress];
  objc_msgSend(v47, "addChild:withPendingUnitCount:", v48, objc_msgSend(v49, "totalUnitCount"));

  id v50 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_10003095C(self);
  }

  id v51 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }

  id v52 = +[NSProgress progressWithTotalUnitCount:v7];
  [(DSSnapshotRequest *)self set__miscProgress:v52];

  id v53 = [(DSSnapshotRequest *)self progress];
  id v54 = [(DSSnapshotRequest *)self __miscProgress];
  objc_msgSend(v53, "setTotalUnitCount:", (char *)objc_msgSend(v54, "totalUnitCount") + (void)objc_msgSend(v53, "totalUnitCount"));

  v55 = [(DSSnapshotRequest *)self progress];
  v56 = [(DSSnapshotRequest *)self __miscProgress];
  uint64_t v57 = [(DSSnapshotRequest *)self __miscProgress];
  objc_msgSend(v55, "addChild:withPendingUnitCount:", v56, objc_msgSend(v57, "totalUnitCount"));

  v58 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
    sub_1000308D8(self);
  }

  uint64_t v59 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(self);
  }
}

- (BOOL)__createSnapshotFileManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = (void (**)(id, DSSnapshotRequest *))a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating snapshot file manager for %@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0;
  }
  if (self->_snapshotFileManager) {
    sub_100030BF0();
  }
  if (!v6)
  {
    double v18 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100030B6C(v18);
    }

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Snapshot file manager provider cannot be nil";
    v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v12 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65540 userInfo:v19];

    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v6[2](v6, self);
  uint64_t v8 = (DSSnapshotFileManager *)objc_claimAutoreleasedReturnValue();
  snapshotFileManager = self->_snapshotFileManager;
  self->_snapshotFileManager = v8;

  uint64_t v10 = [(DSSnapshotRequest *)self snapshotFileManager];
  id v22 = 0;
  unsigned int v11 = [v10 createWorkingDirectoryAndSharedFilesWithError:&v22];
  id v12 = v22;

  if (!v11 || v12)
  {
    if (!a4)
    {
LABEL_16:
      BOOL v17 = 0;
      goto LABEL_17;
    }
LABEL_14:
    id v12 = v12;
    BOOL v17 = 0;
    *a4 = v12;
    goto LABEL_17;
  }
  v13 = [(DSSnapshotRequest *)self snapshotFileManager];
  v14 = (FILE *)[v13 sharedLogFile];
  BOOL v15 = [(DSSnapshotRequest *)self beginDate];
  id v16 = [v15 description];
  LODWORD(v14) = fprintf(v14, "Started snapshotting at %s\n", (const char *)[v16 UTF8String]);

  if (v14 == -1)
  {
    __error();
    BOOL v17 = 1;
    if ((byte_10006A747 & 1) == 0)
    {
      byte_10006A747 = 1;
      unsigned __int8 v21 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_1000302A4();
      }
    }
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_17:

  return v17;
}

- (id)__createVolumeManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = (void (**)(id, DSSnapshotRequest *))a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating volume manager", buf, 2u);
  }

  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = v6[2](v6, self);
    id v18 = 0;
    unsigned int v9 = [v8 discoverVolumesWithError:&v18];
    id v10 = v18;
    id v11 = v10;
    if (!v9 || v10)
    {
      if (!a4) {
        goto LABEL_18;
      }
    }
    else
    {
      id v12 = [v8 volumesForSnapshotting];
      id v13 = [v12 count];

      if (v13)
      {
        id v14 = v8;
        id v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      id v11 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65542 userInfo:0];
      if (!a4)
      {
LABEL_18:
        id v14 = 0;
        goto LABEL_19;
      }
    }
    id v11 = v11;
    id v14 = 0;
    *a4 = v11;
    goto LABEL_19;
  }
  BOOL v15 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100030C1C(v15);
  }

  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  CFStringRef v21 = @"Volume manager provider cannot be nil";
  id v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v11 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65540 userInfo:v16];

  if (a4)
  {
    id v11 = v11;
    id v14 = 0;
    *a4 = v11;
  }
  else
  {
    id v14 = 0;
  }
LABEL_20:

  return v14;
}

- (BOOL)__createPreSnapshotVolumeManagerUsingProvider:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating pre-snapshot volume manager for %@", (uint8_t *)&v12, 0xCu);
  }

  [(DSSnapshotRequest *)self _volumeManager];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_100030CA0();
  }
  uint64_t v8 = [(DSSnapshotRequest *)self __createVolumeManagerUsingProvider:v6 error:a4];
  volumeManager = self->__volumeManager;
  self->__volumeManager = v8;

  BOOL v10 = self->__volumeManager != 0;
  return v10;
}

- (id)__doDataCollection:(id *)a3
{
  v5 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v138 = (const char *)self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Collecting data and metadata %@", buf, 0xCu);
  }

  if (a3) {
    *a3 = 0;
  }
  BOOL v108 = a3;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  v112 = self;
  id v6 = [(DSSnapshotRequest *)self _volumeManager];
  id v7 = [v6 volumesForSnapshotting];

  id obj = v7;
  id v111 = [v7 countByEnumeratingWithState:&v126 objects:v141 count:16];
  char v8 = 0;
  uint64_t v9 = 0;
  id v10 = 0;
  if (v111)
  {
    uint64_t v110 = *(void *)v127;
    do
    {
      id v11 = 0;
      int v12 = v10;
      do
      {
        if (*(void *)v127 != v110) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v126 + 1) + 8 * (void)v11);
        id v14 = +[NSDate now];
        v130[0] = 0;
        id v125 = v12;
        unsigned __int8 v15 = [v13 listContentsWithEntryCount:v130 andError:&v125];
        id v10 = v125;

        uint64_t v16 = v130[0];
        BOOL v17 = +[NSDate now];
        [v17 timeIntervalSinceDate:v14];
        double v19 = v18;
        NSErrorUserInfoKey v20 = [(DSSnapshotRequest *)v112 snapshotFileManager];
        int v21 = fprintf((FILE *)[v20 sharedLogFile], "%s duration: %.0f seconds\n", "Volume listing", v19);

        if (v21 == -1)
        {
          id v22 = __error();
          if ((byte_10006A748 & 1) == 0)
          {
            int v23 = *v22;
            byte_10006A748 = 1;
            CFStringRef v24 = shared_filesystem_metadata_snapshot_service_log_handle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v138) = v23;
              _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Failed to write to file: %{darwin.errno}d", buf, 8u);
            }
          }
        }
        id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v138 = "Volume listing";
          __int16 v139 = 2048;
          double v140 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
        }

        BOOL v26 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_1000307FC((uint64_t)v136, (uint64_t)v112);
        }
        v8 |= v15;
        v9 += v16;

        id v11 = (char *)v11 + 1;
        int v12 = v10;
      }
      while (v111 != v11);
      id v111 = [obj countByEnumeratingWithState:&v126 objects:v141 count:16];
    }
    while (v111);
  }

  [(DSSnapshotRequestTelemetryReporter *)v112->__telemetryReporter setSnapshotFSListingsEntryCount:v9];
  v27 = [(DSSnapshotRequest *)v112 _volumeManager];
  v28 = [v27 volumesForSnapshotting];
  -[DSSnapshotRequestTelemetryReporter setSnapshotVolumeCount:](v112->__telemetryReporter, "setSnapshotVolumeCount:", [v28 count]);

  if (v8) {
    goto LABEL_25;
  }
  v29 = v108;
  if (!v10)
  {
    id v10 = +[NSError errorWithDomain:@"com.apple.FilesystemMetadataSnapshot" code:65537 userInfo:0];
  }
  if (v8)
  {
LABEL_25:
    id v30 = +[NSDate now];
    id v124 = v10;
    [(DSSnapshotRequest *)v112 __collectSpaceAttributionSnapshot:&v124];
    id v31 = v124;

    v32 = +[NSDate now];
    [v32 timeIntervalSinceDate:v30];
    double v34 = v33;
    v35 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    int v36 = fprintf((FILE *)[v35 sharedLogFile], "%s duration: %.0f seconds\n", "SpaceAttribution snapshot", v34);

    if (v36 == -1)
    {
      __error();
      if ((byte_10006A749 & 1) == 0)
      {
        byte_10006A749 = 1;
        double v37 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    id v38 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "SpaceAttribution snapshot";
      __int16 v139 = 2048;
      double v140 = v34;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
    }

    BOOL v39 = [(DSSnapshotRequest *)v112 __spaceAttributionProgress];
    id v40 = [v39 totalUnitCount];
    v41 = [(DSSnapshotRequest *)v112 __spaceAttributionProgress];
    [v41 setCompletedUnitCount:v40];

    id v42 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_100030854(v112);
    }

    id v43 = +[NSDate now];
    id v44 = [(DSSnapshotRequest *)v112 __fetchMetadata];
    id v45 = +[NSDate now];
    [v45 timeIntervalSinceDate:v43];
    double v47 = v46;
    id v48 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    int v49 = fprintf((FILE *)[v48 sharedLogFile], "%s duration: %.0f seconds\n", "Metadata", v47);

    if (v49 == -1)
    {
      __error();
      if ((byte_10006A74A & 1) == 0)
      {
        byte_10006A74A = 1;
        id v50 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    id v51 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "Metadata";
      __int16 v139 = 2048;
      double v140 = v47;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
    }

    id v52 = (NSDate *)objc_alloc_init((Class)NSDate);
    endDate = v112->___endDate;
    v112->___endDate = v52;

    id v54 = [(DSSnapshotRequest *)v112 __endDate];
    v55 = +[NSTimeZone systemTimeZone];
    v56 = +[NSISO8601DateFormatter stringFromDate:v54 timeZone:v55 formatOptions:3955];
    [v44 setObject:v56 forKeyedSubscript:@"TimestampEnd"];

    uint64_t v57 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    v58 = (FILE *)[v57 sharedLogFile];
    uint64_t v59 = [(DSSnapshotRequest *)v112 __endDate];
    id v60 = [v59 description];
    LODWORD(v58) = fprintf(v58, "Finished snapshotting at %s\n", (const char *)[v60 UTF8String]);

    if (v58 == -1)
    {
      __error();
      if ((byte_10006A74B & 1) == 0)
      {
        byte_10006A74B = 1;
        double v61 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    id v62 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      long long v63 = [(DSSnapshotRequest *)v112 __endDate];
      id v64 = [v63 description];
      long long v65 = (const char *)[v64 UTF8String];
      *(_DWORD *)buf = 136315138;
      v138 = v65;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Finished snapshotting at %s", buf, 0xCu);
    }
    long long v66 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    id v123 = v31;
    [v66 writeFileForMetadata:v44 error:&v123];
    id v67 = v123;

    id v68 = [(DSSnapshotRequest *)v112 __miscProgress];
    LODWORD(v69) = 10.0;
    [(DSSnapshotRequest *)v112 __incrementProgress:v68 byPercent:v69];

    id v70 = +[NSDate now];
    __int16 v71 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    id v122 = v67;
    id v72 = [v71 archiveWithError:&v122];
    id v10 = v122;

    double v73 = +[NSDate now];
    [v73 timeIntervalSinceDate:v70];
    double v75 = v74;
    BOOL v76 = [(DSSnapshotRequest *)v112 snapshotFileManager];
    int v77 = fprintf((FILE *)[v76 sharedLogFile], "%s duration: %.0f seconds\n", "Archiving", v75);

    if (v77 == -1)
    {
      __error();
      if ((byte_10006A74C & 1) == 0)
      {
        byte_10006A74C = 1;
        v78 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    v79 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "Archiving";
      __int16 v139 = 2048;
      double v140 = v75;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
    }

    double v80 = [(DSSnapshotRequest *)v112 __archivingProgress];
    id v81 = [v80 totalUnitCount];
    v82 = [(DSSnapshotRequest *)v112 __archivingProgress];
    [v82 setCompletedUnitCount:v81];

    v83 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      sub_100030854(v112);
    }

    v29 = v108;
    if (v10)
    {
LABEL_58:
      if (!v29) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
  }
  else
  {
    id v72 = 0;
    if (v10) {
      goto LABEL_58;
    }
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v85 = [(DSSnapshotRequest *)v112 _volumeManager];
  v86 = [v85 volumesForSnapshotting];

  id v87 = [v86 countByEnumeratingWithState:&v118 objects:v135 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v119;
    do
    {
      for (i = 0; i != v88; i = (char *)i + 1)
      {
        if (*(void *)v119 != v89) {
          objc_enumerationMutation(v86);
        }
        v91 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        v92 = [v91 progress];
        id v93 = [v92 totalUnitCount];
        v94 = [v91 progress];
        [v94 setCompletedUnitCount:v93];

        v95 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG)) {
          sub_1000307FC((uint64_t)buf, (uint64_t)v112);
        }
      }
      id v88 = [v86 countByEnumeratingWithState:&v118 objects:v135 count:16];
    }
    while (v88);
  }

  atcProgress = v112->___atcProgress;
  long long v133 = *(_OWORD *)&v112->___cacheDeleteProgress;
  miscProgress = v112->___miscProgress;
  v132 = atcProgress;
  v134 = miscProgress;
  +[NSArray arrayWithObjects:&v132 count:4];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v98 = (id)objc_claimAutoreleasedReturnValue();
  id v99 = [v98 countByEnumeratingWithState:&v114 objects:v131 count:16];
  if (v99)
  {
    id v100 = v99;
    uint64_t v101 = *(void *)v115;
    do
    {
      for (j = 0; j != v100; j = (char *)j + 1)
      {
        if (*(void *)v115 != v101) {
          objc_enumerationMutation(v98);
        }
        objc_msgSend(*(id *)(*((void *)&v114 + 1) + 8 * (void)j), "setCompletedUnitCount:", objc_msgSend(*(id *)(*((void *)&v114 + 1) + 8 * (void)j), "totalUnitCount"));
        v103 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG)) {
          sub_1000307FC((uint64_t)v130, (uint64_t)v112);
        }
      }
      id v100 = [v98 countByEnumeratingWithState:&v114 objects:v131 count:16];
    }
    while (v100);
  }

  v104 = [(DSSnapshotRequest *)v112 progress];
  id v105 = [v104 totalUnitCount];
  double v106 = [(DSSnapshotRequest *)v112 progress];
  [v106 setCompletedUnitCount:v105];

  v107 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
    sub_100030854(v112);
  }

  v29 = v108;
  if (v108) {
LABEL_59:
  }
    id *v29 = v10;
LABEL_60:

  return v72;
}

- (void)__releasePowerAssertions
{
  v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertions", buf, 2u);
  }

  if (!self->___powerAssertionIDs) {
    sub_100030CCC();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = [(DSSnapshotRequest *)self __powerAssertionIDs];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (!v5)
  {
LABEL_26:

    return;
  }
  id v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v21;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v4);
      }
      IOPMAssertionID v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntValue];
      id v11 = shared_filesystem_metadata_snapshot_service_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        IOPMAssertionID v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking status of power assertion 0x%x", buf, 8u);
      }

      CFDictionaryRef v12 = IOPMAssertionCopyProperties(v10);
      id v13 = shared_filesystem_metadata_snapshot_service_log_handle();
      id v14 = v13;
      if (!v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          IOPMAssertionID v25 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Querying properties for power assertion 0x%x returned NULL - assertion must have timed out", buf, 8u);
        }
        char v7 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        IOPMAssertionID v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing power assertion 0x%x", buf, 8u);
      }

      IOReturn v15 = IOPMAssertionRelease(v10);
      if (v15)
      {
        IOReturn v16 = v15;
        id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          IOPMAssertionID v25 = v10;
          __int16 v26 = 1024;
          IOReturn v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to release power assertion 0x%x: %d", buf, 0xEu);
        }
LABEL_20:
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  }
  while (v6);

  if (v7)
  {
    [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotPowerAssertionsDidTimeOut:1];
    BOOL v17 = +[NSDate now];
    [v17 timeIntervalSinceDate:self->_beginDate];
    double v19 = v18;

    BOOL v4 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100030CF8(self, v4, v19);
    }
    goto LABEL_26;
  }
}

- (void)__createPowerAssertions
{
  v3 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating power assertions", buf, 2u);
  }

  if (self->___powerAssertionIDs) {
    sub_100030E9C();
  }
  BOOL v4 = +[NSMutableArray array];
  powerAssertionIDs = self->___powerAssertionIDs;
  self->___powerAssertionIDs = v4;

  CFStringRef v6 = +[NSString stringWithFormat:@"%@ collects diagnostics for filesystem utilization triage and may take time in the order of hours. To allow continued data collection while the user is away requires preventing the system from sleeping.", @"com.apple.FilesystemMetadataSnapshotService"];
  IOPMAssertionID AssertionID = 0;
  IOReturn v7 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", (CFStringRef)+[NSString stringWithFormat:@"%@.preventUserIdleSystemSleep", @"com.apple.FilesystemMetadataSnapshotService"], v6, v6, 0, 1800.0, @"TimeoutActionRelease", &AssertionID);
  uint64_t v8 = shared_filesystem_metadata_snapshot_service_log_handle();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100030E28();
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = 0x409C200000000000;
      __int16 v20 = 1024;
      IOPMAssertionID v21 = AssertionID;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created power assertion to prevent system sleep (with a %0.2f sec timeout): 0x%x.", buf, 0x12u);
    }

    uint64_t v9 = [(DSSnapshotRequest *)self __powerAssertionIDs];
    IOPMAssertionID v10 = +[NSNumber numberWithUnsignedInt:AssertionID];
    [v9 addObject:v10];
  }
  CFStringRef v11 = +[NSString stringWithFormat:@"%@ collects diagnostics for filesystem utilization triage and may take time in the order of hours. To allow continued data collection while the user is away requires preventing disks from idling.", @"com.apple.FilesystemMetadataSnapshotService"];
  CFStringRef v12 = +[NSString stringWithFormat:@"%@.preventDiskIdle", @"com.apple.FilesystemMetadataSnapshotService"];
  IOPMAssertionID AssertionID = 0;
  IOReturn v13 = IOPMAssertionCreateWithDescription(@"PreventDiskIdle", v12, v11, v11, 0, 1800.0, @"TimeoutActionRelease", &AssertionID);
  id v14 = shared_filesystem_metadata_snapshot_service_log_handle();
  IOReturn v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100030DB4();
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = 0x409C200000000000;
      __int16 v20 = 1024;
      IOPMAssertionID v21 = AssertionID;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created power assertion to prevent disk idling (with a %0.2f sec timeout): 0x%x.", buf, 0x12u);
    }

    IOReturn v15 = [(DSSnapshotRequest *)self __powerAssertionIDs];
    IOReturn v16 = +[NSNumber numberWithUnsignedInt:AssertionID];
    [v15 addObject:v16];
  }
}

- (BOOL)_setupManagersAndProgress:(id)a3 volumeManagerProvider:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  IOPMAssertionID v10 = (NSDate *)objc_alloc_init((Class)NSDate);
  beginDate = self->_beginDate;
  self->_beginDate = v10;

  CFStringRef v12 = shared_filesystem_metadata_snapshot_service_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    IOReturn v13 = [(DSSnapshotRequest *)self beginDate];
    int v19 = 138412290;
    __int16 v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Begin date: %@", (uint8_t *)&v19, 0xCu);
  }
  unsigned int v14 = [(DSSnapshotRequest *)self __createSnapshotFileManagerUsingProvider:v9 error:a5];

  if (v14
    && [(DSSnapshotRequest *)self __createPreSnapshotVolumeManagerUsingProvider:v8 error:a5])
  {
    [(DSSnapshotRequest *)self __initializeProgress];
    IOReturn v15 = [(DSSnapshotRequest *)self __miscProgress];
    LODWORD(v16) = 10.0;
    [(DSSnapshotRequest *)self __incrementProgress:v15 byPercent:v16];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (NSString)formatVersion
{
  return (NSString *)@"2.7";
}

- (id)executeWithError:(id *)a3
{
  id v5 = +[NSDate now];
  CFStringRef v6 = +[DSSnapshotRequestTelemetryReporter telemetryReporterForSnapshotRequest:self];
  telemetryReporter = self->__telemetryReporter;
  self->__telemetryReporter = v6;

  id v8 = [(DSSnapshotRequest *)self __stockSnapshotFileManagerProvider];
  id v9 = [(DSSnapshotRequest *)self __stockVolumeManagerProvider];
  unsigned int v10 = [(DSSnapshotRequest *)self _setupManagersAndProgress:v8 volumeManagerProvider:v9 error:a3];

  if (v10)
  {
    [(DSSnapshotRequest *)self __createPowerAssertions];
    CFStringRef v11 = [(DSSnapshotRequest *)self __doDataCollection:a3];
    CFStringRef v12 = [(DSSnapshotRequest *)self snapshotFileManager];
    id v28 = 0;
    unsigned __int8 v13 = [v12 cleanupWithError:&v28];
    id v14 = v28;

    if (a3 && (v13 & 1) == 0 && !*a3) {
      *a3 = v14;
    }
    [(DSSnapshotRequest *)self __releasePowerAssertions];
    IOReturn v15 = +[NSDate now];
    [v15 timeIntervalSinceDate:v5];
    double v17 = v16;
    double v18 = [(DSSnapshotRequest *)self snapshotFileManager];
    int v19 = fprintf((FILE *)[v18 sharedLogFile], "%s duration: %.0f seconds\n", "Snapshot request", v17);

    if (v19 == -1)
    {
      __error();
      if ((byte_10006A74D & 1) == 0)
      {
        byte_10006A74D = 1;
        __int16 v20 = shared_filesystem_metadata_snapshot_service_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_1000302A4();
        }
      }
    }
    IOPMAssertionID v21 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "Snapshot request";
      __int16 v31 = 2048;
      double v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s duration: %.0f seconds", buf, 0x16u);
    }

    [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter setSnapshotDateEnd:v15];
    if (*a3) {
      -[DSSnapshotRequestTelemetryReporter setSnapshotExitCode:](self->__telemetryReporter, "setSnapshotExitCode:", [*a3 code]);
    }
    if (v11)
    {
      long long v22 = +[NSFileManager defaultManager];
      id v27 = 0;
      long long v23 = [v22 attributesOfItemAtPath:v11 error:&v27];
      id v24 = v27;

      IOPMAssertionID v25 = [v23 objectForKeyedSubscript:NSFileSize];
      -[DSSnapshotRequestTelemetryReporter setSnapshotArchiveSizeBytes:](self->__telemetryReporter, "setSnapshotArchiveSizeBytes:", [v25 unsignedLongLongValue]);
    }
    [(DSSnapshotRequestTelemetryReporter *)self->__telemetryReporter submit];
  }
  else
  {
    CFStringRef v11 = 0;
  }

  return v11;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@: %p> %@ (Options: %@)", v4, self, self->___requestDate, self->_options];

  return (NSString *)v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@> %@ (Options: %@)", v4, self->___requestDate, self->_options];

  return (NSString *)v5;
}

- (DSSnapshotRequest)initWithOptions:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DSSnapshotRequest;
  CFStringRef v6 = [(DSSnapshotRequest *)&v13 init];
  if (v6)
  {
    IOReturn v7 = shared_filesystem_metadata_snapshot_service_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Snapshot request with options: %@", buf, 0xCu);
    }

    uint64_t v8 = +[NSDate date];
    requestDate = v6->___requestDate;
    v6->___requestDate = (NSDate *)v8;

    objc_storeStrong((id *)&v6->_options, a3);
    uint64_t v10 = +[NSProgress progressWithTotalUnitCount:0];
    progress = v6->_progress;
    v6->_progress = (NSProgress *)v10;

    [(NSProgress *)v6->_progress setCancellable:0];
    [(NSProgress *)v6->_progress setPausable:0];
  }

  return v6;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)beginDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (DSSnapshotFileManager)snapshotFileManager
{
  return (DSSnapshotFileManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)__requestDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)__endDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)__powerAssertionIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSProgress)__atcProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void)set__atcProgress:(id)a3
{
}

- (NSProgress)__cacheDeleteProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 72, 1);
}

- (void)set__cacheDeleteProgress:(id)a3
{
}

- (NSProgress)__archivingProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 80, 1);
}

- (void)set__archivingProgress:(id)a3
{
}

- (NSProgress)__spaceAttributionProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 88, 1);
}

- (void)set__spaceAttributionProgress:(id)a3
{
}

- (NSProgress)__miscProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 96, 1);
}

- (void)set__miscProgress:(id)a3
{
}

- (DSVolumeManager)_volumeManager
{
  return (DSVolumeManager *)objc_getProperty(self, a2, 104, 1);
}

- (DSSnapshotRequestTelemetryReporter)_telemetryReporter
{
  return (DSSnapshotRequestTelemetryReporter *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__telemetryReporter, 0);
  objc_storeStrong((id *)&self->__volumeManager, 0);
  objc_storeStrong((id *)&self->___miscProgress, 0);
  objc_storeStrong((id *)&self->___spaceAttributionProgress, 0);
  objc_storeStrong((id *)&self->___archivingProgress, 0);
  objc_storeStrong((id *)&self->___cacheDeleteProgress, 0);
  objc_storeStrong((id *)&self->___atcProgress, 0);
  objc_storeStrong((id *)&self->___powerAssertionIDs, 0);
  objc_storeStrong((id *)&self->___endDate, 0);
  objc_storeStrong((id *)&self->___requestDate, 0);
  objc_storeStrong((id *)&self->_snapshotFileManager, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end