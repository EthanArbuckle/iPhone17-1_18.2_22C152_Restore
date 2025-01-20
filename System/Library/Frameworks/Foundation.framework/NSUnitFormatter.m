@interface NSUnitFormatter
+ (BOOL)supportsSecureCoding;
- (NSLocale)locale;
- (NSNumberFormatter)numberFormatter;
- (NSUnitFormatter)init;
- (NSUnitFormatter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForValue1:(double)a3 unit1:(unint64_t)a4 value2:(double)a5 unit2:(unint64_t)a6;
- (id)stringForValue:(double)a3 unit:(unint64_t)a4;
- (id)stringFromUnit:(id)a3;
- (id)unitStringFromValue:(double)a3 unit:(unint64_t)a4;
- (int)_determineUnitsToFormat:(int *)a3 fromMeasurement:(id)a4;
- (int64_t)unitStyle;
- (unint64_t)unitOptions;
- (void)checkIfModified;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setUnitOptions:(unint64_t)a3;
- (void)setUnitStyle:(int64_t)a3;
@end

@implementation NSUnitFormatter

- (id)stringForObjectValue:(id)a3
{
  v33[92] = *MEMORY[0x1E4F143B8];
  [a3 doubleValue];
  double v6 = v5;
  v7 = (void *)[a3 unit];
  if (_unitHasSpecifierAndIsDimensional(v7))
  {
    *(void *)&long long v8 = -1;
    *((void *)&v8 + 1) = -1;
    v31[0] = v8;
    v31[1] = v8;
    if ([(NSUnitFormatter *)self _determineUnitsToFormat:v31 fromMeasurement:a3] != 1)
    {
      v18 = [(NSUnitFormatter *)self numberFormatter];
      [a3 doubleValue];
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@", -[NSNumberFormatter stringFromNumber:](v18, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")), objc_msgSend((id)objc_msgSend(a3, "unit"), "symbol"));
    }
    uint64_t v9 = LODWORD(v31[0]);
    if (LODWORD(v31[0]) != -1)
    {
      if (LODWORD(v31[0]) == 2563)
      {
        uint64_t v10 = [v7 specifier];
        if ((self->_unitOptions & 1) == 0)
        {
          uint64_t v11 = v10;
          uint64_t v12 = [MEMORY[0x1E4F1CA20] _preferredTemperatureUnit];
          if (v11 == 2561 && v12 == *MEMORY[0x1E4F1C480])
          {
            unsigned int v13 = 2560;
          }
          else
          {
            if (v11 != 2560 || v12 != *MEMORY[0x1E4F1C488]) {
              return [(NSUnitFormatter *)self stringForValue:2563 unit:v6];
            }
            unsigned int v13 = 2561;
          }
          objc_msgSend((id)objc_msgSend(a3, "measurementByConvertingToUnit:", getDimensionUnitFromUnitSpecifier(v13)), "doubleValue");
          double v6 = v26;
        }
        return [(NSUnitFormatter *)self stringForValue:2563 unit:v6];
      }
      v21 = [[NSMeasurement alloc] initWithDoubleValue:v7 unit:v6];
      unint64_t unitOptions = self->_unitOptions;
      v23 = v21;
      if (getDimensionUnitFromUnitSpecifier(v9)) {
        v23 = -[NSMeasurement measurementByConvertingToUnit:](v21, "measurementByConvertingToUnit:");
      }
      if ((unitOptions & 2) != 0)
      {
        v32[0] = &off_1ECAB5678;
        v32[1] = &off_1ECAB56A8;
        v33[0] = &off_1ECAB5690;
        v33[1] = &off_1ECAB5690;
        v32[2] = &off_1ECAB56C0;
        v32[3] = &off_1ECAB56D8;
        v33[2] = &off_1ECAB5690;
        v33[3] = &off_1ECAB56F0;
        v32[4] = &off_1ECAB5708;
        v32[5] = &off_1ECAB5720;
        v33[4] = &off_1ECAB56F0;
        v33[5] = &off_1ECAB56F0;
        v32[6] = &off_1ECAB5738;
        v32[7] = &off_1ECAB5750;
        v33[6] = &off_1ECAB5690;
        v33[7] = &off_1ECAB56F0;
        v32[8] = &off_1ECAB5768;
        v32[9] = &off_1ECAB5780;
        v33[8] = &off_1ECAB56F0;
        v33[9] = &off_1ECAB5690;
        v32[10] = &off_1ECAB5798;
        v32[11] = &off_1ECAB57B0;
        v33[10] = &off_1ECAB5690;
        v33[11] = &off_1ECAB5690;
        v32[12] = &off_1ECAB57C8;
        v32[13] = &off_1ECAB57E0;
        v33[12] = &off_1ECAB5690;
        v33[13] = &off_1ECAB5690;
        v32[14] = &off_1ECAB57F8;
        v32[15] = &off_1ECAB5810;
        v33[14] = &off_1ECAB5690;
        v33[15] = &off_1ECAB5690;
        v32[16] = &off_1ECAB5828;
        v32[17] = &off_1ECAB5840;
        v33[16] = &off_1ECAB5690;
        v33[17] = &off_1ECAB56F0;
        v32[18] = &off_1ECAB5858;
        v32[19] = &off_1ECAB5870;
        v33[18] = &off_1ECAB56F0;
        v33[19] = &off_1ECAB56F0;
        v32[20] = &off_1ECAB5888;
        v32[21] = &off_1ECAB58A0;
        v33[20] = &off_1ECAB56F0;
        v33[21] = &off_1ECAB56F0;
        v32[22] = &off_1ECAB58B8;
        v32[23] = &off_1ECAB58D0;
        v33[22] = &off_1ECAB56F0;
        v33[23] = &off_1ECAB56F0;
        v32[24] = &off_1ECAB58E8;
        v32[25] = &off_1ECAB5900;
        v33[24] = &off_1ECAB5690;
        v33[25] = &off_1ECAB5690;
        v32[26] = &off_1ECAB5918;
        v32[27] = &off_1ECAB5930;
        v33[26] = &off_1ECAB56F0;
        v33[27] = &off_1ECAB56F0;
        v32[28] = &off_1ECAB5948;
        v32[29] = &off_1ECAB5978;
        v33[28] = &off_1ECAB5960;
        v33[29] = &off_1ECAB5690;
        v32[30] = &off_1ECAB5990;
        v32[31] = &off_1ECAB59A8;
        v33[30] = &off_1ECAB5690;
        v33[31] = &off_1ECAB5690;
        v32[32] = &off_1ECAB59C0;
        v32[33] = &off_1ECAB59D8;
        v33[32] = &off_1ECAB56F0;
        v33[33] = &off_1ECAB5690;
        v32[34] = &off_1ECAB59F0;
        v32[35] = &off_1ECAB5A08;
        v33[34] = &off_1ECAB5960;
        v33[35] = &off_1ECAB5690;
        v32[36] = &off_1ECAB5A20;
        v32[37] = &off_1ECAB5A38;
        v33[36] = &off_1ECAB5690;
        v33[37] = &off_1ECAB56F0;
        v32[38] = &off_1ECAB5A50;
        v32[39] = &off_1ECAB5A68;
        v33[38] = &off_1ECAB5690;
        v33[39] = &off_1ECAB5690;
        v32[40] = &off_1ECAB5A80;
        v32[41] = &off_1ECAB5A98;
        v33[40] = &off_1ECAB5690;
        v33[41] = &off_1ECAB5690;
        v32[42] = &off_1ECAB5AB0;
        v32[43] = &off_1ECAB5AC8;
        v33[42] = &off_1ECAB5690;
        v33[43] = &off_1ECAB56F0;
        v32[44] = &off_1ECAB5AE0;
        v32[45] = &off_1ECAB5AF8;
        v33[44] = &off_1ECAB5690;
        v33[45] = &off_1ECAB5690;
        v32[46] = &off_1ECAB5B10;
        v32[47] = &off_1ECAB5B28;
        v33[46] = &off_1ECAB5690;
        v33[47] = &off_1ECAB56F0;
        v32[48] = &off_1ECAB5B40;
        v32[49] = &off_1ECAB5B58;
        v33[48] = &off_1ECAB5690;
        v33[49] = &off_1ECAB5690;
        v32[50] = &off_1ECAB5B70;
        v32[51] = &off_1ECAB5B88;
        v33[50] = &off_1ECAB56F0;
        v33[51] = &off_1ECAB5690;
        v32[52] = &off_1ECAB5BA0;
        v32[53] = &off_1ECAB5BB8;
        v33[52] = &off_1ECAB5690;
        v33[53] = &off_1ECAB5690;
        v32[54] = &off_1ECAB5BD0;
        v32[55] = &off_1ECAB5BE8;
        v33[54] = &off_1ECAB5690;
        v33[55] = &off_1ECAB5690;
        v32[56] = &off_1ECAB5C00;
        v32[57] = &off_1ECAB5C18;
        v33[56] = &off_1ECAB5690;
        v33[57] = &off_1ECAB5690;
        v32[58] = &off_1ECAB5C30;
        v32[59] = &off_1ECAB5C48;
        v33[58] = &off_1ECAB5690;
        v33[59] = &off_1ECAB5690;
        v32[60] = &off_1ECAB5C60;
        v32[61] = &off_1ECAB5C78;
        v33[60] = &off_1ECAB5690;
        v33[61] = &off_1ECAB56F0;
        v32[62] = &off_1ECAB5C90;
        v32[63] = &off_1ECAB5CA8;
        v33[62] = &off_1ECAB56F0;
        v33[63] = &off_1ECAB56F0;
        v32[64] = &off_1ECAB5CC0;
        v33[64] = &off_1ECAB56F0;
        v32[65] = &off_1ECAB5CD8;
        v33[65] = &off_1ECAB56F0;
        v32[66] = &off_1ECAB5CF0;
        v33[66] = &off_1ECAB56F0;
        v32[67] = &off_1ECAB5D08;
        v33[67] = &off_1ECAB56F0;
        v32[68] = &off_1ECAB5D20;
        v33[68] = &off_1ECAB56F0;
        v32[69] = &off_1ECAB5D38;
        v33[69] = &off_1ECAB56F0;
        v32[70] = &off_1ECAB5D50;
        v33[70] = &off_1ECAB56F0;
        v32[71] = &off_1ECAB5D68;
        v33[71] = &off_1ECAB56F0;
        v32[72] = &off_1ECAB5D80;
        v33[72] = &off_1ECAB56F0;
        v32[73] = &off_1ECAB5D98;
        v33[73] = &off_1ECAB5960;
        v32[74] = &off_1ECAB5DB0;
        v33[74] = &off_1ECAB5690;
        v32[75] = &off_1ECAB5DC8;
        v33[75] = &off_1ECAB5690;
        v32[76] = &off_1ECAB5DE0;
        v33[76] = &off_1ECAB56F0;
        v32[77] = &off_1ECAB5DF8;
        v33[77] = &off_1ECAB56F0;
        v32[78] = &off_1ECAB5E10;
        v33[78] = &off_1ECAB56F0;
        v32[79] = &off_1ECAB5E28;
        v33[79] = &off_1ECAB5690;
        v32[80] = &off_1ECAB5E40;
        v33[80] = &off_1ECAB56F0;
        v32[81] = &off_1ECAB5E58;
        v33[81] = &off_1ECAB5960;
        v32[82] = &off_1ECAB5E70;
        v33[82] = &off_1ECAB5690;
        v32[83] = &off_1ECAB5E88;
        v33[83] = &off_1ECAB5690;
        v32[84] = &off_1ECAB5EA0;
        v33[84] = &off_1ECAB5690;
        v32[85] = &off_1ECAB5EB8;
        v33[85] = &off_1ECAB5690;
        v32[86] = &off_1ECAB5ED0;
        v33[86] = &off_1ECAB5690;
        v32[87] = &off_1ECAB5EE8;
        v33[87] = &off_1ECAB5690;
        v32[88] = &off_1ECAB5F00;
        v33[88] = &off_1ECAB5690;
        v32[89] = &off_1ECAB5F18;
        v33[89] = &off_1ECAB5690;
        v32[90] = &off_1ECAB5F30;
        v33[90] = &off_1ECAB5690;
        v32[91] = &off_1ECAB5F48;
        v33[91] = &off_1ECAB5690;
        v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, v32, 92), "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        if (v24) {
          uint64_t v25 = [v24 unsignedIntegerValue];
        }
        else {
          uint64_t v25 = 3;
        }
        [(NSMeasurement *)v23 unit];
        if (objc_opt_isKindOfClass()) {
          v23 = (NSMeasurement *)[(id)objc_opt_class() _measurementWithNaturalScale:v23 system:v25];
        }
      }
      if (_unitHasSpecifierAndIsDimensional([(NSMeasurement *)v23 unit]))
      {
        uint64_t v27 = objc_msgSend(-[NSMeasurement unit](v23, "unit"), "specifier");
        if (v27 == -1)
        {
          v20 = 0;
          goto LABEL_38;
        }
        uint64_t v28 = v27;
        [(NSMeasurement *)v23 doubleValue];
        v29 = -[NSUnitFormatter stringForValue:unit:](self, "stringForValue:unit:", v28);
      }
      else
      {
        v30 = [(NSUnitFormatter *)self numberFormatter];
        [(NSMeasurement *)v23 doubleValue];
        v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@", -[NSNumberFormatter stringFromNumber:](v30, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")), objc_msgSend(-[NSMeasurement unit](v23, "unit"), "symbol"));
      }
      v20 = v29;
