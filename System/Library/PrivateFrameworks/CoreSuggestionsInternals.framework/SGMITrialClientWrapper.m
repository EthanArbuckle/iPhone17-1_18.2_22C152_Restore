@interface SGMITrialClientWrapper
+ (id)sharedInstance;
- (SGMITrialClientWrapper)init;
- (TRIClient)triClient;
- (id)_loadPlistFromPath:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
- (id)arrayFromPathWithPrefix:(id)a3 suffix:(id)a4;
- (id)attachmentDetectionRegexes;
- (id)attachmentLinkDetection;
- (id)bodyAnalysisSamplingFactor;
- (id)classificationOfflinePrecision;
- (id)classificationOfflineRecall;
- (id)classificationThreshold;
- (id)concatPathWithPrefix:(id)a3 suffix:(id)a4 extra:(id)a5;
- (id)conservativeRecipientDetection;
- (id)defaultTimeIntervalForAWarning;
- (id)defaultTimeIntervalToStartWarningExposition;
- (id)dictionaryFromPathWithPrefix:(id)a3 suffix:(id)a4;
- (id)followUpOnIncomingMailsDetectionRegexes;
- (id)followUpOnOutgoingMailsAsksDetectionRegexes;
- (id)followUpOnOutgoingMailsQuestionsDetectionRegexes;
- (id)followUpWarningsParameters;
- (id)isDNUOnlyEnablement;
- (id)isEnabled;
- (id)loadLevelAsBooleanFromFactor:(id)a3;
- (id)loadLevelAsLongFromFactor:(id)a3;
- (id)loadLevelAsModelPath:(id)a3;
- (id)loadLevelAsNumericArrayFromFactor:(id)a3;
- (id)loadLevelAsNumericDictionaryFromFactor:(id)a3;
- (id)loadLevelAsNumericFromFactor:(id)a3;
- (id)loadLevelAsStringArrayFromFactor:(id)a3;
- (id)loadLevelAsStringFromFactor:(id)a3;
- (id)minCountToConsiderATokenAsExtremelyDiscriminant;
- (id)minCountToConsiderATokenAsHighlyDiscriminant;
- (id)modelFeatureNames;
- (id)modelFeatureStandardizationMeans;
- (id)modelFeatureStandardizationStandardDeviations;
- (id)modelGroundTruthFeatureLowerBounds;
- (id)modelGroundTruthFeatureNames;
- (id)modelGroundTruthFeatureUpperBounds;
- (id)modelGroundTruthOutputs;
- (id)modelGroundTruthVersion;
- (id)modelInferenceVersion;
- (id)modelPath;
- (id)nicknameDetectionRegexes;
- (id)ratioToConsiderATokenAsExtremelyDiscriminant;
- (id)ratioToConsiderATokenAsHighlyDiscriminant;
- (id)recipientConservativeDetectionRegexes;
- (id)recipientDetectionRegexes;
- (id)saliencyOverrideFeatureLowerBounds;
- (id)saliencyOverrideFeatureNames;
- (id)saliencyOverrideFeatureUpperBounds;
- (id)saliencyOverrideOutputs;
- (id)signatureStatsLogging;
- (id)trialMetadata;
- (id)trialMetadataString;
- (void)loadFactors;
- (void)refresh;
- (void)setTriClient:(id)a3;
@end

