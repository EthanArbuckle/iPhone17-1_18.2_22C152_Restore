@interface AMSLRUCacheItem
- (AMSLRUCacheItem)initWithKey:(id)a3 object:(id)a4;
- (NSCopying)key;
@end

@implementation AMSLRUCacheItem

- (AMSLRUCacheItem)initWithKey:(id)a3 object:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSLRUCacheItem;
  v7 = [(AMSDoubleLinkedListNode *)&v11 initWithObject:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    key = v7->_key;
    v7->_key = (NSCopying *)v8;
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (NSCopying)key
{
  return self->_key;
}

@end