LABEL_38:

      return v20;
    }
    return 0;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  if (([(NSUnitFormatter *)self unitOptions] & 1) != 0 || (isKindOfClass & 1) == 0) {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@", -[NSNumberFormatter stringFromNumber:](-[NSUnitFormatter numberFormatter](self, "numberFormatter"), "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6)), [v7 symbol]);
  }
  v15 = (void *)[(id)objc_opt_class() baseUnit];
  if (!_unitHasSpecifierAndIsDimensional(v15)) {
    return 0;
  }
  uint64_t v16 = [a3 measurementByConvertingToUnit:v15];

  return [(NSUnitFormatter *)self stringForObjectValue:v16];
}

- (id)stringForValue:(double)a3 unit:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(NSUnitFormatter *)self checkIfModified];
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  if (!self->_formatter && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** [NSUnitFormatter stringForValue:unit:] _formatter is nil", buf, 2u);
  }
  unsigned int v7 = uameasfmt_format();
  unsigned int v8 = v7;
  if ((int)v7 >= 1)
  {
    if (v7 < 0x65) {
      return +[NSString stringWithCharacters:v25 length:v7];
    }
    v14 = malloc_type_malloc(2 * v7, 0x7DDDC599uLL);
    if (v14)
    {
      v15 = v14;
      uameasfmt_format();
      unsigned int v13 = +[NSString stringWithCharacters:v15 length:v8];
      free(v15);
      return v13;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = 2 * v8;
      uint64_t v10 = MEMORY[0x1E4F14500];
      uint64_t v11 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = u_errorName(U_ZERO_ERROR);
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = (uint64_t)v9;
    __int16 v19 = 1024;
    unsigned int v20 = v8;
    __int16 v21 = 2048;
    double v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    uint64_t v10 = MEMORY[0x1E4F14500];
    uint64_t v11 = "*** uameasfmt_format() failed in NSUnitFormatter: %s, len = %d, value = %f, unit = %lu";
    uint32_t v12 = 38;
LABEL_7:
    _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
  }
  return 0;
}

