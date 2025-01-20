@interface FSTaskOptionsBundle
+ (BOOL)supportsSecureCoding;
+ (id)bundleForArguments:(char *)a3 count:(int)a4 extension:(id)a5 operationType:(unsigned __int8)a6 errorHandler:(id)a7;
+ (id)bundleForArguments:(char *)a3 count:(int)a4 syntaxDictionary:(id)a5 errorHandler:(id)a6;
+ (void)resetOptionEnumeration;
- (FSTaskOptionsBundle)init;
- (FSTaskOptionsBundle)initWithCoder:(id)a3;
- (FSTaskOptionsBundle)initWithOptionString:(char *)a3 count:(int)a4 optionString:(id)a5 errorHandler:(id)a6;
- (NSArray)options;
- (NSArray)parameters;
- (void)addOption:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateOptionsWithBlock:(id)a3;
@end

@implementation FSTaskOptionsBundle

+ (id)bundleForArguments:(char *)a3 count:(int)a4 syntaxDictionary:(id)a5 errorHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    v12 = [v10 objectForKeyedSubscript:@"shortOptions"];

    if (v12)
    {
      v12 = [v10 objectForKeyedSubscript:@"shortOptions"];
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)[objc_alloc((Class)a1) initWithOptionString:a3 count:v7 optionString:v12 errorHandler:v11];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  [v5 encodeObject:self->_options forKey:@"FSTaskOption.options"];
  [v5 encodeObject:self->_parameters forKey:@"FSTaskOption.properties"];
}

- (FSTaskOptionsBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)FSTaskOptionsBundle;
  id v5 = [(FSTaskOptionsBundle *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"FSTaskOption.options"];
    options = v5->_options;
    v5->_options = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"FSTaskOption.properties"];
    parameters = v5->_parameters;
    v5->_parameters = (NSArray *)v14;
  }
  return v5;
}

- (FSTaskOptionsBundle)init
{
  v8.receiver = self;
  v8.super_class = (Class)FSTaskOptionsBundle;
  v2 = [(FSTaskOptionsBundle *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    options = v2->_options;
    v2->_options = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    parameters = v2->_parameters;
    v2->_parameters = (NSArray *)v5;
  }
  return v2;
}

- (void)addOption:(id)a3
{
  options = self->_options;
  id v5 = a3;
  [(NSArray *)options addObject:v5];
  parameters = self->_parameters;
  id v7 = [v5 originalArgv];

  [(NSArray *)parameters addObjectsFromArray:v7];
}

- (FSTaskOptionsBundle)initWithOptionString:(char *)a3 count:(int)a4 optionString:(id)a5 errorHandler:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(id, void *, void *))a6;
  uint64_t v12 = [(FSTaskOptionsBundle *)self init];
  if (v10 && [v10 length] && v12)
  {
    if ([v10 characterAtIndex:0] == 58)
    {
      v13 = v10;
    }
    else
    {
      v13 = [@":" stringByAppendingString:v10];
    }
    uint64_t v14 = 0;
    v15 = 0;
    *MEMORY[0x263EF89F8] = 1;
    while (1)
    {
      id v10 = v13;
      int v16 = getopt(a4, a3, (const char *)[v10 UTF8String]);
      if (v16 << 24 == -16777216) {
        break;
      }
      uint64_t v17 = (char)v16;
      if (v17 == 58)
      {
        v19 = fs_errorForPOSIXError(22);
        if (v19)
        {
LABEL_19:
          v11[2](v11, v19, v14);

          v23 = 0;
          goto LABEL_22;
        }
      }
      else if (v17 == 63)
      {
        uint64_t v18 = [NSString stringWithUTF8String:a3[*MEMORY[0x263EF89E8] - 1]];

        v19 = fs_errorForPOSIXError(45);
        uint64_t v14 = (void *)v18;
        if (v19) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v17);

        if (*MEMORY[0x263EF89E0])
        {
          v21 = objc_msgSend(NSString, "stringWithUTF8String:");
          v22 = +[FSTaskOption option:v20 value:v21];
          [(FSTaskOptionsBundle *)v12 addOption:v22];
        }
        else
        {
          v21 = +[FSTaskOption optionWithoutValue:v20];
          [(FSTaskOptionsBundle *)v12 addOption:v21];
        }

        v15 = (void *)v20;
      }
    }
  }
  v23 = v12;
