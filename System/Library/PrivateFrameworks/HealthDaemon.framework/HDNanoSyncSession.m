@interface HDNanoSyncSession
- (BOOL)isLastChance;
- (BOOL)isPullRequest;
- (BOOL)isRequestedByRemote;
- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty;
- (HDNanoSyncSession)initWithSyncStore:(id)a3 options:(unint64_t)a4 reason:(id)a5 delegate:(id)a6 completion:(id)a7;
- (id)_intervalForSecondsSinceDaysAgo:(void *)a1;
- (id)changeSetWithChanges:(id)a3 statusCode:(int)a4 error:(id)a5;
- (id)completion;
- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4;
- (id)syncPredicate;
- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3;
- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3;
- (unint64_t)messageCount;
- (void)incrementMessageCount;
- (void)invokeCompletionWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation HDNanoSyncSession

- (BOOL)isPullRequest
{
  return self->_options & 1;
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (BOOL)isRequestedByRemote
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)invokeCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    id v6 = self->_completion;
    self->_completion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_syncPredicate, 0);
}

- (id)changeSetWithChanges:(id)a3 statusCode:(int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(HDSyncSession *)self sessionUUID];
  v11 = [(HDSyncSession *)self startDate];
  v12 = +[HDCodableNanoSyncChangeSet changeSetWithChanges:v9 sessionUUID:v10 startDate:v11 sessionError:v8 statusCode:v5];

  return v12;
}

- (void)incrementMessageCount
{
}

