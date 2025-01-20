@interface SGMIConfig
+ (id)_defaultConfig;
+ (id)defaultConfig;
- (BOOL)shouldAnalyzeBody;
- (NSDictionary)detectors;
- (NSDictionary)followUpWarningsParameters;
- (NSRegularExpression)attachmentLinkDetectionRegex;
- (SGMIConfig)initWithAssetAttachmentDictionary:(id)a3 attachmentLinkDetection:(id)a4 recipientConservativeDictionary:(id)a5 recipientDictionary:(id)a6 nicknameDictionary:(id)a7 followUpOnOutgoingMailsQuestionsDictionary:(id)a8 followUpOnOutgoingMailsAsksDictionary:(id)a9 followUpOnIncomingMailsDictionary:(id)a10 bodyAnalysisSamplingFactor:(float)a11 defaultTimeIntervalToStartWarningExposition:(double)a12 defaultTimeIntervalForAWarning:(double)a13 defaultTimeIntervalToEndWarningExposition:(double)a14 followUpWarningsParameters:(id)a15;
- (double)defaultTimeIntervalForAWarning;
- (double)defaultTimeIntervalToEndWarningExposition;
- (double)defaultTimeIntervalToStartWarningExposition;
- (float)bodyAnalysisSamplingFactor;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
@end

@implementation SGMIConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpWarningsParameters, 0);
  objc_storeStrong((id *)&self->_attachmentLinkDetectionRegex, 0);
  objc_storeStrong((id *)&self->_lazyDetectors, 0);
}

- (double)defaultTimeIntervalToEndWarningExposition
{
  return self->_defaultTimeIntervalToEndWarningExposition;
}

- (double)defaultTimeIntervalForAWarning
{
  return self->_defaultTimeIntervalForAWarning;
}

- (double)defaultTimeIntervalToStartWarningExposition
{
  return self->_defaultTimeIntervalToStartWarningExposition;
}

- (NSDictionary)followUpWarningsParameters
{
  return self->_followUpWarningsParameters;
}

- (float)bodyAnalysisSamplingFactor
{
  return self->_bodyAnalysisSamplingFactor;
}

- (NSRegularExpression)attachmentLinkDetectionRegex
{
  return self->_attachmentLinkDetectionRegex;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = [NSString alloc];
  v5 = [(SGMIConfig *)self detectors];
  v6 = objc_msgSend(v4, "initWithFormat:", @"<SGMIConfig (%tu languages)>\n", objc_msgSend(v5, "count"));
  [v3 appendString:v6];

  v7 = [(SGMIConfig *)self detectors];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __25__SGMIConfig_description__block_invoke;
  v24 = &unk_1E65BB360;
  id v8 = v3;
  id v25 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v21];

  id v9 = [NSString alloc];
  v10 = [(NSRegularExpression *)self->_attachmentLinkDetectionRegex pattern];
  v11 = (void *)[v9 initWithFormat:@"attachmentLinkDetectionRegex: %@\n", v10, v21, v22, v23, v24];
  [v8 appendString:v11];

  v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"defaultTimeIntervalToStartWarningExposition: %.0f\n", *(void *)&self->_defaultTimeIntervalToStartWarningExposition);
  [v8 appendString:v12];

  v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"defaultTimeIntervalForAWarning: %.0f\n", *(void *)&self->_defaultTimeIntervalForAWarning);
  [v8 appendString:v13];

  v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"defaultTimeIntervalToEndWarningExposition: %.0f\n", *(void *)&self->_defaultTimeIntervalToEndWarningExposition);
  [v8 appendString:v14];

  v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"bodyAnalysisSamplingFactor: %.0f%%\n", self->_bodyAnalysisSamplingFactor * 100.0);
  [v8 appendString:v15];

  id v16 = [NSString alloc];
  BOOL v17 = +[SGMIEnablementConfig logWarningSignatureStats];
  v18 = @"disabled";
  if (v17) {
    v18 = @"enabled";
  }
  v19 = (void *)[v16 initWithFormat:@"logWarningSignatureStats: %@", v18];
  [v8 appendString:v19];

  return v8;
}

