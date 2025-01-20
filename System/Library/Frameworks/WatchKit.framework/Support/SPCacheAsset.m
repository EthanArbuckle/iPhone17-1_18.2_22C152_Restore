@interface SPCacheAsset
+ (id)fromProto:(id)a3;
+ (id)toProto:(id)a3;
- (NSString)key;
- (SPCacheAsset)initWithName:(id)a3 size:(unint64_t)a4 state:(unint64_t)a5 accessDate:(id)a6;
- (double)accessDate;
- (unint64_t)size;
- (unint64_t)state;
- (void)setAccessDate:(double)a3;
- (void)setKey:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation SPCacheAsset

- (SPCacheAsset)initWithName:(id)a3 size:(unint64_t)a4 state:(unint64_t)a5 accessDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPCacheAsset;
  v13 = [(SPCacheAsset *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_state = a5;
    v14->_size = a4;
    [v12 timeIntervalSinceReferenceDate];
    v14->_accessDate = v15;
  }

  return v14;
}

+ (id)toProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPProtoCacheAsset);
  v5 = [v3 key];
  [(SPProtoCacheAsset *)v4 setKey:v5];

  -[SPProtoCacheAsset setSize:](v4, "setSize:", [v3 size]);
  -[SPProtoCacheAsset setState:](v4, "setState:", [v3 state]);
  [v3 accessDate];
  double v7 = v6;

  [(SPProtoCacheAsset *)v4 setAccessDate:v7];

  return v4;
}

+ (id)fromProto:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SPCacheAsset);
  v5 = [v3 key];
  [(SPCacheAsset *)v4 setKey:v5];

  -[SPCacheAsset setState:](v4, "setState:", [v3 state]);
  -[SPCacheAsset setSize:](v4, "setSize:", [v3 size]);
  [v3 accessDate];
  double v7 = v6;

  [(SPCacheAsset *)v4 setAccessDate:v7];

  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)accessDate
{
  return self->_accessDate;
}

- (void)setAccessDate:(double)a3
{
  self->_accessDate = a3;
}

- (void).cxx_destruct
{
}

@end