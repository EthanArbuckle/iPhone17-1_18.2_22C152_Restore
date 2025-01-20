@interface AMSDFetchMultiUserRecordZoneTask
- (AMSDCloudDataDatabase)database;
- (AMSDFetchMultiUserRecordZoneTask)initWithHome:(id)a3 homeUser:(id)a4 database:(id)a5 metrics:(id)a6;
- (AMSDHome)home;
- (AMSDHomeUser)user;
- (AMSDMultiUserMetrics)metrics;
- (BOOL)createIfMissing;
- (id)_createRecordZoneWithError:(id *)a3;
- (id)_fetchRecordZoneWithError:(id *)a3;
- (id)performTask;
- (int64_t)qualityOfService;
- (void)enqueBeginMetrics;
- (void)enqueFailedMetrics:(id)a3;
- (void)setCreateIfMissing:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation AMSDFetchMultiUserRecordZoneTask

- (AMSDFetchMultiUserRecordZoneTask)initWithHome:(id)a3 homeUser:(id)a4 database:(id)a5 metrics:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSDFetchMultiUserRecordZoneTask;
  v15 = [(AMSDFetchMultiUserRecordZoneTask *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_createIfMissing = 1;
    objc_storeStrong((id *)&v15->_database, a5);
    objc_storeStrong((id *)&v16->_home, a3);
    objc_storeStrong((id *)&v16->_user, a4);
    v16->_qualityOfService = 17;
    objc_storeStrong((id *)&v16->_metrics, a6);
  }

  return v16;
}

- (id)performTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B624;
  v4[3] = &unk_100112720;
  v4[4] = self;
  v2 = [(AMSDFetchMultiUserRecordZoneTask *)self performTaskWithBlock:v4];
  return v2;
}

- (id)_createRecordZoneWithError:(id *)a3
{
  v5 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  v8 = [v5 createRecordZoneWithRecordZoneName:v7];

  v9 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
  v10 = [v9 saveRecordZone:v8];
  id v11 = [v10 resultWithError:a3];

  if (v11)
  {
    id v12 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
    id v13 = [v12 createRecordWithRecordName:@"AMSHomeParticipant" recordType:@"AMSHomeParticipant" recordZone:v11];

    id v14 = [(AMSDFetchMultiUserRecordZoneTask *)self home];
    v15 = [v14 identifier];
    v16 = [v15 UUIDString];
    [v13 setField:v16 forKey:@"AMSHomeParticipant_HomeIdentifier"];

    v17 = [(AMSDFetchMultiUserRecordZoneTask *)self user];
    objc_super v18 = [v17 identifier];
    v19 = [v18 UUIDString];
    [v13 setField:v19 forKey:@"AMSHomeParticipant_HomeUserIdentifier"];

    v20 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
    v21 = [v20 saveRecord:v13];
    id v44 = 0;
    v22 = [v21 resultWithError:&v44];
    id v23 = v44;

    if (v22)
    {
      id v24 = v11;
      id v25 = v23;
    }
    else
    {
      v26 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v26)
      {
        v26 = +[AMSLogConfig sharedConfig];
      }
      v27 = objc_msgSend(v26, "OSLogObject", a3);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_opt_class();
        v29 = AMSLogKey();
        v30 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = v28;
        __int16 v48 = 2114;
        v49 = v29;
        __int16 v50 = 2114;
        v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create a HomeParticipant record inside a record zone. error = %{public}@", buf, 0x20u);
      }
      v31 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
      v32 = [v11 identifier];
      v45 = v32;
      v33 = +[NSArray arrayWithObjects:&v45 count:1];
      v34 = [v31 deleteRecordZonesWithRecordZoneIdentifiers:v33];
      id v43 = v23;
      v35 = [v34 resultWithError:&v43];
      id v25 = v43;

      if (!v35)
      {
        v36 = +[AMSLogConfig sharedAccountsMultiUserConfig];
        if (!v36)
        {
          v36 = +[AMSLogConfig sharedConfig];
        }
        v37 = [v36 OSLogObject];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = objc_opt_class();
          v39 = AMSLogKey();
          v40 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v38;
          __int16 v48 = 2114;
          v49 = v39;
          __int16 v50 = 2114;
          v51 = v40;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete the record zone. error = %{public}@", buf, 0x20u);
        }
      }
      if (v42)
      {
        id v25 = v25;
        id v24 = 0;
        void *v42 = v25;
      }
      else
      {
        id v24 = 0;
      }
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (void)enqueBeginMetrics
{
  v3 = [(AMSDFetchMultiUserRecordZoneTask *)self metrics];

  if (v3)
  {
    id v5 = [(AMSDFetchMultiUserRecordZoneTask *)self metrics];
    id v4 = [v5 enqueueCloudKitFetchBeganEvent];
  }
}

