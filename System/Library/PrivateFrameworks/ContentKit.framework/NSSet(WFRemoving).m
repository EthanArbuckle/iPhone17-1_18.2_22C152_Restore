@interface NSSet(WFRemoving)
- (id)setByRemovingObject:()WFRemoving;
@end

@implementation NSSet(WFRemoving)

- (id)setByRemovingObject:()WFRemoving
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 setWithSet:a1];
  [v6 removeObject:v5];

  v7 = [MEMORY[0x263EFFA08] setWithSet:v6];

  return v7;
}

@end