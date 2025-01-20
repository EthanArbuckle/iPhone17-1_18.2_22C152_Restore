@interface _INPBPair
+ (BOOL)supportsSecureCoding;
+ (Class)pairCurrencyAmountValueType;
+ (Class)pairCustomObjectType;
+ (Class)pairDataStringType;
+ (Class)pairDataValueType;
+ (Class)pairDistanceValueType;
+ (Class)pairDoubleValueType;
+ (Class)pairImageValueType;
+ (Class)pairIntegerValueType;
+ (Class)pairLocationValueType;
+ (Class)pairPaymentMethodValueType;
+ (Class)pairPersonValueType;
+ (Class)pairStringValueType;
+ (Class)pairTemperatureValueType;
+ (Class)pairUrlValueType;
- (BOOL)hasKey;
- (BOOL)hasRepeated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)repeated;
- (NSArray)pairCurrencyAmountValues;
- (NSArray)pairCustomObjects;
- (NSArray)pairDataStrings;
- (NSArray)pairDataValues;
- (NSArray)pairDistanceValues;
- (NSArray)pairDoubleValues;
- (NSArray)pairImageValues;
- (NSArray)pairIntegerValues;
- (NSArray)pairLocationValues;
- (NSArray)pairPaymentMethodValues;
- (NSArray)pairPersonValues;
- (NSArray)pairStringValues;
- (NSArray)pairTemperatureValues;
- (NSArray)pairUrlValues;
- (NSString)key;
- (_INPBPair)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)pairCurrencyAmountValueAtIndex:(unint64_t)a3;
- (id)pairCustomObjectAtIndex:(unint64_t)a3;
- (id)pairDataStringAtIndex:(unint64_t)a3;
- (id)pairDataValueAtIndex:(unint64_t)a3;
- (id)pairDistanceValueAtIndex:(unint64_t)a3;
- (id)pairDoubleValueAtIndex:(unint64_t)a3;
- (id)pairImageValueAtIndex:(unint64_t)a3;
- (id)pairIntegerValueAtIndex:(unint64_t)a3;
- (id)pairLocationValueAtIndex:(unint64_t)a3;
- (id)pairPaymentMethodValueAtIndex:(unint64_t)a3;
- (id)pairPersonValueAtIndex:(unint64_t)a3;
- (id)pairStringValueAtIndex:(unint64_t)a3;
- (id)pairTemperatureValueAtIndex:(unint64_t)a3;
- (id)pairUrlValueAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pairCurrencyAmountValuesCount;
- (unint64_t)pairCustomObjectsCount;
- (unint64_t)pairDataStringsCount;
- (unint64_t)pairDataValuesCount;
- (unint64_t)pairDistanceValuesCount;
- (unint64_t)pairDoubleValuesCount;
- (unint64_t)pairImageValuesCount;
- (unint64_t)pairIntegerValuesCount;
- (unint64_t)pairLocationValuesCount;
- (unint64_t)pairPaymentMethodValuesCount;
- (unint64_t)pairPersonValuesCount;
- (unint64_t)pairStringValuesCount;
- (unint64_t)pairTemperatureValuesCount;
- (unint64_t)pairUrlValuesCount;
- (void)addPairCurrencyAmountValue:(id)a3;
- (void)addPairCustomObject:(id)a3;
- (void)addPairDataString:(id)a3;
- (void)addPairDataValue:(id)a3;
- (void)addPairDistanceValue:(id)a3;
- (void)addPairDoubleValue:(id)a3;
- (void)addPairImageValue:(id)a3;
- (void)addPairIntegerValue:(id)a3;
- (void)addPairLocationValue:(id)a3;
- (void)addPairPaymentMethodValue:(id)a3;
- (void)addPairPersonValue:(id)a3;
- (void)addPairStringValue:(id)a3;
- (void)addPairTemperatureValue:(id)a3;
- (void)addPairUrlValue:(id)a3;
- (void)clearPairCurrencyAmountValues;
- (void)clearPairCustomObjects;
- (void)clearPairDataStrings;
- (void)clearPairDataValues;
- (void)clearPairDistanceValues;
- (void)clearPairDoubleValues;
- (void)clearPairImageValues;
- (void)clearPairIntegerValues;
- (void)clearPairLocationValues;
- (void)clearPairPaymentMethodValues;
- (void)clearPairPersonValues;
- (void)clearPairStringValues;
- (void)clearPairTemperatureValues;
- (void)clearPairUrlValues;
- (void)encodeWithCoder:(id)a3;
- (void)setHasRepeated:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setPairCurrencyAmountValues:(id)a3;
- (void)setPairCustomObjects:(id)a3;
- (void)setPairDataStrings:(id)a3;
- (void)setPairDataValues:(id)a3;
- (void)setPairDistanceValues:(id)a3;
- (void)setPairDoubleValues:(id)a3;
- (void)setPairImageValues:(id)a3;
- (void)setPairIntegerValues:(id)a3;
- (void)setPairLocationValues:(id)a3;
- (void)setPairPaymentMethodValues:(id)a3;
- (void)setPairPersonValues:(id)a3;
- (void)setPairStringValues:(id)a3;
- (void)setPairTemperatureValues:(id)a3;
- (void)setPairUrlValues:(id)a3;
- (void)setRepeated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPair

