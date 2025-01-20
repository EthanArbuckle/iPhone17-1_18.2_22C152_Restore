@interface MCMContainerSchema
+ (BOOL)schemaIsUpToDateForIdentifier:(id)a3 containerClass:(unint64_t)a4 currentSchemaVersion:(id)a5 latestSchemaVersion:(id *)a6;
+ (id)containerSchemaWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6;
- (BOOL)_executeActions:(id)a3 error:(id *)a4;
- (BOOL)writeSchemaFromVersion:(id)a3 toTargetVersion:(id)a4 error:(id *)a5;
- (BOOL)writeSchemaToTargetVersion:(id)a3 error:(id *)a4;
- (MCMContainerSchema)initWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6;
- (MCMContainerSchemaContext)context;
- (MCMMetadataMinimal)metadata;
- (NSNumber)latestSchemaVersion;
- (id)_actionArgsAfterInterpolationOnActionArgs:(id)a3 replacements:(id)a4;
- (id)_actionsFromVersion:(id)a3 toTargetVersion:(id)a4 context:(id)a5;
- (id)_interpolationReplacements;
@end

@implementation MCMContainerSchema

+ (BOOL)schemaIsUpToDateForIdentifier:(id)a3 containerClass:(unint64_t)a4 currentSchemaVersion:(id)a5 latestSchemaVersion:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = MCMContainerSchemaDefinitionForClass(a4);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));

  if ([v10 compare:v12])
  {
    if ([v10 compare:v12] != 1)
    {
      BOOL v14 = 0;
      if (!a6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138413058;
      id v17 = v9;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "[%@(%llu)] Current schema version (%@) is newer than the latest (%@), ignoring.", (uint8_t *)&v16, 0x2Au);
    }
  }
  BOOL v14 = 1;
  if (a6) {
LABEL_7:
  }
    *a6 = v12;
LABEL_8:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSchemaVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSNumber)latestSchemaVersion
{
  return self->_latestSchemaVersion;
}

- (MCMContainerSchemaContext)context
{
  return self->_context;
}

- (MCMMetadataMinimal)metadata
{
  return self->_metadata;
}