@implementation SGMITrialClientWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setTriClient:(id)a3
{
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (id)ratioToConsiderATokenAsExtremelyDiscriminant
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SGMITrialClientWrapper_ratioToConsiderATokenAsExtremelyDiscriminant__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: ratioToConsiderATokenAsExtremelyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __70__SGMITrialClientWrapper_ratioToConsiderATokenAsExtremelyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)minCountToConsiderATokenAsExtremelyDiscriminant
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SGMITrialClientWrapper_minCountToConsiderATokenAsExtremelyDiscriminant__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: minCountToConsiderATokenAsExtremelyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __73__SGMITrialClientWrapper_minCountToConsiderATokenAsExtremelyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)ratioToConsiderATokenAsHighlyDiscriminant
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SGMITrialClientWrapper_ratioToConsiderATokenAsHighlyDiscriminant__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: ratioToConsiderATokenAsHighlyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __67__SGMITrialClientWrapper_ratioToConsiderATokenAsHighlyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)minCountToConsiderATokenAsHighlyDiscriminant
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SGMITrialClientWrapper_minCountToConsiderATokenAsHighlyDiscriminant__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: minCountToConsiderATokenAsHighlyDiscriminant accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __70__SGMITrialClientWrapper_minCountToConsiderATokenAsHighlyDiscriminant__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)bodyAnalysisSamplingFactor
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SGMITrialClientWrapper_bodyAnalysisSamplingFactor__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: bodyAnalysisSamplingFactor accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __52__SGMITrialClientWrapper_bodyAnalysisSamplingFactor__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)followUpWarningsParameters
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SGMITrialClientWrapper_followUpWarningsParameters__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpWarningsParameters accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __52__SGMITrialClientWrapper_followUpWarningsParameters__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)followUpOnIncomingMailsDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__SGMITrialClientWrapper_followUpOnIncomingMailsDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnIncomingMailsDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __65__SGMITrialClientWrapper_followUpOnIncomingMailsDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)defaultTimeIntervalForAWarning
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_defaultTimeIntervalForAWarning__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: defaultTimeIntervalForAWarning accessed %@.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __56__SGMITrialClientWrapper_defaultTimeIntervalForAWarning__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)defaultTimeIntervalToStartWarningExposition
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SGMITrialClientWrapper_defaultTimeIntervalToStartWarningExposition__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: defaultTimeIntervalToStartWarningExposition accessed %@.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __69__SGMITrialClientWrapper_defaultTimeIntervalToStartWarningExposition__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)followUpOnOutgoingMailsAsksDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SGMITrialClientWrapper_followUpOnOutgoingMailsAsksDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnOutgoingMailsAsksDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __69__SGMITrialClientWrapper_followUpOnOutgoingMailsAsksDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)followUpOnOutgoingMailsQuestionsDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SGMITrialClientWrapper_followUpOnOutgoingMailsQuestionsDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: followUpOnOutgoingMailsQuestionsDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __74__SGMITrialClientWrapper_followUpOnOutgoingMailsQuestionsDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)nicknameDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SGMITrialClientWrapper_nicknameDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: nicknameDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __50__SGMITrialClientWrapper_nicknameDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)recipientDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGMITrialClientWrapper_recipientDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: recipientDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __51__SGMITrialClientWrapper_recipientDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)recipientConservativeDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  uint64_t v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SGMITrialClientWrapper_recipientConservativeDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: recipientConservativeDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __63__SGMITrialClientWrapper_recipientConservativeDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)conservativeRecipientDetection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_conservativeRecipientDetection__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: conservativeRecipientDetection accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __56__SGMITrialClientWrapper_conservativeRecipientDetection__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)attachmentLinkDetection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SGMITrialClientWrapper_attachmentLinkDetection__block_invoke;
  v7[3] = &unk_1E65C0068;
  v7[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v7];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: attachmentLinkDetection accessed with %lu entries.", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __49__SGMITrialClientWrapper_attachmentLinkDetection__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)attachmentDetectionRegexes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40478;
  id v12 = __Block_byref_object_dispose__40479;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SGMITrialClientWrapper_attachmentDetectionRegexes__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 allKeys];
    v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: attachmentDetectionRegexes accessed with locales %@.", (uint8_t *)&buf, 0xCu);
  }
  return v3;
}

