@interface _NSPersonNameComponentsStyleFormatterShort
- (BOOL)forceShortNameEnabled;
- (BOOL)isEnabled;
- (_NSPersonNameComponentsStyleFormatter)subFormatter;
- (_NSPersonNameComponentsStyleFormatterShort)initWithMasterFormatter:(id)a3;
- (_NSPersonNameComponentsStyleFormatterShortVariantGeneral)variantFormatter;
- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5;
- (id)abbreviatedKeys;
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
- (id)orderedKeysOfInterest;
- (int64_t)shortNameFormat;
- (void)dealloc;
- (void)setForceShortNameEnabled:(BOOL)a3;
- (void)setShortNameFormat:(int64_t)a3;
- (void)setSubFormatter:(id)a3;
@end

@implementation _NSPersonNameComponentsStyleFormatterShort

- (id)orderedKeysOfInterest
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = @"nickname";
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
    return [(_NSPersonNameComponentsStyleFormatter *)&v4 orderedKeysOfInterest];
  }
}

- (BOOL)isEnabled
{
  [(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  BOOL v4 = [(_NSPersonNameComponentsStyleFormatterShort *)self forceShortNameEnabled]
    || +[NSPersonNameComponentsFormatter _shortNameIsEnabled];
  LOBYTE(v5) = 1;
  char v6 = [(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __localizedRestrictionExistsForStyle:1];
  [(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    int v5 = ![(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __localizedRestrictionExistsForShortStyle:[(_NSPersonNameComponentsStyleFormatterShort *)self shortNameFormat]];
  }
  if (v4) {
    return v5 & ~v6;
  }
  else {
    return 0;
  }
}

- (_NSPersonNameComponentsStyleFormatterShort)initWithMasterFormatter:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
  result = [(_NSPersonNameComponentsStyleFormatter *)&v4 initWithMasterFormatter:a3];
  if (result) {
    result->_shortNameFormat = 0;
  }
  return result;
}

- (id)_formattedStringFromOrderedKeys:(id)a3 components:(id)a4 attributesByRange:(id)a5
{
  BOOL v8 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames];
  BOOL v9 = +[NSPersonNameComponentsFormatter _isCJKScript:a4];
  if (v8)
  {
    if (v9
      || +[NSPersonNameComponentsFormatter _isMixedScript:a4])
    {
      v10 = [[_NSPersonNameComponentsStyleFormatterLong alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];
    }
    else
    {
      v10 = [(_NSPersonNameComponentsStyleFormatterShort *)self variantFormatter];
    }
    [[(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter] setFallbackStyleFormatter:v10];
  }
  else if (v9)
  {
    [(_NSPersonNameComponentsStyleFormatterShort *)self setSubFormatter:[[_NSPersonNameComponentsStyleFormatterLong alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]]];
  }
  else if (!+[NSPersonNameComponentsFormatter _shortNameIsEnabled]&& ![(_NSPersonNameComponentsStyleFormatterShort *)self forceShortNameEnabled])
  {
    return 0;
  }
  [[(_NSPersonNameComponentsStyleFormatterShort *)self variantFormatter] setFallbackStyleFormatter:[[_NSPersonNameComponentsStyleFormatterShortNameSimpleFallback alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]]];
  v12 = [(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter];

  return [(_NSPersonNameComponentsStyleFormatter *)v12 stringFromComponents:a4 attributesByRange:a5];
}

- (_NSPersonNameComponentsStyleFormatter)subFormatter
{
  result = self->_subFormatter;
  if (!result)
  {
    if (+[NSPersonNameComponentsFormatter _shouldPreferNicknames])
    {
      result = [[_NSPersonNameComponentsStyleFormatterNicknameVariant alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];
    }
    else
    {
      result = [(_NSPersonNameComponentsStyleFormatterShort *)self variantFormatter];
    }
    self->_subFormatter = result;
  }
  return result;
}

- (_NSPersonNameComponentsStyleFormatterShortVariantGeneral)variantFormatter
{
  result = self->_variantFormatter;
  if (!result)
  {
    [(_NSPersonNameComponentsStyleFormatterShort *)self shortNameFormat];
    result = (_NSPersonNameComponentsStyleFormatterShortVariantGeneral *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMasterFormatter:", -[_NSPersonNameComponentsStyleFormatter masterFormatter](self, "masterFormatter"));
    self->_variantFormatter = result;
  }
  return result;
}

- (int64_t)shortNameFormat
{
  int64_t result = self->_shortNameFormat;
  if (!result)
  {
    int64_t result = [(NSPersonNameComponentsFormatter *)[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter] __computedShortNameFormat];
    self->_shortNameFormat = result;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSPersonNameComponentsStyleFormatterShort;
  [(_NSPersonNameComponentsStyleFormatter *)&v3 dealloc];
}

- (BOOL)forceShortNameEnabled
{
  return self->_forceShortNameEnabled;
}

- (void)setForceShortNameEnabled:(BOOL)a3
{
  self->_forceShortNameEnabled = a3;
}

- (void)setShortNameFormat:(int64_t)a3
{
  self->_shortNameFormat = a3;
}

- (void)setSubFormatter:(id)a3
{
  self->_subFormatter = (_NSPersonNameComponentsStyleFormatter *)a3;
}

- (id)abbreviatedKeys
{
  v2 = [(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter];
  if (v2) {
    [(_NSPersonNameComponentsStyleFormatter *)v2 abbreviatedKeys];
  }
  return 0;
}

- (id)keysOfInterest
{
  id result = self->super._keysOfInterest;
  if (!result)
  {
    id result = [[(_NSPersonNameComponentsStyleFormatterShort *)self subFormatter] keysOfInterest];
    self->super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  if (+[NSPersonNameComponentsFormatter _shouldPreferNicknames])
  {
    id result = [(_NSPersonNameComponentsStyleFormatterShort *)self variantFormatter];
    if (result)
    {
      return [(_NSPersonNameComponentsStyleFormatterShort *)self variantFormatter];
    }
  }
  else
  {
    uint64_t v4 = [[_NSPersonNameComponentsStyleFormatterMedium alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];
    return v4;
  }
  return result;
}

@end