@interface UITableViewCell(MessageUI)
- (void)_mf_setBackgroundConfigurationColor:()MessageUI;
- (void)mf_updateBackgroundColorForPopover:()MessageUI;
- (void)mf_updateContentConfigurationWithBlock:()MessageUI;
@end

@implementation UITableViewCell(MessageUI)

- (void)mf_updateContentConfigurationWithBlock:()MessageUI
{
  v9 = a3;
  v4 = [a1 contentConfiguration];
  v5 = (void *)[v4 copy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [a1 defaultContentConfiguration];
  }
  v8 = v7;

  v9[2](v9, v8);
  [a1 setContentConfiguration:v8];
}

- (void)_mf_setBackgroundConfigurationColor:()MessageUI
{
  id v11 = a3;
  v4 = [a1 backgroundConfiguration];
  v5 = (void *)[v4 copy];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  }
  v8 = v7;

  v9 = [v8 backgroundColor];
  char v10 = [v9 isEqual:v11];

  if ((v10 & 1) == 0)
  {
    [v8 setBackgroundColor:v11];
    [a1 setBackgroundConfiguration:v8];
  }
}

- (void)mf_updateBackgroundColorForPopover:()MessageUI
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] mailPopoverBackgroundCellColor];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    uint64_t v5 = [v6 backgroundColor];

    uint64_t v4 = v5;
  }
  id v7 = (id)v4;
  objc_msgSend(a1, "_mf_setBackgroundConfigurationColor:", v4);
}

@end