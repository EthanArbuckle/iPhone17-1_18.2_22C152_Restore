@interface SGMIFeatureStore
+ (SGMIFeatureStore)storeWithFilename:(id)a3;
+ (id)nsDataFromSignature:(id)a3;
+ (id)shouldExposeWarningGivenPositiveFeedbackCount:(id)a3 negativeFeedbackCount:(id)a4;
+ (id)storeInMemory;
- (BOOL)_applyCappingPolicy:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5;
- (BOOL)_areSubmodelsEmptyUsingDatabase:(id)a3;
- (BOOL)_purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5;
- (BOOL)_writeJournalCommand:(unsigned __int8)a3 blob:(id)a4;
- (BOOL)applyCappingPolicy:(id)a3 shouldContinue:(id)a4;
- (BOOL)areSubmodelsEmpty;
- (BOOL)performMaintenanceWithShouldContinueBlock:(id)a3;
- (BOOL)purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4;
- (SGMIFeatureStore)initWithDatabaseGetter:(id)a3 journalPath:(id)a4;
- (id)_columnFromDate:(id)a3;
- (id)_dateFormatter;
- (id)_dateFromColumn:(id)a3;
- (id)_db;
- (id)_featuresForDatabase:(id)a3;
- (id)_getSGMIStoredAddressesUsingDatabase:(id)a3;
- (id)_highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5 domains:(id)a6 limit:(id)a7 usingDatabase:(id)a8;
- (id)_journalQueue;
- (id)_keyForField:(int64_t)a3;
- (id)_naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5 usingDatabase:(id)a6;
- (id)_stringForFeatureName:(int64_t)a3;
- (id)_subModelsStatsWithShouldContinueBlock:(id)a3 usingDatabase:(id)a4;
- (id)databaseHandle;
- (id)followUpWarningStats;
- (id)getDoubleNSNumberForKey:(id)a3;
- (id)getForKey:(id)a3 binder:(id)a4;
- (id)getInt64NSNumberForKey:(id)a3;
- (id)getNSDateForKey:(id)a3;
- (id)getNSStringForKey:(id)a3;
- (id)getSGMIStoredAddresses;
- (id)getUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3;
- (id)highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5;
- (id)incrementUserEngagement:(BOOL)a3 forWarning:(id)a4;
- (id)knownEmailAddressesForNickname:(id)a3;
- (id)migrations;
- (id)naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5;
- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3;
- (id)shouldExposeWarning:(id)a3;
- (id)shouldExposeWarning:(id)a3 updateAction:(int64_t)a4;
- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6;
- (id)subModelsStats;
- (id)subModelsStatsWithShouldContinueBlock:(id)a3;
- (id)submodelsAgesInDays;
- (id)warningStatsForLogging:(BOOL)a3;
- (int)_effectiveLockState;
- (int64_t)_featureNameForString:(id)a3;
- (int64_t)warningStatsCount;
- (unsigned)migration_createFeaturesTable;
- (unsigned)migration_createFollowUpTable;
- (unsigned)migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey;
- (unsigned)migration_createKVTable;
- (unsigned)migration_createSignatureStatsTable;
- (void)_clearBucketForColumn:(id)a3;
- (void)_clearBucketForColumn:(id)a3 usingDatabase:(id)a4;
- (void)_clearKVStoreUsingDatabase:(id)a3;
- (void)_clearSignatureStatsTableUsingDatabase:(id)a3;
- (void)_clearSubModelsTablesUsingDatabase:(id)a3;
- (void)_commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5 usingDatabase:(id)a6;
- (void)_deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3 usingDatabase:(id)a4;
- (void)_deleteTokensForDeletedEmailAddresses:(id)a3 usingDatabase:(id)a4;
- (void)_handleDeviceLockStateEvent:(int)a3;
- (void)_runJournal;
- (void)clearBucketForDate:(id)a3;
- (void)clearBucketsForDates:(id)a3;
- (void)clearKVStoreTable;
- (void)clearMailIntelligenceSaliencyDetection;
- (void)clearNicknameMappingTable;
- (void)clearSignatureStatsTable;
- (void)clearSubModelsTables;
- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4;
- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5;
- (void)dealloc;
- (void)deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3;
- (void)deleteTokensForDeletedEmailAddresses:(id)a3;
- (void)deleteValueForKey:(id)a3;
- (void)incrementInt64NSNumber:(id)a3 forKey:(id)a4;
- (void)incrementUserEngagement:(BOOL)a3 forFollowUpWarning:(id)a4;
- (void)insertToken:(id)a3 forFeatureName:(int64_t)a4 salientCount:(int64_t)a5 regularCount:(int64_t)a6 time:(id)a7;
- (void)purgeOldNicknameMappingRecords;
- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4;
- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4 withDateOfMatch:(id)a5;
- (void)reset;
- (void)setDoubleNSNumber:(id)a3 forKey:(id)a4;
- (void)setInt64NSNumber:(id)a3 forKey:(id)a4;
- (void)setNSDate:(id)a3 forKey:(id)a4;
- (void)setNSString:(id)a3 forKey:(id)a4;
- (void)setUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3 toValues:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 binder:(id)a5;
- (void)updateAttachmentDetectionStatsOnMailWithTextContent:(id)a3 attachments:(id)a4 warningRaised:(BOOL)a5 attachmentPredicted:(BOOL)a6 isIncomingMail:(BOOL)a7;
- (void)updateFollowUpDetectionStatsWithWarning:(id)a3;
- (void)updateRecipientDetectionStatsWarningRaised:(BOOL)a3;
@end

@implementation SGMIFeatureStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalPath, 0);
  objc_storeStrong(&self->_lockStateRegistration, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong(&self->_dbGetter, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)getNSDateForKey:(id)a3
{
  v3 = [(SGMIFeatureStore *)self getForKey:a3 binder:&__block_literal_global_799];
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [v4 dateFromString:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __36__SGMIFeatureStore_getNSDateForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getNSStringForColumn:0];
}

- (void)setNSDate:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [v8 stringFromDate:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__SGMIFeatureStore_setNSDate_forKey___block_invoke;
  v11[3] = &unk_1E65C0388;
  id v12 = v9;
  id v10 = v9;
  [(SGMIFeatureStore *)self setValue:v10 forKey:v6 binder:v11];
}

uint64_t __37__SGMIFeatureStore_setNSDate_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toNSString:*(void *)(a1 + 32)];
}

- (id)getNSStringForKey:(id)a3
{
  return [(SGMIFeatureStore *)self getForKey:a3 binder:&__block_literal_global_797];
}

uint64_t __38__SGMIFeatureStore_getNSStringForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getNSStringForColumn:0];
}

- (void)setNSString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SGMIFeatureStore_setNSString_forKey___block_invoke;
  v8[3] = &unk_1E65C0388;
  id v9 = v6;
  id v7 = v6;
  [(SGMIFeatureStore *)self setValue:v7 forKey:a4 binder:v8];
}

uint64_t __39__SGMIFeatureStore_setNSString_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toNSString:*(void *)(a1 + 32)];
}

- (id)getDoubleNSNumberForKey:(id)a3
{
  return [(SGMIFeatureStore *)self getForKey:a3 binder:&__block_literal_global_794];
}

uint64_t __44__SGMIFeatureStore_getDoubleNSNumberForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getDoubleAsNSNumberForColumn:0];
}

- (void)setDoubleNSNumber:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SGMIFeatureStore_setDoubleNSNumber_forKey___block_invoke;
  v8[3] = &unk_1E65C0388;
  id v9 = v6;
  id v7 = v6;
  [(SGMIFeatureStore *)self setValue:v7 forKey:a4 binder:v8];
}

uint64_t __45__SGMIFeatureStore_setDoubleNSNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toDoubleAsNSNumber:*(void *)(a1 + 32)];
}

- (void)incrementInt64NSNumber:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SGMIFeatureStore *)self _db];
  id v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke;
    v10[3] = &unk_1E65C0688;
    id v11 = v8;
    id v12 = v7;
    id v13 = v6;
    [v11 writeTransaction:v10];
  }
}

void __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke_2;
  v3[3] = &unk_1E65BFF28;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT INTO keyValueStore (key, value) VALUES (:key, :incrementValue) ON CONFLICT (key) DO UPDATE SET value = value + :incrementValue", v3, 0, 0 onPrep onRow onError];
}

void __50__SGMIFeatureStore_incrementInt64NSNumber_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":key" toNSString:v3];
  [v4 bindNamedParam:":incrementValue" toInt64AsNSNumber:*(void *)(a1 + 40)];
}

- (id)getInt64NSNumberForKey:(id)a3
{
  return [(SGMIFeatureStore *)self getForKey:a3 binder:&__block_literal_global_788];
}

uint64_t __43__SGMIFeatureStore_getInt64NSNumberForKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 getInt64AsNSNumberForColumn:0];
}

- (void)setInt64NSNumber:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SGMIFeatureStore_setInt64NSNumber_forKey___block_invoke;
  v8[3] = &unk_1E65C0388;
  id v9 = v6;
  id v7 = v6;
  [(SGMIFeatureStore *)self setValue:v7 forKey:a4 binder:v8];
}

uint64_t __44__SGMIFeatureStore_setInt64NSNumber_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":value" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

- (id)getForKey:(id)a3 binder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__36771;
  v21 = __Block_byref_object_dispose__36772;
  id v22 = 0;
  v8 = [(SGMIFeatureStore *)self _db];
  id v9 = v8;
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke;
    v12[3] = &unk_1E65C03B0;
    id v13 = v8;
    id v14 = v6;
    v16 = &v17;
    id v15 = v7;
    [v13 readTransaction:v12];
  }
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __37__SGMIFeatureStore_getForKey_binder___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke_2;
  v7[3] = &unk_1E65C0388;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SGMIFeatureStore_getForKey_binder___block_invoke_3;
  v5[3] = &unk_1E65BFA10;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 prepAndRunQuery:@"SELECT value FROM keyValueStore WHERE key = :key LIMIT 1" onPrep:v7 onRow:v5 onError:0];
}

uint64_t __37__SGMIFeatureStore_getForKey_binder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNonnullNSString:*(void *)(a1 + 32)];
}

uint64_t __37__SGMIFeatureStore_getForKey_binder___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return *MEMORY[0x1E4F93C10];
}

- (void)deleteValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMIFeatureStore *)self _db];
  long long v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__SGMIFeatureStore_deleteValueForKey___block_invoke;
    v7[3] = &unk_1E65BFD88;
    id v8 = v5;
    id v9 = v4;
    [v8 writeTransaction:v7];
  }
}

void __38__SGMIFeatureStore_deleteValueForKey___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__SGMIFeatureStore_deleteValueForKey___block_invoke_2;
  v2[3] = &unk_1E65C0388;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 prepAndRunQuery:@"DELETE FROM keyValueStore WHERE key = :key" onPrep:v2 onRow:0 onError:0];
}

uint64_t __38__SGMIFeatureStore_deleteValueForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":key" toNonnullNSString:*(void *)(a1 + 32)];
}

- (void)setValue:(id)a3 forKey:(id)a4 binder:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(SGMIFeatureStore *)self _db];
  id v10 = v9;
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke;
    v11[3] = &unk_1E65BFFF0;
    id v12 = v9;
    id v13 = v7;
    id v14 = v8;
    [v12 writeTransaction:v11];
  }
}

void __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke_2;
  v3[3] = &unk_1E65BF9E8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO keyValueStore (key, value) VALUES (:key, :value)", v3, 0, 0 onPrep onRow onError];
}

void __43__SGMIFeatureStore_setValue_forKey_binder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":key" toNonnullNSString:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearNicknameMappingTable
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  uint64_t v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__SGMIFeatureStore_clearNicknameMappingTable__block_invoke;
    v6[3] = &unk_1E65BEF88;
    id v7 = v2;
    [v7 writeTransaction:v6];
    id v4 = v7;
  }
  else
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Failed to clearNicknameMappingTable due to Class A data protection", v5, 2u);
    }
  }
}

uint64_t __45__SGMIFeatureStore_clearNicknameMappingTable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:@"DELETE FROM nicknameMapping" onPrep:0 onRow:0 onError:0];
}

- (void)purgeOldNicknameMappingRecords
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = [(SGMIFeatureStore *)self _db];
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke;
    v6[3] = &unk_1E65BF9C0;
    id v7 = v4;
    double v8 = Current + -10368000.0;
    [v7 writeTransaction:v6];
  }
}

uint64_t __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke_2;
  v3[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  void v3[4] = *(void *)(a1 + 40);
  return [v1 prepAndRunQuery:@"DELETE FROM nicknameMapping WHERE dateOfLastMatch < :oldestAcceptableDate" onPrep:v3 onRow:0 onError:0];
}

uint64_t __50__SGMIFeatureStore_purgeOldNicknameMappingRecords__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":oldestAcceptableDate" toDouble:*(double *)(a1 + 32)];
}

- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4 withDateOfMatch:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SGMIFeatureStore *)self _db];
  id v12 = v11;
  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke;
    v13[3] = &unk_1E65C0638;
    id v14 = v11;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    [v14 writeTransaction:v13];
  }
}

void __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke_2;
  v3[3] = &unk_1E65BF998;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"INSERT INTO nicknameMapping (nickname, email, count, dateOfLastMatch) VALUES (:nickname, :email, 1, :dateOfLastMatch) ON CONFLICT (nickname, email) DO UPDATE SET count = count + 1, dateOfLastMatch = max(dateOfLastMatch, :dateOfLastMatch)", v3, 0, 0 onPrep onRow onError];
}

void __77__SGMIFeatureStore_recordMappingFromNickname_toEmailAddress_withDateOfMatch___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":nickname" toNSString:v3];
  [v4 bindNamedParam:":email" toNSString:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":dateOfLastMatch");
}

