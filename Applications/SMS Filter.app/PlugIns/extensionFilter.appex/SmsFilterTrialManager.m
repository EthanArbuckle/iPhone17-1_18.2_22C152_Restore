@interface SmsFilterTrialManager
- (NSString)experimentID;
- (NSString)smsFilterDirectory;
- (NSString)treatmentID;
- (NSString)trialNamespaceName;
- (OS_os_log)log;
- (SmsFilterTrialManager)initWithDefaultsDomain:(unsigned int)a3;
- (TRIClient)trialClient;
- (TRITrackingId)trialTrackingID;
- (double)loadTrialPromoThreshold;
- (double)loadTrialTransThreshold;
- (id)getRegexFileNameWithPath;
- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4;
- (id)loadTrialBasicModelByDeletingExistingModel:(BOOL)a3;
- (id)loadTrialMainModelByDeletingExistingModel:(BOOL)a3;
- (id)loadTrialModelByDeletingExistingModel:(id)a3;
- (id)loadTrialSubClassificationModelByDeletingExistingModel:(BOOL)a3;
- (id)trialFactor:(id)a3;
- (int64_t)loadTrialModelTransitionTimer;
- (os_unfair_lock_s)lock;
- (unsigned)namespaceId;
- (void)loadTrialUpdates;
- (void)setExperimentID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNamespaceId:(unsigned int)a3;
- (void)setSmsFilterDirectory:(id)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialNamespaceName:(id)a3;
- (void)setTrialTrackingID:(id)a3;
@end

@implementation SmsFilterTrialManager

- (SmsFilterTrialManager)initWithDefaultsDomain:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)SmsFilterTrialManager;
  v4 = [(SmsFilterTrialManager *)&v18 init];
  if (!v4) {
    -[SmsFilterTrialManager initWithDefaultsDomain:]();
  }
  v5 = v4;
  v4->_lock._os_unfair_lock_opaque = 0;
  uint64_t v6 = trialLogHandle();
  log = v5->_log;
  v5->_log = (OS_os_log *)v6;

  uint64_t v8 = +[TRIClient clientWithIdentifier:245];
  trialClient = v5->_trialClient;
  v5->_trialClient = (TRIClient *)v8;

  if (!v5->_trialClient) {
    -[SmsFilterTrialManager initWithDefaultsDomain:]();
  }
  v10 = v5->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v5->_trialClient;
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
  }
  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%d" v3];
  v19[0] = @"/var/mobile/Library/SmsFilter";
  v19[1] = v12;
  v13 = +[NSArray arrayWithObjects:v19 count:2];
  v14 = +[NSURL fileURLWithPathComponents:v13];
  uint64_t v15 = [v14 path];
  smsFilterDirectory = v5->_smsFilterDirectory;
  v5->_smsFilterDirectory = (NSString *)v15;

  v5->_namespaceId = v3;
  [(SmsFilterTrialManager *)v5 loadTrialUpdates];

  return v5;
}

- (void)loadTrialUpdates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (TRITrackingId *)[(TRIClient *)self->_trialClient newTrackingId];
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v4;

  uint64_t v6 = +[TRINamespace namespaceNameFromId:self->_namespaceId];
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v6;

  uint64_t v8 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:self->_trialNamespaceName];
  treatmentID = self->_treatmentID;
  self->_treatmentID = v8;

  v10 = [(TRIClient *)self->_trialClient experimentIdWithNamespaceName:self->_trialNamespaceName];
  experimentID = self->_experimentID;
  self->_experimentID = v10;

  os_unfair_lock_unlock(p_lock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_trialTrackingID;
    uint64_t v15 = self->_experimentID;
    v14 = self->_trialNamespaceName;
    int v16 = 138412802;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v14;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "loadTrialUpdates: _trialTrackingID = %@, _trialNamespaceName=%@, _experimentID=%@ \n", (uint8_t *)&v16, 0x20u);
  }
}