- (void)addPairDoubleValue:(id)a3
{
  id v4 = a3;
  pairDoubleValues = self->_pairDoubleValues;
  id v8 = v4;
  if (!pairDoubleValues)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_pairDoubleValues;
    self->_pairDoubleValues = v6;

    id v4 = v8;
    pairDoubleValues = self->_pairDoubleValues;
  }
  [(NSArray *)pairDoubleValues addObject:v4];
}

- (void)addPairImageValue:(id)a3
{
  id v4 = a3;
  pairImageValues = self->_pairImageValues;
  id v8 = v4;
  if (!pairImageValues)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_pairImageValues;
    self->_pairImageValues = v6;

    id v4 = v8;
    pairImageValues = self->_pairImageValues;
  }
  [(NSArray *)pairImageValues addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairUrlValues, 0);
  objc_storeStrong((id *)&self->_pairTemperatureValues, 0);
  objc_storeStrong((id *)&self->_pairStringValues, 0);
  objc_storeStrong((id *)&self->_pairPersonValues, 0);
  objc_storeStrong((id *)&self->_pairPaymentMethodValues, 0);
  objc_storeStrong((id *)&self->_pairLocationValues, 0);
  objc_storeStrong((id *)&self->_pairIntegerValues, 0);
  objc_storeStrong((id *)&self->_pairImageValues, 0);
  objc_storeStrong((id *)&self->_pairDoubleValues, 0);
  objc_storeStrong((id *)&self->_pairDistanceValues, 0);
  objc_storeStrong((id *)&self->_pairDataValues, 0);
  objc_storeStrong((id *)&self->_pairDataStrings, 0);
  objc_storeStrong((id *)&self->_pairCustomObjects, 0);
  objc_storeStrong((id *)&self->_pairCurrencyAmountValues, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)repeated
{
  return self->_repeated;
}

- (NSArray)pairUrlValues
{
  return self->_pairUrlValues;
}

- (NSArray)pairTemperatureValues
{
  return self->_pairTemperatureValues;
}

- (NSArray)pairStringValues
{
  return self->_pairStringValues;
}

- (NSArray)pairPersonValues
{
  return self->_pairPersonValues;
}

- (NSArray)pairPaymentMethodValues
{
  return self->_pairPaymentMethodValues;
}

- (NSArray)pairLocationValues
{
  return self->_pairLocationValues;
}

- (NSArray)pairIntegerValues
{
  return self->_pairIntegerValues;
}

- (NSArray)pairImageValues
{
  return self->_pairImageValues;
}

- (NSArray)pairDoubleValues
{
  return self->_pairDoubleValues;
}

- (NSArray)pairDistanceValues
{
  return self->_pairDistanceValues;
}

- (NSArray)pairDataValues
{
  return self->_pairDataValues;
}

- (NSArray)pairDataStrings
{
  return self->_pairDataStrings;
}

- (NSArray)pairCustomObjects
{
  return self->_pairCustomObjects;
}

- (NSArray)pairCurrencyAmountValues
{
  return self->_pairCurrencyAmountValues;
}

- (NSString)key
{
  return self->_key;
}

