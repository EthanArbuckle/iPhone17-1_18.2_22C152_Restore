@interface DACActivityDescriptor
+ (BOOL)supportsSecureCoding;
+ (DACActivityDescriptor)activityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5;
+ (id)comparator;
+ (id)localOnlyActivityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalOnly;
- (DACActivityDescriptor)initWithCoder:(id)a3;
- (DACUnknownActivityPolicy)policy;
- (NSString)identifier;
- (id)_initWithIdentifier:(void *)a3 priority:(void *)a4 policy:(char)a5 localOnly:;
- (id)description;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACActivityDescriptor

+ (DACActivityDescriptor)activityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = -[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)[DACActivityDescriptor alloc], v8, (void *)a4, v7, 0);

  return (DACActivityDescriptor *)v9;
}

- (id)_initWithIdentifier:(void *)a3 priority:(void *)a4 policy:(char)a5 localOnly:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)DACActivityDescriptor;
    a1 = (id *)objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v11 = [v9 copy];
      id v12 = a1[2];
      a1[2] = (id)v11;

      a1[3] = a3;
      objc_storeStrong(a1 + 4, a4);
      *((unsigned char *)a1 + 8) = a5;
    }
  }

  return a1;
}

+ (id)localOnlyActivityDescriptorWithIdentifier:(id)a3 priority:(unint64_t)a4 policy:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = -[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)[DACActivityDescriptor alloc], v8, (void *)a4, v7, 1);

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DACActivityDescriptor *)self identifier];
  unint64_t v7 = [(DACActivityDescriptor *)self priority];
  id v8 = [(DACActivityDescriptor *)self policy];
  uint64_t v9 = [v8 options];
  BOOL v10 = [(DACActivityDescriptor *)self isLocalOnly];
  uint64_t v11 = 78;
  if (v10) {
    uint64_t v11 = 89;
  }
  id v12 = [v3 stringWithFormat:@"<%@: %p, %@, pri(%lu) pol(%lu) local(%c)>", v5, self, v6, v7, v9, v11];

  return v12;
}

- (DACActivityDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priority"];
    unint64_t v7 = (void *)[v6 unsignedIntegerValue];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"policy"];
    uint64_t v9 = (DACActivityDescriptor *)-[DACActivityDescriptor _initWithIdentifier:priority:policy:localOnly:]((id *)&self->super.isa, v5, v7, v8, [v4 decodeBoolForKey:@"localOnly"]);

    self = v5;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:1 forKey:@"version"];
  id v4 = [(DACActivityDescriptor *)self identifier];
  [v7 encodeObject:v4 forKey:@"identifier"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DACActivityDescriptor priority](self, "priority"));
  [v7 encodeObject:v5 forKey:@"priority"];

  v6 = [(DACActivityDescriptor *)self policy];
  [v7 encodeObject:v6 forKey:@"policy"];

  objc_msgSend(v7, "encodeBool:forKey:", -[DACActivityDescriptor isLocalOnly](self, "isLocalOnly"), @"localOnly");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DACActivityDescriptor *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (self == v4)
  {
    LOBYTE(self) = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    if (self)
    {
      id v7 = [(DACActivityDescriptor *)self identifier];
      id v8 = [(DACActivityDescriptor *)v6 identifier];
      if ([v7 isEqualToString:v8]
        && (unint64_t v9 = [(DACActivityDescriptor *)self priority],
            v9 == [(DACActivityDescriptor *)v6 priority]))
      {
        BOOL v10 = [(DACActivityDescriptor *)self policy];
        uint64_t v11 = [(DACActivityDescriptor *)v6 policy];
        if ([v10 isEqual:v11])
        {
          BOOL v12 = [(DACActivityDescriptor *)self isLocalOnly];
          LODWORD(self) = v12 ^ [(DACActivityDescriptor *)v6 isLocalOnly] ^ 1;
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(self) = 0;
  }
LABEL_16:

  return (char)self;
}

- (unint64_t)hash
{
  v2 = [(DACActivityDescriptor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)comparator
{
  return &__block_literal_global;
}

uint64_t __35__DACActivityDescriptor_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 priority];
  unint64_t v6 = [v4 priority];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (DACUnknownActivityPolicy)policy
{
  return self->_policy;
}

- (BOOL)isLocalOnly
{
  return self->_localOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end