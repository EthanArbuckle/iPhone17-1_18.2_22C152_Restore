@interface MusicKit_SoftLinking_CatalogID
- (MusicKit_SoftLinking_CatalogID)initWithValue:(id)a3 kind:(int64_t)a4;
- (NSString)value;
- (id)description;
- (int64_t)kind;
@end

@implementation MusicKit_SoftLinking_CatalogID

- (void).cxx_destruct
{
}

- (MusicKit_SoftLinking_CatalogID)initWithValue:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_CatalogID;
  v7 = [(MusicKit_SoftLinking_CatalogID *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_kind = a4;
  }

  return v7;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)value
{
  return self->_value;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; value = \"%@\"", self->_value];
  unint64_t kind = self->_kind;
  if (kind > 8) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_26443FF68[kind];
  }
  [v6 appendFormat:@"; unint64_t kind = %@", v8];
  [v6 appendString:@">"];

  return v6;
}

@end