- (int)_determineUnitsToFormat:(int *)a3 fromMeasurement:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t unitOptions = self->_unitOptions;
  if (!_unitHasSpecifierAndIsDimensional((void *)[a4 unit])) {
    return 0;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "unit"), "specifier");
  uint64_t v9 = [MEMORY[0x1E4F1CA20] _preferredTemperatureUnit];
  if ((unint64_t)(v8 - 2560) > 2)
  {
    if (unitOptions) {
      goto LABEL_38;
    }
  }
  else
  {
    unint64_t v10 = self->_unitOptions;
    if (v10 & 4 | unitOptions & 1)
    {
      if ((v10 & 4) != 0)
      {
        int v11 = 2563;
LABEL_25:
        *a3 = v11;
        return 1;
      }
LABEL_38:
      *a3 = v8;
      return 1;
    }
    if (v9 == *MEMORY[0x1E4F1C480])
    {
      int v11 = 2560;
      goto LABEL_25;
    }
    if (v9 == *MEMORY[0x1E4F1C488])
    {
      int v11 = 2561;
      goto LABEL_25;
    }
  }
  if (!CFStringGetCString((CFStringRef)[(NSLocale *)self->_locale localeIdentifier], buffer, 257, 0x600u))return 0; {
  uint32_t v12 = (void *)[(id)objc_opt_class() icuType];
  }
  if (![v12 length]
    || (unsigned int v13 = v19, ([v12 getCString:v19 maxLength:100 encoding:4] & 1) == 0))
  {
    unsigned int v13 = 0;
  }
  if (((unint64_t)(v8 - 4609) > 8 || ((1 << (v8 - 1)) & 0x103) == 0)
    && (v8 & 0xFFFFFFFFFFFFFFFCLL) != 0xD00
    && (unint64_t)(v8 - 1024) >= 0xA
    && (unint64_t)(v8 - 3072) >= 6
    && (unint64_t)(v8 - 1280) >= 0x13
    && (unint64_t)(v8 - 1536) >= 0xB
    && ((unint64_t)(v8 - 2048) >= 0xA || ((0x2DFu >> v8) & 1) == 0)
    && (v8 & 0xFFFFFFFFFFFFFFFCLL) != 0x900
    && (unint64_t)(v8 - 2560) >= 3
    && ((unint64_t)(v8 - 2816) >= 0x19 || ((0x17FFFBFu >> v8) & 1) == 0)
    || !v13)
  {
    goto LABEL_38;
  }
  int UnitsForUsage = uameasfmt_getUnitsForUsage();
  int v15 = UnitsForUsage;
  if (UnitsForUsage < 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v18 = u_errorName(U_ZERO_ERROR);
      _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_getUnitsForUsage() failed in NSUnitFormatter: %s", buf, 0xCu);
    }
    a3[v15++] = v8;
  }
  else
  {
    memcpy(a3, __src, 4 * UnitsForUsage);
  }
  return v15;
}