void __52__SGMITrialClientWrapper_attachmentDetectionRegexes__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)classificationOfflineRecall
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SGMITrialClientWrapper_classificationOfflineRecall__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationOfflineRecall accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __53__SGMITrialClientWrapper_classificationOfflineRecall__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)classificationOfflinePrecision
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SGMITrialClientWrapper_classificationOfflinePrecision__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationOfflinePrecision accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __56__SGMITrialClientWrapper_classificationOfflinePrecision__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)classificationThreshold
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SGMITrialClientWrapper_classificationThreshold__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: classificationThreshold accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __49__SGMITrialClientWrapper_classificationThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)saliencyOverrideOutputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SGMITrialClientWrapper_saliencyOverrideOutputs__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideOutputs accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __49__SGMITrialClientWrapper_saliencyOverrideOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)saliencyOverrideFeatureUpperBounds
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_saliencyOverrideFeatureUpperBounds__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureUpperBounds accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __60__SGMITrialClientWrapper_saliencyOverrideFeatureUpperBounds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)saliencyOverrideFeatureLowerBounds
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_saliencyOverrideFeatureLowerBounds__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureLowerBounds accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __60__SGMITrialClientWrapper_saliencyOverrideFeatureLowerBounds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)saliencyOverrideFeatureNames
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SGMITrialClientWrapper_saliencyOverrideFeatureNames__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: saliencyOverrideFeatureNames accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __54__SGMITrialClientWrapper_saliencyOverrideFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelGroundTruthOutputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SGMITrialClientWrapper_modelGroundTruthOutputs__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthOutputs accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __49__SGMITrialClientWrapper_modelGroundTruthOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelGroundTruthFeatureUpperBounds
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_modelGroundTruthFeatureUpperBounds__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureUpperBounds accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __60__SGMITrialClientWrapper_modelGroundTruthFeatureUpperBounds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelGroundTruthFeatureLowerBounds
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SGMITrialClientWrapper_modelGroundTruthFeatureLowerBounds__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureLowerBounds accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __60__SGMITrialClientWrapper_modelGroundTruthFeatureLowerBounds__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelGroundTruthFeatureNames
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SGMITrialClientWrapper_modelGroundTruthFeatureNames__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthFeatureNames accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __54__SGMITrialClientWrapper_modelGroundTruthFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelFeatureStandardizationStandardDeviations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SGMITrialClientWrapper_modelFeatureStandardizationStandardDeviations__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureStandardizationStandardDeviation accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __71__SGMITrialClientWrapper_modelFeatureStandardizationStandardDeviations__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelFeatureStandardizationMeans
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SGMITrialClientWrapper_modelFeatureStandardizationMeans__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureStandardizationMeans accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __58__SGMITrialClientWrapper_modelFeatureStandardizationMeans__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelFeatureNames
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__40478;
  id v11 = __Block_byref_object_dispose__40479;
  id v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SGMITrialClientWrapper_modelFeatureNames__block_invoke;
  v8[3] = &unk_1E65C0068;
  v8[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = [v3 firstObject];
    *(_DWORD *)long long buf = 134218242;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelFeatureNames accessed: size %lu, first element %@", buf, 0x16u);
  }
  return v3;
}

