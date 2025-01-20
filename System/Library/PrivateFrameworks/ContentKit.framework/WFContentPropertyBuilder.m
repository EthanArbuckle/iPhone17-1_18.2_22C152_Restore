@interface WFContentPropertyBuilder
+ (id)block:(id)a3 name:(id)a4 class:(Class)a5;
+ (id)block:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6;
+ (id)keyPath:(id)a3 name:(id)a4 class:(Class)a5;
+ (id)keyPath:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6;
- (BOOL)isIrrational;
- (Class)propertyClass;
- (NSArray)allowedOperators;
- (NSNumber)appendable;
- (NSNumber)canLowercaseName;
- (NSNumber)caseInsensitive;
- (NSNumber)comparableUnits;
- (NSNumber)filterable;
- (NSNumber)gettable;
- (NSNumber)multipleValues;
- (NSNumber)primary;
- (NSNumber)removable;
- (NSNumber)settable;
- (NSNumber)sortable;
- (NSNumber)tense;
- (NSNumber)timeUnits;
- (NSString)displayName;
- (NSString)keyPath;
- (NSString)measurementUnitType;
- (NSString)name;
- (NSString)negativeName;
- (NSString)singularItemName;
- (WFContentPropertyPossibleValuesGetter)possibleValuesGetter;
- (WFPropertyListObject)userInfo;
- (id)allowedOperators:(id)a3;
- (id)appendable:(BOOL)a3;
- (id)block;
- (id)build;
- (id)canLowercaseName:(BOOL)a3;
- (id)caseInsensitive:(BOOL)a3;
- (id)comparableUnits:(unint64_t)a3;
- (id)displayName:(id)a3;
- (id)filterable:(BOOL)a3;
- (id)gettable:(BOOL)a3;
- (id)irrational:(BOOL)a3;
- (id)measurementUnitType:(id)a3;
- (id)multipleValues:(BOOL)a3;
- (id)negativeName:(id)a3;
- (id)possibleValues:(id)a3;
- (id)possibleValuesAsynchronousGetter:(id)a3;
- (id)possibleValuesGetter:(id)a3;
- (id)primary:(BOOL)a3;
- (id)removable:(BOOL)a3;
- (id)setterBlock;
- (id)setterBlock:(id)a3;
- (id)singularItemName:(id)a3;
- (id)sortable:(BOOL)a3;
- (id)tense:(unint64_t)a3;
- (id)timeUnits:(unint64_t)a3;
- (id)userInfo:(id)a3;
- (void)setAllowedOperators:(id)a3;
- (void)setAppendable:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCanLowercaseName:(id)a3;
- (void)setCaseInsensitive:(id)a3;
- (void)setComparableUnits:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFilterable:(id)a3;
- (void)setGettable:(id)a3;
- (void)setIrrational:(BOOL)a3;
- (void)setKeyPath:(id)a3;
- (void)setMeasurementUnitType:(id)a3;
- (void)setMultipleValues:(id)a3;
- (void)setName:(id)a3;
- (void)setNegativeName:(id)a3;
- (void)setPossibleValuesGetter:(id)a3;
- (void)setPrimary:(id)a3;
- (void)setPropertyClass:(Class)a3;
- (void)setRemovable:(id)a3;
- (void)setSettable:(id)a3;
- (void)setSetterBlock:(id)a3;
- (void)setSingularItemName:(id)a3;
- (void)setSortable:(id)a3;
- (void)setTense:(id)a3;
- (void)setTimeUnits:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation WFContentPropertyBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canLowercaseName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_measurementUnitType, 0);
  objc_storeStrong((id *)&self->_comparableUnits, 0);
  objc_storeStrong((id *)&self->_timeUnits, 0);
  objc_storeStrong((id *)&self->_tense, 0);
  objc_storeStrong((id *)&self->_singularItemName, 0);
  objc_storeStrong((id *)&self->_negativeName, 0);
  objc_storeStrong((id *)&self->_caseInsensitive, 0);
  objc_storeStrong((id *)&self->_possibleValuesGetter, 0);
  objc_storeStrong((id *)&self->_allowedOperators, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_appendable, 0);
  objc_storeStrong((id *)&self->_settable, 0);
  objc_storeStrong((id *)&self->_gettable, 0);
  objc_storeStrong((id *)&self->_sortable, 0);
  objc_storeStrong((id *)&self->_filterable, 0);
  objc_storeStrong((id *)&self->_multipleValues, 0);
  objc_storeStrong((id *)&self->_propertyClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)setCanLowercaseName:(id)a3
{
}

