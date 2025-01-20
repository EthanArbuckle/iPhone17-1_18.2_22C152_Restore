@interface CalculateUnit
+ (CalculateUnit)unitWithID:(int)a3 unitsInfo:(id)a4 exponent:(int)a5;
+ (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6 unitType:(unint64_t)a7 name:(id)a8;
- (BOOL)contains:(id)a3;
- (BOOL)formatNextSmallest;
- (BOOL)isBaseUnit;
- (BOOL)isDenominator;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNumerator;
- (BOOL)isPreferredUnit;
- (CalculateUnit)nextSmallest;
- (CalculateUnitCategory)category;
- (NSLocale)displayNamesLocale;
- (NSString)displayName;
- (NSString)displayNames;
- (NSString)name;
- (NSString)shortName;
- (UnitInfo)unitInfo;
- (id)description;
- (id)locale;
- (id)localizedNameForFormat:(unint64_t)a3;
- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6;
- (int)exponent;
- (int64_t)compare:(id)a3;
- (unint64_t)unitType;
- (void)setCategory:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNames:(id)a3;
- (void)setDisplayNamesLocale:(id)a3;
- (void)setNextSmallest:(id)a3;
- (void)setShortName:(id)a3;
- (void)setUnitInfo:(id)a3;
@end

@implementation CalculateUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitInfo, 0);
  objc_storeStrong((id *)&self->_displayNamesLocale, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_nextSmallest, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setUnitInfo:(id)a3
{
}

- (UnitInfo)unitInfo
{
  return self->_unitInfo;
}

- (void)setDisplayNamesLocale:(id)a3
{
}

- (NSLocale)displayNamesLocale
{
  return self->_displayNamesLocale;
}

- (void)setDisplayNames:(id)a3
{
}

- (void)setNextSmallest:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (CalculateUnitCategory)category
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  return (CalculateUnitCategory *)WeakRetained;
}

- (unint64_t)unitType
{
  return self->_unitType;
}

- (int)exponent
{
  return self->_exponent;
}

- (void)setShortName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  if ([(CalculateUnit *)self exponent] == 1)
  {
    v3 = [(CalculateUnit *)self name];
  }
  else
  {
    v4 = NSString;
    v5 = [(CalculateUnit *)self name];
    v3 = [v4 stringWithFormat:@"%@^%d", v5, -[CalculateUnit exponent](self, "exponent")];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CalculateUnit *)self compare:v4] == 0;

  return v5;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([v4 containsString:@"|"])
    {
      BOOL v5 = 0;
    }
    else
    {
      v6 = [(CalculateUnit *)self displayNames];
      BOOL v5 = [v6 rangeOfString:v4 options:129] != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (NSString)displayNames
{
  v3 = +[Localize systemLocale];
  if (!self->_displayNames || ([(NSLocale *)self->_displayNamesLocale isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayNamesLocale, v3);
    id v4 = [(CalculateUnit *)self name];
    BOOL v5 = +[Localize localizationForLocale:v3];
    v6 = +[Localize localizedStringForKey:v4 value:0 table:@"LocalizableUnits" localization:v5];
    displayNames = self->_displayNames;
    self->_displayNames = v6;
  }
  v8 = self->_displayNames;

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int v5 = [(CalculateUnit *)self unitType];
  int v6 = [v4 unitType];
  if (v5 < v6) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = v5 > v6;
  }
  if (!v7)
  {
    int v8 = [(CalculateUnit *)self exponent];
    int v9 = [v4 exponent];
    if (v8 < v9) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = v8 > v9;
    }
  }

  return v7;
}

- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v11 = [(id)objc_opt_class() localizedNameForValue:v10 locale:v7 retainingFormat:a6 unitFormat:self->_unitType unitType:self->_name name:a3];

  return v11;
}

- (BOOL)formatNextSmallest
{
  return [(UnitInfo *)self->_unitInfo formatNextSmallest];
}

- (CalculateUnit)nextSmallest
{
  if (!self->_nextSmallest)
  {
    v3 = [(UnitInfo *)self->_unitInfo nextSmallest];

    if (v3)
    {
      id v4 = [(UnitInfo *)self->_unitInfo nextSmallest];
      int v5 = (CalculateUnit *)objc_opt_new();
      nextSmallest = self->_nextSmallest;
      self->_nextSmallest = v5;

      uint64_t v7 = [v4 name];
      int v8 = self->_nextSmallest;
      name = v8->_name;
      v8->_name = (NSString *)v7;

      self->_nextSmallest->_exponent = self->_exponent;
      objc_storeStrong((id *)&self->_nextSmallest->_unitInfo, v4);
      id v10 = [v4 typeInfo];
      v11 = [v10 name];
      v12 = [&unk_1F1872E28 objectForKeyedSubscript:v11];

      if (v12) {
        unint64_t v13 = (int)[v12 intValue];
      }
      else {
        unint64_t v13 = 1;
      }
      self->_nextSmallest->_unitType = v13;
    }
  }
  v14 = self->_nextSmallest;
  return v14;
}

- (BOOL)isPreferredUnit
{
  return [(UnitInfo *)self->_unitInfo isPreferredUnit];
}

- (BOOL)isBaseUnit
{
  return [(UnitInfo *)self->_unitInfo isBaseUnit];
}

