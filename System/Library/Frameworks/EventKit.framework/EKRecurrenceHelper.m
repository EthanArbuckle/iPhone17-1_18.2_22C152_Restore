@interface EKRecurrenceHelper
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (EKRecurrenceHelper)initWithSpecifier:(id)a3;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)setPositions;
- (NSArray)weeksOfTheYear;
- (NSString)specifier;
- (id)_parseDaysOfWeek:(id *)a3 range:(id)a4;
- (id)_parseIndexList:(id *)a3 range:(id)a4;
- (void)_appendDaysOfTheWeek:(id)a3 toSpecifier:(id)a4;
- (void)_appendIndexList:(id)a3 toSpecifier:(id)a4 propertyKey:(unsigned __int16)a5;
- (void)_clearArrays;
- (void)_parseSpecifierIfNeeded;
- (void)_updateSpecifier;
- (void)revert;
- (void)setDaysOfTheMonth:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)setDaysOfTheYear:(id)a3;
- (void)setMonthsOfTheYear:(id)a3;
- (void)setSetPositions:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setWeeksOfTheYear:(id)a3;
@end

@implementation EKRecurrenceHelper

- (NSArray)weeksOfTheYear
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  v3 = (void *)[(NSArray *)self->_weeksOfTheYear copy];

  return (NSArray *)v3;
}

- (NSArray)setPositions
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  v3 = (void *)[(NSArray *)self->_setPositions copy];

  return (NSArray *)v3;
}

