@interface NWConcrete_nw_storage_flush_item
- (void)dealloc;
@end

@implementation NWConcrete_nw_storage_flush_item

- (void)dealloc
{
  key = self->_key;
  if (key)
  {
    free(key);
    self->_key = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_storage_flush_item;
  [(NWConcrete_nw_storage_flush_item *)&v4 dealloc];
}

@end