void __25__SGMIConfig_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  id v10 = [v6 description];

  id v9 = (void *)[v8 initWithFormat:@"  %@: %@\n", v7, v10];
  [v4 appendString:v9];
}

- (BOOL)shouldAnalyzeBody
{
  return (float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < self->_bodyAnalysisSamplingFactor;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = [(SGMIConfig *)self detectors];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)detectors
{
  return (NSDictionary *)[(_PASLazyPurgeableResult *)self->_lazyDetectors result];
}

- (SGMIConfig)initWithAssetAttachmentDictionary:(id)a3 attachmentLinkDetection:(id)a4 recipientConservativeDictionary:(id)a5 recipientDictionary:(id)a6 nicknameDictionary:(id)a7 followUpOnOutgoingMailsQuestionsDictionary:(id)a8 followUpOnOutgoingMailsAsksDictionary:(id)a9 followUpOnIncomingMailsDictionary:(id)a10 bodyAnalysisSamplingFactor:(float)a11 defaultTimeIntervalToStartWarningExposition:(double)a12 defaultTimeIntervalForAWarning:(double)a13 defaultTimeIntervalToEndWarningExposition:(double)a14 followUpWarningsParameters:(id)a15
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v25 = a4;
  id v26 = a5;
  id v27 = a6;
  id v28 = a7;
  id v51 = a8;
  id v29 = a9;
  id v30 = a10;
  id v50 = a15;
  v62.receiver = self;
  v62.super_class = (Class)SGMIConfig;
  v31 = [(SGMIConfig *)&v62 init];
  if (!v31) {
    goto LABEL_11;
  }
  id v32 = objc_alloc(MEMORY[0x1E4F93B60]);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __429__SGMIConfig_initWithAssetAttachmentDictionary_attachmentLinkDetection_recipientConservativeDictionary_recipientDictionary_nicknameDictionary_followUpOnOutgoingMailsQuestionsDictionary_followUpOnOutgoingMailsAsksDictionary_followUpOnIncomingMailsDictionary_bodyAnalysisSamplingFactor_defaultTimeIntervalToStartWarningExposition_defaultTimeIntervalForAWarning_defaultTimeIntervalToEndWarningExposition_followUpWarningsParameters___block_invoke;
  v54[3] = &unk_1E65BB338;
  id v55 = v52;
  id v48 = v27;
  id v56 = v27;
  id v57 = v51;
  id v58 = v29;
  id v59 = v30;
  id v47 = v28;
  id v60 = v28;
  id v49 = v26;
  id v61 = v26;
  uint64_t v33 = [v32 initWithBlock:v54 idleTimeout:5.0];
  lazyDetectors = v31->_lazyDetectors;
  v31->_lazyDetectors = (_PASLazyPurgeableResult *)v33;

  v35 = (void *)MEMORY[0x1CB79B230]();
  id v36 = [NSString alloc];
  id v37 = v25 ? v25 : (id)MEMORY[0x1E4F1CBF0];
  v38 = objc_msgSend(v37, "_pas_componentsJoinedByString:", @"|(?:"));
  v39 = [v38 stringByReplacingOccurrencesOfString:@"." withString:@"\\."];
  v40 = (void *)[v36 initWithFormat:@"https?://.{0,16}(?:%@)", v39];

  id v53 = 0;
  uint64_t v41 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v40 options:1 error:&v53];
  id v42 = v53;
  if (v41)
  {
    attachmentLinkDetectionRegex = v31->_attachmentLinkDetectionRegex;
    v31->_attachmentLinkDetectionRegex = (NSRegularExpression *)v41;

    objc_storeStrong((id *)&v31->_followUpWarningsParameters, a15);
    v31->_bodyAnalysisSamplingFactor = a11;
    v31->_defaultTimeIntervalToStartWarningExposition = a12;
    v31->_defaultTimeIntervalForAWarning = a13;
    v31->_defaultTimeIntervalToEndWarningExposition = a14;
  }
  else
  {
    v44 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v64 = v42;
      _os_log_fault_impl(&dword_1CA650000, v44, OS_LOG_TYPE_FAULT, "SGMIConfig: Invalid attachmentLinkDetectionRegex (%@).", buf, 0xCu);
    }
  }
  id v26 = v49;

  id v28 = v47;
  id v27 = v48;
  if (!v41) {
    v45 = 0;
  }
  else {
LABEL_11:
  }
    v45 = v31;

  return v45;
}