- (void)recordMappingFromNickname:(id)a3 toEmailAddress:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  [(SGMIFeatureStore *)self recordMappingFromNickname:v8 toEmailAddress:v7 withDateOfMatch:v9];
}

- (id)knownEmailAddressesForNickname:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(SGMIFeatureStore *)self _db];
  id v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke;
    v9[3] = &unk_1E65C0688;
    id v10 = v6;
    id v11 = v4;
    id v12 = v5;
    [v10 readTransaction:v9];
  }
  return v5;
}

void __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_2;
  v5[3] = &unk_1E65C0388;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_3;
  v3[3] = &unk_1E65BFF78;
  id v4 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT email FROM nicknameMapping WHERE nickname = :nickname" onPrep:v5 onRow:v3 onError:0];
}

uint64_t __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":nickname" toNSString:*(void *)(a1 + 32)];
}

uint64_t __51__SGMIFeatureStore_knownEmailAddressesForNickname___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getNSStringForColumn:0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (void)reset
{
  uint64_t v3 = [(SGMIFeatureStore *)self _db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__SGMIFeatureStore_reset__block_invoke;
  v4[3] = &unk_1E65BEF88;
  v4[4] = self;
  [v3 writeTransaction:v4];
}

uint64_t __25__SGMIFeatureStore_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearSubModelsTables];
  [*(id *)(a1 + 32) clearKVStoreTable];
  [*(id *)(a1 + 32) clearSignatureStatsTable];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 clearNicknameMappingTable];
}

- (void)clearMailIntelligenceSaliencyDetection
{
  uint64_t v3 = [(SGMIFeatureStore *)self _db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SGMIFeatureStore_clearMailIntelligenceSaliencyDetection__block_invoke;
  v4[3] = &unk_1E65BEF88;
  v4[4] = self;
  [v3 writeTransaction:v4];
}

uint64_t __58__SGMIFeatureStore_clearMailIntelligenceSaliencyDetection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearSubModelsTables];
}

- (BOOL)performMaintenanceWithShouldContinueBlock:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SGMIFeatureStore *)self _db];
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = &__block_literal_global_757;
  }
  id v7 = (void *)MEMORY[0x1CB79B4C0](v6);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke_2;
  v28[3] = &unk_1E65BF970;
  id v8 = v5;
  id v29 = v8;
  id v9 = v7;
  id v30 = v9;
  id v10 = (void *)MEMORY[0x1CB79B4C0](v28);
  v32[0] = v10;
  BOOL v11 = 1;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];

  id v13 = objc_msgSend(v12, "_pas_shuffledArrayUsingRng:", 0);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(unsigned int (***)(void))(*((void *)&v24 + 1) + 8 * i);
        if (!v19[2](v19))
        {
LABEL_17:
          BOOL v11 = 0;
          goto LABEL_18;
        }
        uint64_t v20 = objc_msgSend(v14, "lastObject", (void)v24);
        if (v19 == (unsigned int (**)(void))v20)
        {
        }
        else
        {
          v21 = (void *)v20;
          char v22 = v9[2](v9);

          if ((v22 & 1) == 0) {
            goto LABEL_17;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v31 count:16];
      BOOL v11 = 1;
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v11;
}

uint64_t __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) vacuumWithShouldContinueBlock:*(void *)(a1 + 40) error:0];
}

uint64_t __62__SGMIFeatureStore_performMaintenanceWithShouldContinueBlock___block_invoke()
{
  return 1;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  *a3 = 0;
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unsigned)migration_createSignatureStatsTable
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__SGMIFeatureStore_migration_createSignatureStatsTable__block_invoke;
    v5[3] = &unk_1E65BEF88;
    id v6 = v2;
    id v3 = v2;
    [v3 writeTransaction:v5];

    LOBYTE(v2) = 4;
  }
  return v2;
}

uint64_t __55__SGMIFeatureStore_migration_createSignatureStatsTable__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS signatureStats (emailLanguage TEXT NOT NULL,regexLanguage TEXT NOT NULL,type INTEGER NOT NULL,incomingMessage BOOLEAN NOT NULL,signature TEXT NOT NULL,negativeEngagement INTEGER NOT NULL,noEngagement INTEGER NOT NULL,positiveEngagement INTEGER NOT NULL,blockedWarningCount INTEGER NOT NULL)" onPrep:0 onRow:0 onError:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 prepAndRunQuery:@"CREATE UNIQUE INDEX IF NOT EXISTS signatureStatsIdx ON signatureStats(emailLanguage, regexLanguage, type, incomingMessage, signature)", 0, 0, 0 onPrep onRow onError];
}

- (unsigned)migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __83__SGMIFeatureStore_migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey__block_invoke;
    v5[3] = &unk_1E65BEF88;
    id v6 = v2;
    id v3 = v2;
    [v3 writeTransaction:v5];

    LOBYTE(v2) = 4;
  }
  return v2;
}

uint64_t __83__SGMIFeatureStore_migration_createFollowUpTableWithAppleMailMessageIdAsPrimaryKey__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS followUpTable (appleMailMessageId TEXT NOT NULL PRIMARY KEY,messageId TEXT NOT NULL,snippet TEXT,core TEXT,score DOUBLE,startDate TEXT NOT NULL,startDateCore TEXT,endDate TEXT NOT NULL,endDateCore TEXT,alreadyReturned BOOLEAN DEFAULT false)" onPrep:0 onRow:0 onError:0];
}

- (unsigned)migration_createFollowUpTable
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__SGMIFeatureStore_migration_createFollowUpTable__block_invoke;
    v5[3] = &unk_1E65BEF88;
    id v6 = v2;
    id v3 = v2;
    [v3 writeTransaction:v5];

    LOBYTE(v2) = 4;
  }
  return v2;
}

uint64_t __49__SGMIFeatureStore_migration_createFollowUpTable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS followUpTable (id INTEGER PRIMARY KEY AUTOINCREMENT,appleMailMessageId TEXT NOT NULL,snippet TEXT,core TEXT,score DOUBLE,startDate TEXT NOT NULL,startDateCore TEXT,endDate TEXT NOT NULL,endDateCore TEXT,alreadyReturned BOOLEAN DEFAULT false)" onPrep:0 onRow:0 onError:0];
}

- (unsigned)migration_createKVTable
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__SGMIFeatureStore_migration_createKVTable__block_invoke;
    v5[3] = &unk_1E65BEF88;
    id v6 = v2;
    id v3 = v2;
    [v3 writeTransaction:v5];

    LOBYTE(v2) = 4;
  }
  return v2;
}

uint64_t __43__SGMIFeatureStore_migration_createKVTable__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepAndRunQuery:@"CREATE TABLE keyValueStore (key TEXT PRIMARY KEY NOT NULL, value) WITHOUT ROWID", 0, 0, 0 onPrep onRow onError];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 prepAndRunQuery:@"CREATE UNIQUE INDEX keyValueStoreIdx ON keyValueStore(key)" onPrep:0 onRow:0 onError:0];
}

- (unsigned)migration_createFeaturesTable
{
  uint64_t v2 = [(SGMIFeatureStore *)self _db];
  if (v2)
  {
    id v3 = (void *)v2;
    +[SGMIDomainCountingTable createTableNamed:@"features" inDatabase:v2];

    LOBYTE(v2) = 4;
  }
  return v2;
}

- (id)migrations
{
  v14[12] = *MEMORY[0x1E4F143B8];
  v13[0] = &unk_1F2536420;
  v13[1] = &unk_1F2536480;
  v14[0] = &unk_1F2536C98;
  v14[1] = &unk_1F2536CB0;
  v13[2] = &unk_1F2536498;
  v13[3] = &unk_1F25364B0;
  v14[2] = &unk_1F2536CC8;
  v14[3] = &unk_1F2536CE0;
  void v13[4] = &unk_1F25364C8;
  v13[5] = &unk_1F25364E0;
  v14[4] = &unk_1F2536CF8;
  v14[5] = &unk_1F2536D10;
  v13[6] = &unk_1F25364F8;
  id v12 = @"CREATE TABLE IF NOT EXISTS mailsPendingFollowUpProcessing (messageId TEXT NOT NULL PRIMARY KEY,spotlightIdentifier TEXT NOT NULL,date FLOAT)";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v14[6] = v2;
  v14[7] = &unk_1F2536D28;
  v13[7] = &unk_1F2536510;
  v13[8] = &unk_1F2536528;
  v11[0] = @"DELETE FROM followUpTable";
  v11[1] = @"ALTER TABLE followUpTable ADD COLUMN dateStored FLOAT";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v14[8] = v3;
  v14[9] = &unk_1F2536D40;
  v13[9] = &unk_1F2536540;
  v13[10] = &unk_1F2536558;
  id v10 = @"CREATE TABLE IF NOT EXISTS nicknameMapping (nickname TEXT NOT NULL,email TEXT NOT NULL,count INTEGER NOT NULL,dateOfLastMatch FLOAT NOT NULL,PRIMARY KEY (nickname, email)) WITHOUT ROWID";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v14[10] = v4;
  v13[11] = &unk_1F2536570;
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM signatureStats WHERE type = %d", 20);
  id v9 = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v14[11] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:12];

  return v7;
}

- (id)databaseHandle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__36771;
  id v10 = __Block_byref_object_dispose__36772;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SGMIFeatureStore_databaseHandle__block_invoke;
  v5[3] = &unk_1E65BF948;
  void v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__SGMIFeatureStore_databaseHandle__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)insertToken:(id)a3 forFeatureName:(int64_t)a4 salientCount:(int64_t)a5 regularCount:(int64_t)a6 time:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = [(SGMIFeatureStore *)self _db];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__SGMIFeatureStore_insertToken_forFeatureName_salientCount_regularCount_time___block_invoke;
  v18[3] = &unk_1E65BF920;
  v18[4] = self;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  int64_t v22 = a4;
  int64_t v23 = a5;
  int64_t v24 = a6;
  id v15 = v12;
  id v16 = v13;
  id v17 = v14;
  [v17 writeTransaction:v18];
}

void __78__SGMIFeatureStore_insertToken_forFeatureName_salientCount_regularCount_time___block_invoke(uint64_t a1)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _columnFromDate:*(void *)(a1 + 48)];
  if (([v2 hasColumn:v3] & 1) == 0) {
    [v2 addColumn:v3];
  }
  id v4 = [*(id *)(a1 + 32) _stringForFeatureName:*(void *)(a1 + 64)];
  v17[0] = v4;
  v17[1] = @"s";
  uint64_t v5 = *(void *)(a1 + 56);
  v17[2] = @"u";
  v17[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  id v7 = +[SGMIDomainCountingTable domainForStringTokens:v6];

  v16[0] = v4;
  v16[1] = @"r";
  uint64_t v8 = *(void *)(a1 + 56);
  v16[2] = @"u";
  v16[3] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v10 = +[SGMIDomainCountingTable domainForStringTokens:v9];

  v14[0] = v7;
  id v11 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v14[1] = v10;
  v15[0] = v11;
  id v12 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
  v15[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 commitDomainsAndCounts:v13 toColumn:v3];
}

- (void)_clearKVStoreUsingDatabase:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SGMIFeatureStore__clearKVStoreUsingDatabase___block_invoke;
  v5[3] = &unk_1E65BEF88;
  id v6 = v3;
  id v4 = v3;
  [v4 writeTransaction:v5];
}

uint64_t __47__SGMIFeatureStore__clearKVStoreUsingDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:@"DELETE FROM keyValueStore" onPrep:0 onRow:0 onError:0];
}

- (void)clearKVStoreTable
{
  id v3 = [(SGMIFeatureStore *)self _db];
  if (v3)
  {
    [(SGMIFeatureStore *)self _clearKVStoreUsingDatabase:v3];
  }
  else
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Failed to clearKVStoreTable due to Class A data protection", v5, 2u);
    }
  }
}

- (void)_clearSubModelsTablesUsingDatabase:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SGMIFeatureStore__clearSubModelsTablesUsingDatabase___block_invoke;
  v6[3] = &unk_1E65BFD88;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 writeTransaction:v6];
}

void __55__SGMIFeatureStore__clearSubModelsTablesUsingDatabase___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  [v1 deleteAllRows];
}

- (void)clearSubModelsTables
{
  id v3 = [(SGMIFeatureStore *)self _db];
  if (v3)
  {
    [(SGMIFeatureStore *)self _clearSubModelsTablesUsingDatabase:v3];
  }
  else
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Failed to clearSubmodelTables due to Class A data protection", v5, 2u);
    }
  }
}