void __43__SGMITrialClientWrapper_modelFeatureNames__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelPath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SGMITrialClientWrapper_modelPath__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelPath accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __35__SGMITrialClientWrapper_modelPath__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelInferenceVersion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SGMITrialClientWrapper_modelInferenceVersion__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelInferenceVersion accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __47__SGMITrialClientWrapper_modelInferenceVersion__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)modelGroundTruthVersion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SGMITrialClientWrapper_modelGroundTruthVersion__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: modelGroundTruthVersion accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __49__SGMITrialClientWrapper_modelGroundTruthVersion__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)signatureStatsLogging
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SGMITrialClientWrapper_signatureStatsLogging__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: signatureStatsLogging accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __47__SGMITrialClientWrapper_signatureStatsLogging__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)isDNUOnlyEnablement
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SGMITrialClientWrapper_isDNUOnlyEnablement__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: isDNUOnlyEnablement accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __45__SGMITrialClientWrapper_isDNUOnlyEnablement__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)isEnabled
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__40478;
  uint64_t v10 = __Block_byref_object_dispose__40479;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SGMITrialClientWrapper_isEnabled__block_invoke;
  v6[3] = &unk_1E65C0068;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: isEnabled accessed: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __35__SGMITrialClientWrapper_isEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)loadFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__SGMITrialClientWrapper_loadFactors__block_invoke;
  v3[3] = &unk_1E65C0040;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __37__SGMITrialClientWrapper_loadFactors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Loading Trial factors", buf, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) loadLevelAsBooleanFromFactor:@"isEnabled"];
  uint64_t v6 = (void *)v3[1];
  v3[1] = v5;

  uint64_t v7 = [*(id *)(a1 + 32) loadLevelAsBooleanFromFactor:@"isDNUOnlyEnablement"];
  uint64_t v8 = (void *)v3[2];
  v3[2] = v7;

  uint64_t v9 = [*(id *)(a1 + 32) loadLevelAsBooleanFromFactor:@"signatureStatsLogging"];
  uint64_t v10 = (void *)v3[3];
  v3[3] = v9;

  uint64_t v11 = [*(id *)(a1 + 32) loadLevelAsStringFromFactor:@"modelGroundTruthVersion"];
  uint64_t v12 = (void *)v3[4];
  v3[4] = v11;

  uint64_t v13 = [*(id *)(a1 + 32) loadLevelAsStringFromFactor:@"modelInferenceVersion"];
  uint64_t v14 = (void *)v3[5];
  void v3[5] = v13;

  uint64_t v15 = [*(id *)(a1 + 32) loadLevelAsModelPath:@"model"];
  v16 = (void *)v3[6];
  v3[6] = v15;

  uint64_t v17 = [*(id *)(a1 + 32) loadLevelAsStringArrayFromFactor:@"modelFeatureNames.plist"];
  v18 = (void *)v3[7];
  v3[7] = v17;

  uint64_t v19 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"modelFeatureStandardizationMeans.plist"];
  v20 = (void *)v3[8];
  v3[8] = v19;

  uint64_t v21 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"modelFeatureStandardizationStandardDeviations.plist"];
  v22 = (void *)v3[9];
  v3[9] = v21;

  uint64_t v23 = [*(id *)(a1 + 32) loadLevelAsStringArrayFromFactor:@"modelGroundTruthFeatureNames.plist"];
  v24 = (void *)v3[10];
  v3[10] = v23;

  uint64_t v25 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"modelGroundTruthFeatureLowerBounds.plist"];
  v26 = (void *)v3[11];
  v3[11] = v25;

  uint64_t v27 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"modelGroundTruthFeatureUpperBounds.plist"];
  v28 = (void *)v3[12];
  v3[12] = v27;

  uint64_t v29 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"modelGroundTruthOutputs.plist"];
  v30 = (void *)v3[13];
  v3[13] = v29;

  uint64_t v31 = [*(id *)(a1 + 32) loadLevelAsStringArrayFromFactor:@"saliencyOverrideFeatureNames.plist"];
  v32 = (void *)v3[14];
  v3[14] = v31;

  uint64_t v33 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"saliencyOverrideFeatureLowerBounds.plist"];
  v34 = (void *)v3[15];
  v3[15] = v33;

  uint64_t v35 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"saliencyOverrideFeatureUpperBounds.plist"];
  v36 = (void *)v3[16];
  v3[16] = v35;

  uint64_t v37 = [*(id *)(a1 + 32) loadLevelAsNumericArrayFromFactor:@"saliencyOverrideOutputs.plist"];
  v38 = (void *)v3[17];
  v3[17] = v37;

  v39 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"classificationConfiguration.plist"];
  uint64_t v40 = [v39 objectForKeyedSubscript:@"classificationThreshold"];
  v41 = (void *)v3[18];
  v3[18] = v40;

  uint64_t v42 = [v39 objectForKeyedSubscript:@"classificationOfflinePrecision"];
  v43 = (void *)v3[19];
  v3[19] = v42;

  uint64_t v44 = [v39 objectForKeyedSubscript:@"classificationOfflineRecall"];
  v45 = (void *)v3[20];
  v3[20] = v44;

  uint64_t v46 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"attachmentDetectionRegexes.plist"];
  v47 = (void *)v3[21];
  v3[21] = v46;

  uint64_t v48 = [*(id *)(a1 + 32) loadLevelAsStringArrayFromFactor:@"attachmentLinkDetection.plist"];
  v49 = (void *)v3[22];
  v3[22] = v48;

  uint64_t v50 = [*(id *)(a1 + 32) loadLevelAsBooleanFromFactor:@"conservativeRecipientDetection"];
  v51 = (void *)v3[23];
  v3[23] = v50;

  uint64_t v52 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"recipientConservativeDetectionRegexes.plist"];
  v53 = (void *)v3[24];
  v3[24] = v52;

  uint64_t v54 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"recipientDetectionRegexes.plist"];
  v55 = (void *)v3[25];
  v3[25] = v54;

  uint64_t v56 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"nicknameDetectionRegexes.plist"];
  v57 = (void *)v3[26];
  v3[26] = v56;

  uint64_t v58 = [*(id *)(a1 + 32) loadLevelAsNumericFromFactor:@"defaultTimeIntervalToStartWarningExposition"];
  v59 = (void *)v3[27];
  v3[27] = v58;

  uint64_t v60 = [*(id *)(a1 + 32) loadLevelAsNumericFromFactor:@"defaultTimeIntervalForAWarning"];
  v61 = (void *)v3[28];
  v3[28] = v60;

  uint64_t v62 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"followUpOnOutgoingMailsQuestionsDetectionRegexes.plist"];
  v63 = (void *)v3[29];
  v3[29] = v62;

  uint64_t v64 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"followUpOnOutgoingMailsAsksDetectionRegexes.plist"];
  v65 = (void *)v3[30];
  v3[30] = v64;

  uint64_t v66 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"followUpOnIncomingMailsDetectionRegexes.plist"];
  v67 = (void *)v3[31];
  v3[31] = v66;

  uint64_t v68 = [*(id *)(a1 + 32) loadLevelAsNumericDictionaryFromFactor:@"followUpWarningsParameters.plist"];
  v69 = (void *)v3[32];
  v3[32] = v68;

  uint64_t v70 = [*(id *)(a1 + 32) loadLevelAsNumericFromFactor:@"bodyAnalysisSamplingFactor"];
  v71 = (void *)v3[33];
  v3[33] = v70;

  uint64_t v72 = [*(id *)(a1 + 32) loadLevelAsLongFromFactor:@"minCountToConsiderATokenAsHighlyDiscriminant"];
  v73 = (void *)v3[34];
  v3[34] = v72;

  uint64_t v74 = [*(id *)(a1 + 32) loadLevelAsNumericFromFactor:@"ratioToConsiderATokenAsHighlyDiscriminant"];
  v75 = (void *)v3[35];
  v3[35] = v74;

  uint64_t v76 = [*(id *)(a1 + 32) loadLevelAsLongFromFactor:@"minCountToConsiderATokenAsExtremelyDiscriminant"];
  v77 = (void *)v3[36];
  v3[36] = v76;

  uint64_t v78 = [*(id *)(a1 + 32) loadLevelAsNumericFromFactor:@"ratioToConsiderATokenAsExtremelyDiscriminant"];
  v79 = (void *)v3[37];
  v3[37] = v78;

  v80 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v81 = 0;
    _os_log_debug_impl(&dword_1CA650000, v80, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Trial factor load complete", v81, 2u);
  }
}

