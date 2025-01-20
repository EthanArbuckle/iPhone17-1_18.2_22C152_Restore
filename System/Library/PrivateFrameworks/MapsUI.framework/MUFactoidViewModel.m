@interface MUFactoidViewModel
+ (id)darkSymbolColorWithGEOColor:(id)a3;
+ (id)symbolColorWithGEOColor:(id)a3;
+ (id)viewModelForFactoid:(id)a3;
+ (id)viewModelsFromFactoids:(id)a3;
+ (unint64_t)maximumFractionDigitsForFactoid:(id)a3;
+ (unint64_t)roundingModeForFactoid:(id)a3;
- (BOOL)shouldReverseForRTLLayout;
- (NSString)symbolName;
- (NSString)titleString;
- (NSString)valueString;
- (UIColor)darkSymbolColor;
- (UIColor)symbolColor;
- (id)buildSymbolWithFont:(id)a3;
@end

@implementation MUFactoidViewModel

- (NSString)titleString
{
  return (NSString *)&stru_1EE3BF360;
}

- (NSString)valueString
{
  return (NSString *)&stru_1EE3BF360;
}

- (id)buildSymbolWithFont:(id)a3
{
  return 0;
}

- (NSString)symbolName
{
  return 0;
}

- (UIColor)symbolColor
{
  return 0;
}

- (UIColor)darkSymbolColor
{
  return 0;
}

- (BOOL)shouldReverseForRTLLayout
{
  return 1;
}

+ (id)viewModelForFactoid:(id)a3
{
  id v4 = a3;
  if ([v4 shouldUseStructuredData])
  {
    if (![v4 unitType] || objc_msgSend(v4, "unitType") == 1)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      uint64_t v6 = 1;
      [v5 setNumberStyle:1];
      v7 = NSNumber;
      [v4 value];
      v8 = objc_msgSend(v7, "numberWithDouble:");
      v9 = [v5 stringFromNumber:v8];

      goto LABEL_8;
    }
    if ([v4 unitType] != 6)
    {
      v21 = [MEMORY[0x1E4F1CA20] currentLocale];
      v22 = [v21 objectForKey:*MEMORY[0x1E4F1C490]];
      char v23 = [v22 BOOLValue];

      id v24 = objc_alloc_init(MEMORY[0x1E4F28E30]);
      MUConfigureMeasurementFormatter(v24, v23, [v4 unitType], objc_msgSend(a1, "maximumFractionDigitsForFactoid:", v4), objc_msgSend(a1, "roundingModeForFactoid:", v4));
      [v4 value];
      v26 = MUFactoidMeasurementFormatterForValue([v4 unitType], v25);
      v27 = (void *)[v26 copy];
      if ((v23 & 1) == 0)
      {
        [v4 value];
        uint64_t v29 = MUFactoidImpericalMeasurementFormatterForValue([v4 unitType], v28);

        v27 = (void *)v29;
      }
      v30 = [v21 languageCode];
      if ([v30 isEqualToString:@"en"])
      {
        v31 = [v21 objectForKey:*MEMORY[0x1E4F1C440]];
        int v32 = [v31 isEqualToString:*MEMORY[0x1E4F1C458]];
      }
      else
      {
        int v32 = 0;
      }

      v33 = [v27 unit];
      v9 = MUConvertedFormattedString(v26, v33, v24, v32);

      goto LABEL_7;
    }
    [v4 value];
    uint64_t v10 = MUConvertedFormattedDurationString(v20);
  }
  else
  {
    uint64_t v10 = [v4 unstructuredValue];
  }
  v9 = (void *)v10;
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  v11 = [v4 color];
  v12 = [a1 symbolColorWithGEOColor:v11];

  v13 = [v4 color];
  v14 = [a1 darkSymbolColorWithGEOColor:v13];

  v15 = [MUTextFactoidViewModel alloc];
  v16 = [v4 title];
  v17 = [v4 symbolName];
  v18 = [(MUTextFactoidViewModel *)v15 initWithTitle:v16 valueString:v9 symbolName:v17 symbolColor:v12 darkSymbolColor:v14 shouldReverseForRTLLayout:v6];

  return v18;
}

+ (id)viewModelsFromFactoids:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[MUFactoidViewModel viewModelForFactoid:](MUFactoidViewModel, "viewModelForFactoid:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

+ (id)symbolColorWithGEOColor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    switch([v3 systemColor])
    {
      case 1u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemCyanColor];
        break;
      case 2u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
        break;
      case 3u:
      case 4u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        break;
      default:
        goto LABEL_4;
    }
    uint64_t v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)darkSymbolColorWithGEOColor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    switch([v3 systemColor])
    {
      case 1u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemCyanColor];
        break;
      case 2u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
        break;
      case 3u:
      case 4u:
        uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        break;
      default:
        goto LABEL_4;
    }
    uint64_t v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    uint64_t v6 = 0;
  }

  return v6;
}

+ (unint64_t)maximumFractionDigitsForFactoid:(id)a3
{
  id v3 = a3;
  unint64_t v7 = 0;
  if ([v3 semantic] == 4 && objc_msgSend(v3, "unitType") == 4)
  {
    [v3 value];
    double v5 = v4;
    GEOConfigGetDouble();
    if (v5 <= v6) {
      unint64_t v7 = 1;
    }
  }

  return v7;
}

+ (unint64_t)roundingModeForFactoid:(id)a3
{
  id v3 = a3;
  if ([v3 semantic] == 4
    && [v3 unitType] == 4
    && ([v3 value], double v5 = v4, GEOConfigGetDouble(), v5 <= v6))
  {
    unint64_t v7 = 6;
  }
  else
  {
    unint64_t v7 = 4;
  }

  return v7;
}

@end