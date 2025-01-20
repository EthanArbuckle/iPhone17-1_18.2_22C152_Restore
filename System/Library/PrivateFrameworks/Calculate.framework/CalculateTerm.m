@interface CalculateTerm
+ (id)termWithValue:(id)a3 units:(id)a4 result:(id)a5;
- ($71D83D51AB0F57F7CF166351F850C832)decimalValue;
- (BOOL)isCurrency;
- (BOOL)isEqual:(id)a3;
- (CalculateResult)result;
- (CalculateTerm)init;
- (CalculateUnit)primaryUnit;
- (NSArray)units;
- (NSNumber)forceScientificNotation;
- (NSNumber)value;
- (NSString)formattedResult;
- (NSString)formattedUnit;
- (NSString)formattedValue;
- (double)_valueWithoutIrrelevantDecimals;
- (id)emptyNumeratorString;
- (id)formattedUnitReplacingFirstNumerator:(id)a3;
- (id)locale;
- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unit:(id)a6;
- (id)numberFormatter;
- (id)resultContainingNumberFormatter;
- (int64_t)compare:(id)a3;
- (void)_setDecimalValue:(id)a3;
- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4;
- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4 forValue:(id)a5;
- (void)setDecimalValue:(id)a3;
- (void)setForceScientificNotation:(id)a3;
- (void)setResult:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CalculateTerm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceScientificNotation, 0);
  objc_destroyWeak((id *)&self->_result);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setForceScientificNotation:(id)a3
{
}

- (NSNumber)forceScientificNotation
{
  return self->_forceScientificNotation;
}

- (void)setDecimalValue:(id)a3
{
  self->_decimalValue = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
}

- ($71D83D51AB0F57F7CF166351F850C832)decimalValue
{
  unint64_t v2 = self->_decimalValue.w[1];
  unint64_t v3 = self->_decimalValue.w[0];
  result.var0[1] = v2;
  result.var0[0] = v3;
  return result;
}

- (void)setResult:(id)a3
{
}

- (CalculateResult)result
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_result);
  return (CalculateResult *)WeakRetained;
}

- (NSArray)units
{
  return self->_units;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CalculateTerm *)self compare:v4] == 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CalculateTerm *)self value];
  v6 = [v4 value];
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    v8 = [(CalculateTerm *)self units];
    int v9 = [v8 count];
    v10 = [v4 units];
    int v11 = [v10 count];
    int64_t v7 = v9 < v11 ? -1 : v9 > v11;

    if (!v7)
    {
      v13 = [(CalculateTerm *)self units];
      int64_t v7 = [v13 count];

      if (v7)
      {
        unint64_t v14 = 0;
        while (1)
        {
          v15 = [(CalculateTerm *)self units];
          v16 = [v15 objectAtIndexedSubscript:v14];
          v17 = [v4 units];
          v18 = [v17 objectAtIndexedSubscript:v14];
          int64_t v7 = [v16 compare:v18];

          if (v7) {
            break;
          }
          ++v14;
          v19 = [(CalculateTerm *)self units];
          unint64_t v20 = [v19 count];

          if (v14 >= v20)
          {
            int64_t v7 = 0;
            break;
          }
        }
      }
    }
  }

  return v7;
}

