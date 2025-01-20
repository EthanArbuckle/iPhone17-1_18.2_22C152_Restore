@interface _MKScaleUnitsView
- (BOOL)canDisplaySegment:(unint64_t)a3;
- (BOOL)isRTL;
- (BOOL)useLightText;
- (NSNumberFormatter)floatNumberFormatter;
- (NSString)legendBaseString;
- (NSString)unitsString;
- (NSString)unpaddedUnitsString;
- (NSString)zeroUnitsString;
- (_MKScaleUnitsView)init;
- (double)_widthForString:(id)a3 attributes:(id)a4;
- (double)fontSize;
- (double)legendMarginLeft;
- (double)unitsWidth;
- (id)_legendStringForDistanceString:(id)a3 appendUnits:(BOOL)a4 index:(int)a5;
- (id)_uncachedLegendStringsForDistanceString:(id)a3;
- (void)_calculateLegend:(BOOL)a3;
- (void)clearCaches:(id)a3;
- (void)setFloatNumberFormatter:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setLegendBaseString:(id)a3;
- (void)setLegendMarginLeft:(double)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSegmentLengthInPixels:(double)a3;
- (void)setUnits:(id)a3;
- (void)setUnitsString:(id)a3;
- (void)setUnpaddedUnitsString:(id)a3;
- (void)setUseLightText:(BOOL)a3;
@end

@implementation _MKScaleUnitsView

- (_MKScaleUnitsView)init
{
  v16.receiver = self;
  v16.super_class = (Class)_MKScaleUnitsView;
  v2 = [(_MKScaleUnitsView *)&v16 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKScaleUnitsView *)v2 setBackgroundColor:v3];

    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    strings = v2->_strings;
    v2->_strings = v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:5];
    legendStringWidthCache = v2->_legendStringWidthCache;
    v2->_legendStringWidthCache = (NSMapTable *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    legendStringForDistanceStringCache = v2->_legendStringForDistanceStringCache;
    v2->_legendStringForDistanceStringCache = v8;

    for (uint64_t i = 0; i != 5; ++i)
    {
      v11 = v2->_strings;
      v12 = objc_alloc_init(_MKLegendString);
      [(NSMutableArray *)v11 addObject:v12];

      v13 = [(_MKScaleUnitsView *)v2 layer];
      v14 = [(NSMutableArray *)v2->_strings objectAtIndexedSubscript:i];
      [v13 addSublayer:v14];
    }
    [(_MKScaleUnitsView *)v2 setUseLightText:0];
    [(_MKScaleUnitsView *)v2 setClipsToBounds:0];
  }
  return v2;
}

- (void)clearCaches:(id)a3
{
}

- (double)_widthForString:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(NSMapTable *)self->_legendStringWidthCache objectForKey:v6];
    v9 = v8;
    if (v8)
    {
      [v8 doubleValue];
      double v11 = v10;
    }
    else
    {
      [v6 sizeWithAttributes:v7];
      double v11 = v12;
      legendStringWidthCache = self->_legendStringWidthCache;
      v14 = objc_msgSend(NSNumber, "numberWithDouble:");
      [(NSMapTable *)legendStringWidthCache setObject:v14 forKey:v6];
    }
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (void)setUnits:(id)a3
{
  id v15 = a3;
  v4 = [v15 objectAtIndexedSubscript:1];
  v5 = [(_MKScaleUnitsView *)self unpaddedUnitsString];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [v15 objectAtIndexedSubscript:1];
    v8 = [@" " stringByAppendingString:v7];
    [(_MKScaleUnitsView *)self setUnitsString:v8];

    v9 = [v15 objectAtIndexedSubscript:1];
    [(_MKScaleUnitsView *)self setUnpaddedUnitsString:v9];

    [(_MKScaleUnitsView *)self _widthForString:self->_unitsString attributes:self->_legendAttributes];
    self->_justUnitsWidth = v10;
    [(NSMutableDictionary *)self->_legendStringForDistanceStringCache removeAllObjects];
  }
  double v11 = [v15 objectAtIndexedSubscript:0];
  double v12 = [(_MKScaleUnitsView *)self legendBaseString];
  int v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v14 = [v15 objectAtIndexedSubscript:0];
    [(_MKScaleUnitsView *)self setLegendBaseString:v14];
  }
  [(_MKScaleUnitsView *)self _calculateLegend:v13 ^ 1u];
  [(_MKScaleUnitsView *)self setNeedsLayout];
  [(_MKScaleUnitsView *)self setNeedsDisplay];
}

