@interface ADArgumentParserCommand
- (ADArgumentParserCommand)init;
- (ADArgumentParserCommandHandler)handler;
- (BOOL)checkIfName:(id)a3 notInList:(id)a4;
- (BOOL)commandParse:(id)a3 commandIndex:(unsigned int)a4;
- (BOOL)parseSubCommand:(id)a3 commandIndex:(unsigned int)a4;
- (BOOL)parseUsingDocopt:(id)a3;
- (BOOL)verifyArgumentsForClass;
- (BOOL)verifyCommandStructure;
- (BOOL)verifyInputs;
- (BOOL)verifyNoArgumentDuplications;
- (BOOL)verifySingleArgName:(id)a3 ofType:(unint64_t)a4;
- (NSString)descriptionString;
- (NSString)name;
- (id)fullUsageWithPrefix:(id)a3;
- (id)shortUsageWithPrefix:(id)a3;
- (id)subCommandsUsageWithPrefix:(id)a3;
- (id)usage;
- (void)addDescription:(id)a3;
- (void)addOptionalArgument:(id)a3;
- (void)addPositionalArgument:(id)a3;
- (void)addSubCommand:(id)a3 withName:(SEL)a4 description:(id)a5;
- (void)addSubCommand:(id)a3 withName:(id)a4 description:(id)a5 handler:(id)a6;
- (void)setDescriptionString:(id)a3;
- (void)setHandler:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ADArgumentParserCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_subCommands, 0);
  objc_storeStrong((id *)&self->_optionalArguments, 0);
  objc_storeStrong((id *)&self->_positionalArguments, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_preParsedPrefix, 0);

  objc_storeStrong((id *)&self->_programName, 0);
}

- (void)setDescriptionString:(id)a3
{
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setHandler:(id)a3
{
}

- (ADArgumentParserCommandHandler)handler
{
  return self->_handler;
}

- (BOOL)commandParse:(id)a3 commandIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 objectAtIndexedSubscript:0];
  v8 = [v7 lastPathComponent];
  programName = self->_programName;
  self->_programName = v8;

  p_preParsedPrefix = &self->_preParsedPrefix;
  objc_storeStrong((id *)&self->_preParsedPrefix, self->_programName);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = objc_msgSend(v6, "subarrayWithRange:", 1, v4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = [(NSString *)*p_preParsedPrefix stringByAppendingFormat:@" %@", *(void *)(*((void *)&v21 + 1) + 8 * i)];
        v16 = *p_preParsedPrefix;
        *p_preParsedPrefix = (NSString *)v15;
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  if (![(NSMutableArray *)self->_subCommands count])
  {
    if ([(NSMutableArray *)self->_optionalArguments count]
      || [(NSMutableArray *)self->_positionalArguments count])
    {
      if (![(ADArgumentParserCommand *)self parseUsingDocopt:v6]) {
        goto LABEL_18;
      }
    }
    else if ([v6 count] > (unint64_t)(v4 + 1))
    {
      goto LABEL_18;
    }
    if ([(ADArgumentParserCommand *)self verifyInputs])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        BOOL v18 = 1;
        goto LABEL_19;
      }
      char v17 = [(ADArgumentParserCommandHandler *)self->_handler didReceiveCommand:self];
      goto LABEL_10;
    }
LABEL_18:
    id v19 = [(ADArgumentParserCommand *)self usage];
    puts((const char *)[v19 UTF8String]);

    BOOL v18 = 0;
    goto LABEL_19;
  }
  char v17 = [(ADArgumentParserCommand *)self parseSubCommand:v6 commandIndex:v4];
LABEL_10:
  BOOL v18 = v17;
LABEL_19:

  return v18;
}

- (BOOL)parseUsingDocopt:(id)a3
{
  v7[40] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = 0;
  v7[1] = 0;
  id v6 = v7;
  [(ADArgumentParserCommand *)self usage];
  objc_claimAutoreleasedReturnValue();
  [v4 count];
  operator new[]();
}

- (BOOL)parseSubCommand:(id)a3 commandIndex:(unsigned int)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  unint64_t v6 = a4 + 1;
  if ([v25 count] <= v6)
  {
    id v11 = [v25 lastObject];
    printf("ADArgumentParser Error: expecting subcommand after %s\n", (const char *)[v11 UTF8String]);

    id v12 = [(ADArgumentParserCommand *)self usage];
    puts((const char *)[v12 UTF8String]);

    char v10 = 0;
    goto LABEL_8;
  }
  v7 = [v25 objectAtIndexedSubscript:a4 + 1];
  if (([v7 isEqualToString:@"-h"] & 1) != 0
    || [v7 isEqualToString:@"--help"])
  {
    id v8 = [(ADArgumentParserCommand *)self usage];
    puts((const char *)[v8 UTF8String]);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = self->_subCommands;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v27;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        BOOL v18 = *(void **)(*((void *)&v26 + 1) + 8 * v17);
        id v19 = [v18 name];
        char v20 = [v19 isEqualToString:v7];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      id v9 = v18;

      if (!v9) {
        goto LABEL_22;
      }
      long long v21 = [v9 name];
      NSSelectorFromString(v21);
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        long long v23 = [v9 name];
        [(ADArgumentParserCommand *)self setValue:v9 forKey:v23];
      }
      char v10 = [v9 commandParse:v25 commandIndex:v6];
      goto LABEL_6;
    }
