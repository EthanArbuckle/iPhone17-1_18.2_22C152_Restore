@interface CalculateResult
+ (CalculateResult)resultWithResultTree:(TreeObject *)a3 parseTree:(TreeObject *)a4 locales:(id)a5 numberFormatter:(id)a6 unitsInfo:(id)a7 unitType:(int)a8 unitExponent:(int)a9 expression:(id)a10 isTrivial:(BOOL)a11 isPartialExpression:(BOOL)a12 variableLookups:(id)a13 variableResultTrees:(TreeObject *)a14 variableResultTreesCount:(int)a15 resolvedUnitFormats:(id *)a16 forceResult:(BOOL)a17 assumeDegrees:(BOOL)a18 localizeUnit:(BOOL)a19 unitFormat:(unint64_t)a20 autoScientificNotation:(BOOL)a21 scientificNotationFormat:(unint64_t)a22 flexibleFractionDigits:(BOOL)a23 isSimpleVerticalMath:(BOOL)a24 minimumFractionDigits:(int)a25 hasStaleCurrencyData:(BOOL)a26;
+ (id)decimalNumberWithDecimal128:(id)a3;
+ (id)defaultNumberFormatter:(id)a3;
+ (void)preferMeasurementSystemsForLocale:(id)a3 preferred:(unint64_t *)a4 fallback:(unint64_t *)a5;
- ($786B50094F6E1A5F953E25B90648E2E3)resolvedUnitFormats;
- (BOOL)assumeDegrees;
- (BOOL)autoScientificNotation;
- (BOOL)flexibleFractionDigits;
- (BOOL)hasStaleCurrencyData;
- (BOOL)isAcceptableConversion:(TreeObject *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaN;
- (BOOL)isPartialExpression;
- (BOOL)isSimpleVerticalMath;
- (BOOL)isTrivial;
- (BOOL)localizeUnit;
- (BOOL)synchronous;
- (CalculateResult)init;
- (CalculateResult)inputValueAndUnit;
- (CalculateResult)parent;
- (NSArray)conversions;
- (NSArray)locales;
- (NSArray)terms;
- (NSMutableDictionary)variableLookups;
- (NSNumberFormatter)numberFormatter;
- (NSString)expression;
- (NSString)formattedResult;
- (TreeObject)convertedTree:(id)a3 from:(id)a4 needsUpdate:(BOOL *)a5;
- (TreeObject)convertedTree:(id)a3 needsUpdate:(BOOL *)a4;
- (TreeObject)parseTree;
- (TreeObject)resultTree;
- (TreeObject)variableResultTrees;
- (UnitTypeInfo)typeInfo;
- (UnitsInfo)unitsInfo;
- (id)availableConversions;
- (id)bestConversion;
- (id)conversionsForMetric:(BOOL)a3 US:(BOOL)a4 UK:(BOOL)a5;
- (id)convertedTo:(id)a3;
- (id)convertedTo:(id)a3 from:(id)a4;
- (id)description;
- (id)graphableFunction;
- (id)graphableFunctionFor:(id)a3;
- (id)ignoringNaN;
- (id)localizedConversions;
- (id)newUnit:(id)a3;
- (id)updateVariables:(id)a3;
- (int)minimumFractionDigits;
- (int)singleUnitID;
- (int)unitExponent;
- (int)variableResultTreesCount;
- (int64_t)compare:(id)a3;
- (unint64_t)scientificNotationFormat;
- (unint64_t)unitFormat;
- (unint64_t)unitType;
- (void)_setConversions:(id)a3;
- (void)_setExpression:(id)a3;
- (void)_setInputValueAndUnit:(id)a3;
- (void)_setTerms:(id)a3;
- (void)dealloc;
- (void)enableMeasurementSystemsForLocale:(id)a3 metric:(BOOL *)a4 US:(BOOL *)a5 UK:(BOOL *)a6;
- (void)setAutoScientificNotation:(BOOL)a3;
- (void)setFlexibleFractionDigits:(BOOL)a3;
- (void)setIsSimpleVerticalMath:(BOOL)a3;
- (void)setLocales:(id)a3;
- (void)setLocalizeUnit:(BOOL)a3;
- (void)setMinimumFractionDigits:(int)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setParent:(id)a3;
- (void)setParseTree:(TreeObject *)a3;
- (void)setResolvedUnitFormats:(id *)a3;
- (void)setResultTree:(TreeObject *)a3;
- (void)setScientificNotationFormat:(unint64_t)a3;
- (void)setSingleUnitID:(int)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTypeInfo:(id)a3;
- (void)setUnitFormat:(unint64_t)a3;
- (void)setUnitsInfo:(id)a3;
- (void)setVariableLookups:(id)a3;
- (void)setVariableResultTrees:(TreeObject *)a3;
- (void)setVariableResultTreesCount:(int)a3;
@end

@implementation CalculateResult

uint64_t __42__CalculateResult_defaultNumberFormatter___block_invoke()
{
  defaultNumberFormatter__numberFormatters = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)defaultNumberFormatter:(id)a3
{
  id v3 = a3;
  if (defaultNumberFormatter__onceToken != -1) {
    dispatch_once(&defaultNumberFormatter__onceToken, &__block_literal_global_656);
  }
  v4 = NSString;
  v5 = [v3 localeIdentifier];
  v6 = [v3 groupingSeparator];
  v7 = [v3 decimalSeparator];
  v8 = [v4 stringWithFormat:@"%@%@%@", v5, v6, v7];

  v9 = [(id)defaultNumberFormatter__numberFormatters objectForKey:v8];
  if (!v9)
  {
    v9 = objc_opt_new();
    [v9 setUsesGroupingSeparator:1];
    [v9 setMaximumIntegerDigits:10];
    [v9 setMaximumFractionDigits:3];
    [v9 setNumberStyle:1];
    [v9 setRoundingMode:6];
    [v9 setLocale:v3];
    [(id)defaultNumberFormatter__numberFormatters setObject:v9 forKey:v8];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableLookups, 0);
  objc_storeStrong((id *)&self->_typeInfo, 0);
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_conversions, 0);
  objc_storeStrong((id *)&self->_inputValueAndUnit, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

- (void)setIsSimpleVerticalMath:(BOOL)a3
{
  self->_isSimpleVerticalMath = a3;
}

- (BOOL)isSimpleVerticalMath
{
  return self->_isSimpleVerticalMath;
}

- (void)setResolvedUnitFormats:(id *)a3
{
  *(_OWORD *)self->_resolvedUnitFormats.formats = *(_OWORD *)a3->var0;
  long long v3 = *(_OWORD *)&a3->var0[2];
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v5 = *(_OWORD *)&a3->var0[6];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[8] = *(_OWORD *)&a3->var0[8];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[6] = v5;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[4] = v4;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[2] = v3;
  long long v6 = *(_OWORD *)&a3->var0[10];
  long long v7 = *(_OWORD *)&a3->var0[12];
  long long v8 = *(_OWORD *)&a3->var0[14];
  self->_resolvedUnitFormats.formats[16] = a3->var0[16];
  *(_OWORD *)&self->_resolvedUnitFormats.formats[12] = v7;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[14] = v8;
  *(_OWORD *)&self->_resolvedUnitFormats.formats[10] = v6;
}

- ($786B50094F6E1A5F953E25B90648E2E3)resolvedUnitFormats
{
  long long v3 = *(_OWORD *)&self[1].var0[14];
  retstr->var0[16] = self[2].var0[3];
  long long v4 = *(_OWORD *)&self[1].var0[6];
  long long v5 = *(_OWORD *)&self[1].var0[10];
  *(_OWORD *)&retstr->var0[4] = *(_OWORD *)&self[1].var0[8];
  *(_OWORD *)&retstr->var0[6] = v5;
  *(_OWORD *)&retstr->var0[8] = *(_OWORD *)&self[1].var0[12];
  *(_OWORD *)&retstr->var0[10] = v3;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[2] = v4;
  long long v6 = *(_OWORD *)&self[2].var0[1];
  *(_OWORD *)&retstr->var0[12] = *(_OWORD *)&self[1].var0[16];
  *(_OWORD *)&retstr->var0[14] = v6;
  return self;
}

- (void)setVariableResultTreesCount:(int)a3
{
  self->_variableResultTreesCount = a3;
}

- (int)variableResultTreesCount
{
  return self->_variableResultTreesCount;
}

- (void)setVariableResultTrees:(TreeObject *)a3
{
  self->_variableResultTrees = a3;
}

- (TreeObject)variableResultTrees
{
  return self->_variableResultTrees;
}

- (void)setVariableLookups:(id)a3
{
}

- (NSMutableDictionary)variableLookups
{
  return self->_variableLookups;
}

- (void)setSingleUnitID:(int)a3
{
  self->_singleUnitID = a3;
}

- (int)singleUnitID
{
  return self->_singleUnitID;
}

- (void)setTypeInfo:(id)a3
{
}

- (UnitTypeInfo)typeInfo
{
  return self->_typeInfo;
}

- (void)setUnitsInfo:(id)a3
{
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setLocalizeUnit:(BOOL)a3
{
  self->_localizeUnit = a3;
}

- (BOOL)localizeUnit
{
  return self->_localizeUnit;
}

- (void)setResultTree:(TreeObject *)a3
{
  self->_resultTree = a3;
}

- (TreeObject)resultTree
{
  return self->_resultTree;
}

- (void)setParseTree:(TreeObject *)a3
{
  self->_parseTree = a3;
}

- (TreeObject)parseTree
{
  return self->_parseTree;
}

- (void)setParent:(id)a3
{
}

- (CalculateResult)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (CalculateResult *)WeakRetained;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (BOOL)hasStaleCurrencyData
{
  return self->_hasStaleCurrencyData;
}

- (NSArray)conversions
{
  return self->_conversions;
}

- (CalculateResult)inputValueAndUnit
{
  return self->_inputValueAndUnit;
}

- (NSArray)terms
{
  return self->_terms;
}

- (int)unitExponent
{
  return self->_unitExponent;
}

- (unint64_t)unitType
{
  return self->_unitType;
}

- (BOOL)isPartialExpression
{
  return self->_isPartialExpression;
}

- (BOOL)isTrivial
{
  return self->_isTrivial;
}

- (BOOL)assumeDegrees
{
  return self->_assumeDegrees;
}

- (void)setFlexibleFractionDigits:(BOOL)a3
{
  self->_flexibleFractionDigits = a3;
}

- (BOOL)flexibleFractionDigits
{
  return self->_flexibleFractionDigits;
}

- (void)setUnitFormat:(unint64_t)a3
{
  self->_unitFormat = a3;
}

- (unint64_t)unitFormat
{
  return self->_unitFormat;
}

- (void)setScientificNotationFormat:(unint64_t)a3
{
  self->_scientificNotationFormat = a3;
}

- (unint64_t)scientificNotationFormat
{
  return self->_scientificNotationFormat;
}

- (void)setAutoScientificNotation:(BOOL)a3
{
  self->_autoScientificNotation = a3;
}

- (BOOL)autoScientificNotation
{
  return self->_autoScientificNotation;
}

- (void)setMinimumFractionDigits:(int)a3
{
  self->_minimumFractionDigits = a3;
}

- (int)minimumFractionDigits
{
  return self->_minimumFractionDigits;
}

- (void)setLocales:(id)a3
{
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (NSString)expression
{
  return self->_expression;
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = [(CalculateResult *)self formattedExpression];
  long long v5 = [(CalculateResult *)self formattedResult];
  long long v6 = [v3 stringWithFormat:@"%@ = %@", v4, v5];

  return v6;
}

- (id)ignoringNaN
{
  if ((~self->_resultTree->var6 & 0x7C00000000000000) != 0) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (BOOL)isNaN
{
  return (~self->_resultTree->var6 & 0x7C00000000000000) == 0;
}

- (id)graphableFunctionFor:(id)a3
{
  variableLookups = self->_variableLookups;
  long long v5 = [a3 lowercaseString];
  long long v6 = [(NSMutableDictionary *)variableLookups objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = [v6 integerValue];
    if (!self->_variableResultTrees[v7])
    {
      if (my_rnd_mode) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
      unint64_t v9 = __bid128_from_string("0", v8, &my_fpsf);
      self->_variableResultTrees[v7] = (TreeObject *)newDecimalNode(v9, v10);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__CalculateResult_graphableFunctionFor___block_invoke_2;
    v21[3] = &unk_1E6365838;
    v21[4] = self;
    int v22 = v7;
    v11 = v21;
  }
  else
  {
    resultTree = self->_resultTree;
    int var0 = resultTree->var0;
    if (resultTree->var0 == 1)
    {
      double var4 = resultTree->var4;
    }
    else if (var0 == 2)
    {
      if (my_rnd_mode) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
      double var4 = __bid128_to_binary64(resultTree->var5.var0[1], resultTree->var6, v18, &my_fpsf);
    }
    else
    {
      double var4 = 0.0;
      if (var0 == 4)
      {
        unint64_t v15 = (unint64_t)resultTree->var7[0];
        unint64_t v16 = (uint64_t)rint(1.79769313e308);
        BOOL v17 = (uint64_t)rint(2.22507386e-308) < v15 && v16 > v15;
        double var4 = (double)v15;
        if (!v17) {
          double var4 = NAN;
        }
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__CalculateResult_graphableFunctionFor___block_invoke;
    aBlock[3] = &__block_descriptor_40_e8_d16__0d8l;
    *(double *)&aBlock[4] = var4;
    v11 = aBlock;
  }
  v19 = _Block_copy(v11);

  return v19;
}

double __40__CalculateResult_graphableFunctionFor___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __40__CalculateResult_graphableFunctionFor___block_invoke_2(uint64_t a1, double a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 160) + 8 * *(int *)(a1 + 40));
  *(_DWORD *)uint64_t v2 = 1;
  *(double *)(v2 + 32) = a2;
  *(_DWORD *)(v2 + 204) = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  long long v3 = *(id *)(a1 + 32);
  +[Calculate _lock];
  g_variableResultTrees = v3[20];
  g_variableResultTreesCount = *((_DWORD *)v3 + 8);
  g_forceResult = 1;
  g_assumeDegrees = *((unsigned char *)v3 + 10);
  g_PreferredType = 2;
  g_ErrorCode = 0;
  LODWORD(v8[0]) = 2;
  HIDWORD(v19) = 0;
  evaluateTree(v3[15], (uint64_t)v8);

  +[Calculate _unlock];
  if (LODWORD(v8[0]) == 1) {
    return *(double *)&v9;
  }
  if (LODWORD(v8[0]) == 2)
  {
    if (my_rnd_mode) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    return __bid128_to_binary64(v10, *((unint64_t *)&v10 + 1), v7, &my_fpsf);
  }
  else
  {
    double result = 0.0;
    if (LODWORD(v8[0]) == 4)
    {
      unint64_t v5 = (uint64_t)rint(1.79769313e308);
      BOOL v6 = (uint64_t)rint(2.22507386e-308) < (unint64_t)v11 && v5 > (unint64_t)v11;
      double result = (double)(unint64_t)v11;
      if (!v6) {
        return NAN;
      }
    }
  }
  return result;
}

- (id)graphableFunction
{
  return [(CalculateResult *)self graphableFunctionFor:@"x"];
}

- (id)updateVariables:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_terms count] == 1)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v38 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          long long v11 = [(NSMutableDictionary *)self->_variableLookups objectForKeyedSubscript:v10];
          if (v11)
          {
            long long v12 = [v5 objectForKeyedSubscript:v10];
            long long v13 = [MEMORY[0x1E4F1CA98] null];

            if (v12 == v13)
            {
              uint64_t v15 = 0;
            }
            else
            {
              long long v14 = [v5 objectForKeyedSubscript:v10];
              uint64_t v15 = [v14 resultTree];
            }
            long long v16 = (TreeObject *)copyTree(v15);
            variableResultTrees = self->_variableResultTrees;
            variableResultTrees[[v11 integerValue]] = v16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v56 count:16];
      }
      while (v7);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    $71D83D51AB0F57F7CF166351F850C832 v46 = ($71D83D51AB0F57F7CF166351F850C832)0;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v18 = self;
    +[Calculate _lock];
    g_variableResultTrees = (uint64_t)v18->_variableResultTrees;
    g_variableResultTreesCount = v18->_variableResultTreesCount;
    g_forceResult = 1;
    g_assumeDegrees = v18->_assumeDegrees;
    g_PreferredType = 2;
    g_ErrorCode = 0;
    LODWORD(v43) = 2;
    HIDWORD(v55) = 0;
    evaluateTree((uint64_t)v18->_parseTree, (uint64_t)&v43);
    uint64_t v19 = HIDWORD(v55);
    +[Calculate _unlock];

    if (v19)
    {
      uint64_t v20 = +[CalculateError errorWithResultError:v19];
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v4 = v38;
    if (v43 == 1)
    {
      if (my_rnd_mode) {
        int v22 = 4;
      }
      else {
        int v22 = 0;
      }
      unint64_t v21 = __binary64_to_bid128(v22, &my_fpsf, *(double *)&v45);
      uint64_t v24 = v23;
    }
    else if (v43 == 2)
    {
      uint64_t v24 = v46.var0[1];
      unint64_t v21 = v46.var0[0];
    }
    else
    {
      if (v43 == 4) {
        unint64_t v21 = v47;
      }
      else {
        unint64_t v21 = 0;
      }
      uint64_t v24 = 0x3040000000000000;
    }
    v25 = +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v21, v24);
    resultTree = v18->_resultTree;
    long long v27 = v44;
    long long v28 = v45;
    long long v29 = v47;
    *($71D83D51AB0F57F7CF166351F850C832 *)((char *)&resultTree->var5 + 8) = v46;
    *(_OWORD *)&resultTree->var7[0].unitID = v29;
    *(_OWORD *)&resultTree->var2 = v27;
    *(_OWORD *)&resultTree->double var4 = v28;
    long long v30 = v48;
    long long v31 = v49;
    long long v32 = v51;
    *(_OWORD *)&resultTree->var7[6].unitID = v50;
    *(_OWORD *)&resultTree->var7[8].unitID = v32;
    *(_OWORD *)&resultTree->var7[2].unitID = v30;
    *(_OWORD *)&resultTree->var7[4].unitID = v31;
    long long v33 = v52;
    long long v34 = v53;
    long long v35 = v55;
    *(_OWORD *)&resultTree->var7[14].unitID = v54;
    *(_OWORD *)&resultTree->var8 = v35;
    *(_OWORD *)&resultTree->var7[10].unitID = v33;
    *(_OWORD *)&resultTree->var7[12].unitID = v34;
    *(_OWORD *)&resultTree->int var0 = v43;
    v36 = [(NSArray *)self->_terms firstObject];
    [v36 setValue:v25];
    objc_msgSend(v36, "setDecimalValue:", v21, v24);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)convertedTo:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(CalculateResult *)self resultTree]
    || ((unint64_t v8 = -[CalculateResult unitType](self, "unitType"), !v7) ? (v9 = [v6 unitType]) : (v9 = 0),
        v8 != v9))
  {
    long long v13 = 0;
    goto LABEL_23;
  }
  if ([(CalculateResult *)self synchronous] && [(CalculateResult *)self unitType] == 16)
  {
    if (+[StocksKitCurrencyCache isEnabled])
    {
      uint64_t v10 = +[StocksKitCurrencyCache shared];
      int v11 = [v10 needsRefresh];

      if (!v11) {
        goto LABEL_14;
      }
      long long v12 = +[StocksKitCurrencyCache shared];
      [v12 refreshSynchronouslyWithTimeout:6.0];
    }
    else
    {
      long long v14 = +[CalculateCurrencyCache shared];
      [v14 setTimeout:6.0];

      long long v12 = +[CalculateCurrencyCache shared];
      [v12 refreshIfNeeded];
    }
  }
