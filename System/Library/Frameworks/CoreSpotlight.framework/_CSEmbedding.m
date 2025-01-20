@interface _CSEmbedding
- (NSArray)vectors;
- (NSData)encodedData;
- (NSDictionary)properties;
- (_CSEmbedding)initWithDictionaries:(id)a3;
- (_CSEmbedding)initWithEncodedData:(id)a3;
- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 vectors:(id)a5;
- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 version:(unsigned __int16)a5 vectors:(id)a6;
- (id)_asDictionaries;
- (int)dimension;
- (int)format;
- (unsigned)version;
- (void)setProperties:(id)a3;
@end

@implementation _CSEmbedding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_vectors, 0);
}

- (_CSEmbedding)initWithEncodedData:(id)a3
{
  if (a3)
  {
    id v11 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v11];
    id v5 = v11;
    if (v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v4 firstObject],
          v6 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0))
    {
      self = [(_CSEmbedding *)self initWithDictionaries:v4];
      v8 = self;
    }
    else
    {
      if (v5)
      {
        v9 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[_CSEmbedding initWithEncodedData:]((uint64_t)v5, v9);
        }
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 version:(unsigned __int16)a5 vectors:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v35.receiver = self;
  v35.super_class = (Class)_CSEmbedding;
  id v11 = [(_CSEmbedding *)&v35 init];
  v12 = v11;
  if (v11)
  {
    v11->_format = a3;
    v11->_dimension = a4;
    v11->_version = a5;
    properties = v11->_properties;
    v29 = v11;
    v11->_properties = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v30 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      BOOL v19 = a3 < 3 && a4 < 3;
      uint64_t v20 = *(void *)v32;
      uint64_t v21 = a4;
      while (2)
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v22), "copy", v29);
          v24 = v23;
          if (v19) {
            uint64_t v25 = (vector_size_vec_sizes[v21] * vector_size_elem_sizes[a3]);
          }
          else {
            uint64_t v25 = -1;
          }
          if (v25 != [v23 length])
          {

            v27 = 0;
            v12 = v29;
            id v10 = v30;
            goto LABEL_22;
          }
          [(NSArray *)v14 addObject:v24];

          ++v22;
        }
        while (v17 != v22);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    v12 = v29;
    vectors = v29->_vectors;
    v29->_vectors = v14;

    id v10 = v30;
  }
  v27 = v12;
LABEL_22:

  return v27;
}

- (_CSEmbedding)initWithFormat:(int)a3 dimension:(int)a4 vectors:(id)a5
{
  return [(_CSEmbedding *)self initWithFormat:*(void *)&a3 dimension:*(void *)&a4 version:0 vectors:a5];
}

