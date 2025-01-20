@interface MLModelStructureProgramNamedValueType
- (MLModelStructureProgramNamedValueType)initWithMILNamedValueType:(const void *)a3;
- (MLModelStructureProgramNamedValueType)initWithName:(id)a3 type:(id)a4;
- (MLModelStructureProgramValueType)type;
- (NSString)name;
@end

@implementation MLModelStructureProgramNamedValueType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (MLModelStructureProgramValueType)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (MLModelStructureProgramNamedValueType)initWithMILNamedValueType:(const void *)a3
{
  v5 = NSString;
  uint64_t Name = MIL::IRNamedValueType::GetName((MIL::IRNamedValueType *)a3);
  if (*(char *)(Name + 23) >= 0) {
    uint64_t v7 = Name;
  }
  else {
    uint64_t v7 = *(void *)Name;
  }
  v8 = [v5 stringWithUTF8String:v7];
  v9 = [[MLModelStructureProgramValueType alloc] initWithMILValueType:MIL::IRNamedValueType::GetType((MIL::IRNamedValueType *)a3)];
  v10 = [(MLModelStructureProgramNamedValueType *)self initWithName:v8 type:v9];

  return v10;
}

- (MLModelStructureProgramNamedValueType)initWithName:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelStructureProgramNamedValueType;
  v8 = [(MLModelStructureProgramNamedValueType *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_type, a4);
  }

  return v8;
}

@end