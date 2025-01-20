@interface ENResource
+ (id)resourceWithServiceResource:(id)a3;
- (ENResource)initWithData:(id)a3 mimeType:(id)a4;
- (ENResource)initWithData:(id)a3 mimeType:(id)a4 filename:(id)a5;
- (NSData)data;
- (NSData)dataHash;
- (NSDictionary)edamAttributes;
- (NSString)filename;
- (NSString)guid;
- (NSString)mediaTag;
- (NSString)mimeType;
- (NSString)sourceUrl;
- (id)EDAMResource;
- (void)setData:(id)a3;
- (void)setDataHash:(id)a3;
- (void)setEdamAttributes:(id)a3;
- (void)setFilename:(id)a3;
- (void)setGuid:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setSourceUrl:(id)a3;
@end

@implementation ENResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_edamAttributes, 0);
  objc_storeStrong((id *)&self->_dataHash, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setEdamAttributes:(id)a3
{
}

- (NSDictionary)edamAttributes
{
  return self->_edamAttributes;
}

- (void)setDataHash:(id)a3
{
}

- (void)setSourceUrl:(id)a3
{
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)mediaTag
{
  v3 = [(ENResource *)self dataHash];
  v4 = [(ENResource *)self mimeType];
  v5 = +[ENMLUtility mediaTagWithDataHash:v3 mime:v4];

  return (NSString *)v5;
}

- (id)EDAMResource
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = [(ENResource *)self data];

  if (v3)
  {
    v3 = objc_alloc_init(EDAMResource);
    v4 = [(ENResource *)self data];

    if (v4)
    {
      v5 = objc_alloc_init(EDAMData);
      [(EDAMResource *)v3 setData:v5];

      v6 = [(ENResource *)self dataHash];
      v7 = [(EDAMResource *)v3 data];
      [v7 setBodyHash:v6];

      v8 = NSNumber;
      v9 = [(ENResource *)self data];
      v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
      v11 = [(EDAMResource *)v3 data];
      [v11 setSize:v10];

      v12 = [(ENResource *)self data];
      v13 = [(EDAMResource *)v3 data];
      [v13 setBody:v12];
    }
    v14 = [(ENResource *)self mimeType];
    [(EDAMResource *)v3 setMime:v14];

    v15 = objc_alloc_init(EDAMResourceAttributes);
    v16 = [(ENResource *)self filename];

    if (v16)
    {
      v17 = [(ENResource *)self filename];
      [(EDAMResourceAttributes *)v15 setFileName:v17];
    }
    v18 = [(ENResource *)self sourceUrl];

    if (v18)
    {
      v19 = [(ENResource *)self sourceUrl];
      [(EDAMResourceAttributes *)v15 setSourceURL:v19];
    }
    [(EDAMResource *)v3 setAttributes:v15];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v20 = [(ENResource *)self edamAttributes];
    v21 = [v20 allKeys];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v26 = [(ENResource *)self edamAttributes];
          v27 = [v26 valueForKey:v25];

          v28 = [(EDAMResource *)v3 attributes];
          [v28 setValue:v27 forKey:v25];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }
  }
  return v3;
}

- (NSData)dataHash
{
  if (!self->_dataHash)
  {
    v3 = [(ENResource *)self data];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      v5 = [(ENResource *)self data];
      v6 = [v5 enmd5];
      dataHash = self->_dataHash;
      self->_dataHash = v6;
    }
  }
  v8 = self->_dataHash;
  return v8;
}

- (void)setData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  v5 = v4;
  if (v4 && [(NSData *)v4 length] >= 0x7FFFFFFF)
  {
    v6 = +[ENSession sharedSession];
    v7 = [v6 logger];
    v8 = [NSString stringWithFormat:@"Data length for resource is greater than int32."];
    [v7 evernoteLogErrorString:v8];

    v5 = 0;
  }
  [(ENResource *)self setDataHash:0];
  data = self->_data;
  self->_data = v5;
}

- (ENResource)initWithData:(id)a3 mimeType:(id)a4
{
  return [(ENResource *)self initWithData:a3 mimeType:a4 filename:0];
}

- (ENResource)initWithData:(id)a3 mimeType:(id)a4 filename:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ENResource;
  v11 = [(ENResource *)&v19 init];
  v12 = v11;
  if (v11
    && ([(ENResource *)v11 setData:v8],
        [(ENResource *)v12 setMimeType:v9],
        [(ENResource *)v12 setFilename:v10],
        [(ENResource *)v12 data],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v15 = +[ENSession sharedSession];
    v16 = [v15 logger];
    v17 = [NSString stringWithFormat:@"[WARNING]: data is a required argument, this may become an assertion at a later date"];
    [v16 evernoteLogErrorString:v17];

    v14 = 0;
  }
  else
  {
    v14 = v12;
  }

  return v14;
}

+ (id)resourceWithServiceResource:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 data];
  v5 = [v4 body];

  if (v5)
  {
    v6 = objc_alloc_init(ENResource);
    v7 = [v3 data];
    id v8 = [v7 body];
    [(ENResource *)v6 setData:v8];

    id v9 = [v3 mime];
    [(ENResource *)v6 setMimeType:v9];

    id v10 = [v3 attributes];
    v11 = [v10 fileName];
    [(ENResource *)v6 setFilename:v11];

    v12 = [v3 attributes];
    v13 = [v12 sourceURL];
    [(ENResource *)v6 setSourceUrl:v13];

    v14 = [v3 guid];
    [(ENResource *)v6 setGuid:v14];
  }
  else
  {
    v14 = +[ENSession sharedSession];
    v15 = [v14 logger];
    v16 = [NSString stringWithFormat:@"Can't create an ENResource from an EDAMResource with no body"];
    [v15 evernoteLogErrorString:v16];

    v6 = 0;
  }

  return v6;
}

@end