- (void)_parseSpecifierIfNeeded
{
  if (!self->_parsed)
  {
    v2 = self;
    [(EKRecurrenceHelper *)self _clearArrays];
    uint64_t v3 = [(NSString *)v2->_specifier length];
    if (!v3) {
      goto LABEL_74;
    }
    unint64_t v4 = v3;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v43 = 0u;
    CFStringRef specifier = (const __CFString *)v2->_specifier;
    CFStringRef theString = specifier;
    uint64_t v53 = 0;
    int64_t v54 = v3;
    CharactersPtr = CFStringGetCharactersPtr(specifier);
    CStringPtr = 0;
    v51 = (UniChar *)CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(specifier, 0x600u);
    }
    int64_t v8 = 0;
    int64_t v9 = 0;
    unsigned int v10 = 0;
    int64_t v55 = 0;
    int64_t v56 = 0;
    v52 = CStringPtr;
    v41 = v2;
    while (1)
    {
      if (v8 < 0 || (int64_t v11 = v54, v54 <= v8))
      {
        int v14 = 0;
        goto LABEL_12;
      }
      v12 = v51;
      if (v51)
      {
        int64_t v13 = v53 + v8;
      }
      else
      {
        if (v52)
        {
          int v14 = v52[v53 + v8];
          goto LABEL_18;
        }
        if (v56 <= v8 || (int64_t v32 = v55, v55 > v8))
        {
          int64_t v33 = v8 - 4;
          if ((unint64_t)v8 < 4) {
            int64_t v33 = 0;
          }
          if (v33 + 64 < v54) {
            int64_t v11 = v33 + 64;
          }
          int64_t v55 = v33;
          int64_t v56 = v11;
          v58.location = v53 + v33;
          v58.length = v11 - v33;
          CFStringGetCharacters(theString, v58, buffer);
          int64_t v32 = v55;
        }
        int64_t v13 = v8 - v32;
        v12 = buffer;
      }
      int v14 = v12[v13];
LABEL_18:
      if ((unsigned __int16)v14 != 61) {
        goto LABEL_12;
      }
      if (v8 - v9 != 1 && v8 - v9 < 3) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v10;
      }
      int64_t v17 = v8 + 1;
      if (v8 + 1 >= v4)
      {
        int v14 = 61;
        ++v8;
        goto LABEL_59;
      }
      int64_t v18 = ~v8;
      int64_t v19 = v8 + 65;
      unint64_t v20 = v8 + 1;
      while (1)
      {
        int64_t v21 = v8 + 1;
        uint64_t v22 = v20 >= 4 ? 4 : v20;
        if ((v21 & 0x8000000000000000) == 0)
        {
          int64_t v23 = v54;
          if (v54 > v21) {
            break;
          }
        }
        int v14 = 0;
LABEL_46:
        ++v20;
        --v18;
        ++v19;
        ++v8;
        if (v4 - 1 == v21)
        {
          int64_t v8 = v4;
          goto LABEL_58;
        }
      }
      if (v51)
      {
        int v14 = v51[v8 + 1 + v53];
      }
      else if (v52)
      {
        int v14 = v52[v53 + 1 + v8];
      }
      else
      {
        if (v56 <= v21 || (int64_t v24 = v55, v55 > v21))
        {
          uint64_t v25 = -v22;
          uint64_t v26 = v16;
          uint64_t v27 = v22 + v18;
          int64_t v28 = v19 - v22;
          int64_t v29 = v8 + v25;
          int64_t v30 = v29 + 1;
          int64_t v31 = v29 + 65;
          if (v31 >= v54) {
            int64_t v31 = v54;
          }
          int64_t v55 = v30;
          int64_t v56 = v31;
          if (v54 >= v28) {
            int64_t v23 = v28;
          }
          v57.length = v23 + v27;
          v57.location = v30 + v53;
          CFStringGetCharacters(theString, v57, buffer);
          uint64_t v16 = v26;
          int64_t v24 = v55;
        }
        int v14 = buffer[v8 + 1 - v24];
      }
      if ((unsigned __int16)v14 != 59) {
        goto LABEL_46;
      }
      ++v8;
      int v14 = 59;
LABEL_58:
      v2 = v41;
LABEL_59:
      if ((unsigned __int16)v16 > 0x52u)
      {
        switch((unsigned __int16)v16)
        {
          case 'S':
            uint64_t v39 = -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            setPositions = v2->_setPositions;
            v2->_setPositions = (NSArray *)v39;
            break;
          case 'W':
            uint64_t v40 = -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            setPositions = v2->_weeksOfTheYear;
            v2->_weeksOfTheYear = (NSArray *)v40;
            break;
          case 'Y':
            uint64_t v36 = -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            setPositions = v2->_daysOfTheYear;
            v2->_daysOfTheYear = (NSArray *)v36;
            break;
          default:
            goto LABEL_73;
        }
        goto LABEL_72;
      }
      switch((unsigned __int16)v16)
      {
        case 'D':
          uint64_t v37 = -[EKRecurrenceHelper _parseDaysOfWeek:range:](v2, "_parseDaysOfWeek:range:", buffer, v17, v8 - v17);
          setPositions = v2->_daysOfTheWeek;
          v2->_daysOfTheWeek = (NSArray *)v37;
LABEL_72:

          break;
        case 'M':
          uint64_t v38 = -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
          setPositions = v2->_daysOfTheMonth;
          v2->_daysOfTheMonth = (NSArray *)v38;
          goto LABEL_72;
        case 'O':
          uint64_t v34 = -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
          setPositions = v2->_monthsOfTheYear;
          v2->_monthsOfTheYear = (NSArray *)v34;
          goto LABEL_72;
      }
LABEL_73:
      unsigned int v10 = 0;
      int64_t v9 = v8 + 1;
LABEL_12:
      if (((++v8 - v9) | 2) == 3) {
        unsigned int v10 = v14;
      }
      if (v8 >= v4)
      {
LABEL_74:
        v2->_parsed = 1;
        return;
      }
    }
  }
}

- (NSArray)monthsOfTheYear
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  uint64_t v3 = (void *)[(NSArray *)self->_monthsOfTheYear copy];

  return (NSArray *)v3;
}

- (EKRecurrenceHelper)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKRecurrenceHelper;
  v5 = [(EKRecurrenceHelper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    CFStringRef specifier = v5->_specifier;
    v5->_CFStringRef specifier = (NSString *)v6;
  }
  return v5;
}

- (NSArray)daysOfTheYear
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  uint64_t v3 = (void *)[(NSArray *)self->_daysOfTheYear copy];

  return (NSArray *)v3;
}

- (NSArray)daysOfTheWeek
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  uint64_t v3 = (void *)[(NSArray *)self->_daysOfTheWeek copy];

  return (NSArray *)v3;
}

- (NSArray)daysOfTheMonth
{
  [(EKRecurrenceHelper *)self _parseSpecifierIfNeeded];
  uint64_t v3 = (void *)[(NSArray *)self->_daysOfTheMonth copy];

  return (NSArray *)v3;
}

