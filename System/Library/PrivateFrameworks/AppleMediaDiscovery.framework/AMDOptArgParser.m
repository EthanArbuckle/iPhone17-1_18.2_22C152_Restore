@interface AMDOptArgParser
- (AMDOptArgParser)initWithOptArgs:(id)a3;
- (NSMutableDictionary)options;
- (NSMutableDictionary)parsedOptArgs;
- (NSMutableDictionary)shortOptions;
- (id)getValueForOption:(id)a3;
- (id)parseArgs:(id)a3;
- (void)setOptions:(id)a3;
- (void)setParsedOptArgs:(id)a3;
- (void)setShortOptions:(id)a3;
- (void)showHelp;
@end

@implementation AMDOptArgParser

- (id)getValueForOption:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = [(AMDOptArgParser *)v13 parsedOptArgs];
  id v11 = (id)[(NSMutableDictionary *)v10 objectForKey:location[0]];

  if (v11)
  {
    v9 = [(AMDOptArgParser *)v13 parsedOptArgs];
    id v14 = (id)[(NSMutableDictionary *)v9 objectForKey:location[0]];
  }
  else
  {
    v7 = [(AMDOptArgParser *)v13 options];
    id v8 = (id)[(NSMutableDictionary *)v7 objectForKey:location[0]];

    if (v8)
    {
      v6 = [(AMDOptArgParser *)v13 options];
      id v5 = (id)[(NSMutableDictionary *)v6 objectForKey:location[0]];
      id v14 = (id)[v5 defaultValue];
    }
    else
    {
      id v14 = 0;
    }
  }
  objc_storeStrong(location, 0);
  v3 = v14;

  return v3;
}

- (AMDOptArgParser)initWithOptArgs:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v40;
  v40 = 0;
  v38.receiver = v3;
  v38.super_class = (Class)AMDOptArgParser;
  v40 = [(AMDOptArgParser *)&v38 init];
  objc_storeStrong((id *)&v40, v40);
  id v25 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v26 = (id)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(location[0], "count") + 1);
  -[AMDOptArgParser setOptions:](v40, "setOptions:");

  id v27 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v28 = (id)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(location[0], "count") + 1);
  -[AMDOptArgParser setShortOptions:](v40, "setShortOptions:");

  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v30 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
  if (v30)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    unint64_t v24 = v30;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void *)(__b[1] + 8 * v23);
      id v35 = (id)[location[0] objectForKey:v37];
      id v34 = (id)[v35 objectForKey:@"shortName"];
      id v33 = [AMDCommandLineOption alloc];
      id v16 = v33;
      uint64_t v14 = v37;
      id v19 = (id)[v35 objectForKey:@"defaultValue"];
      id v18 = (id)[v35 objectForKey:@"helpText"];
      id v15 = v34;
      id v17 = (id)[v35 objectForKey:@"isBool"];
      v4 = objc_msgSend(v16, "initWithName:withDefaultValue:withHelpText:withShortName:andIsBoolFlag:", v14, v19, v18, v15, objc_msgSend(v17, "BOOLValue") & 1);
      id v5 = v33;
      id v33 = v4;

      v20 = [(AMDOptArgParser *)v40 options];
      [(NSMutableDictionary *)v20 setObject:v33 forKey:v37];

      if (!v34) {
        goto LABEL_9;
      }
      v12 = [(AMDOptArgParser *)v40 shortOptions];
      id v13 = (id)[(NSMutableDictionary *)v12 objectForKey:v34];

      if (!v13) {
        break;
      }
      NSLog(&cfstr_ShortOptionBei.isa, v34);
      -[AMDOptArgParser setOptions:](v40, "setOptions:");
      [(AMDOptArgParser *)v40 setShortOptions:0];
      int v32 = 2;
LABEL_10:
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
      if (v32) {
        goto LABEL_14;
      }
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v24) {
          goto LABEL_13;
        }
      }
    }
    id v11 = [(AMDOptArgParser *)v40 shortOptions];
    [(NSMutableDictionary *)v11 setObject:v33 forKey:v34];

LABEL_9:
    int v32 = 0;
    goto LABEL_10;
  }
LABEL_13:
  int v32 = 0;
LABEL_14:

  id v31 = [[AMDCommandLineOption alloc] initWithName:@"-help" withDefaultValue:0 withHelpText:@"Show help text" withShortName:@"-h" andIsBoolFlag:1];
  v10 = [(AMDOptArgParser *)v40 options];

  if (v10)
  {
    id v8 = [(AMDOptArgParser *)v40 options];
    [(NSMutableDictionary *)v8 setObject:v31 forKey:@"-help"];

    v9 = [(AMDOptArgParser *)v40 shortOptions];
    [(NSMutableDictionary *)v9 setObject:v31 forKey:@"-h"];
  }
  v7 = v40;
  int v32 = 1;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v40, 0);
  return v7;
}