- (BOOL)isDenominator
{
  return [(CalculateUnit *)self exponent] >> 31;
}

- (BOOL)isNumerator
{
  return [(CalculateUnit *)self exponent] >= 0;
}

- (id)localizedNameForFormat:(unint64_t)a3
{
  if (a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = 4;
  }
  int v5 = [(CalculateUnit *)self locale];
  int v6 = [(CalculateUnit *)self localizedNameForValue:v5 locale:0 retainingFormat:v4 unitFormat:1.0];

  return v6;
}

- (NSString)shortName
{
  shortName = self->_shortName;
  if (!shortName)
  {
    unint64_t v4 = [(CalculateUnit *)self localizedNameForFormat:2];
    int v5 = self->_shortName;
    self->_shortName = v4;

    shortName = self->_shortName;
  }
  return shortName;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    if (self->_unitType == 16)
    {
      unint64_t v4 = [(CalculateUnit *)self locale];
      int v5 = [v4 displayNameForKey:*MEMORY[0x1E4F1C408] value:self->_name];
      int v6 = self->_displayName;
      self->_displayName = v5;
    }
    else
    {
      unint64_t v4 = [(NSString *)self->_name stringByAppendingString:@" (Title)"];
      name = self->_name;
      int v6 = [(CalculateUnit *)self locale];
      int v8 = +[Localize localizationForLocale:v6];
      int v9 = +[Localize localizedStringForKey:v4 value:name table:@"LocalizableUnitsOutput" localization:v8];
      id v10 = self->_displayName;
      self->_displayName = v9;
    }
    displayName = self->_displayName;
  }
  v11 = displayName;
  return v11;
}

- (id)locale
{
  v2 = [(CalculateUnit *)self category];
  v3 = [v2 collection];
  unint64_t v4 = [v3 locales];
  int v5 = [v4 firstObject];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[Localize systemLocale];
  }
  int v8 = v7;

  return v8;
}

+ (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6 unitType:(unint64_t)a7 name:(id)a8
{
  BOOL v11 = a5;
  dst[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a8;
  v15 = +[Localize localizationForLocale:v13];
  unint64_t v16 = 4;
  if (a6) {
    unint64_t v16 = a6;
  }
  if (a7 == 16 && v16 == 4)
  {
    id v17 = [v13 localeIdentifier];
    [v17 UTF8String];

    unum_open();
    dst[0] = 0;
    u_uastrncpy((UChar *)dst, (const char *)[v14 UTF8String], 3);
    memset(src, 0, sizeof(src));
    unum_formatDoubleCurrency();
    BOOL v36 = v11;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    *(_OWORD *)v38 = 0u;
    u_austrcpy(v38, (const UChar *)src);
    v31 = [NSString stringWithUTF8String:v38];
    v37 = objc_msgSend(v31, "substringWithRange:", 0, 0);
    v32 = [v31 stringByReplacingOccurrencesOfString:v37 withString:&stru_1F1868970];
    v33 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v34 = [v32 stringByTrimmingCharactersInSet:v33];

    unum_close();
    if (v37)
    {
      if (v36)
      {
        id v35 = [v31 stringByReplacingOccurrencesOfString:v34 withString:@"%g"];
      }
      else
      {
        id v35 = v37;
      }
      v27 = v35;

      goto LABEL_18;
    }
    BOOL v11 = v36;
  }
  else if (v16 <= 3)
  {
    v18 = off_1E6365AE0[v16 - 1];
    goto LABEL_9;
  }
  v18 = @" (Long)";
LABEL_9:
  v19 = [v14 stringByAppendingString:v18];
  v20 = +[Localize localizedStringForKey:v19 value:&stru_1F1868970 table:@"LocalizableUnitsOutput" localization:v15];
  if ([v20 isEqualToString:v19])
  {
    uint64_t v21 = [@"%g " stringByAppendingString:v14];

    v20 = (void *)v21;
  }
  v22 = objc_msgSend(NSString, "localizedStringWithFormat:", v20, *(void *)&a3);
  v23 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%g", *(void *)&a3);
  uint64_t v24 = [v22 rangeOfString:v23];
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v26 = v22;
  }
  else
  {
    if (!v11)
    {
      v28 = objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", v24, v25, &stru_1F1868970);
      v29 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v27 = [v28 stringByTrimmingCharactersInSet:v29];

      goto LABEL_17;
    }
    objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", v24, v25, @"%g");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
LABEL_17:

LABEL_18:
  return v27;
}

+ (CalculateUnit)unitWithID:(int)a3 unitsInfo:(id)a4 exponent:(int)a5
{
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  int v9 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v10 = [v9 name];
  BOOL v11 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v10;

  *(_DWORD *)(v8 + 8) = a5;
  uint64_t v12 = [v7 objectAtIndexedSubscript:a3];

  id v13 = *(void **)(v8 + 80);
  *(void *)(v8 + 80) = v12;

  id v14 = [*(id *)(v8 + 80) typeInfo];
  v15 = [v14 name];
  unint64_t v16 = [&unk_1F1872E28 objectForKeyedSubscript:v15];

  if (v16) {
    uint64_t v17 = (int)[v16 intValue];
  }
  else {
    uint64_t v17 = 1;
  }
  *(void *)(v8 + 40) = v17;

  return (CalculateUnit *)(id)v8;
}

@end