- (id)loadTrialMainModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial main model", v14, 2u);
  }
  uint64_t v6 = [(SmsFilterTrialManager *)self trialFactor:@"trialMainModel"];
  v7 = v6;
  if (v6
    && ([v6 fileValue],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [v7 fileValue];
    v11 = [v10 path];
    id v12 = [(SmsFilterTrialManager *)self loadModelFromPath:v11 deleteExistingFiles:v3];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)loadTrialBasicModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial basic model", v14, 2u);
  }
  uint64_t v6 = [(SmsFilterTrialManager *)self trialFactor:@"trialBasicModel"];
  v7 = v6;
  if (v6
    && ([v6 fileValue],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [v7 fileValue];
    v11 = [v10 path];
    id v12 = [(SmsFilterTrialManager *)self loadModelFromPath:v11 deleteExistingFiles:v3];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)loadTrialSubClassificationModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial sub-classification model", v14, 2u);
  }
  uint64_t v6 = [(SmsFilterTrialManager *)self trialFactor:@"subClassModel"];
  v7 = v6;
  if (v6
    && ([v6 fileValue],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    v10 = [v7 fileValue];
    v11 = [v10 path];
    id v12 = [(SmsFilterTrialManager *)self loadModelFromPath:v11 deleteExistingFiles:v3];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)loadTrialModelByDeletingExistingModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading model from : %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v6 = [(SmsFilterTrialManager *)self loadModelFromPath:v4 deleteExistingFiles:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)getRegexFileNameWithPath
{
  BOOL v3 = [(SmsFilterTrialManager *)self trialFactor:@"trialRegexFile"];
  id v4 = v3;
  if (!v3)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v14 = log;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to get file from null path", (uint8_t *)&v16, 2u);
    }
LABEL_16:
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  v5 = [v3 fileValue];
  uint64_t v6 = [v5 path];

  v7 = self->_log;
  BOOL v8 = os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v16) = 0;
      v14 = v7;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    int v16 = 138412546;
    v17 = v4;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "regex file name: %@, %@", (uint8_t *)&v16, 0x16u);
  }
  if (([v6 isAbsolutePath] & 1) == 0)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 pathForResource:v6 ofType:0];

    v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", (uint8_t *)&v16, 0xCu);
    }
    if (v10)
    {
      id v12 = v10;

      uint64_t v6 = v12;
    }
  }
LABEL_17:

  return v6;
}

