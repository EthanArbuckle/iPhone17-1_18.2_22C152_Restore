@interface CSTCUPruner
- (CSTCUIntendedInfoProviding)tcuIntendedInfoProvider;
- (CSTCUPruner)init;
- (id)processTCUPackage:(id)a3 requestId:(id)a4;
- (void)processTRPCandidateInfo:(id)a3 requestId:(id)a4 withCompletion:(id)a5;
- (void)registerInfoProviderNode:(id)a3;
@end

@implementation CSTCUPruner

- (void).cxx_destruct
{
}

- (CSTCUIntendedInfoProviding)tcuIntendedInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
  return (CSTCUIntendedInfoProviding *)WeakRetained;
}

- (id)processTCUPackage:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
    *(_DWORD *)buf = 136315650;
    v20 = "-[CSTCUPruner processTCUPackage:requestId:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s tcuPackage:%@ _tcuIntendedInfoProvider:%@", buf, 0x20u);
  }
  id v11 = objc_loadWeakRetained((id *)&self->_tcuIntendedInfoProvider);
  v12 = [v6 speechPackage];
  v13 = [v11 constructTCUIntendedInfoForRequestId:v7 withResultCandidate:v12];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100016430;
  v17[3] = &unk_10024E640;
  id v18 = v13;
  id v14 = v13;
  v15 = [v6 mutatedCopyWithMutator:v17];

  return v15;
}

- (void)processTRPCandidateInfo:(id)a3 requestId:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v26 = (void (**)(id, void *))a5;
  v10 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = v8;
  id obj = [v8 tcuList];
  id v11 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v34;
    p_tcuIntendedInfoProvider = &self->_tcuIntendedInfoProvider;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v17 = (void *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v17;
          id WeakRetained = objc_loadWeakRetained((id *)p_tcuIntendedInfoProvider);
          *(_DWORD *)buf = 136315650;
          v38 = "-[CSTCUPruner processTRPCandidateInfo:requestId:withCompletion:]";
          __int16 v39 = 2112;
          v40 = v16;
          __int16 v41 = 2112;
          id v42 = WeakRetained;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s tcuPackage:%@ _tcuIntendedInfoProvider:%@", buf, 0x20u);
        }
        id v20 = objc_loadWeakRetained((id *)p_tcuIntendedInfoProvider);
        __int16 v21 = [v16 speechPackage];
        id v22 = [v20 constructTCUIntendedInfoForRequestId:v9 withResultCandidate:v21];

        if (v22)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100016798;
          v31[3] = &unk_10024E640;
          id v32 = v22;
          __int16 v23 = [v16 mutatedCopyWithMutator:v31];
          [v10 addObject:v23];
        }
        else
        {
          [v10 addObject:v16];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000167A4;
  v29[3] = &unk_10024E668;
  id v30 = v10;
  id v24 = v10;
  v25 = [v27 mutatedCopyWithMutator:v29];
  if (v26) {
    v26[2](v26, v25);
  }
}

- (void)registerInfoProviderNode:(id)a3
{
}

- (CSTCUPruner)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSTCUPruner;
  return [(CSTCUPruner *)&v3 init];
}

@end