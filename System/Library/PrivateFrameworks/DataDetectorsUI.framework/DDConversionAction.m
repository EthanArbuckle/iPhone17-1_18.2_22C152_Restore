@interface DDConversionAction
+ (BOOL)actionAvailableForResult:(__DDResult *)a3;
+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4;
+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4 onlyTest:(BOOL)a5 forceSubMenu:(BOOL)a6;
- (BOOL)canBePerformedWhenDeviceIsLocked;
- (BOOL)conversionFailed;
- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6;
- (DDConversionAction)initWithValue:(double)a3 unit:(id)a4 targetUnit:(id)a5 context:(id)a6 ambiguousDetection:(BOOL)a7 result:(__DDResult *)a8;
- (id)_titleWithValue;
- (id)calculateResult;
- (id)commonInitWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6;
- (id)iconName;
- (id)localizedName;
- (id)menuIcon;
- (id)menuName;
- (id)quickActionTitle;
- (id)specialCaseActions;
- (id)subtitle;
- (unint64_t)menuItemattributes;
- (void)performFromView:(id)a3;
@end

@implementation DDConversionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetUnit, 0);
  objc_storeStrong((id *)&self->_forcedUnit, 0);
  objc_storeStrong((id *)&self->_calculateString, 0);
  objc_storeStrong((id *)&self->_calculateResult, 0);
  objc_storeStrong((id *)&self->_extractedUnit, 0);
  objc_storeStrong((id *)&self->_extractedCurrency, 0);
}

+ (BOOL)actionAvailableForResult:(__DDResult *)a3
{
  v3 = a3;
  if (a3)
  {
    if ([a1 isAvailable])
    {
      if (!DDResultHasType())
      {
        v8 = [a1 allActionsForResult:v3 context:0 onlyTest:1 forceSubMenu:0];
        LOBYTE(v3) = -[DDActionGroup count]((uint64_t)v8) != 0;

        return (char)v3;
      }
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 bundleIdentifier];
      char v7 = [v6 isEqualToString:@"com.apple.quicklook.extension.previewUI"];

      if ((v7 & 1) == 0) {
        DDResultCurrencyExtraction();
      }
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4 onlyTest:(BOOL)a5 forceSubMenu:(BOOL)a6
{
  BOOL v13 = a5;
  id v7 = a4;
  if (a3 && ((DDResultHasType() & 1) != 0 || DDResultHasType()))
  {
    v12 = +[DDActionGroup emptyGroup]();
    v8 = [v7 objectForKeyedSubscript:@"kDDContextNoRoomForSubtitlesKey"];
    [v8 BOOLValue];

    CFTypeRef v9 = specialCaseResultForResult((uint64_t)a3);
    if (v9)
    {
      v10 = +[DDConversionAction allActionsForResult:v9 context:v7 onlyTest:v13 forceSubMenu:1];
      -[DDActionGroup setInlinedGroup:]((uint64_t)v10, 1);
    }
    else
    {
      v10 = 0;
    }
    DDResultPhysicalUnitsExtraction();
  }
  return 0;
}

- (DDConversionAction)initWithValue:(double)a3 unit:(id)a4 targetUnit:(id)a5 context:(id)a6 ambiguousDetection:(BOOL)a7 result:(__DDResult *)a8
{
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DDConversionAction;
  v17 = [(DDAction *)&v20 initWithURL:0 result:0 context:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_targetUnit, a5);
    objc_storeStrong((id *)&v18->_extractedUnit, a4);
    v18->_extractedValue = a3;
    v18->_ambiguousDetection = a7;
    if (a8) {
      v18->super._result = (__DDResult *)CFRetain(a8);
    }
  }

  return v18;
}

+ (id)allActionsForResult:(__DDResult *)a3 context:(id)a4
{
  v4 = [a1 allActionsForResult:a3 context:a4 onlyTest:0 forceSubMenu:0];
  v5 = -[DDActionGroup flattenedActions]((uint64_t)v4);

  return v5;
}

- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)DDConversionAction;
    v10 = [(DDAction *)&v12 initWithURL:v8 result:a4 context:v9];
    self = v10;
    if (v10)
    {
      a4 = [(DDConversionAction *)v10 commonInitWithURL:v8 result:a4 context:v9 targetUnit:0];
    }
    else
    {
      a4 = 0;
    }
  }

  return (DDConversionAction *)a4;
}

- (DDConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)DDConversionAction;
    BOOL v13 = [(DDAction *)&v15 initWithURL:v10 result:a4 context:v11];
    self = v13;
    if (v13)
    {
      a4 = [(DDConversionAction *)v13 commonInitWithURL:v10 result:a4 context:v11 targetUnit:v12];
    }
    else
    {
      a4 = 0;
    }
  }

  return (DDConversionAction *)a4;
}

- (id)commonInitWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 targetUnit:(id)a6
{
  id v7 = a6;
  if (DDResultHasType())
  {
    DDResultPhysicalUnitsExtraction();
  }
  else if (DDResultHasType())
  {
    DDResultCurrencyExtraction();
  }

  return self;
}

- (unint64_t)menuItemattributes
{
  if (-[DDAction calloutFlavor]((uint64_t)self)) {
    return 1;
  }
  else {
    return [(DDConversionAction *)self conversionFailed];
  }
}

