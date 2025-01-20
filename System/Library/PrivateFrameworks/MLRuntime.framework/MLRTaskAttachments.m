@interface MLRTaskAttachments
+ (BOOL)supportsSecureCoding;
- (MLRTaskAttachments)initWithCoder:(id)a3;
- (MLRTaskAttachments)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MLRTaskAttachments)initWithDESRecipe:(id)a3;
- (MLRTaskAttachments)initWithURLs:(id)a3;
- (NSArray)attachmentURLs;
- (id)attachmentURLsForBasename:(id)a3;
- (id)description;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRTaskAttachments

- (MLRTaskAttachments)initWithURLs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRTaskAttachments;
  v5 = [(MLRTaskAttachments *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attachmentURLs = v5->_attachmentURLs;
    v5->_attachmentURLs = (NSArray *)v6;
  }
  return v5;
}

- (MLRTaskAttachments)initWithDESRecipe:(id)a3
{
  if (a3)
  {
    id v4 = [a3 attachments];
    self = [(MLRTaskAttachments *)self initWithURLs:v4];

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MLRTaskAttachments)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 URLByResolvingSymlinksInPath];
  if (!v5)
  {
    id v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Nil URL" userInfo:0];
    objc_exception_throw(v20);
  }
  uint64_t v6 = (void *)v5;
  v7 = [MEMORY[0x263EFF980] array];
  v8 = (void *)MEMORY[0x21D4A5AA0]();
  objc_super v9 = [MEMORY[0x263F08850] defaultManager];
  v10 = [v9 enumeratorAtURL:v6 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 errorHandler:&__block_literal_global_1];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v16, "hasDirectoryPath", (void)v21) & 1) == 0)
        {
          v17 = [v16 URLByStandardizingPath];
          [v7 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v18 = [(MLRTaskAttachments *)self initWithURLs:v7];

  return v18;
}

uint64_t __50__MLRTaskAttachments_initWithContentsOfURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if ([v5 code] != 260)
  {
    uint64_t v6 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_21C376000, v6, OS_LOG_TYPE_DEFAULT, "Fail to enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@(%@)\n", v5, self->_attachmentURLs];

  return v6;
}

- (id)attachmentURLsForBasename:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = self->_attachmentURLs;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "lastPathComponent", (void)v18);
        int v14 = [v13 hasSuffix:v4];

        if (v14)
        {
          v15 = [v12 path];
          int v16 = [v6 fileExistsAtPath:v15];

          if (v16) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MLRTaskAttachments)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"attachmentURLs"];

  uint64_t v9 = [(MLRTaskAttachments *)self initWithURLs:v8];
  return v9;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (void).cxx_destruct
{
}

@end