LABEL_14:
  v78[0] = 0;
  uint64_t v15 = [(CalculateResult *)self convertedTree:v6 from:v7 needsUpdate:v78];
  if (v15)
  {
    long long v16 = v15;
    long long v17 = copyTree((uint64_t)[(CalculateResult *)self resultTree]);
    if (v17)
    {
      long long v18 = v17;
      uint64_t v19 = [v6 unitInfo];
      uint64_t v20 = [v19 unitType];

      unint64_t v21 = [(CalculateResult *)self unitsInfo];
      BOOL isPartialExpression = self->_isPartialExpression;
      BOOL assumeDegrees = self->_assumeDegrees;
      BOOL localizeUnit = self->_localizeUnit;
      BOOL autoScientificNotation = self->_autoScientificNotation;
      unint64_t scientificNotationFormat = self->_scientificNotationFormat;
      unint64_t unitFormat = self->_unitFormat;
      BOOL flexibleFractionDigits = self->_flexibleFractionDigits;
      BOOL isSimpleVerticalMath = self->_isSimpleVerticalMath;
      int minimumFractionDigits = self->_minimumFractionDigits;
      int unitExponent = self->_unitExponent;
      long long v32 = *(_OWORD *)&self->_resolvedUnitFormats.formats[10];
      long long v33 = *(_OWORD *)&self->_resolvedUnitFormats.formats[14];
      long long v75 = *(_OWORD *)&self->_resolvedUnitFormats.formats[12];
      long long v76 = v33;
      unint64_t v77 = self->_resolvedUnitFormats.formats[16];
      long long v34 = *(_OWORD *)&self->_resolvedUnitFormats.formats[2];
      long long v35 = *(_OWORD *)&self->_resolvedUnitFormats.formats[6];
      long long v71 = *(_OWORD *)&self->_resolvedUnitFormats.formats[4];
      long long v72 = v35;
      long long v73 = *(_OWORD *)&self->_resolvedUnitFormats.formats[8];
      long long v74 = v32;
      long long v69 = *(_OWORD *)self->_resolvedUnitFormats.formats;
      long long v70 = v34;
      LOBYTE(v67) = v78[0];
      HIDWORD(v65) = minimumFractionDigits;
      BYTE1(v65) = isSimpleVerticalMath;
      LOBYTE(v65) = flexibleFractionDigits;
      LOBYTE(v63) = autoScientificNotation;
      BYTE2(v61) = localizeUnit;
      BYTE1(v61) = assumeDegrees;
      LOBYTE(v61) = 0;
      LODWORD(v59) = 0;
      BYTE1(v57) = isPartialExpression;
      LOBYTE(v57) = 0;
      LODWORD(v55) = unitExponent;
      +[CalculateResult resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:](CalculateResult, "resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:", v16, 0, 0, 0, v21, v20, v55, &stru_1F1868970, v57, 0, 0, v59, &v69, v61,
        unitFormat,
        v63,
        scientificNotationFormat,
        v65,
      long long v13 = v67);

      if (v13)
      {
        unitsInfo = self->_unitsInfo;
        __int16 v37 = *(_WORD *)&self->_isTrivial;
        BOOL v38 = self->_assumeDegrees;
        BOOL v39 = self->_localizeUnit;
        BOOL v40 = self->_autoScientificNotation;
        unint64_t v42 = self->_scientificNotationFormat;
        unint64_t v41 = self->_unitFormat;
        BOOL v43 = self->_flexibleFractionDigits;
        BOOL v44 = self->_isSimpleVerticalMath;
        int v46 = self->_minimumFractionDigits;
        int v45 = self->_unitExponent;
        long long v47 = *(_OWORD *)&self->_resolvedUnitFormats.formats[14];
        long long v75 = *(_OWORD *)&self->_resolvedUnitFormats.formats[12];
        long long v76 = v47;
        unint64_t v77 = self->_resolvedUnitFormats.formats[16];
        long long v48 = *(_OWORD *)&self->_resolvedUnitFormats.formats[6];
        long long v71 = *(_OWORD *)&self->_resolvedUnitFormats.formats[4];
        long long v72 = v48;
        long long v49 = *(_OWORD *)&self->_resolvedUnitFormats.formats[10];
        long long v73 = *(_OWORD *)&self->_resolvedUnitFormats.formats[8];
        long long v74 = v49;
        long long v50 = *(_OWORD *)&self->_resolvedUnitFormats.formats[2];
        long long v69 = *(_OWORD *)self->_resolvedUnitFormats.formats;
        long long v70 = v50;
        LOBYTE(v68) = v78[0];
        HIDWORD(v66) = v46;
        BYTE1(v66) = v44;
        LOBYTE(v66) = v43;
        LOBYTE(v64) = v40;
        BYTE2(v62) = v39;
        BYTE1(v62) = v38;
        LOBYTE(v62) = 0;
        LODWORD(v60) = 0;
        LOWORD(v58) = v37;
        LODWORD(v56) = v45;
        +[CalculateResult resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:](CalculateResult, "resultWithResultTree:parseTree:locales:numberFormatter:unitsInfo:unitType:unitExponent:expression:isTrivial:isPartialExpression:variableLookups:variableResultTrees:variableResultTreesCount:resolvedUnitFormats:forceResult:assumeDegrees:localizeUnit:unitFormat:autoScientificNotation:scientificNotationFormat:flexibleFractionDigits:isSimpleVerticalMath:minimumFractionDigits:hasStaleCurrencyData:", v18, 0, 0, 0, unitsInfo, v20, v56, &stru_1F1868970, v58, 0, 0, v60, &v69, v62,
          v41,
          v64,
          v42,
          v66,
        long long v51 = v68);
        long long v52 = v51;
        if (v51)
        {
          [v51 setParent:v13];
          [v13 _setInputValueAndUnit:v52];
          [v13 setParent:self];
          long long v53 = [v52 formattedResult];
          [v13 _setExpression:v53];
        }
        else
        {

          freeTree(v18);
          long long v13 = 0;
        }
        goto LABEL_22;
      }
      freeTree(v18);
    }
    freeTree(v16);
  }
  long long v13 = 0;
  long long v52 = 0;
