@interface ASDDSPGraphInfo
- (ASDDSPGraphInfo)initWithDictionary:(id)a3 resourcePath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)includePaths;
- (NSDictionary)substitutions;
- (NSString)path;
- (NSString)text;
- (unint64_t)hash;
- (void)setIncludePaths:(id)a3;
- (void)setPath:(id)a3;
- (void)setSubstitutions:(id)a3;
- (void)setText:(id)a3;
@end

@implementation ASDDSPGraphInfo

- (ASDDSPGraphInfo)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)ASDDSPGraphInfo;
  v8 = [(ASDDSPGraphInfo *)&v54 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"Path"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v7 stringByAppendingPathComponent:v9];
      path = v8->_path;
      v8->_path = (NSString *)v10;
    }
    v12 = [v6 objectForKeyedSubscript:@"Text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v8->_text, v12);
    }
    v13 = [v6 objectForKeyedSubscript:@"IncludePaths"];
    objc_opt_class();
    id obj = v13;
    v45 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v51;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v51 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              v13 = obj;
              v12 = v45;
              if (v19) {
                -[ASDDSPGraphInfo initWithDictionary:resourcePath:](v19, v20, v21, v22, v23, v24, v25, v26);
              }
              goto LABEL_18;
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v56 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      v13 = obj;
      objc_storeStrong((id *)&v8->_includePaths, obj);
      v12 = v45;
    }
LABEL_18:
    v27 = [v6 objectForKeyedSubscript:@"Substitutions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = v9;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v47;
        while (2)
        {
          id v32 = v7;
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v47 != v31) {
              objc_enumerationMutation(v28);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              id v7 = v32;
              v9 = v43;
              v13 = obj;
              v12 = v45;
              if (v34) {
                -[ASDDSPGraphInfo initWithDictionary:resourcePath:](v34, v35, v36, v37, v38, v39, v40, v41);
              }
              goto LABEL_30;
            }
            ++v33;
          }
          while (v30 != v33);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v55 count:16];
          id v7 = v32;
          if (v30) {
            continue;
          }
          break;
        }
      }

      objc_storeStrong((id *)&v8->_substitutions, v27);
      v9 = v43;
      v13 = obj;
      v12 = v45;
    }
LABEL_30:
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v8 = (ASDDSPGraphInfo *)a3;
  if (self == v8)
  {
    char v11 = 1;
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_48;
  }
  v9 = v8;
  uint64_t v10 = [(ASDDSPGraphInfo *)self path];
  if (v10 || ([(ASDDSPGraphInfo *)v9 path], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(ASDDSPGraphInfo *)self path];
    v5 = [(ASDDSPGraphInfo *)v9 path];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_45;
    }
    int v40 = 1;
  }
  else
  {
    int v40 = 0;
  }
  v12 = [(ASDDSPGraphInfo *)self text];
  if (!v12)
  {
    uint64_t v39 = [(ASDDSPGraphInfo *)v9 text];
    if (!v39)
    {
      uint64_t v39 = 0;
      int v38 = 0;
      goto LABEL_21;
    }
  }
  v13 = v3;
  id v14 = [(ASDDSPGraphInfo *)self text];
  uint64_t v15 = [(ASDDSPGraphInfo *)v9 text];
  if ([v14 isEqual:v15])
  {
    uint64_t v33 = v14;
    int v38 = 1;
    v3 = v13;
    id v6 = v15;
LABEL_21:
    uint64_t v16 = [(ASDDSPGraphInfo *)self includePaths];
    if (v16
      || ([(ASDDSPGraphInfo *)v9 includePaths], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v36 = v10;
      uint64_t v17 = v12;
      uint64_t v18 = v5;
      BOOL v19 = v4;
      uint64_t v20 = v6;
      uint64_t v21 = [(ASDDSPGraphInfo *)self includePaths];
      BOOL v34 = [(ASDDSPGraphInfo *)v9 includePaths];
      uint64_t v35 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        char v11 = 0;
        id v6 = v20;
        v4 = v19;
        v5 = v18;
        v12 = v17;
        uint64_t v10 = v36;
LABEL_36:

LABEL_37:
        if (!v16) {

        }
        if (v38)
        {
        }
        if (!v12) {

        }
        if (!v40) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
      id v32 = v16;
      int v31 = 1;
      id v6 = v20;
      v4 = v19;
      v5 = v18;
      v12 = v17;
      uint64_t v10 = v36;
    }
    else
    {
      id v32 = 0;
      uint64_t v29 = 0;
      int v31 = 0;
    }
    uint64_t v22 = [(ASDDSPGraphInfo *)self substitutions];
    if (v22
      || ([(ASDDSPGraphInfo *)v9 substitutions], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v30 = v6;
      uint64_t v37 = v3;
      uint64_t v23 = [(ASDDSPGraphInfo *)self substitutions];
      uint64_t v24 = [(ASDDSPGraphInfo *)v9 substitutions];
      char v11 = [v23 isEqual:v24];

      if (v22)
      {

        id v6 = v30;
        if (!v31)
        {
          v3 = v37;
          uint64_t v16 = v32;
          goto LABEL_37;
        }
        v3 = v37;
        uint64_t v16 = v32;
        goto LABEL_36;
      }
      v3 = v37;
      id v6 = v30;
      uint64_t v25 = v28;
    }
    else
    {
      uint64_t v25 = 0;
      char v11 = 1;
    }

    uint64_t v16 = v32;
    if ((v31 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }

  if (v12) {
  else
  }

  char v11 = 0;
  v3 = v13;
  if (v40)
  {
LABEL_44:
  }
LABEL_45:
  if (!v10) {

  }
LABEL_48:
  return v11;
}

- (unint64_t)hash
{
  v3 = [(ASDDSPGraphInfo *)self path];
  uint64_t v4 = [v3 hash];
  v5 = [(ASDDSPGraphInfo *)self text];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(ASDDSPGraphInfo *)self includePaths];
  uint64_t v8 = [v7 hash];
  v9 = [(ASDDSPGraphInfo *)self substitutions];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)includePaths
{
  return self->_includePaths;
}

- (void)setIncludePaths:(id)a3
{
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setSubstitutions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_includePaths, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end