@interface FMWeakWrapper
- (BOOL)isEqual:(id)a3;
- (FMWeakWrapper)init;
- (FMWeakWrapper)initWithObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)object;
- (unint64_t)objectHash;
- (void)setObject:(id)a3;
- (void)setObjectHash:(unint64_t)a3;
@end

@implementation FMWeakWrapper

- (FMWeakWrapper)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(FMWeakWrapper *)self object];
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:v4];
  [v5 setObject:v4];
  objc_msgSend(v5, "setObjectHash:", -[FMWeakWrapper objectHash](self, "objectHash"));

  return v5;
}

- (FMWeakWrapper)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMWeakWrapper;
  v5 = [(FMWeakWrapper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(FMWeakWrapper *)v5 setObject:v4];
    -[FMWeakWrapper setObjectHash:](v6, "setObjectHash:", [v4 hash]);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FMWeakWrapper *)self objectHash];
  uint64_t v6 = [v4 objectHash];

  return v5 == v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(FMWeakWrapper *)self object];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> [%p]", v4, self, v5];

  return v6;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (unint64_t)objectHash
{
  return self->_objectHash;
}

- (void)setObjectHash:(unint64_t)a3
{
  self->_objectHash = a3;
}

- (void).cxx_destruct
{
}

@end