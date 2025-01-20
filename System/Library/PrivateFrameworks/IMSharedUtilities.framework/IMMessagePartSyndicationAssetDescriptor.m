@interface IMMessagePartSyndicationAssetDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorFromSerializedString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IMMessagePartSyndicationAssetDescriptor)initWithAssetSyndications:(id)a3;
- (IMMessagePartSyndicationAssetDescriptor)initWithCoder:(id)a3;
- (NSDictionary)assetSyndications;
- (NSString)serializedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeSyndicationAssetsInfoFor:(int64_t)a3;
- (void)replaceSyndicationAssetsInfoWith:(id)a3 asset:(int64_t)a4;
- (void)setAssetSyndications:(id)a3;
- (void)updateSyndicationAssetWithInfo:(id)a3 asset:(int64_t)a4;
@end

@implementation IMMessagePartSyndicationAssetDescriptor

- (IMMessagePartSyndicationAssetDescriptor)initWithAssetSyndications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMessagePartSyndicationAssetDescriptor;
  v6 = [(IMMessagePartSyndicationAssetDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetSyndications, a3);
  }

  return v7;
}

- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4
{
  v7 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];

  if (v7)
  {
    v8 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
    objc_super v9 = [NSNumber numberWithInteger:a4];
    v10 = [v8 objectForKey:v9];

    if (v10)
    {
      v11 = [NSNumber numberWithUnsignedInteger:a3];
      v12 = [v10 objectForKey:v11];

      if (v12)
      {
        v12 = v12;
        v13 = v12;
      }
      else
      {
        v16 = [NSNumber numberWithInteger:a4];
        int v17 = [v16 intValue];

        v18 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1A09F036C(a3, v17, v18);
        }

        v13 = 0;
      }
    }
    else
    {
      v14 = [NSNumber numberWithInteger:a4];
      int v15 = [v14 intValue];

      v12 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1A09F02E0(v15, v12);
      }
      v13 = 0;
    }
  }
  else
  {
    v8 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09F025C(v8);
    }
    v13 = 0;
  }

  return v13;
}

- (void)updateSyndicationAssetWithInfo:(id)a3 asset:(int64_t)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 count])
  {
    v8 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];

    if (v8)
    {
      objc_super v9 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
      v10 = (void *)[v9 mutableCopy];

      v11 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
      v12 = [NSNumber numberWithInteger:a4];
      v13 = [v11 objectForKey:v12];
      v14 = (NSString *)[v13 mutableCopy];

      int v15 = (void *)[v7 copy];
      if (v14 && v15)
      {
        id v28 = v15;
        v29 = v10;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v22 = objc_msgSend(v16, "objectForKey:", v21, v28);
              v23 = (void *)v22;
              if (v21) {
                BOOL v24 = v22 == 0;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24) {
                [(NSString *)v14 setObject:v22 forKeyedSubscript:v21];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v18);
        }

        v25 = [NSNumber numberWithInteger:a4];
        v10 = v29;
        [v29 setObject:v14 forKeyedSubscript:v25];

        [(IMMessagePartSyndicationAssetDescriptor *)self setAssetSyndications:v29];
        serializedString = self->_serializedString;
        self->_serializedString = 0;

        int v15 = v28;
      }
    }
    else
    {
      v27 = [NSNumber numberWithInteger:a4];
      v35 = v27;
      v36[0] = v7;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

      [(IMMessagePartSyndicationAssetDescriptor *)self setAssetSyndications:v10];
      v14 = self->_serializedString;
      self->_serializedString = 0;
    }
  }
}

- (void)replaceSyndicationAssetsInfoWith:(id)a3 asset:(int64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 count])
  {
    v8 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];

    if (v8)
    {
      objc_super v9 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
      v10 = (void *)[v9 mutableCopy];

      v11 = [NSNumber numberWithInteger:a4];
      [v10 setObject:v7 forKeyedSubscript:v11];

      [(IMMessagePartSyndicationAssetDescriptor *)self setAssetSyndications:v10];
      serializedString = self->_serializedString;
      self->_serializedString = 0;
    }
    else
    {
      v13 = [NSNumber numberWithInteger:a4];
      id v16 = v13;
      v17[0] = v7;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

      [(IMMessagePartSyndicationAssetDescriptor *)self setAssetSyndications:v14];
      int v15 = self->_serializedString;
      self->_serializedString = 0;
    }
  }
}