- (NSNumber)canLowercaseName
{
  return self->_canLowercaseName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setMeasurementUnitType:(id)a3
{
}

- (NSString)measurementUnitType
{
  return self->_measurementUnitType;
}

- (void)setComparableUnits:(id)a3
{
}

- (NSNumber)comparableUnits
{
  return self->_comparableUnits;
}

- (void)setTimeUnits:(id)a3
{
}

- (NSNumber)timeUnits
{
  return self->_timeUnits;
}

- (void)setTense:(id)a3
{
}

- (NSNumber)tense
{
  return self->_tense;
}

- (void)setIrrational:(BOOL)a3
{
  self->_irrational = a3;
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (void)setSingularItemName:(id)a3
{
}

- (NSString)singularItemName
{
  return self->_singularItemName;
}

- (void)setNegativeName:(id)a3
{
}

- (NSString)negativeName
{
  return self->_negativeName;
}

- (void)setCaseInsensitive:(id)a3
{
}

- (NSNumber)caseInsensitive
{
  return self->_caseInsensitive;
}

- (void)setPossibleValuesGetter:(id)a3
{
}

- (WFContentPropertyPossibleValuesGetter)possibleValuesGetter
{
  return self->_possibleValuesGetter;
}

- (void)setAllowedOperators:(id)a3
{
}

- (NSArray)allowedOperators
{
  return self->_allowedOperators;
}

- (void)setPrimary:(id)a3
{
}

- (NSNumber)primary
{
  return self->_primary;
}

- (void)setRemovable:(id)a3
{
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setAppendable:(id)a3
{
}

- (NSNumber)appendable
{
  return self->_appendable;
}

- (void)setSettable:(id)a3
{
}

- (NSNumber)settable
{
  return self->_settable;
}

- (void)setGettable:(id)a3
{
}

- (NSNumber)gettable
{
  return self->_gettable;
}

- (void)setSortable:(id)a3
{
}

- (NSNumber)sortable
{
  return self->_sortable;
}

- (void)setFilterable:(id)a3
{
}

- (NSNumber)filterable
{
  return self->_filterable;
}

- (void)setMultipleValues:(id)a3
{
}

- (NSNumber)multipleValues
{
  return self->_multipleValues;
}

- (void)setPropertyClass:(Class)a3
{
}

- (Class)propertyClass
{
  return self->_propertyClass;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setSetterBlock:(id)a3
{
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setUserInfo:(id)a3
{
}

- (WFPropertyListObject)userInfo
{
  return self->_userInfo;
}

- (id)build
{
  v71 = (void *)MEMORY[0x263EFFA08];
  uint64_t v70 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v71, "setWithObjects:", v70, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = [(WFContentPropertyBuilder *)self sortable];
  if (v13)
  {
    v14 = [(WFContentPropertyBuilder *)self sortable];
    char v15 = [v14 BOOLValue];
  }
  else
  {
    v14 = [(WFContentPropertyBuilder *)self multipleValues];
    if ([v14 BOOLValue])
    {
      char v15 = 0;
    }
    else
    {
      int v16 = [(objc_class *)[(WFContentPropertyBuilder *)self propertyClass] instancesRespondToSelector:sel_compare_];
      if (v16)
      {
        v17 = [(WFContentPropertyBuilder *)self propertyClass];
        char v15 = 1;
        v4 = [NSNumber numberWithBool:1];
        if (![(objc_class *)v17 isSubclassOfClass:objc_opt_class()]) {
          goto LABEL_8;
        }
      }
      v18 = [(WFContentPropertyBuilder *)self possibleValuesGetter];
      char v15 = v18 != 0;

      if (v16) {
LABEL_8:
      }
    }
  }

  v19 = [(WFContentPropertyBuilder *)self filterable];
  if (v19)
  {
    v20 = [(WFContentPropertyBuilder *)self filterable];
    char v67 = [v20 BOOLValue];
  }
  else
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __33__WFContentPropertyBuilder_build__block_invoke;
    v73[3] = &unk_264288B18;
    v73[4] = self;
    v20 = [v12 objectsPassingTest:v73];
    char v67 = [v20 count] != 0;
  }

  v21 = [(WFContentPropertyBuilder *)self gettable];
  if (v21)
  {
    v22 = [(WFContentPropertyBuilder *)self gettable];
    char v66 = [v22 BOOLValue];
  }
  else
  {
    char v66 = 1;
  }

  v23 = [(WFContentPropertyBuilder *)self setterBlock];

  v24 = [(WFContentPropertyBuilder *)self appendable];
  if (v24)
  {
    v25 = [(WFContentPropertyBuilder *)self appendable];
    HIDWORD(v47) = [v25 BOOLValue];
LABEL_19:

    goto LABEL_20;
  }
  if (v23)
  {
    v25 = [(WFContentPropertyBuilder *)self multipleValues];
    HIDWORD(v47) = v25 != 0;
    goto LABEL_19;
  }
  HIDWORD(v47) = 0;
LABEL_20:

  v26 = [(WFContentPropertyBuilder *)self removable];
  if (v26)
  {
    v27 = [(WFContentPropertyBuilder *)self removable];
    char v65 = [v27 BOOLValue];
  }
  else
  {
    v28 = [(WFContentPropertyBuilder *)self propertyClass];
    v27 = [NSNumber numberWithBool:1];
    char v65 = v28 != (objc_class *)objc_opt_class();
  }

  v29 = [(WFContentPropertyBuilder *)self canLowercaseName];
  if (v29)
  {
    v30 = [(WFContentPropertyBuilder *)self canLowercaseName];
    char v64 = [v30 BOOLValue];
  }
  else
  {
    char v64 = 1;
  }

  v31 = [(WFContentPropertyBuilder *)self tense];
  if (v31)
  {
    v32 = [(WFContentPropertyBuilder *)self tense];
    uint64_t v63 = [v32 unsignedIntegerValue];
  }
  else
  {
    uint64_t v63 = 3;
  }

  v33 = [(WFContentPropertyBuilder *)self timeUnits];
  v72 = v12;
  char v68 = v15;
  if (v33)
  {
    v34 = [(WFContentPropertyBuilder *)self timeUnits];
    uint64_t v61 = [v34 unsignedIntegerValue];
  }
  else
  {
    uint64_t v61 = 8220;
  }

  v59 = [WFContentProperty alloc];
  v58 = [(WFContentPropertyBuilder *)self keyPath];
  v57 = [(WFContentPropertyBuilder *)self block];
  v56 = [(WFContentPropertyBuilder *)self setterBlock];
  v55 = [(WFContentPropertyBuilder *)self name];
  v54 = [(WFContentPropertyBuilder *)self propertyClass];
  v62 = [(WFContentPropertyBuilder *)self multipleValues];
  unsigned int v53 = [v62 BOOLValue];
  v60 = [(WFContentPropertyBuilder *)self primary];
  char v51 = [v60 BOOLValue];
  v49 = [(WFContentPropertyBuilder *)self allowedOperators];
  v35 = [(WFContentPropertyBuilder *)self userInfo];
  v50 = [(WFContentPropertyBuilder *)self possibleValuesGetter];
  v52 = [(WFContentPropertyBuilder *)self caseInsensitive];
  char v36 = [v52 BOOLValue];
  v48 = [(WFContentPropertyBuilder *)self negativeName];
  v37 = [(WFContentPropertyBuilder *)self singularItemName];
  BOOL v38 = [(WFContentPropertyBuilder *)self isIrrational];
  v39 = [(WFContentPropertyBuilder *)self comparableUnits];
  uint64_t v40 = [v39 unsignedIntegerValue];
  v41 = [(WFContentPropertyBuilder *)self measurementUnitType];
  v42 = [(WFContentPropertyBuilder *)self displayName];
  LOBYTE(v47) = v64;
  LOBYTE(v46) = v38;
  LOBYTE(v45) = v36;
  BYTE6(v44) = v51;
  BYTE5(v44) = v65;
  BYTE4(v44) = BYTE4(v47);
  BYTE3(v44) = v23 != 0;
  BYTE2(v44) = v66;
  BYTE1(v44) = v68;
  LOBYTE(v44) = v67;
  v69 = -[WFContentProperty initWithKeyPath:block:setterBlock:name:propertyClass:multipleValues:filterable:sortable:gettable:settable:appendable:removable:primary:allowedOperators:userInfo:possibleValues:caseInsensitive:negativeName:singularItemName:irrational:tense:timeUnits:comparableUnits:measurementUnitType:displayName:canLowercaseName:](v59, "initWithKeyPath:block:setterBlock:name:propertyClass:multipleValues:filterable:sortable:gettable:settable:appendable:removable:primary:allowedOperators:userInfo:possibleValues:caseInsensitive:negativeName:singularItemName:irrational:tense:timeUnits:comparableUnits:measurementUnitType:displayName:canLowercaseName:", v58, v57, v56, v55, v54, v53, v44, v49, v35, v50, v45, v48, v37, v46, v63,
          v61,
          v40,
          v41,
          v42,
          v47);

  return v69;
}

uint64_t __33__WFContentPropertyBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v2, "propertyClass"), "isSubclassOfClass:", v3);

  return v4;
}

- (id)canLowercaseName:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setCanLowercaseName:v4];

  return self;
}

