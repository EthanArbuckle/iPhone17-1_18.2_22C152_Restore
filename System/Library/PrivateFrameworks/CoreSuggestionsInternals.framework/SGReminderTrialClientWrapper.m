@interface SGReminderTrialClientWrapper
+ (id)sharedInstance;
- (BOOL)actionVerbOptional;
- (BOOL)confirmationOptional;
- (BOOL)triggerOptional;
- (SGReminderTrialClientWrapper)init;
- (id)baseModelName;
- (id)messagesBannerLimit;
- (id)reminderEnrichments;
- (id)reminderInputMapping;
- (id)reminderOutputMapping;
- (id)reminderOverrides;
- (void)updateFactors;
@end

@implementation SGReminderTrialClientWrapper

- (void).cxx_destruct
{
}

- (id)reminderOutputMapping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24105;
  v12 = __Block_byref_object_dispose__24106;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SGReminderTrialClientWrapper_reminderOutputMapping__block_invoke;
  v8[3] = &unk_1E65B9FB8;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderOutputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __53__SGReminderTrialClientWrapper_reminderOutputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)reminderInputMapping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24105;
  v12 = __Block_byref_object_dispose__24106;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SGReminderTrialClientWrapper_reminderInputMapping__block_invoke;
  v8[3] = &unk_1E65B9FB8;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderInputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __52__SGReminderTrialClientWrapper_reminderInputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)reminderEnrichments
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24105;
  v12 = __Block_byref_object_dispose__24106;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGReminderTrialClientWrapper_reminderEnrichments__block_invoke;
  v8[3] = &unk_1E65B9FB8;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderEnrichments list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __51__SGReminderTrialClientWrapper_reminderEnrichments__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)reminderOverrides
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__24105;
  v12 = __Block_byref_object_dispose__24106;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SGReminderTrialClientWrapper_reminderOverrides__block_invoke;
  v8[3] = &unk_1E65B9FB8;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: reminderOverrides list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __49__SGReminderTrialClientWrapper_reminderOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)messagesBannerLimit
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24105;
  uint64_t v10 = __Block_byref_object_dispose__24106;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SGReminderTrialClientWrapper_messagesBannerLimit__block_invoke;
  v6[3] = &unk_1E65B9FB8;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: messagesBannerLimit: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __51__SGReminderTrialClientWrapper_messagesBannerLimit__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)actionVerbOptional
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SGReminderTrialClientWrapper_actionVerbOptional__block_invoke;
  v7[3] = &unk_1E65B9FB8;
  v7[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v7];
  int v3 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: actionVerbOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

uint64_t __50__SGReminderTrialClientWrapper_actionVerbOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 10);
  return result;
}

- (BOOL)triggerOptional
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SGReminderTrialClientWrapper_triggerOptional__block_invoke;
  v7[3] = &unk_1E65B9FB8;
  v7[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v7];
  int v3 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: triggerOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

uint64_t __47__SGReminderTrialClientWrapper_triggerOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 9);
  return result;
}

- (BOOL)confirmationOptional
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SGReminderTrialClientWrapper_confirmationOptional__block_invoke;
  v7[3] = &unk_1E65B9FB8;
  v7[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v7];
  int v3 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  v4 = sgRemindersLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = @"NO";
    if (v3) {
      uint64_t v6 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: confirmationOptional: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

uint64_t __52__SGReminderTrialClientWrapper_confirmationOptional__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 8);
  return result;
}

- (id)baseModelName
{
  return @"ReminderModel";
}