- (BOOL)_applyCappingPolicy:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke;
  v15[3] = &unk_1E65BFE68;
  v15[4] = self;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v18 = v12;
  id v19 = &v20;
  id v13 = v8;
  id v17 = v13;
  [v11 writeTransaction:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 56)) {
    id v3 = *(void **)(a1 + 56);
  }
  else {
    id v3 = &__block_literal_global_646;
  }
  id v4 = (uint64_t (**)(void))MEMORY[0x1CB79B4C0](v3);
  if (v4[2]())
  {
    id v5 = [v2 currentColumns];
    id v6 = objc_msgSend(v5, "_pas_proxyArrayReversed");
    id v7 = objc_msgSend(v6, "_pas_unproxy");

    id v8 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_3;
    v12[3] = &unk_1E65BF8F8;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 64);
    id v15 = v9;
    uint64_t v16 = v10;
    void v12[4] = *(void *)(a1 + 32);
    id v13 = v7;
    id v14 = v2;
    id v11 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v35 = v7;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    v37 = a4;
    v34 = v8;
    uint64_t v9 = [v7 integerValue];
    uint64_t v10 = [*(id *)(a1 + 32) _stringForFeatureName:v9];
    v64[0] = v10;
    v64[1] = @"s";
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    v39 = +[SGMIDomainCountingTable domainForStringTokens:v11];

    id v12 = [*(id *)(a1 + 32) _stringForFeatureName:v9];
    v63[0] = v12;
    v63[1] = @"r";
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    v33 = +[SGMIDomainCountingTable domainForStringTokens:v13];

    unint64_t v38 = [v34 unsignedIntegerValue];
    v40 = objc_opt_new();
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v15)
    {
      uint64_t v36 = 0;
      uint64_t v16 = *(void *)v54;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * v17);
        id v19 = *(void **)(a1 + 48);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_4;
        v49[3] = &unk_1E65BF8A8;
        id v20 = v40;
        id v50 = v20;
        id v51 = *(id *)(a1 + 48);
        uint64_t v52 = v18;
        [v19 enumerateChildrenOfDomain:v39 depth:2 usingBlock:v49];
        if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))())
        {
          if ([v20 count] >= v38)
          {
            int v22 = 0;
            *((unsigned char *)v58 + 24) = 1;
            int v21 = 2;
          }
          else
          {
            uint64_t v36 = [v20 count];
            int v21 = 0;
            int v22 = 1;
          }
        }
        else
        {
          int v22 = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          int v21 = 1;
          *a4 = 1;
        }

        if (!v22) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_20;
        }
      }

      if ((v21 | 2) == 2) {
        goto LABEL_21;
      }
      goto LABEL_25;
    }
    uint64_t v36 = 0;
LABEL_20:

LABEL_21:
    char v23 = v40;
    if (*((unsigned char *)v58 + 24)) {
      goto LABEL_22;
    }
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    unint64_t v48 = 0;
    unint64_t v48 = v38 - [v40 count];
    v32 = *(void **)(a1 + 48);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_5;
    v43[3] = &unk_1E65BF8D0;
    id v44 = v40;
    v45 = v47;
    v46 = &v57;
    [v32 enumerateChildrenOfDomain:v33 depth:2 usingBlock:v43];
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      unsigned char *v37 = 1;

      _Block_object_dispose(v47, 8);
      goto LABEL_25;
    }

    _Block_object_dispose(v47, 8);
    char v23 = v40;
    if (*((unsigned char *)v58 + 24))
    {
LABEL_22:
      if ([v23 count] > v38)
      {
        uint64_t v24 = [v23 count];
        uint64_t v25 = [v23 count];
        long long v26 = objc_opt_new();
        uint64_t v27 = v25 - v36;
        objc_msgSend(v26, "addIndexesInRange:", arc4random_uniform(v27), v24 - v38);
        [v26 shiftIndexesStartingAtIndex:v27 by:-v27];
        [v26 shiftIndexesStartingAtIndex:0 by:v36];
        [v23 removeObjectsAtIndexes:v26];
      }
    }
    id v28 = objc_alloc(MEMORY[0x1E4F93B20]);
    v61[0] = v39;
    v61[1] = v33;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    id v30 = (void *)[v28 initWithDomainsFromArray:v29];

    v31 = *(void **)(a1 + 48);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_6;
    v41[3] = &unk_1E65BF098;
    id v42 = v40;
    [v31 deleteDomainSelection:v30 keepingDomainsPassingTest:v41];

LABEL_25:
    _Block_object_dispose(&v57, 8);

    id v8 = v34;
    goto LABEL_26;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  *a4 = 1;
LABEL_26:
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SGMIDomainCountingTable stringTokensFromDomain:v3];
  if ([v4 count] == 4)
  {
    id v5 = [v4 lastObject];
    if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0
      && [*(id *)(a1 + 40) countForColumn:*(void *)(a1 + 48) domain:v3] >= 1)
    {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
  return 1;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v3 count] == 4)
  {
    id v4 = [v3 lastObject];
    if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = *(void *)(v5 + 24);
      if (!v6)
      {
        uint64_t v7 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        goto LABEL_8;
      }
      *(void *)(v5 + 24) = v6 - 1;
    }
    uint64_t v7 = 1;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v7 = 1;
LABEL_9:

  return v7;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v3 count] == 4)
  {
    id v4 = [v3 lastObject];
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __69__SGMIFeatureStore__applyCappingPolicy_shouldContinue_usingDatabase___block_invoke_2()
{
  return 1;
}

- (BOOL)applyCappingPolicy:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SGMIFeatureStore *)self _db];
  if (v8) {
    BOOL v9 = [(SGMIFeatureStore *)self _applyCappingPolicy:v6 shouldContinue:v7 usingDatabase:v8];
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_deleteTokensForDeletedEmailAddresses:(id)a3 usingDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke;
  v10[3] = &unk_1E65C0688;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 writeTransaction:v10];
}

void __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_2;
  v5[3] = &unk_1E65BF880;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", objc_msgSend(v5, "integerValue"));
    v14[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v9 = +[SGMIDomainCountingTable domainForStringTokens:v8];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F93B20]) initWithDomain:v9];
    id v11 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_3;
    v12[3] = &unk_1E65BF098;
    id v13 = v6;
    [v11 deleteDomainSelection:v10 keepingDomainsPassingTest:v12];
  }
}

uint64_t __72__SGMIFeatureStore__deleteTokensForDeletedEmailAddresses_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v3 count] == 4)
  {
    id v4 = [v3 lastObject];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(v4, "rangeOfString:options:", *(void *)(*((void *)&v12 + 1) + 8 * v9), 2, (void)v12) != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v10 = 0;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (void)deleteTokensForDeletedEmailAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMIFeatureStore *)self _db];
  if (v5)
  {
    [(SGMIFeatureStore *)self _deleteTokensForDeletedEmailAddresses:v4 usingDatabase:v5];
  }
  else
  {
    uint64_t v6 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_1CA650000, v6, OS_LOG_TYPE_FAULT, "Unable to deleteTokensForDeletedEmailAddresses due to Class A protection", v7, 2u);
    }
  }
}

- (void)clearBucketsForDates:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(SGMIFeatureStore *)self _columnFromDate:*(void *)(*((void *)&v21 + 1) + 8 * v10)];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[SGMIFeatureStore _clearBucketForColumn:](self, "_clearBucketForColumn:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)clearBucketForDate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SGMIFeatureStore clearBucketsForDates:](self, "clearBucketsForDates:", v6, v7, v8);
}

- (void)_clearBucketForColumn:(id)a3 usingDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SGMIFeatureStore__clearBucketForColumn_usingDatabase___block_invoke;
  v10[3] = &unk_1E65C0688;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 writeTransaction:v10];
}

void __56__SGMIFeatureStore__clearBucketForColumn_usingDatabase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  if ([v2 hasColumn:*(void *)(a1 + 48)]) {
    [v2 zeroColumn:*(void *)(a1 + 48)];
  }
}

- (void)_clearBucketForColumn:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMIFeatureStore *)self _db];
  if (v5)
  {
    [(SGMIFeatureStore *)self _clearBucketForColumn:v4 usingDatabase:v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1CB79B230]();
    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SGMIFeatureStore__clearBucketForColumn___block_invoke;
    v8[3] = &unk_1E65BF358;
    id v9 = v4;
    uint64_t v10 = self;
    [(_PASLock *)lock runWithLockAcquired:v8];
  }
}

void __42__SGMIFeatureStore__clearBucketForColumn___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5[3] containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1CB79B230]();
    [v5[3] addObject:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    [*(id *)(a1 + 40) _writeJournalCommand:1 blob:v4];
  }
}

- (id)_getSGMIStoredAddressesUsingDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke;
  v13[3] = &unk_1E65C0688;
  void v13[4] = self;
  id v14 = v4;
  id v15 = v5;
  id v6 = v5;
  id v7 = v4;
  [v7 readTransaction:v13];
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_2;
  v11[3] = &unk_1E65BF858;
  id v9 = v8;
  id v12 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];

  return v9;
}

void __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [&unk_1F2536C80 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(&unk_1F2536C80);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "_stringForFeatureName:", objc_msgSend(v7, "integerValue"));
        long long v18 = v8;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        uint64_t v10 = +[SGMIDomainCountingTable domainForStringTokens:v9];

        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_639;
        v11[3] = &unk_1E65BF830;
        id v12 = *(id *)(a1 + 48);
        uint64_t v13 = v7;
        [v2 enumerateChildrenOfDomain:v10 depth:3 usingBlock:v11];
      }
      uint64_t v4 = [&unk_1F2536C80 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v4);
  }
}

void __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __57__SGMIFeatureStore__getSGMIStoredAddressesUsingDatabase___block_invoke_639(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v3 count] == 4)
  {
    uint64_t v4 = [v3 lastObject];
    uint64_t v5 = [v4 rangeOfString:@"@" options:2];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL
      && v5 == objc_msgSend(v4, "rangeOfString:options:range:", @"@", 6, v5, objc_msgSend(v4, "length") - v5))
    {
      id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (!v6)
      {
        id v7 = objc_opt_new();
        [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
      }
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v8 addObject:v4];
    }
  }

  return 1;
}

- (id)getSGMIStoredAddresses
{
  uint64_t v3 = [(SGMIFeatureStore *)self _db];
  if (v3)
  {
    uint64_t v4 = [(SGMIFeatureStore *)self _getSGMIStoredAddressesUsingDatabase:v3];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (BOOL)_purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4 usingDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke;
  v15[3] = &unk_1E65BFE68;
  v15[4] = self;
  id v11 = v10;
  id v16 = v11;
  id v12 = v9;
  id v18 = v12;
  long long v19 = &v20;
  id v13 = v8;
  id v17 = v13;
  [v11 writeTransaction:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

void __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3 && ((*(uint64_t (**)(void))(v3 + 16))() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) _columnFromDate:*(void *)(a1 + 48)];
    uint64_t v5 = [v2 currentColumns];
    uint64_t v6 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_36929);
    if (v6)
    {
      uint64_t v7 = v6;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn("-[SGMIFeatureStore _purgeTokensWhichLastUpdateWasBefore:shouldContinue:usingDatabase:]_block_invoke", "SGMIFeatureStore.m", 2322, "idx != NSNotFound");
      }
      if (v6 == [v5 count])
      {
        [v2 deleteAllRows];
      }
      else
      {
        long long v19 = objc_msgSend(v5, "subarrayWithRange:", v7, objc_msgSend(v5, "count") - v7);
        uint64_t v25 = 0;
        long long v26 = &v25;
        uint64_t v27 = 0x3032000000;
        id v28 = __Block_byref_object_copy__36771;
        id v29 = __Block_byref_object_dispose__36772;
        id v30 = 0;
        id v8 = objc_opt_new();
        id v18 = v4;
        uint64_t v9 = MEMORY[0x1E4F143A8];
        while (1)
        {
          uint64_t v10 = v26[5];
          v22[0] = v9;
          v22[1] = 3221225472;
          v22[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_2;
          v22[3] = &unk_1E65BF7E0;
          long long v24 = &v25;
          id v11 = v8;
          id v23 = v11;
          [v2 enumerateChildrenOfDomain:0 greaterThan:v10 depth:-1 limit:0 usingBlock:v22];
          if (![v11 count]) {
            break;
          }
          id v12 = [v2 firstNonZeroColumnForDomains:v11 withColumns:v19];
          id v13 = objc_alloc(MEMORY[0x1E4F93B20]);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_3;
          v20[3] = &unk_1E65BF808;
          id v14 = v12;
          id v21 = v14;
          long long v15 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v20);

          id v16 = (void *)[v13 initWithDomainsFromArray:v15];
          [v2 deleteDomainSelection:v16];
          [v11 removeAllObjects];
          uint64_t v17 = *(void *)(a1 + 56);
          if (v17 && ((*(uint64_t (**)(void))(v17 + 16))() & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;

            break;
          }
        }
        _Block_object_dispose(&v25, 8);

        uint64_t v4 = v18;
      }
    }
  }
}

BOOL __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) addObject:v4];
  unint64_t v5 = [*(id *)(a1 + 32) count];

  return v5 < 0x80;
}