LABEL_22:

LABEL_23:
  return v13;
}

- (id)convertedTo:(id)a3
{
  return [(CalculateResult *)self convertedTo:a3 from:0];
}

- (TreeObject)convertedTree:(id)a3 from:(id)a4 needsUpdate:(BOOL *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  if ([(CalculateResult *)self resultTree])
  {
    unint64_t v10 = [(CalculateResult *)self unitType];
    uint64_t v11 = v9 ? 0 : [v8 unitType];
    if (v10 == v11)
    {
      +[Calculate _lock];
      long long v12 = [v8 unitInfo];
      long long v13 = newUnitIDNode([v12 unitID]);

      if (v13)
      {
        if ([v8 exponent] == 1)
        {
          long long v14 = v13;
        }
        else
        {
          snprintf(__str, 0x28uLL, "%d", [v8 exponent]);
          if (my_rnd_mode) {
            int v15 = 4;
          }
          else {
            int v15 = 0;
          }
          unint64_t v16 = __bid128_from_string((unsigned __int8 *)__str, v15, &my_fpsf);
          long long v18 = newDecimalNode(v16, v17);
          if (!v18)
          {
LABEL_26:
            long long v14 = 0;
            goto LABEL_39;
          }
          uint64_t v19 = v18;
          long long v14 = newTreeObject((uint64_t)functionPow, (uint64_t)v13, (uint64_t)v18);
          if (!v14)
          {
            freeTree(v19);
            goto LABEL_39;
          }
        }
        uint64_t v20 = [(CalculateResult *)self resultTree];
        uint64_t v21 = (uint64_t)v20;
        if (v9)
        {
          uint64_t v22 = 76;
          while (!*(int *)((char *)&v20->var0 + v22))
          {
            v22 += 8;
            if (v22 == 204)
            {
              uint64_t v23 = [v9 unitInfo];
              unsigned int v24 = [v23 unitType];

              if (v24 <= 0xF)
              {
                v25 = copyTree(v21);
                if (v25)
                {
                  long long v13 = v25;
                  *((unsigned char *)v25 + 201) = 1;
                  v26 = [v9 unitInfo];
                  long long v27 = &v13[v24];
                  *((_DWORD *)v27 + 18) = [v26 unitID];

                  *((_DWORD *)v27 + 19) = [v9 exponent];
                  uint64_t v21 = (uint64_t)v13;
                  goto LABEL_28;
                }
              }
              break;
            }
          }
          long long v13 = v14;
          goto LABEL_26;
        }
        long long v13 = 0;
LABEL_28:
        long long v28 = newTreeObject((uint64_t)functionConvert, v21, (uint64_t)v14);
        if (v28)
        {
          long long v29 = v28;
          long long v30 = malloc_type_calloc(1uLL, 0xD0uLL, 0x10A00405A5B035DuLL);
          if (v30)
          {
            long long v14 = v30;
            evaluateTree((uint64_t)v29, (uint64_t)v30);
            v29[2] = 0;
            freeTree(v29);
            if (a5 && g_currencyNeedsRefresh) {
              *a5 = 1;
            }
            if (!*((_DWORD *)v14 + 51))
            {
              if (!v9) {
                goto LABEL_40;
              }
              goto LABEL_39;
            }
          }
          else
          {
            long long v14 = v29;
          }
        }
        freeTree(v14);
        long long v14 = 0;
        if (v13) {
LABEL_39:
        }
          freeTree(v13);
      }
      else
      {
        long long v14 = 0;
      }
LABEL_40:
      +[Calculate _unlock];
      goto LABEL_41;
    }
  }
  long long v14 = 0;
LABEL_41:

  return (TreeObject *)v14;
}