- (id)dictionaryFromPathWithPrefix:(id)a3 suffix:(id)a4
{
  uint64_t v5 = [(SGMITrialClientWrapper *)self concatPathWithPrefix:a3 suffix:a4 extra:0];
  uint64_t v8 = 0;
  uint64_t v6 = [(SGMITrialClientWrapper *)self _loadPlistFromPath:v5 expectedClass:objc_opt_class() error:&v8];

  return v6;
}

- (id)arrayFromPathWithPrefix:(id)a3 suffix:(id)a4
{
  uint64_t v5 = [(SGMITrialClientWrapper *)self concatPathWithPrefix:a3 suffix:a4 extra:0];
  uint64_t v8 = 0;
  uint64_t v6 = [(SGMITrialClientWrapper *)self _loadPlistFromPath:v5 expectedClass:objc_opt_class() error:&v8];

  return v6;
}

- (id)concatPathWithPrefix:(id)a3 suffix:(id)a4 extra:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  if (v7) {
    uint64_t v12 = [v11 initWithFormat:@"%@/%@/%@", v10, v9, v7];
  }
  else {
    uint64_t v12 = [v11 initWithFormat:@"%@/%@", v10, v9, v15];
  }
  uint64_t v13 = (void *)v12;

  return v13;
}

- (id)loadLevelAsNumericDictionaryFromFactor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [(TRIClient *)self->_triClient levelForFactor:a3 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v5 = [v4 fileValue];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v4 fileValue];
    int v8 = [v7 hasPath];

    if (v8)
    {
      id v9 = [v4 fileValue];
      id v10 = [v9 path];
      id v23 = 0;
      id v11 = [(SGMITrialClientWrapper *)self _loadPlistFromPath:v10 expectedClass:objc_opt_class() error:&v23];
      uint64_t v12 = v23;

      if (v11)
      {
        if ([v11 count])
        {
          id v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          id v13 = 0;
          goto LABEL_13;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v25 = v16;
        uint64_t v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        uint32_t v19 = 12;
      }
      else
      {
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        uint64_t v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        uint32_t v19 = 22;
      }
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  uint64_t v12 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [v4 fileValue];
    v22 = [v21 path];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = v22;
    _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

- (id)loadLevelAsNumericArrayFromFactor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [(TRIClient *)self->_triClient levelForFactor:a3 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v5 = [v4 fileValue];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v4 fileValue];
    int v8 = [v7 hasPath];

    if (v8)
    {
      id v9 = [v4 fileValue];
      id v10 = [v9 path];
      id v23 = 0;
      id v11 = [(SGMITrialClientWrapper *)self _loadPlistFromPath:v10 expectedClass:objc_opt_class() error:&v23];
      uint64_t v12 = v23;

      if (v11)
      {
        if ([v11 count])
        {
          id v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          id v13 = 0;
          goto LABEL_13;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v25 = v16;
        uint64_t v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        uint32_t v19 = 12;
      }
      else
      {
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        uint64_t v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        uint32_t v19 = 22;
      }
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  uint64_t v12 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [v4 fileValue];
    v22 = [v21 path];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = v22;
    _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

- (id)loadLevelAsStringArrayFromFactor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = [(TRIClient *)self->_triClient levelForFactor:a3 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v5 = [v4 fileValue];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v4 fileValue];
    int v8 = [v7 hasPath];

    if (v8)
    {
      id v9 = [v4 fileValue];
      id v10 = [v9 path];
      id v23 = 0;
      id v11 = [(SGMITrialClientWrapper *)self _loadPlistFromPath:v10 expectedClass:objc_opt_class() error:&v23];
      uint64_t v12 = v23;

      if (v11)
      {
        if ([v11 count])
        {
          id v13 = v11;
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          id v13 = 0;
          goto LABEL_13;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v25 = v16;
        uint64_t v17 = "SGMITrialClientWrapper: Empty plist content for %@";
        v18 = v14;
        uint32_t v19 = 12;
      }
      else
      {
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        uint64_t v15 = [v4 fileValue];
        v16 = [v15 path];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        uint64_t v17 = "SGMITrialClientWrapper: Unable to load plist content for %@: %@";
        v18 = v14;
        uint32_t v19 = 22;
      }
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

      goto LABEL_12;
    }
  }
  uint64_t v12 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = [v4 fileValue];
    v22 = [v21 path];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = v22;
    _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);
  }
  id v13 = 0;
LABEL_14:

  return v13;
}

- (id)loadLevelAsStringFromFactor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 stringValue];
  }
  else
  {
    int v8 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsLongFromFactor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longValue"));
  }
  else
  {
    int v8 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsNumericFromFactor:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = NSNumber;
    [v5 doubleValue];
    int v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    id v9 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v11, 0xCu);
    }

    int v8 = 0;
  }

  return v8;
}