- (void)removeSyndicationAssetsInfoFor:(int64_t)a3
{
  id v5 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];

  if (v5)
  {
    id v6 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
    id v9 = (id)[v6 mutableCopy];

    v7 = [NSNumber numberWithInteger:a3];
    [v9 removeObjectForKey:v7];

    [(IMMessagePartSyndicationAssetDescriptor *)self setAssetSyndications:v9];
    serializedString = self->_serializedString;
    self->_serializedString = 0;
  }
}

- (NSString)serializedString
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  serializedString = self->_serializedString;
  if (!serializedString)
  {
    v4 = (void *)[(NSDictionary *)self->_assetSyndications copy];
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (v4 && [v4 count])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v34;
        uint64_t v24 = *(void *)v34;
        id v25 = v6;
        do
        {
          uint64_t v10 = 0;
          uint64_t v26 = v8;
          do
          {
            if (*(void *)v34 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v28 = v10;
            v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
            if (v11)
            {
              objc_msgSend(v5, "appendFormat:", @"%i", objc_msgSend(v11, "intValue"));
              [v5 appendString:@"="];
              v12 = [v6 objectForKey:v11];
              v13 = v12;
              if (v12)
              {
                v27 = v12;
                uint64_t v14 = [v12 count];
                v13 = v27;
                if (v14)
                {
                  [v5 appendString:@"["];
                  long long v31 = 0u;
                  long long v32 = 0u;
                  long long v29 = 0u;
                  long long v30 = 0u;
                  id v15 = v27;
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
                  if (v16)
                  {
                    uint64_t v17 = v16;
                    uint64_t v18 = *(void *)v30;
                    do
                    {
                      for (uint64_t i = 0; i != v17; ++i)
                      {
                        if (*(void *)v30 != v18) {
                          objc_enumerationMutation(v15);
                        }
                        v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                        if (v20)
                        {
                          uint64_t v21 = [v15 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
                          if (v21)
                          {
                            [v5 appendFormat:@"%i%@%i", objc_msgSend(v20, "intValue"), @":", objc_msgSend(v21, "intValue")];
                            [v5 appendString:@"-"];
                          }
                        }
                      }
                      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
                    }
                    while (v17);
                  }

                  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
                  [v5 appendString:@"]"];
                  [v5 appendString:@";"];
                  id v6 = v25;
                  uint64_t v8 = v26;
                  uint64_t v9 = v24;
                  v13 = v27;
                }
              }
            }
            uint64_t v10 = v28 + 1;
          }
          while (v28 + 1 != v8);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v8);
      }

      objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
    }
    uint64_t v22 = self->_serializedString;
    self->_serializedString = (NSString *)v5;

    serializedString = self->_serializedString;
  }

  return serializedString;
}