id __429__SGMIConfig_initWithAssetAttachmentDictionary_attachmentLinkDetection_recipientConservativeDictionary_recipientDictionary_nicknameDictionary_followUpOnOutgoingMailsQuestionsDictionary_followUpOnOutgoingMailsAsksDictionary_followUpOnIncomingMailsDictionary_bodyAnalysisSamplingFactor_defaultTimeIntervalToStartWarningExposition_defaultTimeIntervalForAWarning_defaultTimeIntervalToEndWarningExposition_followUpWarningsParameters___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = (id)objc_opt_new();
  v2 = objc_opt_new();
  v3 = [a1[4] allKeys];
  [v2 addObjectsFromArray:v3];

  id v4 = [a1[5] allKeys];
  [v2 addObjectsFromArray:v4];

  v5 = [a1[6] allKeys];
  [v2 addObjectsFromArray:v5];

  id v6 = [a1[7] allKeys];
  [v2 addObjectsFromArray:v6];

  id v7 = [a1[8] allKeys];
  [v2 addObjectsFromArray:v7];

  id v8 = [a1[9] allKeys];
  [v2 addObjectsFromArray:v8];

  id v26 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v2;
  uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v28)
  {
    uint64_t v24 = *(void *)v32;
    id v25 = a1;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v29 = [SGMIWarningsDetectors alloc];
        id v30 = [a1[4] objectForKeyedSubscript:v10];
        v11 = [a1[10] objectForKeyedSubscript:v10];
        uint64_t v12 = (uint64_t)v11;
        if (!v11)
        {
          uint64_t v12 = [a1[10] objectForKeyedSubscript:@"en"];
          v23 = (void *)v12;
        }
        v13 = [a1[5] objectForKeyedSubscript:v10];
        v14 = [a1[9] objectForKeyedSubscript:v10];
        uint64_t v15 = (uint64_t)v14;
        if (!v14)
        {
          uint64_t v15 = [a1[9] objectForKeyedSubscript:@"en"];
          uint64_t v22 = (void *)v15;
        }
        id v16 = [a1[6] objectForKeyedSubscript:v10];
        BOOL v17 = [a1[7] objectForKeyedSubscript:v10];
        v18 = [a1[8] objectForKeyedSubscript:v10];
        v19 = [(SGMIWarningsDetectors *)v29 initWithAttachmentDictionary:v30 recipientConservativeDictionary:v12 recipientDictionary:v13 nicknameDictionary:v15 followUpOnOutgoingMailsQuestionsDictionary:v16 followUpOnOutgoingMailsAsksDictionary:v17 followUpOnIncomingMailsDictionary:v18 compiledRegexCache:v26];
        [v27 setObject:v19 forKeyedSubscript:v10];

        if (!v14) {
        if (!v11)
        }

        a1 = v25;
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v28);
  }

  return v27;
}

