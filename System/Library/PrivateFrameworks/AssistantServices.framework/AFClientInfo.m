@interface AFClientInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFClientInfo)init;
- (AFClientInfo)initWithBuilder:(id)a3;
- (AFClientInfo)initWithCoder:(id)a3;
- (AFClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)processName;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int)processIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFClientInfo

- (void).cxx_destruct
{
}

- (NSString)processName
{
  return self->_processName;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t processIdentifier = self->_processIdentifier;
  id v7 = a3;
  v6 = [v4 numberWithInt:processIdentifier];
  [v7 encodeObject:v6 forKey:@"AFClientInfo::processIdentifier"];

  [v7 encodeObject:self->_processName forKey:@"AFClientInfo::processName"];
}

- (AFClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientInfo::processIdentifier"];
  uint64_t v6 = [v5 intValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFClientInfo::processName"];

  v8 = [(AFClientInfo *)self initWithProcessIdentifier:v6 processName:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFClientInfo *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int processIdentifier = self->_processIdentifier;
      if (processIdentifier == [(AFClientInfo *)v5 processIdentifier])
      {
        id v7 = [(AFClientInfo *)v5 processName];
        processName = self->_processName;
        BOOL v9 = processName == v7 || [(NSString *)processName isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_processIdentifier];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_processName hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFClientInfo;
  NSUInteger v5 = [(AFClientInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {int processIdentifier = %d, processName = %@}", v5, self->_processIdentifier, self->_processName];

  return v6;
}

- (id)description
{
  return [(AFClientInfo *)self _descriptionWithIndent:0];
}

- (AFClientInfo)initWithProcessIdentifier:(int)a3 processName:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AFClientInfo_initWithProcessIdentifier_processName___block_invoke;
  v10[3] = &unk_1E592C520;
  int v12 = a3;
  id v11 = v6;
  id v7 = v6;
  objc_super v8 = [(AFClientInfo *)self initWithBuilder:v10];

  return v8;
}

void __54__AFClientInfo_initWithProcessIdentifier_processName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v4 setProcessIdentifier:v3];
  [v4 setProcessName:*(void *)(a1 + 32)];
}

- (AFClientInfo)init
{
  return [(AFClientInfo *)self initWithBuilder:0];
}

- (AFClientInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFClientInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFClientInfo;
  NSUInteger v5 = [(AFClientInfo *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFClientInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFClientInfoMutation *)v7 isDirty])
    {
      v6->_int processIdentifier = [(_AFClientInfoMutation *)v7 getProcessIdentifier];
      objc_super v8 = [(_AFClientInfoMutation *)v7 getProcessName];
      uint64_t v9 = [v8 copy];
      processName = v6->_processName;
      v6->_processName = (NSString *)v9;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFClientInfoMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFClientInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFClientInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFClientInfo);
      v6->_int processIdentifier = [(_AFClientInfoMutation *)v5 getProcessIdentifier];
      id v7 = [(_AFClientInfoMutation *)v5 getProcessName];
      uint64_t v8 = [v7 copy];
      processName = v6->_processName;
      v6->_processName = (NSString *)v8;
    }
    else
    {
      id v6 = (AFClientInfo *)[(AFClientInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFClientInfo *)[(AFClientInfo *)self copy];
  }

  return v6;
}

@end