- (id)dictionaryRepresentation
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_key)
  {
    id v4 = [(_INPBPair *)self key];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"key"];
  }
  if ([(NSArray *)self->_pairCurrencyAmountValues count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v7 = self->_pairCurrencyAmountValues;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v158 objects:v175 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v159 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v158 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v158 objects:v175 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"pairCurrencyAmountValue"];
  }
  if ([(NSArray *)self->_pairCustomObjects count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v14 = self->_pairCustomObjects;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v154 objects:v174 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v155;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v155 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v154 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v154 objects:v174 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"pairCustomObject"];
  }
  if ([(NSArray *)self->_pairDataStrings count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    v21 = self->_pairDataStrings;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v150 objects:v173 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v151;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v151 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v150 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v150 objects:v173 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"pairDataString"];
  }
  if ([(NSArray *)self->_pairDataValues count])
  {
    v27 = [MEMORY[0x1E4F1CA48] array];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    v28 = self->_pairDataValues;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v146 objects:v172 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v147;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v147 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v146 + 1) + 8 * m) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v146 objects:v172 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKeyedSubscript:@"pairDataValue"];
  }
  if ([(NSArray *)self->_pairDistanceValues count])
  {
    v34 = [MEMORY[0x1E4F1CA48] array];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v35 = self->_pairDistanceValues;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v142 objects:v171 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v143;
      do
      {
        for (uint64_t n = 0; n != v37; ++n)
        {
          if (*(void *)v143 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v142 + 1) + 8 * n) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v142 objects:v171 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKeyedSubscript:@"pairDistanceValue"];
  }
  if ([(NSArray *)self->_pairDoubleValues count])
  {
    v41 = [MEMORY[0x1E4F1CA48] array];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v42 = self->_pairDoubleValues;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v138 objects:v170 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v139;
      do
      {
        for (iuint64_t i = 0; ii != v44; ++ii)
        {
          if (*(void *)v139 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v138 + 1) + 8 * ii) dictionaryRepresentation];
          [v41 addObject:v47];
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v138 objects:v170 count:16];
      }
      while (v44);
    }

    [v3 setObject:v41 forKeyedSubscript:@"pairDoubleValue"];
  }
  if ([(NSArray *)self->_pairImageValues count])
  {
    v48 = [MEMORY[0x1E4F1CA48] array];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    v49 = self->_pairImageValues;
    uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v134 objects:v169 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v135;
      do
      {
        for (juint64_t j = 0; jj != v51; ++jj)
        {
          if (*(void *)v135 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = [*(id *)(*((void *)&v134 + 1) + 8 * jj) dictionaryRepresentation];
          [v48 addObject:v54];
        }
        uint64_t v51 = [(NSArray *)v49 countByEnumeratingWithState:&v134 objects:v169 count:16];
      }
      while (v51);
    }

    [v3 setObject:v48 forKeyedSubscript:@"pairImageValue"];
  }
  if ([(NSArray *)self->_pairIntegerValues count])
  {
    v55 = [MEMORY[0x1E4F1CA48] array];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v56 = self->_pairIntegerValues;
    uint64_t v57 = [(NSArray *)v56 countByEnumeratingWithState:&v130 objects:v168 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v131;
      do
      {
        for (kuint64_t k = 0; kk != v58; ++kk)
        {
          if (*(void *)v131 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v130 + 1) + 8 * kk) dictionaryRepresentation];
          [v55 addObject:v61];
        }
        uint64_t v58 = [(NSArray *)v56 countByEnumeratingWithState:&v130 objects:v168 count:16];
      }
      while (v58);
    }

    [v3 setObject:v55 forKeyedSubscript:@"pairIntegerValue"];
  }
  if ([(NSArray *)self->_pairLocationValues count])
  {
    v62 = [MEMORY[0x1E4F1CA48] array];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v63 = self->_pairLocationValues;
    uint64_t v64 = [(NSArray *)v63 countByEnumeratingWithState:&v126 objects:v167 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v127;
      do
      {
        for (muint64_t m = 0; mm != v65; ++mm)
        {
          if (*(void *)v127 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = [*(id *)(*((void *)&v126 + 1) + 8 * mm) dictionaryRepresentation];
          [v62 addObject:v68];
        }
        uint64_t v65 = [(NSArray *)v63 countByEnumeratingWithState:&v126 objects:v167 count:16];
      }
      while (v65);
    }

    [v3 setObject:v62 forKeyedSubscript:@"pairLocationValue"];
  }
  if ([(NSArray *)self->_pairPaymentMethodValues count])
  {
    v69 = [MEMORY[0x1E4F1CA48] array];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v70 = self->_pairPaymentMethodValues;
    uint64_t v71 = [(NSArray *)v70 countByEnumeratingWithState:&v122 objects:v166 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v123;
      do
      {
        for (nuint64_t n = 0; nn != v72; ++nn)
        {
          if (*(void *)v123 != v73) {
            objc_enumerationMutation(v70);
          }
          v75 = [*(id *)(*((void *)&v122 + 1) + 8 * nn) dictionaryRepresentation];
          [v69 addObject:v75];
        }
        uint64_t v72 = [(NSArray *)v70 countByEnumeratingWithState:&v122 objects:v166 count:16];
      }
      while (v72);
    }

    [v3 setObject:v69 forKeyedSubscript:@"pairPaymentMethodValue"];
  }
  if ([(NSArray *)self->_pairPersonValues count])
  {
    v76 = [MEMORY[0x1E4F1CA48] array];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    v77 = self->_pairPersonValues;
    uint64_t v78 = [(NSArray *)v77 countByEnumeratingWithState:&v118 objects:v165 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v119;
      do
      {
        for (uint64_t i1 = 0; i1 != v79; ++i1)
        {
          if (*(void *)v119 != v80) {
            objc_enumerationMutation(v77);
          }
          v82 = [*(id *)(*((void *)&v118 + 1) + 8 * i1) dictionaryRepresentation];
          [v76 addObject:v82];
        }
        uint64_t v79 = [(NSArray *)v77 countByEnumeratingWithState:&v118 objects:v165 count:16];
      }
      while (v79);
    }

    [v3 setObject:v76 forKeyedSubscript:@"pairPersonValue"];
  }
  if ([(NSArray *)self->_pairStringValues count])
  {
    v83 = [MEMORY[0x1E4F1CA48] array];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    v84 = self->_pairStringValues;
    uint64_t v85 = [(NSArray *)v84 countByEnumeratingWithState:&v114 objects:v164 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v115;
      do
      {
        for (uint64_t i2 = 0; i2 != v86; ++i2)
        {
          if (*(void *)v115 != v87) {
            objc_enumerationMutation(v84);
          }
          v89 = [*(id *)(*((void *)&v114 + 1) + 8 * i2) dictionaryRepresentation];
          [v83 addObject:v89];
        }
        uint64_t v86 = [(NSArray *)v84 countByEnumeratingWithState:&v114 objects:v164 count:16];
      }
      while (v86);
    }

    [v3 setObject:v83 forKeyedSubscript:@"pairStringValue"];
  }
  if ([(NSArray *)self->_pairTemperatureValues count])
  {
    v90 = [MEMORY[0x1E4F1CA48] array];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v91 = self->_pairTemperatureValues;
    uint64_t v92 = [(NSArray *)v91 countByEnumeratingWithState:&v110 objects:v163 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v111;
      do
      {
        for (uint64_t i3 = 0; i3 != v93; ++i3)
        {
          if (*(void *)v111 != v94) {
            objc_enumerationMutation(v91);
          }
          v96 = [*(id *)(*((void *)&v110 + 1) + 8 * i3) dictionaryRepresentation];
          [v90 addObject:v96];
        }
        uint64_t v93 = [(NSArray *)v91 countByEnumeratingWithState:&v110 objects:v163 count:16];
      }
      while (v93);
    }

    [v3 setObject:v90 forKeyedSubscript:@"pairTemperatureValue"];
  }
  if ([(NSArray *)self->_pairUrlValues count])
  {
    v97 = [MEMORY[0x1E4F1CA48] array];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v98 = self->_pairUrlValues;
    uint64_t v99 = [(NSArray *)v98 countByEnumeratingWithState:&v106 objects:v162 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v107;
      do
      {
        for (uint64_t i4 = 0; i4 != v100; ++i4)
        {
          if (*(void *)v107 != v101) {
            objc_enumerationMutation(v98);
          }
          v103 = objc_msgSend(*(id *)(*((void *)&v106 + 1) + 8 * i4), "dictionaryRepresentation", (void)v106);
          [v97 addObject:v103];
        }
        uint64_t v100 = [(NSArray *)v98 countByEnumeratingWithState:&v106 objects:v162 count:16];
      }
      while (v100);
    }

    [v3 setObject:v97 forKeyedSubscript:@"pairUrlValue"];
  }
  if ([(_INPBPair *)self hasRepeated])
  {
    v104 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPair repeated](self, "repeated"));
    [v3 setObject:v104 forKeyedSubscript:@"repeated"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v19 = [(NSString *)self->_key hash];
  uint64_t v18 = [(NSArray *)self->_pairCurrencyAmountValues hash];
  uint64_t v17 = [(NSArray *)self->_pairCustomObjects hash];
  uint64_t v16 = [(NSArray *)self->_pairDataStrings hash];
  uint64_t v15 = [(NSArray *)self->_pairDataValues hash];
  uint64_t v14 = [(NSArray *)self->_pairDistanceValues hash];
  uint64_t v3 = [(NSArray *)self->_pairDoubleValues hash];
  uint64_t v4 = [(NSArray *)self->_pairImageValues hash];
  uint64_t v5 = [(NSArray *)self->_pairIntegerValues hash];
  uint64_t v6 = [(NSArray *)self->_pairLocationValues hash];
  uint64_t v7 = [(NSArray *)self->_pairPaymentMethodValues hash];
  uint64_t v8 = [(NSArray *)self->_pairPersonValues hash];
  uint64_t v9 = [(NSArray *)self->_pairStringValues hash];
  uint64_t v10 = [(NSArray *)self->_pairTemperatureValues hash];
  uint64_t v11 = [(NSArray *)self->_pairUrlValues hash];
  if ([(_INPBPair *)self hasRepeated]) {
    uint64_t v12 = 2654435761 * self->_repeated;
  }
  else {
    uint64_t v12 = 0;
  }
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_INPBPair *)self key];
  uint64_t v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v7 = [(_INPBPair *)self key];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBPair *)self key];
    uint64_t v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairCurrencyAmountValues];
  uint64_t v6 = [v4 pairCurrencyAmountValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v12 = [(_INPBPair *)self pairCurrencyAmountValues];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(_INPBPair *)self pairCurrencyAmountValues];
    uint64_t v15 = [v4 pairCurrencyAmountValues];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairCustomObjects];
  uint64_t v6 = [v4 pairCustomObjects];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v17 = [(_INPBPair *)self pairCustomObjects];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    NSUInteger v19 = [(_INPBPair *)self pairCustomObjects];
    v20 = [v4 pairCustomObjects];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairDataStrings];
  uint64_t v6 = [v4 pairDataStrings];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v22 = [(_INPBPair *)self pairDataStrings];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_INPBPair *)self pairDataStrings];
    v25 = [v4 pairDataStrings];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairDataValues];
  uint64_t v6 = [v4 pairDataValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v27 = [(_INPBPair *)self pairDataValues];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_INPBPair *)self pairDataValues];
    uint64_t v30 = [v4 pairDataValues];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairDistanceValues];
  uint64_t v6 = [v4 pairDistanceValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v32 = [(_INPBPair *)self pairDistanceValues];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBPair *)self pairDistanceValues];
    v35 = [v4 pairDistanceValues];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairDoubleValues];
  uint64_t v6 = [v4 pairDoubleValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v37 = [(_INPBPair *)self pairDoubleValues];
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    v39 = [(_INPBPair *)self pairDoubleValues];
    v40 = [v4 pairDoubleValues];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairImageValues];
  uint64_t v6 = [v4 pairImageValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v42 = [(_INPBPair *)self pairImageValues];
  if (v42)
  {
    uint64_t v43 = (void *)v42;
    uint64_t v44 = [(_INPBPair *)self pairImageValues];
    uint64_t v45 = [v4 pairImageValues];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairIntegerValues];
  uint64_t v6 = [v4 pairIntegerValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v47 = [(_INPBPair *)self pairIntegerValues];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBPair *)self pairIntegerValues];
    uint64_t v50 = [v4 pairIntegerValues];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairLocationValues];
  uint64_t v6 = [v4 pairLocationValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v52 = [(_INPBPair *)self pairLocationValues];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBPair *)self pairLocationValues];
    v55 = [v4 pairLocationValues];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairPaymentMethodValues];
  uint64_t v6 = [v4 pairPaymentMethodValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v57 = [(_INPBPair *)self pairPaymentMethodValues];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    uint64_t v59 = [(_INPBPair *)self pairPaymentMethodValues];
    v60 = [v4 pairPaymentMethodValues];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairPersonValues];
  uint64_t v6 = [v4 pairPersonValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v62 = [(_INPBPair *)self pairPersonValues];
  if (v62)
  {
    v63 = (void *)v62;
    uint64_t v64 = [(_INPBPair *)self pairPersonValues];
    uint64_t v65 = [v4 pairPersonValues];
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairStringValues];
  uint64_t v6 = [v4 pairStringValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v67 = [(_INPBPair *)self pairStringValues];
  if (v67)
  {
    v68 = (void *)v67;
    v69 = [(_INPBPair *)self pairStringValues];
    v70 = [v4 pairStringValues];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairTemperatureValues];
  uint64_t v6 = [v4 pairTemperatureValues];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v72 = [(_INPBPair *)self pairTemperatureValues];
  if (v72)
  {
    uint64_t v73 = (void *)v72;
    v74 = [(_INPBPair *)self pairTemperatureValues];
    v75 = [v4 pairTemperatureValues];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPair *)self pairUrlValues];
  uint64_t v6 = [v4 pairUrlValues];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_76:

    goto LABEL_77;
  }
  uint64_t v77 = [(_INPBPair *)self pairUrlValues];
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    uint64_t v79 = [(_INPBPair *)self pairUrlValues];
    uint64_t v80 = [v4 pairUrlValues];
    int v81 = [v79 isEqual:v80];

    if (!v81) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int v84 = [(_INPBPair *)self hasRepeated];
  if (v84 == [v4 hasRepeated])
  {
    if (![(_INPBPair *)self hasRepeated]
      || ![v4 hasRepeated]
      || (int repeated = self->_repeated, repeated == [v4 repeated]))
    {
      BOOL v82 = 1;
      goto LABEL_78;
    }
  }
