@interface _NSOrderedSetDiffDelete
- (id)description;
- (void)applyToSet:(id)a3;
@end

@implementation _NSOrderedSetDiffDelete

- (void)applyToSet:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Delete: %@", self->super._diffObject];
}

@end