- (id)unitStringFromValue:(double)a3 unit:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1E8EEFC88 != -1) {
    dispatch_once(&qword_1E8EEFC88, &__block_literal_global_71);
  }
  double v6 = [(NSUnitFormatter *)self numberFormatter];
  unsigned int v7 = [(NSLocale *)self->_locale localeIdentifier];
  if (self->_prules)
  {
    uint64_t v8 = v7;
    if (![(NSNumberFormatter *)v6 checkLocaleChange]
      && [(NSString *)v8 isEqualToString:[(NSLocale *)[(NSNumberFormatter *)v6 locale] localeIdentifier]])
    {
      goto LABEL_9;
    }
    if (self->_prules) {
      uplrules_close();
    }
  }
  [(NSString *)[(NSLocale *)[(NSNumberFormatter *)[(NSUnitFormatter *)self numberFormatter] locale] localeIdentifier] getCString:v22 maxLength:100 encoding:4];
  self->_prules = (UPluralRules *)uplrules_open();
  [(NSNumberFormatter *)[(NSUnitFormatter *)self numberFormatter] resetCheckLocaleChange];
LABEL_9:
  uint64_t v9 = objc_msgSend((id)_MergedGlobals_8, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  unint64_t v10 = self->_unitStyle - 1;
  if (v10 > 2) {
    int v11 = 0;
  }
  else {
    int v11 = off_1E51FBB80[v10];
  }
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  int v12 = uplrules_select();
  if (v12 < 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      __int16 v19 = v16;
      __int16 v20 = 1024;
      int v21 = v12;
      _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** uplrules_select() failed in NSUnitFormatter: %s, len = %d", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    unsigned int v13 = [+[NSString stringWithCharacters:v22 length:v12] uppercaseString];
    NSFormattingContext v14 = [(NSNumberFormatter *)[(NSUnitFormatter *)self numberFormatter] formattingContext];
    if ((unint64_t)v14 > NSFormattingContextMiddleOfSentence) {
      int v15 = 0;
    }
    else {
      int v15 = off_1E51FBB98[v14];
    }
    return (id)[(id)_NSFoundationBundle() localizedStringForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@_%@_%@", v9, v11, v13, v15), &stru_1ECA5C228, @"UnitFormatting" value table];
  }
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = objc_alloc_init(NSNumberFormatter);
    self->_numberFormatter = v4;
    [(NSNumberFormatter *)v4 setNumberStyle:1];
    [(NSNumberFormatter *)self->_numberFormatter setPropertyBit];
    [(NSNumberFormatter *)self->_numberFormatter setLocale:self->_locale];
    numberFormatter = self->_numberFormatter;
  }
  double v5 = numberFormatter;

  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(NSUnitFormatter *)self setNumberFormatter:0];
  if (self->_formatter) {
    uameasfmt_close();
  }
  if (self->_prules) {
    uplrules_close();
  }
  locale = self->_locale;
  if (locale) {

  }
  v4.receiver = self;
  v4.super_class = (Class)NSUnitFormatter;
  [(NSUnitFormatter *)&v4 dealloc];
}