- (NSString)formattedResult
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v3 = [(CalculateTerm *)self units];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
      if ([v8 isNumerator]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v8;

    if (!v9) {
      goto LABEL_15;
    }
    id v10 = [(CalculateTerm *)self locale];
    [(CalculateTerm *)self _valueWithoutIrrelevantDecimals];
    int v11 = -[CalculateTerm localizedNameForValue:locale:retainingFormat:unit:](self, "localizedNameForValue:locale:retainingFormat:unit:", v10, 1, v9);
    v12 = [(CalculateTerm *)self formattedValue];
    v13 = [v11 stringByReplacingOccurrencesOfString:@"%g" withString:v12];

    unint64_t v14 = [(CalculateTerm *)self numberFormatter];
    int v15 = [v9 exponent];
    if (v15 >= 0) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = -v15;
    }
    v17 = [v14 formatString:v13 byAppendingExponent:v16];

    v18 = [(CalculateTerm *)self formattedUnitReplacingFirstNumerator:v17];
  }
  else
  {
LABEL_9:

LABEL_15:
    id v9 = [(CalculateTerm *)self formattedUnit];
    id v10 = [(CalculateTerm *)self formattedValue];
    if ([v9 length])
    {
      v19 = [(CalculateTerm *)self emptyNumeratorString];
      int v20 = [v9 hasPrefix:v19];
      v21 = NSString;
      if (v20)
      {
        v22 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v19, "length"));
        v18 = [v21 stringWithFormat:@"%@%@", v10, v22];
      }
      else
      {
        v18 = [NSString stringWithFormat:@"%@ %@", v10, v9];
      }
    }
    else
    {
      id v10 = v10;
      v18 = v10;
    }
  }

  return (NSString *)v18;
}

- (id)formattedUnitReplacingFirstNumerator:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43 = [(CalculateTerm *)self locale];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v5 = [(CalculateTerm *)self units];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v56 + 1) + 8 * i) isNumerator])
        {
          char v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v10 = 1;
LABEL_11:

  int v11 = objc_opt_new();
  v12 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [(CalculateTerm *)self units];
  v45 = v11;
  uint64_t v49 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (!v49) {
    goto LABEL_46;
  }
  int v50 = 0;
  char v13 = 1;
  uint64_t v47 = *(void *)v53;
  v48 = v12;
  v51 = self;
  id v44 = v4;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(obj);
      }
      int v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
      int v16 = [v15 isNumerator];
      double v17 = 1.0;
      if (!v16)
      {
        if ((v10 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_20:
        [(CalculateTerm *)self _valueWithoutIrrelevantDecimals];
        double v17 = v18;
        goto LABEL_21;
      }
      if (v13) {
        goto LABEL_20;
      }
LABEL_21:
      v19 = [v15 name];
      char v20 = v16 ^ 1;
      if (v4) {
        int v21 = v16 ^ 1;
      }
      else {
        int v21 = 1;
      }
      if (((v21 | v50) & 1) == 0)
      {
        id v29 = v4;
        int v50 = 1;
        v12 = v48;
        goto LABEL_37;
      }
      int v22 = [v15 exponent];
      [(CalculateTerm *)self result];
      long long v24 = v23 = self;
      int v25 = [v24 localizeUnit];

      if (!v25) {
        goto LABEL_32;
      }
      long long v26 = [(CalculateTerm *)v23 localizedNameForValue:v43 locale:0 retainingFormat:v15 unit:v17];

      if (v22 != 1)
      {
        long long v27 = [v15 unitInfo];
        int v28 = [v27 impliesDivision];

        if (v28)
        {
          v19 = [NSString stringWithFormat:@"(%@)", v26];

LABEL_32:
          v12 = v48;
          goto LABEL_33;
        }
      }
      if ([v26 hasSuffix:@"²"])
      {
        v19 = [v26 stringByReplacingOccurrencesOfString:@"²" withString:&stru_1F1868970];

        v22 *= 2;
        goto LABEL_32;
      }
      v12 = v48;
      if ([v26 hasSuffix:@"³"])
      {
        v19 = [v26 stringByReplacingOccurrencesOfString:@"³" withString:&stru_1F1868970];

        v22 *= 3;
      }
      else
      {
        v19 = v26;
      }
LABEL_33:
      v30 = [(CalculateTerm *)v51 numberFormatter];
      v31 = v30;
      if (v22 >= 0) {
        uint64_t v32 = v22;
      }
      else {
        uint64_t v32 = -v22;
      }
      id v29 = [v30 formatString:v19 byAppendingExponent:v32];

      v19 = v31;
      id v4 = v44;
      int v11 = v45;
      char v20 = v16 ^ 1;
LABEL_37:

      if (v16) {
        v33 = v11;
      }
      else {
        v33 = v12;
      }
      v10 &= v16;
      v13 &= v20;
      [v33 addObject:v29];

      ++v14;
      self = v51;
    }
    while (v49 != v14);
    uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    uint64_t v49 = v34;
  }
  while (v34);
