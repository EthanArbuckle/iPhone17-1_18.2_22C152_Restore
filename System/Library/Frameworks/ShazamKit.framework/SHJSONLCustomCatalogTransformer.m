@interface SHJSONLCustomCatalogTransformer
+ (BOOL)objectIsHeader:(id)a3;
+ (BOOL)objectIsMediaItem:(id)a3;
+ (BOOL)objectIsSignature:(id)a3;
+ (id)IDFromFileRow:(id)a3;
+ (id)catalogFileRepresentationOfMediaItems:(id)a3 withID:(id)a4 error:(id *)a5;
+ (id)catalogFileRepresentationOfSignature:(id)a3 withID:(id)a4;
+ (id)headerFromFileRow:(id)a3;
+ (id)mediaItemFromFileRow:(id)a3 error:(id *)a4;
+ (id)outputFileHeader;
+ (id)signatureFromFileRow:(id)a3 error:(id *)a4;
- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4;
- (NSDictionary)header;
- (NSError)error;
- (SHCustomCatalogStorage)delegate;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
@end

@implementation SHJSONLCustomCatalogTransformer

- (void)reset
{
  [(SHJSONLCustomCatalogTransformer *)self setError:0];

  [(SHJSONLCustomCatalogTransformer *)self setHeader:0];
}

- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!+[SHJSONLCustomCatalogTransformer objectIsMediaItem:v6])
  {
    if (!+[SHJSONLCustomCatalogTransformer objectIsSignature:v6])
    {
      if (!+[SHJSONLCustomCatalogTransformer objectIsHeader:v6])goto LABEL_16; {
      v11 = [(SHJSONLCustomCatalogTransformer *)self header];
      }

      if (!v11)
      {
        [(SHJSONLCustomCatalogTransformer *)self setHeader:v6];
        goto LABEL_16;
      }
      goto LABEL_9;
    }
    v7 = [(SHJSONLCustomCatalogTransformer *)self error];
    if (!v7)
    {
      v12 = [(SHJSONLCustomCatalogTransformer *)self header];

      if (v12)
      {
        uint64_t v18 = 0;
        uint64_t v13 = +[SHJSONLCustomCatalogTransformer signatureFromFileRow:v6 error:&v18];
        if (v13)
        {
          v14 = (void *)v13;
          v15 = [(SHJSONLCustomCatalogTransformer *)self delegate];
          v16 = +[SHJSONLCustomCatalogTransformer IDFromFileRow:v6];
          [v15 producedSignature:v14 forID:v16];

          goto LABEL_16;
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = [(SHJSONLCustomCatalogTransformer *)self error];
  if (v7)
  {
LABEL_8:

    goto LABEL_9;
  }
  v8 = [(SHJSONLCustomCatalogTransformer *)self header];

  if (!v8)
  {
LABEL_9:
    +[SHError annotateClientError:a4 code:300 underlyingError:0];
    LOBYTE(a4) = 0;
    goto LABEL_17;
  }
  a4 = +[SHJSONLCustomCatalogTransformer mediaItemFromFileRow:v6 error:a4];
  if (a4)
  {
    v9 = [(SHJSONLCustomCatalogTransformer *)self delegate];
    v10 = +[SHJSONLCustomCatalogTransformer IDFromFileRow:v6];
    [v9 producedMediaItem:a4 forID:v10];

LABEL_16:
    LOBYTE(a4) = 1;
  }
LABEL_17:

  return (char)a4;
}

+ (BOOL)objectIsHeader:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"type"];
    if ([v4 isEqualToString:@"header"])
    {
      v5 = [v3 objectForKeyedSubscript:@"name"];
      if (v5)
      {
        id v6 = [v3 objectForKeyedSubscript:@"version"];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)objectIsMediaItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"type"];
    if ([v4 isEqualToString:@"media"])
    {
      v5 = [v3 objectForKeyedSubscript:@"id"];
      if (v5)
      {
        id v6 = [v3 objectForKeyedSubscript:@"data"];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)objectIsSignature:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"type"];
    if ([v4 isEqualToString:@"signature"])
    {
      v5 = [v3 objectForKeyedSubscript:@"id"];
      if (v5)
      {
        id v6 = [v3 objectForKeyedSubscript:@"data"];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)IDFromFileRow:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"id"];
}

+ (id)headerFromFileRow:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (id)mediaItemFromFileRow:(id)a3 error:(id *)a4
{
  v5 = [a3 objectForKeyedSubscript:@"data"];
  id v6 = +[SHMediaItemSerialization propertiesFromSerializationFormat:v5 error:a4];
  BOOL v7 = +[SHMediaItem mediaItemWithProperties:v6];

  return v7;
}

+ (id)signatureFromFileRow:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"data"];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v6 options:0];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263EF9430]) initWithHostTime:mach_absolute_time()];
    v9 = [v5 objectForKeyedSubscript:@"id"];
    v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x263F08C38] UUID];
    }
    v14 = v12;

    uint64_t v18 = 0;
    v15 = [[SHSignature alloc] initWithID:v14 dataRepresentation:v7 startTime:v8 error:&v18];
    uint64_t v13 = v15;
    if (v15) {
      v16 = v15;
    }
  }
  else
  {
    +[SHError annotateClientError:a4 code:200 underlyingError:0];
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)catalogFileRepresentationOfSignature:(id)a3 withID:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v10[1] = @"id";
  v11[0] = @"signature";
  v11[1] = a4;
  v10[2] = @"data";
  id v5 = a4;
  id v6 = [a3 dataRepresentation];
  BOOL v7 = [v6 base64EncodedStringWithOptions:0];
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)catalogFileRepresentationOfMediaItems:(id)a3 withID:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "properties", (void)v22);
        v16 = +[SHMediaItemSerialization serializationFormatForProperties:v15 error:a5];

        if (!v16)
        {

          v20 = 0;
          goto LABEL_11;
        }
        v17 = (void *)MEMORY[0x263EFF9A0];
        v26[0] = @"type";
        v26[1] = @"id";
        v27[0] = @"media";
        v27[1] = v8;
        v26[2] = @"data";
        v27[2] = v16;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
        v19 = [v17 dictionaryWithDictionary:v18];

        [v9 addObject:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v20 = (void *)[v9 copy];
LABEL_11:

  return v20;
}

+ (id)outputFileHeader
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"type";
  v4[1] = @"name";
  v5[0] = @"header";
  v5[1] = @"Shazam Catalog";
  v4[2] = @"version";
  v5[2] = &unk_26D7E5468;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (SHCustomCatalogStorage)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHCustomCatalogStorage *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end