@interface ALAssetsFilterInternal
- (int)filter;
- (void)setFilter:(int)a3;
@end

@implementation ALAssetsFilterInternal

- (void)setFilter:(int)a3
{
  self->_filter = a3;
}

- (int)filter
{
  return self->_filter;
}

@end