LABEL_77:
  BOOL v82 = 0;
LABEL_78:

  return v82;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBPair allocWithZone:](_INPBPair, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_key copyWithZone:a3];
  [(_INPBPair *)v5 setKey:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_pairCurrencyAmountValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairCurrencyAmountValues:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_pairCustomObjects copyWithZone:a3];
  [(_INPBPair *)v5 setPairCustomObjects:v8];

  uint64_t v9 = (void *)[(NSArray *)self->_pairDataStrings copyWithZone:a3];
  [(_INPBPair *)v5 setPairDataStrings:v9];

  uint64_t v10 = (void *)[(NSArray *)self->_pairDataValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairDataValues:v10];

  int v11 = (void *)[(NSArray *)self->_pairDistanceValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairDistanceValues:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_pairDoubleValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairDoubleValues:v12];

  v13 = (void *)[(NSArray *)self->_pairImageValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairImageValues:v13];

  uint64_t v14 = (void *)[(NSArray *)self->_pairIntegerValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairIntegerValues:v14];

  uint64_t v15 = (void *)[(NSArray *)self->_pairLocationValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairLocationValues:v15];

  int v16 = (void *)[(NSArray *)self->_pairPaymentMethodValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairPaymentMethodValues:v16];

  uint64_t v17 = (void *)[(NSArray *)self->_pairPersonValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairPersonValues:v17];

  uint64_t v18 = (void *)[(NSArray *)self->_pairStringValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairStringValues:v18];

  NSUInteger v19 = (void *)[(NSArray *)self->_pairTemperatureValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairTemperatureValues:v19];

  v20 = (void *)[(NSArray *)self->_pairUrlValues copyWithZone:a3];
  [(_INPBPair *)v5 setPairUrlValues:v20];

  if ([(_INPBPair *)self hasRepeated]) {
    [(_INPBPair *)v5 setRepeated:[(_INPBPair *)self repeated]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPair *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPair)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPair *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPair *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPair *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBPair *)self key];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v6 = self->_pairCurrencyAmountValues;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v128 objects:v145 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v129;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v129 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v128 objects:v145 count:16];
    }
    while (v8);
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  int v11 = self->_pairCustomObjects;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v124 objects:v144 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v125;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v125 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v124 objects:v144 count:16];
    }
    while (v13);
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  int v16 = self->_pairDataStrings;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v120 objects:v143 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v121;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v121 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v120 objects:v143 count:16];
    }
    while (v18);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  int v21 = self->_pairDataValues;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v116 objects:v142 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v117;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v117 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v116 objects:v142 count:16];
    }
    while (v23);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  int v26 = self->_pairDistanceValues;
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v112 objects:v141 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v113;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v113 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v112 objects:v141 count:16];
    }
    while (v28);
  }

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  int v31 = self->_pairDoubleValues;
  uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v108 objects:v140 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v109;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v109 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v108 objects:v140 count:16];
    }
    while (v33);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  int v36 = self->_pairImageValues;
  uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v104 objects:v139 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v105;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v105 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v104 objects:v139 count:16];
    }
    while (v38);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  int v41 = self->_pairIntegerValues;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v100 objects:v138 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v101;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v101 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v100 objects:v138 count:16];
    }
    while (v43);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  int v46 = self->_pairLocationValues;
  uint64_t v47 = [(NSArray *)v46 countByEnumeratingWithState:&v96 objects:v137 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v97;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v97 != v49) {
          objc_enumerationMutation(v46);
        }
        PBDataWriterWriteSubmessage();
        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [(NSArray *)v46 countByEnumeratingWithState:&v96 objects:v137 count:16];
    }
    while (v48);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  int v51 = self->_pairPaymentMethodValues;
  uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v92 objects:v136 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v93;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v93 != v54) {
          objc_enumerationMutation(v51);
        }
        PBDataWriterWriteSubmessage();
        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [(NSArray *)v51 countByEnumeratingWithState:&v92 objects:v136 count:16];
    }
    while (v53);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  int v56 = self->_pairPersonValues;
  uint64_t v57 = [(NSArray *)v56 countByEnumeratingWithState:&v88 objects:v135 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v89;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v89 != v59) {
          objc_enumerationMutation(v56);
        }
        PBDataWriterWriteSubmessage();
        ++v60;
      }
      while (v58 != v60);
      uint64_t v58 = [(NSArray *)v56 countByEnumeratingWithState:&v88 objects:v135 count:16];
    }
    while (v58);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  int v61 = self->_pairStringValues;
  uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v84 objects:v134 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v85;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v85 != v64) {
          objc_enumerationMutation(v61);
        }
        PBDataWriterWriteSubmessage();
        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v84 objects:v134 count:16];
    }
    while (v63);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  int v66 = self->_pairTemperatureValues;
  uint64_t v67 = [(NSArray *)v66 countByEnumeratingWithState:&v80 objects:v133 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v81;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v81 != v69) {
          objc_enumerationMutation(v66);
        }
        PBDataWriterWriteSubmessage();
        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [(NSArray *)v66 countByEnumeratingWithState:&v80 objects:v133 count:16];
    }
    while (v68);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  int v71 = self->_pairUrlValues;
  uint64_t v72 = [(NSArray *)v71 countByEnumeratingWithState:&v76 objects:v132 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v77;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v77 != v74) {
          objc_enumerationMutation(v71);
        }
        PBDataWriterWriteSubmessage();
        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSArray *)v71 countByEnumeratingWithState:&v76 objects:v132 count:16];
    }
    while (v73);
  }

  if ([(_INPBPair *)self hasRepeated]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPairReadFrom(self, (uint64_t)a3);
}

