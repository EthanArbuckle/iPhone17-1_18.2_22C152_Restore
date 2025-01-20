@interface _PFIndexCacheOffset
- (id)description;
@end

@implementation _PFIndexCacheOffset

- (id)description
{
  return (id)[NSString stringWithFormat:@"range (%lu, %lu), offset %ld", self->_range.location, self->_range.length, self->_offset];
}

@end