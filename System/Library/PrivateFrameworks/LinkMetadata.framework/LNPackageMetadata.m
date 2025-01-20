@interface LNPackageMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)resolveWithImagePath:(id)a3 executablePath:(id)a4 rpaths:(id)a5 partialResults:(id)a6 error:(id *)a7;
- (LNPackageMetadata)initWithCoder:(id)a3;
- (LNPackageMetadata)initWithIncludes:(id)a3;
- (NSArray)includes;
- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 error:(id *)a5;
- (id)description;
- (id)initFrom:(id)a3 error:(id *)a4;
- (id)linkerSymbolNames;
- (id)resolveWithBundle:(id)a3 error:(id *)a4;
- (id)verboseDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPackageMetadata

- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 error:(id *)a5
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EC016120);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_19CBBF280();
  MEMORY[0x1F4188790](v9);
  sub_19CBBF240();
  if (a4)
  {
    sub_19CBBF240();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v10, 1, v9);
  LNPackageMetadata.init(metadataFileURL:bundleURL:)();
  return result;
}

- (id)initFrom:(id)a3 error:(id *)a4
{
  return LNPackageMetadata.init(from:)(a3);
}

- (void).cxx_destruct
{
}

- (NSArray)includes
{
  return self->_includes;
}

- (BOOL)resolveWithImagePath:(id)a3 executablePath:(id)a4 rpaths:(id)a5 partialResults:(id)a6 error:(id *)a7
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v58 = a4;
  id v52 = a5;
  id v56 = a6;
  v54 = [(LNPackageMetadata *)self linkerSymbolNames];
  if ([v54 count])
  {
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__7337;
    v81 = __Block_byref_object_dispose__7338;
    id v82 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__7337;
    v75 = __Block_byref_object_dispose__7338;
    id v76 = 0;
    v11 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v86 = (uint64_t)v53;
      __int16 v87 = 2112;
      v88 = v54;
      _os_log_impl(&dword_19C9AD000, v11, OS_LOG_TYPE_DEBUG, "resolving %@ looking for symbols %@", buf, 0x16u);
    }

    id v12 = v53;
    v13 = a7;
    v14 = (const char *)[v12 fileSystemRepresentation];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke;
    v67[3] = &unk_1E590DE80;
    v68 = v54;
    v69 = &v77;
    v70 = &v71;
    uint64_t v15 = macho_good_enough_slice(v14, v67);
    uint64_t v16 = v15;
    if (v72[5] && v78[5])
    {
      v17 = objc_msgSend(v52, "arrayByAddingObjectsFromArray:");
      v18 = [MEMORY[0x1E4F1CA48] array];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      obuint64_t j = (id)v72[5];
      uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v84 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v64;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v64 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if ([v22 length])
            {
              v23 = [v12 stringByDeletingLastPathComponent];
              v24 = _URLFromLibraryName(v22, 0, v23, v58, v17);

              if (!v24)
              {
                v44 = getLNLogCategoryMetadata();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v86 = (uint64_t)v22;
                  __int16 v87 = 2112;
                  v88 = v17;
                  _os_log_impl(&dword_19C9AD000, v44, OS_LOG_TYPE_ERROR, "could not resolve library name %@ to path: tried %@", buf, 0x16u);
                }

                if (a7)
                {
                  [MEMORY[0x1E4F28C58] errorWithErrno:85 forFilePath:v12];
                  BOOL v41 = 0;
                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
LABEL_59:
                  BOOL v41 = 0;
                }
                goto LABEL_60;
              }
              v25 = (void *)_CFBundleCopyBundleURLForExecutableURL();
              v26 = [v25 absoluteURL];

              if (([v18 containsObject:v26] & 1) == 0) {
                [v18 addObject:v26];
              }
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v84 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = v18;
      uint64_t v27 = [obj countByEnumeratingWithState:&v59 objects:v83 count:16];
      if (v27)
      {
        uint64_t v51 = *(void *)v60;
        *(void *)&long long v28 = 138412546;
        long long v50 = v28;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v60 != v51) {
              objc_enumerationMutation(obj);
            }
            v30 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            if ((objc_msgSend(v56, "containsObject:", v30, v50) & 1) == 0)
            {
              [v56 addObject:v30];
              v31 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) _initUniqueWithURL:v30];
              id v32 = [[LNPackageMetadata alloc] initFrom:v31 error:a7];
              if (!v32)
              {
                v33 = getLNLogCategoryMetadata();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v34 = [v30 path];
                  v35 = (void *)v34;
                  v36 = a7;
                  if (a7) {
                    v36 = *a7;
                  }
                  *(_DWORD *)buf = v50;
                  uint64_t v86 = v34;
                  __int16 v87 = 2112;
                  v88 = v36;
                  _os_log_impl(&dword_19C9AD000, v33, OS_LOG_TYPE_ERROR, "could not get package metadata from bundle %@, %@", buf, 0x16u);
                }
              }
              v37 = [v31 executablePathWithError:a7];
              if (!v37)
              {
                v45 = getLNLogCategoryMetadata();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v46 = [v30 path];
                  v47 = (void *)v46;
                  v48 = a7;
                  if (a7) {
                    v48 = *a7;
                  }
                  *(_DWORD *)buf = v50;
                  uint64_t v86 = v46;
                  __int16 v87 = 2112;
                  v88 = v48;
                  _os_log_impl(&dword_19C9AD000, v45, OS_LOG_TYPE_ERROR, "bundle %@ has no executable, %@", buf, 0x16u);
                }
                v37 = 0;