- (id)parseArgs:(id)a3
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(AMDOptArgParser *)v25 options];
  BOOL v17 = v3 != 0;

  if (!v17)
  {
    id v26 = 0;
    int v23 = 1;
    goto LABEL_26;
  }
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; ; ++i)
  {
    unint64_t v16 = i;
    if (v16 >= [location[0] count]) {
      break;
    }
    id v19 = (id)[location[0] objectAtIndexedSubscript:i];
    if ([v19 hasPrefix:@"-"])
    {
      id v15 = [(AMDOptArgParser *)v25 options];
      id v18 = (id)[(NSMutableDictionary *)v15 objectForKey:v19];

      if (!v18)
      {
        uint64_t v14 = [(AMDOptArgParser *)v25 shortOptions];
        id v4 = (id)[(NSMutableDictionary *)v14 objectForKey:v19];
        id v5 = v18;
        id v18 = v4;
      }
      if (!v18)
      {
        printf("!! Bad option: %s\n", (const char *)[v19 UTF8String]);
        id v26 = 0;
        int v23 = 1;
        goto LABEL_16;
      }
      if ([v18 isBool])
      {
        id v12 = v22;
        id v13 = (id)[v18 name];
        objc_msgSend(v12, "setObject:forKey:", MEMORY[0x263EFFA88]);

        goto LABEL_15;
      }
      unint64_t v11 = ++i;
      if (v11 < [location[0] count])
      {
        id v8 = v22;
        id v10 = (id)[location[0] objectAtIndexedSubscript:i];
        id v9 = (id)[v18 name];
        objc_msgSend(v8, "setObject:forKey:", v10);

LABEL_15:
        int v23 = 0;
      }
      else
      {
        printf("!! Missing value for option: %s\n", (const char *)[v19 UTF8String]);
        id v26 = 0;
        int v23 = 1;
      }
LABEL_16:
      objc_storeStrong(&v18, 0);
      if (v23) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    [v21 addObject:v19];
LABEL_19:
    int v23 = 0;
LABEL_20:
    objc_storeStrong(&v19, 0);
    if (v23) {
      goto LABEL_25;
    }
  }
  if ([v21 count]) {
    [v22 setObject:v21 forKey:@"arguments"];
  }
  [(AMDOptArgParser *)v25 setParsedOptArgs:v22];
  id v26 = v22;
  int v23 = 1;
LABEL_25:
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
LABEL_26:
  objc_storeStrong(location, 0);
  v6 = v26;

  return v6;
}

- (void)showHelp
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29 = self;
  SEL v28 = a2;
  printf("\n");
  memset(__b, 0, sizeof(__b));
  id obj = [(AMDOptArgParser *)v29 options];
  uint64_t v23 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v23)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    unint64_t v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(obj);
      }
      id v27 = *(id *)(__b[1] + 8 * v20);
      BOOL v17 = [(AMDOptArgParser *)v29 options];
      id v25 = (id)[(NSMutableDictionary *)v17 objectForKey:v27];

      id v24 = @"false";
      if (([v25 isBool] & 1) == 0)
      {
        id v15 = (id)[v25 defaultValue];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v14 = (id)[v25 defaultValue];
          id v2 = (id)[v14 stringValue];
          id v3 = v24;
          id v24 = v2;
        }
        else
        {
          id v4 = (id)[v25 defaultValue];
          id v5 = v24;
          id v24 = v4;
        }
      }
      id v8 = (const char *)[v27 UTF8String];
      id v13 = (id)[v25 shortName];
      id v9 = (const char *)[v13 UTF8String];
      id v12 = (id)[v25 helpText];
      id v10 = (const char *)[v12 UTF8String];
      unint64_t v11 = (const char *)[v24 UTF8String];
      char v6 = [v25 isBool];
      v7 = "yes";
      if ((v6 & 1) == 0) {
        v7 = "no";
      }
      printf("%s (%s)\t: %s\ndefault value\t\t: %s\nisBool\t\t\t: %s\n\n", v8, v9, v10, v11, v7);

      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  printf("End of help text\n");
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)parsedOptArgs
{
  return self->_parsedOptArgs;
}

- (void)setParsedOptArgs:(id)a3
{
}

- (NSMutableDictionary)shortOptions
{
  return self->_shortOptions;
}

- (void)setShortOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end