- (void)updateFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__SGReminderTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E65B9F90;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __45__SGReminderTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *((_WORD *)v3 + 4) = 0;
  *((unsigned char *)v3 + 10) = 0;
  v4 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = &unk_1F2535F10;

  v5 = sgRemindersLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGReminderTrialClientWrapper: Updating factors", buf, 2u);
  }

  [*(id *)(a1 + 32) refreshEnrollmentInformationForNamespace:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"ReminderModel.mlmodelc" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v7 = [v6 fileValue];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v6 fileValue],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 hasPath],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = [*(id *)(a1 + 32) modelPathForCurrentEnrollment];
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v13 = [v12 fileExistsAtPath:v11];

      if ((v13 & 1) == 0)
      {
        v79 = *(void **)(a1 + 32);
        v77 = [v6 fileValue];
        v78 = [v77 path];
        [v79 uncompressModelAndUpdateFactors:v78 destinationPath:v11];
        goto LABEL_57;
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__SGReminderTrialClientWrapper_updateFactors__block_invoke_55;
    block[3] = &unk_1E65BEF88;
    block[4] = v14;
    dispatch_async(v15, block);
  }
  v16 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"confirmationOptional" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v11 = v16;
  if (v16)
  {
    *((unsigned char *)v3 + 8) = [v16 BOOLeanValue];
  }
  else
  {
    v17 = sgRemindersLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for confirmationOptional", buf, 2u);
    }
  }
  v18 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"triggerOptional" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  v19 = v18;
  if (v18)
  {
    *((unsigned char *)v3 + 9) = [v18 BOOLeanValue];
  }
  else
  {
    v20 = sgRemindersLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for triggerOptional", buf, 2u);
    }
  }
  v21 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"actionVerbOptional" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  v22 = v21;
  if (v21)
  {
    *((unsigned char *)v3 + 10) = [v21 BOOLeanValue];
  }
  else
  {
    v23 = sgRemindersLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for actionVerbOptional", buf, 2u);
    }
  }
  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"messagesBannerLimit" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  v91 = v22;
  v92 = v19;
  v90 = (void *)v24;
  if (v24)
  {
    v25 = (void *)v24;
    id v26 = objc_alloc(NSNumber);
    [v25 doubleValue];
    uint64_t v27 = objc_msgSend(v26, "initWithDouble:");
    v28 = *((void *)v3 + 2);
    *((void *)v3 + 2) = v27;
  }
  else
  {
    v28 = sgRemindersLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v28, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: TRILevel is nil for messagesBannerLimit", buf, 2u);
    }
  }

  v29 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"reminderOverrides" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v30 = [v29 fileValue];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [v29 fileValue];
    int v33 = [v32 hasPath];

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E4F93B50];
      v35 = [v29 fileValue];
      v36 = [v35 path];
      id v96 = 0;
      v37 = [v34 dictionaryWithPath:v36 error:&v96];
      id v38 = v96;

      if (v37)
      {
        id v39 = v37;
        v40 = *((void *)v3 + 3);
        *((void *)v3 + 3) = v39;
      }
      else
      {
        v40 = sgRemindersLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v80 = [v29 fileValue];
          v81 = [v80 path];
          *(_DWORD *)long long buf = 138412546;
          v99 = v81;
          __int16 v100 = 2112;
          id v101 = v38;
          _os_log_error_impl(&dword_1CA650000, v40, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }
    }
  }
  v41 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"reminderPreprocessor" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v42 = [v41 fileValue];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [v41 fileValue];
    int v45 = [v44 hasPath];

    if (v45)
    {
      v46 = (void *)MEMORY[0x1E4F93B50];
      v47 = [v41 fileValue];
      v48 = [v47 path];
      id v95 = 0;
      v49 = [v46 dictionaryWithPath:v48 error:&v95];
      id v50 = v95;

      if (v49)
      {
        id v51 = v49;
        v52 = *((void *)v3 + 4);
        *((void *)v3 + 4) = v51;
      }
      else
      {
        v52 = sgRemindersLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v89 = [v29 fileValue];
          v82 = [v89 path];
          *(_DWORD *)long long buf = 138412546;
          v99 = v82;
          __int16 v100 = 2112;
          id v101 = v50;
          _os_log_error_impl(&dword_1CA650000, v52, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }
    }
  }
  v53 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"reminderInputMapping" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v54 = [v53 fileValue];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [v53 fileValue];
    int v57 = [v56 hasPath];

    if (v57)
    {
      v87 = v6;
      v58 = (void *)MEMORY[0x1E4F93B50];
      v59 = [v53 fileValue];
      v60 = [v59 path];
      id v94 = 0;
      v61 = [v58 dictionaryWithPath:v60 error:&v94];
      id v62 = v94;

      if (v61)
      {
        id v63 = v61;
        v64 = *((void *)v3 + 5);
        *((void *)v3 + 5) = v63;
      }
      else
      {
        v64 = sgRemindersLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v85 = [v53 fileValue];
          v83 = [v85 path];
          *(_DWORD *)long long buf = 138412546;
          v99 = v83;
          __int16 v100 = 2112;
          id v101 = v62;
          _os_log_error_impl(&dword_1CA650000, v64, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }

      uint64_t v6 = v87;
    }
  }
  v65 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"reminderOutputMapping" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
  uint64_t v66 = [v65 fileValue];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [v65 fileValue];
    int v69 = [v68 hasPath];

    if (v69)
    {
      v88 = v6;
      v70 = (void *)MEMORY[0x1E4F93B50];
      v71 = [v65 fileValue];
      v72 = [v71 path];
      id v93 = 0;
      v73 = [v70 dictionaryWithPath:v72 error:&v93];
      id v74 = v93;

      if (v73)
      {
        id v75 = v73;
        v76 = *((void *)v3 + 6);
        *((void *)v3 + 6) = v75;
      }
      else
      {
        v76 = sgRemindersLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v86 = [v65 fileValue];
          v84 = [v86 path];
          *(_DWORD *)long long buf = 138412546;
          v99 = v84;
          __int16 v100 = 2112;
          id v101 = v74;
          _os_log_error_impl(&dword_1CA650000, v76, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }

      uint64_t v6 = v88;
    }
  }

  v78 = v91;
  v77 = v92;
