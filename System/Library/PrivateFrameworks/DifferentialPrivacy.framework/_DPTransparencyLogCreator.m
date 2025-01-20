@interface _DPTransparencyLogCreator
+ (id)convertToHexString:(id)a3;
+ (void)insertIfPossibleObj:(id)a3 intoJSONDictionary:(id)a4 withKey:(id)a5;
- (BOOL)writeToDiskWithError:(id *)a3;
- (NSArray)contents;
- (NSString)key;
- (NSString)reportName;
- (NSString)reportNameAcronym;
- (_DPTransparencyLogCreator)initWithDonations:(id)a3 error:(id *)a4;
- (id)contentsForDonations:(id)a3 withReportName:(id)a4 error:(id *)a5;
- (id)jsonRepresentationForMetadataInDonation:(id)a3;
- (id)jsonRepresentationFromParameters:(id)a3;
- (id)serializedContentsWithError:(id *)a3;
- (void)filterFieldsForPrivateEvolutionLogInMetadata:(id)a3;
@end

@implementation _DPTransparencyLogCreator

- (_DPTransparencyLogCreator)initWithDonations:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Expect at least one donation in the transparency log";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v20 = [v18 errorWithDomain:@"com.apple.DifferentialPrivacy.DPTransparencyLogCreatorError" code:1 userInfo:v19];

    v21 = +[_DPLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    if (a4) {
      *a4 = v20;
    }

    goto LABEL_13;
  }
  v23.receiver = self;
  v23.super_class = (Class)_DPTransparencyLogCreator;
  self = [(_DPTransparencyLogCreator *)&v23 init];
  if (self)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 key];
    key = self->_key;
    self->_key = v8;

    BOOL v10 = [(NSString *)self->_key containsString:@"PrivateEvolutionPlugin:results"];
    reportName = self->_reportName;
    v12 = @"PrivacyPreservingMeasurement";
    if (v10)
    {
      v12 = @"PrivateEvolution";
      v13 = &stru_1F3681BE0;
    }
    else
    {
      v13 = @"PPM";
    }
    self->_reportName = &v12->isa;

    reportNameAcronym = self->_reportNameAcronym;
    self->_reportNameAcronym = &v13->isa;

    v15 = [(_DPTransparencyLogCreator *)self contentsForDonations:v6 withReportName:self->_reportName error:a4];
    contents = self->_contents;
    self->_contents = v15;

    if (!self->_contents)
    {
LABEL_13:
      v17 = 0;
      goto LABEL_14;
    }
  }
  self = self;
  v17 = self;
LABEL_14:

  return v17;
}

- (id)serializedContentsWithError:(id *)a3
{
  id v6 = (void *)MEMORY[0x1E4F28D90];
  v7 = [(_DPTransparencyLogCreator *)self contents];
  id v14 = 0;
  v8 = [v6 dataWithJSONObject:v7 options:1 error:&v14];
  id v9 = v14;

  if (v8)
  {
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithData:v8 encoding:4];
    v11 = [(_DPTransparencyLogCreator *)self reportNameAcronym];
    objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"Dedisco", v11, 1, 0, objc_msgSend(v10, "length"));
  }
  else
  {
    v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DPTransparencyLogCreator serializedContentsWithError:](a2);
    }

    BOOL v10 = 0;
    if (a3) {
      *a3 = v9;
    }
  }

  return v10;
}

