@interface DESMetadataSchema
- (DESMetadataEncoder)encoder;
- (DESMetadataSchema)initWith:(id)a3 key:(id)a4 attachments:(id)a5 error:(id *)a6;
- (NSString)desc;
- (NSString)key;
- (int)outputType;
- (int64_t)buckets;
@end

@implementation DESMetadataSchema

- (DESMetadataSchema)initWith:(id)a3 key:(id)a4 attachments:(id)a5 error:(id *)a6
{
  v115[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v94.receiver = self;
  v94.super_class = (Class)DESMetadataSchema;
  v13 = [(DESMetadataSchema *)&v94 init];
  if (!v13) {
    goto LABEL_36;
  }
  v14 = [v10 objectForKey:v11];
  if (!v14)
  {
    id v19 = [NSString stringWithFormat:@"No schema for metadata key %@, skip encoding.", v11];
    v20 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
    }

    if (!a6) {
      goto LABEL_31;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = a6;
    uint64_t v114 = *MEMORY[0x1E4F28588];
    v115[0] = v19;
    v23 = (void *)MEMORY[0x1E4F1C9E8];
    v24 = (id *)v115;
    v25 = &v114;
    goto LABEL_29;
  }
  unint64_t v15 = 0x1E4F1C000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [NSString stringWithFormat:@"Schema for %@ is not a dictionary.", v11];
    v26 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
    }

    if (!a6) {
      goto LABEL_31;
    }
    v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = a6;
    uint64_t v112 = *MEMORY[0x1E4F28588];
    id v113 = v19;
    v23 = (void *)MEMORY[0x1E4F1C9E8];
    v24 = &v113;
    v25 = &v112;
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v13->_key, a4);
  v16 = [v14 objectForKey:@"type"];
  char v17 = [v16 isEqualToString:@"categorical"];

  if (v17)
  {
    int v18 = 1;
  }
  else
  {
    v27 = [v14 objectForKey:@"type"];
    char v28 = [v27 isEqualToString:@"numeric"];

    if ((v28 & 1) == 0)
    {
      v39 = [v14 objectForKey:@"type"];
      char v40 = [v39 isEqualToString:@"fedstats"];

      if (!a6 || (v40 & 1) != 0) {
        goto LABEL_32;
      }
      id v19 = [NSString stringWithFormat:@"Malformed schema, type is neither categorical nor numeric for %@.", v11];
      v21 = (void *)MEMORY[0x1E4F28C58];
      v22 = a6;
      uint64_t v110 = *MEMORY[0x1E4F28588];
      id v111 = v19;
      v23 = (void *)MEMORY[0x1E4F1C9E8];
      v24 = &v111;
      v25 = &v110;
      goto LABEL_29;
    }
    int v18 = 0;
  }
  v13->_outputType = v18;
  v29 = [v14 objectForKey:@"buckets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [v14 objectForKey:@"buckets"];
    uint64_t v31 = [v30 integerValue];

    if (v31)
    {
      v32 = [v14 objectForKey:@"buckets"];
      v13->_buckets = [v32 integerValue];

      uint64_t v33 = [v14 objectForKey:@"description"];
      desc = v13->_desc;
      v13->_desc = (NSString *)v33;

      if (v13->_outputType == 1)
      {
        v35 = [v14 objectForKey:@"dictionary"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v19 = [v14 objectForKey:@"dictionary"];
LABEL_21:
          v37 = [[DESCategoricalMetadataEncoder alloc] initWithSingleSchema:v19];
          if (v37)
          {
            encoder = v13->_encoder;
            v13->_encoder = (DESMetadataEncoder *)v37;

LABEL_35:
LABEL_36:
            v42 = v13;
            goto LABEL_37;
          }
          v41 = [NSString stringWithFormat:@"Failed to create CategoricalMetadataEncoder for: %@", v11];
          v57 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
            +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
          }

          if (a6)
          {
            v86 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v97 = *MEMORY[0x1E4F28588];
            v98 = v41;
            [*(id *)(v15 + 2536) dictionaryWithObjects:&v98 forKeys:&v97 count:1];
            v59 = v58 = a6;
            id *v58 = [v86 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2007 userInfo:v59];
          }
          goto LABEL_30;
        }
        v45 = [v14 objectForKey:@"dictionary_path"];
        objc_opt_class();
        char v46 = objc_opt_isKindOfClass();

        if (v46)
        {
          v41 = [v14 objectForKey:@"dictionary_path"];
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id obj = v12;
          id v19 = (id)[obj countByEnumeratingWithState:&v90 objects:v107 count:16];
          if (!v19)
          {
LABEL_66:

            goto LABEL_21;
          }
          v82 = a6;
          id v83 = v12;
          uint64_t v85 = *(void *)v91;
LABEL_41:
          uint64_t v47 = 0;
          while (1)
          {
            if (*(void *)v91 != v85) {
              objc_enumerationMutation(obj);
            }
            v48 = *(void **)(*((void *)&v90 + 1) + 8 * v47);
            v49 = [v48 lastPathComponent];
            int v50 = [v49 isEqualToString:v41];

            if (v50) {
              break;
            }
            if (v19 == (id)++v47)
            {
              id v19 = (id)[obj countByEnumeratingWithState:&v90 objects:v107 count:16];
              if (v19) {
                goto LABEL_41;
              }
              a6 = v82;
              id v12 = v83;
              goto LABEL_65;
            }
          }
          id v89 = 0;
          uint64_t v60 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v48 options:1 error:&v89];
          id v19 = v89;
          v87 = (void *)v60;
          if (!v60)
          {
            v87 = [NSString stringWithFormat:@"Malformed schema, unreadable dictionary_path %@ for %@, error: %@", v41, v11, v19];
            v66 = +[DESLogging coreChannel];
            id v12 = v83;
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
              +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
            }

            if (!v82) {
              goto LABEL_83;
            }
            v67 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v68 = *MEMORY[0x1E4F28588];
            v105[0] = *MEMORY[0x1E4F28A50];
            v105[1] = v68;
            v106[0] = v19;
            v106[1] = v87;
            v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
            id *v82 = [v67 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2007 userInfo:v69];
LABEL_82:

LABEL_83:
            goto LABEL_30;
          }
          id v88 = v19;
          v61 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v60 options:0 error:&v88];
          id v62 = v88;

          objc_opt_class();
          id v12 = v83;
          id v81 = v62;
          if (objc_opt_isKindOfClass())
          {
            v63 = [v61 objectForKey:@"dictionary"];
            objc_opt_class();
            char v64 = objc_opt_isKindOfClass();

            v65 = v61;
            a6 = v82;
            if (v64)
            {
              id v19 = [v65 objectForKey:@"dictionary"];

              id obj = v62;
LABEL_65:
              unint64_t v15 = 0x1E4F1C000;
              goto LABEL_66;
            }
            v80 = v65;
            id v76 = v62;
            v70 = [NSString stringWithFormat:@"Malformed schema, unparsable dictionary read from dictionary_path %@ for %@, error: %@", v41, v11, v62];
            v77 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
            }

            if (!v82) {
              goto LABEL_81;
            }
            v72 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v101 = *MEMORY[0x1E4F28588];
            v102 = v70;
            v79 = v70;
            v73 = (void *)MEMORY[0x1E4F1C9E8];
            v74 = &v102;
            v75 = &v101;
          }
          else
          {
            v80 = v61;
            v70 = [NSString stringWithFormat:@"Malformed schema, unparsable dictionary_path %@ for %@, error: %@", v41, v11, v62];
            v71 = +[DESLogging coreChannel];
            a6 = v82;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
              +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
            }

            if (!v82)
            {
              id v76 = v81;
              goto LABEL_81;
            }
            v72 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v103 = *MEMORY[0x1E4F28588];
            v104 = v70;
            v79 = v70;
            v73 = (void *)MEMORY[0x1E4F1C9E8];
            v74 = &v104;
            v75 = &v103;
          }
          v78 = [v73 dictionaryWithObjects:v74 forKeys:v75 count:1];
          *a6 = [v72 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2007 userInfo:v78];

          id v76 = v81;
          v70 = v79;
