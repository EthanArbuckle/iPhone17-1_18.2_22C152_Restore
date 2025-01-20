@interface CPMLSchema
- (BOOL)hasOptions:(unint64_t)a3;
- (BOOL)isColumnContinous:(unsigned int)a3;
- (BOOL)isIntType:(unint64_t)a3;
- (BOOL)isNumType:(unint64_t)a3;
- (BOOL)isRealType:(unint64_t)a3;
- (BOOL)isStringType:(unint64_t)a3;
- (BOOL)isVectorType:(unint64_t)a3;
- (BOOL)matchSubstituteValue:(unint64_t)a3 theValue:(id)a4;
- (CPMLSchema)initWithPlist:(id)a3;
- (NSMutableArray)attribute;
- (NSMutableArray)availableOptions;
- (NSMutableArray)indexColumnList;
- (NSMutableArray)nsRemapTable;
- (NSMutableString)schemaHeader;
- (NSMutableString)schemaHeaderWithType;
- (id)getColumnName:(unint64_t)a3;
- (id)getSubstituteValue:(unint64_t)a3;
- (id)getUserDefinedCategoricalData:(unint64_t)a3;
- (id)init:(id)a3;
- (int)getColumnPosition:(id)a3;
- (int)getSchemaType:(unint64_t)a3;
- (int)getVectorContent:(unint64_t)a3;
- (int)getYColumnPosition;
- (unint64_t)getTotalAttributes;
- (unint64_t)getUserDefinedCategoricalDataCount:(unint64_t)a3;
@end

@implementation CPMLSchema

- (id)init:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPMLSchema;
  v3 = [(CPMLSchema *)&v5 init];
  if (v3) {
    NSLog(&cfstr_WarningNoSchem.isa);
  }
  return v3;
}

