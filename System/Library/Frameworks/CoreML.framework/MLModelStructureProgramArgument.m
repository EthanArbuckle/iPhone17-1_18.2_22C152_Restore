@interface MLModelStructureProgramArgument
- (MLModelStructureProgramArgument)initWithBindings:(id)a3;
- (MLModelStructureProgramArgument)initWithMILArguments:(const void *)a3;
- (NSArray)bindings;
@end

@implementation MLModelStructureProgramArgument

- (void).cxx_destruct
{
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (MLModelStructureProgramArgument)initWithMILArguments:(const void *)a3
{
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4];
  v6 = *(MIL::IRArgument ***)a3;
  v7 = (MIL::IRArgument **)*((void *)a3 + 1);
  if (*(MIL::IRArgument ***)a3 == v7)
  {
LABEL_10:
    self = [(MLModelStructureProgramArgument *)self initWithBindings:v5];
    v13 = self;
    goto LABEL_11;
  }
  while (1)
  {
    if ((*(uint64_t (**)(void))(*(void *)*v6 + 32))())
    {
      v8 = NSString;
      uint64_t Name = MIL::IRArgument::GetName(*v6);
      if (*(char *)(Name + 23) >= 0) {
        uint64_t v10 = Name;
      }
      else {
        uint64_t v10 = *(void *)Name;
      }
      v11 = [v8 stringWithUTF8String:v10];
      v12 = [[MLModelStructureProgramBinding alloc] initWithName:v11];
      [v5 addObject:v12];
      goto LABEL_9;
    }
    if (!(*(uint64_t (**)(void))(*(void *)*v6 + 40))()) {
      break;
    }
    v11 = [[MLModelStructureProgramValue alloc] initWithMILValue:MIL::IRArgument::GetValue(*v6)];
    v12 = [[MLModelStructureProgramBinding alloc] initWithValue:v11];
    [v5 addObject:v12];
LABEL_9:

    v6 += 2;
    if (v6 == v7) {
      goto LABEL_10;
    }
  }
  v15 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "This is a logic error, encountered unexpected value when constructing MLModelStructureProgramArgument.", v16, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"This is a logic error, encountered unexpected value when constructing MLModelStructureProgramArgument." format];
  v13 = 0;
LABEL_11:

  return v13;
}

- (MLModelStructureProgramArgument)initWithBindings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramArgument;
  v5 = [(MLModelStructureProgramArgument *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bindings = v5->_bindings;
    v5->_bindings = (NSArray *)v6;
  }
  return v5;
}

@end