- (TreeObject)convertedTree:(id)a3 needsUpdate:(BOOL *)a4
{
  return [(CalculateResult *)self convertedTree:a3 from:0 needsUpdate:a4];
}

- (id)localizedConversions
{
  uint64_t v2 = self;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CalculateResult *)self typeInfo];
  if (!v3) {
    goto LABEL_38;
  }
  id v4 = (void *)v3;
  id v5 = [(CalculateResult *)v2 typeInfo];
  id v6 = [v5 units];

  if (v6)
  {
    id v7 = [(CalculateResult *)v2 locales];
    id v8 = v7;
    if (!v7 || ![v7 count])
    {
      uint64_t v9 = +[Localize systemLocales];

      id v8 = (void *)v9;
    }
    if ([(CalculateResult *)v2 unitType] == 16)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__CalculateResult_localizedConversions__block_invoke;
      block[3] = &unk_1E6365CF0;
      block[4] = v2;
      if (localizedConversions_onceToken != -1) {
        dispatch_once(&localizedConversions_onceToken, block);
      }
      unint64_t v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__CalculateResult_localizedConversions__block_invoke_2;
      aBlock[3] = &unk_1E63657F0;
      id v53 = v10;
      id v76 = v53;
      id v52 = v11;
      id v77 = v52;
      long long v12 = (void (**)(void *, void *))_Block_copy(aBlock);
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v54 = v8;
      obuint64_t j = v8;
      uint64_t v13 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v72 != v15) {
              objc_enumerationMutation(obj);
            }
            unint64_t v17 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            long long v18 = [(CalculateResult *)v2 unitsInfo];
            uint64_t v19 = [v17 currencyCode];
            uint64_t v20 = [v18 objectForKeyedSubscript:v19];

            if (v20)
            {
              uint64_t v21 = [v17 currencyCode];
              v12[2](v12, v21);
            }
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
        }
        while (v14);
      }

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v22 = [&unk_1F18728A8 countByEnumeratingWithState:&v67 objects:v81 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v68 != v24) {
              objc_enumerationMutation(&unk_1F18728A8);
            }
            v12[2](v12, *(void **)(*((void *)&v67 + 1) + 8 * j));
          }
          uint64_t v23 = [&unk_1F18728A8 countByEnumeratingWithState:&v67 objects:v81 count:16];
        }
        while (v23);
      }
      id v55 = (id)objc_opt_new();
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v26 = v52;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v80 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v64;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v64 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v63 + 1) + 8 * k);
            long long v32 = [(CalculateResult *)v2 unitsInfo];
            uint64_t v33 = [v32 objectForKeyedSubscript:v31];

            if (v33)
            {
              int v34 = [v33 unitID];
              if (v34 != [(CalculateResult *)v2 singleUnitID])
              {
                uint64_t v35 = [(CalculateResult *)v2 inputValueAndUnit];
                if (!v35) {
                  goto LABEL_34;
                }
                v36 = (void *)v35;
                int obja = [v33 unitID];
                [(CalculateResult *)v2 inputValueAndUnit];
                __int16 v37 = v12;
                uint64_t v38 = v28;
                BOOL v39 = v2;
                uint64_t v40 = v29;
                v42 = id v41 = v26;
                int v43 = [v42 singleUnitID];

                id v26 = v41;
                uint64_t v29 = v40;
                uint64_t v2 = v39;
                uint64_t v28 = v38;
                long long v12 = v37;

                if (obja != v43)
                {
LABEL_34:
                  id v44 = [(CalculateResult *)v2 newUnit:v33];
                  [v55 addObject:v44];
                }
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v80 count:16];
        }
        while (v28);
      }

      id v8 = v54;
    }
    else
    {
      __int16 v62 = 0;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v45 = v8;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v79 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v59;
        do
        {
          for (uint64_t m = 0; m != v47; ++m)
          {
            if (*(void *)v59 != v48) {
              objc_enumerationMutation(v45);
            }
            [(CalculateResult *)v2 enableMeasurementSystemsForLocale:*(void *)(*((void *)&v58 + 1) + 8 * m) metric:0 US:(char *)&v62 + 1 UK:&v62];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v79 count:16];
        }
        while (v47);
      }

      long long v50 = [(CalculateResult *)v2 conversionsForMetric:1 US:HIBYTE(v62) UK:v62];
      id v55 = (id)[v50 copy];
    }
  }
  else
  {
LABEL_38:
    id v55 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v55;
}