BOOL __86__SGMIFeatureStore__purgeTokensWhichLastUpdateWasBefore_shouldContinue_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)purgeTokensWhichLastUpdateWasBefore:(id)a3 shouldContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SGMIFeatureStore *)self _db];
  if (v8) {
    BOOL v9 = [(SGMIFeatureStore *)self _purgeTokensWhichLastUpdateWasBefore:v6 shouldContinue:v7 usingDatabase:v8];
  }
  else {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)_subModelsStatsWithShouldContinueBlock:(id)a3 usingDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__36771;
  uint64_t v20 = __Block_byref_object_dispose__36772;
  id v21 = 0;
  id v21 = (id)objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke;
  v12[3] = &unk_1E65C03B0;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  long long v15 = &v16;
  [v8 readTransaction:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    BOOL v3 = *(void **)(a1 + 48);
  }
  else {
    BOOL v3 = &__block_literal_global_590;
  }
  id v4 = (uint64_t (**)(void))MEMORY[0x1CB79B4C0](v3);
  if (((uint64_t (*)(void))v4[2])())
  {
    unint64_t v5 = objc_opt_new();
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v5 forKeyedSubscript:@"counts"];

    id v6 = objc_opt_new();
    id v7 = objc_opt_new();
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_3;
    v43[3] = &unk_1E65BF718;
    void v43[4] = &v44;
    [v2 enumerateChildrenOfDomain:0 depth:4 usingBlock:v43];
    id v8 = [NSNumber numberWithUnsignedInteger:v45[3]];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v8 forKeyedSubscript:@"numberOfTokenEntries"];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_4;
    v37[3] = &unk_1E65BF740;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v38 = v9;
    uint64_t v39 = v10;
    id v11 = v6;
    id v40 = v11;
    id v12 = v2;
    uint64_t v13 = *(void *)(a1 + 56);
    id v41 = v12;
    uint64_t v42 = v13;
    [v12 enumerateChildrenOfDomain:0 depth:1 usingBlock:v37];
    if (v4[2](v4))
    {
      id v14 = objc_opt_new();
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v14 forKeyedSubscript:@"lastUpdates"];

      long long v15 = objc_opt_new();
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
      [v15 setLocale:v16];

      [v15 setDateFormat:@"MMM,dd"];
      uint64_t v17 = [v12 currentColumns];
      uint64_t v18 = [v12 nonZeroColumnsForDomains:v9 withColumns:v17];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_5;
      v34[3] = &unk_1E65BF768;
      v34[4] = *(void *)(a1 + 32);
      id v19 = v15;
      uint64_t v20 = *(void *)(a1 + 56);
      id v35 = v19;
      uint64_t v36 = v20;
      [v18 enumerateKeysAndObjectsUsingBlock:v34];

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_6;
      v30[3] = &unk_1E65BF7B8;
      id v21 = v11;
      uint64_t v22 = *(void *)(a1 + 32);
      id v31 = v21;
      uint64_t v32 = v22;
      id v33 = v12;
      id v23 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v30);
      if ((v4[2](v4) & 1) != 0
        && (((void (**)(void, __CFString *))v23)[2](v23, @"s"),
            long long v24 = objc_claimAutoreleasedReturnValue(),
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v24 forKeyedSubscript:@"salientTokensDistribution"], v24, v4[2](v4)))
      {
        uint64_t v25 = ((void (**)(void, __CFString *))v23)[2](v23, @"r");
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v25 forKeyedSubscript:@"regularTokensDistribution"];
      }
      else
      {
        uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v25 = *(void **)(v29 + 40);
        *(void *)(v29 + 40) = 0;
      }
    }
    else
    {
      uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
      id v19 = *(id *)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = 0;
  }
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2)
{
  BOOL v3 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  uint64_t v4 = [v3 count];

  if (v4 == 4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_4(void *a1, void *a2)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)a1[4];
  id v4 = a2;
  [v3 addObject:v4];
  unint64_t v5 = (void *)a1[5];
  id v6 = +[SGMIDomainCountingTable stringTokensFromDomain:v4];
  id v7 = [v6 firstObject];
  uint64_t v8 = [v5 _featureNameForString:v7];

  id v9 = (void *)a1[6];
  uint64_t v10 = [NSNumber numberWithInteger:v8];
  [v9 addObject:v10];

  id v11 = +[SGMIFeature prettyName:v8];
  id v12 = (void *)a1[7];
  uint64_t v13 = +[SGMIDomainCountingTable domainByAppendingToken:@"s" toDomain:v4];
  uint64_t v14 = [v12 totalForDomain:v13];

  long long v15 = (void *)a1[7];
  uint64_t v16 = +[SGMIDomainCountingTable domainByAppendingToken:@"r" toDomain:v4];

  uint64_t v17 = [v15 totalForDomain:v16];
  v34[0] = @"salientCount";
  uint64_t v18 = [NSNumber numberWithInteger:v14];
  v34[1] = @"regularCount";
  v35[0] = v18;
  id v19 = [NSNumber numberWithInteger:v17];
  v35[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  id v21 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:@"counts"];
  [v21 setObject:v20 forKeyedSubscript:v11];

  v32[0] = @"salientCount";
  uint64_t v22 = NSNumber;
  id v23 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:@"overallCounts"];
  long long v24 = [v23 objectForKeyedSubscript:@"salientCount"];
  uint64_t v25 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v24, "unsignedIntegerValue") + v14);
  v32[1] = @"regularCount";
  v33[0] = v25;
  uint64_t v26 = NSNumber;
  uint64_t v27 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:@"overallCounts"];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"regularCount"];
  uint64_t v29 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + v17);
  v33[1] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  [*(id *)(*(void *)(a1[8] + 8) + 40) setObject:v30 forKeyedSubscript:@"overallCounts"];

  return 1;
}

void __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  long long v24 = v5;
  uint64_t v8 = +[SGMIDomainCountingTable stringTokensFromDomain:v5];
  id v9 = [v8 firstObject];
  uint64_t v10 = [v7 _featureNameForString:v9];

  id v23 = +[SGMIFeature prettyName:v10];
  id v11 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
        uint64_t v17 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v18 = [*(id *)(a1 + 32) _dateFromColumn:v16];
        id v19 = [*(id *)(a1 + 40) stringFromDate:v18];
        uint64_t v20 = [v11 lastObject];
        char v21 = [v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          [v11 addObject:v19];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"lastUpdates"];
  [v22 setObject:v11 forKeyedSubscript:v23];
}

id __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  uint64_t v19 = a1;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v24 = objc_msgSend(*(id *)(v19 + 40), "_stringForFeatureName:", objc_msgSend(v23, "integerValue"));
        v31[0] = v24;
        v31[1] = v21;
        id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
        id v5 = +[SGMIDomainCountingTable domainForStringTokens:v4];

        id v6 = objc_opt_new();
        id v7 = *(void **)(v19 + 48);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_7;
        v25[3] = &unk_1E65BF790;
        id v8 = v6;
        id v26 = v8;
        [v7 enumerateChildrenOfDomain:v5 depth:2 usingBlock:v25];
        id v9 = objc_opt_new();
        uint64_t v10 = [v8 count];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = 0;
          do
          {
            uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12];
            uint64_t v14 = [v8 countForObject:v13];
            uint64_t v15 = [NSNumber numberWithUnsignedInteger:v14];
            [v9 addObject:v15];

            v11 -= v14 != 0;
            ++v12;
          }
          while (v11);
        }
        [v20 setObject:v9 forKeyedSubscript:v23];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  return v20;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v5 count] == 4)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithInt:__clz(a3 | 1) ^ 0x3F];
    [v6 addObject:v7];
  }
  return 1;
}

uint64_t __73__SGMIFeatureStore__subModelsStatsWithShouldContinueBlock_usingDatabase___block_invoke_2()
{
  return 1;
}

- (id)subModelsStatsWithShouldContinueBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SGMIFeatureStore *)self _db];
  if (v5)
  {
    id v6 = [(SGMIFeatureStore *)self _subModelsStatsWithShouldContinueBlock:v4 usingDatabase:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)subModelsStats
{
  id v4 = [(SGMIFeatureStore *)self subModelsStatsWithShouldContinueBlock:0];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGMIFeatureStore.m", 2144, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v4;
}

- (id)submodelsAgesInDays
{
  BOOL v3 = objc_opt_new();
  id v4 = [(SGMIFeatureStore *)self _db];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke;
  v10[3] = &unk_1E65C0688;
  void v10[4] = self;
  id v11 = v4;
  id v5 = v3;
  id v12 = v5;
  id v6 = v4;
  [v6 readTransaction:v10];
  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke(uint64_t a1)
{
  v16[7] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _stringForFeatureName:1000];
  v16[0] = v2;
  BOOL v3 = [*(id *)(a1 + 32) _stringForFeatureName:1001];
  v16[1] = v3;
  id v4 = [*(id *)(a1 + 32) _stringForFeatureName:1002];
  v16[2] = v4;
  id v5 = [*(id *)(a1 + 32) _stringForFeatureName:1003];
  v16[3] = v5;
  id v6 = [*(id *)(a1 + 32) _stringForFeatureName:1004];
  void v16[4] = v6;
  id v7 = [*(id *)(a1 + 32) _stringForFeatureName:1005];
  v16[5] = v7;
  id v8 = [*(id *)(a1 + 32) _stringForFeatureName:1008];
  v16[6] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:7];
  uint64_t v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_583);

  id v11 = [v13 currentColumns];
  id v12 = [v13 firstNonZeroColumnForDomains:v10 withColumns:v11];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_3;
  v14[3] = &unk_1E65BF6D0;
  v14[4] = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  [v12 enumerateKeysAndObjectsUsingBlock:v14];
}

void __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  id v8 = [v7 firstObject];
  uint64_t v9 = [v5 _featureNameForString:v8];

  id v15 = [*(id *)(a1 + 32) _dateFromColumn:v6];

  uint64_t v10 = NSNumber;
  [v15 timeIntervalSinceNow];
  id v12 = [v10 numberWithDouble:v11 / 86400.0];
  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = [NSNumber numberWithInteger:v9];
  [v13 setObject:v12 forKeyedSubscript:v14];
}

id __39__SGMIFeatureStore_submodelsAgesInDays__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v7 count:1];
  id v5 = +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4, v7, v8);

  return v5;
}

- (BOOL)_areSubmodelsEmptyUsingDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SGMIFeatureStore__areSubmodelsEmptyUsingDatabase___block_invoke;
  v8[3] = &unk_1E65C0700;
  uint64_t v10 = &v11;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [v5 readTransaction:v8];
  char v6 = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__SGMIFeatureStore__areSubmodelsEmptyUsingDatabase___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v2 = [v3 currentColumns];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [MEMORY[0x1E4F1CBF0] isEqual:v2];
}

- (BOOL)areSubmodelsEmpty
{
  id v3 = [(SGMIFeatureStore *)self _db];
  if (v3) {
    BOOL v4 = [(SGMIFeatureStore *)self _areSubmodelsEmptyUsingDatabase:v3];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5 usingDatabase:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "commitNaiveBayesModel:%@ probabilityFeatureName:%ld updateDate:%@", buf, 0x20u);
  }

  char v14 = [(SGMIFeatureStore *)self _stringForFeatureName:a4];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke;
  v19[3] = &unk_1E65BF020;
  v19[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v22 = v14;
  id v23 = v10;
  id v15 = v10;
  id v16 = v14;
  id v17 = v11;
  id v18 = v12;
  [v18 writeTransaction:v19];
}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke(uint64_t a1)
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _columnFromDate:*(void *)(a1 + 48)];
  if ([v2 hasColumn:v3]) {
    goto LABEL_8;
  }
  BOOL v4 = [v2 currentColumns];
  if ((unint64_t)[v4 count] < 0x180)
  {
    [v2 addColumn:v3];
LABEL_7:

LABEL_8:
    v26[0] = *(void *)(a1 + 56);
    v26[1] = @"s";
    v26[2] = @"m";
    v26[3] = &stru_1F24EEF20;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    uint64_t v19 = +[SGMIDomainCountingTable domainForStringTokens:v6];

    v25[0] = *(void *)(a1 + 56);
    v25[1] = @"r";
    v25[2] = @"m";
    v25[3] = &stru_1F24EEF20;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    uint64_t v8 = +[SGMIDomainCountingTable domainForStringTokens:v7];

    v23[0] = v19;
    id v9 = [*(id *)(a1 + 64) mailCount];
    id v10 = [v9 salientCount];
    v23[1] = v8;
    v24[0] = v10;
    id v11 = [*(id *)(a1 + 64) mailCount];
    id v12 = [v11 regularCount];
    v24[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    char v14 = (void *)[v13 mutableCopy];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_2;
    v20[3] = &unk_1E65BF6A8;
    id v21 = *(id *)(a1 + 56);
    id v22 = v14;
    id v15 = v14;
    id v16 = (void (**)(void, void, void))MEMORY[0x1CB79B4C0](v20);
    id v17 = [*(id *)(a1 + 64) unigramTokensCount];
    ((void (**)(void, __CFString *, void *))v16)[2](v16, @"u", v17);

    id v18 = [*(id *)(a1 + 64) bigramTokensCount];
    ((void (**)(void, __CFString *, void *))v16)[2](v16, @"b", v18);

    [v2 commitDomainsAndCounts:v15 toColumn:v3];
    goto LABEL_9;
  }
  id v5 = [v4 firstObject];
  if (CFStringCompare(v5, v3, 0) == kCFCompareLessThan)
  {
    [v2 recycleColumn:v5 asColumn:v3];

    goto LABEL_7;
  }

LABEL_9:
}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v19[0] = *(void *)(a1 + 32);
  v19[1] = @"s";
  v19[2] = a2;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 arrayWithObjects:v19 count:3];
  id v9 = +[SGMIDomainCountingTable domainForStringTokens:v8];

  v18[0] = *(void *)(a1 + 32);
  v18[1] = @"r";
  v18[2] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  id v11 = +[SGMIDomainCountingTable domainForStringTokens:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_3;
  v14[3] = &unk_1E65BF680;
  id v15 = v9;
  id v16 = *(id *)(a1 + 40);
  id v17 = v11;
  id v12 = v11;
  id v13 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v14];
}

void __91__SGMIFeatureStore__commitNaiveBayesModel_probabilityFeatureName_updateDate_usingDatabase___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v11 = +[SGMIDomainCountingTable domainByAppendingToken:v7 toDomain:v5];
  uint64_t v8 = [v6 salientCount];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v11];

  id v9 = +[SGMIDomainCountingTable domainByAppendingToken:v7 toDomain:*(void *)(a1 + 48)];

  id v10 = [v6 regularCount];

  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9];
}

- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4 updateDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SGMIFeatureStore *)self _db];
  if (v10)
  {
    [(SGMIFeatureStore *)self _commitNaiveBayesModel:v8 probabilityFeatureName:a4 updateDate:v9 usingDatabase:v10];
  }
  else
  {
    id v11 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "Discarding commitNaiveBayesModel commit due to data protection", v12, 2u);
    }
  }
}

- (void)commitNaiveBayesModel:(id)a3 probabilityFeatureName:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 date];
  [(SGMIFeatureStore *)self commitNaiveBayesModel:v7 probabilityFeatureName:a4 updateDate:v8];
}

- (void)_deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3 usingDatabase:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__SGMIFeatureStore__deleteNaiveBayesModelForProbabilityFeatureName_usingDatabase___block_invoke;
  v8[3] = &unk_1E65BFEB0;
  void v8[4] = self;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [v7 writeTransaction:v8];
}