- (void)_calculateLegend:(BOOL)a3
{
  [(_MKScaleUnitsView *)self bounds];
  CGFloat v43 = v5;
  CGFloat rect = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(_MKScaleUnitsView *)self legendMarginLeft];
  double v11 = v10;
  double segmentLengthInPixels = self->_segmentLengthInPixels;
  [(_MKScaleUnitsView *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v12 = 0;
  int v13 = 0;
  double v14 = 0.5;
  do
  {
    double v15 = 0.0;
    if (v12 && v12 != 3)
    {
      objc_super v16 = [(_MKScaleUnitsView *)self _legendStringForDistanceString:self->_legendBaseString appendUnits:0 index:(v12 + 1)];
      [(_MKScaleUnitsView *)self _widthForString:v16 attributes:self->_legendAttributes];
      double v15 = self->_justUnitsWidth + v17 * v14;
    }
    v48.origin.y = v43;
    double v18 = segmentLengthInPixels + v11;
    v48.origin.x = rect;
    v48.size.width = v7;
    v48.size.height = v9;
    BOOL v20 = segmentLengthInPixels + v11 + v15 > CGRectGetMaxX(v48) || v12 == 3;
    v21 = [(_MKScaleUnitsView *)self _legendStringForDistanceString:self->_legendBaseString appendUnits:0 index:v12];
    [(_MKScaleUnitsView *)self _widthForString:v21 attributes:self->_legendAttributes];
    if (v20)
    {
      v22 = [(_MKScaleUnitsView *)self _legendStringForDistanceString:self->_legendBaseString appendUnits:1 index:v12];
      [(_MKScaleUnitsView *)self _widthForString:v22 attributes:self->_legendAttributes];
      rect_8 = v22;
    }
    else
    {
      rect_8 = 0;
      v22 = v21;
    }
    v23 = -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", v12, 448);

    id v24 = v22;
    v25 = [v23 string];
    v26 = [v25 string];
    char v27 = [v26 isEqual:v24];

    if ((v27 & 1) == 0)
    {
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24 attributes:self->_legendAttributes];
      [v23 setString:v28];

      [v23 opacity];
      if (*(float *)&v29 != 1.0)
      {
        LODWORD(v29) = 1.0;
        [v23 setOpacity:v29];
      }
      [v23 sizeToFit];
      [v23 setNeedsDisplay];
    }
    [v23 frame];
    double v31 = v30;
    double v33 = v32;
    double v14 = 0.5;
    if (self->_RTL)
    {
      UIRoundToViewScale();
      double v35 = v34;
      v49.origin.y = v43;
      v49.origin.x = rect;
      v49.size.width = v7;
      v49.size.height = v9;
      double v36 = CGRectGetMaxX(v49) - (v31 + v35);
    }
    else
    {
      UIRoundToViewScale();
      double v36 = v37;
    }
    [(_MKScaleUnitsView *)self bounds];
    CGRectGetMaxY(v50);
    [v23 baselineDistanceFromBottom];
    UIRoundToViewScale();
    double v39 = v38;
    [v23 frame];
    v52.origin.x = v36;
    v52.origin.y = v39;
    v52.size.width = v31;
    v52.size.height = v33;
    if (!CGRectEqualToRect(v51, v52)) {
      objc_msgSend(v23, "setFrame:", v36, v39, v31, v33);
    }

    ++v12;
    int v13 = v23;
    double v11 = v18;
  }
  while (!v20);
  if ((unint64_t)(v12 - 1) > 3)
  {
    v40 = v23;
  }
  else
  {
    do
    {
      rect_8a = [*(id *)((char *)&self->super.super.super.isa + v41) objectAtIndexedSubscript:v12];

      [rect_8a setString:0];
      [rect_8a setOpacity:0.0];
      v40 = rect_8a;
      ++v12;
      v23 = rect_8a;
    }
    while (v12 != 5);
  }
}