void __39__CalculateResult_localizedConversions__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)localizedConversions_allCurrencies;
  localizedConversions_allCurrencies = v2;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "typeInfo", 0);
  id v5 = [v4 units];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = (void *)localizedConversions_allCurrencies;
        uint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) name];
        [v10 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __39__CalculateResult_localizedConversions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)availableConversions
{
  uint64_t v3 = [(CalculateResult *)self typeInfo];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)v3;
  id v5 = [(CalculateResult *)self typeInfo];
  uint64_t v6 = [v5 units];

  if (v6)
  {
    uint64_t v7 = [(CalculateResult *)self conversionsForMetric:1 US:1 UK:1];
    uint64_t v8 = (void *)[v7 copy];
  }
  else
  {
LABEL_4:
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (id)bestConversion
{
  uint64_t v2 = self;
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  if (![(CalculateResult *)self resultTree]
    || ([(CalculateResult *)v2 typeInfo],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 units],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    id v6 = 0;
    goto LABEL_6;
  }
  if ([(CalculateResult *)v2 unitType] == 16)
  {
    id v5 = [(CalculateResult *)v2 localizedConversions];
    id v6 = [v5 objectAtIndexedSubscript:0];

    goto LABEL_6;
  }
  if ([(CalculateResult *)v2 singleUnitID])
  {
    uint64_t v8 = [(CalculateResult *)v2 unitsInfo];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[CalculateResult singleUnitID](v2, "singleUnitID"));
    unint64_t v10 = [v9 bestEquivalent];

    if (v10)
    {
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      obuint64_t j = [(CalculateResult *)v2 localizedConversions];
      uint64_t v11 = [obj countByEnumeratingWithState:&v154 objects:v161 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v155;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v155 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v154 + 1) + 8 * i);
            unint64_t v16 = [v15 unitInfo];
            int v17 = [v16 unitID];
            int v18 = [v10 unitID];

            if (v17 == v18)
            {
              id v6 = v15;

              goto LABEL_6;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v154 objects:v161 count:16];
        }
        while (v12);
      }
    }
  }
  uint64_t v19 = [(CalculateResult *)v2 locales];
  uint64_t v20 = v19;
  if (!v19 || ![v19 count])
  {
    uint64_t v21 = +[Localize systemLocales];

    uint64_t v20 = (void *)v21;
  }
  __int16 v153 = 0;
  unsigned __int8 v152 = 0;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v148 objects:v160 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v149;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v149 != v25) {
          objc_enumerationMutation(v22);
        }
        [(CalculateResult *)v2 enableMeasurementSystemsForLocale:*(void *)(*((void *)&v148 + 1) + 8 * j) metric:(char *)&v153 + 1 US:&v153 UK:&v152];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v148 objects:v160 count:16];
    }
    while (v24);
  }

  [(CalculateResult *)v2 conversionsForMetric:HIBYTE(v153) US:v153 UK:v152];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 countByEnumeratingWithState:&v144 objects:v159 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v145;
    while (2)
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        id v32 = v22;
        if (*(void *)v145 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v33 = [*(id *)(*((void *)&v144 + 1) + 8 * k) unitInfo];
        int v34 = [v33 doNotSuggest];

        if (!v34)
        {
          char v35 = 0;
          id v22 = v32;
          goto LABEL_41;
        }
        id v22 = v32;
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v144 objects:v159 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }
  char v35 = 1;
