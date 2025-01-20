@interface ABValuePredicate
+ (id)stringForComparison:(id)a3 withComparision:(int64_t)a4;
- (ABValuePredicate)init;
- (BOOL)_allowsLaxCheckingForFTS;
- (BOOL)_shouldConsultIndexForKey:(id)a3;
- (BOOL)_supportsFTSSearch;
- (BOOL)isValid;
- (NSObject)value;
- (id)_ftsAllQueryStrings;
- (id)_ftsTermStringForString:(id)a3;
- (id)_ftsTokenizedTermStringForString:(id)a3;
- (id)predicateFormat;
- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4;
- (id)querySelectPropertiesForPredicateIdentifier:(int)a3;
- (id)queryWhereStringForPredicateIdentifier:(int)a3;
- (id)stringForComparison:(id)a3;
- (int)property;
- (int64_t)comparison;
- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5;
- (void)dealloc;
- (void)setComparison:(int64_t)a3;
- (void)setProperty:(int)a3;
- (void)setValue:(id)a3;
@end

@implementation ABValuePredicate

- (ABValuePredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABValuePredicate;
  result = [(ABPredicate *)&v3 init];
  if (result)
  {
    result->_comparison = 0;
    result->_property = -1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABValuePredicate;
  [(ABPredicate *)&v3 dealloc];
}

- (void)setValue:(id)a3
{
  value = self->_value;
  if (value != a3)
  {

    self->_value = [a3 copy];
    objc_opt_class();
    self->_dictionaryValue = objc_opt_isKindOfClass() & 1;
  }
}

- (BOOL)isValid
{
  ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  int property = self->_property;
  if (property == -1) {
    return 0;
  }
  if ((TypeOfProperty & 0xFFFFFEFF) == 4)
  {
    unint64_t comparison = self->_comparison;
    BOOL v6 = comparison > 5;
    uint64_t v7 = (1 << comparison) & 0x31;
    if (v6 || v7 == 0)
    {
      ABDiagnosticsEnabled();
      _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 69, 0, @"Equality and inequalities are the only supported comparisons for date properties", v19, v20, v21, v30);
      char v9 = 0;
    }
    else
    {
      char v9 = 1;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      ABDiagnosticsEnabled();
      _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 73, 0, @"Date properties can only be matched with dates", v23, v24, v25, v30);
    }
    return v9 & isKindOfClass;
  }
  if (property != kABPersonPhoneProperty)
  {
    if ((TypeOfProperty & 0xFFFFFEFF) != 5) {
      return 1;
    }
    if (self->_dictionaryValue) {
      return 1;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
    ABDiagnosticsEnabled();
    v26 = ABPersonNameForProperty(self->_property);
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 89, 0, @"Dictionary properties like <%@> can only be compared to dictionaries or strings", v27, v28, v29, (uint64_t)v26);
    return 0;
  }
  unint64_t v10 = self->_comparison;
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  if (v10 >= 2)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 80, 0, @"Equality and prefix are the only supported comparison for the phone property.", v12, v13, v14, v30);
  }
  if ((v11 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 83, 0, @"Phone numbers can only be compared to strings", v15, v16, v17, v30);
  }
  return (v10 < 2) & v11;
}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  if (ABPersonGetTypeOfProperty(self->_property) == 261) {
    return &unk_1EF050508;
  }
  else {
    return 0;
  }
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  BOOL v4 = a3;
  if (ABPersonGetTypeOfProperty(self->_property) != 261) {
    return 0;
  }
  v5 = (void *)MEMORY[0x1E4F1C978];
  if (v4) {
    BOOL v6 = @"LEFT OUTER JOIN ABMultiValue abv ON abp.ROWID = abv.record_id";
  }
  else {
    BOOL v6 = @"JOIN ABMultiValue abv ON abp.ROWID = abv.record_id";
  }
  return (id)[v5 arrayWithObject:v6];
}

- (BOOL)_shouldConsultIndexForKey:(id)a3
{
  CFArrayRef ArrayOfAllFTSPropertyIDs = (const __CFArray *)_ABPersonGetArrayOfAllFTSPropertyIDs();
  CFIndex Count = CFArrayGetCount(ArrayOfAllFTSPropertyIDs);
  int v7 = [(ABValuePredicate *)self property];
  v19.location = 0;
  v19.length = Count;
  int v8 = CFArrayContainsValue(ArrayOfAllFTSPropertyIDs, v19, (const void *)v7);
  if (!v8) {
    return v8;
  }
  if ([(ABValuePredicate *)self property] == kABPersonSocialProfileProperty)
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"identifier", @"username", 0, v12, v13, v14, v15, v16, v17);
  }
  else if ([(ABValuePredicate *)self property] == kABPersonAddressProperty)
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"State", @"City", @"CountryCode", @"Country", @"ZIP", @"Street", @"SubLocality", @"SubAdministrativeArea", 0);
  }
  else
  {
    if ([(ABValuePredicate *)self property] != kABPersonInstantMessageProperty) {
      goto LABEL_12;
    }
    char v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"username", 0, v11, v12, v13, v14, v15, v16, v17);
  }
  if (!v9)
  {
LABEL_12:
    LOBYTE(v8) = 1;
    return v8;
  }
  LOBYTE(v8) = [v9 containsObject:a3];
  return v8;
}