+ (id)_defaultConfig
{
  v2 = +[SGMITrialClientWrapper sharedInstance];
  v3 = [v2 attachmentDetectionRegexes];
  if (v3)
  {
    id v4 = [v2 attachmentLinkDetection];
    if (!v4)
    {
      v5 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v5, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get attachmentLinkDetection from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_65;
    }
    v5 = [v2 conservativeRecipientDetection];
    if (!v5)
    {
      id v6 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v6, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get conservativeRecipientDetection from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_64;
    }
    id v6 = [v2 recipientConservativeDetectionRegexes];
    if (!v6)
    {
      id v7 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v7, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get recipientConservativeDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_63;
    }
    id v7 = [v2 recipientDetectionRegexes];
    if (!v7)
    {
      id v8 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v8, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get recipientDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_62;
    }
    id v8 = [v2 nicknameDetectionRegexes];
    if (!v8)
    {
      id v9 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get nicknameDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_61;
    }
    id v9 = [v2 followUpOnOutgoingMailsQuestionsDetectionRegexes];
    if (!v9)
    {
      uint64_t v10 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v10, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnOutgoingMailsQuestionsDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_60;
    }
    uint64_t v10 = [v2 followUpOnOutgoingMailsAsksDetectionRegexes];
    if (!v10)
    {
      log = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, log, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnOutgoingMailsAsksDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_59;
    }
    log = [v2 followUpOnIncomingMailsDetectionRegexes];
    if (!log)
    {
      uint64_t v22 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v22, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpOnIncomingMailsDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_58;
    }
    uint64_t v22 = [v2 followUpWarningsParameters];
    if (!v22)
    {
      uint64_t v21 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v21, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get followUpWarningsParameters from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_57;
    }
    uint64_t v21 = [v2 bodyAnalysisSamplingFactor];
    if (!v21)
    {
      uint64_t v15 = sgMailIntelligenceLogHandle();
      v20 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v15, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get bodyAnalysisSamplingFactor from SGMITrialClientWrapper.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_56;
    }
    v11 = [v2 defaultTimeIntervalToStartWarningExposition];
    v20 = v11;
    if (v11)
    {
      [v11 doubleValue];
      uint64_t v12 = [v2 defaultTimeIntervalForAWarning];
      if (v12)
      {
        v19 = v12;
        [v12 doubleValue];
        v13 = [SGMIConfig alloc];
        [v21 floatValue];
        v14 = -[SGMIConfig initWithAssetAttachmentDictionary:attachmentLinkDetection:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:bodyAnalysisSamplingFactor:defaultTimeIntervalToStartWarningExposition:defaultTimeIntervalForAWarning:defaultTimeIntervalToEndWarningExposition:followUpWarningsParameters:](v13, "initWithAssetAttachmentDictionary:attachmentLinkDetection:recipientConservativeDictionary:recipientDictionary:nicknameDictionary:followUpOnOutgoingMailsQuestionsDictionary:followUpOnOutgoingMailsAsksDictionary:followUpOnIncomingMailsDictionary:bodyAnalysisSamplingFactor:defaultTimeIntervalToStartWarningExposition:defaultTimeIntervalForAWarning:defaultTimeIntervalToEndWarningExposition:followUpWarningsParameters:", v3, v4, v6, v7, v8, v9, v10, log, v22);
LABEL_50:
        id v16 = v19;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
LABEL_65:

        goto LABEL_66;
      }
      BOOL v17 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get defaultTimeIntervalForAWarning from SGMITrialClientWrapper.", buf, 2u);
      }

      id v16 = 0;
    }
    else
    {
      v19 = sgMailIntelligenceLogHandle();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v14 = 0;
        goto LABEL_50;
      }
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get defaultTimeIntervalToStartWarningExposition from SGMITrialClientWrapper.", buf, 2u);
      id v16 = v19;
    }
    v14 = 0;
    goto LABEL_55;
  }
  id v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "SGMIConfig: Error, unable to get attachmentDetectionRegexes from SGMITrialClientWrapper.", buf, 2u);
  }
  v14 = 0;
LABEL_66:

  return v14;
}

+ (id)defaultConfig
{
  pthread_mutex_lock(&defaultConfig_defaultConfigInitLock);
  if (!defaultConfig_instance)
  {
    uint64_t v2 = +[SGMIConfig _defaultConfig];
    v3 = (void *)defaultConfig_instance;
    defaultConfig_instance = v2;
  }
  pthread_mutex_unlock(&defaultConfig_defaultConfigInitLock);
  id v4 = (void *)defaultConfig_instance;
  return v4;
}

@end