LABEL_41:

  uint64_t v36 = [(CalculateResult *)v2 resultTree];
  int v37 = *(_DWORD *)v36;
  if (*(_DWORD *)v36 == 1)
  {
    double v38 = *(double *)(v36 + 32);
    if (my_rnd_mode) {
      int v39 = 4;
    }
    else {
      int v39 = 0;
    }
    unint64_t v40 = __binary64_to_bid128(v39, &my_fpsf, v38);
    uint64_t v133 = v41;
    unint64_t v134 = v40;
  }
  else if (v37 == 2)
  {
    uint64_t v133 = *(void *)(v36 + 56);
    unint64_t v134 = *(void *)(v36 + 48);
  }
  else
  {
    if (v37 == 4) {
      unint64_t v134 = *(void *)(v36 + 64);
    }
    else {
      unint64_t v134 = 0;
    }
    uint64_t v133 = 0x3040000000000000;
  }
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  unint64_t v42 = [v22 firstObject];
  +[CalculateResult preferMeasurementSystemsForLocale:v42 preferred:&v143 fallback:&v142];

  int v43 = [(CalculateResult *)v2 inputValueAndUnit];
  if (v43)
  {
    id v44 = [(CalculateResult *)v2 inputValueAndUnit];
    int v45 = [v44 singleUnitID];
  }
  else
  {
    int v45 = [(CalculateResult *)v2 singleUnitID];
  }

  if (v45)
  {
    uint64_t v46 = [(CalculateResult *)v2 unitsInfo];
    uint64_t v47 = [v46 objectAtIndexedSubscript:v45];
    uint64_t v48 = [v47 measurementSystem];

    BOOL v132 = v143 != v48;
    if (v142) {
      BOOL v49 = v142 == v48;
    }
    else {
      BOOL v49 = 0;
    }
    int v50 = !v49;
  }
  else
  {
    int v50 = 1;
    BOOL v132 = 1;
  }
  int v131 = v50;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v51 = v27;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v138 objects:v158 count:16];
  if (!v52)
  {

    v105 = 0;
    goto LABEL_130;
  }
  id v53 = (id)v52;
  id v106 = v22;
  unint64_t v123 = 0;
  unint64_t v124 = 0;
  unint64_t v109 = 0;
  unint64_t v110 = 0;
  unint64_t v117 = 0;
  unint64_t v118 = 0;
  uint64_t v130 = 0;
  uint64_t v113 = 0;
  uint64_t v114 = 0;
  v125 = 0;
  v126 = 0;
  v111 = 0;
  v112 = 0;
  v119 = 0;
  v120 = 0;
  uint64_t v54 = *(void *)v139;
  uint64_t v121 = 0x3040000000000000;
  uint64_t v122 = 0x3040000000000000;
  uint64_t v107 = 0x3040000000000000;
  uint64_t v108 = 0x3040000000000000;
  uint64_t v115 = 0x3040000000000000;
  uint64_t v116 = 0x3040000000000000;
  char v129 = v35;
  uint64_t v127 = *(void *)v139;
  id v128 = v51;
  do
  {
    id v55 = 0;
    id obja = v53;
    do
    {
      if (*(void *)v139 != v54) {
        objc_enumerationMutation(v51);
      }
      uint64_t v56 = *(void **)(*((void *)&v138 + 1) + 8 * (void)v55);
      if ((v35 & 1) != 0
        || ([*(id *)(*((void *)&v138 + 1) + 8 * (void)v55) unitInfo],
            uint64_t v57 = objc_claimAutoreleasedReturnValue(),
            char v58 = [v57 doNotSuggest],
            v57,
            (v58 & 1) == 0))
      {
        uint64_t v59 = -[CalculateResult convertedTree:needsUpdate:](v2, "convertedTree:needsUpdate:", v56, 0, v106);
        if (v59)
        {
          long long v60 = (void *)v59;
          int v137 = 0;
          int v61 = *(_DWORD *)v59;
          if (*(_DWORD *)v59 == 1)
          {
            double v63 = *(double *)(v59 + 32);
            if (my_rnd_mode) {
              int v64 = 4;
            }
            else {
              int v64 = 0;
            }
            unint64_t v62 = __binary64_to_bid128(v64, &my_fpsf, v63);
            uint64_t v66 = v65;
          }
          else if (v61 == 2)
          {
            unint64_t v62 = *(void *)(v59 + 48);
            uint64_t v66 = *(void *)(v59 + 56);
          }
          else
          {
            if (v61 == 4) {
              unint64_t v62 = *(void *)(v59 + 64);
            }
            else {
              unint64_t v62 = 0;
            }
            uint64_t v66 = 0x3040000000000000;
          }
          unint64_t v67 = __bid128_sub(v134, v133, v62, v66, 4, &v137);
          unint64_t v69 = v68 & 0x7FFFFFFFFFFFFFFFLL;
          if ([(CalculateResult *)v2 isAcceptableConversion:v60])
          {
            if ((v130 & 0x100000000) == 0 || __bid128_quiet_less(v67, v69, v124, v122, &v137))
            {
              id v70 = v56;

              unint64_t v124 = v67;
              v125 = v70;
              uint64_t v122 = v69;
            }
            if (v132)
            {
              long long v71 = [v56 unitInfo];
              uint64_t v72 = [v71 measurementSystem];
              uint64_t v73 = v143;

              if (v72 == v73)
              {
                if ((v114 & 0x100000000) != 0 && !__bid128_quiet_less(v67, v69, v110, v108, &v137))
                {
                  BYTE4(v114) = 1;
                }
                else
                {
                  id v74 = v56;

                  BYTE4(v114) = 1;
                  unint64_t v110 = v67;
                  v111 = v74;
                  uint64_t v108 = v69;
                }
              }
            }
            if (v142) {
              int v75 = v131;
            }
            else {
              int v75 = 0;
            }
            if (v75 == 1
              && ([v56 unitInfo],
                  id v76 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v77 = [v76 measurementSystem],
                  uint64_t v78 = v142,
                  v76,
                  v77 == v78))
            {
              if ((v113 & 0x100000000) != 0)
              {
                int v79 = __bid128_quiet_less(v67, v69, v118, v116, &v137);
                BYTE4(v130) = 1;
                v81 = v119;
                v80 = v120;
                unint64_t v82 = v67;
                unint64_t v83 = v69;
                unint64_t v67 = v117;
                unint64_t v69 = v115;
                BYTE4(v113) = 1;
                v84 = v56;
                if (!v79) {
                  goto LABEL_121;
                }
              }
              else
              {
                BYTE4(v130) = 1;
                v81 = v119;
                v80 = v120;
                unint64_t v82 = v67;
                unint64_t v83 = v69;
                unint64_t v67 = v117;
                unint64_t v69 = v115;
                BYTE4(v113) = 1;
                v84 = v56;
              }
LABEL_120:
              v120 = v80;
              v95 = v2;
              uint64_t v96 = v83;
              id v97 = v56;

              unint64_t v117 = v67;
              unint64_t v118 = v82;
              uint64_t v115 = v69;
              uint64_t v116 = v96;
              uint64_t v2 = v95;
              v119 = v84;
            }
            else
            {
              BYTE4(v130) = 1;
            }
          }
          else
          {
            if ((v130 & 1) == 0 || __bid128_quiet_less(v67, v69, v123, v121, &v137))
            {
              id v85 = v56;

              unint64_t v123 = v67;
              uint64_t v121 = v69;
              v126 = v85;
            }
            if (v132)
            {
              v86 = [v56 unitInfo];
              uint64_t v87 = [v86 measurementSystem];
              uint64_t v88 = v143;

              if (v87 == v88)
              {
                if ((v114 & 1) != 0 && !__bid128_quiet_less(v67, v69, v109, v107, &v137))
                {
                  LOBYTE(v114) = 1;
                }
                else
                {
                  id v89 = v56;

                  LOBYTE(v114) = 1;
                  unint64_t v109 = v67;
                  uint64_t v107 = v69;
                  v112 = v89;
                }
              }
            }
            if (v142) {
              int v90 = v131;
            }
            else {
              int v90 = 0;
            }
            if (v90 == 1)
            {
              v91 = [v56 unitInfo];
              uint64_t v92 = [v91 measurementSystem];
              uint64_t v93 = v142;

              if (v92 == v93)
              {
                if (v113)
                {
                  int v94 = __bid128_quiet_less(v67, v69, v117, v115, &v137);
                  LOBYTE(v130) = 1;
                  v84 = v119;
                  v81 = v120;
                  unint64_t v82 = v118;
                  unint64_t v83 = v116;
                  LOBYTE(v113) = 1;
                  v80 = v56;
                  if (!v94) {
                    goto LABEL_121;
                  }
                }
                else
                {
                  LOBYTE(v130) = 1;
                  v84 = v119;
                  v81 = v120;
                  unint64_t v82 = v118;
                  unint64_t v83 = v116;
                  LOBYTE(v113) = 1;
                  v80 = v56;
                }
                goto LABEL_120;
              }
            }
            LOBYTE(v130) = 1;
          }
LABEL_121:
          freeTree(v60);
          char v35 = v129;
          uint64_t v54 = v127;
          id v51 = v128;
          id v53 = obja;
        }
      }
      id v55 = (char *)v55 + 1;
    }
    while (v53 != v55);
    uint64_t v98 = [v51 countByEnumeratingWithState:&v138 objects:v158 count:16];
    id v53 = (id)v98;
  }
  while (v98);

  if (v111)
  {
    id v99 = v111;

    v100 = v99;
    id v22 = v106;
    id v101 = v126;
    id v102 = v112;
    id v104 = v119;
    id v103 = v120;
    goto LABEL_137;
  }
  id v22 = v106;
  if (v119)
  {
    id v104 = v119;

    id v99 = 0;
    v100 = v104;
    goto LABEL_135;
  }
  v100 = v125;
  if (!v125)
  {
    if (v112)
    {
      id v102 = v112;
      id v99 = 0;
      id v104 = 0;
      v100 = v102;
      id v101 = v126;
      goto LABEL_136;
    }
    if (v120)
    {
      id v103 = v120;
      id v99 = 0;
      id v104 = 0;
      id v102 = 0;
      v100 = v103;
      id v101 = v126;
      goto LABEL_137;
    }
    v105 = v126;
LABEL_130:
    id v101 = v105;
    id v99 = 0;
    id v104 = 0;
    id v102 = 0;
    id v103 = 0;
    v100 = v101;
    goto LABEL_137;
  }
  id v99 = 0;
  id v104 = 0;
LABEL_135:
  id v101 = v126;
  id v102 = v112;
LABEL_136:
  id v103 = v120;
LABEL_137:
  id v6 = v100;

LABEL_6:
  return v6;
}

