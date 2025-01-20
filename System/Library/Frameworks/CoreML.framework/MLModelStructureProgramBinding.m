@interface MLModelStructureProgramBinding
- (MLModelStructureProgramBinding)initWithName:(id)a3;
- (MLModelStructureProgramBinding)initWithValue:(id)a3;
- (MLModelStructureProgramValue)value;
- (NSString)name;
@end

@implementation MLModelStructureProgramBinding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (MLModelStructureProgramValue)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (MLModelStructureProgramBinding)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramBinding;
  v6 = [(MLModelStructureProgramBinding *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

- (MLModelStructureProgramBinding)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramBinding;
  id v5 = [(MLModelStructureProgramBinding *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

@end