LABEL_58:

                goto LABEL_59;
              }
              if (!v32) {
                goto LABEL_58;
              }
              int v38 = [v32 resolveWithImagePath:v37 executablePath:v58 rpaths:v17 partialResults:v56 error:a7];

              if (!v38) {
                goto LABEL_59;
              }
            }
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v59 objects:v83 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      obuint64_t j = getLNLogCategoryMetadata();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        v39 = [v56 allObjects];
        v40 = objc_msgSend(v39, "if_map:", &__block_literal_global_38_7346);
        *(_DWORD *)buf = 138412546;
        uint64_t v86 = (uint64_t)v12;
        __int16 v87 = 2112;
        v88 = v40;
        _os_log_impl(&dword_19C9AD000, obj, OS_LOG_TYPE_DEBUG, "success: %@ includes %@", buf, 0x16u);
      }
      BOOL v41 = 1;
LABEL_60:
    }
    else
    {
      if (a7)
      {
        v42 = (void *)MEMORY[0x1E4F28C58];
        if (!v15) {
          uint64_t v16 = *__error();
        }
        [v42 errorWithErrno:v16 forFilePath:v12];
        v13 = a7;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if (v13) {
          v43 = *v13;
        }
        else {
          v43 = 0;
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v86 = (uint64_t)v12;
        __int16 v87 = 2112;
        v88 = v43;
        _os_log_impl(&dword_19C9AD000, v17, OS_LOG_TYPE_DEBUG, "could not resolve package includes in %@ - %@", buf, 0x16u);
      }
      BOOL v41 = 0;
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v77, 8);
  }
  else
  {
    BOOL v41 = 1;
  }

  return v41;
}

void __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v6 = mh_validate(a2, a4);
  *__error() = v6;
  if (v6) {
    return;
  }
  uint64_t v27 = a1;
  id v7 = *(id *)(a1 + 32);
  v8 = (uint64_t *)malloc_type_malloc(8 * [v7 count], 0x10040436913F5uLL);
  if (v8)
  {
    unint64_t v9 = [v7 count];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        id v11 = [v7 objectAtIndex:i];
        v8[i] = [v11 UTF8String];
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  id v12 = malloc_type_malloc(8 * v9, 0x10040436913F5uLL);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = (uint64_t)__mh_symlibnames_block_invoke;
  v28[3] = (uint64_t)&unk_1E590DEF0;
  v28[6] = (uint64_t)v12;
  v28[7] = (uint64_t)v8;
  v28[4] = (uint64_t)&v29;
  v28[5] = v9;
  int v13 = macho_for_each_imported_symbol();
  if (v13) {
    goto LABEL_17;
  }
  if (v30[3] < v9)
  {
    v14 = v12;
    uint64_t v15 = v8;
    unint64_t v16 = v9;
    do
    {
      if (!*v14)
      {
        v17 = getLNLogCategoryMetadata();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *v15;
          *(_DWORD *)buf = 136315138;
          uint64_t v34 = v18;
        }
      }
      ++v15;
      ++v14;
      --v16;
    }
    while (v16);
    int v13 = 22;
LABEL_17:
    free(v12);
    id v12 = 0;
    *__error() = v13;
  }
  _Block_object_dispose(&v29, 8);
  v28[0] = 0;
  uint64_t v19 = mh_cmdstrs((uint64_t)a2, v28, (unsigned int (*)(void))is_rpath);
  uint64_t v20 = v19;
  if (v12 && v19)
  {
    uint64_t v21 = strlist_to_array(v19, v28[0]);
    uint64_t v22 = *(void *)(*(void *)(v27 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v24 = strlist_to_array(v12, v9);
    uint64_t v25 = *(void *)(*(void *)(v27 + 48) + 8);
    v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

LABEL_22:
    free(v12);
    goto LABEL_23;
  }
  if (v12) {
    goto LABEL_22;
  }
LABEL_23:
  if (v20) {
    free(v20);
  }
  if (v8) {
    free(v8);
  }
}

uint64_t __85__LNPackageMetadata_resolveWithImagePath_executablePath_rpaths_partialResults_error___block_invoke_35(uint64_t a1, void *a2)
{
  return [a2 path];
}

- (id)linkerSymbolNames
{
  v2 = [(LNPackageMetadata *)self includes];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_7356);

  return v3;
}