- (id)displayName:(id)a3
{
  return self;
}

- (id)measurementUnitType:(id)a3
{
  return self;
}

- (id)comparableUnits:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WFContentPropertyBuilder *)self setComparableUnits:v4];

  return self;
}

- (id)timeUnits:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WFContentPropertyBuilder *)self setTimeUnits:v4];

  return self;
}

- (id)tense:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(WFContentPropertyBuilder *)self setTense:v4];

  return self;
}

- (id)irrational:(BOOL)a3
{
  return self;
}

- (id)singularItemName:(id)a3
{
  return self;
}

- (id)negativeName:(id)a3
{
  return self;
}

- (id)caseInsensitive:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setCaseInsensitive:v4];

  return self;
}

- (id)possibleValuesAsynchronousGetter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WFContentPropertyPossibleValuesAsynchronousGetter alloc] initWithAsynchronousGetter:v4];

  [(WFContentPropertyBuilder *)self setPossibleValuesGetter:v5];
  return self;
}

- (id)possibleValuesGetter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WFContentPropertyPossibleValuesSynchronousGetter alloc] initWithSynchronousGetter:v4];

  [(WFContentPropertyBuilder *)self setPossibleValuesGetter:v5];
  return self;
}

- (id)possibleValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFContentPropertyPossibleValuesSynchronousGetter alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__WFContentPropertyBuilder_possibleValues___block_invoke;
  v9[3] = &unk_264288AC8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(WFContentPropertyPossibleValuesSynchronousGetter *)v5 initWithSynchronousGetter:v9];
  [(WFContentPropertyBuilder *)self setPossibleValuesGetter:v7];

  return self;
}