LABEL_46:

  if ([v11 count] || objc_msgSend(v12, "count"))
  {
    v35 = [(CalculateTerm *)self emptyNumeratorString];
    if ([v11 count])
    {
      uint64_t v36 = [v11 componentsJoinedByString:@"·"];

      v35 = (void *)v36;
    }
    if ([v12 count] == 1)
    {
      v37 = NSString;
      v38 = [v12 objectAtIndexedSubscript:0];
      [v37 stringWithFormat:@"/%@", v38];
      goto LABEL_54;
    }
    if ([v12 count])
    {
      v39 = NSString;
      v38 = [v12 componentsJoinedByString:@"·"];
      [v39 stringWithFormat:@"/(%@)", v38];
LABEL_54:
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = &stru_1F1868970;
    }
    int v11 = v45;
    v41 = [NSString stringWithFormat:@"%@%@", v35, v40];
  }
  else
  {
    v41 = &stru_1F1868970;
  }

  return v41;
}

- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unit:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = [(CalculateTerm *)self result];
  char v13 = v12;
  if (v12)
  {
    [v12 resolvedUnitFormats];
  }
  else
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  uint64_t v14 = *((void *)&v21 + objc_msgSend(v10, "unitType", v21, v22, v23, v24, v25, v26, v27, v28, v29));
  int v15 = [v13 inputValueAndUnit];

  uint64_t v16 = 2;
  uint64_t v17 = 4;
  if (v14 != 3) {
    uint64_t v17 = v14;
  }
  if (v14 != 1) {
    uint64_t v16 = v17;
  }
  if (v15) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v14;
  }
  v19 = [v10 localizedNameForValue:v11 locale:v6 retainingFormat:v18 unitFormat:a3];

  return v19;
}

- (NSString)formattedUnit
{
  return (NSString *)[(CalculateTerm *)self formattedUnitReplacingFirstNumerator:0];
}

- (CalculateUnit)primaryUnit
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v2 = [(CalculateTerm *)self units];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isNumerator])
        {
          id v9 = v8;

          goto LABEL_15;
        }
        if (!v5) {
          id v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }

  id v5 = v5;
  id v9 = v5;
LABEL_15:

  return (CalculateUnit *)v9;
}

- (id)emptyNumeratorString
{
  unint64_t v2 = [(CalculateTerm *)self numberFormatter];
  uint64_t v3 = [v2 stringFromNumber:&unk_1F18724A0];

  return v3;
}