LABEL_17:

LABEL_22:
    printf("unknown command %s\n", (const char *)[v7 UTF8String]);
    id v24 = [(ADArgumentParserCommand *)self usage];
    puts((const char *)[v24 UTF8String]);
  }
  id v9 = 0;
  char v10 = 0;
LABEL_6:

LABEL_8:
  return v10;
}

- (BOOL)verifyCommandStructure
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_subCommands count]
    && (uint64_t v3 = [(NSMutableArray *)self->_optionalArguments count],
        v3 + [(NSMutableArray *)self->_positionalArguments count]))
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    Name = class_getName(v13);
    printf("ADArgumentParser Error: a command %s cannot have both subcommands and positional/optional arguments\n", Name);
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [(ADArgumentParserCommand *)self verifyArgumentsForClass];
    if ((v4 & 1) == 0)
    {
      v5 = (objc_class *)objc_opt_class();
      unint64_t v6 = class_getName(v5);
      printf("ADArgumentParser Error: missmatch between declared arguments and class properties for command %s\n", v6);
    }
    if (![(ADArgumentParserCommand *)self verifyNoArgumentDuplications])
    {
      v7 = (objc_class *)objc_opt_class();
      id v8 = class_getName(v7);
      printf("ADArgumentParser Error: some arguemnts in command %s were added more than once\n", v8);
      int v4 = 0;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = self->_subCommands;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          v4 &= [*(id *)(*((void *)&v16 + 1) + 8 * i) verifyCommandStructure];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v4;
}

- (BOOL)verifyNoArgumentDuplications
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  int v4 = self->_optionalArguments;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v36;
    int v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        BOOL v11 = [(ADArgumentParserCommand *)self checkIfName:v10 notInList:v3];

        v7 &= v11;
        if ([v9 shortName])
        {
          id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (int)objc_msgSend(v9, "shortName"));
          BOOL v13 = [(ADArgumentParserCommand *)self checkIfName:v12 notInList:v3];

          v7 &= v13;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v14 = self->_positionalArguments;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = [*(id *)(*((void *)&v31 + 1) + 8 * j) name];
        BOOL v19 = [(ADArgumentParserCommand *)self checkIfName:v18 notInList:v3];

        LOBYTE(v7) = v7 & v19;
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v20 = self->_subCommands;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = [*(id *)(*((void *)&v27 + 1) + 8 * k) name];
        BOOL v25 = [(ADArgumentParserCommand *)self checkIfName:v24 notInList:v3];

        LOBYTE(v7) = v7 & v25;
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v21);
  }

  return v7;
}

- (BOOL)verifyArgumentsForClass
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v3 = self->_optionalArguments;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v35;
    char v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v9 = [v8 name];
        LOBYTE(v8) = -[ADArgumentParserCommand verifySingleArgName:ofType:](self, "verifySingleArgName:ofType:", v9, [v8 type]);

        v6 &= v8;
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v4);
  }
  else
  {
    char v6 = 1;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = self->_positionalArguments;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        uint64_t v15 = [v14 name];
        LOBYTE(v14) = -[ADArgumentParserCommand verifySingleArgName:ofType:](self, "verifySingleArgName:ofType:", v15, [v14 type]);

        v6 &= v14;
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v11);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = self->_subCommands;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v16);
        }
        char v20 = *(void **)(*((void *)&v26 + 1) + 8 * k);
        uint64_t v21 = objc_msgSend(v20, "handler", (void)v26);
        BOOL v22 = v21 == 0;

        if (v22)
        {
          long long v23 = [v20 name];
          BOOL v24 = [(ADArgumentParserCommand *)self verifySingleArgName:v23 ofType:8];

          v6 &= v24;
        }
      }
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v17);
  }

  return v6 & 1;
}

- (BOOL)verifySingleArgName:(id)a3 ofType:(unint64_t)a4
{
  id v5 = a3;
  char v6 = (objc_class *)objc_opt_class();
  id v7 = v5;
  Property = class_getProperty(v6, (const char *)[v7 UTF8String]);
  id v9 = Property;
  if (!Property)
  {
    [v7 UTF8String];
    printf("ADArgumentParser Error: argument name %s does not match any declared class property\n");
    goto LABEL_6;
  }
  if (a4 != 8)
  {
    uint64_t v12 = propertyOptionType(Property);
    if (v12 != a4)
    {
      if ((v12 & 0xD) != 0)
      {
        if ((unint64_t)(v12 - 5) > 2 || a4 - 5 >= 3) {
          goto LABEL_4;
        }
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        goto LABEL_4;
      }
    }
LABEL_13:
    BOOL v11 = 1;
    goto LABEL_14;
  }
  uint64_t v10 = (objc_class *)objc_opt_class();
  if (isPropertyDerivedFromClass(v9, v10)) {
    goto LABEL_13;
  }
LABEL_4:
  [v7 UTF8String];
  printf("ADArgumentParser Error: argument name %s declared type does not match property type\n");
LABEL_6:
  BOOL v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)checkIfName:(id)a3 notInList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 containsObject:v5];
  if (v7) {
    printf("ADArgumentParser Error: argument name %s added more than once. unable to resolve\n", (const char *)[v5 UTF8String]);
  }
  else {
    [v6 addObject:v5];
  }

  return v7 ^ 1;
}