- (BOOL)isAcceptableConversion:(TreeObject *)a3
{
  if ([(CalculateResult *)self unitType] != 12)
  {
    int v19 = 0;
    uint64_t v6 = 0x3040000000000000;
    unint64_t v7 = __bid128_div(5uLL, 0x3040000000000000uLL, 0x64uLL, 0x3040000000000000uLL, 4, &v19);
    unint64_t v9 = v8;
    int var0 = a3->var0;
    if (a3->var0 == 1)
    {
      if (my_rnd_mode) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
      unint64_t v11 = __binary64_to_bid128(v12, &my_fpsf, a3->var4);
      uint64_t v6 = v13;
    }
    else if (var0 == 2)
    {
      long long v14 = &a3->var5.var0[1];
      unint64_t v11 = a3->var5.var0[1];
      uint64_t v6 = v14[1];
    }
    else if (var0 == 4)
    {
      unint64_t v11 = (unint64_t)a3->var7[0];
    }
    else
    {
      unint64_t v11 = 0;
    }
    uint64_t v15 = v6 & 0x7FFFFFFFFFFFFFFFLL;
    if ([(CalculateResult *)self unitType] == 7)
    {
      unint64_t v16 = __bid128_div(1uLL, 0x3040000000000000uLL, 0x400uLL, 0x3040000000000000uLL, 4, &v19);
      int v5 = __bid128_quiet_greater_equal(v11, v15, v16, v17, &v19);
      if (!v5) {
        return v5;
      }
      int v5 = __bid128_quiet_less(v11, v15, 0x100000uLL, 0x3040000000000000, &v19);
    }
    else
    {
      int v5 = __bid128_quiet_greater_equal(v11, v15, v7, v9, &v19);
    }
    LOBYTE(v5) = v5 != 0;
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (id)conversionsForMetric:(BOOL)a3 US:(BOOL)a4 UK:(BOOL)a5
{
  BOOL v24 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = (id)objc_opt_new();
  id v27 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [(CalculateResult *)self typeInfo];
  unint64_t v7 = [v6 units];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v13 = [v12 unitID];
        if (v13 != [(CalculateResult *)self singleUnitID])
        {
          uint64_t v14 = [(CalculateResult *)self inputValueAndUnit];
          if (!v14
            || (uint64_t v15 = (void *)v14,
                int v16 = [v12 unitID],
                [(CalculateResult *)self inputValueAndUnit],
                unint64_t v17 = objc_claimAutoreleasedReturnValue(),
                int v18 = [v17 singleUnitID],
                v17,
                v15,
                v16 != v18))
          {
            int v19 = [v12 typeInfo];
            char v20 = [v19 isTemperature];

            if ((v20 & 1) == 0)
            {
              if ([v12 measurementSystem] == 2)
              {
                if (!a4) {
                  continue;
                }
              }
              else if ([v12 measurementSystem] == 3)
              {
                if (!a5) {
                  continue;
                }
              }
              else if ([v12 measurementSystem] == 1 && !v24)
              {
                continue;
              }
            }
            id v21 = [(CalculateResult *)self newUnit:v12];
            if ([v12 doNotSuggest]) {
              id v22 = v27;
            }
            else {
              id v22 = v28;
            }
            [v22 addObject:v21];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  [v28 addObjectsFromArray:v27];
  if ([(CalculateResult *)self unitType] == 7) {
    [v28 sortUsingComparator:&__block_literal_global_668];
  }

  return v28;
}

uint64_t __46__CalculateResult_conversionsForMetric_US_UK___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v22 = 0;
  uint64_t v6 = [v4 unitInfo];
  unint64_t v7 = [v6 baseNumerator];
  unint64_t v9 = v8;
  uint64_t v10 = [v5 unitInfo];
  unint64_t v11 = [v10 baseNumerator];
  LODWORD(v7) = __bid128_quiet_less(v7, v9, v11, v12, &v22);

  if (v7)
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v14 = [v5 unitInfo];
    unint64_t v15 = [v14 baseNumerator];
    unint64_t v17 = v16;
    int v18 = [v4 unitInfo];
    unint64_t v19 = [v18 baseNumerator];
    LODWORD(v15) = __bid128_quiet_less(v15, v17, v19, v20, &v22);

    uint64_t v13 = v15;
  }

  return v13;
}

- (id)newUnit:(id)a3
{
  uint64_t v4 = [a3 unitID];
  id v5 = [(CalculateResult *)self unitsInfo];
  uint64_t v6 = +[CalculateUnit unitWithID:v4 unitsInfo:v5 exponent:[(CalculateResult *)self unitExponent]];

  return v6;
}

- (void)enableMeasurementSystemsForLocale:(id)a3 metric:(BOOL *)a4 US:(BOOL *)a5 UK:(BOOL *)a6
{
  uint64_t v10 = [a3 objectForKey:*MEMORY[0x1E4F1C440]];
  if (v10)
  {
    id v15 = v10;
    if ([v10 isEqualToString:*MEMORY[0x1E4F1C458]])
    {
      uint64_t v10 = v15;
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_13;
    }
    if ([v15 isEqualToString:*MEMORY[0x1E4F1C450]])
    {
      if (a6) {
        *a6 = 1;
      }
      if (a5)
      {
        if ([(CalculateResult *)self singleUnitID])
        {
          unint64_t v11 = [(CalculateResult *)self unitsInfo];
          uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", -[CalculateResult singleUnitID](self, "singleUnitID"));
          uint64_t v13 = [v12 typeInfo];
          char v14 = [v13 isVolume];

          if ((v14 & 1) == 0) {
            *a5 = 1;
          }
        }
      }
      uint64_t v10 = v15;
LABEL_13:
      if (!a4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (a4) {
      *a4 = 1;
    }
    a4 = a5;
    uint64_t v10 = v15;
    if (a5) {
LABEL_14:
    }
      *a4 = 1;
  }
LABEL_15:
}

- (NSString)formattedResult
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(CalculateResult *)self terms];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) formattedResult];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 componentsJoinedByString:@" "];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CalculateResult *)self compare:v4] == 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CalculateResult *)self terms];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v4 terms];
  unint64_t v8 = [v7 objectAtIndexedSubscript:0];
  int64_t v9 = [v6 compare:v8];

  if (!v9)
  {
    uint64_t v10 = [(CalculateResult *)self terms];
    int v11 = [v10 count];
    long long v12 = [v4 terms];
    int v13 = [v12 count];
    int64_t v9 = v11 < v13 ? -1 : v11 > v13;

    if (!v9)
    {
      long long v14 = [(CalculateResult *)self terms];
      unint64_t v15 = [v14 count];

      if (v15 < 2)
      {
LABEL_10:
        int64_t v9 = 0;
      }
      else
      {
        unint64_t v16 = 1;
        while (1)
        {
          uint64_t v17 = [(CalculateResult *)self terms];
          int v18 = [v17 objectAtIndexedSubscript:v16];
          unint64_t v19 = [v4 terms];
          uint64_t v20 = [v19 objectAtIndexedSubscript:v16];
          int64_t v9 = [v18 compare:v20];

          if (v9) {
            break;
          }
          ++v16;
          id v21 = [(CalculateResult *)self terms];
          unint64_t v22 = [v21 count];

          if (v16 >= v22) {
            goto LABEL_10;
          }
        }
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  parseTree = self->_parseTree;
  if (parseTree)
  {
    freeTree(parseTree);
    self->_parseTree = 0;
  }
  resultTree = self->_resultTree;
  if (resultTree)
  {
    freeTree(resultTree);
    self->_resultTree = 0;
  }
  variableResultTrees = self->_variableResultTrees;
  if (variableResultTrees)
  {
    if (self->_variableResultTreesCount >= 1)
    {
      uint64_t v6 = 0;
      do
        freeTree(&self->_variableResultTrees[v6++]->var0);
      while (v6 < self->_variableResultTreesCount);
      variableResultTrees = self->_variableResultTrees;
    }
    free(variableResultTrees);
    self->_variableResultTrees = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CalculateResult;
  [(CalculateResult *)&v7 dealloc];
}

- (CalculateResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalculateResult;
  uint64_t v2 = [(CalculateResult *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(CalculateResult *)v2 setParseTree:0];
    [(CalculateResult *)v3 setResultTree:0];
    conversions = v3->_conversions;
    v3->_conversions = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)_setTerms:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_terms, a3);
  if ([v12 count] == 1
    && ([v12 objectAtIndexedSubscript:0],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 units],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7 == 1))
  {
    unint64_t v8 = [v12 objectAtIndexedSubscript:0];
    int64_t v9 = [v8 units];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];
    int v11 = [v10 unitInfo];
    self->_singleUnitID = [v11 unitID];
  }
  else
  {
    self->_singleUnitID = 0;
  }
}

- (void)_setExpression:(id)a3
{
}

- (void)_setInputValueAndUnit:(id)a3
{
  BOOL v5 = a3;
  objc_storeStrong((id *)&self->_inputValueAndUnit, a3);
  if (v5) {
    self->_hasStaleCurrencyData |= v5[13];
  }
}