- (double)_valueWithoutIrrelevantDecimals
{
  int v44 = 0;
  uint64_t v3 = NSString;
  uint64_t v4 = [(CalculateTerm *)self value];
  id v5 = [v3 stringWithFormat:@"%@", v4];
  uint64_t v6 = (unsigned __int8 *)[v5 UTF8String];

  unint64_t v7 = __bid128_from_string(v6, 4, &v44);
  uint64_t v9 = v8;
  int v10 = __bid128_quiet_less(v7, v8, 0, 0x3040000000000000, &v44);
  if (v10) {
    v9 &= ~0x8000000000000000;
  }
  if (__bid128_quiet_greater(v7, v9, 0x2710uLL, 0x3040000000000000, &v44))
  {
    unint64_t v11 = __bid128_add(v7, v9, 0x2710uLL, 0xB040000000000000, 4, &v44);
    unint64_t v13 = __bid128_fmod(v11, v12, 0x2710uLL, 0x3040000000000000uLL, &v44);
    unint64_t v7 = __bid128_add(v13, v14, 0x2710uLL, 0x3040000000000000, 4, &v44);
    uint64_t v9 = v15;
  }
  uint64_t v43 = 0;
  [(CalculateTerm *)self getMaximumFractionDigits:&v43 minimumFractionDigits:0];
  if (v43)
  {
    if ((int)v43 >= 0) {
      unint64_t v16 = v43;
    }
    else {
      unint64_t v16 = -(int)v43;
    }
    if ((int)v43 < 0) {
      unint64_t v17 = 0xB040000000000000;
    }
    else {
      unint64_t v17 = 0x3040000000000000;
    }
    unint64_t v18 = bid128_pow_fix(0xAuLL, 0x3040000000000000uLL, v16, v17, 4u, &v44);
    unint64_t v20 = v19;
    unint64_t v21 = __bid128_mul(v7, v9, v18, v19, 4u, &v44);
    unint64_t v23 = __bid128_round_integral_exact(v21, v22, 4, &v44);
    unint64_t v25 = __bid128_div(v23, v24, v18, v20, 4, &v44);
    uint64_t v27 = v26;
    unint64_t v28 = __bid128_div(1uLL, 0x3040000000000000uLL, 0xAuLL, 0x3040000000000000uLL, 4, &v44);
    if ((int)v43 + 2 < 0) {
      unint64_t v30 = (-2 - v43);
    }
    else {
      unint64_t v30 = (v43 + 2);
    }
    if ((int)v43 <= -3) {
      unint64_t v31 = 0xB040000000000000;
    }
    else {
      unint64_t v31 = 0x3040000000000000;
    }
    unint64_t v32 = bid128_pow_fix(v28, v29, v30, v31, 4u, &v44);
    uint64_t v34 = v33;
    unint64_t v35 = __bid128_round_integral_exact(v25, v27, 4, &v44);
    uint64_t v37 = v36;
    unint64_t v38 = __bid128_sub(v35, v36, v25, v27, 4, &v44);
    int v40 = __bid128_quiet_less_equal(v38, v39 & 0x7FFFFFFFFFFFFFFFLL, v32, v34, &v44);
    if (v40) {
      uint64_t v9 = v37;
    }
    else {
      uint64_t v9 = v27;
    }
    if (v40) {
      unint64_t v7 = v35;
    }
    else {
      unint64_t v7 = v25;
    }
  }
  if (v10) {
    unint64_t v41 = v9 ^ 0x8000000000000000;
  }
  else {
    unint64_t v41 = v9;
  }
  return __bid128_to_binary64(v7, v41, 4, &v44);
}