- (BOOL)canDisplaySegment:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:a3 + 1];
  double v4 = [v3 string];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setSegmentLengthInPixels:(double)a3
{
  self->_double segmentLengthInPixels = a3;
}

- (void)setUseLightText:(BOOL)a3
{
  BOOL v3 = a3;
  v45[2] = *MEMORY[0x1E4F143B8];
  self->_useLightText = a3;
  id v5 = (id)*MEMORY[0x1E4F24628];
  v44[0] = *MEMORY[0x1E4F24620];
  uint64_t v6 = *MEMORY[0x1E4F24660];
  v43[0] = v5;
  uint64_t v7 = *MEMORY[0x1E4F246D8];
  v42[0] = v6;
  v42[1] = v7;
  double v8 = [NSNumber numberWithDouble:*MEMORY[0x1E4F246B8]];
  v43[1] = v8;
  CGFloat v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  v45[0] = v9;
  v44[1] = *MEMORY[0x1E4F245F0];
  double v10 = NSNumber;
  [(_MKScaleUnitsView *)self fontSize];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  v45[1] = v11;
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

  int v13 = CTFontDescriptorCreateWithAttributes(v12);
  CTFontRef v14 = CTFontCreateWithFontDescriptor(v13, 0.0, 0);
  CFRelease(v13);
  uint64_t v15 = *MEMORY[0x1E4F243F0];
  if (v3)
  {
    v41[0] = v14;
    uint64_t v16 = *MEMORY[0x1E4F24740];
    v40[0] = v15;
    v40[1] = v16;
    id v17 = [MEMORY[0x1E4F428B8] whiteColor];
    v41[1] = [v17 CGColor];
    v40[2] = *MEMORY[0x1E4F247B8];
    id v18 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v19 = [v18 CGColor];
    v40[3] = *MEMORY[0x1E4FB3AF8];
    v41[2] = v19;
    v41[3] = &unk_1ED97EB68;
    BOOL v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v41;
    v22 = v40;
  }
  else
  {
    v39[0] = v14;
    uint64_t v23 = *MEMORY[0x1E4F24740];
    v38[0] = v15;
    v38[1] = v23;
    id v17 = [MEMORY[0x1E4F428B8] colorWithRed:0.282352954 green:0.270588249 blue:0.254901975 alpha:1.0];
    v39[1] = [v17 CGColor];
    v38[2] = *MEMORY[0x1E4F247B8];
    id v18 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.5];
    uint64_t v24 = [v18 CGColor];
    v38[3] = *MEMORY[0x1E4FB3AF8];
    v39[2] = v24;
    v39[3] = &unk_1ED97EB68;
    BOOL v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = v39;
    v22 = v38;
  }
  v25 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:4];
  legendAttributes = self->_legendAttributes;
  self->_legendAttributes = v25;

  CFRelease(v14);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  char v27 = self->_strings;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        double v32 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_msgSend(v32, "setString:", 0, (void)v33);
        [v32 setNeedsDisplay];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v29);
  }

  [(_MKScaleUnitsView *)self setNeedsLayout];
  [(_MKScaleUnitsView *)self _calculateLegend:1];
}

- (BOOL)useLightText
{
  return self->_useLightText;
}