- (void)setHasRepeated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepeated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRepeated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int repeated = a3;
}

- (id)pairUrlValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairUrlValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairUrlValuesCount
{
  return [(NSArray *)self->_pairUrlValues count];
}

- (void)addPairUrlValue:(id)a3
{
  id v4 = a3;
  pairUrlValues = self->_pairUrlValues;
  id v8 = v4;
  if (!pairUrlValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairUrlValues;
    self->_pairUrlValues = v6;

    id v4 = v8;
    pairUrlValues = self->_pairUrlValues;
  }
  [(NSArray *)pairUrlValues addObject:v4];
}

- (void)clearPairUrlValues
{
}

- (void)setPairUrlValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairUrlValues = self->_pairUrlValues;
  self->_pairUrlValues = v4;

  MEMORY[0x1F41817F8](v4, pairUrlValues);
}

- (id)pairTemperatureValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairTemperatureValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairTemperatureValuesCount
{
  return [(NSArray *)self->_pairTemperatureValues count];
}

- (void)addPairTemperatureValue:(id)a3
{
  id v4 = a3;
  pairTemperatureValues = self->_pairTemperatureValues;
  id v8 = v4;
  if (!pairTemperatureValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairTemperatureValues;
    self->_pairTemperatureValues = v6;

    id v4 = v8;
    pairTemperatureValues = self->_pairTemperatureValues;
  }
  [(NSArray *)pairTemperatureValues addObject:v4];
}

