@interface CPLHelpCommand
+ (BOOL)ignoreInCPLStore;
+ (id)commandName;
+ (id)help;
+ (id)parameters;
+ (id)shortDescription;
- (BOOL)isStandaloneTool;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (NSString)helpCommandName;
- (int)execute;
- (void)_printUsageWithFirstLine:(id)a3 mainCommandName:(id)a4 secondLine:(id)a5;
- (void)executeWithCommandClass:(Class)a3 mainCommandName:(id)a4;
- (void)executeWithCommandClasses:(id)a3 mainCommandName:(id)a4;
- (void)setHelpCommandName:(id)a3;
- (void)setStandaloneTool:(BOOL)a3;
@end

@implementation CPLHelpCommand

+ (id)commandName
{
  return @"help";
}

+ (id)shortDescription
{
  return @"get some help.";
}

+ (id)parameters
{
  return @"[<command>]";
}

+ (id)help
{
  return @"[<command>]\tget help on a specific command.";
}

+ (BOOL)ignoreInCPLStore
{
  return 1;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 == 2)
  {
    v5 = +[NSString stringWithUTF8String:a4[1]];
    helpCommandName = self->_helpCommandName;
    self->_helpCommandName = v5;
    BOOL v7 = 1;
  }
  else
  {
    helpCommandName = [(id)objc_opt_class() commandName];
    [(CPLCTLCommand *)self printFormat:@"%@ can only take one argument", helpCommandName];
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_printUsageWithFirstLine:(id)a3 mainCommandName:(id)a4 secondLine:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(id)objc_opt_class() toolName];
  if (v8) {
    [(CPLCTLCommand *)self printFormat:@"Usage: %@ %@ %@", v10, v8, v12];
  }
  else {
    [(CPLCTLCommand *)self printFormat:@"Usage: %@ %@", v10, v12, v11];
  }

  if (v9) {
    [(CPLCTLCommand *)self printFormat:@"\n%@", v9];
  }
}

- (void)executeWithCommandClass:(Class)a3 mainCommandName:(id)a4
{
  id v20 = a4;
  v6 = [(objc_class *)a3 parameters];
  BOOL v7 = [(objc_class *)a3 shortDescription];
  BOOL standaloneTool = self->_standaloneTool;
  id v9 = objc_alloc((Class)NSString);
  if (standaloneTool)
  {
    if (!v6)
    {
      id v10 = [v9 initWithFormat:@"\n\t%@", v7, v17, v19];
      goto LABEL_9;
    }
    helpCommandName = v6;
    v18 = v7;
  }
  else
  {
    if (v6)
    {
      id v10 = [v9 initWithFormat:@"%@ %@\n\t%@", self->_helpCommandName, v6, v7];
      goto LABEL_9;
    }
    helpCommandName = self->_helpCommandName;
    v18 = v7;
  }
  id v10 = [v9 initWithFormat:@"%@\n\t%@", helpCommandName, v18, v19];
LABEL_9:
  uint64_t v11 = v10;
  id v12 = [(objc_class *)a3 help];
  v13 = [v12 componentsSeparatedByString:@"\n"];

  if (v13)
  {
    v14 = [v13 componentsJoinedByString:@"\n\t"];
    v15 = +[NSString stringWithFormat:@"\t%@", v14];
  }
  else
  {
    v15 = 0;
  }
  [(CPLHelpCommand *)self _printUsageWithFirstLine:v11 mainCommandName:v20 secondLine:v15];
}

- (void)executeWithCommandClasses:(id)a3 mainCommandName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v7 = @"<subcommand> [subcommand-options and arguments]";
  id v30 = v6;
  if (!v6) {
    CFStringRef v7 = @"<command> [command-options and arguments]";
  }
  CFStringRef v28 = v7;
  id v32 = objc_alloc_init((Class)NSMutableArray);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v13 = objc_alloc((Class)NSString);
        v14 = [v12 commandName];
        uint64_t v15 = [v12 parameters];
        v16 = (void *)v15;
        if (v15) {
          CFStringRef v17 = (const __CFString *)v15;
        }
        else {
          CFStringRef v17 = &stru_1000359E8;
        }
        v18 = [v12 shortDescription];
        id v19 = [v13 initWithFormat:@"\t%@ %@\n\t\t%@", v14, v17, v18];

        [v32 addObject:v19];
      }
      id v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  id v20 = objc_alloc((Class)NSString);
  if (v30) {
    v21 = "subcommands";
  }
  else {
    v21 = "commands";
  }
  v22 = [v32 componentsJoinedByString:@"\n"];
  id v23 = [v20 initWithFormat:@"Available %s:\n%@", v21, v22];

  [(CPLHelpCommand *)self _printUsageWithFirstLine:v28 mainCommandName:v30 secondLine:v23];
  v24 = [(id)objc_opt_class() toolName];
  uint64_t v25 = [(id)objc_opt_class() commandName];
  v26 = (void *)v25;
  if (v30) {
    [(CPLCTLCommand *)self printFormat:@"\nTry %@ %@ %@ <subcommand> to get help on a specific subcommand.", v24, v30, v25];
  }
  else {
    [(CPLCTLCommand *)self printFormat:@"\nTry %@ %@ <command> to get help on a specific command.", v24, v25, v27];
  }
}

- (int)execute
{
  helpCommandName = self->_helpCommandName;
  v4 = objc_opt_class();
  if (!helpCommandName)
  {
    id v6 = [v4 allCommandNames];
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_opt_class(), "commandClassWithName:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v12)));
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(CPLHelpCommand *)self executeWithCommandClasses:v7 mainCommandName:0];
    return 0;
  }
  id v5 = [v4 commandClassWithName:self->_helpCommandName];
  if (v5)
  {
    [(CPLHelpCommand *)self executeWithCommandClass:v5 mainCommandName:0];
    return 0;
  }
  [(CPLCTLCommand *)self printFormat:@"Unknown command '%@'", self->_helpCommandName];
  v14 = self->_helpCommandName;
  self->_helpCommandName = 0;

  [(CPLHelpCommand *)self execute];
  return 1;
}

- (NSString)helpCommandName
{
  return self->_helpCommandName;
}

- (void)setHelpCommandName:(id)a3
{
}

- (BOOL)isStandaloneTool
{
  return self->_standaloneTool;
}

- (void)setStandaloneTool:(BOOL)a3
{
  self->_BOOL standaloneTool = a3;
}

- (void).cxx_destruct
{
}

@end