@interface ASMultilineSubtitleTableViewCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ASMultilineSubtitleTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(ASMultilineSubtitleTableViewCell *)self detailTextLabel];
  [v5 setNumberOfLines:0];

  v6.receiver = self;
  v6.super_class = (Class)ASMultilineSubtitleTableViewCell;
  [(ASMultilineSubtitleTableViewCell *)&v6 refreshCellContentsWithSpecifier:v4];
}

@end