+ (id)descriptorFromSerializedString:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@";"];
  v37 = v3;
  v38 = v4;
  if (!v4 || !objc_msgSend(v4, "count", v3))
  {
    v50 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0408();
    }
    goto LABEL_43;
  }
  v50 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v5 = v38;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (!v6) {
    goto LABEL_36;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v57;
  uint64_t v39 = *(void *)v57;
  id v40 = v5;
  do
  {
    uint64_t v9 = 0;
    uint64_t v41 = v7;
    do
    {
      if (*(void *)v57 != v8)
      {
        uint64_t v10 = v9;
        objc_enumerationMutation(v5);
        uint64_t v9 = v10;
      }
      uint64_t v45 = v9;
      v11 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
      v12 = [v11 componentsSeparatedByString:@"="];
      v51 = v12;
      if ([v12 count] == 2)
      {
        os_log_t log = [v12 objectAtIndex:0];
        v47 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject integerValue](log, "integerValue"));
        v13 = [v12 objectAtIndex:1];
        uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"[" withString:&stru_1EF2CAD28];
        id v15 = [v14 stringByReplacingOccurrencesOfString:@"]" withString:&stru_1EF2CAD28];

        v44 = v15;
        uint64_t v16 = [v15 componentsSeparatedByString:@"-"];
        v43 = v16;
        if (v16 && (uint64_t v17 = v16, [v16 count]))
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          obj = v17;
          uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v18)
          {
            v42 = v13;
            uint64_t v19 = *(void *)v53;
            uint64_t v20 = v18;
            uint64_t v21 = v47;
            do
            {
              uint64_t v22 = 0;
              uint64_t v48 = v20;
              do
              {
                if (*(void *)v53 != v19) {
                  objc_enumerationMutation(obj);
                }
                v23 = *(void **)(*((void *)&v52 + 1) + 8 * v22);
                uint64_t v24 = [v23 componentsSeparatedByString:@":"];
                if ([v24 count] == 2)
                {
                  id v25 = [v24 objectAtIndex:0];
                  uint64_t v26 = [v24 objectAtIndex:1];
                  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject intValue](v25, "intValue"));
                  uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v26, "intValue"));
                  long long v29 = [v50 objectForKey:v21];
                  long long v30 = v21;
                  long long v31 = v29;
                  if (v29)
                  {
                    [v29 setObject:v28 forKeyedSubscript:v27];
                    [v50 setObject:v31 forKeyedSubscript:v30];
                  }
                  else
                  {
                    long long v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](obj, "count"));
                    [v33 setObject:v28 forKeyedSubscript:v27];
                    [v50 setObject:v33 forKeyedSubscript:v30];
                  }
                  long long v32 = v51;
                  uint64_t v21 = v47;
                  uint64_t v20 = v48;
                }
                else
                {
                  id v25 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
                    __int16 v63 = 2112;
                    v64 = v23;
                    _os_log_error_impl(&dword_1A0772000, v25, OS_LOG_TYPE_ERROR, "%s invalid number of tokens present in keyValuePair string %@", buf, 0x16u);
                  }
                  long long v32 = v51;
                }

                ++v22;
              }
              while (v20 != v22);
              uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
            }
            while (v20);
            uint64_t v8 = v39;
            id v5 = v40;
            uint64_t v7 = v41;
            v13 = v42;
            goto LABEL_33;
          }
        }
        else
        {
          obj = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
            __int16 v63 = 2112;
            v64 = v15;
            _os_log_error_impl(&dword_1A0772000, obj, OS_LOG_TYPE_ERROR, "%s no asset info key value pairs present in string %@, skipping", buf, 0x16u);
          }
        }
        long long v32 = v51;
LABEL_33:

        goto LABEL_34;
      }
      IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "+[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:]";
        __int16 v63 = 2112;
        v64 = v11;
        _os_log_error_impl(&dword_1A0772000, log, OS_LOG_TYPE_ERROR, "%s invalid token for asset to asset info dictionary, could not parse %@", buf, 0x16u);
      }
      long long v32 = v12;
LABEL_34:

      uint64_t v9 = v45 + 1;
    }
    while (v45 + 1 != v7);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v65 count:16];
  }
  while (v7);
LABEL_36:

  if ([v50 count])
  {
    long long v34 = [[IMMessagePartSyndicationAssetDescriptor alloc] initWithAssetSyndications:v50];
    goto LABEL_44;
  }
  long long v35 = IMLogHandleForCategory("IMMessagePartSyndicationAssetDescriptor");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    sub_1A09F0488();
  }

LABEL_43:
  long long v34 = 0;
LABEL_44:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
  uint64_t v6 = (void *)[v4 initWithAssetSyndications:v5];

  return v6;
}

- (IMMessagePartSyndicationAssetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMMessagePartSyndicationAssetDescriptor;
  id v5 = [(IMMessagePartSyndicationAssetDescriptor *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"assetSyndications"];
    assetSyndications = v5->_assetSyndications;
    v5->_assetSyndications = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
  [v4 encodeObject:v5 forKey:@"assetSyndications"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(IMMessagePartSyndicationAssetDescriptor *)self serializedString];
  id v4 = [v2 stringWithFormat:@"serializedString: %@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    uint64_t v7 = [(IMMessagePartSyndicationAssetDescriptor *)self assetSyndications];
    uint64_t v8 = [v4 assetSyndications];
    char v6 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSDictionary)assetSyndications
{
  return self->_assetSyndications;
}

- (void)setAssetSyndications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSyndications, 0);

  objc_storeStrong((id *)&self->_serializedString, 0);
}

@end