id __43__WFContentPropertyBuilder_possibleValues___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)userInfo:(id)a3
{
  return self;
}

- (id)allowedOperators:(id)a3
{
  return self;
}

- (id)primary:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setPrimary:v4];

  return self;
}

- (id)removable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setRemovable:v4];

  return self;
}

- (id)appendable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setAppendable:v4];

  return self;
}

- (id)setterBlock:(id)a3
{
  return self;
}

- (id)gettable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setGettable:v4];

  return self;
}

- (id)filterable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setFilterable:v4];

  return self;
}

- (id)sortable:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setSortable:v4];

  return self;
}

- (id)multipleValues:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WFContentPropertyBuilder *)self setMultipleValues:v4];

  return self;
}

+ (id)block:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6
{
  id v10 = a4;
  uint64_t v11 = [a1 block:a3 name:a5 class:a6];
  v12 = v11;
  if (v11)
  {
    [v11 setSetterBlock:v10];
    id v13 = v12;
  }

  return v12;
}

+ (id)block:(id)a3 name:(id)a4 class:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    char v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 285, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 284, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  int v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 286, @"Invalid parameter not satisfying: %@", @"propertyClass" object file lineNumber description];

LABEL_4:
  v12 = objc_alloc_init(WFContentPropertyBuilder);
  [(WFContentPropertyBuilder *)v12 setBlock:v9];
  [(WFContentPropertyBuilder *)v12 setName:v11];
  [(WFContentPropertyBuilder *)v12 setPropertyClass:a5];

  return v12;
}

+ (id)keyPath:(id)a3 setterBlock:(id)a4 name:(id)a5 class:(Class)a6
{
  id v10 = a4;
  uint64_t v11 = [a1 keyPath:a3 name:a5 class:a6];
  v12 = v11;
  if (v11)
  {
    [v11 setSetterBlock:v10];
    id v13 = v12;
  }

  return v12;
}

+ (id)keyPath:(id)a3 name:(id)a4 class:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    char v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 264, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 263, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  int v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"WFContentProperty.m", 265, @"Invalid parameter not satisfying: %@", @"propertyClass" object file lineNumber description];

LABEL_4:
  v12 = objc_alloc_init(WFContentPropertyBuilder);
  [(WFContentPropertyBuilder *)v12 setKeyPath:v9];
  [(WFContentPropertyBuilder *)v12 setName:v11];
  [(WFContentPropertyBuilder *)v12 setPropertyClass:a5];

  return v12;
}

@end