void __82__SGMIFeatureStore__deleteNaiveBayesModelForProbabilityFeatureName_usingDatabase___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tx", *(void *)(a1 + 48));
  v6[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v5 = +[SGMIDomainCountingTable domainForStringTokens:v4];
  [v2 deleteDomain:v5];
}

- (void)deleteNaiveBayesModelForProbabilityFeatureName:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SGMIFeatureStore *)self _db];
  if (v5)
  {
    [(SGMIFeatureStore *)self _deleteNaiveBayesModelForProbabilityFeatureName:a3 usingDatabase:v5];
  }
  else
  {
    id v6 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      int64_t v8 = a3;
      _os_log_fault_impl(&dword_1CA650000, v6, OS_LOG_TYPE_FAULT, "Not performing deleteNaiveBayesModelForProbabilityFeatureName:%ld due to data protection", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_clearSignatureStatsTableUsingDatabase:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SGMIFeatureStore__clearSignatureStatsTableUsingDatabase___block_invoke;
  v5[3] = &unk_1E65BEF88;
  id v6 = v3;
  id v4 = v3;
  [v4 writeTransaction:v5];
}

uint64_t __59__SGMIFeatureStore__clearSignatureStatsTableUsingDatabase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunQuery:@"DELETE FROM signatureStats" onPrep:0 onRow:0 onError:0];
}

- (void)clearSignatureStatsTable
{
  id v3 = [(SGMIFeatureStore *)self _db];
  if (v3)
  {
    [(SGMIFeatureStore *)self _clearSignatureStatsTableUsingDatabase:v3];
  }
  else
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "Failed to clearSignatureStatsTable due to Class A data protection", v5, 2u);
    }
  }
}

- (id)followUpWarningStats
{
  id v2 = [(SGMIFeatureStore *)self _db];
  id v3 = v2;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__36771;
  char v14 = __Block_byref_object_dispose__36772;
  id v15 = 0;
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__SGMIFeatureStore_followUpWarningStats__block_invoke;
    v7[3] = &unk_1E65C0728;
    id v8 = v2;
    uint64_t v9 = &v10;
    [v8 readTransaction:v7];

    id v4 = (void *)v11[5];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __40__SGMIFeatureStore_followUpWarningStats__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SGMIFeatureStore_followUpWarningStats__block_invoke_3;
  v3[3] = &unk_1E65C03F8;
  id v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 prepAndRunQuery:@"SELECT SUM(positiveEngagement), SUM(noEngagement), SUM(negativeEngagement) FROM signatureStats WHERE (type=:followUpAsk OR type=:followUpQuestion) AND (emailLanguage='+' OR emailLanguage='*')", &__block_literal_global_573, v3, 0 onPrep onRow onError];
}

uint64_t __40__SGMIFeatureStore_followUpWarningStats__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SGMISimpleEngagementStats alloc];
  uint64_t v5 = [v3 getInt64AsNSNumberForColumn:0];
  id v6 = (void *)v5;
  if (v5) {
    int v7 = (void *)v5;
  }
  else {
    int v7 = &unk_1F2536408;
  }
  uint64_t v8 = [v3 getInt64AsNSNumberForColumn:1];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = &unk_1F2536408;
  }
  id v11 = [v3 getInt64AsNSNumberForColumn:2];

  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = &unk_1F2536408;
  }
  uint64_t v13 = [(SGMISimpleEngagementStats *)v4 initWithPositiveEngagement:v7 noEngagement:v10 negativeEngagement:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  return *MEMORY[0x1E4F93C10];
}

void __40__SGMIFeatureStore_followUpWarningStats__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bindNamedParam:":followUpAsk" toInteger:30];
  [v2 bindNamedParam:":followUpQuestion" toInteger:31];
}

- (id)warningStatsForLogging:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    unint64_t v6 = 0;
    goto LABEL_10;
  }
  int64_t v5 = [(SGMIFeatureStore *)self warningStatsCount];
  if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(SGMIFeatureStore *)self getInt64NSNumberForKey:@"countOnLastRegexSignatureStatsLoggingAction"];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = &unk_1F2536408;
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    if (v11 / 10 >= (uint64_t)(v6 / 0xA))
    {
      uint64_t v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGMIFeatureStore will not return SGMIMetricsRegexSignatureStats for sampling reasons", buf, 2u);
      }
      uint64_t v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
LABEL_10:
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = [(SGMIFeatureStore *)self _db];
    uint64_t v12 = v14;
    if (v14)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_2;
      v17[3] = &unk_1E65BFFF0;
      id v18 = v14;
      id v19 = v13;
      id v20 = &__block_literal_global_552;
      [v18 readTransaction:v17];
    }
    if (v3)
    {
      id v15 = [NSNumber numberWithInteger:v6];
      [(SGMIFeatureStore *)self setInt64NSNumber:v15 forKey:@"countOnLastRegexSignatureStatsLoggingAction"];
    }
    goto LABEL_14;
  }
  uint64_t v13 = 0;
LABEL_15:
  return v13;
}

void __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_3;
  v6[3] = &unk_1E65BF658;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT key, value FROM keyValueStore", 0, v6, 0 onPrep onRow onError];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_4;
  v4[3] = &unk_1E65BFF78;
  BOOL v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"SELECT emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount FROM signatureStats", 0, v4, 0 onPrep onRow onError];
}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nonnullNSStringForColumn:0];
  if ([@"totalNumberOfEmailsProcessedForAttachmentDetection" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"totalNumberOfEmailsProcessedForRecipientDetection" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"totalNumberOfEmailsProcessedForFollowUpDetection" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachment" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"numberOfLargeIncomingMailsWithAttachment" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachment" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  else if ([@"numberOfLargeOutgoingMailsWithAttachment" isEqualToString:v4])
  {
    [*(id *)(a1 + 32) setNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()];
  }
  id v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v5;
}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [v3 getNSStringForColumnName:"emailLanguage" table:"signatureStats"];
  [v4 setEmailLanguage:v5];

  unint64_t v6 = [v3 getNSStringForColumnName:"regexLanguage" table:"signatureStats"];
  [v4 setRegexLanguage:v6];

  objc_msgSend(v4, "setType:", objc_msgSend(v3, "getInt64ForColumnName:table:", "type", "signatureStats"));
  objc_msgSend(v4, "setIncomingMessage:", objc_msgSend(v3, "getInt64ForColumnName:table:", "incomingMessage", "signatureStats") != 0);
  id v7 = [v3 getNSStringForColumnName:"signature" table:"signatureStats"];
  id v8 = +[SGMIFeatureStore nsDataFromSignature:v7];
  [v4 setSignature:v8];

  objc_msgSend(v4, "setNegativeEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "negativeEngagement", "signatureStats"));
  objc_msgSend(v4, "setNoEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "noEngagement", "signatureStats"));
  objc_msgSend(v4, "setPositiveEngagement:", objc_msgSend(v3, "getInt64ForColumnName:table:", "positiveEngagement", "signatureStats"));
  uint64_t v9 = [v3 getInt64ForColumnName:"blockedWarningCount" table:"signatureStats"];

  [v4 setBlockedWarningCount:v9];
  [*(id *)(a1 + 32) addStats:v4];
  id v10 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v10;
}

uint64_t __43__SGMIFeatureStore_warningStatsForLogging___block_invoke(uint64_t a1, void *a2)
{
  return (20 * ((int)([a2 getInt64ForColumn:1] + 9) / 20));
}

- (int64_t)warningStatsCount
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = -1;
  id v2 = [(SGMIFeatureStore *)self _db];
  id v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __37__SGMIFeatureStore_warningStatsCount__block_invoke;
    v6[3] = &unk_1E65C0728;
    id v7 = v2;
    id v8 = &v9;
    [v7 readTransaction:v6];
  }
  int64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __37__SGMIFeatureStore_warningStatsCount__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__SGMIFeatureStore_warningStatsCount__block_invoke_2;
  v3[3] = &unk_1E65C03F8;
  id v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 prepAndRunQuery:@"SELECT SUM(negativeEngagement), SUM(noEngagement), SUM(positiveEngagement), SUM(blockedWarningCount) FROM signatureStats", 0, v3, 0 onPrep onRow onError];
}

uint64_t __37__SGMIFeatureStore_warningStatsCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 getIntegerForColumn:0] & 1) != 0
    || ([v3 getIntegerForColumn:1] & 1) != 0
    || ([v3 getIntegerForColumn:2] & 1) != 0)
  {
    int64_t v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "SGMIFeatureStore: Inconsistent state of the DB.", v14, 2u);
    }
  }
  uint64_t v5 = [v3 getIntegerForColumn:0];
  if (v5 >= 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v5 + 1;
  }
  uint64_t v7 = [v3 getIntegerForColumn:1];
  if (v7 >= 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  uint64_t v9 = v8 >> 1;
  uint64_t v10 = [v3 getIntegerForColumn:2];
  if (v10 >= 0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v10 + 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9
                                                              + (v6 >> 1)
                                                              + (v11 >> 1)
                                                              + [v3 getIntegerForColumn:3];
  uint64_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93C10];

  return *v12;
}

- (void)updateFollowUpDetectionStatsWithWarning:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:@"totalNumberOfEmailsProcessedForFollowUpDetection"];
  if (v4)
  {
    uint64_t v5 = [v4 signature];
    uint64_t v6 = [v5 componentsSeparatedByString:@"-"];

    if ([v6 count] == 2)
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      uint64_t v8 = [v6 objectAtIndexedSubscript:1];
      uint64_t v9 = [v4 type];
      uint64_t v10 = [v9 integerValue];

      if (!v10)
      {
        uint64_t v11 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          id v17 = [v4 type];
          *(_DWORD *)buf = 138412290;
          id v25 = v17;
          _os_log_fault_impl(&dword_1CA650000, v11, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Unsupported type: %@", buf, 0xCu);
        }
      }
      uint64_t v12 = [v4 type];
      int v13 = [v12 integerValue];

      uint64_t v14 = [(SGMIFeatureStore *)self _db];
      id v15 = v14;
      if (v14)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke;
        void v18[3] = &unk_1E65BF610;
        id v19 = v14;
        id v20 = v4;
        id v21 = v7;
        int v23 = v13;
        id v22 = v8;
        [v19 writeTransaction:v18];

        id v16 = v19;
      }
      else
      {
        id v16 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "Follow Up. [updateFollowUpDetectionStatsWithWarning] Can't access the db.", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v7 = sgMailIntelligenceLogHandle();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v8 = [v4 signature];
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_fault_impl(&dword_1CA650000, v7, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", buf, 0xCu);
    }

    goto LABEL_17;
  }
  uint64_t v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "Follow Up. [updateFollowUpDetectionStatsWithWarning] warning is nil. Nothing will be stored.", buf, 2u);
  }
LABEL_18:
}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_2;
  v9[3] = &unk_1E65BF5E8;
  id v2 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  int v13 = *(_DWORD *)(a1 + 64);
  id v12 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, 0, 1, 0, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET noEngagement = noEngagement + 1", v9, 0, 0 onPrep onRow onError];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_3;
  v4[3] = &unk_1E65BF5E8;
  id v5 = *(id *)(a1 + 48);
  int v8 = *(_DWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v3 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('*', :regexLanguage, :type, :incomingMessage, :signature, 0, 1, 0, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET noEngagement = noEngagement + 1", v4, 0, 0 onPrep onRow onError];
}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 detectedLanguage];
  [v6 bindNamedParam:":emailLanguage" toNSString:v4];

  [v6 bindNamedParam:":regexLanguage" toNSString:*(void *)(a1 + 40)];
  [v6 bindNamedParam:":type" toInteger:*(int *)(a1 + 56)];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  [v6 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v5];

  [v6 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
}

void __60__SGMIFeatureStore_updateFollowUpDetectionStatsWithWarning___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":regexLanguage" toNSString:v3];
  [v5 bindNamedParam:":type" toInteger:*(int *)(a1 + 56)];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  [v5 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v4];

  [v5 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
}

- (void)updateRecipientDetectionStatsWarningRaised:(BOOL)a3
{
  BOOL v3 = a3;
  [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:@"totalNumberOfEmailsProcessedForRecipientDetection"];
  if (v3)
  {
    [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:@"totalNumberOfRaisedMissingRecipientWarning"];
  }
}

- (void)updateAttachmentDetectionStatsOnMailWithTextContent:(id)a3 attachments:(id)a4 warningRaised:(BOOL)a5 attachmentPredicted:(BOOL)a6 isIncomingMail:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v16 = a4;
  id v12 = a3;
  [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:@"totalNumberOfEmailsProcessedForAttachmentDetection"];
  unint64_t v13 = [v12 length];

  if (v13 >= 0x201
    && [v16 indexOfObjectPassingTest:&__block_literal_global_538] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v7 ? @"numberOfLargeIncomingMailsWithAttachment" : @"numberOfLargeOutgoingMailsWithAttachment";
    [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:v14];
    if (v8)
    {
      if (v7) {
        id v15 = @"numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachment";
      }
      else {
        id v15 = @"numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachment";
      }
      [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:v15];
    }
  }
  if (v9) {
    [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:@"totalNumberOfRaisedMissingAttachmentWarning"];
  }
}

BOOL __133__SGMIFeatureStore_updateAttachmentDetectionStatsOnMailWithTextContent_attachments_warningRaised_attachmentPredicted_isIncomingMail___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 fileSizeInBytes];
  BOOL v3 = (unint64_t)[v2 unsignedIntegerValue] > 0x100000;

  return v3;
}