- (void)enqueFailedMetrics:(id)a3
{
  id v7 = a3;
  id v4 = [(AMSDFetchMultiUserRecordZoneTask *)self metrics];

  if (v4)
  {
    id v5 = [(AMSDFetchMultiUserRecordZoneTask *)self metrics];
    id v6 = [v5 enqueueCloudKitFetchFailedEventWithError:v7];
  }
}

- (id)_fetchRecordZoneWithError:(id *)a3
{
  id v4 = self;
  id v5 = [(AMSDFetchMultiUserRecordZoneTask *)self database];
  id v6 = objc_msgSend(v5, "fetchRecordZonesWithQualityOfService:", -[AMSDFetchMultiUserRecordZoneTask qualityOfService](v4, "qualityOfService"));
  id v7 = [v6 resultWithError:a3];

  if (v7)
  {
    v8 = [v7 results];
    v9 = [v8 allValues];

    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10002C9A0;
    v88[3] = &unk_100112748;
    v88[4] = v4;
    v10 = objc_msgSend(v9, "ams_filterUsingTest:", v88);

    id v11 = [v10 firstObject];
    v73 = v10;
    id v12 = &swift_willThrow_ptr;
    if ((unint64_t)[v10 count] >= 2)
    {
      id v13 = +[AMSLogConfig sharedAccountsMultiUserConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      v70 = a3;
      v71 = v11;
      v78 = v4;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        v16 = AMSLogKey();
        v17 = [(AMSDFetchMultiUserRecordZoneTask *)v4 home];
        objc_super v18 = AMSHashIfNeeded();
        v19 = [(AMSDFetchMultiUserRecordZoneTask *)v4 user];
        v20 = AMSHashIfNeeded();
        v21 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v93 = v15;
        __int16 v94 = 2114;
        v95 = v16;
        __int16 v96 = 2114;
        v97 = v18;
        __int16 v98 = 2114;
        v99 = v20;
        __int16 v100 = 2114;
        v101 = v21;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There are duplicate record zones for a home/user. home = %{public}@ | user = %{public}@ | recordZones = %{public}@", buf, 0x34u);

        a3 = v70;
        id v12 = &swift_willThrow_ptr;

        id v4 = v78;
        id v11 = v71;
      }

      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id obj = v73;
      id v22 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      v69 = v7;
      if (v22)
      {
        id v23 = v22;
        uint64_t v76 = *(void *)v85;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v85 != v76) {
              objc_enumerationMutation(obj);
            }
            id v25 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            v26 = [(AMSDFetchMultiUserRecordZoneTask *)v78 database];
            v27 = [v25 identifier];
            uint64_t v28 = objc_msgSend(v26, "fetchRecordWithName:zoneIdentifier:qualityOfService:", @"AMSHomeParticipant", v27, -[AMSDFetchMultiUserRecordZoneTask qualityOfService](v78, "qualityOfService"));
            v29 = [v28 resultWithError:0];

            v30 = [v29 fieldForKey:@"AMSHomeParticipant_MultiUserToken"];
            objc_opt_class();
            id v31 = 0;
            if (objc_opt_isKindOfClass()) {
              id v31 = v30;
            }

            v32 = [v29 fieldForKey:@"AMSHomeParticipant_MultiUserTokenInvalid"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v33 = v32;
            }
            else {
              id v33 = 0;
            }

            unsigned __int8 v34 = [v33 BOOLValue];
            if ([v31 length] && (v34 & 1) == 0)
            {
              id v35 = v25;

              id v11 = v35;
              id v7 = v69;
              a3 = v70;
              goto LABEL_24;
            }
          }
          id v23 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
          if (v23) {
            continue;
          }
          break;
        }
        id v7 = v69;
        a3 = v70;
        id v11 = v71;
LABEL_24:
        id v4 = v78;
        id v12 = &swift_willThrow_ptr;
      }

      v36 = [(AMSDFetchMultiUserRecordZoneTask *)v4 database];
      unsigned int v37 = [v36 isPrivateDatabase];

      if (v37)
      {
        id v38 = [obj mutableCopy];
        v72 = v11;
        [v38 removeObject:v11];
        v39 = [v12[175] sharedAccountsMultiUserConfig];
        if (!v39)
        {
          v39 = [v12[175] sharedConfig];
        }
        v40 = objc_msgSend(v39, "OSLogObject", v69);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = objc_opt_class();
          v42 = AMSLogKey();
          id v43 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138543874;
          uint64_t v93 = v41;
          __int16 v94 = 2114;
          v95 = v42;
          __int16 v96 = 2114;
          v97 = v43;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Removing duplicate record zones. duplicateRecordZones = %{public}@", buf, 0x20u);
        }
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id obja = v38;
        id v44 = [obja countByEnumeratingWithState:&v80 objects:v90 count:16];
        if (v44)
        {
          id v45 = v44;
          uint64_t v77 = *(void *)v81;
          do
          {
            for (j = 0; j != v45; j = (char *)j + 1)
            {
              if (*(void *)v81 != v77) {
                objc_enumerationMutation(obja);
              }
              uint64_t v47 = *(void **)(*((void *)&v80 + 1) + 8 * (void)j);
              __int16 v48 = [(AMSDFetchMultiUserRecordZoneTask *)v4 database];
              v49 = [v47 identifier];
              v89 = v49;
              __int16 v50 = +[NSArray arrayWithObjects:&v89 count:1];
              v51 = [v48 deleteRecordZonesWithRecordZoneIdentifiers:v50];
              v52 = [v51 binaryPromiseAdapter];
              id v79 = 0;
              unsigned __int8 v53 = [v52 resultWithError:&v79];
              id v54 = v79;

              if ((v53 & 1) == 0)
              {
                v55 = +[AMSLogConfig sharedAccountsMultiUserConfig];
                if (!v55)
                {
                  v55 = +[AMSLogConfig sharedConfig];
                }
                v56 = [v55 OSLogObject];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v57 = objc_opt_class();
                  v58 = AMSLogKey();
                  v59 = AMSHashIfNeeded();
                  v60 = AMSHashIfNeeded();
                  *(_DWORD *)buf = 138544130;
                  uint64_t v93 = v57;
                  __int16 v94 = 2114;
                  v95 = v58;
                  __int16 v96 = 2114;
                  v97 = v59;
                  __int16 v98 = 2114;
                  v99 = v60;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove a record zone. recordZone = %{public}@ | error = %{public}@", buf, 0x2Au);
                }
              }

              id v4 = v78;
            }
            id v45 = [obja countByEnumeratingWithState:&v80 objects:v90 count:16];
          }
          while (v45);
        }

        id v7 = v69;
        a3 = v70;
        id v11 = v72;
        id v12 = &swift_willThrow_ptr;
      }
    }
    v61 = objc_msgSend(v12[175], "sharedAccountsMultiUserConfig", v69);
    if (!v61)
    {
      v61 = [v12[175] sharedConfig];
    }
    v62 = [v61 OSLogObject];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = objc_opt_class();
      AMSLogKey();
      v65 = v64 = v11;
      AMSHashIfNeeded();
      v67 = v66 = v7;
      *(_DWORD *)buf = 138543874;
      uint64_t v93 = v63;
      __int16 v94 = 2114;
      v95 = v65;
      __int16 v96 = 2114;
      v97 = v67;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished fetching record zone: %{public}@", buf, 0x20u);

      id v7 = v66;
      id v11 = v64;
    }

    if (a3 && !v11)
    {
      AMSCustomError();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)createIfMissing
{
  return self->_createIfMissing;
}

- (void)setCreateIfMissing:(BOOL)a3
{
  self->_createIfMissing = a3;
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (AMSDHome)home
{
  return self->_home;
}

- (AMSDHomeUser)user
{
  return self->_user;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end