@interface AssistantSubtitleTableViewCell
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AssistantSubtitleTableViewCell

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AssistantSubtitleTableViewCell;
  id v4 = a3;
  [(PSTableCell *)&v9 refreshCellContentsWithSpecifier:v4];
  v5 = [(AssistantSubtitleTableViewCell *)self textLabel];
  v6 = [v4 name];
  [v5 setText:v6];

  v7 = [(AssistantSubtitleTableViewCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v7 setText:v8];
  [(AssistantSubtitleTableViewCell *)self setNeedsLayout];
}

@end