- (void)setNumberFormatter:(id)a3
{
  numberFormatter = self->_numberFormatter;
  if (numberFormatter != a3)
  {
    [(NSNumberFormatter *)numberFormatter clearPropertyBit];

    double v6 = (NSNumberFormatter *)[a3 copyWithZone:0];
    self->_numberFormatter = v6;
    [(NSNumberFormatter *)v6 setPropertyBit];
    self->_modified = 1;
  }
}

- (void)setUnitStyle:(int64_t)a3
{
  if (self->_unitStyle != a3)
  {
    self->_unitStyle = a3;
    self->_modified = 1;
  }
}

- (void)setUnitOptions:(unint64_t)a3
{
  if (self->_unitOptions != a3)
  {
    self->_unint64_t unitOptions = a3;
    self->_modified = 1;
  }
}

- (NSUnitFormatter)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSUnitFormatter;
  result = [(NSUnitFormatter *)&v3 init];
  if (result)
  {
    result->_unitStyle = 2;
    result->_unint64_t unitOptions = 0;
    result->_modified = 0;
  }
  return result;
}

- (void)setLocale:(id)a3
{
  id v3 = a3;
  if (!a3) {
    id v3 = (id)[MEMORY[0x1E4F1CA20] currentLocale];
  }
  if (([(NSLocale *)self->_locale isEqual:v3] & 1) == 0)
  {
    locale = self->_locale;
    self->_locale = (NSLocale *)v3;

    [(NSUnitFormatter *)self setNumberFormatter:0];
    self->_modified = 1;
  }
}

