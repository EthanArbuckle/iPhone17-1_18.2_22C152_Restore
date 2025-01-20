@interface FSTaskOption
+ (BOOL)supportsSecureCoding;
+ (id)option:(id)a3 value:(id)a4;
+ (id)optionWithoutValue:(id)a3;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (FSTaskOption)initWithCoder:(id)a3;
- (FSTaskOption)initWithOption:(id)a3;
- (FSTaskOption)initWithOption:(id)a3 value:(id)a4;
- (FSTaskOption)initWithOption:(id)a3 value:(id)a4 hasValue:(BOOL)a5;
- (NSString)option;
- (NSString)optionValue;
- (id)originalArgv;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FSTaskOption

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
  [v5 encodeBool:self->_hasValue forKey:@"FSTaskOption.hasValue"];
  [v5 encodeObject:self->_option forKey:@"FSTaskOption.opt"];
  [v5 encodeObject:self->_optionValue forKey:@"FSTaskOption.val"];
}

- (FSTaskOption)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTaskOption.opt"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSTaskOption.val"];
  v7 = -[FSTaskOption initWithOption:value:hasValue:](self, "initWithOption:value:hasValue:", v5, v6, [v4 decodeBoolForKey:@"FSTaskOption.hasValue"]);

  return v7;
}

- (FSTaskOption)initWithOption:(id)a3 value:(id)a4 hasValue:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSTaskOption;
  v11 = [(FSTaskOption *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_hasValue = a5;
    objc_storeStrong((id *)&v11->_option, a3);
    objc_storeStrong((id *)&v12->_optionValue, a4);
  }

  return v12;
}

- (FSTaskOption)initWithOption:(id)a3 value:(id)a4
{
  return [(FSTaskOption *)self initWithOption:a3 value:a4 hasValue:1];
}

- (FSTaskOption)initWithOption:(id)a3
{
  return [(FSTaskOption *)self initWithOption:a3 value:&stru_26FFF08C0 hasValue:0];
}

+ (id)option:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithOption:v7 value:v6 hasValue:1];

  return v8;
}

+ (id)optionWithoutValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithOption:v4 value:&stru_26FFF08C0 hasValue:0];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FSTaskOption *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
    goto LABEL_22;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v11 = 0;
    goto LABEL_22;
  }
  id v6 = v5;
  id v7 = [(FSTaskOption *)self option];
  if (v7)
  {
    v8 = [(FSTaskOption *)self option];
    id v9 = [(FSTaskOption *)v6 option];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  v12 = [(FSTaskOption *)self optionValue];
  if (v12
    && ([(FSTaskOption *)v6 optionValue], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v14 = 1;
  }
  else
  {
    v15 = [(FSTaskOption *)self optionValue];
    if (v15)
    {
      BOOL v14 = 0;
    }
    else
    {
      v16 = [(FSTaskOption *)v6 optionValue];
      BOOL v14 = v16 == 0;
    }
    if (!v12) {
      goto LABEL_18;
    }
    v13 = 0;
  }

LABEL_18:
  v17 = [(FSTaskOption *)self optionValue];
  if (v17)
  {
    v18 = [(FSTaskOption *)self optionValue];
    v19 = [(FSTaskOption *)v6 optionValue];
    char v20 = [v18 isEqual:v19];
  }
  else
  {
    char v20 = 1;
  }

  char v11 = v10 & v14 & v20;
LABEL_22:

  return v11;
}

- (id)originalArgv
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSString *)self->_option length])
  {
    if ([(NSString *)self->_option length] <= 1) {
      v3 = @"-";
    }
    else {
      v3 = @"--";
    }
    uint64_t v4 = [(__CFString *)v3 stringByAppendingString:self->_option];
    id v5 = (void *)v4;
    if (self->_hasValue)
    {
      optionValue = self->_optionValue;
      uint64_t v13 = v4;
      BOOL v14 = optionValue;
      id v7 = (void *)MEMORY[0x263EFF8C0];
      v8 = &v13;
      uint64_t v9 = 2;
    }
    else
    {
      uint64_t v12 = v4;
      id v7 = (void *)MEMORY[0x263EFF8C0];
      v8 = &v12;
      uint64_t v9 = 1;
    }
    char v10 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v12, v13, v14);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263EFFA68];
  }
  return v10;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (NSString)option
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)optionValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionValue, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end