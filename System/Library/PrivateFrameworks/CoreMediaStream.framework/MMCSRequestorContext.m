@interface MMCSRequestorContext
+ (id)contextWithEngine:(id)a3 type:(int)a4;
- (BOOL)isEqual:(id)a3;
- (MMCSEngine)engine;
- (MMCSRequestorContext)initWithEngine:(id)a3 type:(int)a4;
- (char)authTokens;
- (char)signatures;
- (int)type;
- (unint64_t)count;
- (unint64_t)itemIDs;
- (unsigned)itemFlags;
- (void)dealloc;
- (void)setAuthTokens:(char *)a3;
- (void)setCount:(unint64_t)a3;
- (void)setEngine:(id)a3;
- (void)setItemFlags:(unsigned int *)a3;
- (void)setItemIDs:(unint64_t *)a3;
- (void)setSignatures:(char *)a3;
- (void)setType:(int)a3;
@end

@implementation MMCSRequestorContext

- (void).cxx_destruct
{
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setAuthTokens:(char *)a3
{
  self->_authTokens = a3;
}

- (char)authTokens
{
  return self->_authTokens;
}

- (void)setItemFlags:(unsigned int *)a3
{
  self->_itemFlags = a3;
}

- (unsigned)itemFlags
{
  return self->_itemFlags;
}

- (void)setItemIDs:(unint64_t *)a3
{
  self->_itemIDs = a3;
}

- (unint64_t)itemIDs
{
  return self->_itemIDs;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setSignatures:(char *)a3
{
  self->_signatures = a3;
}

- (char)signatures
{
  return self->_signatures;
}

- (void)setEngine:(id)a3
{
}

- (MMCSEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  return (MMCSEngine *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (void)dealloc
{
  free(self->_itemIDs);
  free(self->_itemFlags);
  free(self->_signatures);
  if (self->_count)
  {
    unint64_t v3 = 0;
    do
      free(self->_authTokens[v3++]);
    while (v3 < self->_count);
  }
  free(self->_authTokens);
  v4.receiver = self;
  v4.super_class = (Class)MMCSRequestorContext;
  [(MMCSRequestorContext *)&v4 dealloc];
}

- (MMCSRequestorContext)initWithEngine:(id)a3 type:(int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MMCSRequestorContext;
  v7 = [(MMCSRequestorContext *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_engine, v6);
    v8->_type = a4;
  }

  return v8;
}

+ (id)contextWithEngine:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[MMCSRequestorContext alloc] initWithEngine:v5 type:v4];

  return v6;
}

@end