- (double)loadTrialTransThreshold
{
  BOOL v3 = [(SmsFilterTrialManager *)self trialFactor:@"transThreshold"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trans Threshold value is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialPromoThreshold
{
  BOOL v3 = [(SmsFilterTrialManager *)self trialFactor:@"promoThreshold"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Promo Threshold value is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (int64_t)loadTrialModelTransitionTimer
{
  BOOL v3 = [(SmsFilterTrialManager *)self trialFactor:@"transitionTimer"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      int v8 = 134217984;
      id v9 = [v3 longValue];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Minimum retry timer for model transition %lld", (uint8_t *)&v8, 0xCu);
    }
    id v6 = [v3 longValue];
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (id)trialFactor:(id)a3
{
  return [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = (void *)os_transaction_create();
  if (v6)
  {
    v74 = v7;
    if (([v6 isAbsolutePath] & 1) == 0)
    {
      int v8 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [v8 pathForResource:v6 ofType:0];

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v9)
      {
        id v11 = v9;

        id v6 = v11;
      }
    }
    id v12 = +[NSFileManager defaultManager];
    v13 = [v6 lastPathComponent];
    v14 = +[NSString stringWithFormat:@"%@%@", v13, @"c"];

    char v83 = 0;
    v93[0] = self->_smsFilterDirectory;
    v93[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v93 count:2];
    int v16 = +[NSURL fileURLWithPathComponents:v15];

    if (v4)
    {
      v17 = [v16 path];
      __int16 v18 = self->_log;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
      }
      id v82 = 0;
      unsigned __int8 v19 = [v12 removeItemAtPath:v17 error:&v82];
      id v20 = v82;
      if ((v19 & 1) == 0)
      {
        v21 = self->_log;
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v86 = (uint64_t)v17;
          __int16 v87 = 2112;
          id v88 = v20;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v20 = 0;
    }
    v24 = [v16 path];
    unsigned int v25 = [v12 fileExistsAtPath:v24 isDirectory:&v83];

    if (v25)
    {
      id v81 = v20;
      id v26 = +[MLModel modelWithContentsOfURL:v16 error:&v81];
      id v27 = v81;

      if (v27)
      {
        v28 = self->_log;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v86 = (uint64_t)v16;
          __int16 v87 = 2112;
          id v88 = v27;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        id v23 = 0;
      }
      else
      {
        id v26 = v26;
        id v23 = v26;
      }
      goto LABEL_57;
    }
    v72 = v14;
    v29 = [v12 temporaryDirectory];
    v30 = [v29 path];
    v92[0] = v30;
    uint64_t v31 = +[NSUUID UUID];
    v32 = [(id)v31 UUIDString];
    v92[1] = v32;
    +[NSArray arrayWithObjects:v92 count:2];
    v33 = v73 = v12;
    id v26 = +[NSString pathWithComponents:v33];

    id v12 = v73;
    id v80 = v20;
    LOBYTE(v31) = [v73 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v80];
    id v27 = v80;

    if ((v31 & 1) == 0)
    {
      v42 = self->_log;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v86 = (uint64_t)v26;
        __int16 v87 = 2112;
        id v88 = v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
      }
      id v23 = 0;
      double v7 = v74;
      v14 = v72;
      goto LABEL_57;
    }
    v91[0] = v26;
    uint64_t v34 = [v6 lastPathComponent];
    v91[1] = v34;
    v35 = +[NSArray arrayWithObjects:v91 count:2];
    v36 = +[NSURL fileURLWithPathComponents:v35];

    v37 = v36;
    v38 = [v36 path];
    id v79 = v27;
    LOBYTE(v34) = [v73 copyItemAtPath:v6 toPath:v38 error:&v79];
    id v39 = v79;

    if (v34)
    {

      v14 = v72;
      if ([v73 fileExistsAtPath:self->_smsFilterDirectory isDirectory:&v83])
      {
        id v40 = 0;
        v41 = v37;
LABEL_35:

        smsFilterDirectory = self->_smsFilterDirectory;
        v47 = +[NSArray arrayWithObjects:&smsFilterDirectory count:1];
        v48 = +[NSURL fileURLWithPathComponents:v47];

        v49 = +[MLCompilerOptions defaultOptions];
        id v77 = 0;
        v70 = +[MLCompiler compileSpecificationAtURL:v41 toURL:v48 options:v49 error:&v77];
        id v44 = v77;

        v71 = v48;
        if (v44)
        {
          v50 = self->_log;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v86 = (uint64_t)v41;
            __int16 v87 = 2112;
            id v88 = v44;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v50, OS_LOG_TYPE_DEFAULT, "Failed to compile model: %@ -- %@", buf, 0x16u);
          }
          id v23 = 0;
          uint64_t v51 = (uint64_t)v16;
          id v12 = v73;
          double v7 = v74;
        }
        else
        {
          v52 = [v41 path];
          v53 = [v52 lastPathComponent];
          v54 = [v53 stringByDeletingPathExtension];

          v69 = v54;
          v68 = [v54 stringByAppendingPathExtension:@"mlmodelc"];
          uint64_t v51 = [v48 URLByAppendingPathComponent:];

          id v76 = 0;
          v55 = +[MLModel modelWithContentsOfURL:v51 error:&v76];
          id v56 = v76;
          if (v56)
          {
            id v44 = v56;
            v57 = self->_log;
            id v12 = v73;
            double v7 = v74;
            if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v86 = v51;
              __int16 v87 = 2112;
              id v88 = v44;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v57, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
            }
            id v23 = 0;
          }
          else
          {
            id v75 = 0;
            id v12 = v73;
            unsigned __int8 v60 = [v73 removeItemAtPath:v26 error:&v75];
            id v44 = v75;
            if ((v60 & 1) == 0)
            {
              v61 = self->_log;
              if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v86 = (uint64_t)v26;
                __int16 v87 = 2112;
                id v88 = v44;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v61, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
              }
            }
            v62 = self->_log;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              v63 = v62;
              v64 = [v55 modelDescription];
              v65 = [v64 metadata];
              v66 = [v65 objectForKeyedSubscript:MLModelVersionStringKey];
              *(_DWORD *)buf = 138412546;
              uint64_t v86 = (uint64_t)v55;
              __int16 v87 = 2112;
              id v88 = v66;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "trial_model = %@ with version:%@\n", buf, 0x16u);

              v14 = v72;
              id v12 = v73;
            }
            id v23 = v55;
            double v7 = v74;
          }
        }
        int v16 = (void *)v51;
        goto LABEL_56;
      }
      id v12 = v73;
      v45 = self->_smsFilterDirectory;
      id v78 = 0;
      unsigned __int8 v46 = [v73 createDirectoryAtPath:v45 withIntermediateDirectories:1 attributes:0 error:&v78];
      id v40 = v78;
      v41 = v37;
      if (v46) {
        goto LABEL_35;
      }
      v58 = self->_log;
      if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = self->_smsFilterDirectory;
        *(_DWORD *)buf = 138412546;
        uint64_t v86 = (uint64_t)v59;
        __int16 v87 = 2112;
        id v44 = v40;
        id v88 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v58, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
        id v23 = 0;
        double v7 = v74;
        goto LABEL_56;
      }
      id v23 = 0;
      double v7 = v74;
    }
    else
    {
      id v40 = v39;
      v43 = self->_log;
      double v7 = v74;
      v14 = v72;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v86 = (uint64_t)v6;
        __int16 v87 = 2112;
        v41 = v37;
        id v88 = v37;
        __int16 v89 = 2112;
        id v44 = v40;
        id v90 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
        id v23 = 0;
        id v12 = v73;
LABEL_56:

        id v27 = v44;
LABEL_57:

        goto LABEL_58;
      }
      id v23 = 0;
      id v12 = v73;
      v41 = v37;
    }
    id v44 = v40;
    goto LABEL_56;
  }
  v22 = self->_log;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  id v23 = 0;
LABEL_58:

  return v23;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (unsigned)namespaceId
{
  return self->_namespaceId;
}

- (void)setNamespaceId:(unsigned int)a3
{
  self->_namespaceId = a3;
}

- (NSString)smsFilterDirectory
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSmsFilterDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smsFilterDirectory, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)initWithDefaultsDomain:.cold.1()
{
}

- (void)initWithDefaultsDomain:.cold.2()
{
}

@end