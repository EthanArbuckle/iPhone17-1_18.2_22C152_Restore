@interface _ExpandedMessageListCellLayoutValues
- (BOOL)isSubjectVisible;
- (double)_heightWithNumberOfSummaryLines:(int64_t)a3;
- (double)avatarSize;
- (double)defaultRowHeight;
- (double)topPadding;
- (id)addressFont;
- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4;
- (id)subjectFont;
- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3;
@end

@implementation _ExpandedMessageListCellLayoutValues

- (double)topPadding
{
  double result = self->super._topPadding;
  if (result == 2.22507386e-308)
  {
    v4 = [(_ExpandedMessageListCellLayoutValues *)self addressFont];
    [v4 _bodyLeading];
    double v6 = v5;
    [(MessageListCellLayoutValues *)self addressCapHeight];
    self->super._topPadding = round(v6 - v7);

    return self->super._topPadding;
  }
  return result;
}

- (id)subjectFont
{
  subjectFont = self->super._subjectFont;
  if (!subjectFont)
  {
    v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    double v5 = self->super._subjectFont;
    self->super._subjectFont = v4;

    subjectFont = self->super._subjectFont;
  }
  return subjectFont;
}

- (id)addressFont
{
  addressFont = self->super._addressFont;
  if (!addressFont)
  {
    v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    double v5 = self->super._addressFont;
    self->super._addressFont = v4;

    addressFont = self->super._addressFont;
  }
  return addressFont;
}

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
  if (a3 == 1) {
    objc_msgSend(MEMORY[0x1E4FB1618], "mailCellSelectionStateColorForInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->super._traitCollection, "userInterfaceLevel", 1, a4));
  }
  else {
  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "secondarySystemBackgroundColor", a3, a4);
  }
  return v4;
}

- (double)_heightWithNumberOfSummaryLines:(int64_t)a3
{
  v4 = [(_ExpandedMessageListCellLayoutValues *)self addressFont];
  [v4 _bodyLeading];

  double v5 = [(MessageListCellLayoutValues *)self summaryFont];
  [v5 _bodyLeading];

  UIRoundToViewScale();
  return result;
}

- (double)defaultRowHeight
{
  double result = self->super._defaultRowHeight;
  if (result == 2.22507386e-308)
  {
    [(_ExpandedMessageListCellLayoutValues *)self _heightWithNumberOfSummaryLines:[(_ExpandedMessageListCellLayoutValues *)self linesOfSummaryForCompactHeight:0]];
    self->super._defaultRowHeight = result;
  }
  return result;
}

- (BOOL)isSubjectVisible
{
  return 0;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_linesOfPreview", v3, v4);
  uint64_t v7 = 2;
  if (v6 > 2) {
    uint64_t v7 = v6;
  }
  return v7 - 1;
}

- (double)avatarSize
{
  [(MessageListCellLayoutValues *)self standardAvatarSize];
  return v2 * 0.75;
}

@end