- (BOOL)_supportsFTSSearch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  LODWORD(v3) = ABCFTSIsEnabled();
  if (!v3) {
    return v3;
  }
  unint64_t comparison = self->_comparison;
  ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  if (TypeOfProperty == 1)
  {
    if (self->_value) {
      BOOL v10 = comparison >= 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  if (TypeOfProperty == 257)
  {
    if (comparison > 1)
    {
LABEL_20:
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_23:
    LOBYTE(v3) = [(ABValuePredicate *)self _shouldConsultIndexForKey:0];
    return v3;
  }
  if (TypeOfProperty != 261 || comparison > 1) {
    goto LABEL_20;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  orderedKeys = self->_orderedKeys;
  uint64_t v3 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(orderedKeys);
        }
        if ([(ABValuePredicate *)self _shouldConsultIndexForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
      }
      uint64_t v7 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v12 objects:v16 count:16];
      LOBYTE(v3) = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)_allowsLaxCheckingForFTS
{
  return [(ABValuePredicate *)self property] == kABPersonPhoneProperty;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  ABPropertyType v5 = TypeOfProperty;
  switch(self->_comparison)
  {
    case 0:
      if ((TypeOfProperty & 0xFFFFFEFF) == 4)
      {
        BOOL v6 = @"BETWEEN ? AND ?";
        goto LABEL_20;
      }
      BOOL v6 = @"LIKE ?";
      if (TypeOfProperty != 1) {
        break;
      }
      if (!self->_value) {
        BOOL v6 = @"IS NULL";
      }
      long long v15 = ABPersonNameForProperty(self->_property);
      goto LABEL_37;
    case 1:
    case 2:
    case 3:
      BOOL v6 = @"LIKE ?";
      break;
    case 4:
      BOOL v6 = @"> ?";
      break;
    case 5:
      BOOL v6 = @"< ?";
      break;
    default:
      BOOL v6 = 0;
      break;
  }
  if (TypeOfProperty == 261)
  {
    if (!self->_dictionaryValue) {
      return (id)[NSString stringWithFormat:@"((SELECT COUNT() FROM ABMultiValue JOIN ABMultiValueEntry abve ON abve.parent_id = abv.UID WHERE (abp.ROWID = abv.record_id AND abv.property+0 = ? AND abve.value %@) LIMIT 1) > 0)", v6, v20, v21];
    }
    v22 = v6;
    uint64_t v7 = objc_opt_new();
    uint64_t v23 = ABCPersonNameForProperty([(ABValuePredicate *)self property]);
    objc_msgSend(v7, "appendString:", CFSTR("(abv.ROWID IN ("));
    value = self->_value;
    uint64_t v9 = [value count];

    self->_orderedKeys = (NSArray *)(id)[value allKeys];
    if (v9 < 1)
    {
      char v11 = 0;
    }
    else
    {
      uint64_t v10 = 0;
      char v11 = 0;
      do
      {
        [value objectForKey:[(NSArray *)self->_orderedKeys objectAtIndex:v10]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v10) {
            [v7 appendString:@" INTERSECT "];
          }
          BOOL v12 = [(ABValuePredicate *)self _supportsFTSSearch];
          long long v13 = @"(SELECT ROWID FROM ABPerson)";
          if (v12) {
            long long v13 = (__CFString *)[NSString stringWithFormat:@"(SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ?)", v23];
          }
          [v7 appendFormat:@"SELECT parent_id FROM ABMultiValueEntry mve JOIN ABMultiValueEntryKey mvk NOT INDEXED ON mve.key = mvk.rowid WHERE mve.ROWID IN (SELECT ROWID FROM ABMultiValueEntry WHERE parent_id IN (SELECT UID FROM ABMultiValue WHERE record_id IN %@ )) AND mvk.value = ? AND mve.value LIKE ?", v13];
          char v11 = 1;
        }
        ++v10;
      }
      while (v9 != v10);
    }
    [v7 appendString:@"]"));
    id result = v7;
    BOOL v6 = v22;
    if ((v11 & 1) == 0) {
      return (id)[NSString stringWithFormat:@"((SELECT COUNT() FROM ABMultiValue JOIN ABMultiValueEntry abve ON abve.parent_id = abv.UID WHERE (abp.ROWID = abv.record_id AND abv.property+0 = ? AND abve.value %@) LIMIT 1) > 0)", v6, v20, v21];
    }
  }
  else
  {
LABEL_20:
    if ((TypeOfProperty & 0x100) != 0)
    {
      uint64_t v16 = @"value COLLATE NOCASE";
      if ((TypeOfProperty & 0xFFFFFEFF) == 4) {
        uint64_t v16 = (__CFString *)[NSString stringWithFormat:@"CAST(%@ AS NUMERIC)", @"value COLLATE NOCASE"];
      }
      if ([(ABValuePredicate *)self _supportsFTSSearch])
      {
        uint64_t v17 = ABCPersonNameForProperty([(ABValuePredicate *)self property]);
        if ([(ABValuePredicate *)self _allowsLaxCheckingForFTS]) {
          return (id)[NSString stringWithFormat:@"ROWID IN (SELECT rowid FROM ABPersonFullTextSearch fts WHERE fts.%@ MATCH ?)", v17, v20, v21];
        }
        else {
          return (id)[NSString stringWithFormat:@"ROWID IN (SELECT abv.record_id FROM ABPersonFullTextSearch fts JOIN ABMultiValue abv ON abv.record_id = fts.rowid WHERE fts.%@ MATCH ? AND abv.%@ %@)", v17, v16, v6];
        }
      }
      else
      {
        return (id)[NSString stringWithFormat:@"ROWID IN (select record_id from ABMultiValue where int property = ? and %@ %@)", v16, v6, v21];
      }
    }
    else
    {
      long long v14 = ABPersonNameForProperty(self->_property);
      if (v5 == 4)
      {
        long long v15 = (__CFString *)[NSString stringWithFormat:@"CAST(%@ AS NUMERIC)", v14];
LABEL_37:
        long long v14 = v15;
      }
      if ([(ABValuePredicate *)self _supportsFTSSearch])
      {
        CFRange v19 = ABCPersonNameForProperty([(ABValuePredicate *)self property]);
        if ([(ABValuePredicate *)self _allowsLaxCheckingForFTS]) {
          return (id)[NSString stringWithFormat:@"ROWID IN (SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ?)", v19, v20, v21];
        }
        else {
          return (id)[NSString stringWithFormat:@"ROWID IN (SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ? AND %@ %@)", v19, v14, v6];
        }
      }
      else
      {
        return (id)[(__CFString *)v14 stringByAppendingFormat:@" %@", v6];
      }
    }
  }
  return result;
}

