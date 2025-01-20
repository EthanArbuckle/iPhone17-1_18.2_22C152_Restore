@interface _EDSentToFilter
- (_EDSentToFilter)init;
- (unint64_t)mayHaveSentToSimpleAddress:(id)a3;
- (void)loadFromDisk;
- (void)updateWithSentToSimpleAddresses:(id)a3 recentNotSentToSimpleAddresses:(id)a4;
@end

@implementation _EDSentToFilter

- (_EDSentToFilter)init
{
  v8.receiver = self;
  v8.super_class = (Class)_EDSentToFilter;
  v2 = [(_EDSentToFilter *)&v8 init];
  v3 = v2;
  if (v2)
  {
    firstFilter = v2->_firstFilter;
    v2->_firstFilter = 0;

    secondFilter = v3->_secondFilter;
    v3->_secondFilter = 0;

    thirdFilter = v3->_thirdFilter;
    v3->_thirdFilter = 0;
  }
  return v3;
}

- (void)loadFromDisk
{
  __31___EDSentToFilter_loadFromDisk__block_invoke((uint64_t)self, @"SentToFilter", &unk_1F35BB018);
  v3 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  firstFilter = self->_firstFilter;
  self->_firstFilter = v3;

  __31___EDSentToFilter_loadFromDisk__block_invoke(v5, @"SentToFilter2", &unk_1F35BB030);
  v6 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  secondFilter = self->_secondFilter;
  self->_secondFilter = v6;

  __31___EDSentToFilter_loadFromDisk__block_invoke(v8, @"SentToFilter3", &unk_1F35BB048);
  v9 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
  thirdFilter = self->_thirdFilter;
  self->_thirdFilter = v9;
}

- (unint64_t)mayHaveSentToSimpleAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_firstFilter)
  {
    uint64_t v6 = [v4 lowercaseString];

    if ([(EFBloomFilter *)self->_firstFilter mayContainString:v6])
    {
      secondFilter = self->_secondFilter;
      if (!secondFilter || ![(EFBloomFilter *)secondFilter mayContainString:v6])
      {
        unint64_t v9 = 2;
        goto LABEL_12;
      }
      thirdFilter = self->_thirdFilter;
      if (thirdFilter)
      {
        if ([(EFBloomFilter *)thirdFilter mayContainString:v6]) {
          unint64_t v9 = 2;
        }
        else {
          unint64_t v9 = 1;
        }
        goto LABEL_12;
      }
    }
    unint64_t v9 = 1;
LABEL_12:
    uint64_t v5 = (void *)v6;
    goto LABEL_13;
  }
  unint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (void)updateWithSentToSimpleAddresses:(id)a3 recentNotSentToSimpleAddresses:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v80;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v80 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v79 + 1) + 8 * v12) lowercaseString];
        [v8 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v10);
  }

  v14 = [v8 allObjects];

  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v76;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v76 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = [*(id *)(*((void *)&v75 + 1) + 8 * v19) lowercaseString];
        if (([v8 containsObject:v20] & 1) == 0) {
          [v15 addObject:v20];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v17);
  }

  v65 = [v15 allObjects];

  v21 = EDSenderLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    [v14 count];
    -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:]1();
  }

  v22 = EDSenderLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    [v65 count];
    -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
  }

  id v74 = 0;
  v23 = [MEMORY[0x1E4F60D30] bestBloomFilterForValues:v14 excludingValues:v65 falsePositiveRate:&v74 knownFalsePositives:0.1];
  id v66 = v74;
  firstFilter = self->_firstFilter;
  self->_firstFilter = v23;

  if ([v66 count])
  {
    v25 = EDSenderLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      [v66 count];
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.9();
    }

    v26 = EDSenderLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      [v14 count];
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
    }

    id v73 = 0;
    v27 = [MEMORY[0x1E4F60D30] bestBloomFilterForValues:v66 excludingValues:v14 falsePositiveRate:&v73 knownFalsePositives:0.01];
    v28 = (EFBloomFilter *)v73;
    secondFilter = self->_secondFilter;
    self->_secondFilter = v27;

    if ([(EFBloomFilter *)v28 count])
    {
      v30 = EDSenderLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        [(EFBloomFilter *)v28 count];
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.7();
      }

      v31 = EDSenderLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        [v66 count];
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.6();
      }

      id v72 = 0;
      v32 = [MEMORY[0x1E4F60D30] bestBloomFilterForValues:v28 excludingValues:v66 falsePositiveRate:&v72 knownFalsePositives:0.1];
      v33 = (EFBloomFilter *)v72;
      thirdFilter = self->_thirdFilter;
      self->_thirdFilter = v32;

      if ([(EFBloomFilter *)v33 count])
      {
        v35 = EDSenderLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [(EFBloomFilter *)v33 count];
          v37 = [(EFBloomFilter *)v33 ef_map:&__block_literal_global_489];
          *(_DWORD *)buf = 134218242;
          uint64_t v84 = v36;
          __int16 v85 = 2114;
          v86 = v37;
          _os_log_impl(&dword_1DB39C000, v35, OS_LOG_TYPE_DEFAULT, "'Sent to' filter has %lu known false positives: %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      v33 = self->_thirdFilter;
      self->_thirdFilter = 0;
    }
  }
  else
  {
    v38 = self->_secondFilter;
    self->_secondFilter = 0;

    v28 = self->_thirdFilter;
    self->_thirdFilter = 0;
  }

  v39 = self->_firstFilter;
  v40 = [MEMORY[0x1E4F60410] mailDataDirectory];
  v41 = [v40 URLByAppendingPathComponent:@"SentToFilter"];

  id v71 = 0;
  char v42 = [(EFBloomFilter *)v39 writeToFile:v41 options:1342177281 error:&v71];
  id v43 = v71;

  if ((v42 & 1) == 0)
  {
    v44 = EDSenderLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v43, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.5();
    }
  }
  v45 = self->_secondFilter;
  if (v45)
  {
    uint64_t v46 = [MEMORY[0x1E4F60410] mailDataDirectory];
    v47 = [(id)v46 URLByAppendingPathComponent:@"SentToFilter2"];

    id v70 = v43;
    LOBYTE(v46) = [(EFBloomFilter *)v45 writeToFile:v47 options:1342177281 error:&v70];
    id v48 = v70;

    if (v46) {
      goto LABEL_49;
    }
    v49 = EDSenderLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v48, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:].cold.4();
    }
    goto LABEL_48;
  }
  v49 = [MEMORY[0x1E4F28CB8] defaultManager];
  v50 = [MEMORY[0x1E4F60410] mailDataDirectory];
  v51 = [v50 URLByAppendingPathComponent:@"SentToFilter2"];

  id v69 = v43;
  char v52 = [v49 removeItemAtURL:v51 error:&v69];
  id v48 = v69;

  if (v52)
  {

LABEL_48:
    goto LABEL_49;
  }
  BOOL v63 = isNoSuchFileError(v48);

  if (!v63)
  {
    v49 = EDSenderLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v48, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:]();
    }
    goto LABEL_48;
  }