- (id)usage
{
  if ([(NSMutableArray *)self->_optionalArguments count]
    || [(NSMutableArray *)self->_positionalArguments count])
  {
    uint64_t v3 = [(ADArgumentParserCommand *)self fullUsageWithPrefix:self->_preParsedPrefix];
  }
  else
  {
    uint64_t v3 = [(ADArgumentParserCommand *)self subCommandsUsageWithPrefix:self->_preParsedPrefix];
  }

  return v3;
}

- (id)fullUsageWithPrefix:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] string];
  [v5 appendFormat:@"%@: %@\n", self->_name, self->_descriptionString];
  [v5 appendString:@"Usage:\n"];
  id v6 = [(ADArgumentParserCommand *)self shortUsageWithPrefix:v4];
  [v5 appendFormat:@"\t%@\n", v6];

  optionalArguments = self->_optionalArguments;
  if (optionalArguments && [(NSMutableArray *)optionalArguments count])
  {
    [v5 appendString:@"Options:\n"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = self->_optionalArguments;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) fullUsage];
          [v5 appendFormat:@"\t%@\n", v12];
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }
  }
  positionalArguments = self->_positionalArguments;
  if (positionalArguments && [(NSMutableArray *)positionalArguments count])
  {
    [v5 appendString:@"Positional Arguments:\n"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = self->_positionalArguments;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = [*(id *)(*((void *)&v20 + 1) + 8 * j) fullUsage];
          [v5 appendFormat:@"\t%@\n", v18];
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }
  }

  return v5;
}

- (id)shortUsageWithPrefix:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F089D8] stringWithFormat:@"%@ ", a3];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = self->_positionalArguments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v29 + 1) + 8 * i) shortUsage];
        [v4 appendFormat:@"%@ ", v9];
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = self->_optionalArguments;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = [*(id *)(*((void *)&v25 + 1) + 8 * j) shortUsage];
        [v4 appendFormat:@"%@ ", v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v11);
  }

  if ([(NSMutableArray *)self->_subCommands count])
  {
    objc_msgSend(v4, "appendString:", @" (");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = self->_subCommands;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          BOOL v19 = [*(id *)(*((void *)&v21 + 1) + 8 * k) name];
          [v4 appendFormat:@"%@|", v19];
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }

    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    [v4 appendString:@""]);
  }

  return v4;
}

- (id)subCommandsUsageWithPrefix:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  [v4 appendFormat:@"%@: %@\n", self->_name, self->_descriptionString];
  [v4 appendString:@"Usage:\n"];
  if ([(NSMutableArray *)self->_subCommands count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = self->_subCommands;
    uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v9 = NSString;
          uint64_t v10 = [v8 name];
          uint64_t v11 = [v9 stringWithFormat:@"%@ %@", v23, v10];
          uint64_t v12 = [v8 shortUsageWithPrefix:v11];
          [v4 appendFormat:@"\t%@\n", v12];
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v5);
    }

    [v4 appendString:@"Commands:\n"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v13 = self->_subCommands;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          uint64_t v18 = [v17 name];
          BOOL v19 = (void *)[v18 mutableCopy];

          [v19 rightPaddToLength:45];
          long long v20 = [v17 descriptionString];
          [v4 appendFormat:@"\t%@%@\n", v19, v20];
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v14);
    }
  }

  return v4;
}

- (BOOL)verifyInputs
{
  return 1;
}

- (void)addSubCommand:(id)a3 withName:(id)a4 description:(id)a5 handler:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(NSMutableArray *)self->_subCommands addObject:v13];
  [v13 setName:v10];
  [v13 setDescriptionString:v11];
  [v13 setHandler:v12];
}

- (void)addSubCommand:(id)a3 withName:(SEL)a4 description:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  [(NSMutableArray *)self->_subCommands addObject:v10];
  uint64_t v9 = NSStringFromSelector(a4);
  [v10 setName:v9];

  [v10 setDescriptionString:v8];
}

- (void)addOptionalArgument:(id)a3
{
}

- (void)addPositionalArgument:(id)a3
{
}

- (void)addDescription:(id)a3
{
}

- (ADArgumentParserCommand)init
{
  v14.receiver = self;
  v14.super_class = (Class)ADArgumentParserCommand;
  v2 = [(ADArgumentParserCommand *)&v14 init];
  uint64_t v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = 0;

    handler = v3->_handler;
    v3->_handler = 0;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    positionalArguments = v3->_positionalArguments;
    v3->_positionalArguments = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    optionalArguments = v3->_optionalArguments;
    v3->_optionalArguments = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    subCommands = v3->_subCommands;
    v3->_subCommands = (NSMutableArray *)v11;
  }
  return v3;
}

@end