- (void)clearPairTemperatureValues
{
}

- (void)setPairTemperatureValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairTemperatureValues = self->_pairTemperatureValues;
  self->_pairTemperatureValues = v4;

  MEMORY[0x1F41817F8](v4, pairTemperatureValues);
}

- (id)pairStringValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairStringValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairStringValuesCount
{
  return [(NSArray *)self->_pairStringValues count];
}

- (void)addPairStringValue:(id)a3
{
  id v4 = a3;
  pairStringValues = self->_pairStringValues;
  id v8 = v4;
  if (!pairStringValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairStringValues;
    self->_pairStringValues = v6;

    id v4 = v8;
    pairStringValues = self->_pairStringValues;
  }
  [(NSArray *)pairStringValues addObject:v4];
}

- (void)clearPairStringValues
{
}

- (void)setPairStringValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairStringValues = self->_pairStringValues;
  self->_pairStringValues = v4;

  MEMORY[0x1F41817F8](v4, pairStringValues);
}

- (id)pairPersonValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairPersonValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairPersonValuesCount
{
  return [(NSArray *)self->_pairPersonValues count];
}

- (void)addPairPersonValue:(id)a3
{
  id v4 = a3;
  pairPersonValues = self->_pairPersonValues;
  id v8 = v4;
  if (!pairPersonValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairPersonValues;
    self->_pairPersonValues = v6;

    id v4 = v8;
    pairPersonValues = self->_pairPersonValues;
  }
  [(NSArray *)pairPersonValues addObject:v4];
}

