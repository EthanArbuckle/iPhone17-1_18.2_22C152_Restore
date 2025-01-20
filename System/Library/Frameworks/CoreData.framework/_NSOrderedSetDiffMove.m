@interface _NSOrderedSetDiffMove
- (id)description;
- (void)applyToSet:(id)a3;
@end

@implementation _NSOrderedSetDiffMove

- (void)applyToSet:(id)a3
{
  [a3 removeObject:self->super.super._diffObject];
  id diffObject = self->super.super._diffObject;
  unint64_t index = self->super._index;

  [a3 insertObject:diffObject atIndex:index];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Move: %@ to index: %lu", self->super.super._diffObject, self->super._index];
}

@end