uint64_t __38__LNPackageMetadata_linkerSymbolNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"_$s%@", a2];
}

- (id)resolveWithBundle:(id)a3 error:(id *)a4
{
  int v6 = [a3 executablePathWithError:a4];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  if (!v6)
  {
    unint64_t v16 = 0;
    goto LABEL_14;
  }
  v8 = [v6 stringByDeletingLastPathComponent];
  id v24 = 0;
  uint64_t v9 = MEMORY[0x1E4F1CBF0];
  BOOL v10 = [(LNPackageMetadata *)self resolveWithImagePath:v6 executablePath:v8 rpaths:MEMORY[0x1E4F1CBF0] partialResults:v7 error:&v24];
  id v11 = v24;

  id v12 = [v6 stringByAppendingString:@".debug.dylib"];
  int v13 = [v6 stringByDeletingLastPathComponent];
  id v23 = 0;
  LOBYTE(v9) = [(LNPackageMetadata *)self resolveWithImagePath:v12 executablePath:v13 rpaths:v9 partialResults:v7 error:&v23];
  id v14 = v23;

  if (v9)
  {
    id v15 = v14;
LABEL_6:
    unint64_t v16 = [v7 allObjects];
    goto LABEL_12;
  }
  v17 = [v6 stringByAppendingString:@".preview.dylib"];
  uint64_t v18 = [v6 stringByDeletingLastPathComponent];
  id v22 = v14;
  BOOL v19 = [(LNPackageMetadata *)self resolveWithImagePath:v17 executablePath:v18 rpaths:MEMORY[0x1E4F1CBF0] partialResults:v7 error:&v22];
  id v15 = v22;

  if (v10 || v19) {
    goto LABEL_6;
  }
  if (v11)
  {
    id v20 = v11;
  }
  else
  {
    if (!v15)
    {
      unint64_t v16 = 0;
      goto LABEL_13;
    }
    id v20 = v15;
    id v15 = v20;
  }
  unint64_t v16 = 0;
  *a4 = v20;
LABEL_12:

LABEL_13:
LABEL_14:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNPackageMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    int v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [(LNPackageMetadata *)self includes];
        v8 = [(LNPackageMetadata *)v6 includes];

        if (v7 == v8)
        {
          char v18 = 1;
          goto LABEL_12;
        }
        uint64_t v9 = [(LNPackageMetadata *)self includes];
        if (!v9
          || (BOOL v10 = (void *)v9,
              [(LNPackageMetadata *)v6 includes],
              id v11 = objc_claimAutoreleasedReturnValue(),
              v11,
              v10,
              !v11))
        {
          char v18 = 0;
          goto LABEL_12;
        }
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        int v13 = [(LNPackageMetadata *)self includes];
        id v14 = [v12 setWithArray:v13];
        id v15 = (void *)MEMORY[0x1E4F1CAD0];
        unint64_t v16 = [(LNPackageMetadata *)v6 includes];
        v17 = [v15 setWithArray:v16];
        char v18 = [v14 isEqualToSet:v17];
      }
      else
      {
        char v18 = 0;
        int v13 = v6;
        int v6 = 0;
      }
    }
    else
    {
      int v13 = 0;
      char v18 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  char v18 = 1;
LABEL_13:

  return v18;
}

- (unint64_t)hash
{
  v2 = [(LNPackageMetadata *)self includes];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)verboseDescription
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [(LNPackageMetadata *)self includes];
  id v7 = [v3 stringWithFormat:@"<%@: %p, includes: %@>", v5, self, v6];

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = [(LNPackageMetadata *)self includes];
  id v7 = [v3 stringWithFormat:@"<%@: %p, includes: %lu>", v5, self, objc_msgSend(v6, "count")];

  return v7;
}

- (LNPackageMetadata)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"includes"];

  if (v8)
  {
    self = [(LNPackageMetadata *)self initWithIncludes:v8];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNPackageMetadata *)self includes];
  [v4 encodeObject:v5 forKey:@"includes"];
}

- (LNPackageMetadata)initWithIncludes:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPackageMetadata;
  id v5 = [(LNPackageMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    includes = v5->_includes;
    v5->_includes = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end