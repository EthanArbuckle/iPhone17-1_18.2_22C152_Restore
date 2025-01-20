@interface FBKFilePredicate
+ (id)entityName;
- (BOOL)satisfiedBy:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFilePredicate

+ (id)entityName
{
  return @"FilePredicate";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v21 = a3;
  v4 = [v21 objectForKeyedSubscript:@"enhanced_logging_duration"];
  v5 = FBKNilIfNSNull(v4);

  if (v5) {
    -[FBKFilePredicate setEnhancedLoggingDuration:](self, "setEnhancedLoggingDuration:", [v5 unsignedIntegerValue]);
  }
  v6 = [v21 objectForKeyedSubscript:@"enhanced_logging_retry_count"];
  v7 = FBKNilIfNSNull(v6);

  if (v7) {
    -[FBKFilePredicate setEnhancedLoggingRetryCount:](self, "setEnhancedLoggingRetryCount:", [v7 unsignedIntegerValue]);
  }
  v8 = [v21 objectForKeyedSubscript:@"shows_consent_text"];
  v9 = FBKNilIfNSNull(v8);

  if (v9) {
    -[FBKFilePredicate setShowsConsentText:](self, "setShowsConsentText:", [v9 BOOLValue]);
  }
  v10 = [v21 objectForKeyedSubscript:@"is_always_required"];
  -[FBKFilePredicate setAlwaysRequired:](self, "setAlwaysRequired:", [v10 BOOLValue]);

  v11 = [v21 objectForKeyedSubscript:@"requires_remote"];
  -[FBKFilePredicate setRequiresRemote:](self, "setRequiresRemote:", [v11 BOOLValue]);

  v12 = [v21 objectForKeyedSubscript:@"file_predicate_conditions"];

  if (v12)
  {
    v13 = [v21 valueForKeyPath:@"file_predicate_conditions"];
    v14 = [(FBKFilePredicate *)self managedObjectContext];
    v15 = +[FBKManagedFeedbackObject importFromJSONArray:v13 intoContext:v14];
    [(FBKFilePredicate *)self setConditions:v15];
  }
  else
  {
    v13 = [MEMORY[0x263EFFA08] set];
    [(FBKFilePredicate *)self setConditions:v13];
  }

  v16 = [v21 objectForKeyedSubscript:@"file_predicate_file_matchers"];

  if (v16)
  {
    v17 = [v21 valueForKeyPath:@"file_predicate_file_matchers"];
    v18 = [v17 valueForKey:@"file_matcher"];
    v19 = [(FBKFilePredicate *)self managedObjectContext];
    v20 = +[FBKManagedFeedbackObject importFromJSONArray:v18 intoContext:v19];
    [(FBKFilePredicate *)self setMatchers:v20];
  }
  else
  {
    v17 = [MEMORY[0x263EFFA08] set];
    [(FBKFilePredicate *)self setMatchers:v17];
  }
}

- (BOOL)satisfiedBy:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(FBKFilePredicate *)self alwaysRequired] & 1) != 0
    || ([(FBKFilePredicate *)self conditions],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        !v6))
  {
    BOOL v46 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFF9A0];
    v8 = [(FBKFilePredicate *)self conditions];
    v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v10 = [(FBKFilePredicate *)self conditions];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v70;
      uint64_t v14 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = [*(id *)(*((void *)&v69 + 1) + 8 * i) questionTat];
          [v9 setObject:v14 forKeyedSubscript:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (v12);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v56 = self;
    obuint64_t j = [(FBKFilePredicate *)self conditions];
    uint64_t v51 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v51)
    {
      uint64_t v50 = *(void *)v66;
      v17 = &off_264873000;
      uint64_t v18 = MEMORY[0x263EFFA88];
      id v49 = v4;
      v55 = v9;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v66 != v50) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          id v21 = [v4 bugForm];
          v22 = [v20 questionTat];
          v23 = [v21 questionWithRole:v22];

          if (v23)
          {
            v53 = v23;
            uint64_t v54 = j;
            v24 = [v4 answerForQuestion:v23];
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            v52 = v24;
            v25 = [v24 values];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v61 objects:v80 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v62;
              do
              {
                uint64_t v29 = 0;
                do
                {
                  if (*(void *)v62 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v61 + 1) + 8 * v29);
                  v31 = [v20 questionValue];
                  LODWORD(v30) = [v30 isEqualToString:v31];

                  if (v30)
                  {
                    v32 = [v17[197] model];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      v34 = [v20 questionTat];
                      v35 = [v20 questionValue];
                      [(FBKManagedFeedbackObject *)v56 ID];
                      v37 = uint64_t v36 = v18;
                      int v38 = [v37 intValue];
                      *(_DWORD *)buf = 138543874;
                      v75 = v34;
                      __int16 v76 = 2114;
                      v77 = v35;
                      __int16 v78 = 1024;
                      int v79 = v38;
                      _os_log_debug_impl(&dword_22A36D000, v32, OS_LOG_TYPE_DEBUG, "condition [%{public}@ = %{public}@] satisfied for predicate [%i]", buf, 0x1Cu);

                      uint64_t v18 = v36;
                      v17 = &off_264873000;
                      v9 = v55;
                    }
                    v33 = [v20 questionTat];
                    [v9 setObject:v18 forKeyedSubscript:v33];
                  }
                  ++v29;
                }
                while (v27 != v29);
                uint64_t v27 = [v25 countByEnumeratingWithState:&v61 objects:v80 count:16];
              }
              while (v27);
            }

            id v4 = v49;
            v23 = v53;
            uint64_t j = v54;
          }
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v51);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v39 = [v9 allKeys];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v57 objects:v73 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v58;
      while (2)
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = [v9 valueForKey:*(void *)(*((void *)&v57 + 1) + 8 * k)];
          int v45 = [v44 BOOLValue];

          if (!v45)
          {
            BOOL v46 = 0;
            goto LABEL_41;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v57 objects:v73 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }
    BOOL v46 = 1;
LABEL_41:
  }
  return v46;
}

@end