- (void)checkIfModified
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_modified
    || [(NSNumberFormatter *)[(NSUnitFormatter *)self numberFormatter] checkModify]
    || !self->_formatter)
  {
    if (self->_formatter) {
      uameasfmt_close();
    }
    id v3 = [(NSUnitFormatter *)self numberFormatter];
    if (![(NSNumberFormatter *)v3 getFormatter]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = 0;
      _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** [nf getFormatter] failed in NSUnitFormatter: %p", buf, 0xCu);
    }
    uint64_t v4 = unum_clone();
    if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = u_errorName(U_ZERO_ERROR);
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = v4;
      _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** unum_clone() failed in NSUnitFormatter: %s, icuNF: %p", buf, 0x16u);
    }
    [(NSString *)[(NSLocale *)[(NSNumberFormatter *)v3 locale] localeIdentifier] getCString:buf maxLength:100 encoding:4];
    int64_t unitStyle = self->_unitStyle;
    if (unitStyle == 1) {
      int v7 = 2;
    }
    else {
      int v7 = unitStyle == 2;
    }
    uint64_t v8 = (UAMeasureFormat *)uameasfmt_open();
    self->_formatter = v8;
    if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = u_errorName(U_ZERO_ERROR);
      formatter = self->_formatter;
      *(_DWORD *)int v11 = 136316162;
      int v12 = v9;
      __int16 v13 = 2048;
      NSFormattingContext v14 = formatter;
      __int16 v15 = 2080;
      uint64_t v16 = buf;
      __int16 v17 = 1024;
      int v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v4;
      _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_open() failed in NSUnitFormatter: %s, _formatter: %p, localeID: %s, width: %u, icuNF: %p", v11, 0x30u);
    }
    self->_modified = 0;
    [(NSNumberFormatter *)[(NSUnitFormatter *)self numberFormatter] resetCheckModify];
  }
}

- (unint64_t)unitOptions
{
  return self->_unitOptions;
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (!locale)
  {
    locale = (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
    self->_locale = locale;
  }
  uint64_t v4 = locale;

  return v4;
}

- (int64_t)unitStyle
{
  return self->_unitStyle;
}

- (id)stringForValue1:(double)a3 unit1:(unint64_t)a4 value2:(double)a5 unit2:(unint64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NSUnitFormatter *)self checkIfModified];
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  unsigned int v6 = uameasfmt_formatMultiple();
  unsigned int v7 = v6;
  if ((int)v6 >= 1)
  {
    if (v6 < 0x65) {
      return +[NSString stringWithCharacters:v19 length:v6];
    }
    int v12 = malloc_type_malloc(2 * v6, 0xC74DC359uLL);
    if (v12)
    {
      __int16 v13 = v12;
      uameasfmt_formatMultiple();
      int v11 = +[NSString stringWithCharacters:v13 length:v7];
      free(v13);
      return v11;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = (const char *)(2 * v7);
      uint64_t v8 = MEMORY[0x1E4F14500];
      uint64_t v9 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
      uint32_t v10 = 12;
      goto LABEL_4;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = u_errorName(U_ZERO_ERROR);
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "*** uameasfmt_formatMultiple() failed in NSUnitFormatter: %s, len = %d";
    uint32_t v10 = 18;
LABEL_4:
    _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
  }
  return 0;
}

