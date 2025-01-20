@interface BMAccessDescriptor
- (BMAccessDescriptor)accessDescriptorWithAccessMode:(unint64_t)a3;
- (BMAccessDescriptor)initWithDomain:(unint64_t)a3 accessMode:(unint64_t)a4 resource:(id)a5;
- (BMResourceSpecifier)resource;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)domain;
- (unint64_t)hash;
- (unint64_t)mode;
@end

@implementation BMAccessDescriptor

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_mode];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_domain];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(BMResourceSpecifier *)self->_resource hash];

  return v7;
}

- (void).cxx_destruct
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BMAccessDescriptor)initWithDomain:(unint64_t)a3 accessMode:(unint64_t)a4 resource:(id)a5
{
  id v9 = a5;
  v10 = [v9 name];
  char IsPathSafe = BMIdentifierIsPathSafe(v10);

  if (IsPathSafe)
  {
    v17.receiver = self;
    v17.super_class = (Class)BMAccessDescriptor;
    v12 = [(BMAccessDescriptor *)&v17 init];
    v13 = v12;
    if (v12)
    {
      v12->_domain = a3;
      v12->_mode = a4;
      objc_storeStrong((id *)&v12->_resource, a5);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v15 = __biome_log_for_category(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMAccessDescriptor initWithDomain:accessMode:resource:](v15);
    }

    v14 = 0;
  }

  return v14;
}

- (BMResourceSpecifier)resource
{
  return self->_resource;
}

- (BMAccessDescriptor)accessDescriptorWithAccessMode:(unint64_t)a3
{
  if (self->_mode == a3) {
    v3 = self;
  }
  else {
    v3 = (BMAccessDescriptor *)[objc_alloc((Class)objc_opt_class()) initWithDomain:self->_domain accessMode:a3 resource:self->_resource];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_domain == v4[1]
    && self->_mode == v4[2]
    && [(BMResourceSpecifier *)self->_resource isEqual:v4[3]];

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = BMAccessModePrintableDescription(self->_mode);
  BOOL v5 = (void *)[v3 initWithFormat:@"<BMAccessDescriptor: %@ access to %@ in domain %lu>", v4, self->_resource, -[BMAccessDescriptor domain](self, "domain")];

  return v5;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void)initWithDomain:(os_log_t)log accessMode:resource:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B30A0000, log, OS_LOG_TYPE_ERROR, "BMAccessDescriptor passed invalid identifier", v1, 2u);
}

@end