@interface ASMultilineSubtitleDisclosureTableCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ASMultilineSubtitleDisclosureTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(ASMultilineSubtitleDisclosureTableCell *)self detailTextLabel];
  [v5 setNumberOfLines:0];

  v6.receiver = self;
  v6.super_class = (Class)ASMultilineSubtitleDisclosureTableCell;
  [(ASMultilineSubtitleDisclosureTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
}

@end