- (id)shouldExposeWarning:(id)a3 updateAction:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [v6 signature];
  BOOL v8 = [v7 componentsSeparatedByString:@"-"];

  if ([v8 count] == 2)
  {
    BOOL v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [v8 objectAtIndexedSubscript:1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = 10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v18 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf) = 0;
          _os_log_fault_impl(&dword_1CA650000, v18, OS_LOG_TYPE_FAULT, "Unsupported SGMailIntelligenceWarning for method shouldExposeWarning", (uint8_t *)&buf, 2u);
        }

        id v12 = (void *)MEMORY[0x1E4F1CC38];
        goto LABEL_21;
      }
      int v11 = 20;
    }
    if (a4) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = -1;
    }
    uint64_t v14 = v13 - (a4 == 1);
    if (a4 == 2) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v14;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    id v16 = [(SGMIFeatureStore *)self _db];
    id v17 = v16;
    if (v16)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke;
      v21[3] = &unk_1E65BF5A0;
      id v22 = v16;
      id v23 = v6;
      long long v24 = v9;
      int v30 = v11;
      BOOL v27 = a4 == 0;
      uint64_t v28 = v15;
      BOOL v29 = a4 == 1;
      id v25 = v10;
      p_long long buf = &buf;
      [v22 writeTransaction:v21];
    }
    id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];

    _Block_object_dispose(&buf, 8);
LABEL_21:

    goto LABEL_22;
  }
  BOOL v9 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    id v20 = [v6 signature];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", (uint8_t *)&buf, 0xCu);
  }
  id v12 = (void *)MEMORY[0x1E4F1CC28];
LABEL_22:

  return v12;
}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke(uint64_t a1)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_2;
  v12[3] = &unk_1E65BF578;
  id v2 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  int v18 = *(_DWORD *)(a1 + 96);
  id v15 = *(id *)(a1 + 56);
  long long v16 = *(_OWORD *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 88);
  [v2 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, :noEngagement, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, noEngagement = noEngagement + :noEngagement, positiveEngagement = positiveEngagement + :positiveEngagement", v12, 0, 0 onPrep onRow onError];
  BOOL v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_3;
  v5[3] = &unk_1E65BF578;
  id v6 = *(id *)(a1 + 48);
  int v11 = *(_DWORD *)(a1 + 96);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 88);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_4;
  v4[3] = &unk_1E65C03F8;
  void v4[4] = *(void *)(a1 + 64);
  [v3 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('+', :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, :noEngagement, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, noEngagement = noEngagement + :noEngagement, positiveEngagement = positiveEngagement + :positiveEngagement, blockedWarningCount = blockedWarningCount + min(1, max(0, 1 + negativeEngagement - positiveEngagement - :positiveEngagement                                                                         - :maxAllowedNegativeUserEngagementDiffToExposeAWarning))RETURNING negativeEngagement, positiveEngagement, blockedWarningCount", v5, v4, 0 onPrep onRow onError];
}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 detectedLanguage];
  [v6 bindNamedParam:":emailLanguage" toNSString:v4];

  [v6 bindNamedParam:":regexLanguage" toNSString:*(void *)(a1 + 40)];
  [v6 bindNamedParam:":type" toInteger:*(int *)(a1 + 80)];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  [v6 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v5];

  [v6 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
  [v6 bindNamedParam:":negativeEngagement" toInteger:*(void *)(a1 + 56)];
  [v6 bindNamedParam:":noEngagement" toInteger:*(void *)(a1 + 64)];
  [v6 bindNamedParam:":positiveEngagement" toInteger:*(void *)(a1 + 72)];
}

void __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":regexLanguage" toNSString:v3];
  [v5 bindNamedParam:":type" toInteger:*(int *)(a1 + 80)];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  [v5 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v4];

  [v5 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
  [v5 bindNamedParam:":negativeEngagement" toInteger:*(void *)(a1 + 56)];
  [v5 bindNamedParam:":noEngagement" toInteger:*(void *)(a1 + 64)];
  [v5 bindNamedParam:":positiveEngagement" toInteger:*(void *)(a1 + 72)];
  [v5 bindNamedParam:":maxAllowedNegativeUserEngagementDiffToExposeAWarning" toInteger:3];
}

uint64_t __53__SGMIFeatureStore_shouldExposeWarning_updateAction___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnAlias:"negativeEngagement"];
  uint64_t v5 = [v3 getInt64ForColumnAlias:"positiveEngagement"];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 - v5 < 3;
  return *MEMORY[0x1E4F93C10];
}

- (id)shouldExposeWarning:(id)a3
{
  return [(SGMIFeatureStore *)self shouldExposeWarning:a3 updateAction:2];
}

- (void)incrementUserEngagement:(BOOL)a3 forFollowUpWarning:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = sgMailIntelligenceLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      long long v9 = @"kTotalNumberOfWarningsForFollowUpWithNegativeEngagement";
      if (v4) {
        long long v9 = @"kTotalNumberOfWarningsForFollowUpWithPositiveEngagement";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v32 = v9;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement] Incrementing %@", buf, 0xCu);
    }

    if (v4) {
      uint64_t v10 = @"totalNumberOfWarningsForFollowUpWithPositiveEngagement";
    }
    else {
      uint64_t v10 = @"totalNumberOfWarningsForFollowUpWithNegativeEngagement";
    }
    [(SGMIFeatureStore *)self incrementInt64NSNumber:&unk_1F2536420 forKey:v10];
    int v11 = [v6 signature];
    id v7 = [v11 componentsSeparatedByString:@"-"];

    if ([v7 count] == 2)
    {
      id v12 = [v7 objectAtIndexedSubscript:0];
      id v13 = [v7 objectAtIndexedSubscript:1];
      id v14 = [v6 type];
      uint64_t v15 = [v14 integerValue];

      if (!v15)
      {
        long long v16 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          id v23 = [v6 type];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v32 = v23;
          _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Unsupported type: %@", buf, 0xCu);
        }
      }
      uint64_t v17 = [v6 type];
      int v18 = [v17 integerValue];

      id v19 = [(SGMIFeatureStore *)self _db];
      id v20 = v19;
      if (v19)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke;
        v24[3] = &unk_1E65BF550;
        id v25 = v19;
        id v26 = v6;
        BOOL v27 = v12;
        int v29 = v18;
        id v28 = v13;
        BOOL v30 = v4;
        [v25 writeTransaction:v24];

        id v21 = v25;
      }
      else
      {
        id v21 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement:forFollowUpWarning] Can't access the db.", buf, 2u);
        }
      }
    }
    else
    {
      id v12 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v22 = [v6 signature];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v32 = v22;
        _os_log_fault_impl(&dword_1CA650000, v12, OS_LOG_TYPE_FAULT, "SGMIFeatureStore Error in signature format: %@", buf, 0xCu);
      }
    }
  }
  else if (v8)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Follow Up. [incrementUserEngagement] warning is nil. Nothing will be stored.", buf, 2u);
  }
}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_2;
  v10[3] = &unk_1E65BF528;
  id v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  int v14 = *(_DWORD *)(a1 + 64);
  id v13 = *(id *)(a1 + 56);
  char v15 = *(unsigned char *)(a1 + 68);
  [v2 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES (:emailLanguage, :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, 0, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, positiveEngagement = positiveEngagement + :positiveEngagement, noEngagement = noEngagement - 1", v10, 0, 0 onPrep onRow onError];
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_3;
  v4[3] = &unk_1E65BF528;
  id v5 = *(id *)(a1 + 48);
  int v8 = *(_DWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  char v9 = *(unsigned char *)(a1 + 68);
  [v3 prepAndRunQuery:@"INSERT INTO signatureStats (emailLanguage, regexLanguage, type, incomingMessage, signature, negativeEngagement, noEngagement, positiveEngagement, blockedWarningCount) VALUES ('*', :regexLanguage, :type, :incomingMessage, :signature, :negativeEngagement, 0, :positiveEngagement, 0) ON CONFLICT (emailLanguage, regexLanguage, type, incomingMessage, signature) DO UPDATE SET negativeEngagement = negativeEngagement + :negativeEngagement, positiveEngagement = positiveEngagement + :positiveEngagement, noEngagement = noEngagement - 1", v4, 0, 0 onPrep onRow onError];
}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 detectedLanguage];
  [v4 bindNamedParam:":emailLanguage" toNSString:v5];

  [v4 bindNamedParam:":regexLanguage" toNSString:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":type" toInteger:*(int *)(a1 + 56)];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isIncomingMessage"));
  [v4 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v6];

  [v4 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
  id v7 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 60) == 0];
  [v4 bindNamedParam:":negativeEngagement" toInt64AsNSNumber:v7];

  id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
  [v4 bindNamedParam:":positiveEngagement" toInt64AsNSNumber:v8];
}

void __63__SGMIFeatureStore_incrementUserEngagement_forFollowUpWarning___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":regexLanguage" toNSString:v3];
  [v4 bindNamedParam:":type" toInteger:*(int *)(a1 + 56)];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isIncomingMessage"));
  [v4 bindNamedParam:":incomingMessage" toInt64AsNSNumber:v5];

  [v4 bindNamedParam:":signature" toNSString:*(void *)(a1 + 48)];
  id v6 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 60) == 0];
  [v4 bindNamedParam:":negativeEngagement" toInt64AsNSNumber:v6];

  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
  [v4 bindNamedParam:":positiveEngagement" toInt64AsNSNumber:v7];
}

- (id)incrementUserEngagement:(BOOL)a3 forWarning:(id)a4
{
  return [(SGMIFeatureStore *)self shouldExposeWarning:a4 updateAction:a3];
}

- (id)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = objc_opt_new();
  id v12 = [(SGMIFeatureStore *)self _db];
  if (v12)
  {
    uint64_t v13 = 1004;
    if (a3 != 1) {
      uint64_t v13 = 0;
    }
    if (a3) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 1000;
    }
    char v15 = [NSNumber numberWithUnsignedInteger:a6];
    id v28 = v12;
    long long v16 = [(SGMIFeatureStore *)self _highlyDiscriminantTokensForFeature:v14 minCount:a4 minRatio:&unk_1F2536C68 domains:v15 limit:v12 usingDatabase:a5];

    uint64_t v17 = [(SGMIFeatureStore *)self getUnsubscriptionOpportunitiesSuggestionsDenyListForField:a3];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v24 = [v23 token];
          char v25 = [v17 containsObject:v24];

          if ((v25 & 1) == 0)
          {
            id v26 = (void *)[objc_alloc(MEMORY[0x1E4F5DA90]) initWithUnsubscriptionRuleField:a3 tokenCounts:v23];
            [v11 addObject:v26];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
    }

    id v12 = v28;
  }

  return v11;
}

- (id)getUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3
{
  id v4 = [(SGMIFeatureStore *)self _keyForField:a3];
  id v5 = [(SGMIFeatureStore *)self getNSStringForKey:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v7 = [v5 componentsSeparatedByString:@","];
    id v8 = (void *)[v6 initWithArray:v7];
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (void)setUnsubscriptionOpportunitiesSuggestionsDenyListForField:(int64_t)a3 toValues:(id)a4
{
  objc_msgSend(a4, "_pas_mappedArrayWithTransform:", &__block_literal_global_494);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(v8, "_pas_componentsJoinedByString:", @",");
  id v7 = [(SGMIFeatureStore *)self _keyForField:a3];
  [(SGMIFeatureStore *)self setNSString:v6 forKey:v7];
}

uint64_t __87__SGMIFeatureStore_setUnsubscriptionOpportunitiesSuggestionsDenyListForField_toValues___block_invoke(uint64_t a1, void *a2)
{
  return [a2 lowercaseString];
}

- (id)_keyForField:(int64_t)a3
{
  if (!a3) {
    return @"magicUnsubscribeSuggestionSenderDenyList";
  }
  if (a3 == 1) {
    return @"magicUnsubscribeSuggestionSenderDomainDenyList";
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  id v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_fault_impl(&dword_1CA650000, v6, OS_LOG_TYPE_FAULT, "SGMIFeatureStore: Invalid SGMailIntelligenceUnsubscriptionRuleField for DB lookup", v7, 2u);
  }

  return result;
}

- (id)_highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5 domains:(id)a6 limit:(id)a7 usingDatabase:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_opt_new();
  uint64_t v19 = objc_opt_new();
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke;
  v28[3] = &unk_1E65BF500;
  void v28[4] = self;
  id v29 = v17;
  id v30 = v15;
  id v31 = v16;
  int64_t v34 = a3;
  id v32 = v19;
  double v35 = a5;
  unint64_t v36 = a4;
  SEL v37 = a2;
  id v20 = v18;
  id v33 = v20;
  id v21 = v19;
  id v22 = v16;
  id v23 = v15;
  id v24 = v17;
  [v24 readTransaction:v28];
  char v25 = v33;
  id v26 = v20;

  return v26;
}

void __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _stringForFeatureName:*(void *)(a1 + 80)];
  uint64_t v4 = *(void **)(a1 + 48);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_2;
  v29[3] = &unk_1E65BF4B0;
  id v15 = v3;
  id v30 = v15;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v29);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * v8);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_3;
        v17[3] = &unk_1E65BF4D8;
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = *(id *)(a1 + 64);
        uint64_t v22 = *(void *)(a1 + 88);
        uint64_t v12 = *(void *)(a1 + 104);
        uint64_t v23 = *(void *)(a1 + 96);
        uint64_t v24 = v12;
        uint64_t v13 = *(void *)(a1 + 32);
        id v18 = v11;
        uint64_t v19 = v13;
        id v14 = v2;
        id v20 = v14;
        id v21 = *(id *)(a1 + 72);
        [v14 enumerateChildrenOfDomain:v9 greaterThan:0 depth:1 limit:v10 usingBlock:v17];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
}

id __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = a2;
  uint64_t v9 = @"u";
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v7 count:3];
  uint64_t v5 = +[SGMIDomainCountingTable domainForStringTokens:](SGMIDomainCountingTable, "domainForStringTokens:", v4, v7, v8, v9, v10);

  return v5;
}