- (NSString)formattedValue
{
  uint64_t v3 = [(CalculateTerm *)self resultContainingNumberFormatter];
  uint64_t v4 = [(CalculateTerm *)self numberFormatter];
  if (v3)
  {
    int v5 = [v3 autoScientificNotation];
    uint64_t v6 = [v3 scientificNotationFormat];
  }
  else
  {
    unint64_t v7 = [(CalculateTerm *)self result];

    if (v7)
    {
      unint64_t v8 = [(CalculateTerm *)self result];
      int v5 = [v8 autoScientificNotation];

      uint64_t v9 = [(CalculateTerm *)self result];
      uint64_t v6 = [v9 scientificNotationFormat];
    }
    else
    {
      uint64_t v6 = 1;
      int v5 = 1;
    }
  }
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  [(CalculateTerm *)self getMaximumFractionDigits:&v91 minimumFractionDigits:&v90];
  uint64_t v79 = v6;
  if ([v4 usesSignificantDigits]) {
    uint64_t v10 = [v4 maximumSignificantDigits];
  }
  else {
    uint64_t v10 = [v4 maximumIntegerDigits];
  }
  unint64_t v11 = v10;
  if (!v10
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_result),
        int v13 = [WeakRetained isSimpleVerticalMath],
        WeakRetained,
        v13))
  {
    unint64_t v11 = 34;
  }
  if (v11 >= 0x22) {
    uint64_t v14 = 34;
  }
  else {
    uint64_t v14 = v11;
  }
  int v15 = [(CalculateTerm *)self isCurrency];
  int v89 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CalculateTerm_formattedValue__block_invoke;
  aBlock[3] = &unk_1E6365780;
  id v16 = v4;
  id v87 = v16;
  uint64_t v88 = v14;
  unint64_t v17 = _Block_copy(aBlock);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __31__CalculateTerm_formattedValue__block_invoke_2;
  v84[3] = &unk_1E63657A8;
  id v18 = v17;
  id v85 = v18;
  uint64_t v19 = _Block_copy(v84);
  unint64_t v20 = [(CalculateTerm *)self decimalValue];
  if (__bid128_quiet_greater(v20, v21, 1uLL, 0xB040000000000000, &v89))
  {
    unint64_t v22 = [(CalculateTerm *)self decimalValue];
    v5 &= (__bid128_quiet_less(v22, v23, 1uLL, 0x3040000000000000, &v89) == 0) | ~v15;
  }
  uint64_t v24 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1 exponent:0 isNegative:1];
  unint64_t v25 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1 exponent:(__int16)v14 isNegative:0];
  v80 = (void *)v24;
  v81 = [v25 decimalNumberByMultiplyingBy:v24];
  forceScientificNotation = self->_forceScientificNotation;
  if (!forceScientificNotation)
  {
    v77 = v19;
    uint64_t v27 = [(CalculateTerm *)self value];
    if ([v27 compare:v25] != -1)
    {
LABEL_21:

      uint64_t v19 = v77;
      goto LABEL_22;
    }
    v75 = v3;
    uint64_t v33 = [(CalculateTerm *)self value];
    uint64_t v34 = [v33 compare:v81];

    if (v34 == 1) {
      int v35 = v5;
    }
    else {
      int v35 = 0;
    }
    if (v35 != 1)
    {
      uint64_t v3 = v75;
      uint64_t v19 = v77;
      if (v34 == 1) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    uint64_t v27 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1 exponent:(__int16)(1 - v14) isNegative:0];
    uint64_t v36 = [v27 decimalNumberByMultiplyingBy:v80];
    uint64_t v37 = [(CalculateTerm *)self value];
    if ([v37 compare:v27] == 1)
    {
    }
    else
    {
      v65 = [(CalculateTerm *)self value];
      uint64_t v66 = [v65 compare:v36];

      if (v66 != -1)
      {
LABEL_56:

        uint64_t v3 = v75;
        goto LABEL_21;
      }
    }
    v67 = objc_opt_new();
    v68 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v67 setLocale:v68];

    [v67 setNumberStyle:0];
    if ([v16 usesSignificantDigits]) {
      objc_msgSend(v67, "setMaximumSignificantDigits:", objc_msgSend(v16, "maximumSignificantDigits"));
    }
    else {
      [v67 setMaximumFractionDigits:v91];
    }
    v69 = [(CalculateTerm *)self value];
    v70 = [v67 stringFromNumber:v69];

    if (([v70 isEqualToString:@"0"] & 1) == 0
      && ![v70 isEqualToString:@"-0"])
    {

      uint64_t v3 = v75;
      uint64_t v19 = v77;
LABEL_24:
      unint64_t v30 = [(CalculateTerm *)self value];
      unint64_t v31 = (*((void (**)(id, void *, uint64_t, uint64_t))v18 + 2))(v18, v30, v91, v90);
      goto LABEL_25;
    }

    goto LABEL_56;
  }
  if (![(NSNumber *)forceScientificNotation BOOLValue]) {
    goto LABEL_24;
  }