- (HDNanoSyncSession)initWithSyncStore:(id)a3 options:(unint64_t)a4 reason:(id)a5 delegate:(id)a6 completion:(id)a7
{
  v126[52] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  v122.receiver = self;
  v122.super_class = (Class)HDNanoSyncSession;
  v13 = [(HDSyncSession *)&v122 initWithSyncStore:a3 reason:a5 delegate:a6];
  v14 = v13;
  if (v13)
  {
    v13->_options = a4;
    uint64_t v15 = [v12 copy];
    id completion = v14->_completion;
    v14->_id completion = (id)v15;

    v17 = [(HDNanoSyncSession *)v14 nanoSyncStore];
    int v18 = [v17 isMaster];

    v19 = [HDSyncPredicate alloc];
    v20 = (void *)MEMORY[0x1E4F1CAD0];
    v21 = NSNumber;
    v22 = [(HDSyncSession *)v14 syncStore];
    v23 = objc_msgSend(v21, "numberWithLongLong:", objc_msgSend(v22, "syncProvenance"));
    v24 = [v20 setWithObject:v23];
    if (v18)
    {
      uint64_t v121 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB00]);
      uint64_t v120 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F299B8]);
    }
    else
    {
      uint64_t v120 = 0;
      uint64_t v121 = 0;
    }
    v25 = [(HDNanoSyncSession *)v14 nanoSyncStore];
    int v26 = [v25 isMaster];

    if (v26)
    {
      v110 = v19;
      v111 = v24;
      v112 = v23;
      int v113 = v18;
      v114 = v22;
      id v115 = v12;
      uint64_t v27 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AAF8]);
      uint64_t v28 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB38]);
      uint64_t v29 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB18]);
      v30 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB10]);
      v119 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB20]);
      v118 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB28]);
      v117 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB40]);
      v116 = -[HDNanoSyncSession _intervalForSecondsSinceDaysAgo:](v14, *MEMORY[0x1E4F2AB30]);
      v31 = NSNumber;
      v32 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v32 timeIntervalSinceReferenceDate];
      uint64_t v34 = [v31 numberWithDouble:-v33];

      v105 = [MEMORY[0x1E4F2B448] dataTypeWithCode:76];
      v125[0] = v105;
      v109 = (void *)v27;
      v126[0] = v27;
      v104 = [MEMORY[0x1E4F2B448] dataTypeWithCode:67];
      v125[1] = v104;
      v126[1] = v34;
      v103 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:180];
      v125[2] = v103;
      v126[2] = v34;
      v102 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:190];
      v125[3] = v102;
      v126[3] = v34;
      v101 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:299];
      v125[4] = v101;
      v126[4] = v34;
      v100 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:300];
      v125[5] = v100;
      v126[5] = v34;
      v99 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:105];
      v125[6] = v99;
      v126[6] = v34;
      v98 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:104];
      v125[7] = v98;
      v126[7] = v34;
      v97 = [MEMORY[0x1E4F2B448] dataTypeWithCode:249];
      v125[8] = v97;
      v108 = (void *)v28;
      v126[8] = v28;
      v96 = [MEMORY[0x1E4F2B448] dataTypeWithCode:118];
      v125[9] = v96;
      v107 = (void *)v29;
      v126[9] = v29;
      v95 = [MEMORY[0x1E4F2B448] dataTypeWithCode:95];
      v125[10] = v95;
      v126[10] = v30;
      v94 = [MEMORY[0x1E4F2B448] dataTypeWithCode:96];
      v125[11] = v94;
      v126[11] = v30;
      v93 = [MEMORY[0x1E4F2B448] dataTypeWithCode:91];
      v125[12] = v93;
      v126[12] = v30;
      v92 = [MEMORY[0x1E4F2B448] dataTypeWithCode:97];
      v125[13] = v92;
      v126[13] = v30;
      v91 = [MEMORY[0x1E4F2B448] dataTypeWithCode:90];
      v125[14] = v91;
      v126[14] = v30;
      v90 = [MEMORY[0x1E4F2B448] dataTypeWithCode:92];
      v125[15] = v90;
      v126[15] = v30;
      v89 = [MEMORY[0x1E4F2B448] dataTypeWithCode:243];
      v125[16] = v89;
      v126[16] = v30;
      v88 = [MEMORY[0x1E4F2B448] dataTypeWithCode:244];
      v125[17] = v88;
      v126[17] = v30;
      v87 = [MEMORY[0x1E4F2B448] dataTypeWithCode:157];
      v125[18] = v87;
      v126[18] = v30;
      v86 = [MEMORY[0x1E4F2B448] dataTypeWithCode:158];
      v125[19] = v86;
      v126[19] = v30;
      v85 = [MEMORY[0x1E4F2B448] dataTypeWithCode:159];
      v125[20] = v85;
      v126[20] = v30;
      v84 = [MEMORY[0x1E4F2B448] dataTypeWithCode:160];
      v125[21] = v84;
      v126[21] = v30;
      v83 = [MEMORY[0x1E4F2B448] dataTypeWithCode:161];
      v125[22] = v83;
      v126[22] = v30;
      v82 = [MEMORY[0x1E4F2B448] dataTypeWithCode:162];
      v125[23] = v82;
      v126[23] = v30;
      v81 = [MEMORY[0x1E4F2B448] dataTypeWithCode:163];
      v125[24] = v81;
      v126[24] = v30;
      v80 = [MEMORY[0x1E4F2B448] dataTypeWithCode:164];
      v125[25] = v80;
      v126[25] = v30;
      v79 = [MEMORY[0x1E4F2B448] dataTypeWithCode:165];
      v125[26] = v79;
      v126[26] = v30;
      v78 = [MEMORY[0x1E4F2B448] dataTypeWithCode:166];
      v125[27] = v78;
      v126[27] = v30;
      v77 = [MEMORY[0x1E4F2B448] dataTypeWithCode:167];
      v125[28] = v77;
      v126[28] = v30;
      v76 = [MEMORY[0x1E4F2B448] dataTypeWithCode:168];
      v125[29] = v76;
      v126[29] = v30;
      v75 = [MEMORY[0x1E4F2B448] dataTypeWithCode:169];
      v125[30] = v75;
      v126[30] = v30;
      v73 = [MEMORY[0x1E4F2B448] dataTypeWithCode:170];
      v125[31] = v73;
      v126[31] = v30;
      v72 = [MEMORY[0x1E4F2B448] dataTypeWithCode:171];
      v125[32] = v72;
      v126[32] = v30;
      v71 = [MEMORY[0x1E4F2B448] dataTypeWithCode:229];
      v125[33] = v71;
      v126[33] = v30;
      v70 = [MEMORY[0x1E4F2B448] dataTypeWithCode:230];
      v125[34] = v70;
      v126[34] = v30;
      v69 = [MEMORY[0x1E4F2B448] dataTypeWithCode:231];
      v125[35] = v69;
      v126[35] = v30;
      v68 = [MEMORY[0x1E4F2B448] dataTypeWithCode:232];
      v125[36] = v68;
      v126[36] = v30;
      v67 = [MEMORY[0x1E4F2B448] dataTypeWithCode:233];
      v125[37] = v67;
      v126[37] = v30;
      v66 = [MEMORY[0x1E4F2B448] dataTypeWithCode:234];
      v125[38] = v66;
      v126[38] = v30;
      v65 = [MEMORY[0x1E4F2B448] dataTypeWithCode:235];
      v125[39] = v65;
      v126[39] = v30;
      v64 = [MEMORY[0x1E4F2B448] dataTypeWithCode:192];
      v125[40] = v64;
      v126[40] = v34;
      v63 = [MEMORY[0x1E4F2B448] dataTypeWithCode:191];
      v125[41] = v63;
      v126[41] = v34;
      v62 = [MEMORY[0x1E4F2B448] dataTypeWithCode:193];
      v125[42] = v62;
      v126[42] = v34;
      v61 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:63];
      v125[43] = v61;
      v126[43] = v119;
      v60 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:197];
      v125[44] = v60;
      v126[44] = v34;
      v35 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:198];
      v125[45] = v35;
      v126[45] = v34;
      v36 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:256];
      v125[46] = v36;
      v126[46] = v30;
      v37 = [MEMORY[0x1E4F2B448] dataTypeWithCode:284];
      v125[47] = v37;
      v126[47] = v118;
      v38 = [MEMORY[0x1E4F2B448] dataTypeWithCode:283];
      v125[48] = v38;
      v106 = (void *)v34;
      v126[48] = v34;
      v39 = [MEMORY[0x1E4F2B448] dataTypeWithCode:298];
      v125[49] = v39;
      v126[49] = v117;
      v40 = [MEMORY[0x1E4F2B448] dataTypeWithCode:304];
      v125[50] = v40;
      v126[50] = v117;
      v41 = [MEMORY[0x1E4F2B448] dataTypeWithCode:79];
      v125[51] = v41;
      v126[51] = v116;
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:52];

      v42 = [(HDSyncSession *)v14 syncStore];
      v43 = [v42 profile];
      v44 = [v43 daemon];
      v45 = [v44 behavior];
      v46 = [v45 features];
      LODWORD(v38) = [v46 extendedLocalWatchData];

      if (v38)
      {
        v47 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:139];
        v123[0] = v47;
        v124[0] = v30;
        v48 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:14];
        v123[1] = v48;
        v124[1] = v30;
        v49 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:61];
        v123[2] = v49;
        v124[2] = v30;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:3];
        uint64_t v51 = objc_msgSend(v74, "hk_dictionaryByAddingEntriesFromDictionary:", v50);

        v52 = (void *)v51;
        v22 = v114;
        int v18 = v113;
        v24 = v111;
        v23 = v112;
        v54 = (void *)v120;
        v53 = (void *)v121;
      }
      else
      {
        v22 = v114;
        int v18 = v113;
        v24 = v111;
        v23 = v112;
        v54 = (void *)v120;
        v53 = (void *)v121;
        v52 = v74;
      }

      id v12 = v115;
      v19 = v110;
    }
    else
    {
      v52 = 0;
      v54 = (void *)v120;
      v53 = (void *)v121;
    }
    uint64_t v55 = [(HDSyncPredicate *)v19 initWithExcludedSyncProvenances:v24 dateInterval:0 includedObjectTypes:0 defaultMaximumObjectAge:v53 defaultMaximumTombstoneAge:v54 maximumObjectAgeByType:v52];
    v56 = v52;
    v57 = (HDSyncPredicate *)v55;

    if (v18)
    {
    }
    syncPredicate = v14->_syncPredicate;
    v14->_syncPredicate = v57;
  }
  return v14;
}

- (BOOL)isLastChance
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 0x20000;
  }

  return [(HDNanoSyncSession *)self maxEncodedBytesPerChangeSetForSyncEntityClass:a3];
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  return 0x100000;
}

- (id)_intervalForSecondsSinceDaysAgo:(void *)a1
{
  v4 = NSNumber;
  uint64_t v5 = [a1 calendar];
  id v6 = [a1 startDate];
  v7 = objc_msgSend(v5, "hk_dateBySubtractingDays:fromDate:", a2, v6);
  id v8 = [a1 startDate];
  [v7 timeIntervalSinceDate:v8];
  v10 = [v4 numberWithDouble:-v9];

  return v10;
}

- (id)syncPredicate
{
  return self->_syncPredicate;
}

- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty
{
  v2 = [(HDSyncSession *)self syncStore];
  BOOL v3 = (int)[v2 protocolVersion] < 12;

  return v3;
}

- (id)completion
{
  return self->_completion;
}

@end