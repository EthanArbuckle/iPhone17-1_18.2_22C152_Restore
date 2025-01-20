@interface CNEmailAddressSanitizationTask
- (CNEmailAddressSanitizationTask)initWithAddress:(id)a3;
- (id)description;
- (id)run:(id *)a3;
- (void)removeMailtoPrefix;
@end

@implementation CNEmailAddressSanitizationTask

- (CNEmailAddressSanitizationTask)initWithAddress:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNEmailAddressSanitizationTask;
  v5 = [(CNTask *)&v10 initWithName:@"CNEmailAddressSanitizationTask"];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"address" object:self->_address];
  v5 = [v3 build];

  return v5;
}

- (id)run:(id *)a3
{
  [(CNEmailAddressSanitizationTask *)self removeMailtoPrefix];
  address = self->_address;

  return address;
}

- (void)removeMailtoPrefix
{
  if ([(NSString *)self->_address hasPrefix:@"mailto:"])
  {
    id v7 = [MEMORY[0x1E4F29088] componentsWithString:self->_address];
    v3 = [v7 path];
    char v4 = off_1EE025420((uint64_t)&__block_literal_global_119, v3);

    if ((v4 & 1) == 0)
    {
      v5 = [v7 path];
      address = self->_address;
      self->_address = v5;
    }
  }
}

- (void).cxx_destruct
{
}

@end