LABEL_81:

          id v19 = v76;
          v69 = v80;
          goto LABEL_82;
        }
        id v19 = [NSString stringWithFormat:@"Malformed schema, neither dictionary nor dictionary_path has the correct format for: %@", v11];
        v56 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
        }

        if (!a6) {
          goto LABEL_31;
        }
        v52 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v99 = *MEMORY[0x1E4F28588];
        id v100 = v19;
        v53 = (void *)MEMORY[0x1E4F1C9E8];
        v54 = &v100;
        v55 = &v99;
      }
      else
      {
        v43 = objc_alloc_init(DESNumericMetadataEncoder);
        if (v43)
        {
          id v19 = v13->_encoder;
          v13->_encoder = (DESMetadataEncoder *)v43;
          goto LABEL_35;
        }
        id v19 = [NSString stringWithFormat:@"Failed to create NumericMetadataEncoder for: %@", v11];
        v51 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
        }

        if (!a6) {
          goto LABEL_31;
        }
        v52 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v95 = *MEMORY[0x1E4F28588];
        id v96 = v19;
        v53 = (void *)MEMORY[0x1E4F1C9E8];
        v54 = &v96;
        v55 = &v95;
      }
      v41 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:1];
      *a6 = [v52 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2007 userInfo:v41];
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
  }
  else
  {
  }
  if (a6)
  {
    [NSString stringWithFormat:@"Malformed schema, buckets %ld is <= 0 for %@.", v13->_buckets, v11];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = a6;
    uint64_t v108 = *MEMORY[0x1E4F28588];
    id v109 = v19;
    v23 = (void *)MEMORY[0x1E4F1C9E8];
    v24 = &v109;
    v25 = &v108;
LABEL_29:
    v41 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
    id *v22 = [v21 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2007 userInfo:v41];
    goto LABEL_30;
  }
LABEL_32:

  v42 = 0;
LABEL_37:

  return v42;
}

- (NSString)key
{
  return self->_key;
}

- (int)outputType
{
  return self->_outputType;
}

- (int64_t)buckets
{
  return self->_buckets;
}

- (NSString)desc
{
  return self->_desc;
}

- (DESMetadataEncoder)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_desc, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end