+ (id)stringForComparison:(id)a3 withComparision:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      ABPropertyType v5 = (__CFString *)[@"%" stringByAppendingString:a3];
      a3 = @"%";
      return (id)[(__CFString *)v5 stringByAppendingString:a3];
    case 2:
      ABPropertyType v5 = @"%";
      return (id)[(__CFString *)v5 stringByAppendingString:a3];
    case 1:
      ABPropertyType v5 = (__CFString *)a3;
      a3 = @"%";
      return (id)[(__CFString *)v5 stringByAppendingString:a3];
  }
  return a3;
}

- (id)stringForComparison:(id)a3
{
  ABPropertyType v5 = objc_opt_class();
  int64_t comparison = self->_comparison;
  return (id)[v5 stringForComparison:a3 withComparision:comparison];
}

- (id)_ftsTermStringForString:(id)a3
{
  if ([(ABValuePredicate *)self comparison] == 3
    || [(ABValuePredicate *)self comparison] == 2)
  {
    ABPropertyType v5 = @"*";
  }
  else
  {
    ABPropertyType v5 = &stru_1EF03E278;
  }
  if ([(ABValuePredicate *)self comparison] == 3
    || [(ABValuePredicate *)self comparison] == 1)
  {
    BOOL v6 = @"*";
  }
  else
  {
    BOOL v6 = &stru_1EF03E278;
  }
  return (id)[NSString stringWithFormat:@"##&%@%@%@", v5, a3, v6];
}

- (id)_ftsTokenizedTermStringForString:(id)a3
{
  CFArrayRef v5 = CFLocaleCopyPreferredLanguages();
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5))
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
      CFLocaleRef v8 = CFLocaleCreate(0, ValueAtIndex);
      CFRelease(v6);
      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
      CFRelease(v6);
    }
  }
  CFLocaleRef v8 = CFLocaleCopyCurrent();