- (CPMLSchema)initWithPlist:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)CPMLSchema;
  objc_super v5 = [(CPMLSchema *)&v82 init];
  if (v5)
  {
    id v64 = v4;
    uint64_t v6 = [v4 objectForKey:@"schema"];
    schema = v5->schema;
    v5->schema = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    attribute = v5->attribute;
    v5->attribute = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    schemaHDef = v5->schemaHDef;
    v5->schemaHDef = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    schemaHeaderWithType = v5->schemaHeaderWithType;
    v5->schemaHeaderWithType = (NSMutableString *)v12;

    uint64_t v14 = objc_opt_new();
    nsRemapTable = v5->nsRemapTable;
    v5->nsRemapTable = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    availableOptions = v5->availableOptions;
    v5->availableOptions = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    categoricalDataList = v5->_categoricalDataList;
    v5->_categoricalDataList = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    replaceMissingValue = v5->_replaceMissingValue;
    v5->_replaceMissingValue = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    matchReplaceValue = v5->_matchReplaceValue;
    v5->_matchReplaceValue = (NSMutableArray *)v22;

    v5->yColumnPosition = [(NSMutableArray *)v5->schema count] - 1;
    if ([(NSMutableArray *)v5->schema count])
    {
      int v24 = 0;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      v65 = v5;
      do
      {
        int v75 = v24;
        v27 = [(NSMutableArray *)v5->schema objectAtIndexedSubscript:v26];
        v28 = [v27 objectForKey:@"Header"];
        uint64_t v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"CPMLcol%ld_", v26);
        v74 = v28;
        v30 = [v28 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        uint64_t v31 = [v30 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

        v32 = objc_opt_new();
        v73 = (void *)v29;
        [v32 appendString:v29];
        v72 = (void *)v31;
        [v32 appendString:v31];
        v71 = v32;
        [(NSMutableArray *)v5->attribute addObject:v32];
        v70 = [v27 objectForKey:@"HeaderDef"];
        -[NSMutableArray addObject:](v5->schemaHDef, "addObject:");
        v77 = v27;
        uint64_t v33 = [v27 objectForKey:@"reMapTable"];
        v34 = v5->nsRemapTable;
        v69 = (void *)v33;
        if (v33)
        {
          [(NSMutableArray *)v34 addObject:v33];
        }
        else
        {
          v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v25];
          [(NSMutableArray *)v34 addObject:v35];
        }
        int v24 = v75;
        v36 = [v27 objectForKey:@"predictedValue"];
        v37 = v36;
        if (!((v36 == 0) | v75 & 1))
        {
          if ([v36 BOOLValue])
          {
            v5->yColumnPosition = v25;
            int v24 = 1;
          }
          else
          {
            int v24 = 0;
          }
        }

        v38 = [v27 objectForKey:@"Options"];
        v39 = v5->availableOptions;
        if (v38)
        {
          [(NSMutableArray *)v5->availableOptions addObject:v38];
        }
        else
        {
          v40 = [MEMORY[0x263EFF9D0] null];
          [(NSMutableArray *)v39 addObject:v40];
        }
        uint64_t v41 = [v77 objectForKey:@"categoricalData"];
        v68 = (void *)v41;
        if (v41)
        {
          v42 = (void *)v41;
          int v76 = v24;
          unint64_t v66 = v26;
          int v67 = v25;
          v43 = objc_opt_new();
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v44 = v42;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v78 objects:v83 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v79;
            do
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v79 != v47) {
                  objc_enumerationMutation(v44);
                }
                uint64_t v49 = *(void *)(*((void *)&v78 + 1) + 8 * i);
                v50 = [v43 objectForKey:v49];
                if (v50) {
                  NSLog(&cfstr_SCannotHaveDup.isa, "-[CPMLSchema initWithPlist:]");
                }
                else {
                  [v43 setValue:@"1" forKey:v49];
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v78 objects:v83 count:16];
            }
            while (v46);
          }

          objc_super v5 = v65;
          [(NSMutableArray *)v65->_categoricalDataList addObject:v44];
          LODWORD(v25) = v67;
          unint64_t v26 = v66;
          int v24 = v76;
        }
        else
        {
          v51 = v5->_categoricalDataList;
          v43 = objc_opt_new();
          [(NSMutableArray *)v51 addObject:v43];
        }
        uint64_t v25 = (v25 + 1);

        v52 = [v77 objectForKey:@"substituteValue"];
        uint64_t v53 = [v77 objectForKey:@"substitutionMatch"];
        if (!v52) {
          v52 = &stru_26C5111B8;
        }
        if (v53) {
          v54 = (__CFString *)v53;
        }
        else {
          v54 = &stru_26C5111B8;
        }
        [(NSMutableArray *)v5->_replaceMissingValue addObject:v52];
        [(NSMutableArray *)v5->_matchReplaceValue addObject:v54];

        ++v26;
      }
      while (v26 < [(NSMutableArray *)v5->schema count]);
    }
    id v55 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([(NSMutableArray *)v5->schemaHDef count])
    {
      unint64_t v56 = 0;
      do
      {
        v57 = [(NSMutableArray *)v5->attribute objectAtIndex:v56];
        [(NSMutableString *)v5->schemaHeaderWithType appendString:v57];
        [(NSMutableString *)v5->schemaHeaderWithType appendString:@" "];
        v58 = v5->schemaHeaderWithType;
        v59 = [(NSMutableArray *)v5->schemaHDef objectAtIndex:v56];
        [(NSMutableString *)v58 appendString:v59];

        v60 = [(NSMutableArray *)v5->attribute objectAtIndex:v56];
        [v55 appendString:v60];

        if (++v56 < [(NSMutableArray *)v5->schemaHDef count])
        {
          [(NSMutableString *)v5->schemaHeaderWithType appendString:@" , "];
          [v55 appendString:@", "];
        }
      }
      while (v56 < [(NSMutableArray *)v5->schemaHDef count]);
    }
    uint64_t v61 = [objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@" (%@) ", v55];
    schemaHeader = v5->schemaHeader;
    v5->schemaHeader = (NSMutableString *)v61;

    id v4 = v64;
  }

  return v5;
}

- (unint64_t)getTotalAttributes
{
  return [(NSMutableArray *)self->attribute count];
}

- (BOOL)isNumType:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  if (([v3 isEqualToString:@"INTEGER"] & 1) != 0
    || ([v3 isEqualToString:@"REAL"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"BOOLEAN"];
  }

  return v4;
}

- (BOOL)isIntType:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  if ([v3 isEqualToString:@"INTEGER"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"BOOLEAN"];
  }

  return v4;
}

- (BOOL)isRealType:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  char v4 = [v3 isEqualToString:@"REAL"];

  return v4;
}

- (BOOL)isStringType:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  if (([v3 isEqualToString:@"BOOLEAN"] & 1) != 0
    || ([v3 isEqualToString:@"INTEGER"] & 1) != 0
    || ([v3 isEqualToString:@"REAL"] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"BLOB"] ^ 1;
  }

  return v4;
}

- (BOOL)isVectorType:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  char v4 = [v3 isEqualToString:@"BLOB"];

  return v4;
}

- (BOOL)isColumnContinous:(unsigned int)a3
{
  v3 = [(NSMutableArray *)self->schemaHDef objectAtIndex:a3];
  if ([v3 isEqualToString:@"REAL"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"INTEGER"];
  }

  return v4;
}