- (void)_setConversions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_conversions, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        self->_hasStaleCurrencyData |= *(unsigned char *)(*(void *)(*((void *)&v11 + 1) + 8 * i) + 13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (void)preferMeasurementSystemsForLocale:(id)a3 preferred:(unint64_t *)a4 fallback:(unint64_t *)a5
{
  if (a4) {
    *a4 = 2;
  }
  if (a5) {
    *a5 = 1;
  }
  uint64_t v8 = [a3 objectForKey:*MEMORY[0x1E4F1C440]];
  if ([v8 isEqualToString:*MEMORY[0x1E4F1C450]])
  {
    if (a4) {
      *a4 = 3;
    }
    if (a5)
    {
      unint64_t v7 = 1;
LABEL_15:
      *a5 = v7;
    }
  }
  else if ([v8 isEqualToString:*MEMORY[0x1E4F1C448]])
  {
    if (a4) {
      *a4 = 1;
    }
    if (a5)
    {
      unint64_t v7 = 2;
      goto LABEL_15;
    }
  }
  MEMORY[0x1F41817F8]();
}

+ (CalculateResult)resultWithResultTree:(TreeObject *)a3 parseTree:(TreeObject *)a4 locales:(id)a5 numberFormatter:(id)a6 unitsInfo:(id)a7 unitType:(int)a8 unitExponent:(int)a9 expression:(id)a10 isTrivial:(BOOL)a11 isPartialExpression:(BOOL)a12 variableLookups:(id)a13 variableResultTrees:(TreeObject *)a14 variableResultTreesCount:(int)a15 resolvedUnitFormats:(id *)a16 forceResult:(BOOL)a17 assumeDegrees:(BOOL)a18 localizeUnit:(BOOL)a19 unitFormat:(unint64_t)a20 autoScientificNotation:(BOOL)a21 scientificNotationFormat:(unint64_t)a22 flexibleFractionDigits:(BOOL)a23 isSimpleVerticalMath:(BOOL)a24 minimumFractionDigits:(int)a25 hasStaleCurrencyData:(BOOL)a26
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v30 = a5;
  obuint64_t j = a6;
  id v31 = a6;
  id v71 = a7;
  id v32 = a7;
  id v76 = a10;
  id v33 = a13;
  int var0 = a3->var0;
  uint64_t v77 = v31;
  id v78 = v30;
  id v75 = v33;
  if (a3->var0 == 1)
  {
    if (my_rnd_mode) {
      int v36 = 4;
    }
    else {
      int v36 = 0;
    }
    unint64_t v35 = __binary64_to_bid128(v36, &my_fpsf, a3->var4);
  }
  else if (var0 == 2)
  {
    unint64_t v35 = a3->var5.var0[1];
    unint64_t var6 = a3->var6;
  }
  else
  {
    if (var0 == 4) {
      unint64_t v35 = (unint64_t)a3->var7[0];
    }
    else {
      unint64_t v35 = 0;
    }
    unint64_t var6 = 0x3040000000000000;
  }
  unint64_t v72 = var6;
  unint64_t v73 = v35;
  double v38 = +[CalculateResult decimalNumberWithDecimal128:](CalculateResult, "decimalNumberWithDecimal128:", v35, var6);
  if (!a17)
  {
    int v39 = [MEMORY[0x1E4F28C28] notANumber];
    char v40 = [v38 isEqual:v39];

    if (v40)
    {
      uint64_t v41 = 0;
      goto LABEL_39;
    }
  }
  uint64_t v41 = objc_opt_new();
  objc_storeStrong((id *)(v41 + 56), a5);
  objc_storeStrong((id *)(v41 + 48), obj);
  *(void *)(v41 + 120) = a4;
  *(void *)(v41 + 128) = a3;
  objc_storeStrong((id *)(v41 + 40), a10);
  *(unsigned char *)(v41 + 11) = a11;
  *(unsigned char *)(v41 + 12) = a12;
  *(unsigned char *)(v41 + 10) = a18;
  *(unsigned char *)(v41 + 15) = a19;
  *(unsigned char *)(v41 + 8) = a21;
  *(void *)(v41 + 64) = a22;
  *(void *)(v41 + 72) = a20;
  *(unsigned char *)(v41 + 9) = a23;
  *(unsigned char *)(v41 + 16) = a24;
  *(_DWORD *)(v41 + 20) = a25;
  *(unsigned char *)(v41 + 13) = a26;
  objc_storeStrong((id *)(v41 + 136), v71);
  if (v32)
  {
    uint64_t v42 = a8;
    uint64_t v43 = [v32 infoForUnitType:a8];
    id v44 = *(void **)(v41 + 144);
    *(void *)(v41 + 144) = v43;
  }
  else
  {
    id v44 = *(void **)(v41 + 144);
    *(void *)(v41 + 144) = 0;
    uint64_t v42 = a8;
  }

  uint64_t v45 = 0;
  int v46 = 0;
  int v47 = 0;
  p_exponent = &a3->var7[1].exponent;
  while (1)
  {
    int v49 = *p_exponent;
    p_exponent += 2;
    if (v49) {
      break;
    }
LABEL_22:
    if (++v45 == 16) {
      goto LABEL_25;
    }
  }
  if (v47 <= 0)
  {
    int v47 = 1;
    int v46 = v45;
    goto LABEL_22;
  }
  int v46 = 0;
LABEL_25:
  if ((int)v42 < 1) {
    int unitID = 0;
  }
  else {
    int unitID = a3->var7[v46 + 1].unitID;
  }
  *(_DWORD *)(v41 + 28) = unitID;
  objc_storeStrong((id *)(v41 + 152), a13);
  *(void *)(v41 + 160) = a14;
  *(_DWORD *)(v41 + 32) = a15;
  *(_OWORD *)(v41 + 168) = *(_OWORD *)a16->var0;
  long long v51 = *(_OWORD *)&a16->var0[2];
  long long v52 = *(_OWORD *)&a16->var0[4];
  long long v53 = *(_OWORD *)&a16->var0[6];
  *(_OWORD *)(v41 + 232) = *(_OWORD *)&a16->var0[8];
  *(_OWORD *)(v41 + 216) = v53;
  *(_OWORD *)(v41 + 200) = v52;
  *(_OWORD *)(v41 + 184) = v51;
  long long v54 = *(_OWORD *)&a16->var0[10];
  long long v55 = *(_OWORD *)&a16->var0[12];
  long long v56 = *(_OWORD *)&a16->var0[14];
  *(void *)(v41 + 296) = a16->var0[16];
  *(_OWORD *)(v41 + 264) = v55;
  *(_OWORD *)(v41 + 280) = v56;
  *(_OWORD *)(v41 + 248) = v54;
  uint64_t v57 = objc_opt_new();
  for (uint64_t i = 0; i != 16; ++i)
  {
    if (a3->var7[i + 1].exponent)
    {
      uint64_t v59 = +[CalculateUnit unitWithID:unitsInfo:exponent:](CalculateUnit, "unitWithID:unitsInfo:exponent:", a3->var7[i + 1].unitID, v32);
      [v57 addObject:v59];
    }
  }
  long long v60 = (void *)[v57 copy];
  int v61 = +[CalculateTerm termWithValue:v38 units:v60 result:v41];

  objc_msgSend(v61, "setDecimalValue:", v73, v72);
  v79[0] = v61;
  uint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
  double v63 = *(void **)(v41 + 88);
  *(void *)(v41 + 88) = v62;

  if ([v57 count])
  {
    int v64 = [v32 infoForUnitType:v42];
    uint64_t v65 = [v64 name];
    uint64_t v66 = [&unk_1F1872E28 objectForKeyedSubscript:v65];

    if (v66) {
      uint64_t v67 = (int)[v66 intValue];
    }
    else {
      uint64_t v67 = 1;
    }
    id v30 = v78;
    *(void *)(v41 + 80) = v67;
    *(_DWORD *)(v41 + 24) = a9;
  }
  else
  {
    *(void *)(v41 + 80) = 0;
    *(_DWORD *)(v41 + 24) = 0;
    id v30 = v78;
  }

LABEL_39:
  return (CalculateResult *)(id)v41;
}

+ (id)decimalNumberWithDecimal128:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __bid128_to_string((uint64_t)v7, a3.var0[0], a3.var0[1]);
  uint64_t v3 = (void *)MEMORY[0x1E4F28C28];
  id v4 = [NSString stringWithUTF8String:v7];
  id v5 = [v3 decimalNumberWithString:v4];

  return v5;
}

@end