LABEL_57:
}

uint64_t __45__SGReminderTrialClientWrapper_updateFactors__block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanExperimentModelsFromTrialModelsFolder];
}

- (SGReminderTrialClientWrapper)init
{
  v13.receiver = self;
  v13.super_class = (Class)SGReminderTrialClientWrapper;
  v2 = [(SGTrialClientWrapper *)&v13 initWithClientIdentifier:106];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    [(SGReminderTrialClientWrapper *)v2 updateFactors];
    id location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__SGReminderTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E65B9F68;
    objc_copyWeak(&v11, &location);
    id v8 = (id)[(TRIClient *)triClient addUpdateHandlerForNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS" usingBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__SGReminderTrialClientWrapper_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FB0098] clientWithIdentifier:106];
    v2 = [v1 levelForFactor:@"ReminderModel.mlmodelc" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
    uint64_t v3 = [v2 fileValue];
    if (v3
      && (v4 = (void *)v3,
          [v2 fileValue],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 hasPath],
          v5,
          v4,
          v6))
    {
      uint64_t v7 = [WeakRetained modelPathForTriClient:v1 andNamespace:@"PRODUCTIVITY_INTELLIGENCE_REMINDERS"];
      if (v7)
      {
        id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v9 = [v8 fileExistsAtPath:v7];

        if ((v9 & 1) == 0)
        {
          int v10 = [v2 fileValue];
          id v11 = [v10 path];
          [WeakRetained uncompressModelAndUpdateFactors:v11 destinationPath:v7];
        }
      }
    }
    else
    {
      [WeakRetained[1] refresh];
      [WeakRetained updateFactors];
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_24179 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_24179, &__block_literal_global_24180);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_24181;
  return v2;
}

void __46__SGReminderTrialClientWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_24181;
  sharedInstance__pasExprOnceResult_24181 = v1;
}

@end