LABEL_7:
  v16.location = 0;
  v16.length = 0;
  uint64_t v9 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &stru_1EF03E278, v16, 0, v8);
  uint64_t v10 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v10, v9, 0, (const __CFString *)a3, 0, 1, 0);
  char v11 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t Count = ABTokenListGetCount((uint64_t)v10);
  if (Count >= 1)
  {
    uint64_t v13 = Count;
    for (uint64_t i = 0; i != v13; ++i)
      [v11 appendFormat:@"%@ ", -[ABValuePredicate _ftsTermStringForString:](self, "_ftsTermStringForString:", ABTokenListGetTokenAtIndex((uint64_t)v10, i))];
  }
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v9);
  CFRelease(v10);
  return v11;
}

- (id)_ftsAllQueryStrings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  orderedKeys = self->_orderedKeys;
  uint64_t v5 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(orderedKeys);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(ABValuePredicate *)self _shouldConsultIndexForKey:v9]) {
          [v3 appendFormat:@"%@ ", -[NSObject objectForKey:](self->_value, "objectForKey:", v9)];
        }
      }
      uint64_t v6 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [(ABValuePredicate *)self _ftsTokenizedTermStringForString:v3];
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_value)
  {
    ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
    BOOL v26 = [(ABValuePredicate *)self _supportsFTSSearch];
    if (TypeOfProperty == 261 && self->_dictionaryValue)
    {
      value = self->_value;
      orderedKeys = self->_orderedKeys;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v10 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(orderedKeys);
            }
            uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v15 = [value objectForKey:v14];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = [(ABValuePredicate *)self stringForComparison:v15];
              if (v26) {
                [(ABPredicate *)self bindString:[(ABValuePredicate *)self _ftsAllQueryStrings] toStatement:a3 withBindingOffset:a4];
              }
              [(ABPredicate *)self bindString:v14 toStatement:a3 withBindingOffset:a4];
              [(ABPredicate *)self bindString:v16 toStatement:a3 withBindingOffset:a4];
            }
          }
          uint64_t v11 = [(NSArray *)orderedKeys countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }
    }
    else
    {
      char v17 = v26;
      if ((TypeOfProperty & 0x100) == 0) {
        char v17 = 1;
      }
      if ((v17 & 1) == 0)
      {
        sqlite3_bind_int(a3->var1, *a4, self->_property);
        ++*a4;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      CFRange v19 = self->_value;
      if (isKindOfClass)
      {
        if (!v26
          || ([(ABPredicate *)self bindString:[(ABValuePredicate *)self _ftsTokenizedTermStringForString:self->_value] toStatement:a3 withBindingOffset:a4], ![(ABValuePredicate *)self _allowsLaxCheckingForFTS]))
        {
          id v20 = [(ABValuePredicate *)self stringForComparison:v19];
          [(ABPredicate *)self bindString:v20 toStatement:a3 withBindingOffset:a4];
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = (void *)[MEMORY[0x1E4F1C9A8] currentCalendar];
          v22 = (void *)[v21 components:254 fromDate:self->_value];
          objc_msgSend(v21, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", 0));
          [v22 setHour:12];
          [v22 setMinute:0];
          [v22 setSecond:0];
          uint64_t v23 = (void *)[v21 dateFromComponents:v22];
          uint64_t v24 = v23;
          int64_t comparison = self->_comparison;
          if (comparison == 5 || !comparison)
          {
            objc_msgSend((id)objc_msgSend(v23, "dateByAddingTimeInterval:", -43200.0), "timeIntervalSinceReferenceDate");
            -[ABPredicate bindDouble:toStatement:withBindingOffset:](self, "bindDouble:toStatement:withBindingOffset:", a3, a4);
            int64_t comparison = self->_comparison;
          }
          if ((comparison | 4) == 4)
          {
            objc_msgSend((id)objc_msgSend(v24, "dateByAddingTimeInterval:", 43200.0), "timeIntervalSinceReferenceDate");
            -[ABPredicate bindDouble:toStatement:withBindingOffset:](self, "bindDouble:toStatement:withBindingOffset:", a3, a4);
          }
        }
      }
    }
  }
}

- (id)predicateFormat
{
  unint64_t comparison = self->_comparison;
  if (comparison > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_1E5988FC8[comparison];
  }
  if (self->_value) {
    value = self->_value;
  }
  else {
    value = @"nil";
  }
  return (id)[NSString stringWithFormat:@"ABPredicate %p - Value matching (%@): %@ %@", self, v3, value, ABPersonNameForProperty(self->_property)];
}

- (int)property
{
  return self->_property;
}

- (void)setProperty:(int)a3
{
  self->_int property = a3;
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (void)setComparison:(int64_t)a3
{
  self->_unint64_t comparison = a3;
}

- (NSObject)value
{
  return self->_value;
}

@end