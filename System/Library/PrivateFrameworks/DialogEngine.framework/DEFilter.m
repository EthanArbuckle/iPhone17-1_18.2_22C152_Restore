@interface DEFilter
+ (id)catUpdates;
+ (id)catUpdates:(id)a3;
+ (id)deprecatedCatSummary;
+ (id)filterFromPb:(const void *)a3;
+ (id)filterThroughPb:(id)a3;
+ (void)filterToPb:(id)a3 filterPb:(void *)a4;
- (BOOL)allows:(id)a3;
- (BOOL)apply:(id)a3 to:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DEFilter)init;
- (DEFilter)initWithInclude:(id)a3 exclude:(id)a4;
- (DEMatchCriteria)exclude;
- (DEMatchCriteria)include;
- (void)setExclude:(id)a3;
- (void)setInclude:(id)a3;
@end

@implementation DEFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclude, 0);
  objc_storeStrong((id *)&self->_include, 0);
}

- (void)setExclude:(id)a3
{
}

- (DEMatchCriteria)exclude
{
  return self->_exclude;
}

- (void)setInclude:(id)a3
{
}

- (DEMatchCriteria)include
{
  return self->_include;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DEFilter *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      include = self->_include;
      v7 = [(DEFilter *)v5 include];
      LOBYTE(include) = (include != 0) ^ (v7 == 0);

      if ((include & 1) == 0) {
        goto LABEL_11;
      }
      exclude = self->_exclude;
      v9 = [(DEFilter *)v5 exclude];
      BOOL v10 = v9 == 0;

      if ((exclude != 0) == v10
        || (v11 = self->_include) != 0
        && ([(DEFilter *)v5 include],
            v12 = objc_claimAutoreleasedReturnValue(),
            BOOL v13 = [(DEMatchCriteria *)v11 isEqual:v12],
            v12,
            !v13))
      {
LABEL_11:
        char v16 = 0;
      }
      else
      {
        v14 = self->_exclude;
        if (v14)
        {
          v15 = [(DEFilter *)v5 exclude];
          char v16 = [(DEMatchCriteria *)v14 isEqual:v15];
        }
        else
        {
          char v16 = 1;
        }
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (BOOL)apply:(id)a3 to:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  v27 = (unsigned int (**)(id, void *, void *))a3;
  id v29 = a4;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v5)
  {
    id v26 = v5;
    char v44 = 0;
    v6 = [v29 path];
    char v7 = [v26 fileExistsAtPath:v6 isDirectory:&v44];
    if (v44) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }

    if (v8)
    {
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      uint64_t v31 = *MEMORY[0x1E4F1C670];
      v46[0] = *MEMORY[0x1E4F1C670];
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __21__DEFilter_apply_to___block_invoke;
      v39[3] = &unk_1E651E468;
      v39[4] = &v40;
      v25 = [v26 enumeratorAtURL:v29 includingPropertiesForKeys:v9 options:0 errorHandler:v39];

      if (v25)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = v25;
        BOOL v10 = 0;
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v11)
        {
          uint64_t v32 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v36 != v32) {
                objc_enumerationMutation(obj);
              }
              BOOL v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (v13)
              {
                id v33 = 0;
                id v34 = 0;
                int v14 = [v13 getResourceValue:&v34 forKey:v31 error:&v33];
                id v15 = v34;
                id v16 = v33;

                if (v15) {
                  int v17 = v14;
                }
                else {
                  int v17 = 0;
                }
                if (v17 == 1 && ([v15 BOOLValue] & 1) != 0)
                {
                  v18 = [v13 URLByStandardizingPath];
                  v19 = [v18 absoluteString];
                  v20 = [v29 URLByStandardizingPath];
                  v21 = [v20 absoluteString];
                  v22 = objc_msgSend(v19, "substringFromIndex:", objc_msgSend(v21, "length"));

                  if ([(DEFilter *)self allows:v22] && !v27[2](v27, v22, v13))
                  {

                    goto LABEL_31;
                  }
                }
                else if (v16)
                {
                  +[DELog error:@"Failed to determine if file at URL \"%@\" is regular: %@", v13, v16];
                }

                BOOL v10 = v16;
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        BOOL v23 = *((unsigned char *)v41 + 24) == 0;
        id v16 = v10;
      }
      else
      {
        id v16 = 0;
LABEL_31:
        BOOL v23 = 0;
      }

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      +[DELog error:@"Failed find source directory at \"%@\"", v29];
      id v16 = 0;
      BOOL v23 = 0;
    }
    v5 = v26;
  }
  else
  {
    id v16 = 0;
    BOOL v23 = 0;
  }

  return v23;
}