- (void)_clearArrays
{
  daysOfTheWeek = self->_daysOfTheWeek;
  self->_daysOfTheWeek = 0;

  daysOfTheMonth = self->_daysOfTheMonth;
  self->_daysOfTheMonth = 0;

  daysOfTheYear = self->_daysOfTheYear;
  self->_daysOfTheYear = 0;

  weeksOfTheYear = self->_weeksOfTheYear;
  self->_weeksOfTheYear = 0;

  monthsOfTheYear = self->_monthsOfTheYear;
  self->_monthsOfTheYear = 0;

  setPositions = self->_setPositions;
  self->_setPositions = 0;
}

- (void)revert
{
  CFStringRef specifier = self->_specifier;
  self->_CFStringRef specifier = 0;

  daysOfTheWeek = self->_daysOfTheWeek;
  self->_daysOfTheWeek = 0;

  daysOfTheMonth = self->_daysOfTheMonth;
  self->_daysOfTheMonth = 0;

  daysOfTheYear = self->_daysOfTheYear;
  self->_daysOfTheYear = 0;

  weeksOfTheYear = self->_weeksOfTheYear;
  self->_weeksOfTheYear = 0;

  monthsOfTheYear = self->_monthsOfTheYear;
  self->_monthsOfTheYear = 0;

  setPositions = self->_setPositions;
  self->_setPositions = 0;

  *(_WORD *)&self->_dirty = 0;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(EKRecurrenceHelper *)self specifier];
    uint64_t v6 = [v4 specifier];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      v7 = [(EKRecurrenceHelper *)self specifier];
      int64_t v8 = [v4 specifier];
      char v9 = [v7 isEqualToString:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)specifier
{
  if (self->_dirty) {
    [(EKRecurrenceHelper *)self _updateSpecifier];
  }
  uint64_t v3 = (void *)[(NSString *)self->_specifier copy];

  return (NSString *)v3;
}

- (void)setSpecifier:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_specifier != (NSString *)v4)
  {
    int64_t v8 = (void *)v4;
    if (!v4 || (uint64_t v4 = objc_msgSend((id)v4, "isEqualToString:"), v5 = (uint64_t)v8, (v4 & 1) == 0))
    {
      *(_WORD *)&self->_dirty = 0;
      [(EKRecurrenceHelper *)self _clearArrays];
      uint64_t v6 = (NSString *)[v8 copy];
      CFStringRef specifier = self->_specifier;
      self->_CFStringRef specifier = v6;

      uint64_t v5 = (uint64_t)v8;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setDaysOfTheWeek:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self daysOfTheWeek];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    daysOfTheWeek = self->_daysOfTheWeek;
    self->_daysOfTheWeek = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)setDaysOfTheMonth:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self daysOfTheMonth];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    daysOfTheMonth = self->_daysOfTheMonth;
    self->_daysOfTheMonth = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)setDaysOfTheYear:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self daysOfTheYear];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    daysOfTheYear = self->_daysOfTheYear;
    self->_daysOfTheYear = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)setWeeksOfTheYear:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self weeksOfTheYear];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    weeksOfTheYear = self->_weeksOfTheYear;
    self->_weeksOfTheYear = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)setMonthsOfTheYear:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self monthsOfTheYear];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    monthsOfTheYear = self->_monthsOfTheYear;
    self->_monthsOfTheYear = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)setSetPositions:(id)a3
{
  id v8 = a3;
  id v4 = [(EKRecurrenceHelper *)self setPositions];

  uint64_t v5 = v8;
  if (v4 != v8)
  {
    uint64_t v6 = (NSArray *)[v8 copy];
    setPositions = self->_setPositions;
    self->_setPositions = v6;

    uint64_t v5 = v8;
    self->_dirty = 1;
  }
}

- (void)_updateSpecifier
{
  id v7 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
  if ([(NSArray *)self->_daysOfTheWeek count]) {
    [(EKRecurrenceHelper *)self _appendDaysOfTheWeek:self->_daysOfTheWeek toSpecifier:v7];
  }
  if ([(NSArray *)self->_daysOfTheMonth count]) {
    [(EKRecurrenceHelper *)self _appendIndexList:self->_daysOfTheMonth toSpecifier:v7 propertyKey:77];
  }
  if ([(NSArray *)self->_daysOfTheYear count]) {
    [(EKRecurrenceHelper *)self _appendIndexList:self->_daysOfTheYear toSpecifier:v7 propertyKey:89];
  }
  if ([(NSArray *)self->_weeksOfTheYear count]) {
    [(EKRecurrenceHelper *)self _appendIndexList:self->_weeksOfTheYear toSpecifier:v7 propertyKey:87];
  }
  if ([(NSArray *)self->_monthsOfTheYear count]) {
    [(EKRecurrenceHelper *)self _appendIndexList:self->_monthsOfTheYear toSpecifier:v7 propertyKey:79];
  }
  NSUInteger v3 = [(NSArray *)self->_setPositions count];
  id v4 = v7;
  if (v3)
  {
    [(EKRecurrenceHelper *)self _appendIndexList:self->_setPositions toSpecifier:v7 propertyKey:83];
    id v4 = v7;
  }
  uint64_t v5 = (NSString *)[v4 copy];
  CFStringRef specifier = self->_specifier;
  self->_CFStringRef specifier = v5;

  *(_WORD *)&self->_dirty = 256;
}