- (int)getColumnPosition:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->attribute count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(NSMutableArray *)self->attribute objectAtIndex:v5];
      v7 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"CPMLcol%d_", v5);
      [v7 appendString:v4];
      if ([v7 isEqualToString:v6]) {
        break;
      }
      int v8 = [v4 isEqualToString:v6];

      if (v8) {
        goto LABEL_8;
      }
      if (++v5 >= (unint64_t)[(NSMutableArray *)self->attribute count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    LODWORD(v5) = -1;
  }
LABEL_8:

  return v5;
}

- (id)getColumnName:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->attribute objectAtIndex:a3];
}

- (int)getSchemaType:(unint64_t)a3
{
  if (-[CPMLSchema isStringType:](self, "isStringType:")) {
    return 5;
  }
  if ([(CPMLSchema *)self isIntType:a3]) {
    return 3;
  }
  if ([(CPMLSchema *)self isRealType:a3]) {
    return 4;
  }
  if ([(CPMLSchema *)self isVectorType:a3]) {
    return 7;
  }
  NSLog(&cfstr_SUnknownSchema.isa, "-[CPMLSchema getSchemaType:]");
  return 8;
}

- (int)getVectorContent:(unint64_t)a3
{
  if ([(NSMutableArray *)self->schema count] >= a3)
  {
    uint64_t v6 = [(NSMutableArray *)self->schema objectAtIndex:a3];
    v7 = [v6 objectForKey:@"VectorType"];
    if ([v7 isEqualToString:@"INTEGER"])
    {
      int v5 = 3;
    }
    else if ([v7 isEqualToString:@"REAL"])
    {
      int v5 = 4;
    }
    else if ([v7 isEqualToString:@"TEXT"])
    {
      int v5 = 5;
    }
    else
    {
      int v5 = 8;
    }
  }
  else
  {
    NSLog(&cfstr_SIndexGreaterT.isa, "-[CPMLSchema getVectorContent:]");
    return 8;
  }
  return v5;
}

- (int)getYColumnPosition
{
  return self->yColumnPosition;
}

- (BOOL)hasOptions:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->availableOptions objectAtIndexedSubscript:a3];
  id v4 = [MEMORY[0x263EFF9D0] null];
  BOOL v5 = v3 != v4;

  return v5;
}

- (id)getUserDefinedCategoricalData:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_categoricalDataList count] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_categoricalDataList objectAtIndex:a3];
  }

  return v5;
}

- (unint64_t)getUserDefinedCategoricalDataCount:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_categoricalDataList objectAtIndex:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)matchSubstituteValue:(unint64_t)a3 theValue:(id)a4
{
  matchReplaceValue = self->_matchReplaceValue;
  id v6 = a4;
  v7 = [(NSMutableArray *)matchReplaceValue objectAtIndex:a3];
  LOBYTE(matchReplaceValue) = [v7 isEqualToString:v6];

  return (char)matchReplaceValue;
}

- (id)getSubstituteValue:(unint64_t)a3
{
  if ([(NSMutableArray *)self->schema count] >= a3)
  {
    id v6 = [(NSMutableArray *)self->_replaceMissingValue objectAtIndex:a3];
    BOOL v7 = [(CPMLSchema *)self isStringType:a3];
    if (v6 || !v7)
    {
      if ([v6 isEqualToString:&stru_26C5111B8]) {
        int v8 = 0;
      }
      else {
        int v8 = v6;
      }
      BOOL v5 = v8;
    }
    else
    {
      BOOL v5 = @"0";
    }
  }
  else
  {
    NSLog(&cfstr_SColAccessGrea.isa, "-[CPMLSchema getSubstituteValue:]");
    BOOL v5 = 0;
  }

  return v5;
}

- (NSMutableArray)attribute
{
  return self->attribute;
}

- (NSMutableString)schemaHeader
{
  return self->schemaHeader;
}

- (NSMutableString)schemaHeaderWithType
{
  return self->schemaHeaderWithType;
}

- (NSMutableArray)nsRemapTable
{
  return self->nsRemapTable;
}

- (NSMutableArray)availableOptions
{
  return self->availableOptions;
}

- (NSMutableArray)indexColumnList
{
  return self->_indexColumnList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexColumnList, 0);
  objc_storeStrong((id *)&self->availableOptions, 0);
  objc_storeStrong((id *)&self->_matchReplaceValue, 0);
  objc_storeStrong((id *)&self->_replaceMissingValue, 0);
  objc_storeStrong((id *)&self->_categoricalDataList, 0);
  objc_storeStrong((id *)&self->nsRemapTable, 0);
  objc_storeStrong((id *)&self->schemaHDef, 0);
  objc_storeStrong((id *)&self->attribute, 0);
  objc_storeStrong((id *)&self->schemaHeaderWithType, 0);
  objc_storeStrong((id *)&self->schemaHeader, 0);

  objc_storeStrong((id *)&self->schema, 0);
}

@end