- (BOOL)_executeActions:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9478DF0]();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v35 = a4;
    v11 = self;
    id v12 = 0;
    uint64_t v13 = *(void *)v53;
    while (2)
    {
      uint64_t v14 = 0;
      v15 = v12;
      do
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v8);
        }
        int v16 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        id v36 = v15;
        char v17 = [v16 performWithError:&v36];
        id v12 = v36;

        if ((v17 & 1) == 0)
        {
          __int16 v18 = container_log_handle_for_category();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v21 = v11;
            __int16 v22 = [(MCMContainerSchema *)v11 metadata];
            v34 = [v22 uuid];
            v31 = [v21 metadata];
            v30 = [v31 containerPath];
            v33 = [v30 containerPathIdentifier];
            v29 = [v21 metadata];
            v32 = [v29 identifier];
            v23 = [v21 metadata];
            uint64_t v28 = [v23 containerClass];
            uint64_t v24 = [v21 metadata];
            int v25 = [v24 conformsToProtocol:&unk_1F2F1ADA0];
            if (v25)
            {
              v27 = [v21 metadata];
              id v21 = [v27 fsNode];
              uint64_t v26 = [v21 inode];
            }
            else
            {
              uint64_t v26 = 0;
            }
            *(_DWORD *)buf = 138544898;
            v38 = v34;
            __int16 v39 = 2114;
            v40 = v33;
            __int16 v41 = 2112;
            v42 = v32;
            __int16 v43 = 2050;
            uint64_t v44 = v28;
            __int16 v45 = 2048;
            uint64_t v46 = v26;
            __int16 v47 = 2112;
            v48 = v16;
            __int16 v49 = 2112;
            id v50 = v12;
            _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Action [%@] failed; error = %@",
              buf,
              0x48u);
            if (v25)
            {
            }
          }

          if (v35)
          {
            id v12 = v12;
            BOOL v19 = 0;
            id *v35 = v12;
          }
          else
          {
            BOOL v19 = 0;
          }
          goto LABEL_16;
        }
        ++v14;
        v15 = v12;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v12 = 0;
  }

  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (id)_actionsFromVersion:(id)a3 toTargetVersion:(id)a4 context:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = (void *)MEMORY[0x1D9478DF0]();
  v77 = v10;
  uint64_t v13 = MCMContainerSchemaDefinitionForClass([v10 containerClass]);
  unint64_t v14 = [v9 unsignedIntegerValue];
  v76 = self;
  if (v14 > [v13 count])
  {
    v15 = container_log_handle_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      contexta = v12;
      v71 = v13;
      v75 = v11;
      v64 = [(MCMContainerSchema *)self metadata];
      v73 = [v64 uuid];
      v62 = [(MCMContainerSchema *)self metadata];
      v60 = [v62 containerPath];
      v66 = [v60 containerPathIdentifier];
      v38 = [(MCMContainerSchema *)self metadata];
      __int16 v39 = [v38 identifier];
      v40 = [(MCMContainerSchema *)self metadata];
      __int16 v41 = self;
      uint64_t v42 = [v40 containerClass];
      __int16 v43 = [(MCMContainerSchema *)v41 metadata];
      int v44 = [v43 conformsToProtocol:&unk_1F2F1ADA0];
      if (v44)
      {
        v57 = [(MCMContainerSchema *)v41 metadata];
        uint64_t v56 = [v57 fsNode];
        uint64_t v45 = [v56 inode];
      }
      else
      {
        uint64_t v45 = 0;
      }
      *(_DWORD *)buf = 138544898;
      v80 = v73;
      __int16 v81 = 2114;
      v82 = v66;
      __int16 v83 = 2112;
      v84 = v39;
      __int16 v85 = 2050;
      uint64_t v86 = v42;
      __int16 v87 = 2048;
      uint64_t v88 = v45;
      __int16 v89 = 2112;
      id v90 = v9;
      __int16 v91 = 2048;
      uint64_t v92 = [v71 count];
      _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Trying to target a version [%@] higher than available [%lu], capping to max", buf, 0x48u);
      if (v44)
      {
      }
      v11 = v75;
      self = v76;
      id v12 = contexta;
      uint64_t v13 = v71;
    }

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));

    id v9 = (id)v16;
  }
  char v17 = [(MCMContainerSchema *)self _interpolationReplacements];
  unint64_t v18 = [v8 unsignedIntegerValue];
  if (v18 < [v9 unsignedIntegerValue])
  {
    unint64_t v19 = [v8 unsignedIntegerValue];
    if (v19 < [v9 unsignedIntegerValue])
    {
      v65 = v9;
      id v67 = v8;
      v74 = v11;
      context = v12;
      v70 = v13;
      do
      {
        unint64_t v63 = v19;
        v72 = [v13 objectAtIndexedSubscript:v19];
        __int16 v20 = [v72 objectForKeyedSubscript:@"script"];
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v96 objects:v95 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v97;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v97 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v96 + 1) + 8 * v25);
              v27 = [v26 objectAtIndexedSubscript:0];
              uint64_t v28 = [v27 string];

              v29 = objc_msgSend(v26, "subarrayWithRange:", 1, objc_msgSend(v26, "count") - 1);
              v30 = [(MCMContainerSchema *)self _actionArgsAfterInterpolationOnActionArgs:v29 replacements:v17];

              id v78 = 0;
              v31 = +[MCMContainerSchemaActionBase actionWithName:v28 arguments:v30 context:v77 error:&v78];
              id v32 = v78;
              if (v31)
              {
                [v74 addObject:v31];
              }
              else
              {
                v33 = container_log_handle_for_category();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
                {
                  long long v55 = [(MCMContainerSchema *)v76 metadata];
                  v61 = [v55 uuid];
                  long long v54 = [(MCMContainerSchema *)v76 metadata];
                  long long v53 = [v54 containerPath];
                  v59 = [v53 containerPathIdentifier];
                  long long v52 = [(MCMContainerSchema *)v76 metadata];
                  v58 = [v52 identifier];
                  v51 = [(MCMContainerSchema *)v76 metadata];
                  uint64_t v48 = [v51 containerClass];
                  id v50 = [(MCMContainerSchema *)v76 metadata];
                  int v49 = [v50 conformsToProtocol:&unk_1F2F1ADA0];
                  if (v49)
                  {
                    __int16 v47 = [(MCMContainerSchema *)v76 metadata];
                    uint64_t v46 = [v47 fsNode];
                    uint64_t v34 = [v46 inode];
                  }
                  else
                  {
                    uint64_t v34 = 0;
                  }
                  *(_DWORD *)buf = 138545154;
                  v80 = v61;
                  __int16 v81 = 2114;
                  v82 = v59;
                  __int16 v83 = 2112;
                  v84 = v58;
                  __int16 v85 = 2050;
                  uint64_t v86 = v48;
                  __int16 v87 = 2048;
                  uint64_t v88 = v34;
                  __int16 v89 = 2112;
                  id v90 = v28;
                  __int16 v91 = 2112;
                  uint64_t v92 = (uint64_t)v30;
                  __int16 v93 = 2112;
                  id v94 = v32;
                  _os_log_fault_impl(&dword_1D7739000, v33, OS_LOG_TYPE_FAULT, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not form action [%@] with args: %@, error = %@", buf, 0x52u);
                  if (v49)
                  {
                  }
                }
              }
              if (!v31)
              {

                id v36 = 0;
                id v9 = v65;
                id v8 = v67;
                v11 = v74;
                goto LABEL_29;
              }
              ++v25;
              self = v76;
            }
            while (v23 != v25);
            uint64_t v35 = [v21 countByEnumeratingWithState:&v96 objects:v95 count:16];
            uint64_t v23 = v35;
          }
          while (v35);
        }

        id v9 = v65;
        unint64_t v19 = v63 + 1;
        id v8 = v67;
        id v12 = context;
        v11 = v74;
        uint64_t v13 = v70;
      }
      while (v63 + 1 < [v65 unsignedIntegerValue]);
    }
  }

  id v36 = (void *)[v11 copy];
