@interface _DPToolCommand
+ (id)command:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8;
+ (id)supportedCommands;
+ (id)supportedMetadataKeys;
- (BOOL)executeCommand;
- (BOOL)listKeys;
- (BOOL)listReportsFor:(id)a3;
- (BOOL)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (BOOL)recordWords:(id)a3 forKey:(id)a4;
- (BOOL)submitRecordsForKey:(id)a3;
- (BOOL)writeOK;
- (NSString)action;
- (NSString)arguments;
- (NSString)databasePath;
- (NSString)metadata;
- (NSString)recordKey;
- (_DPStorage)storage;
- (_DPToolCommand)init;
- (_DPToolCommand)initWithAction:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8;
- (id)description;
- (id)floatVectorsFromCSVString:(id)a3;
- (id)metadataFromCSVString:(id)a3;
- (id)queryForKey:(id)a3;
- (void)executeCommand;
@end

@implementation _DPToolCommand

+ (id)supportedCommands
{
  if (supportedCommands_onceToken != -1) {
    dispatch_once(&supportedCommands_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_DPToolSupportedCommands;
  return v2;
}

+ (id)supportedMetadataKeys
{
  if (supportedMetadataKeys_onceToken != -1) {
    dispatch_once(&supportedMetadataKeys_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)_DPToolSupportedMetadataKeys;
  return v2;
}

- (_DPToolCommand)init
{
  return 0;
}

- (_DPToolCommand)initWithAction:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8
{
  BOOL v8 = a8;
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)_DPToolCommand;
  v18 = [(_DPToolCommand *)&v28 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v18->_action, a3);
  objc_storeStrong((id *)&v19->_arguments, a4);
  objc_storeStrong((id *)&v19->_metadata, a5);
  objc_storeStrong((id *)&v19->_recordKey, a6);
  objc_storeStrong((id *)&v19->_databasePath, a7);
  v19->_writeOK = v8;
  if (v17)
  {
    uint64_t v20 = +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v17, !v8, v26, v27);
    storage = v19->_storage;
    v19->_storage = (_DPStorage *)v20;
  }
  else
  {
    storage = +[_DPStrings databaseDirectoryPath];
    uint64_t v22 = +[_DPStorage storageWithDirectory:storage readOnly:!v8];
    v23 = v19->_storage;
    v19->_storage = (_DPStorage *)v22;
  }
  if (!v19->_storage) {
    v24 = 0;
  }
  else {
LABEL_6:
  }
    v24 = v19;

  return v24;
}

+ (id)command:(id)a3 arguments:(id)a4 metadata:(id)a5 recordKey:(id)a6 databasePath:(id)a7 writeOK:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithAction:v18 arguments:v17 metadata:v16 recordKey:v15 databasePath:v14 writeOK:v8];

  return v19;
}

- (BOOL)executeCommand
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_metadata = &self->_metadata;
  uint64_t v4 = [(_DPToolCommand *)self metadataFromCSVString:self->_metadata];
  v5 = (void *)v4;
  if (*p_metadata) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v9 = +[_DPLog tool];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(_DPToolCommand *)(uint64_t)p_metadata executeCommand];
    }
LABEL_9:

    BOOL v16 = 0;
    goto LABEL_38;
  }
  p_action = &self->_action;
  if ([(NSString *)self->_action isEqualToString:@"recordnumbers"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordNumbers:self->_arguments metadata:v5 forKey:self->_recordKey];
LABEL_37:
    BOOL v16 = v8;
    goto LABEL_38;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordnumbersvectors"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordNumbersVectors:self->_arguments metadata:v5 forKey:self->_recordKey];
    goto LABEL_37;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordbitvalues"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordBitValues:self->_arguments metadata:v5 forKey:self->_recordKey];
    goto LABEL_37;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordbitvectors"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordBitVectors:self->_arguments metadata:v5 forKey:self->_recordKey];
    goto LABEL_37;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordfloatvectors"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordFloatVectors:self->_arguments metadata:v5 forKey:self->_recordKey];
    goto LABEL_37;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordstrings"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordStrings:self->_arguments metadata:v5 forKey:self->_recordKey];
    goto LABEL_37;
  }
  if ([(NSString *)*p_action isEqualToString:@"recordwords"])
  {
    BOOL v8 = [(_DPToolCommand *)self recordWords:self->_arguments forKey:self->_recordKey];
    goto LABEL_37;
  }
  if (![(NSString *)*p_action isEqualToString:@"query"])
  {
    if ([(NSString *)*p_action isEqualToString:@"submitrecords"])
    {
      BOOL v8 = [(_DPToolCommand *)self submitRecordsForKey:self->_recordKey];
      goto LABEL_37;
    }
    if ([(NSString *)*p_action isEqualToString:@"listreports"])
    {
      BOOL v8 = [(_DPToolCommand *)self listReportsFor:self->_arguments];
      goto LABEL_37;
    }
    if ([(NSString *)*p_action isEqualToString:@"listkeys"])
    {
      BOOL v8 = [(_DPToolCommand *)self listKeys];
      goto LABEL_37;
    }
    v9 = +[_DPLog tool];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(_DPToolCommand *)(uint64_t)p_action executeCommand];
    }
    goto LABEL_9;
  }
  id v17 = [(_DPToolCommand *)self queryForKey:self->_recordKey];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    v21 = (FILE **)MEMORY[0x1E4F143D8];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *v21;
        id v24 = [*(id *)(*((void *)&v32 + 1) + 8 * i) description];
        fprintf(v23, "%s\n", (const char *)[v24 UTF8String]);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  BOOL v16 = 1;
