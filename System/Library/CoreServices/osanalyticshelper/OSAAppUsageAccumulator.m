@interface OSAAppUsageAccumulator
- (NSDictionary)versions;
- (OSAAppUsageAccumulator)initWithStartDate:(id)a3 endDate:(id)a4 targetAppVersions:(id)a5 firstPartyBundleIDs:(id)a6;
- (void)addEvent:(id)a3;
@end

@implementation OSAAppUsageAccumulator

- (OSAAppUsageAccumulator)initWithStartDate:(id)a3 endDate:(id)a4 targetAppVersions:(id)a5 firstPartyBundleIDs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)OSAAppUsageAccumulator;
  v15 = [(OSAAccumulator *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
    objc_storeStrong((id *)&v16->_targetAppVersions, a5);
    objc_storeStrong((id *)&v16->_firstPartyBundleIDs, a6);
    uint64_t v17 = +[NSMutableSet set];
    denyList = v16->_denyList;
    v16->_denyList = (NSMutableSet *)v17;

    if (v13)
    {
      v19 = 0;
    }
    else
    {
      v19 = +[NSMutableDictionary dictionary];
    }
    objc_storeStrong((id *)&v16->_versions, v19);
    if (!v13) {
  }
    }
  return v16;
}

- (NSDictionary)versions
{
  if (self->_versions)
  {
    v2 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:");
  }
  else
  {
    v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  v6 = +[_DKApplicationMetadataKey shortVersionString];
  v7 = [v5 objectForKeyedSubscript:v6];
  v8 = [v4 metadata];
  v9 = +[_DKApplicationMetadataKey exactBundleVersion];
  v10 = [v8 objectForKeyedSubscript:v9];
  sub_10000DBBC((uint64_t)v7, (uint64_t)v10);
  id v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  id v12 = [(OSAAccumulator *)self targetKey];
  if (v12)
  {
    id v13 = [(OSAAccumulator *)self targetKey];
    id v14 = [v4 stringValue];
    unsigned int v15 = [v13 isEqualToString:v14];

    if (!v15) {
      goto LABEL_40;
    }
  }
  denyList = self->_denyList;
  uint64_t v17 = [v4 stringValue];
  LOBYTE(denyList) = [(NSMutableSet *)denyList containsObject:v17];

  if (denyList) {
    goto LABEL_40;
  }
  if (!v11)
  {
    v23 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v4 stringValue];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Omitting %{public}@ because version is missing", buf, 0xCu);
    }
    v25 = self->_denyList;
    v20 = [v4 stringValue];
    [(NSMutableSet *)v25 addObject:v20];
    goto LABEL_39;
  }
  targetAppVersions = self->_targetAppVersions;
  if (!targetAppVersions)
  {
    versions = self->_versions;
    v27 = [v4 stringValue];
    v28 = [(NSMutableDictionary *)versions objectForKeyedSubscript:v27];

    if (([v11 isEqualToString:v28] & 1) == 0)
    {
      if (v28)
      {
        v29 = OSAStabilityMonitorLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = [v4 stringValue];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          *(_WORD *)&buf[22] = 2114;
          v70 = v11;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Migrating version for %{public}@: %{public}@ to %{public}@", buf, 0x20u);
        }
        v31 = [(OSAAccumulator *)self totals];
        v32 = [v4 stringValue];
        [v31 removeObjectForKey:v32];
      }
      v33 = self->_versions;
      v34 = [v4 stringValue];
      [(NSMutableDictionary *)v33 setObject:v11 forKeyedSubscript:v34];
    }
    goto LABEL_21;
  }
  v19 = [v4 stringValue];
  v20 = [(NSDictionary *)targetAppVersions objectForKeyedSubscript:v19];

  if (!v20)
  {
LABEL_36:
    v55 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = [v4 stringValue];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v70 = v11;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Omitting %{public}@ because its version changed from the baseline (%{public}@) to %{public}@", buf, 0x20u);
    }
    v57 = self->_denyList;
    v58 = [v4 stringValue];
    [(NSMutableSet *)v57 addObject:v58];

LABEL_39:
LABEL_40:
    v59 = [(OSAAccumulator *)self totals];
    v60 = [v4 stringValue];
    [v59 removeObjectForKey:v60];

    v61 = self->_versions;
    p_super = [v4 stringValue];
    [(NSMutableDictionary *)v61 removeObjectForKey:p_super];
    goto LABEL_41;
  }
  firstPartyBundleIDs = self->_firstPartyBundleIDs;
  v22 = [v4 stringValue];
  if (![(NSSet *)firstPartyBundleIDs containsObject:v22])
  {
    unsigned __int8 v35 = [v11 isEqualToString:v20];

    if (v35) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }

LABEL_20:
LABEL_21:
  v36 = [v4 startDate];
  if (!v36
    || ([v4 endDate],
        v37 = objc_claimAutoreleasedReturnValue(),
        BOOL v38 = v37 == 0,
        v37,
        v36,
        v38))
  {
    p_super = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [v4 stringValue];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Skipping event for %{public}@ due to missing start or end date", buf, 0xCu);
    }
  }
  else
  {
    p_super = [v4 startDate];
    v40 = [v4 startDate];
    [v40 timeIntervalSinceDate:self->_startDate];
    BOOL v42 = v41 < 0.0;

    if (v42)
    {
      v43 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_10001524C(v4);
      }

      v44 = self->_startDate;
      p_super = &v44->super;
    }
    v45 = [v4 endDate];
    v46 = [v4 endDate];
    [v46 timeIntervalSinceDate:self->_endDate];
    BOOL v48 = v47 > 0.0;

    if (v48)
    {
      v49 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_10001519C(v4);
      }

      v50 = self->_endDate;
      v45 = v50;
    }
    [v45 timeIntervalSinceDate:p_super];
    if (v51 >= 0.0)
    {
      v52 = objc_alloc_init((Class)NSDateComponents);
      [v52 setHour:0];
      [v52 setMinute:0];
      [v52 setSecond:0];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v70 = sub_10000587C;
      v71 = sub_10000586C;
      v62 = p_super;
      v72 = v62;
      v63 = [(OSAAccumulator *)self calendar];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10000DC1C;
      v64[3] = &unk_100020F08;
      id v65 = v45;
      v66 = self;
      v68 = buf;
      id v67 = v4;
      [v63 enumerateDatesStartingAfterDate:v62 matchingComponents:v52 options:1024 usingBlock:v64];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v52 = OSAStabilityMonitorLogDomain();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = [v4 stringValue];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = p_super;
        *(_WORD *)&buf[22] = 2114;
        v70 = (uint64_t (*)(uint64_t, uint64_t))v45;
        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Skipping event for %{public}@ with start date %{public}@ after end date %{public}@", buf, 0x20u);
      }
    }
  }
LABEL_41:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
  objc_storeStrong((id *)&self->_firstPartyBundleIDs, 0);
  objc_storeStrong((id *)&self->_targetAppVersions, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end