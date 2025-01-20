@interface CNCardNamePickingGroup
- (id)displayItems;
@end

@implementation CNCardNamePickingGroup

- (id)displayItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CNCardNamePickingGroupActionItem);
  v4 = (void *)MEMORY[0x1E4F1B910];
  v5 = [(CNCardGroup *)self contact];
  v6 = [v4 stringFromContact:v5 style:0];
  [(CNCardNamePickingGroupActionItem *)v3 setDisplayName:v6];

  v9[0] = v3;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

@end