LABEL_29:

  return v36;
}

- (id)_interpolationReplacements
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = [(MCMContainerSchema *)self metadata];
  v3 = [v2 containerPath];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 destinationContainerPath];

    v3 = (void *)v4;
  }
  v5 = [v3 containerPathIdentifier];
  v13[0] = @"${RealHome}";
  id v6 = +[MCMPOSIXUser currentPOSIXUser];
  v7 = [v6 homeDirectoryURL];
  id v8 = [v7 path];
  v14[0] = v8;
  v13[1] = @"${BundleId}";
  id v9 = [v2 identifier];
  v14[1] = v9;
  v13[2] = @"${SigningId}";
  id v10 = [v2 identifier];
  v13[3] = @"${ContainerId}";
  v14[2] = v10;
  v14[3] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)_actionArgsAfterInterpolationOnActionArgs:(id)a3 replacements:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = a4;
  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    uint64_t v27 = *(void *)v38;
    id v28 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v30 = v8;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        id v12 = [v11 string];
        uint64_t v13 = [v12 pathComponents];

        if ([v13 count] && (objc_msgSend(v13, "containsObject:", @"..") & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            unint64_t v14 = [v11 string];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v15 = v29;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v33;
              do
              {
                uint64_t v19 = 0;
                __int16 v20 = v14;
                do
                {
                  if (*(void *)v33 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v19);
                  uint64_t v22 = [v15 objectForKeyedSubscript:v21];
                  unint64_t v14 = objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:options:range:", v21, v22, 1, 0, objc_msgSend(v20, "length"));

                  ++v19;
                  __int16 v20 = v14;
                }
                while (v17 != v19);
                uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
              }
              while (v17);
            }

            uint64_t v23 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v14];
            if (v23) {
              [v26 addObject:v23];
            }

            uint64_t v9 = v27;
            id v6 = v28;
            uint64_t v8 = v30;
          }
          else
          {
            [v26 addObject:v11];
          }
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v8);
  }

  uint64_t v24 = (void *)[v26 copy];

  return v24;
}