- (_CSEmbedding)initWithDictionaries:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 firstObject];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = [v5 objectForKeyedSubscript:@"vec_format"];
    uint64_t v39 = [v7 integerValue];

    v8 = [v5 objectForKeyedSubscript:@"vec_dim"];
    uint64_t v40 = [v8 integerValue];

    v9 = [v5 objectForKeyedSubscript:@"vec_version"];
    unsigned __int16 v38 = [v9 integerValue];

    uint64_t v36 = [v5 objectForKeyedSubscript:@"vec_scale"];
    uint64_t v35 = [v5 objectForKeyedSubscript:@"vec_bias"];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v4;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 1;
      uint64_t v13 = *(void *)v44;
      v14 = @"vec_data";
      long long v33 = self;
      id v34 = v4;
      while (2)
      {
        uint64_t v15 = 0;
        uint64_t v37 = v11;
        do
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = [*(id *)(*((void *)&v43 + 1) + 8 * v15) objectForKey:v14];
          if (!v16) {
            goto LABEL_18;
          }
          if ((v12 & 1) == 0)
          {
            uint64_t v17 = [v5 objectForKeyedSubscript:@"vec_format"];
            int v18 = [v17 integerValue];

            BOOL v19 = [v5 objectForKeyedSubscript:@"vec_dim"];
            uint64_t v20 = v13;
            uint64_t v21 = v14;
            uint64_t v22 = v6;
            int v23 = [v19 integerValue];

            v24 = [v5 objectForKeyedSubscript:@"vec_version"];
            unsigned __int16 v25 = [v24 integerValue];

            BOOL v26 = v23 == v40;
            v6 = v22;
            v14 = v21;
            uint64_t v13 = v20;
            uint64_t v11 = v37;
            if (!v26 || v18 != v39 || v25 != v38)
            {
LABEL_18:

              long long v31 = 0;
              self = v33;
              id v4 = v34;
              v29 = (void *)v35;
              v28 = (void *)v36;

              goto LABEL_20;
            }
          }
          [v6 addObject:v16];

          char v12 = 0;
          ++v15;
        }
        while (v11 != v15);
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        char v12 = 0;
        self = v33;
        id v4 = v34;
        if (v11) {
          continue;
        }
        break;
      }
    }

    v27 = [(_CSEmbedding *)self initWithFormat:v39 dimension:v40 version:v38 vectors:v6];
    self = v27;
    v28 = (void *)v36;
    if (v36)
    {
      v29 = (void *)v35;
      if (v35)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v30 setObject:v36 forKey:@"vec_scale"];
        [v30 setObject:v35 forKey:@"vec_bias"];
        id obja = v30;
        [(_CSEmbedding *)self setProperties:v30];
        long long v31 = self;
      }
      else
      {
        long long v31 = v27;
      }
    }
    else
    {
      long long v31 = v27;
      v29 = (void *)v35;
    }
LABEL_20:
  }
  else
  {
    long long v31 = 0;
  }

  return v31;
}

- (NSData)encodedData
{
  v2 = (void *)MEMORY[0x1E4F28F98];
  v3 = [(_CSEmbedding *)self _asDictionaries];
  id v8 = 0;
  id v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:&v8];
  id v5 = v8;

  if (v5)
  {
    v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_CSEmbedding initWithEncodedData:]((uint64_t)v5, v6);
    }
  }

  return (NSData *)v4;
}

- (id)_asDictionaries
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_vectors, "count"));
  long long v25 = 0u;
  long long v24 = 0u;
  memset(v22, 0, sizeof(v22));
  uint64_t v26 = 0;
  int v23 = @"vec_data";
  if (self->_version)
  {
    *((void *)&v22[0] + 1) = (id)objc_msgSend(NSNumber, "numberWithUnsignedShort:");
    *(void *)&long long v24 = @"vec_version";
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  if (self->_format)
  {
    *((void *)v22 + v4) = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    *(&v23 + v4++) = @"vec_format";
  }
  if (self->_dimension)
  {
    *((void *)v22 + v4) = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    *(&v23 + v4++) = @"vec_dim";
  }
  properties = self->_properties;
  if (properties)
  {
    uint64_t v6 = [(NSDictionary *)properties objectForKeyedSubscript:@"vec_scale"];
    v7 = (void *)v6;
    if (v6)
    {
      *((void *)v22 + v4) = v6;
      *(&v23 + v4++) = @"vec_scale";
    }
    id v8 = [(NSDictionary *)self->_properties objectForKeyedSubscript:@"vec_bias"];
    if (v8)
    {
      *((void *)v22 + v4) = v8;
      *(&v23 + v4++) = @"vec_bias";
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = self->_vectors;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        *(void *)&v22[0] = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v15 = objc_msgSend(v14, "initWithObjects:forKeys:count:", v22, &v23, v4, (void)v17);
        [v3 addObject:v15];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v3;
}

- (int)format
{
  return self->_format;
}

- (int)dimension
{
  return self->_dimension;
}

- (unsigned)version
{
  return self->_version;
}

- (NSArray)vectors
{
  return self->_vectors;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void)initWithEncodedData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "could not decode embedding data <%@>", (uint8_t *)&v2, 0xCu);
}

@end