LABEL_22:
  if ([v16 numberStyle] == 5) {
    goto LABEL_24;
  }
  unint64_t v28 = [(CalculateTerm *)self decimalValue];
  if (__bid128_quiet_equal(v28, v29, 0, 0x3040000000000000uLL, &v89)) {
    goto LABEL_24;
  }
  v76 = v3;
  v78 = (void (**)(void, void *))v19;
  unint64_t v38 = __bid128_log10(self->_decimalValue.w[0], self->_decimalValue.w[1] & 0x7FFFFFFFFFFFFFFFLL, 4u, &v89);
  unint64_t v71 = __bid128_round_integral_negative(v38, v39, &v89);
  uint64_t v74 = v40;
  unint64_t v41 = bid128_pow_fix(0xAuLL, 0x3040000000000000uLL, v71, v40, 4u, &v89);
  unint64_t v43 = __bid128_div(self->_decimalValue.w[0], self->_decimalValue.w[1], v41, v42, 4, &v89);
  unint64_t v45 = v44;
  unint64_t v30 = +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v43, v44);
  [NSNumber numberWithInt:10];
  v73 = unint64_t v72 = v45;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:forValue:](self, "getMaximumFractionDigits:minimumFractionDigits:forValue:", &v83, &v82, v43, v45);
  v46 = (*((void (**)(id, void *, uint64_t, uint64_t))v18 + 2))(v18, v30, v83, v82);
  uint64_t v47 = [v16 decimalSeparator];
  if (!v47
    || (v48 = (void *)v47,
        [v16 decimalSeparator],
        uint64_t v49 = objc_claimAutoreleasedReturnValue(),
        uint64_t v50 = [v46 rangeOfString:v49],
        v49,
        v48,
        v50 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v50 = [v46 length];
  }
  if ((unint64_t)(v50 + (int)-(uint64_t)__bid128_quiet_less(v43, v72, 0, 0x3040000000000000, &v89)) < 2)
  {
    uint64_t v58 = v79;
    long long v57 = v46;
    unint64_t v51 = v71;
  }
  else
  {
    unint64_t v51 = __bid128_add(v71, v74, 1uLL, 0x3040000000000000, 4, &v89);
    uint64_t v74 = v52;
    uint64_t v53 = __bid128_div(v43, v72, 0xAuLL, 0x3040000000000000uLL, 4, &v89);
    uint64_t v55 = +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v53, v54);

    uint64_t v56 = (*((void (**)(id, uint64_t, uint64_t, uint64_t))v18 + 2))(v18, v55, v83, v82);

    unint64_t v30 = (void *)v55;
    long long v57 = (void *)v56;
    uint64_t v58 = v79;
  }
  if (v58 == 2)
  {
    v61 = objc_msgSend(NSString, "stringWithFormat:", @"%d", __bid128_to_int32_int(v51, v74, &v89));
    v60 = [v16 formatString:v61 usesGroupingSeparator:0];

    uint64_t v62 = NSString;
    v63 = v78[2](v78, v73);
    unint64_t v31 = [v62 stringWithFormat:@"%@*%@^%@", v57, v63, v60];
  }
  else
  {
    if (v58)
    {
      v64 = v78[2](v78, v73);
      v60 = objc_msgSend(v16, "formatString:byAppendingExponent:", v64, __bid128_to_int32_int(v51, v74, &v89));

      [NSString stringWithFormat:@"%@×%@", v57, v60];
    }
    else
    {
      long long v59 = objc_msgSend(NSString, "stringWithFormat:", @"%d", __bid128_to_int32_int(v51, v74, &v89));
      v60 = [v16 formatString:v59 usesGroupingSeparator:0];

      [NSString stringWithFormat:@"%@e%@", v57, v60];
    unint64_t v31 = };
  }
  uint64_t v3 = v76;

  uint64_t v19 = v78;
LABEL_25:

  return (NSString *)v31;
}

id __31__CalculateTerm_formattedValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__388;
  uint64_t v24 = __Block_byref_object_dispose__389;
  id v25 = 0;
  unint64_t v8 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __31__CalculateTerm_formattedValue__block_invoke_550;
  v13[3] = &unk_1E6365758;
  id v9 = v8;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = *(void *)(a1 + 40);
  id v14 = v9;
  id v16 = &v20;
  id v10 = v7;
  id v15 = v10;
  [v9 ignoreChanges:v13];
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __31__CalculateTerm_formattedValue__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__CalculateTerm_formattedValue__block_invoke_550(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) maximumFractionDigits];
  uint64_t v3 = [*(id *)(a1 + 32) minimumFractionDigits];
  uint64_t v4 = [*(id *)(a1 + 32) maximumIntegerDigits];
  [*(id *)(a1 + 32) setMaximumFractionDigits:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 64) >= *(void *)(a1 + 56)) {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 64);
  }
  [*(id *)(a1 + 32) setMinimumFractionDigits:v5];
  unint64_t v6 = [*(id *)(a1 + 32) maximumIntegerDigits];
  if (v6 <= *(void *)(a1 + 72)) {
    unint64_t v7 = *(void *)(a1 + 72);
  }
  else {
    unint64_t v7 = v6;
  }
  [*(id *)(a1 + 32) setMaximumIntegerDigits:v7];
  uint64_t v8 = [*(id *)(a1 + 32) stringFromNumber:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(a1 + 32) setMaximumFractionDigits:v2];
  [*(id *)(a1 + 32) setMinimumFractionDigits:v3];
  id v11 = *(void **)(a1 + 32);
  return [v11 setMaximumIntegerDigits:v4];
}

- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4 forValue:(id)a5
{
  unint64_t v5 = a5.var0[1];
  unint64_t v6 = a5.var0[0];
  id v48 = [(CalculateTerm *)self resultContainingNumberFormatter];
  id v10 = [(CalculateTerm *)self numberFormatter];
  if (v48)
  {
    int v11 = [v48 flexibleFractionDigits];
  }
  else
  {
    unint64_t v12 = [(CalculateTerm *)self result];

    if (v12)
    {
      int v13 = [(CalculateTerm *)self result];
      int v11 = [v13 flexibleFractionDigits];
    }
    else
    {
      int v11 = 1;
    }
  }
  int64_t v14 = [v10 minimumFractionDigits];
  if (-[CalculateTerm isCurrency](self, "isCurrency") && [v10 numberStyle] != 4)
  {
    uint64_t v47 = a4;
    if (getMaximumFractionDigits_minimumFractionDigits_forValue__onceToken != -1) {
      dispatch_once(&getMaximumFractionDigits_minimumFractionDigits_forValue__onceToken, &__block_literal_global_508);
    }
    id v16 = [(CalculateTerm *)self units];
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];
    uint64_t v18 = [v17 name];

    uint64_t v19 = [(id)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces objectForKeyedSubscript:v18];

    if (v19)
    {
      uint64_t v20 = [(id)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces objectForKeyedSubscript:v18];
      unint64_t v15 = [v20 integerValue];
      int64_t v14 = v15;
    }
    else
    {
      uint64_t v20 = objc_opt_new();
      [v20 setCurrencyCode:v18];
      [v20 setNumberStyle:2];
      int64_t v14 = [v20 maximumFractionDigits];
      unint64_t v15 = [v20 maximumFractionDigits];
    }

    a4 = v47;
  }
  else
  {
    unint64_t v15 = -1;
  }
  int v49 = 0;
  if (v15 == -1) {
    int v21 = v11;
  }
  else {
    int v21 = 0;
  }
  if (v21 == 1)
  {
    uint64_t v34 = v5 & 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v22 = __bid128_round_integral_zero(v6, v5 & 0x7FFFFFFFFFFFFFFFLL, &v49);
    unint64_t v24 = v23;
    unint64_t v25 = __bid128_sub(v6, v34, v22, v23, 4, &v49);
    unint64_t v27 = __bid128_log10(v25, v26, 4u, &v49);
    unint64_t v29 = __bid128_round_integral_negative(v27, v28, &v49);
    unint64_t v31 = __bid128_add(v29, v30 ^ 0x8000000000000000, 1uLL, 0xB040000000000000, 4, &v49);
    int v33 = __bid128_to_int32_int(v31, v32, &v49);
    LODWORD(v34) = v33 & ~(v33 >> 31);
    if (__bid128_quiet_greater(v22, v24, 0, 0x3040000000000000, &v49))
    {
      unint64_t v35 = __bid128_log10(v22, v24, 4u, &v49);
      unint64_t v37 = __bid128_round_integral_negative(v35, v36, &v49);
      unsigned int v39 = ~__bid128_to_int32_int(v37, v38, &v49);
    }
    else
    {
      unsigned int v39 = 0;
    }
    int v40 = [v10 maximumIntegerDigits];
    unsigned int v41 = (v39 + v40) & ~((int)(v39 + v40) >> 31);
    if (v41 >= v34) {
      uint64_t v34 = v34;
    }
    else {
      uint64_t v34 = v41;
    }
    unint64_t v15 = [v10 maximumFractionDigits] + v34;
  }
  if (v15 == -1) {
    unint64_t v15 = [v10 maximumFractionDigits];
  }
  p_$71D83D51AB0F57F7CF166351F850C832 result = &self->_result;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_result);
  int v44 = [WeakRetained minimumFractionDigits];

  if (v44)
  {
    id v45 = objc_loadWeakRetained((id *)p_result);
    int v46 = [v45 minimumFractionDigits];

    if (v14 <= v46) {
      int64_t v14 = v46;
    }
  }
  if (a3) {
    *a3 = v15;
  }
  if (a4) {
    *a4 = v14;
  }
}

