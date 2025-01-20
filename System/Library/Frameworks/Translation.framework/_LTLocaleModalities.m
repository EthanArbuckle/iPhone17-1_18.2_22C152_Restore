@interface _LTLocaleModalities
+ (BOOL)supportsSecureCoding;
- (BOOL)locale:(id)a3 supportsModality:(unint64_t)a4;
- (NSDictionary)modalitiesPerLocale;
- (_LTLocaleModalities)initWithCoder:(id)a3;
- (_LTLocaleModalities)initWithModalitiesPerLocale:(id)a3;
- (_LTLocaleModalities)initWithSupportedLocales:(id)a3 asrLocales:(id)a4 ttsLocales:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)modalitiesForLocale:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTLocaleModalities

- (_LTLocaleModalities)initWithSupportedLocales:(id)a3 asrLocales:(id)a4 ttsLocales:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v57.receiver = self;
  v57.super_class = (Class)_LTLocaleModalities;
  v11 = [(_LTLocaleModalities *)&v57 init];
  v12 = v11;
  if (v11)
  {
    v44 = v10;
    v41 = v11;
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v14);
          }
          [v13 setObject:&unk_26FABA918 forKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v16);
    }
    id v43 = v8;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v42 = v9;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * j);
          v25 = [v13 objectForKeyedSubscript:v24];
          if (!v25)
          {
            v26 = _LTOSLogAssets();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v60 = v24;
              _os_log_fault_impl(&dword_24639B000, v26, OS_LOG_TYPE_FAULT, "ASR locale is not present in supported locale list, %{public}@", buf, 0xCu);
            }
          }
          v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "integerValue") | 1);
          [v13 setObject:v27 forKeyedSubscript:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v21);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v28 = v44;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v45 + 1) + 8 * k);
          v34 = [v13 objectForKeyedSubscript:v33];
          if (!v34)
          {
            v35 = _LTOSLogAssets();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v60 = v33;
              _os_log_fault_impl(&dword_24639B000, v35, OS_LOG_TYPE_FAULT, "TTS locale is not present in supported locale list, %{public}@", buf, 0xCu);
            }
          }
          v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "integerValue") | 2);
          [v13 setObject:v36 forKeyedSubscript:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v30);
    }

    uint64_t v37 = [v13 copy];
    v12 = v41;
    modalitiesPerLocale = v41->_modalitiesPerLocale;
    v41->_modalitiesPerLocale = (NSDictionary *)v37;

    v39 = v41;
    id v9 = v42;
    id v8 = v43;
    id v10 = v44;
  }

  return v12;
}

- (_LTLocaleModalities)initWithModalitiesPerLocale:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTLocaleModalities;
  v5 = [(_LTLocaleModalities *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modalitiesPerLocale = v5->_modalitiesPerLocale;
    v5->_modalitiesPerLocale = (NSDictionary *)v6;

    id v8 = v5;
  }

  return v5;
}

- (unint64_t)modalitiesForLocale:(id)a3
{
  v3 = [(NSDictionary *)self->_modalitiesPerLocale objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)locale:(id)a3 supportsModality:(unint64_t)a4
{
  return (a4 & ~[(_LTLocaleModalities *)self modalitiesForLocale:a3]) == 0;
}

- (_LTLocaleModalities)initWithCoder:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTLocaleModalities;
  v5 = [(_LTLocaleModalities *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"modalitiesPerLocale"];
    modalitiesPerLocale = v5->_modalitiesPerLocale;
    v5->_modalitiesPerLocale = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_LTLocaleModalities alloc];
  modalitiesPerLocale = self->_modalitiesPerLocale;

  return [(_LTLocaleModalities *)v4 initWithModalitiesPerLocale:modalitiesPerLocale];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendString:@"{\n"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_modalitiesPerLocale;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 _ltLocaleIdentifier];
        v11 = [(NSDictionary *)self->_modalitiesPerLocale objectForKeyedSubscript:v9];
        [v3 appendFormat:@"\t%@: %@,\n", v10, v11, (void)v13];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"}"];

  return v3;
}

- (NSDictionary)modalitiesPerLocale
{
  return self->_modalitiesPerLocale;
}

- (void).cxx_destruct
{
}

@end