- (void)_appendDaysOfTheWeek:(id)a3 toSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int16 v15 = 68;
  if ([v6 length]) {
    [v6 appendString:@";"];
  }
  id v7 = [NSString stringWithCharacters:&v15 length:1];
  [v6 appendString:v7];

  [v6 appendString:@"="];
  uint64_t v8 = [v5 count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      int64_t v11 = [v5 objectAtIndex:i];
      v12 = v11;
      if (i) {
        int64_t v13 = @",%s%ld%s";
      }
      else {
        int64_t v13 = @"%s%ld%s";
      }
      if ([v11 weekNumber] <= 0) {
        int v14 = "";
      }
      else {
        int v14 = "+";
      }
      objc_msgSend(v6, "appendFormat:", v13, v14, objc_msgSend(v12, "weekNumber"), __CalDayStrings[objc_msgSend(v12, "dayOfTheWeek")]);
    }
  }
}

- (void)_appendIndexList:(id)a3 toSpecifier:(id)a4 propertyKey:(unsigned __int16)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  __int16 v17 = v5;
  if (v5)
  {
    if ([v8 length]) {
      [v9 appendString:@";"];
    }
    unsigned int v10 = [NSString stringWithCharacters:&v17 length:1];
    [v9 appendString:v10];

    [v9 appendString:@"="];
    uint64_t v11 = [v7 count];
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        int v14 = [v7 objectAtIndex:i];
        __int16 v15 = v14;
        if (i) {
          uint64_t v16 = @",%d";
        }
        else {
          uint64_t v16 = @"%d";
        }
        objc_msgSend(v9, "appendFormat:", v16, objc_msgSend(v14, "intValue"));
      }
    }
  }
}