LABEL_22:

  return v23;
}

+ (id)bundleForArguments:(char *)a3 count:(int)a4 extension:(id)a5 operationType:(unsigned __int8)a6 errorHandler:(id)a7
{
  int v8 = a6;
  uint64_t v9 = *(void *)&a4;
  id v11 = a5;
  id v12 = a7;
  v13 = objc_alloc_init(FSTaskOptionsBundle);
  uint64_t v14 = objc_opt_new();
  v15 = (void *)v14;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke;
    v27 = &unk_26530B558;
    id v28 = v11;
    v29 = &v30;
    [v15 installedExtensionsSync:&v24];
    uint64_t v18 = (void *)v31[5];
    if (!v18)
    {
      puts("No bundle for us!");
      uint64_t v20 = 0;
      v21 = 0;
      uint64_t v17 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (v8 == 2)
    {
      v19 = objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      uint64_t v20 = [v19 objectForKeyedSubscript:@"FSActivateOptionSyntax"];
      v21 = &stru_26FFF08C0;
    }
    else if (v8 == 1)
    {
      v19 = objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      uint64_t v20 = [v19 objectForKeyedSubscript:@"FSFormatOptionSyntax"];
      v21 = @"Nv:";
    }
    else
    {
      if (v8)
      {
        uint64_t v20 = 0;
        v21 = 0;
LABEL_21:
        uint64_t v17 = [(FSTaskOptionsBundle *)v13 initWithOptionString:a3 count:v9 optionString:v21 errorHandler:v12];
        goto LABEL_22;
      }
      v19 = objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      uint64_t v20 = [v19 objectForKeyedSubscript:@"FSCheckOptionSyntax"];
      v21 = @"qny";
    }

    if (v20)
    {
      v22 = [v20 objectForKeyedSubscript:@"shortOptions"];

      if (v22)
      {
        v21 = [v20 objectForKeyedSubscript:@"shortOptions"];
      }
    }
    goto LABEL_21;
  }
  if (!v14)
  {

    v13 = 0;
  }
  v13 = v13;
  uint64_t v17 = v13;
LABEL_23:
  _Block_object_dispose(&v30, 8);

  return v17;
}

void __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    uint64_t v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_24DDB2000, v9, OS_LOG_TYPE_INFO, "Could not get extensions - %@", buf, 0xCu);
    }
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke_2;
    v10[3] = &unk_26530B530;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    [a2 enumerateObjectsUsingBlock:v10];
    uint64_t v9 = v11;
  }
}

void __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 bundleIdentifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (void)resetOptionEnumeration
{
  *MEMORY[0x263EF89E8] = 1;
  *MEMORY[0x263EF89F8] = 1;
}

- (void)enumerateOptionsWithBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void *, NSUInteger, char *))a3;
  NSUInteger v5 = [(NSArray *)self->_options count];
  char v13 = 0;
  if (v5)
  {
    NSUInteger v6 = v5;
    NSUInteger v7 = 0;
    int v8 = 0;
    do
    {
      id v9 = v8;
      int v8 = [(NSArray *)self->_options objectAtIndexedSubscript:v7];

      id v10 = [v8 option];
      uint64_t v11 = *(char *)[v10 UTF8String];

      if ([v8 hasValue])
      {
        uint64_t v12 = [v8 optionValue];
        v4[2](v4, v11, v12, v7, &v13);
      }
      else
      {
        v4[2](v4, v11, 0, v7, &v13);
      }
      if (v13) {
        break;
      }
      ++v7;
    }
    while (v7 < v6);
  }
}

- (NSArray)options
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end