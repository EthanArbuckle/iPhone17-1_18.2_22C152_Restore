@interface CCUIMutableLayoutOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setItemEdgeSize:(double)a3;
- (void)setItemSpacing:(double)a3;
@end

@implementation CCUIMutableLayoutOptions

- (void)setItemEdgeSize:(double)a3
{
  self->super._itemEdgeSize = a3;
}

- (void)setItemSpacing:(double)a3
{
  self->super._itemSpacing = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CCUILayoutOptions alloc];

  return [(CCUILayoutOptions *)v4 _initWithLayoutOptions:self];
}

@end