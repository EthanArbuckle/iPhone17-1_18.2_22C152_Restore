@interface CNUINavigationListStyleProviderImpl
- (BOOL)showCellSeparator;
- (UIColor)actionIconFillColor;
- (UIColor)actionIconFillHighlightedColor;
- (UIColor)cellBackgroundColor;
- (UIColor)cellBackgroundExpandedColor;
- (UIColor)cellBackgroundHighlightedColor;
- (UIColor)cellSubtitleTextColor;
- (UIColor)cellSubtitleTextHighlightedColor;
- (UIColor)cellTitleTextColor;
- (UIColor)cellTitleTextHighlightedColor;
- (UIColor)detailCellSubtitleTextColor;
- (UIColor)detailCellSubtitleTextHighlightedColor;
- (UIColor)detailCellTitleTextColor;
- (UIColor)detailCellTitleTextHighlightedColor;
- (UIFont)cellSubtitleFont;
- (UIFont)cellTitleFont;
- (UIFont)detailCellSubtitleFont;
- (UIFont)detailCellTitleFont;
- (double)cellContentViewBottomAnchorConstraintConstant;
- (double)cellSubtitleLabelFirstBaselineAnchorConstraintConstant;
- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant;
- (double)cellUserActionLeftMargin;
- (double)detailCellContentViewBottomAnchorConstraintConstant;
- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant;
- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant;
@end

@implementation CNUINavigationListStyleProviderImpl

- (BOOL)showCellSeparator
{
  return 1;
}

- (double)detailCellContentViewBottomAnchorConstraintConstant
{
  return 15.0;
}

- (double)detailCellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 20.0;
}

- (double)detailCellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 27.0;
}

- (double)cellContentViewBottomAnchorConstraintConstant
{
  return 24.0;
}

- (double)cellSubtitleLabelFirstBaselineAnchorConstraintConstant
{
  return 24.0;
}

- (double)cellTitleLabelFirstBaselineAnchorConstraintConstant
{
  return 38.0;
}

- (double)cellUserActionLeftMargin
{
  return 79.0;
}

- (UIFont)detailCellSubtitleFont
{
  return +[CNUIFontRepository navigationListDetailCellSubtitleFontRegular];
}

- (UIFont)detailCellTitleFont
{
  return +[CNUIFontRepository navigationListDetailCellTitleFontRegular];
}

- (UIFont)cellSubtitleFont
{
  return +[CNUIFontRepository navigationListCellSubtitleFontRegular];
}

- (UIFont)cellTitleFont
{
  return +[CNUIFontRepository navigationListCellTitleFontRegular];
}

- (UIColor)actionIconFillHighlightedColor
{
  return +[CNUIColorRepository navigationListActionIconFillHighlightedColorRegular];
}

- (UIColor)actionIconFillColor
{
  return +[CNUIColorRepository navigationListActionIconFillColorRegular];
}

- (UIColor)detailCellSubtitleTextHighlightedColor
{
  return 0;
}

- (UIColor)detailCellSubtitleTextColor
{
  return +[CNUIColorRepository navigationListDetailCellSubtitleTextColorRegular];
}

- (UIColor)detailCellTitleTextHighlightedColor
{
  return 0;
}

- (UIColor)detailCellTitleTextColor
{
  return +[CNUIColorRepository navigationListDetailCellTitleTextColorRegular];
}

- (UIColor)cellSubtitleTextHighlightedColor
{
  return 0;
}

- (UIColor)cellSubtitleTextColor
{
  return +[CNUIColorRepository navigationListCellSubtitleTextColorRegular];
}

- (UIColor)cellTitleTextHighlightedColor
{
  return 0;
}

- (UIColor)cellTitleTextColor
{
  return +[CNUIColorRepository navigationListCellTitleTextColorRegular];
}

- (UIColor)cellBackgroundHighlightedColor
{
  return +[CNUIColorRepository navigationListCellBackgroundHighlightedColorRegular];
}

- (UIColor)cellBackgroundExpandedColor
{
  return +[CNUIColorRepository navigationListCellBackgroundExpandedColorRegular];
}

- (UIColor)cellBackgroundColor
{
  return +[CNUIColorRepository navigationListCellBackgroundColorRegular];
}

@end