- (id)stringFromUnit:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_unitHasSpecifierAndIsDimensional(a3))
  {
    [(NSUnitFormatter *)self checkIfModified];
    [a3 specifier];
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    unsigned int UnitName = uameasfmt_getUnitName();
    unsigned int v6 = UnitName;
    if ((int)UnitName >= 1)
    {
      if (UnitName < 0x65) {
        return +[NSString stringWithCharacters:v19 length:UnitName];
      }
      int v12 = malloc_type_malloc(2 * UnitName, 0x73771978uLL);
      if (v12)
      {
        __int16 v13 = v12;
        int v14 = uameasfmt_getUnitName();
        if (v14 >= 1)
        {
          uint32_t v10 = +[NSString stringWithCharacters:v13 length:v14];
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v16 = u_errorName(U_ZERO_ERROR);
            __int16 v17 = 1024;
            int v18 = v14;
            _os_log_impl(&dword_181795000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d", buf, 0x12u);
          }
          uint32_t v10 = 0;
        }
        free(v13);
        return v10;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v16 = (const char *)(2 * v6);
        unsigned int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "*** malloc returned NULL in NSUnitFormatter! Tried to allocate %zu bytes";
        uint32_t v9 = 12;
        goto LABEL_5;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = u_errorName(U_ZERO_ERROR);
      __int16 v17 = 1024;
      int v18 = v6;
      unsigned int v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "*** uameasfmt_getUnitName() failed in NSUnitFormatter: %s, len = %d";
      uint32_t v9 = 18;
LABEL_5:
      _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    }
    return 0;
  }

  return (id)[a3 symbol];
}

- (NSUnitFormatter)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSUnitFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeIntegerForKey:@"NS.unitOptions"];
  if ([a3 containsValueForKey:@"NS.unitStyle"]) {
    uint64_t v6 = [a3 decodeIntegerForKey:@"NS.unitStyle"];
  }
  else {
    uint64_t v6 = 2;
  }
  if ([a3 containsValueForKey:@"NS.locale"])
  {
    unsigned int v7 = (void *)[a3 decodeObjectOfClass:MEMORY[0x1E4F1CA20] forKey:@"NS.locale"];
    if (!v7)
    {

      int v18 = @"NSLocalizedDescription";
      v19[0] = @"Locale has been corrupted!";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint32_t v9 = (__CFString **)v19;
      uint32_t v10 = &v18;
LABEL_18:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1)));
      return 0;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  if ([a3 containsValueForKey:@"NS.numberFormatter"])
  {
    int v11 = (void *)[a3 decodeObjectOfClass:NSNumberFormatter forKey:@"NS.numberFormatter"];
    if (!v11)
    {

      uint64_t v16 = @"NSLocalizedDescription";
      __int16 v17 = @"Number formatter has been corrupted!";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint32_t v9 = &v17;
      uint32_t v10 = &v16;
      goto LABEL_18;
    }
    int v12 = v11;
    [v11 setPropertyBit];
  }
  else
  {
    int v12 = 0;
  }
  __int16 v13 = [(NSUnitFormatter *)self init];
  int v14 = v13;
  if (v13)
  {
    if (v6 != 2) {
      v13->_int64_t unitStyle = v6;
    }
    v13->_unint64_t unitOptions = v5;
    v13->_locale = (NSLocale *)[v7 copy];
    v14->_numberFormatter = (NSNumberFormatter *)[v12 copy];
    v14->_modified = 1;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSUnitFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [a3 encodeInteger:self->_unitOptions forKey:@"NS.unitOptions"];
  int64_t unitStyle = self->_unitStyle;
  if (unitStyle != 2) {
    [a3 encodeInteger:unitStyle forKey:@"NS.unitStyle"];
  }
  locale = self->_locale;
  if (locale) {
    [a3 encodeObject:locale forKey:@"NS.locale"];
  }
  if (self->_numberFormatter)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUnitStyle:self->_unitStyle];
  [v4 setNumberFormatter:self->_numberFormatter];
  [v4 setLocale:self->_locale];
  return v4;
}

@end