- (BOOL)writeToDiskWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E019F810](self, a2);
  id v6 = [(_DPTransparencyLogCreator *)self serializedContentsWithError:a3];
  if (v6)
  {
    v7 = [(_DPTransparencyLogCreator *)self reportName];
    v8 = +[_DPUploadHelper writeFileForDedisco:v6 withReportName:v7];

    BOOL v9 = v8 != 0;
    if (v8)
    {
      BOOL v10 = +[_DPLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(_DPTransparencyLogCreator *)self contents];
        uint64_t v12 = [v11 count];
        v13 = [(_DPTransparencyLogCreator *)self key];
        *(_DWORD *)buf = 134218498;
        uint64_t v26 = v12;
        __int16 v27 = 2112;
        v28 = v8;
        __int16 v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_DEFAULT, "%lu reports were written to transparency log %@ for %@", buf, 0x20u);
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      id v14 = NSString;
      v15 = [(_DPTransparencyLogCreator *)self contents];
      uint64_t v16 = [v15 count];
      v17 = [(_DPTransparencyLogCreator *)self key];
      v18 = [v14 stringWithFormat:@"Failed to write %lu reports to transparency log for %@", v16, v17];
      uint64_t v24 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      BOOL v10 = [v22 errorWithDomain:@"com.apple.DifferentialPrivacy.DPTransparencyLogCreatorError" code:3 userInfo:v19];

      v20 = +[_DPLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      if (a3)
      {
        BOOL v10 = v10;
        *a3 = v10;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)convertToHexString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  if (v4)
  {
    v5 = (unsigned __int8 *)v4;
    uint64_t v6 = [v3 length];
    v7 = [MEMORY[0x1E4F28E78] stringWithCapacity:2 * v6];
    for (i = (void *)MEMORY[0x1E019F810](); v6; --v6)
    {
      unsigned int v9 = *v5++;
      objc_msgSend(v7, "appendFormat:", @"%02X", v9);
    }
    BOOL v10 = [NSString stringWithString:v7];
  }
  else
  {
    BOOL v10 = [NSString string];
  }

  return v10;
}

+ (void)insertIfPossibleObj:(id)a3 intoJSONDictionary:(id)a4 withKey:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void *)MEMORY[0x1E4F28D90];
  v13[0] = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  LOBYTE(v10) = [v10 isValidJSONObject:v11];

  if (v10)
  {
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  else
  {
    uint64_t v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_DPTransparencyLogCreator insertIfPossibleObj:intoJSONDictionary:withKey:]();
    }
  }
}

- (id)jsonRepresentationFromParameters:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = +[_DPTransparencyLogCreator convertToHexString:v11];

          v11 = (void *)v12;
        }
        [(id)objc_opt_class() insertIfPossibleObj:v11 intoJSONDictionary:v4 withKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)jsonRepresentationForMetadataInDonation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v4 metadata];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v4, "metadata", v18);
        v13 = [v12 objectForKeyedSubscript:v11];

        if ([v11 isEqualToString:@"VDAF"])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = [(_DPTransparencyLogCreator *)self jsonRepresentationFromParameters:v13];
            [v5 setObject:v14 forKeyedSubscript:@"VDAF"];
          }
          else
          {
            long long v14 = +[_DPLog framework];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              long long v15 = objc_opt_class();
              *(_DWORD *)buf = v18;
              v25 = v11;
              __int16 v26 = 2112;
              __int16 v27 = v15;
              id v16 = v15;
              _os_log_error_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_ERROR, "Skipping field (%@) expected NSDictionary value, got %@.", buf, 0x16u);
            }
          }
        }
        else
        {
          [(id)objc_opt_class() insertIfPossibleObj:v13 intoJSONDictionary:v5 withKey:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)filterFieldsForPrivateEvolutionLogInMetadata:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 isEqualToString:@"AlgorithmParameters"] & 1) == 0)
        {
          if ([v9 isEqualToString:@"DediscoTaskConfig"])
          {
            uint64_t v10 = [v3 objectForKeyedSubscript:@"DediscoTaskConfig"];
            v11 = (void *)[v10 mutableCopy];

            [v11 removeObjectForKey:@"DediscoServerConfiguration"];
            [v11 removeObjectForKey:@"VDAFConfig"];
            [v3 setObject:v11 forKeyedSubscript:@"DediscoTaskConfig"];
          }
          else
          {
            [v3 removeObjectForKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)contentsForDonations:(id)a3 withReportName:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v9 = v6;
  uint64_t v52 = [v9 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v54;
    v45 = v8;
    id v46 = v7;
    id obj = v9;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v54 != v51) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
      if ([v7 isEqualToString:@"PrivacyPreservingMeasurement"])
      {
        long long v12 = (void *)MEMORY[0x1E4F1CA60];
        v63[0] = @"key";
        v49 = [v11 key];
        v64[0] = v49;
        v63[1] = @"share1";
        v48 = [v11 share1];
        long long v13 = +[_DPTransparencyLogCreator convertToHexString:v48];
        v64[1] = v13;
        v63[2] = @"share2";
        long long v14 = [v11 share2];
        long long v15 = +[_DPTransparencyLogCreator convertToHexString:v14];
        v64[2] = v15;
        v63[3] = @"dimension";
        id v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "dimension"));
        v64[3] = v16;
        v63[4] = @"serverAlgorithm";
        uint64_t v17 = [v11 serverAlgorithm];
        v64[4] = v17;
        v63[5] = @"algorithmParameters";
        long long v18 = [v11 algorithmParameters];
        v64[5] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:6];
        long long v20 = [v12 dictionaryWithDictionary:v19];

        long long v21 = [(_DPTransparencyLogCreator *)self jsonRepresentationForMetadataInDonation:v11];
        if ([v21 count]) {
          [v20 setObject:v21 forKeyedSubscript:@"metadata"];
        }
        uint64_t v8 = v45;
        id v7 = v46;
      }
      else
      {
        long long v22 = [v11 serverAlgorithm];
        char v23 = [v22 isEqualToString:@"PrioPlusPlus"];

        if ((v23 & 1) == 0)
        {
          v32 = v8;
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          v34 = NSString;
          v35 = [v11 serverAlgorithm];
          v36 = [v34 stringWithFormat:@"Donation algorithm is expected to be PrioPlusPlus, instead got %@.", v35];
          v62 = v36;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v38 = [v33 errorWithDomain:@"com.apple.DifferentialPrivacy.DPTransparencyLogCreatorError" code:2 userInfo:v37];

          v39 = +[_DPLog framework];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
          }

          uint64_t v8 = v32;
          goto LABEL_24;
        }
        uint64_t v24 = [v11 share1];
        v25 = [v11 share2];
        long long v21 = +[_DPPrioPlusPlusValueRandomizer reconstructedDataFromShare1:v24 share2:v25];

        if (!v21)
        {
          v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          v60 = @"Malformed data in donation.";
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          id v38 = [v40 errorWithDomain:@"com.apple.DifferentialPrivacy.DPTransparencyLogCreatorError" code:2 userInfo:v41];

          v42 = +[_DPLog framework];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
          }