- (void)clearPairPersonValues
{
}

- (void)setPairPersonValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairPersonValues = self->_pairPersonValues;
  self->_pairPersonValues = v4;

  MEMORY[0x1F41817F8](v4, pairPersonValues);
}

- (id)pairPaymentMethodValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairPaymentMethodValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairPaymentMethodValuesCount
{
  return [(NSArray *)self->_pairPaymentMethodValues count];
}

- (void)addPairPaymentMethodValue:(id)a3
{
  id v4 = a3;
  pairPaymentMethodValues = self->_pairPaymentMethodValues;
  id v8 = v4;
  if (!pairPaymentMethodValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairPaymentMethodValues;
    self->_pairPaymentMethodValues = v6;

    id v4 = v8;
    pairPaymentMethodValues = self->_pairPaymentMethodValues;
  }
  [(NSArray *)pairPaymentMethodValues addObject:v4];
}

- (void)clearPairPaymentMethodValues
{
}

- (void)setPairPaymentMethodValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairPaymentMethodValues = self->_pairPaymentMethodValues;
  self->_pairPaymentMethodValues = v4;

  MEMORY[0x1F41817F8](v4, pairPaymentMethodValues);
}

- (id)pairLocationValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairLocationValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairLocationValuesCount
{
  return [(NSArray *)self->_pairLocationValues count];
}

- (void)addPairLocationValue:(id)a3
{
  id v4 = a3;
  pairLocationValues = self->_pairLocationValues;
  id v8 = v4;
  if (!pairLocationValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairLocationValues;
    self->_pairLocationValues = v6;

    id v4 = v8;
    pairLocationValues = self->_pairLocationValues;
  }
  [(NSArray *)pairLocationValues addObject:v4];
}

- (void)clearPairLocationValues
{
}

- (void)setPairLocationValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairLocationValues = self->_pairLocationValues;
  self->_pairLocationValues = v4;

  MEMORY[0x1F41817F8](v4, pairLocationValues);
}

- (id)pairIntegerValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairIntegerValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairIntegerValuesCount
{
  return [(NSArray *)self->_pairIntegerValues count];
}

- (void)addPairIntegerValue:(id)a3
{
  id v4 = a3;
  pairIntegerValues = self->_pairIntegerValues;
  id v8 = v4;
  if (!pairIntegerValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairIntegerValues;
    self->_pairIntegerValues = v6;

    id v4 = v8;
    pairIntegerValues = self->_pairIntegerValues;
  }
  [(NSArray *)pairIntegerValues addObject:v4];
}

- (void)clearPairIntegerValues
{
}

- (void)setPairIntegerValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairIntegerValues = self->_pairIntegerValues;
  self->_pairIntegerValues = v4;

  MEMORY[0x1F41817F8](v4, pairIntegerValues);
}

- (id)pairImageValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairImageValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairImageValuesCount
{
  return [(NSArray *)self->_pairImageValues count];
}

- (void)clearPairImageValues
{
}

- (void)setPairImageValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairImageValues = self->_pairImageValues;
  self->_pairImageValues = v4;

  MEMORY[0x1F41817F8](v4, pairImageValues);
}

- (id)pairDoubleValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairDoubleValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairDoubleValuesCount
{
  return [(NSArray *)self->_pairDoubleValues count];
}

- (void)clearPairDoubleValues
{
}

- (void)setPairDoubleValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairDoubleValues = self->_pairDoubleValues;
  self->_pairDoubleValues = v4;

  MEMORY[0x1F41817F8](v4, pairDoubleValues);
}