uint64_t __102__SGMIFeatureStore__highlyDiscriminantTokensForFeature_minCount_minRatio_domains_limit_usingDatabase___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = +[SGMIDomainCountingTable stringTokensFromDomain:a2];
  if ([v5 count] == 4)
  {
    uint64_t v6 = [v5 lastObject];
    if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0
      && (double)a3 / *(double *)(a1 + 64) >= (double)*(unint64_t *)(a1 + 72))
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:1];
      int v8 = [@"s" isEqual:v7];

      if (v8)
      {
        uint64_t v9 = @"r";
      }
      else
      {
        uint64_t v10 = [v5 objectAtIndexedSubscript:1];
        char v11 = [@"r" isEqual:v10];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 40), @"SGMIFeatureStore.m", 1485, @"Invalid parameter not satisfying: %@", @"isSalientDomain || [@\"r\" isEqual:tokenDomainItems[1]]" object file lineNumber description];
        }
        uint64_t v9 = @"s";
      }
      uint64_t v13 = (void *)[v5 mutableCopy];
      [v13 setObject:v9 atIndexedSubscript:1];
      id v14 = +[SGMIDomainCountingTable domainForStringTokens:v13];

      uint64_t v15 = [*(id *)(a1 + 48) totalForDomain:v14];
      if ((unint64_t)(v15 + a3) >= *(void *)(a1 + 72)
        && (double)a3 / (double)(v15 + a3) >= *(double *)(a1 + 64))
      {
        uint64_t v16 = v15;
        [*(id *)(a1 + 32) addObject:v6];
        id v17 = *(void **)(a1 + 56);
        id v18 = [SGMITokenCounts alloc];
        if (v8) {
          uint64_t v19 = a3;
        }
        else {
          uint64_t v19 = v16;
        }
        if (v8) {
          a3 = v16;
        }
        id v20 = [NSNumber numberWithInteger:v19];
        id v21 = [NSNumber numberWithInteger:a3];
        uint64_t v22 = [(SGMITokenCounts *)v18 initWithSalientCount:v20 regularCount:v21 token:v6];
        [v17 addObject:v22];
      }
    }
  }
  return 1;
}

- (id)highlyDiscriminantTokensForFeature:(int64_t)a3 minCount:(unint64_t)a4 minRatio:(double)a5
{
  uint64_t v9 = [(SGMIFeatureStore *)self _db];
  if (v9)
  {
    uint64_t v10 = [(SGMIFeatureStore *)self _highlyDiscriminantTokensForFeature:a3 minCount:a4 minRatio:&unk_1F2536C50 domains:0 limit:v9 usingDatabase:a5];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)_naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5 usingDatabase:(id)a6
{
  id v27 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(SGMIFeatureStore *)self _stringForFeatureName:a3];
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__36771;
  v74 = __Block_byref_object_dispose__36772;
  id v75 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__36771;
  v68 = __Block_byref_object_dispose__36772;
  id v69 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__36771;
  v62 = __Block_byref_object_dispose__36772;
  id v63 = 0;
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x3032000000;
  long long v55 = __Block_byref_object_copy__36771;
  long long v56 = __Block_byref_object_dispose__36772;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__36771;
  id v50 = __Block_byref_object_dispose__36772;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__36771;
  uint64_t v44 = __Block_byref_object_dispose__36772;
  id v45 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke;
  v29[3] = &unk_1E65BF488;
  void v29[4] = self;
  id v13 = v11;
  id v30 = v13;
  id v14 = v12;
  id v31 = v14;
  int64_t v34 = &v70;
  double v35 = &v64;
  unint64_t v36 = &v58;
  SEL v37 = &v52;
  id v28 = v27;
  id v32 = v28;
  id v38 = &v46;
  id v15 = v10;
  id v33 = v15;
  uint64_t v39 = &v40;
  [v13 readTransaction:v29];
  uint64_t v16 = [SGMINaiveBayesModelQueryResult alloc];
  uint64_t v17 = v71[5];
  uint64_t v18 = v65[5];
  uint64_t v19 = v59[5];
  uint64_t v20 = v53[5];
  uint64_t v21 = v47[5];
  uint64_t v22 = (void *)v41[5];
  if (v22)
  {
    [v22 timeIntervalSinceNow];
    double v24 = -v23;
  }
  else
  {
    double v24 = INFINITY;
  }
  long long v25 = [(SGMINaiveBayesModelQueryResult *)v16 initWithMailCount:v17 unigramTokenCounts:v18 bigramTokenCounts:v19 unigramQueriedTokensCount:v20 bigramQueriedTokensCount:v21 oldestTokenAge:v24];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);

  return v25;
}

void __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke(uint64_t a1)
{
  v75[3] = *MEMORY[0x1E4F143B8];
  uint64_t v64 = [*(id *)(a1 + 32) _featuresForDatabase:*(void *)(a1 + 40)];
  v75[0] = *(void *)(a1 + 48);
  v75[1] = @"s";
  v75[2] = @"m";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  id v63 = +[SGMIDomainCountingTable domainForStringTokens:v2];

  v74[0] = *(void *)(a1 + 48);
  v74[1] = @"r";
  v74[2] = @"m";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  v62 = +[SGMIDomainCountingTable domainForStringTokens:v3];

  v73[0] = *(void *)(a1 + 48);
  v73[1] = @"s";
  v73[2] = @"u";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  uint64_t v5 = +[SGMIDomainCountingTable domainForStringTokens:v4];

  v72[0] = *(void *)(a1 + 48);
  v72[1] = @"r";
  v72[2] = @"u";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
  uint64_t v7 = +[SGMIDomainCountingTable domainForStringTokens:v6];

  v71[0] = *(void *)(a1 + 48);
  v71[1] = @"s";
  v71[2] = @"b";
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
  uint64_t v59 = +[SGMIDomainCountingTable domainForStringTokens:v8];

  v70[0] = *(void *)(a1 + 48);
  v70[1] = @"r";
  v70[2] = @"b";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
  uint64_t v60 = +[SGMIDomainCountingTable domainForStringTokens:v9];

  v69[0] = v63;
  v69[1] = v62;
  uint64_t v10 = v5;
  uint64_t v58 = (void *)v5;
  v69[2] = v5;
  v69[3] = v7;
  id v11 = (void *)v7;
  v69[4] = v59;
  v69[5] = v60;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:6];
  uint64_t v12 = [v64 totalsForDomains:v61];
  id v13 = [SGMITokenCounts alloc];
  uint64_t v14 = [v12 objectForKeyedSubscript:v63];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = &unk_1F2536408;
  }
  uint64_t v17 = [v12 objectForKeyedSubscript:v62];
  uint64_t v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (void *)v17;
  }
  else {
    uint64_t v19 = &unk_1F2536408;
  }
  uint64_t v20 = [(SGMITokenCounts *)v13 initWithSalientCount:v16 regularCount:v19 token:&stru_1F24EEF20];
  uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  double v23 = [SGMITokenCounts alloc];
  uint64_t v24 = [v12 objectForKeyedSubscript:v10];
  long long v25 = (void *)v24;
  if (v24) {
    long long v26 = (void *)v24;
  }
  else {
    long long v26 = &unk_1F2536408;
  }
  uint64_t v27 = [v12 objectForKeyedSubscript:v11];
  id v28 = (void *)v27;
  if (v27) {
    id v29 = (void *)v27;
  }
  else {
    id v29 = &unk_1F2536408;
  }
  uint64_t v30 = [(SGMITokenCounts *)v23 initWithSalientCount:v26 regularCount:v29 token:&stru_1F24EEF20];
  uint64_t v31 = *(void *)(*(void *)(a1 + 80) + 8);
  id v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v30;

  id v33 = [SGMITokenCounts alloc];
  uint64_t v34 = [v12 objectForKeyedSubscript:v59];
  double v35 = (void *)v34;
  if (v34) {
    unint64_t v36 = (void *)v34;
  }
  else {
    unint64_t v36 = &unk_1F2536408;
  }
  uint64_t v37 = [v12 objectForKeyedSubscript:v60];
  id v38 = (void *)v37;
  if (v37) {
    uint64_t v39 = (void *)v37;
  }
  else {
    uint64_t v39 = &unk_1F2536408;
  }
  uint64_t v40 = [(SGMITokenCounts *)v33 initWithSalientCount:v36 regularCount:v39 token:&stru_1F24EEF20];
  uint64_t v41 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v42 = *(void **)(v41 + 40);
  *(void *)(v41 + 40) = v40;

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_2;
  v65[3] = &unk_1E65BF460;
  id v66 = *(id *)(a1 + 48);
  id v43 = v64;
  id v67 = v43;
  uint64_t v44 = (void (**)(void, void, void))MEMORY[0x1CB79B4C0](v65);
  uint64_t v45 = ((void (**)(void, __CFString *, void))v44)[2](v44, @"u", *(void *)(a1 + 56));
  uint64_t v46 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v47 = *(void **)(v46 + 40);
  *(void *)(v46 + 40) = v45;

  uint64_t v48 = ((void (**)(void, __CFString *, void))v44)[2](v44, @"b", *(void *)(a1 + 64));
  uint64_t v49 = *(void *)(*(void *)(a1 + 104) + 8);
  id v50 = *(void **)(v49 + 40);
  *(void *)(v49 + 40) = v48;

  uint64_t v68 = *(void *)(a1 + 48);
  id v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  uint64_t v52 = +[SGMIDomainCountingTable domainForStringTokens:v51];

  long long v53 = [v43 currentColumns];
  uint64_t v54 = [v43 firstNonZeroColumnForDomain:v52 withColumns:v53];

  if (v54)
  {
    uint64_t v55 = [*(id *)(a1 + 32) _dateFromColumn:v54];
    uint64_t v56 = *(void *)(*(void *)(a1 + 112) + 8);
    id v57 = *(void **)(v56 + 40);
    *(void *)(v56 + 40) = v55;
  }
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1CB79B230]();
  if ([v6 count])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_3;
    v25[3] = &unk_1E65BF410;
    id v26 = *(id *)(a1 + 32);
    id v8 = v5;
    id v27 = v8;
    uint64_t v9 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v25);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_4;
    v22[3] = &unk_1E65BF410;
    id v23 = *(id *)(a1 + 32);
    id v24 = v8;
    uint64_t v10 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v22);
    id v11 = [v9 arrayByAddingObjectsFromArray:v10];
    uint64_t v12 = [*(id *)(a1 + 40) totalsForDomains:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_5;
    void v18[3] = &unk_1E65BF438;
    id v19 = v12;
    id v20 = v9;
    id v21 = v10;
    id v13 = v10;
    id v14 = v9;
    id v15 = v12;
    uint64_t v16 = objc_msgSend(v6, "_pas_mappedArrayWithIndexedTransform:", v18);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_3(uint64_t a1, void *a2)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = @"s";
  v8[2] = v2;
  v8[3] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v8 count:4];
  id v6 = +[SGMIDomainCountingTable domainForStringTokens:v5];

  return v6;
}

id __99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_4(uint64_t a1, void *a2)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(a1 + 32);
  v8[1] = @"r";
  v8[2] = v2;
  v8[3] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:v8 count:4];
  id v6 = +[SGMIDomainCountingTable domainForStringTokens:v5];

  return v6;
}

SGMITokenCounts *__99__SGMIFeatureStore__naiveBayesModelQueryResultForFeature_unigramTokens_bigramTokens_usingDatabase___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (v8 | v11)
  {
    uint64_t v12 = [SGMITokenCounts alloc];
    if (v8) {
      id v13 = (void *)v8;
    }
    else {
      id v13 = &unk_1F2536408;
    }
    if (v11) {
      id v14 = (void *)v11;
    }
    else {
      id v14 = &unk_1F2536408;
    }
    id v15 = [(SGMITokenCounts *)v12 initWithSalientCount:v13 regularCount:v14 token:v5];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)naiveBayesModelQueryResultForFeature:(int64_t)a3 unigramTokens:(id)a4 bigramTokens:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(SGMIFeatureStore *)self _db];
  if (v10)
  {
    uint64_t v11 = [(SGMIFeatureStore *)self _naiveBayesModelQueryResultForFeature:a3 unigramTokens:v8 bigramTokens:v9 usingDatabase:v10];
  }
  else
  {
    uint64_t v12 = [[SGMITokenCounts alloc] initWithSalientCount:&unk_1F2536408 regularCount:&unk_1F2536408 token:&stru_1F24EEF20];
    id v13 = [SGMINaiveBayesModelQueryResult alloc];
    uint64_t v11 = [(SGMINaiveBayesModelQueryResult *)v13 initWithMailCount:v12 unigramTokenCounts:v12 bigramTokenCounts:v12 unigramQueriedTokensCount:MEMORY[0x1E4F1CBF0] bigramQueriedTokensCount:MEMORY[0x1E4F1CBF0] oldestTokenAge:INFINITY];
  }
  return v11;
}

- (int64_t)_featureNameForString:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v5];
  unsigned int v10 = 0;
  if (([v6 scanHexInt:&v10] & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGMIFeatureStore.m", 1324, @"could not scan hex feature name in %@", v5 object file lineNumber description];
  }
  int64_t v7 = v10;

  return v7;
}

- (id)_stringForFeatureName:(int64_t)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tx", a3);
  return v3;
}

- (id)_columnFromDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = [(SGMIFeatureStore *)self _dateFormatter];
  uint64_t v7 = [v6 stringFromDate:v4];
  id v8 = (void *)v7;
  id v9 = &stru_1F24EEF20;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  unsigned int v10 = v9;

  uint64_t v11 = [@"_" stringByAppendingString:v10];

  return v11;
}

- (id)_dateFromColumn:(id)a3
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1CB79B230]();
  if ([v5 characterAtIndex:0] != 95)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGMIFeatureStore.m", 1299, @"Invalid parameter not satisfying: %@", @"[column characterAtIndex:0] == '_'" object file lineNumber description];
  }
  uint64_t v7 = [(SGMIFeatureStore *)self _dateFormatter];
  id v8 = [v5 substringFromIndex:1];
  id v9 = [v7 dateFromString:v8];
  unsigned int v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_454);
  }
  uint64_t v2 = (void *)_dateFormatter_dateFormatter;
  return v2;
}

