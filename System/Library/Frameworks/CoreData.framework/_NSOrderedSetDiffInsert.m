@interface _NSOrderedSetDiffInsert
- (id)description;
- (void)applyToSet:(id)a3;
@end

@implementation _NSOrderedSetDiffInsert

- (void)applyToSet:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Insert: %@ at index: %lu", self->super.super._diffObject, self->super._index];
}

@end