- (id)localizedName
{
  if (-[DDAction calloutFlavor]((uint64_t)self) || self->_extractedCurrency)
  {
    uint64_t v3 = [(DDConversionAction *)self _titleWithValue];
  }
  else
  {
    if (self->_calculateString)
    {
      v6 = [(DDConversionAction *)self calculateResult];
      id v7 = [v6 terms];
      id v8 = [v7 firstObject];
      id v9 = [v8 formattedUnit];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        DDLocalizedStringFromTable(@"Cannot Convert Value", @"Generic value conversion action menu title", @"Cannot Convert Value", @"Conversion");
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v4 = v11;

      goto LABEL_5;
    }
    uint64_t v3 = [(DDUIPhysicalUnit *)self->_targetUnit localizedUnitNameWithValue:self->_extractedUnit unit:self->_extractedValue];
  }
  v4 = (void *)v3;
LABEL_5:
  return v4;
}

- (id)_titleWithValue
{
  if (self->_calculateString)
  {
    v2 = [(DDConversionAction *)self calculateResult];
    uint64_t v3 = [v2 formattedResult];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      DDLocalizedStringFromTable(@"Cannot Convert Value", @"Generic value conversion action menu title", @"Cannot Convert Value", @"Conversion");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
  }
  else
  {
    v6 = [(DDUIPhysicalUnit *)self->_targetUnit localizedConvertedValueFrom:self->_extractedUnit unit:self->_extractedValue];
  }
  return v6;
}

- (id)subtitle
{
  if ((-[DDAction calloutFlavor]((uint64_t)self) & 1) != 0
    || [(DDConversionAction *)self conversionFailed])
  {
    uint64_t v3 = 0;
  }
  else if (self->_extractedCurrency)
  {
    uint64_t v3 = @"yahoo! finance";
  }
  else
  {
    uint64_t v3 = [(DDConversionAction *)self _titleWithValue];
  }
  return v3;
}

- (id)quickActionTitle
{
  if (self->_calculateString || self->_ambiguousDetection)
  {
    v2 = DDResultGetMatchedString();
  }
  else
  {
    v2 = -[DDUIPhysicalUnit localizedConvertedValueFrom:unit:](self->_extractedUnit, "localizedConvertedValueFrom:unit:", self->_extractedValue);
  }
  return v2;
}

- (id)calculateResult
{
  v17[1] = *MEMORY[0x1E4F143B8];
  calculateString = self->_calculateString;
  if (calculateString && !self->_calculateDidRun)
  {
    v4 = (void *)MEMORY[0x1E4F56918];
    uint64_t v16 = *MEMORY[0x1E4F568F0];
    v17[0] = &unk_1EF50FE40;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v6 = [v4 evaluate:calculateString options:v5];

    id v7 = [v6 bestConversion];
    if (v7)
    {
      id v8 = [v6 convertedTo:v7];
      calculateResult = self->_calculateResult;
      self->_calculateResult = v8;
    }
    if (!self->_calculateResult)
    {
      id v10 = [v6 conversions];
      id v11 = [v10 firstObject];
      id v12 = self->_calculateResult;
      self->_calculateResult = v11;
    }
    if (!self->_extractedCurrency)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v13 setMaximumFractionDigits:3];
      [v13 setUsesGroupingSeparator:1];
      [(CalculateResult *)self->_calculateResult setNumberFormatter:v13];
    }
    self->_calculateDidRun = 1;
  }
  v14 = self->_calculateResult;
  return v14;
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  if (![(DDConversionAction *)self conversionFailed])
  {
    if (self->_extractedCurrency) {
      [(DDConversionAction *)self _titleWithValue];
    }
    else {
    id v5 = [(DDConversionAction *)self subtitle];
    }
    v6 = (void *)MEMORY[0x1E4F42C50];
    uint64_t v7 = [v4 _dataOwnerForCopy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__DDConversionAction_performFromView___block_invoke;
    v9[3] = &unk_1E5A853B0;
    id v10 = v5;
    id v8 = v5;
    [v6 _performAsDataOwner:v7 block:v9];
  }
}

void __38__DDConversionAction_performFromView___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    v2 = [(id)*MEMORY[0x1E4F44510] identifier];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    v9[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v6 setItems:v5];
}

- (BOOL)conversionFailed
{
  if (!self->_calculateString) {
    return 0;
  }
  v2 = [(DDConversionAction *)self calculateResult];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)iconName
{
  if ([(DDConversionAction *)self conversionFailed]) {
    return 0;
  }
  else {
    return @"doc.on.doc";
  }
}

- (id)menuIcon
{
  BOOL v3 = (void *)MEMORY[0x1E4F42A80];
  id v4 = [(DDUIPhysicalUnit *)self->_extractedUnit group];
  id v5 = [v4 symbolNameForValue:self->_extractedUnit unit:self->_extractedValue];
  v6 = [v3 _systemImageNamed:v5];

  return v6;
}

- (id)menuName
{
  BOOL v3 = [(DDUIPhysicalUnit *)self->_extractedUnit localizedMenuTitleFormat:@"x"];
  id v4 = [(DDUIPhysicalUnit *)self->_extractedUnit localizedMenuTitleFormat:@"x"];
  id v5 = DDLocalizedStringFromTable(v3, (uint64_t)&stru_1EF5023D8, v4, @"Conversion");

  return v5;
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 1;
}

- (id)specialCaseActions
{
  BOOL v3 = (void *)specialCaseResultForResult((uint64_t)self->super._result);
  if (v3)
  {
    BOOL v3 = +[DDConversionAction allActionsForResult:v3 context:self->super._context onlyTest:0 forceSubMenu:0];
  }
  return v3;
}

@end