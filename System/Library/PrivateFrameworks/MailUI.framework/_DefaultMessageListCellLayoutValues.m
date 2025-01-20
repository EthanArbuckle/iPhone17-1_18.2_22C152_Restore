@interface _DefaultMessageListCellLayoutValues
- (BOOL)isSubjectVisible;
- (double)compactRowHeight;
- (double)defaultRowHeight;
- (double)topPadding;
- (id)addressFont;
- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4;
- (id)subjectFont;
- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3;
@end

@implementation _DefaultMessageListCellLayoutValues

- (id)backgroundColorForSelectedState:(unint64_t)a3 disclosureEnabled:(BOOL)a4
{
  if (a4)
  {
    v4 = (void *)MEMORY[0x1E4FB1618];
    if (a3 != 1)
    {
      v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
LABEL_12:
      a2 = v5;
      goto LABEL_13;
    }
LABEL_11:
    objc_msgSend(v4, "mailCellSelectionStateColorForInterfaceLevel:", -[UITraitCollection userInterfaceLevel](self->super._traitCollection, "userInterfaceLevel"));
    v5 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    v5 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x1E4FB1618];
    goto LABEL_11;
  }
  if (a3) {
    goto LABEL_13;
  }
  if ([(MessageListCellLayoutValues *)self supportsPopover])
  {
    v5 = [MEMORY[0x1E4FB1618] mailPopoverBackgroundCellColor];
    goto LABEL_12;
  }
  a2 = 0;
LABEL_13:
  return (id)(id)a2;
}

- (BOOL)isSubjectVisible
{
  return 1;
}

- (id)addressFont
{
  addressFont = self->super._addressFont;
  if (!addressFont)
  {
    v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:2 options:0];
    v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
    v6 = self->super._addressFont;
    self->super._addressFont = v5;

    addressFont = self->super._addressFont;
  }
  return addressFont;
}

- (id)subjectFont
{
  subjectFont = self->super._subjectFont;
  if (!subjectFont)
  {
    id v4 = (id)*MEMORY[0x1E4FB2958];
    int64_t v5 = [(_DefaultMessageListCellLayoutValues *)self linesOfSummaryForCompactHeight:0];
    v6 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    if (!v5
      && (([(id)*MEMORY[0x1E4FB27E8] isEqualToString:v6] & 1) != 0
       || [(id)*MEMORY[0x1E4FB27C8] isEqualToString:v6]))
    {
      id v7 = (id)*MEMORY[0x1E4FB2960];

      id v4 = v7;
    }
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
    v9 = self->super._subjectFont;
    self->super._subjectFont = v8;

    subjectFont = self->super._subjectFont;
  }
  return subjectFont;
}

- (double)defaultRowHeight
{
  double result = self->super._defaultRowHeight;
  if (result == 2.22507386e-308)
  {
    [(MessageListCellLayoutValues *)self heightWithNumberOfSummaryLines:[(_DefaultMessageListCellLayoutValues *)self linesOfSummaryForCompactHeight:0]];
    self->super._defaultRowHeight = result;
  }
  return result;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  if (a3) {
    return 0;
  }
  else {
    return objc_msgSend(MEMORY[0x1E4F1CB18], "em_linesOfPreview");
  }
}

- (double)topPadding
{
  double result = self->super._topPadding;
  if (result == 2.22507386e-308)
  {
    id v4 = [(MessageListCellLayoutValues *)self summaryFont];
    [v4 _bodyLeading];
    UIRoundToViewScale();
    self->super._topPadding = v5;

    return self->super._topPadding;
  }
  return result;
}

- (double)compactRowHeight
{
  double result = self->super._compactRowHeight;
  if (result == 2.22507386e-308)
  {
    [(MessageListCellLayoutValues *)self heightWithNumberOfSummaryLines:0];
    self->super._compactRowHeight = result;
  }
  return result;
}

@end