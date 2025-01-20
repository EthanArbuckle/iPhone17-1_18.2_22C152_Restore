@interface VSKeychainFetchRequest
- (BOOL)includesDataValues;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (VSKeychainFetchRequest)init;
- (VSOptional)itemKind;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fetchLimit;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setIncludesDataValues:(BOOL)a3;
- (void)setItemKind:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation VSKeychainFetchRequest

- (VSKeychainFetchRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSKeychainFetchRequest;
  v2 = [(VSKeychainFetchRequest *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    itemKind = v2->_itemKind;
    v2->_itemKind = v3;
  }
  return v2;
}

- (NSPredicate)predicate
{
  v2 = self->_predicate;
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    if (!v2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The predicate parameter must not be nil."];
      v2 = 0;
    }
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[VSKeychainFetchRequest allocWithZone:a3] init];
  v5 = [(VSKeychainFetchRequest *)self itemKind];
  objc_super v6 = [v5 forceUnwrapObject];
  v7 = (void *)[v6 copy];
  v8 = +[VSOptional optionalWithObject:v7];
  [(VSKeychainFetchRequest *)v4 setItemKind:v8];

  v9 = [(VSKeychainFetchRequest *)self predicate];
  [(VSKeychainFetchRequest *)v4 setPredicate:v9];

  v10 = [(VSKeychainFetchRequest *)self sortDescriptors];
  [(VSKeychainFetchRequest *)v4 setSortDescriptors:v10];

  [(VSKeychainFetchRequest *)v4 setFetchLimit:[(VSKeychainFetchRequest *)self fetchLimit]];
  [(VSKeychainFetchRequest *)v4 setIncludesDataValues:[(VSKeychainFetchRequest *)self includesDataValues]];
  return v4;
}

- (VSOptional)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (BOOL)includesDataValues
{
  return self->_includesDataValues;
}

- (void)setIncludesDataValues:(BOOL)a3
{
  self->_includesDataValues = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_itemKind, 0);
}

@end