- (id)loadLevelAsBooleanFromFactor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLeanValue"));
  }
  else
  {
    int v8 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: TRILevel is nil for %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)loadLevelAsModelPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(TRIClient *)self->_triClient levelForFactor:a3 withNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  uint64_t v4 = [v3 directoryValue];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [v3 directoryValue],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasPath],
        v6,
        v5,
        v7))
  {
    id v8 = [NSString alloc];
    id v9 = [v3 directoryValue];
    int v10 = [v9 path];
    id v11 = (void *)[v8 initWithFormat:@"%@/%@", v10, @"model.mlmodelc"];
  }
  else
  {
    uint64_t v12 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v3 directoryValue];
      uint64_t v15 = [v14 path];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v15;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGMITrialClientWrapper: No plist file found at %@", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)_loadPlistFromPath:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithContentsOfFile:v7 options:1 error:a5];

  if (v8)
  {
    if ((unint64_t)[v8 length] >= 0x400
      && ([MEMORY[0x1E4F93B58] propertyListWithData:v8 error:0],
          (id v9 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:a5],
          (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v9 = 0;
        *a5 = (id)[v10 initWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)trialMetadataString
{
  v2 = [(SGMITrialClientWrapper *)self trialMetadata];
  if ([v2 hasTreatmentId])
  {
    id v3 = [NSString alloc];
    uint64_t v4 = [v2 experimentId];
    uint64_t v5 = [v2 deploymentId];
    uint64_t v6 = [v2 treatmentId];
    id v7 = (__CFString *)[v3 initWithFormat:@"E=%@ D=%d T=%@", v4, v5, v6];
  }
  else
  {
    id v7 = @"Device is likely not enrolled in a Trial experiment.";
  }

  return v7;
}

- (id)trialMetadata
{
  v2 = [(TRIClient *)self->_triClient experimentIdentifiersWithNamespaceName:@"PROACTIVE_MAIL_INTELLIGENCE_SALIENCY"];
  id v3 = objc_opt_new();
  if (v2)
  {
    uint64_t v4 = [v2 experimentId];
    [v3 setExperimentId:v4];

    uint64_t v5 = [v2 treatmentId];
    [v3 setTreatmentId:v5];

    objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v2, "deploymentId"));
  }
  else
  {
    uint64_t v6 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGMITrialClientWrapper: Trial metadata (experimentId, deploymentId, treatmentId) unavailable. Device is likely not enrolled in experiment.", v8, 2u);
    }
  }
  return v3;
}

- (void)refresh
{
  [(TRIClient *)self->_triClient refresh];
  [(SGMITrialClientWrapper *)self loadFactors];
}

- (SGMITrialClientWrapper)init
{
  v10.receiver = self;
  v10.super_class = (Class)SGMITrialClientWrapper;
  v2 = [(SGMITrialClientWrapper *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:109];
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;

    [(SGMITrialClientWrapper *)v2 loadFactors];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_40685 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_40685, &__block_literal_global_40686);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_40687;
  return v2;
}

void __40__SGMITrialClientWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_40687;
  sharedInstance__pasExprOnceResult_40687 = v1;
}

@end