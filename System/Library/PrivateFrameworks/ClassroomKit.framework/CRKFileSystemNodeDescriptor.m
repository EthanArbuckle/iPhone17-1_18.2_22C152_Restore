@interface CRKFileSystemNodeDescriptor
+ (id)dataDescriptorWithFileName:(id)a3 content:(id)a4;
+ (id)directoryDescriptorWithFileName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CRKFileSystemNodeDescriptor)initWithType:(int64_t)a3 fileName:(id)a4 content:(id)a5;
- (NSData)content;
- (NSString)fileName;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation CRKFileSystemNodeDescriptor

- (CRKFileSystemNodeDescriptor)initWithType:(int64_t)a3 fileName:(id)a4 content:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKFileSystemNodeDescriptor;
  v10 = [(CRKFileSystemNodeDescriptor *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    fileName = v11->_fileName;
    v11->_fileName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    content = v11->_content;
    v11->_content = (NSData *)v14;
  }
  return v11;
}

+ (id)directoryDescriptorWithFileName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:0 fileName:v4 content:0];

  return v5;
}

+ (id)dataDescriptorWithFileName:(id)a3 content:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:1 fileName:v7 content:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"type, fileName, content", "componentsSeparatedByString:", @",");
  id v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_0;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  id v8 = self;
  id v9 = (CRKFileSystemNodeDescriptor *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKFileSystemNodeDescriptor *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          objc_super v17 = v9;
          uint64_t v18 = [(CRKFileSystemNodeDescriptor *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKFileSystemNodeDescriptor *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(@"type, fileName, content", "componentsSeparatedByString:", @",");
  id v4 = (void *)[v3 mutableCopy];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __crk_tokenized_properties_block_invoke_0;
  v19[3] = &unk_2646F3750;
  id v5 = v4;
  id v20 = v5;
  [v5 enumerateObjectsUsingBlock:v19];

  id v6 = self;
  id v7 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = [(CRKFileSystemNodeDescriptor *)v6 valueForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v10 ^= [v13 hash];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_fileName, 0);
}

@end