- (id)pairDistanceValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairDistanceValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairDistanceValuesCount
{
  return [(NSArray *)self->_pairDistanceValues count];
}

- (void)addPairDistanceValue:(id)a3
{
  id v4 = a3;
  pairDistanceValues = self->_pairDistanceValues;
  id v8 = v4;
  if (!pairDistanceValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairDistanceValues;
    self->_pairDistanceValues = v6;

    id v4 = v8;
    pairDistanceValues = self->_pairDistanceValues;
  }
  [(NSArray *)pairDistanceValues addObject:v4];
}

- (void)clearPairDistanceValues
{
}

- (void)setPairDistanceValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairDistanceValues = self->_pairDistanceValues;
  self->_pairDistanceValues = v4;

  MEMORY[0x1F41817F8](v4, pairDistanceValues);
}

- (id)pairDataValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairDataValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairDataValuesCount
{
  return [(NSArray *)self->_pairDataValues count];
}

- (void)addPairDataValue:(id)a3
{
  id v4 = a3;
  pairDataValues = self->_pairDataValues;
  id v8 = v4;
  if (!pairDataValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairDataValues;
    self->_pairDataValues = v6;

    id v4 = v8;
    pairDataValues = self->_pairDataValues;
  }
  [(NSArray *)pairDataValues addObject:v4];
}

- (void)clearPairDataValues
{
}

- (void)setPairDataValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairDataValues = self->_pairDataValues;
  self->_pairDataValues = v4;

  MEMORY[0x1F41817F8](v4, pairDataValues);
}

- (id)pairDataStringAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairDataStrings objectAtIndexedSubscript:a3];
}

- (unint64_t)pairDataStringsCount
{
  return [(NSArray *)self->_pairDataStrings count];
}

- (void)addPairDataString:(id)a3
{
  id v4 = a3;
  pairDataStrings = self->_pairDataStrings;
  id v8 = v4;
  if (!pairDataStrings)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairDataStrings;
    self->_pairDataStrings = v6;

    id v4 = v8;
    pairDataStrings = self->_pairDataStrings;
  }
  [(NSArray *)pairDataStrings addObject:v4];
}

- (void)clearPairDataStrings
{
}

- (void)setPairDataStrings:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairDataStrings = self->_pairDataStrings;
  self->_pairDataStrings = v4;

  MEMORY[0x1F41817F8](v4, pairDataStrings);
}

- (id)pairCustomObjectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairCustomObjects objectAtIndexedSubscript:a3];
}

- (unint64_t)pairCustomObjectsCount
{
  return [(NSArray *)self->_pairCustomObjects count];
}

- (void)addPairCustomObject:(id)a3
{
  id v4 = a3;
  pairCustomObjects = self->_pairCustomObjects;
  id v8 = v4;
  if (!pairCustomObjects)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairCustomObjects;
    self->_pairCustomObjects = v6;

    id v4 = v8;
    pairCustomObjects = self->_pairCustomObjects;
  }
  [(NSArray *)pairCustomObjects addObject:v4];
}

- (void)clearPairCustomObjects
{
}

- (void)setPairCustomObjects:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairCustomObjects = self->_pairCustomObjects;
  self->_pairCustomObjects = v4;

  MEMORY[0x1F41817F8](v4, pairCustomObjects);
}

- (id)pairCurrencyAmountValueAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pairCurrencyAmountValues objectAtIndexedSubscript:a3];
}

- (unint64_t)pairCurrencyAmountValuesCount
{
  return [(NSArray *)self->_pairCurrencyAmountValues count];
}

- (void)addPairCurrencyAmountValue:(id)a3
{
  id v4 = a3;
  pairCurrencyAmountValues = self->_pairCurrencyAmountValues;
  id v8 = v4;
  if (!pairCurrencyAmountValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pairCurrencyAmountValues;
    self->_pairCurrencyAmountValues = v6;

    id v4 = v8;
    pairCurrencyAmountValues = self->_pairCurrencyAmountValues;
  }
  [(NSArray *)pairCurrencyAmountValues addObject:v4];
}

- (void)clearPairCurrencyAmountValues
{
}

- (void)setPairCurrencyAmountValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  pairCurrencyAmountValues = self->_pairCurrencyAmountValues;
  self->_pairCurrencyAmountValues = v4;

  MEMORY[0x1F41817F8](v4, pairCurrencyAmountValues);
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setKey:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  key = self->_key;
  self->_key = v4;

  MEMORY[0x1F41817F8](v4, key);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)pairUrlValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairTemperatureValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairStringValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairPersonValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairPaymentMethodValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairLocationValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairIntegerValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairImageValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairDoubleValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairDistanceValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairDataValueType
{
  return (Class)objc_opt_class();
}

+ (Class)pairDataStringType
{
  return (Class)objc_opt_class();
}

+ (Class)pairCustomObjectType
{
  return (Class)objc_opt_class();
}

+ (Class)pairCurrencyAmountValueType
{
  return (Class)objc_opt_class();
}

@end