uint64_t __34__SGMIFeatureStore__dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  uint64_t v2 = (void *)_dateFormatter_dateFormatter;
  return [v2 setFormatOptions:19];
}

- (void)_handleDeviceLockStateEvent:(int)a3
{
  if ((a3 - 1) > 1)
  {
    if (!a3)
    {
      if (self->_journalPath) {
        [(SGMIFeatureStore *)self _runJournal];
      }
    }
  }
  else
  {
    [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_443];
  }
}

void __48__SGMIFeatureStore__handleDeviceLockStateEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0;
}

- (int)_effectiveLockState
{
  if (self->_lockStateRegistration) {
    return [MEMORY[0x1E4F93B10] lockState];
  }
  else {
    return 3;
  }
}

- (id)_featuresForDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__36771;
  uint64_t v16 = __Block_byref_object_dispose__36772;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SGMIFeatureStore__featuresForDatabase___block_invoke;
  v8[3] = &unk_1E65BF380;
  unsigned int v10 = &v12;
  id v5 = v4;
  id v9 = v5;
  SEL v11 = a2;
  [v5 readTransaction:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __41__SGMIFeatureStore__featuresForDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), *(const void **)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [[SGMIDomainCountingTable alloc] initWithDatabase:*(void *)(a1 + 32) tableName:@"features"];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(const void **)(a1 + 48);
    id v9 = *(void **)(a1 + 32);
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_setAssociatedObject(v9, v8, v10, (void *)1);
  }
}

- (void)_runJournal
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:self->_journalPath];

  id v5 = sgMailIntelligenceLogHandle();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "Beginning SGMIFeatureStore _runJournal", buf, 2u);
    }

    uint64_t v7 = [(SGMIFeatureStore *)self _db];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(SGMIFeatureStore *)self _journalQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __31__SGMIFeatureStore__runJournal__block_invoke;
      v12[3] = &unk_1E65BFD88;
      void v12[4] = self;
      uint64_t v6 = v8;
      id v13 = v6;
      dispatch_sync(v9, v12);

      unsigned int v10 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "Finished SGMIFeatureStore _runJournal", buf, 2u);
      }
    }
    else
    {
      SEL v11 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_INFO, "Aborting SGMIFeatureStore _runJournal -- db not available (maybe device is locking again?)", buf, 2u);
      }

      uint64_t v6 = 0;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "Skipping SGMIFeatureStore _runJournal -- no journal file exists", buf, 2u);
  }
}

void __31__SGMIFeatureStore__runJournal__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SGMIFeatureStore__runJournal__block_invoke_2;
  v5[3] = &unk_1E65BF358;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 runWithLockAcquired:v5];
}

void __31__SGMIFeatureStore__runJournal__block_invoke_2(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SGMIFeatureStore__runJournal__block_invoke_3;
  v7[3] = &unk_1E65C0688;
  int8x16_t v6 = a1[2];
  id v4 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = v3;
  id v5 = v3;
  [v4 writeTransaction:v7];
}

void __31__SGMIFeatureStore__runJournal__block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 40)];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA10] inputStreamWithFileAtPath:*(void *)(*(void *)(a1 + 32) + 40)];
    [v4 open];
    id v5 = (void *)*MEMORY[0x1E4F93BF8];
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    while (1)
    {
      char v19 = 0;
      uint64_t v7 = objc_msgSend(v4, "read:maxLength:", &v19, 1, v17);
      if (v7 < 1)
      {
        BOOL v15 = v7 == 0;
        goto LABEL_21;
      }
      size_t size = 0;
      if ([v4 read:&size maxLength:8] < 0) {
        break;
      }
      if (size)
      {
        if (size < 0xFFFF) {
          int8x16_t v8 = malloc_type_malloc(size, 0x33D97687uLL);
        }
        else {
          int8x16_t v8 = malloc_type_calloc(1uLL, size, 0x33B41EB9uLL);
        }
        unsigned int v10 = v8;
        if (!v8) {
          break;
        }
        if ([v4 read:v8 maxLength:size] < 0)
        {
          free(v10);
          break;
        }
        id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        id v9 = (id)[v11 initWithBytesNoCopy:v10 length:size freeWhenDone:1];
      }
      else
      {
        id v9 = v5;
      }
      uint64_t v12 = v9;
      if (v19 == 1)
      {
        id v13 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
        uint64_t v14 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v17;
          id v21 = v13;
          _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "Running journal command: delete column %@", buf, 0xCu);
        }

        [*(id *)(a1 + 32) _clearBucketForColumn:v13 usingDatabase:*(void *)(a1 + 40)];
      }
    }
    BOOL v15 = 0;
LABEL_21:
    [v4 close];
    if (!v15) {
      [*(id *)(a1 + 32) _clearSubModelsTablesUsingDatabase:*(void *)(a1 + 40)];
    }
    [*(id *)(*(void *)(a1 + 48) + 24) removeAllObjects];
    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v16 removeItemAtPath:*(void *)(*(void *)(a1 + 32) + 40) error:0];
  }
}

- (BOOL)_writeJournalCommand:(unsigned __int8)a3 blob:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v7 = [(SGMIFeatureStore *)self _journalQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __46__SGMIFeatureStore__writeJournalCommand_blob___block_invoke;
  v11[3] = &unk_1E65BF330;
  unsigned __int8 v14 = a3;
  void v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  id v8 = v6;
  dispatch_sync(v7, v11);

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v9;
}

void __46__SGMIFeatureStore__writeJournalCommand_blob___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "Journaling command: %d", buf, 8u);
  }

  int v3 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:*(void *)(*(void *)(a1 + 32) + 40) append:1];
  [v3 open];
  if ([v3 write:a1 + 56 maxLength:1] < 0)
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v5 = "Failed to write command type to journal";
      id v6 = buf;
LABEL_15:
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  *(void *)long long buf = [*(id *)(a1 + 40) length];
  if ([v3 write:buf maxLength:8] < 0)
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = 0;
      id v5 = "Failed to write command blob length to journal";
LABEL_14:
      id v6 = (uint8_t *)&v8;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (*(void *)buf
    && objc_msgSend(v3, "write:maxLength:", objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length")) < 0)
  {
    id v4 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = 0;
      id v5 = "Failed to write command blob to journal";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  [v3 close];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_17:
}

- (id)_journalQueue
{
  if (_journalQueue__pasOnceToken10 != -1) {
    dispatch_once(&_journalQueue__pasOnceToken10, &__block_literal_global_433);
  }
  uint64_t v2 = (void *)_journalQueue__pasExprOnceResult;
  return v2;
}

void __33__SGMIFeatureStore__journalQueue__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGMIFeatureStore-Journal"];
  uint64_t v2 = (void *)_journalQueue__pasExprOnceResult;
  _journalQueue__pasExprOnceResult = v1;
}

- (id)_db
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__36771;
  uint64_t v10 = __Block_byref_object_dispose__36772;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__SGMIFeatureStore__db__block_invoke;
  v5[3] = &unk_1E65BF308;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __23__SGMIFeatureStore__db__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[1]);
  int v4 = [*(id *)(a1 + 32) _effectiveLockState];
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v5 = v4;
    uint64_t v6 = (void *)MEMORY[0x1CB79B230]();
    if (v5 == 3 || v5 == 0)
    {
      uint64_t v8 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
      id v9 = v3[1];
      v3[1] = (id)v8;

      id v10 = v3[1];
      if (v10)
      {
        if (([v10 isInMemory] & 1) == 0)
        {
          uint64_t v31 = 0;
          id v32 = &v31;
          uint64_t v33 = 0x2020000000;
          char v34 = 0;
          uint64_t v25 = 0;
          id v26 = &v25;
          uint64_t v27 = 0x3032000000;
          id v28 = __Block_byref_object_copy__36771;
          id v29 = __Block_byref_object_dispose__36772;
          id v30 = 0;
          id v11 = v3[1];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          void v24[2] = __23__SGMIFeatureStore__db__block_invoke_2;
          v24[3] = &unk_1E65BF2E0;
          void v24[4] = &v31;
          v24[5] = &v25;
          [v11 prepAndRunQuery:@"CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)" onPrep:0 onRow:0 onError:v24];
          if (*((unsigned char *)v32 + 24))
          {
            id v12 = sgMailIntelligenceLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = v26[5];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v37 = v23;
              _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Encountered corrupt db (%@), attempting to reinitialize", buf, 0xCu);
            }

            id v13 = (void *)MEMORY[0x1E4F93BA0];
            unsigned __int8 v14 = [v3[1] filename];
            [v13 truncateDatabaseAtPath:v14];

            [v3[1] closePermanently];
            *((unsigned char *)v3 + 16) = 0;
            uint64_t v15 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
            id v16 = v3[1];
            v3[1] = (id)v15;
          }
          _Block_object_dispose(&v25, 8);

          _Block_object_dispose(&v31, 8);
        }
        id v17 = v3[1];
        if (v17 && !*((unsigned char *)v3 + 16))
        {
          id v18 = objc_alloc(MEMORY[0x1E4F93AF8]);
          uint64_t v35 = *(void *)(a1 + 32);
          char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          id v20 = (void *)[v18 initWithMigrationObjects:v19];

          int v21 = [v20 migrateDatabases];
          *((unsigned char *)v3 + 16) = v21 == 1;
          if (v21 != 1)
          {
            id v22 = v3[1];
            v3[1] = 0;
          }
          id v17 = v3[1];
        }
      }
      else
      {
        id v17 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v17);
    }
  }
}

uint64_t __23__SGMIFeatureStore__db__block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  return *MEMORY[0x1E4F93C10];
}

- (void)dealloc
{
  [MEMORY[0x1E4F93B10] unregisterForLockStateChangeNotifications:self->_lockStateRegistration];
  v3.receiver = self;
  v3.super_class = (Class)SGMIFeatureStore;
  [(SGMIFeatureStore *)&v3 dealloc];
}

- (SGMIFeatureStore)initWithDatabaseGetter:(id)a3 journalPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SGMIFeatureStore;
  uint64_t v8 = [(SGMIFeatureStore *)&v28 init];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1CB79B230]();
    id location = 0;
    objc_initWeak(&location, v8);
    uint64_t v10 = [v6 copy];
    id dbGetter = v8->_dbGetter;
    v8->_id dbGetter = (id)v10;

    id v12 = objc_opt_new();
    uint64_t v13 = objc_opt_new();
    unsigned __int8 v14 = (void *)v12[3];
    v12[3] = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v12];
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v15;

    if (v7)
    {
      objc_storeStrong((id *)&v8->_journalPath, a4);
      int v17 = [MEMORY[0x1E4F93B10] lockState];
      if (v17 != 3)
      {
        id v18 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGMIFeatureStore-LockState" qosClass:17];
        char v19 = (void *)MEMORY[0x1E4F93B10];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        void v24[2] = __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke;
        v24[3] = &unk_1E65BF2B8;
        id v20 = v18;
        id v25 = v20;
        objc_copyWeak(&v26, &location);
        uint64_t v21 = [v19 registerForLockStateChangeNotifications:v24];
        id lockStateRegistration = v8->_lockStateRegistration;
        v8->_id lockStateRegistration = (id)v21;

        if (!v17) {
          [(SGMIFeatureStore *)v8 _runJournal];
        }
        objc_destroyWeak(&v26);
      }
    }

    objc_destroyWeak(&location);
  }

  return v8;
}

void __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke(uint64_t a1, int a2)
{
  objc_super v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke_2;
  v4[3] = &unk_1E65BF290;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  int v6 = a2;
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
}

void __55__SGMIFeatureStore_initWithDatabaseGetter_journalPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDeviceLockStateEvent:*(unsigned int *)(a1 + 40)];
}

+ (id)nsDataFromSignature:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 UTF8String];
    __int16 v10 = 0;
    if ([v5 length])
    {
      unint64_t v7 = 0;
      do
      {
        *(_WORD *)__str = *(_WORD *)(v6 + v7);
        HIBYTE(v10) = strtol(__str, 0, 16);
        [v4 appendBytes:(char *)&v10 + 1 length:1];
        v7 += 2;
      }
      while (v7 < [v5 length]);
    }
  }

  return v4;
}

+ (id)shouldExposeWarningGivenPositiveFeedbackCount:(id)a3 negativeFeedbackCount:(id)a4
{
  id v5 = NSNumber;
  id v6 = a3;
  uint64_t v7 = [a4 integerValue];
  uint64_t v8 = [v6 integerValue];

  return (id)[v5 numberWithInt:v7 - v8 < 3];
}

+ (SGMIFeatureStore)storeWithFilename:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__SGMIFeatureStore_storeWithFilename___block_invoke;
  v10[3] = &unk_1E65BF3E8;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 stringByAppendingPathExtension:@"sgmijournal"];
  uint64_t v8 = (void *)[v5 initWithDatabaseGetter:v10 journalPath:v7];

  return (SGMIFeatureStore *)v8;
}

uint64_t __38__SGMIFeatureStore_storeWithFilename___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F93BA0] sqliteDatabaseWithFilename:*(void *)(a1 + 32) contentProtection:1 errorHandler:0 error:0];
}

+ (id)storeInMemory
{
  uint64_t v2 = (void *)[objc_alloc((Class)a1) initWithDatabaseGetter:&__block_literal_global_446 journalPath:0];
  return v2;
}

uint64_t __33__SGMIFeatureStore_storeInMemory__block_invoke()
{
  return [MEMORY[0x1E4F93BA0] sqliteDatabaseWithFilename:@":memory:" contentProtection:0 errorHandler:0 error:0];
}

@end