- (BOOL)writeSchemaToTargetVersion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MCMContainerSchema *)self metadata];
  uint64_t v8 = [v7 schemaVersion];
  LOBYTE(a4) = [(MCMContainerSchema *)self writeSchemaFromVersion:v8 toTargetVersion:v6 error:a4];

  return (char)a4;
}

- (BOOL)writeSchemaFromVersion:(id)a3 toTargetVersion:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MCMContainerSchema *)self metadata];
  v11 = [(MCMContainerSchema *)self context];
  id v12 = [(MCMContainerSchema *)self _actionsFromVersion:v8 toTargetVersion:v9 context:v11];

  uint64_t v13 = container_log_handle_for_category();
  unint64_t v14 = v13;
  if (v12)
  {
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v13, self);

    uint64_t v16 = container_log_handle_for_category();
    uint64_t v17 = v16;
    os_signpost_id_t spid = v15;
    unint64_t v18 = v15 - 1;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      [v10 identifier];
      v20 = id v19 = v8;
      *(_DWORD *)buf = 138477827;
      v60 = v20;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SchemaUpdate", " identifier=%{private, signpost.description:attribute}@ ", buf, 0xCu);

      id v8 = v19;
    }

    id v58 = 0;
    BOOL v21 = [(MCMContainerSchema *)self _executeActions:v12 error:&v58];
    id v22 = v58;
    uint64_t v23 = container_log_handle_for_category();
    uint64_t v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = a5;
        id v55 = v8;
        long long v53 = [v10 uuid];
        __int16 v47 = [v10 containerPath];
        v51 = [v47 containerPathIdentifier];
        uint64_t v25 = [v10 identifier];
        uint64_t v45 = [v10 containerClass];
        int v26 = [v10 conformsToProtocol:&unk_1F2F1ADA0];
        if (v26)
        {
          int v44 = [v10 fsNode];
          uint64_t v27 = [v44 inode];
        }
        else
        {
          uint64_t v27 = 0;
        }
        uint64_t v31 = [v12 count];
        *(_DWORD *)buf = 138545154;
        v60 = v53;
        __int16 v61 = 2114;
        v62 = v51;
        __int16 v63 = 2112;
        v64 = v25;
        __int16 v65 = 2050;
        uint64_t v66 = v45;
        __int16 v67 = 2048;
        uint64_t v68 = v27;
        __int16 v69 = 2114;
        id v70 = v55;
        __int16 v71 = 2114;
        id v72 = v9;
        __int16 v73 = 2050;
        uint64_t v74 = v31;
        _os_log_impl(&dword_1D7739000, v24, OS_LOG_TYPE_DEFAULT, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Successfully updated schema from (%{public}@) → (%{public}@), actions count = %{public}lu", buf, 0x52u);
        if (v26) {

        }
        long long v32 = v47;
LABEL_18:

        id v8 = v55;
        a5 = v49;
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v49 = a5;
      id v55 = v8;
      long long v53 = [v10 uuid];
      uint64_t v46 = [v10 containerPath];
      long long v52 = [v46 containerPathIdentifier];
      uint64_t v48 = [v10 identifier];
      uint64_t v28 = [v10 containerClass];
      int v29 = [v10 conformsToProtocol:&unk_1F2F1ADA0];
      if (v29)
      {
        int v44 = [v10 fsNode];
        uint64_t v30 = [v44 inode];
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v43 = [v12 count];
      *(_DWORD *)buf = 138545410;
      v60 = v53;
      __int16 v61 = 2114;
      v62 = v52;
      __int16 v63 = 2112;
      v64 = v48;
      __int16 v65 = 2050;
      uint64_t v66 = v28;
      __int16 v67 = 2048;
      uint64_t v68 = v30;
      __int16 v69 = 2114;
      id v70 = v55;
      __int16 v71 = 2114;
      id v72 = v9;
      __int16 v73 = 2050;
      uint64_t v74 = v43;
      __int16 v75 = 2114;
      id v76 = v22;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), actions count = %{public}lu, error = %{public}@", buf, 0x5Cu);
      if (v29) {

      }
      long long v32 = v46;
      goto LABEL_18;
    }

    long long v33 = container_log_handle_for_category();
    unint64_t v14 = v33;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      long long v34 = [v10 identifier];
      *(_DWORD *)buf = 138477827;
      v60 = v34;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v14, OS_SIGNPOST_INTERVAL_END, spid, "SchemaUpdate", " identifier=%{private, signpost.description:attribute}@ ", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v50 = a5;
    id v36 = v8;
    spida = [v10 uuid];
    long long v37 = [v10 containerPath];
    long long v38 = [v37 containerPathIdentifier];
    long long v39 = [v10 identifier];
    uint64_t v40 = [v10 containerClass];
    int v41 = [v10 conformsToProtocol:&unk_1F2F1ADA0];
    if (v41)
    {
      long long v54 = [v10 fsNode];
      uint64_t v42 = [v54 inode];
    }
    else
    {
      uint64_t v42 = 0;
    }
    *(_DWORD *)buf = 138544898;
    v60 = spida;
    __int16 v61 = 2114;
    v62 = v38;
    __int16 v63 = 2112;
    v64 = v39;
    __int16 v65 = 2050;
    uint64_t v66 = v40;
    __int16 v67 = 2048;
    uint64_t v68 = v42;
    __int16 v69 = 2114;
    id v70 = v36;
    __int16 v71 = 2114;
    id v72 = v9;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not update schema from (%{public}@) → (%{public}@), no actions available", buf, 0x48u);
    if (v41) {

    }
    LOBYTE(v21) = 0;
    id v22 = 0;
    id v8 = v36;
    a5 = v50;
  }
  else
  {
    LOBYTE(v21) = 0;
    id v22 = 0;
  }
