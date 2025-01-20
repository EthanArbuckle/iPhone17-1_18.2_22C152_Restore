@interface STSiriContext
+ (BOOL)supportsSecureCoding;
- (STSiriContext)initWithCoder:(id)a3;
- (STSiriContext)initWithModelObjects:(id)a3;
- (id)_aceValue;
- (id)modelObjects;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSiriContext

- (void).cxx_destruct
{
}

- (STSiriContext)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ModelObjects"];

  v9 = [(STSiriContext *)self initWithModelObjects:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_aceValue
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [(STSiriContext *)self modelObjects];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v8 = [(STSiriContext *)self modelObjects];
  uint64_t v38 = [v8 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v38)
  {
    v10 = 0;
    uint64_t v37 = *(void *)v48;
    *(void *)&long long v9 = 136315394;
    long long v34 = v9;
    v35 = v8;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "_aceCollectionClass", v34);
        if ((objc_class *)v13 != v10)
        {
          v14 = (objc_class *)v13;
          if (v10 && [(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
          {
            id v15 = objc_alloc_init(v10);
            [v15 setDomainObjects:v7];
            v16 = [v15 dictionary];
            [v6 addObject:v16];
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v15 = v7;
            uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v56 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              id v36 = v7;
              unint64_t v19 = v3;
              uint64_t v20 = *(void *)v44;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v44 != v20) {
                    objc_enumerationMutation(v15);
                  }
                  v22 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionary];
                  [v6 addObject:v22];
                }
                uint64_t v18 = [v15 countByEnumeratingWithState:&v43 objects:v56 count:16];
              }
              while (v18);
              unint64_t v3 = v19;
              v8 = v35;
              id v7 = v36;
            }
          }

          id v23 = objc_alloc_init(*(Class *)(v3 + 2632));
          id v7 = v23;
          v10 = v14;
        }
        v24 = [v12 _aceContextObjectValue];
        if (v24)
        {
          [v7 addObject:v24];
        }
        else
        {
          v25 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v34;
            v53 = "-[STSiriContext _aceValue]";
            __int16 v54 = 2112;
            v55 = v12;
            _os_log_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_INFO, "%s Unable to create context object for Siri model object %@; dropping on floor",
              buf,
              0x16u);
          }
        }
      }
      uint64_t v38 = [v8 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v38);

    if (v10 && [(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
    {
      id v26 = objc_alloc_init(v10);
      [v26 setDomainObjects:v7];
      v27 = [v26 dictionary];
      [v6 addObject:v27];

      goto LABEL_37;
    }
  }
  else
  {
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v26 = v7;
  uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = [*(id *)(*((void *)&v39 + 1) + 8 * k) dictionary];
        [v6 addObject:v32];
      }
      uint64_t v29 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v29);
  }
  id v7 = v26;
LABEL_37:

  return v6;
}

- (id)modelObjects
{
  return self->_modelObjects;
}

- (STSiriContext)initWithModelObjects:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSiriContext;
  id v5 = [(STSiriContext *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      modelObjects = v6->_modelObjects;
      v6->_modelObjects = (NSArray *)v7;
    }
    else
    {
      modelObjects = v5->_modelObjects;
      v5->_modelObjects = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end