- (id)_uncachedLegendStringsForDistanceString:(id)a3
{
  v21[6] = *MEMORY[0x1E4F143B8];
  double v4 = [(NSNumberFormatter *)self->_floatNumberFormatter numberFromString:a3];
  [v4 floatValue];
  double v6 = v5;

  floatNumberFormatter = self->_floatNumberFormatter;
  double v8 = [NSNumber numberWithDouble:v6];
  CGFloat v9 = [(NSNumberFormatter *)floatNumberFormatter stringFromNumber:v8];

  double v10 = self->_floatNumberFormatter;
  double v11 = [NSNumber numberWithDouble:v6 + v6];
  CFDictionaryRef v12 = [(NSNumberFormatter *)v10 stringFromNumber:v11];

  int v13 = self->_floatNumberFormatter;
  CTFontRef v14 = [NSNumber numberWithDouble:v6 * 3.0];
  uint64_t v15 = [(NSNumberFormatter *)v13 stringFromNumber:v14];

  v21[0] = v9;
  v21[1] = v12;
  v21[2] = v15;
  uint64_t v16 = [v9 stringByAppendingString:self->_unitsString];
  v21[3] = v16;
  id v17 = [v12 stringByAppendingString:self->_unitsString];
  v21[4] = v17;
  id v18 = [v15 stringByAppendingString:self->_unitsString];
  v21[5] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];

  return v19;
}

- (NSString)zeroUnitsString
{
  zeroUnitsString = self->_zeroUnitsString;
  if (!zeroUnitsString)
  {
    double v4 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1ED97EB80 numberStyle:0];
    float v5 = self->_zeroUnitsString;
    self->_zeroUnitsString = v4;

    zeroUnitsString = self->_zeroUnitsString;
  }

  return zeroUnitsString;
}

- (id)_legendStringForDistanceString:(id)a3 appendUnits:(BOOL)a4 index:(int)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (a5 && self->_unitsString)
  {
    CGFloat v9 = [(NSMutableDictionary *)self->_legendStringForDistanceStringCache objectForKeyedSubscript:v8];
    if (!v9)
    {
      double v10 = [(_MKScaleUnitsView *)self _uncachedLegendStringsForDistanceString:v8];
      [(NSMutableDictionary *)self->_legendStringForDistanceStringCache setObject:v10 forKeyedSubscript:v8];
    }
    if (v6) {
      int v11 = 3;
    }
    else {
      int v11 = 0;
    }
    CFDictionaryRef v12 = [v9 objectAtIndexedSubscript:a5 + v11 - 1];
  }
  else
  {
    CFDictionaryRef v12 = [(_MKScaleUnitsView *)self zeroUnitsString];
  }

  return v12;
}

- (double)unitsWidth
{
  return self->_unitsWidth;
}

- (NSString)unitsString
{
  return self->_unitsString;
}

- (void)setUnitsString:(id)a3
{
}

- (NSString)unpaddedUnitsString
{
  return self->_unpaddedUnitsString;
}

- (void)setUnpaddedUnitsString:(id)a3
{
}

- (NSString)legendBaseString
{
  return self->_legendBaseString;
}

- (void)setLegendBaseString:(id)a3
{
}

- (NSNumberFormatter)floatNumberFormatter
{
  return self->_floatNumberFormatter;
}

- (void)setFloatNumberFormatter:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)legendMarginLeft
{
  return self->_legendMarginLeft;
}

- (void)setLegendMarginLeft:(double)a3
{
  self->_legendMarginLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroUnitsString, 0);
  objc_storeStrong((id *)&self->_floatNumberFormatter, 0);
  objc_storeStrong((id *)&self->_legendStringForDistanceStringCache, 0);
  objc_storeStrong((id *)&self->_legendStringWidthCache, 0);
  objc_storeStrong((id *)&self->_unpaddedUnitsString, 0);
  objc_storeStrong((id *)&self->_unitsString, 0);
  objc_storeStrong((id *)&self->_legendBaseString, 0);
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_legendAttributes, 0);
}

@end