LABEL_22:

  if (a5 && !v21) {
    *a5 = v22;
  }

  return v21;
}

- (MCMContainerSchema)initWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)MCMContainerSchema;
  unint64_t v14 = [(MCMContainerSchema *)&v29 init];
  os_signpost_id_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metadata, a3);
    uint64_t v28 = [v11 containerPath];
    uint64_t v27 = [v11 containerClass];
    uint64_t v16 = [v11 containerPath];
    unsigned int v26 = [v16 schemaPOSIXMode];

    uint64_t v17 = [v11 containerPath];
    unint64_t v18 = [v17 schemaPOSIXOwner];

    id v19 = [v11 identifier];
    __int16 v20 = +[MCMPOSIXUser currentPOSIXUser];
    BOOL v21 = [v20 homeDirectoryURL];
    LODWORD(v25) = a5;
    uint64_t v22 = +[MCMContainerSchemaContext contextWithHomeDirectoryURL:v21 containerPath:v28 finalContainerPath:v12 POSIXMode:v26 POSIXOwner:v18 containerClass:v27 dataProtectionClass:v25 libraryRepair:v13 identifier:v19];
    context = v15->_context;
    v15->_context = (MCMContainerSchemaContext *)v22;
  }
  return v15;
}

+ (id)containerSchemaWithMetadata:(id)a3 finalContainerPath:(id)a4 dataProtectionClass:(int)a5 libraryRepair:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithMetadata:v12 finalContainerPath:v11 dataProtectionClass:v6 libraryRepair:v10];

  return v13;
}

@end