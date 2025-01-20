@interface MPUMutableContentItemIdentifierCollection
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setItemType:(unint64_t)a3;
@end

@implementation MPUMutableContentItemIdentifierCollection

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPUContentItemIdentifierCollection *)self _copyWithZone:a3 class:v5];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPUContentItemIdentifierCollection *)self _copyWithZone:a3 class:v5];
}

- (void)setItemType:(unint64_t)a3
{
  self->super._itemType = a3;
}

@end