void __73__CalculateTerm_getMaximumFractionDigits_minimumFractionDigits_forValue___block_invoke()
{
  v0 = (void *)getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces;
  getMaximumFractionDigits_minimumFractionDigits_forValue__decimalPlaces = (uint64_t)&unk_1F1872E50;
}

- (void)getMaximumFractionDigits:(unint64_t *)a3 minimumFractionDigits:(unint64_t *)a4
{
  uint64_t v8 = [(CalculateTerm *)self decimalValue];
  -[CalculateTerm getMaximumFractionDigits:minimumFractionDigits:forValue:](self, "getMaximumFractionDigits:minimumFractionDigits:forValue:", a3, a4, v8, v7);
}

- (BOOL)isCurrency
{
  uint64_t v3 = [(CalculateTerm *)self units];
  if ([v3 count] == 1)
  {
    uint64_t v4 = [(CalculateTerm *)self units];
    unint64_t v5 = [v4 objectAtIndexedSubscript:0];
    BOOL v6 = [v5 unitType] == 16;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)locale
{
  uint64_t v2 = [(CalculateTerm *)self result];
  if (!v2)
  {
    uint64_t v8 = 0;
LABEL_14:
    uint64_t v7 = +[Localize systemLocale];
    goto LABEL_15;
  }
  uint64_t v3 = (void *)v2;
  do
  {
    uint64_t v4 = [v3 locales];
    if (v4)
    {
      unint64_t v5 = [v3 locales];
      if ([v5 count])
      {
        BOOL v6 = [v3 locales];
        uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v8 = [v3 parent];

    if (v7) {
      break;
    }
    uint64_t v3 = v8;
  }
  while (v8);
  if (!v7) {
    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

- (id)numberFormatter
{
  uint64_t v3 = [(CalculateTerm *)self resultContainingNumberFormatter];
  uint64_t v4 = v3;
  if (!v3 || ([v3 numberFormatter], (unint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v6 = [(CalculateTerm *)self locale];
    unint64_t v5 = +[CalculateResult defaultNumberFormatter:v6];
  }
  return v5;
}

- (id)resultContainingNumberFormatter
{
  id v2 = [(CalculateTerm *)self result];
  if (v2)
  {
    while (1)
    {
      uint64_t v3 = [v2 numberFormatter];
      if (v3) {
        break;
      }
      uint64_t v4 = [v2 parent];

      id v2 = (id)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    unint64_t v5 = (void *)v3;
    id v2 = v2;
  }
LABEL_6:
  return v2;
}

- (void)_setDecimalValue:(id)a3
{
  self->_decimalValue = ($739D1A12408C92E4BFA0C2DF4C691557)a3;
  +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:");
  self->_value = (NSNumber *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1F41817F8]();
}

- (CalculateTerm)init
{
  v3.receiver = self;
  v3.super_class = (Class)CalculateTerm;
  $71D83D51AB0F57F7CF166351F850C832 result = [(CalculateTerm *)&v3 init];
  if (result)
  {
    result->_decimalValue.w[0] = 0;
    result->_decimalValue.w[1] = 0x3040000000000000;
  }
  return result;
}

+ (id)termWithValue:(id)a3 units:(id)a4 result:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  int v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v7;
  id v12 = v7;

  objc_storeWeak((id *)(v10 + 24), v9);
  int v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v8;

  return (id)v10;
}

@end