@interface CNUICarPlayNavigationListStyleProvider
- (BOOL)showCellSeparator;
- (double)cellContentViewBottomAnchorConstraintConstant;
- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant;
- (double)cellUserActionLeftMargin;
- (double)detailCellContentViewBottomAnchorConstraintConstant;
- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant;
- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant;
- (id)actionIconFillColor;
- (id)actionIconFillHighlightedColor;
- (id)cellBackgroundColor;
- (id)cellBackgroundExpandedColor;
- (id)cellBackgroundHighlightedColor;
- (id)cellSubtitleTextColor;
- (id)cellSubtitleTextHighlightedColor;
- (id)cellTitleFont;
- (id)cellTitleTextColor;
- (id)cellTitleTextHighlightedColor;
- (id)detailCellSubtitleFont;
- (id)detailCellSubtitleTextColor;
- (id)detailCellSubtitleTextHighlightedColor;
- (id)detailCellTitleFont;
- (id)detailCellTitleTextColor;
- (id)detailCellTitleTextHighlightedColor;
@end

@implementation CNUICarPlayNavigationListStyleProvider

- (BOOL)showCellSeparator
{
  return 0;
}

- (double)detailCellContentViewBottomAnchorConstraintConstant
{
  return 8.0;
}

- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 18.0;
}

- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 18.0;
}

- (double)cellContentViewBottomAnchorConstraintConstant
{
  return 16.0;
}

- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 28.0;
}

- (double)cellUserActionLeftMargin
{
  return 48.0;
}

- (id)detailCellSubtitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellSubtitleFont];
}

- (id)detailCellTitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellTitleFont];
}

- (id)cellTitleFont
{
  return +[CNUIFontRepository carPlayTableViewCellTitleFont];
}

- (id)actionIconFillHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewGlyphHighlightedColor];
}

- (id)actionIconFillColor
{
  return +[CNUIColorRepository carPlayTableViewGlyphColor];
}

- (id)detailCellSubtitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor];
}

- (id)detailCellSubtitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor];
}

- (id)detailCellTitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor];
}

- (id)detailCellTitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextColor];
}

- (id)cellSubtitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor];
}

- (id)cellSubtitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor];
}

- (id)cellTitleTextHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor];
}

- (id)cellTitleTextColor
{
  return +[CNUIColorRepository carPlayTableViewCellTitleTextColor];
}

- (id)cellBackgroundHighlightedColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundHighlightedColor];
}

- (id)cellBackgroundExpandedColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundColor];
}

- (id)cellBackgroundColor
{
  return +[CNUIColorRepository carPlayTableViewCellBackgroundColor];
}

@end