- (id)_parseDaysOfWeek:(id *)a3 range:(id)a4
{
  if (a4.var1 >= 1)
  {
    int64_t var0 = a4.var0;
    int v6 = 0;
    char v7 = 0;
    char v8 = 0;
    int64_t v9 = a4.var0 + a4.var1;
    int64_t v10 = a4.var0 + a4.var1 - 1;
    long long v46 = &a3->var0[1];
    id v47 = 0;
    while (1)
    {
      if (var0 < 0 || (int64_t var1 = a3->var4.var1, var1 <= var0))
      {
        unsigned __int16 v13 = 0;
      }
      else
      {
        var2 = a3->var2;
        if (var2)
        {
          unsigned __int16 v13 = var2[a3->var4.var0 + var0];
        }
        else
        {
          var3 = a3->var3;
          if (var3)
          {
            unsigned __int16 v13 = var3[a3->var4.var0 + var0];
          }
          else
          {
            if (a3->var6 <= var0 || (int64_t var5 = a3->var5, var5 > var0))
            {
              int64_t v42 = var0 - 4;
              if ((unint64_t)var0 < 4) {
                int64_t v42 = 0;
              }
              if (v42 + 64 < var1) {
                int64_t var1 = v42 + 64;
              }
              a3->int64_t var5 = v42;
              a3->var6 = var1;
              v50.location = a3->var4.var0 + v42;
              v50.length = var1 - v42;
              CFStringGetCharacters(a3->var1, v50, a3->var0);
              int64_t var5 = a3->var5;
            }
            unsigned __int16 v13 = a3->var0[var0 - var5];
          }
        }
        if ((unsigned __int16)(v13 - 48) <= 9u)
        {
          int v6 = 10 * v6 + v13 - 48;
          char v7 = 1;
          goto LABEL_62;
        }
      }
      if ((v7 & 1) != 0 || v13 > 0x2Du || ((1 << v13) & 0x280100000000) == 0)
      {
        uint64_t v14 = var0 + 1;
        if (var0 < -1 || v14 >= v9 || (int64_t v15 = a3->var4.var1, v15 <= v14))
        {
          BOOL v18 = 0;
          BOOL v19 = v13 == 83;
        }
        else
        {
          uint64_t v16 = a3->var2;
          if (v16)
          {
            unsigned __int16 v17 = v16[a3->var4.var0 + v14];
          }
          else
          {
            uint64_t v40 = a3->var3;
            if (v40)
            {
              unsigned __int16 v17 = v40[a3->var4.var0 + v14];
            }
            else
            {
              if (a3->var6 <= v14 || (int64_t v43 = a3->var5, v43 > v14))
              {
                int64_t v44 = var0 - 3;
                if ((unint64_t)v14 < 4) {
                  int64_t v44 = 0;
                }
                if (v44 + 64 < v15) {
                  int64_t v15 = v44 + 64;
                }
                a3->int64_t var5 = v44;
                a3->var6 = v15;
                v51.location = a3->var4.var0 + v44;
                v51.length = v15 - v44;
                CFStringGetCharacters(a3->var1, v51, a3->var0);
                int64_t v43 = a3->var5;
              }
              unsigned __int16 v17 = a3->var0[v14 - v43];
            }
          }
          if (v13 == 77 && v17 == 79)
          {
            uint64_t v20 = 2;
            goto LABEL_19;
          }
          BOOL v18 = v17 == 85;
          if (v13 == 84 && v17 == 85)
          {
            uint64_t v20 = 3;
            goto LABEL_19;
          }
          if (v13 == 87 && v17 == 69)
          {
            uint64_t v20 = 4;
            goto LABEL_19;
          }
          if (v13 == 84 && v17 == 72)
          {
            uint64_t v20 = 5;
            goto LABEL_19;
          }
          if (v13 == 70 && v17 == 82)
          {
            uint64_t v20 = 6;
            goto LABEL_19;
          }
          BOOL v19 = v13 == 83;
          if (v13 == 83 && v17 == 65)
          {
            uint64_t v20 = 7;
LABEL_19:
            if (v8) {
              int v21 = -v6;
            }
            else {
              int v21 = v6;
            }
            uint64_t v22 = v47;
            if (!v47)
            {
              uint64_t v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
            }
            int64_t v23 = +[EKRecurrenceDayOfWeek dayOfWeek:weekNumber:](EKRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", v20, v21, v46);
            [v22 addObject:v23];

            id v47 = v22;
            if (v14 >= v9)
            {
              char v8 = 0;
              char v7 = 0;
              int v6 = 0;
              ++var0;
            }
            else
            {
              int64_t v24 = ~var0;
              int64_t v25 = var0 + 65;
              while (1)
              {
                int64_t v26 = var0 + 1;
                uint64_t v27 = (unint64_t)v14 >= 4 ? 4 : v14;
                if ((v26 & 0x8000000000000000) == 0)
                {
                  int64_t v28 = a3->var4.var1;
                  if (v28 > v26)
                  {
                    int64_t v29 = a3->var2;
                    if (v29)
                    {
                      unsigned __int16 v30 = v29[var0 + 1 + a3->var4.var0];
                    }
                    else
                    {
                      int64_t v31 = a3->var3;
                      if (v31)
                      {
                        unsigned __int16 v30 = v31[a3->var4.var0 + 1 + var0];
                      }
                      else
                      {
                        if (a3->var6 <= v26 || (int64_t v32 = a3->var5, v32 > v26))
                        {
                          uint64_t v33 = -v27;
                          uint64_t v34 = v27 + v24;
                          int64_t v35 = v25 - v27;
                          int64_t v36 = var0 + v33;
                          int64_t v37 = v36 + 1;
                          int64_t v38 = v36 + 65;
                          if (v38 >= v28) {
                            int64_t v38 = a3->var4.var1;
                          }
                          a3->int64_t var5 = v37;
                          a3->var6 = v38;
                          if (v28 >= v35) {
                            int64_t v28 = v35;
                          }
                          v49.length = v28 + v34;
                          v49.location = v37 + a3->var4.var0;
                          CFStringGetCharacters(a3->var1, v49, a3->var0);
                          int64_t v32 = a3->var5;
                        }
                        unsigned __int16 v30 = v46[var0 - v32];
                      }
                    }
                    if (v30 == 44) {
                      break;
                    }
                  }
                }
                ++v14;
                --v24;
                ++v25;
                ++var0;
                if (v10 == v26)
                {
                  char v8 = 0;
                  char v7 = 0;
                  int v6 = 0;
                  int64_t var0 = v9;
                  goto LABEL_62;
                }
              }
              char v8 = 0;
              char v7 = 0;
              int v6 = 0;
              ++var0;
            }
            goto LABEL_62;
          }
        }
        uint64_t v20 = v19 & v18;
        goto LABEL_19;
      }
      char v7 = 0;
      v8 |= v13 == 45;
LABEL_62:
      if (++var0 >= v9) {
        goto LABEL_91;
      }
    }
  }
  id v47 = 0;
LABEL_91:

  return v47;
}

- (id)_parseIndexList:(id *)a3 range:(id)a4
{
  if (a4.var1 < 1)
  {
    int64_t v9 = 0;
    goto LABEL_55;
  }
  int64_t var0 = a4.var0;
  LODWORD(v6) = 0;
  LOBYTE(v7) = 0;
  int v8 = 0;
  int64_t v9 = 0;
  int64_t v10 = a4.var0 + a4.var1;
  int64_t v11 = -a4.var0;
  int64_t v12 = a4.var0 + 64;
  do
  {
    if ((unint64_t)var0 >= 4) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = var0;
    }
    if (var0 < 0 || (int64_t v14 = a3->var4.var1, v14 <= var0))
    {
      unsigned __int16 v16 = 0;
    }
    else
    {
      var2 = a3->var2;
      if (var2)
      {
        unsigned __int16 v16 = var2[var0 + a3->var4.var0];
      }
      else
      {
        var3 = a3->var3;
        if (var3)
        {
          unsigned __int16 v16 = var3[a3->var4.var0 + var0];
        }
        else
        {
          if (a3->var6 <= var0 || (int64_t var5 = a3->var5, var5 > var0))
          {
            uint64_t v26 = -v13;
            uint64_t v27 = v13 + v11;
            int64_t v28 = v12 - v13;
            int64_t v29 = var0 + v26;
            int64_t var1 = v29 + 64;
            if (v29 + 64 >= v14) {
              int64_t var1 = a3->var4.var1;
            }
            a3->int64_t var5 = v29;
            a3->var6 = var1;
            if (v14 >= v28) {
              int64_t v14 = v28;
            }
            v37.length = v14 + v27;
            v37.location = v29 + a3->var4.var0;
            CFStringGetCharacters(a3->var1, v37, a3->var0);
            int64_t var5 = a3->var5;
          }
          unsigned __int16 v16 = a3->var0[var0 - var5];
        }
      }
      if (v16 != 44 || (v7 & 1) == 0)
      {
        if ((unsigned __int16)(v16 - 48) <= 9u)
        {
          LODWORD(v6) = v16 + 10 * v6 - 48;
          int v7 = 1;
          goto LABEL_26;
        }
      }
      else
      {
        if (v8) {
          uint64_t v6 = -(int)v6;
        }
        else {
          uint64_t v6 = v6;
        }
        if (!v9)
        {
          int64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
        }
        [NSNumber numberWithInt:v6];
        v32 = int64_t v31 = v9;
        [v31 addObject:v32];

        int64_t v9 = v31;
        unsigned __int16 v16 = 44;
      }
    }
    unsigned int v17 = v16;
    uint64_t v18 = 1 << v16;
    BOOL v19 = (v18 & 0x280100000000) == 0;
    if ((v18 & 0x280100000000) != 0) {
      int v20 = v8 | (v17 == 45);
    }
    else {
      int v20 = 0;
    }
    if (v19) {
      int v21 = 0;
    }
    else {
      int v21 = v6;
    }
    if (v17 <= 0x2D)
    {
      int v22 = v21;
    }
    else
    {
      int v20 = 0;
      int v22 = 0;
    }
    BOOL v23 = (v7 & 1) == 0;
    if (v7) {
      int v8 = 0;
    }
    else {
      int v8 = v20;
    }
    int v7 = 0;
    if (v23) {
      LODWORD(v6) = v22;
    }
    else {
      LODWORD(v6) = 0;
    }
LABEL_26:
    ++var0;
    --v11;
    ++v12;
  }
  while (var0 < v10);
  if (v7)
  {
    if (v8) {
      uint64_t v33 = -(int)v6;
    }
    else {
      uint64_t v33 = v6;
    }
    if (!v9)
    {
      int64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    }
    uint64_t v34 = [NSNumber numberWithInt:v33];
    [v9 addObject:v34];
  }
LABEL_55:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

@end