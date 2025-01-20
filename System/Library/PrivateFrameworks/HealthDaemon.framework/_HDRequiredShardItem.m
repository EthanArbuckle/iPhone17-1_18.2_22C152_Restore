@interface _HDRequiredShardItem
+ (BOOL)supportsSecureCoding;
- (_HDRequiredShardItem)init;
- (_HDRequiredShardItem)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)initWithShardIdentfier:(uint64_t)a3 options:;
@end

@implementation _HDRequiredShardItem

- (void)initWithShardIdentfier:(uint64_t)a3 options:
{
  id v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_HDRequiredShardItem;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (_HDRequiredShardItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  id v3 = [NSString alloc];
  identifier = self->_identifier;
  id v5 = HKStringFromOntologyFeatureRequestOptions();
  uint64_t v6 = (void *)[v3 initWithFormat:@"(%@, %@)", identifier, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_options forKey:@"options"];
}

- (_HDRequiredShardItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDRequiredShardItem;
  id v5 = [(_HDRequiredShardItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_options = [v4 decodeIntegerForKey:@"options"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end