LABEL_24:
          id v9 = obj;
          if (a5)
          {
            id v38 = v38;
            *a5 = v38;
          }

          id v31 = 0;
          goto LABEL_27;
        }
        __int16 v26 = (void *)MEMORY[0x1E4F1CA60];
        v57[0] = @"key";
        __int16 v27 = [v11 key];
        v58[0] = v27;
        v57[1] = @"dimension";
        v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "dimension"));
        v58[1] = v28;
        v58[2] = @"email";
        v57[2] = @"dataSource";
        v57[3] = @"noisedData";
        v58[3] = v21;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:4];
        long long v20 = [v26 dictionaryWithDictionary:v29];

        v30 = [(_DPTransparencyLogCreator *)self jsonRepresentationForMetadataInDonation:v11];
        [(_DPTransparencyLogCreator *)self filterFieldsForPrivateEvolutionLogInMetadata:v30];
        if ([v30 count]) {
          [v20 setObject:v30 forKeyedSubscript:@"metadata"];
        }
      }
      [v8 addObject:v20];

      if (v52 == ++v10)
      {
        id v9 = obj;
        uint64_t v52 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v52) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v31 = v8;
LABEL_27:

  return v31;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)reportName
{
  return self->_reportName;
}

- (NSString)reportNameAcronym
{
  return self->_reportNameAcronym;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportNameAcronym, 0);
  objc_storeStrong((id *)&self->_reportName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

- (void)serializedContentsWithError:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v2, v3, "%@: failed to serialize transparency log content to json, error: %@", v4, v5, v6, v7, v8);
}

+ (void)insertIfPossibleObj:intoJSONDictionary:withKey:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v1, v2, "Skipping field =(%@) as it cannot be serialized into JSON, type=%@.", v3, v4, v5, v6, 2u);
}

@end