LABEL_49:
  v53 = v48;
  v54 = self->_thirdFilter;
  if (!v54)
  {
    v59 = [MEMORY[0x1E4F28CB8] defaultManager];
    v60 = [MEMORY[0x1E4F60410] mailDataDirectory];
    v61 = [v60 URLByAppendingPathComponent:@"SentToFilter3"];

    id v67 = v53;
    char v62 = [v59 removeItemAtURL:v61 error:&v67];
    id v58 = v67;

    if (v62)
    {
    }
    else
    {
      BOOL v64 = isNoSuchFileError(v58);

      if (v64) {
        goto LABEL_56;
      }
      v59 = EDSenderLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v58, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:]();
      }
    }
    goto LABEL_55;
  }
  v55 = [MEMORY[0x1E4F60410] mailDataDirectory];
  v56 = [v55 URLByAppendingPathComponent:@"SentToFilter3"];

  id v68 = v53;
  char v57 = [(EFBloomFilter *)v54 writeToFile:v56 options:1342177281 error:&v68];
  id v58 = v68;

  if ((v57 & 1) == 0)
  {
    v59 = EDSenderLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v58, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[_EDSentToFilter updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:]();
    }
LABEL_55:
  }
LABEL_56:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdFilter, 0);
  objc_storeStrong((id *)&self->_secondFilter, 0);

  objc_storeStrong((id *)&self->_firstFilter, 0);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to delete sent to addresses filter 3: %{public}@", v5);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to write sent to addresses filter 3: %{public}@", v5);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to delete sent to addresses filter 2: %{public}@", v5);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to write sent to addresses filter 2: %{public}@", v5);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Unable to write sent to addresses filter 1: %{public}@", v5);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.6()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_9(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_0(&dword_1DB39C000, "ignoring addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.7()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_9(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_0(&dword_1DB39C000, "Building third filter with addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.9()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_9(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_0(&dword_1DB39C000, "Building second filter with addresses (%lu): %@", v3, v4);
}

- (void)updateWithSentToSimpleAddresses:recentNotSentToSimpleAddresses:.cold.11()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_9(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_4_0(&dword_1DB39C000, "Building filter with addresses (%lu): %@", v3, v4);
}

@end