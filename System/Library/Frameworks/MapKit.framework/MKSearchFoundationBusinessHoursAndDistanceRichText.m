@interface MKSearchFoundationBusinessHoursAndDistanceRichText
- (BOOL)isBusinessHoursResolved;
- (BOOL)isDistanceResolved;
- (BOOL)isRichTextResolved;
- (NSString)hoursString;
- (UIColor)hoursColor;
- (void)resolveBusinessHoursByMapItem:(id)a3 lines:(id)a4;
- (void)resolveDistanceNotFound;
- (void)resolveDistanceString:(id)a3 lines:(id)a4;
- (void)setBusinessHoursResolved:(BOOL)a3;
- (void)setDistanceResolved:(BOOL)a3;
- (void)setHoursColor:(id)a3;
- (void)setHoursString:(id)a3;
- (void)updateFormattedTextForLines:(id)a3;
@end

@implementation MKSearchFoundationBusinessHoursAndDistanceRichText

- (void)resolveBusinessHoursByMapItem:(id)a3 lines:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke;
  block[3] = &unk_1E54B8270;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C139870]();
  if ([*(id *)(a1 + 32) _hasBusinessHours])
  {
    v3 = [[_MKLocalizedHoursBuilder alloc] initWithMapItem:*(void *)(a1 + 32) localizedHoursStringOptions:1];
    v4 = [(_MKLocalizedHoursBuilder *)v3 localizedOperatingHours];
    [*(id *)(a1 + 40) setHoursString:v4];

    v5 = [*(id *)(a1 + 40) hoursString];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = *(void **)(a1 + 48);
      v8 = [*(id *)(a1 + 40) hoursString];
      [v7 addObject:v8];

      id v9 = [(_MKLocalizedHoursBuilder *)v3 hoursStateLabelColor];
      [*(id *)(a1 + 40) setHoursColor:v9];
    }
  }
  if ([*(id *)(a1 + 32) _hasPriceDescription])
  {
    id v10 = [*(id *)(a1 + 32) _priceDescription];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = *(void **)(a1 + 48);
      uint64_t v13 = [*(id *)(a1 + 32) _priceDescription];
LABEL_11:
      v18 = (void *)v13;
      [v12 addObject:v13];

      goto LABEL_12;
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) _priceRangeString];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [*(id *)(a1 + 32) _priceRangeString];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      id v12 = *(void **)(a1 + 48);
      uint64_t v13 = [*(id *)(a1 + 32) _priceRangeString];
      goto LABEL_11;
    }
  }
LABEL_12:
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke_2;
  v20[3] = &unk_1E54B8248;
  v19 = *(void **)(a1 + 48);
  v20[4] = *(void *)(a1 + 40);
  id v21 = v19;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

uint64_t __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBusinessHoursResolved:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 updateFormattedTextForLines:v3];
}

- (void)updateFormattedTextForLines:(id)a3
{
  id v23 = +[MKSearchFoundationResult styledStringFromStringArray:a3];
  v4 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self hoursString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self hoursString];
    uint64_t v7 = [v23 rangeOfString:v6];
    uint64_t v9 = v8;

    id v10 = objc_opt_new();
    uint64_t v11 = [v23 substringToIndex:v7];
    if ([v11 length])
    {
      id v12 = [MEMORY[0x1E4F9A0E0] textWithString:v11];
      [v10 addObject:v12];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F9A0E0];
    uint64_t v14 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self hoursString];
    v15 = [v13 textWithString:v14];

    v16 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self hoursColor];
    uint64_t v17 = [MEMORY[0x1E4F428B8] colorWithRed:0.949019611 green:0.286274523 blue:0.200000003 alpha:1.0];
    if ([v16 isEqual:v17])
    {
      [v15 setTextColor:1];
    }
    else
    {
      v18 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self hoursColor];
      v19 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.568627477 blue:0.0 alpha:1.0];
      if ([v18 isEqual:v19]) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 0;
      }
      [v15 setTextColor:v20];
    }
    [v10 addObject:v15];
    id v21 = [v23 substringFromIndex:v7 + v9];
    if ([v21 length])
    {
      v22 = [MEMORY[0x1E4F9A0E0] textWithString:v21];
      [v10 addObject:v22];
    }
    [(MKSearchFoundationRichText *)self setFormattedTextPieces:v10];
  }
  else
  {
    [(MKSearchFoundationRichText *)self setText:v23];
  }
}

- (void)resolveDistanceString:(id)a3 lines:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  if ([v7 count]) {
    [v7 insertObject:v6 atIndex:0];
  }
  else {
    [v7 addObject:v6];
  }

  [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self setDistanceResolved:1];
  [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self updateFormattedTextForLines:v7];
}

- (void)resolveDistanceNotFound
{
  [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self setDistanceResolved:1];
  if ([(MKSearchFoundationBusinessHoursAndDistanceRichText *)self isRichTextResolved])
  {
    [(MKSearchFoundationRichText *)self setCompletionHandlers:0];
  }
}

- (BOOL)isRichTextResolved
{
  BOOL v3 = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self isBusinessHoursResolved];
  if (v3)
  {
    LOBYTE(v3) = [(MKSearchFoundationBusinessHoursAndDistanceRichText *)self isDistanceResolved];
  }
  return v3;
}

- (BOOL)isBusinessHoursResolved
{
  return self->_businessHoursResolved;
}

- (void)setBusinessHoursResolved:(BOOL)a3
{
  self->_businessHoursResolved = a3;
}

- (BOOL)isDistanceResolved
{
  return self->_distanceResolved;
}

- (void)setDistanceResolved:(BOOL)a3
{
  self->_distanceResolved = a3;
}

- (NSString)hoursString
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHoursString:(id)a3
{
}

- (UIColor)hoursColor
{
  return (UIColor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHoursColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursColor, 0);

  objc_storeStrong((id *)&self->_hoursString, 0);
}

@end