uint64_t __21__DEFilter_apply_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (v5 && v6)
  {
    +[DELog error:@"Failed to enumerate file at URL \"%@\": %@", v5, v6];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }

  return 0;
}

- (BOOL)allows:(id)a3
{
  id v4 = a3;
  include = self->_include;
  BOOL v7 = 0;
  if (!include || [(DEMatchCriteria *)include all:v4])
  {
    exclude = self->_exclude;
    if (!exclude || ![(DEMatchCriteria *)exclude any:v4]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (DEFilter)init
{
  return [(DEFilter *)self initWithInclude:0 exclude:0];
}

- (DEFilter)initWithInclude:(id)a3 exclude:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DEFilter;
  v9 = [(DEFilter *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_include, a3);
    objc_storeStrong((id *)&v10->_exclude, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (id)deprecatedCatSummary
{
  v2 = (void *)[(id)objc_opt_new() initWithPrefixes:&unk_1F212EDB0 suffixes:&unk_1F212EDC8];
  v3 = [[DEFilter alloc] initWithInclude:v2 exclude:0];

  return v3;
}

+ (id)catUpdates
{
  return +[DEFilter catUpdates:0];
}

+ (id)catUpdates:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v16 = v3;
  v20 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F212ED80];
  if (v3 && [v3 count])
  {
    id v4 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v16;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = v5;
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v8 = v20;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v22 != v10) {
                  objc_enumerationMutation(v8);
                }
                v12 = [NSString stringWithFormat:@"%@%@", v7, *(void *)(*((void *)&v21 + 1) + 8 * j)];
                [v4 addObject:v12];
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v9);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v5);
    }

    v20 = v4;
  }
  [v20 addObjectsFromArray:&unk_1F212ED68];
  objc_super v13 = (void *)[(id)objc_opt_new() initWithPrefixes:&unk_1F212ED98 suffixes:v20];
  int v14 = [[DEFilter alloc] initWithInclude:v13 exclude:0];

  return v14;
}

+ (id)filterThroughPb:(id)a3
{
  id v3 = a3;
  siri::dialogengine::CatUpdater::Filter::Filter((siri::dialogengine::CatUpdater::Filter *)v6);
  +[DEFilter filterToPb:v3 filterPb:v6];
  id v4 = +[DEFilter filterFromPb:v6];
  siri::dialogengine::CatUpdater::Filter::~Filter((siri::dialogengine::CatUpdater::Filter *)v6);

  return v4;
}

+ (void)filterToPb:(id)a3 filterPb:(void *)a4
{
  id v11 = a3;
  uint64_t v5 = [v11 include];

  if (v5)
  {
    *((_DWORD *)a4 + 4) |= 1u;
    matched = (siri::dialogengine::CatUpdater::MatchCriteria *)*((void *)a4 + 3);
    if (!matched)
    {
      matched = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::MatchCriteria>(0);
      *((void *)a4 + 3) = matched;
    }
    uint64_t v7 = [v11 include];
    +[DEMatchCriteria matchCriteriaToPb:v7 matchCriteriaPb:matched];
  }
  id v8 = [v11 exclude];

  if (v8)
  {
    *((_DWORD *)a4 + 4) |= 2u;
    uint64_t v9 = (siri::dialogengine::CatUpdater::MatchCriteria *)*((void *)a4 + 4);
    if (!v9)
    {
      uint64_t v9 = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::MatchCriteria>(0);
      *((void *)a4 + 4) = v9;
    }
    uint64_t v10 = [v11 exclude];
    +[DEMatchCriteria matchCriteriaToPb:v10 matchCriteriaPb:v9];
  }
}

+ (id)filterFromPb:(const void *)a3
{
  if (*((void *)a3 + 3)) {
    id v4 = (void *)*((void *)a3 + 3);
  }
  else {
    id v4 = &siri::dialogengine::CatUpdater::_MatchCriteria_default_instance_;
  }
  uint64_t v5 = +[DEMatchCriteria matchCriteriaFromPb:v4];
  if (*((void *)a3 + 4)) {
    id v6 = (void *)*((void *)a3 + 4);
  }
  else {
    id v6 = &siri::dialogengine::CatUpdater::_MatchCriteria_default_instance_;
  }
  uint64_t v7 = +[DEMatchCriteria matchCriteriaFromPb:v6];
  id v8 = [[DEFilter alloc] initWithInclude:v5 exclude:v7];

  return v8;
}

@end