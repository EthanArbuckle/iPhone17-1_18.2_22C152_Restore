@interface EKEventEditableDetailGroup
- (id)itemAtIndex:(unint64_t)a3;
@end

@implementation EKEventEditableDetailGroup

- (id)itemAtIndex:(unint64_t)a3
{
  return [(EKEventDetailGroup *)self itemAtIndex:a3 subitemIndex:0];
}

@end