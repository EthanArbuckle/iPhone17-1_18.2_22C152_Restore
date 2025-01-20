@interface PKLRUCacheItem
@end

@implementation PKLRUCacheItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_prev, 0);
  objc_storeStrong((id *)&self->_next, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end