LABEL_38:

  return v16;
}

- (id)floatVectorsFromCSVString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "dp_floatVectorsFromCSVString");
  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    id v17 = v4;
    id v5 = (id)objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v3;
    BOOL v6 = objc_msgSend(v3, "dp_stringsFromCSVString");
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet", v17);
          uint64_t v13 = [v11 stringByTrimmingCharactersInSet:v12];

          uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v13];
          if (v14)
          {
            [v5 addObject:v14];
          }
          else
          {
            uint64_t v15 = +[_DPLog tool];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v24 = v13;
              _os_log_error_impl(&dword_1DC55E000, v15, OS_LOG_TYPE_ERROR, "Fail to read (%@) as binary data", buf, 0xCu);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v8);
    }

    uint64_t v4 = v17;
    id v3 = v18;
  }

  return v5;
}

- (id)metadataFromCSVString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "dp_dictionaryFromJsonString");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      id v5 = v5;
      BOOL v6 = v5;
    }
    else
    {
      id v15 = 0;
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:1 error:&v15];
      id v8 = v15;
      uint64_t v9 = v8;
      if (v7)
      {
        id v14 = v8;
        uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v14];
        id v11 = v14;

        if (v10)
        {
          id v5 = v10;
          BOOL v6 = v5;
        }
        else
        {
          uint64_t v12 = +[_DPLog tool];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[_DPToolCommand metadataFromCSVString:]();
          }

          id v5 = 0;
          BOOL v6 = 0;
        }
      }
      else
      {
        BOOL v6 = 0;
        id v11 = v8;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [[_DPNumericDataRecorder alloc] initWithKey:v9];
  if (v10)
  {
    id v11 = objc_msgSend(v7, "dp_numbersFromCSVString");
    if (v8) {
      BOOL v12 = [(_DPNumericDataRecorder *)v10 record:v11 metadata:v8];
    }
    else {
      BOOL v12 = [(_DPNumericDataRecorder *)v10 record:v11];
    }
    BOOL v14 = v12;
  }
  else
  {
    uint64_t v13 = +[_DPLog tool];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [[_DPNumericDataRecorder alloc] initWithKey:v9];
  if (v10)
  {
    id v11 = objc_msgSend(v7, "dp_numbersVectorsFromCSVString");
    if (v8) {
      BOOL v12 = [(_DPNumericDataRecorder *)v10 recordNumbersVectors:v11 metadata:v8];
    }
    else {
      BOOL v12 = [(_DPNumericDataRecorder *)v10 recordNumbersVectors:v11];
    }
    BOOL v14 = v12;
  }
  else
  {
    uint64_t v13 = +[_DPLog tool];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [[_DPBitValueRecorder alloc] initWithKey:v9];
  if (v10)
  {
    id v11 = objc_msgSend(v7, "dp_numbersFromCSVString");
    if (v8) {
      BOOL v12 = [(_DPBitValueRecorder *)v10 record:v11 metadata:v8];
    }
    else {
      BOOL v12 = [(_DPBitValueRecorder *)v10 record:v11];
    }
    BOOL v14 = v12;
  }
  else
  {
    uint64_t v13 = +[_DPLog tool];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [[_DPBitValueRecorder alloc] initWithKey:v9];
  if (v10)
  {
    id v11 = objc_msgSend(v7, "dp_bitVectorsFromCSVString");
    if (v8) {
      BOOL v12 = [(_DPBitValueRecorder *)v10 recordBitVectors:v11 metadata:v8];
    }
    else {
      BOOL v12 = [(_DPBitValueRecorder *)v10 recordBitVectors:v11];
    }
    BOOL v14 = v12;
  }
  else
  {
    uint64_t v13 = +[_DPLog tool];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[_DPFloatValueRecorder alloc] initWithKey:v10];
  if (!v11)
  {
    BOOL v12 = +[_DPLog tool];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }
    goto LABEL_10;
  }
  BOOL v12 = [(_DPToolCommand *)self floatVectorsFromCSVString:v8];
  if (![v12 count])
  {
    BOOL v14 = +[_DPLog tool];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordFloatVectors:metadata:forKey:]();
    }

LABEL_10:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  if (v9) {
    BOOL v13 = [(_DPFloatValueRecorder *)v11 recordFloatVectors:v12 metadata:v9];
  }
  else {
    BOOL v13 = [(_DPFloatValueRecorder *)v11 recordFloatVectors:v12];
  }
  BOOL v15 = v13;
LABEL_13:

  return v15;
}

- (BOOL)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [[_DPStringRecorder alloc] initWithKey:v9];
  if (v10)
  {
    id v11 = objc_msgSend(v7, "dp_stringsFromCSVString");
    if (v8) {
      BOOL v12 = [(_DPStringRecorder *)v10 record:v11 metadata:v8];
    }
    else {
      BOOL v12 = [(_DPStringRecorder *)v10 record:v11];
    }
    BOOL v14 = v12;
  }
  else
  {
    BOOL v13 = +[_DPLog tool];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)recordWords:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[_DPWordRecorder alloc] initWithKey:v6];
  if (v7)
  {
    id v8 = objc_msgSend(v5, "dp_wordRecordsFromCSVString");
    BOOL v9 = [(_DPWordRecorder *)v7 record:v8];
  }
  else
  {
    id v10 = +[_DPLog tool];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_DPToolCommand recordNumbers:metadata:forKey:]();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (id)queryForKey:(id)a3
{
  id v5 = a3;
  id v6 = self->_databasePath;
  BOOL v7 = !self->_writeOK;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[_DPStrings databaseDirectoryPath];
    BOOL v7 = 1;
  }
  BOOL v9 = +[_DPStorage storageWithDirectory:v8 readOnly:v7];
  if (v9)
  {
    id v10 = +[_DPRecordQueryPredicates entityForKey:v5];
    if (v10)
    {
      id v11 = +[_DPKeyNames keyPropertiesForKey:v5];
      if ([v11 keyPatternsAllowed]) {
        +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKeyBeginsWith:v5];
      }
      else {
      BOOL v13 = +[_DPRecordQueryPredicates predicateForRecordsNotSubmittedForKey:v5];
      }
      uint64_t v21 = 0;
      long long v22 = &v21;
      uint64_t v23 = 0x3032000000;
      id v24 = __Block_byref_object_copy__6;
      v25 = __Block_byref_object_dispose__6;
      id v26 = 0;
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __30___DPToolCommand_queryForKey___block_invoke;
      v17[3] = &unk_1E6C44570;
      long long v19 = &v21;
      SEL v20 = a2;
      BOOL v15 = v14;
      id v18 = v15;
      [v9 fetchRecordsFor:v10 predicate:v13 fetchLimit:1000 fetchOffset:0 withCompletion:v17];
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      id v12 = (id)v22[5];

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      id v11 = +[_DPLog tool];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPToolCommand queryForKey:]();
      }
      id v12 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (BOOL)submitRecordsForKey:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_databasePath;
  BOOL v6 = !self->_writeOK;
  if (v5)
  {
    BOOL v7 = v5;
  }
  else
  {
    BOOL v7 = +[_DPStrings databaseDirectoryPath];
    BOOL v6 = 1;
  }
  id v8 = objc_opt_new();
  BOOL v9 = +[_DPStorage storageWithDirectory:v7 readOnly:v6];
  if (v9)
  {
    v14[0] = v4;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v11 = [v8 generateReportForKeys:v10 storage:v9];

    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)listReportsFor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"all"])
  {
    id v4 = +[_DPReportFileManager submittedReports];
  }
  else
  {
    if (![v3 isEqualToString:@"pending"])
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    id v5 = objc_opt_new();
    id v4 = [v5 reportsNotYetSubmitted];
  }
  NSLog(&stru_1F371E5E0.isa, v4);

  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (BOOL)listKeys
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = +[_DPKeyNames allKeyNames];
  id v3 = (void *)[v2 mutableCopy];

  [v3 sortUsingSelector:sel_compare_];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = +[_DPKeyNames keyPropertiesForKey:v9];
        id v11 = v10;
        if (v10)
        {
          if ([v10 keyPatternsAllowed]) {
            BOOL v12 = @"%@*";
          }
          else {
            BOOL v12 = @"%@";
          }
          objc_msgSend(NSString, "stringWithFormat:", v12, v9);
          id v13 = objc_claimAutoreleasedReturnValue();
          puts((const char *)[v13 UTF8String]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return 1;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@: { recordKey=%@ ; action=%@ ; arguments=%@ }",
    v5,
    self->_recordKey,
    self->_action,
  uint64_t v6 = self->_arguments);

  return v6;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)arguments
{
  return self->_arguments;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)writeOK
{
  return self->_writeOK;
}

- (_DPStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executeCommand
{
}

- (void)metadataFromCSVString:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1DC55E000, v1, OS_LOG_TYPE_ERROR, "Cannot parse JSON from file=(%@): error=%@", v2, 0x16u);
}

- (void)recordNumbers:metadata:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Fail to instantiate recorder for key=%@", v2, v3, v4, v5, v6);
}

- (void)recordFloatVectors:metadata:forKey:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Cannot parse float vectors from \n%@", v2, v3, v4, v5, v6);
}

- (void)queryForKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Fail to find entityName for key=(%@)", v2, v3, v4, v5, v6);
}

@end