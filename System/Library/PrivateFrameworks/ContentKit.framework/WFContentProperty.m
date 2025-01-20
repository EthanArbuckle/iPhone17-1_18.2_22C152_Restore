@interface WFContentProperty
+ (id)possibleLabelsForClass:(Class)a3 localized:(BOOL)a4;
- (BOOL)canLowercaseName;
- (BOOL)caseInsensitive;
- (BOOL)hasNegative;
- (BOOL)hasPossibleValues;
- (BOOL)isAppendable;
- (BOOL)isEquivalentToProperty:(id)a3;
- (BOOL)isFilterable;
- (BOOL)isGettable;
- (BOOL)isIrrational;
- (BOOL)isLabeledValue;
- (BOOL)isPrimary;
- (BOOL)isRemovable;
- (BOOL)isSettable;
- (BOOL)isSortable;
- (BOOL)multipleValues;
- (Class)propertyClass;
- (Class)valueItemClass;
- (NSArray)allowedOperators;
- (NSArray)possibleLabels;
- (NSSet)allowedTransactionModes;
- (NSString)displayName;
- (NSString)keyPath;
- (NSString)localizedName;
- (NSString)localizedNegativeName;
- (NSString)localizedSingularItemName;
- (NSString)measurementUnitType;
- (NSString)name;
- (NSString)negativeName;
- (NSString)singularItemName;
- (WFContentProperty)initWithKeyPath:(id)a3 block:(id)a4 setterBlock:(id)a5 name:(id)a6 propertyClass:(Class)a7 multipleValues:(BOOL)a8 filterable:(BOOL)a9 sortable:(BOOL)a10 gettable:(BOOL)a11 settable:(BOOL)a12 appendable:(BOOL)a13 removable:(BOOL)a14 primary:(BOOL)a15 allowedOperators:(id)a16 userInfo:(id)a17 possibleValues:(id)a18 caseInsensitive:(BOOL)a19 negativeName:(id)a20 singularItemName:(id)a21 irrational:(BOOL)a22 tense:(unint64_t)a23 timeUnits:(unint64_t)a24 comparableUnits:(unint64_t)a25 measurementUnitType:(id)a26 displayName:(id)a27 canLowercaseName:(BOOL)a28;
- (WFContentPropertyPossibleValuesGetter)possibleValues;
- (WFPropertyListObject)userInfo;
- (id)block;
- (id)description;
- (id)localizedNameWithContext:(id)a3;
- (id)preferredTransactionModeWithCurrentMode:(id)a3;
- (id)setterBlock;
- (unint64_t)comparableUnits;
- (unint64_t)equivalentHash;
- (unint64_t)tense;
- (unint64_t)timeUnits;
- (void)getValueForObject:(id)a3 completionHandler:(id)a4;
- (void)getValuesForObject:(id)a3 completionHandler:(id)a4;
- (void)setPossibleValues:(id)a3;
- (void)updateWithValue:(id)a3 withTransaction:(id)a4 completion:(id)a5;
@end

@implementation WFContentProperty

- (NSArray)possibleLabels
{
  if ([(WFContentProperty *)self isLabeledValue])
  {
    v3 = objc_msgSend((id)objc_opt_class(), "possibleLabelsForClass:localized:", -[WFContentProperty propertyClass](self, "propertyClass"), 0);
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)v3;
}

+ (id)possibleLabelsForClass:(Class)a3 localized:(BOOL)a4
{
  BOOL v72 = a4;
  uint64_t v81 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v6 = (id *)getCNLabelHomeSymbolLoc_ptr;
  uint64_t v76 = getCNLabelHomeSymbolLoc_ptr;
  if (!getCNLabelHomeSymbolLoc_ptr)
  {
    v7 = ContactsLibrary();
    v74[3] = (uint64_t)dlsym(v7, "CNLabelHome");
    getCNLabelHomeSymbolLoc_ptr = v74[3];
    v6 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v6)
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    v49 = [NSString stringWithUTF8String:"NSString *getCNLabelHome(void)"];
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, @"WFContentProperty+CNLabeledValue.m", 15, @"%s", dlerror());

    goto LABEL_59;
  }
  id v8 = *v6;
  v79[0] = v8;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v9 = (id *)getCNLabelWorkSymbolLoc_ptr;
  uint64_t v76 = getCNLabelWorkSymbolLoc_ptr;
  if (!getCNLabelWorkSymbolLoc_ptr)
  {
    v10 = ContactsLibrary();
    v74[3] = (uint64_t)dlsym(v10, "CNLabelWork");
    getCNLabelWorkSymbolLoc_ptr = v74[3];
    v9 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v9)
  {
    v50 = [MEMORY[0x263F08690] currentHandler];
    v51 = [NSString stringWithUTF8String:"NSString *getCNLabelWork(void)"];
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"WFContentProperty+CNLabeledValue.m", 16, @"%s", dlerror());

    goto LABEL_59;
  }
  id v11 = *v9;
  v79[1] = v11;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v12 = (id *)getCNLabelSchoolSymbolLoc_ptr;
  uint64_t v76 = getCNLabelSchoolSymbolLoc_ptr;
  if (!getCNLabelSchoolSymbolLoc_ptr)
  {
    v13 = ContactsLibrary();
    v74[3] = (uint64_t)dlsym(v13, "CNLabelSchool");
    getCNLabelSchoolSymbolLoc_ptr = v74[3];
    v12 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v12)
  {
    v52 = [MEMORY[0x263F08690] currentHandler];
    v53 = [NSString stringWithUTF8String:"NSString *getCNLabelSchool(void)"];
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"WFContentProperty+CNLabeledValue.m", 17, @"%s", dlerror());

    goto LABEL_59;
  }
  id v80 = *v12;
  v14 = (void *)MEMORY[0x263EFF8C0];
  id v15 = v80;
  v16 = [v14 arrayWithObjects:v79 count:3];

  v17 = [v5 arrayWithArray:v16];

  if ([(objc_class *)a3 isEqual:objc_opt_class()])
  {
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    v18 = (id *)getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
    uint64_t v76 = getCNLabelPhoneNumberiPhoneSymbolLoc_ptr;
    if (!getCNLabelPhoneNumberiPhoneSymbolLoc_ptr)
    {
      v19 = ContactsLibrary();
      v74[3] = (uint64_t)dlsym(v19, "CNLabelPhoneNumberiPhone");
      getCNLabelPhoneNumberiPhoneSymbolLoc_ptr = v74[3];
      v18 = (id *)v74[3];
    }
    _Block_object_dispose(&v73, 8);
    if (v18)
    {
      id v20 = *v18;
      v77[0] = v20;
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      v21 = (id *)getCNLabelPhoneNumberMobileSymbolLoc_ptr;
      uint64_t v76 = getCNLabelPhoneNumberMobileSymbolLoc_ptr;
      if (!getCNLabelPhoneNumberMobileSymbolLoc_ptr)
      {
        v22 = ContactsLibrary();
        v74[3] = (uint64_t)dlsym(v22, "CNLabelPhoneNumberMobile");
        getCNLabelPhoneNumberMobileSymbolLoc_ptr = v74[3];
        v21 = (id *)v74[3];
      }
      _Block_object_dispose(&v73, 8);
      if (v21)
      {
        id v23 = *v21;
        v77[1] = v23;
        uint64_t v73 = 0;
        v74 = &v73;
        uint64_t v75 = 0x2020000000;
        v24 = (id *)getCNLabelPhoneNumberMainSymbolLoc_ptr;
        uint64_t v76 = getCNLabelPhoneNumberMainSymbolLoc_ptr;
        if (!getCNLabelPhoneNumberMainSymbolLoc_ptr)
        {
          v25 = ContactsLibrary();
          v74[3] = (uint64_t)dlsym(v25, "CNLabelPhoneNumberMain");
          getCNLabelPhoneNumberMainSymbolLoc_ptr = v74[3];
          v24 = (id *)v74[3];
        }
        _Block_object_dispose(&v73, 8);
        if (v24)
        {
          id v26 = *v24;
          v77[2] = v26;
          uint64_t v73 = 0;
          v74 = &v73;
          uint64_t v75 = 0x2020000000;
          v27 = (id *)getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr;
          uint64_t v76 = getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr;
          if (!getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr)
          {
            v28 = ContactsLibrary();
            v74[3] = (uint64_t)dlsym(v28, "CNLabelPhoneNumberHomeFax");
            getCNLabelPhoneNumberHomeFaxSymbolLoc_ptr = v74[3];
            v27 = (id *)v74[3];
          }
          _Block_object_dispose(&v73, 8);
          if (v27)
          {
            id v29 = *v27;
            v77[3] = v29;
            uint64_t v73 = 0;
            v74 = &v73;
            uint64_t v75 = 0x2020000000;
            v30 = (id *)getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr;
            uint64_t v76 = getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr;
            if (!getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr)
            {
              v31 = ContactsLibrary();
              v74[3] = (uint64_t)dlsym(v31, "CNLabelPhoneNumberWorkFax");
              getCNLabelPhoneNumberWorkFaxSymbolLoc_ptr = v74[3];
              v30 = (id *)v74[3];
            }
            _Block_object_dispose(&v73, 8);
            if (v30)
            {
              id v32 = *v30;
              v77[4] = v32;
              uint64_t v73 = 0;
              v74 = &v73;
              uint64_t v75 = 0x2020000000;
              v33 = (id *)getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr;
              uint64_t v76 = getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr;
              if (!getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr)
              {
                v34 = ContactsLibrary();
                v74[3] = (uint64_t)dlsym(v34, "CNLabelPhoneNumberOtherFax");
                getCNLabelPhoneNumberOtherFaxSymbolLoc_ptr = v74[3];
                v33 = (id *)v74[3];
              }
              _Block_object_dispose(&v73, 8);
              if (v33)
              {
                id v35 = *v33;
                v77[5] = v35;
                uint64_t v73 = 0;
                v74 = &v73;
                uint64_t v75 = 0x2020000000;
                v36 = (id *)getCNLabelPhoneNumberPagerSymbolLoc_ptr;
                uint64_t v76 = getCNLabelPhoneNumberPagerSymbolLoc_ptr;
                if (!getCNLabelPhoneNumberPagerSymbolLoc_ptr)
                {
                  v37 = ContactsLibrary();
                  v74[3] = (uint64_t)dlsym(v37, "CNLabelPhoneNumberPager");
                  getCNLabelPhoneNumberPagerSymbolLoc_ptr = v74[3];
                  v36 = (id *)v74[3];
                }
                _Block_object_dispose(&v73, 8);
                if (v36)
                {
                  id v78 = *v36;
                  v38 = (void *)MEMORY[0x263EFF8C0];
                  id v39 = v78;
                  v40 = [v38 arrayWithObjects:v77 count:7];

                  [v17 addObjectsFromArray:v40];
                  goto LABEL_38;
                }
                v68 = [MEMORY[0x263F08690] currentHandler];
                v69 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberPager(void)"];
                objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, @"WFContentProperty+CNLabeledValue.m", 25, @"%s", dlerror());
              }
              else
              {
                v66 = [MEMORY[0x263F08690] currentHandler];
                v67 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberOtherFax(void)"];
                objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, @"WFContentProperty+CNLabeledValue.m", 19, @"%s", dlerror());
              }
            }
            else
            {
              v64 = [MEMORY[0x263F08690] currentHandler];
              v65 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberWorkFax(void)"];
              objc_msgSend(v64, "handleFailureInFunction:file:lineNumber:description:", v65, @"WFContentProperty+CNLabeledValue.m", 24, @"%s", dlerror());
            }
          }
          else
          {
            v62 = [MEMORY[0x263F08690] currentHandler];
            v63 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberHomeFax(void)"];
            objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, @"WFContentProperty+CNLabeledValue.m", 23, @"%s", dlerror());
          }
        }
        else
        {
          v60 = [MEMORY[0x263F08690] currentHandler];
          v61 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberMain(void)"];
          objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, @"WFContentProperty+CNLabeledValue.m", 22, @"%s", dlerror());
        }
      }
      else
      {
        v58 = [MEMORY[0x263F08690] currentHandler];
        v59 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberMobile(void)"];
        objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, @"WFContentProperty+CNLabeledValue.m", 21, @"%s", dlerror());
      }
    }
    else
    {
      v56 = [MEMORY[0x263F08690] currentHandler];
      v57 = [NSString stringWithUTF8String:"NSString *getCNLabelPhoneNumberiPhone(void)"];
      objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"WFContentProperty+CNLabeledValue.m", 20, @"%s", dlerror());
    }
LABEL_59:
    __break(1u);
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()])
  {
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    v41 = (void *)getCNLabelEmailiCloudSymbolLoc_ptr;
    uint64_t v76 = getCNLabelEmailiCloudSymbolLoc_ptr;
    if (!getCNLabelEmailiCloudSymbolLoc_ptr)
    {
      v42 = ContactsLibrary();
      v74[3] = (uint64_t)dlsym(v42, "CNLabelEmailiCloud");
      getCNLabelEmailiCloudSymbolLoc_ptr = v74[3];
      v41 = (void *)v74[3];
    }
    _Block_object_dispose(&v73, 8);
    if (!v41)
    {
      v70 = [MEMORY[0x263F08690] currentHandler];
      v71 = [NSString stringWithUTF8String:"NSString *getCNLabelEmailiCloud(void)"];
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, @"WFContentProperty+CNLabeledValue.m", 26, @"%s", dlerror());

      goto LABEL_59;
    }
    [v17 addObject:*v41];
  }
LABEL_38:
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v43 = (void *)getCNLabelOtherSymbolLoc_ptr;
  uint64_t v76 = getCNLabelOtherSymbolLoc_ptr;
  if (!getCNLabelOtherSymbolLoc_ptr)
  {
    v44 = ContactsLibrary();
    v74[3] = (uint64_t)dlsym(v44, "CNLabelOther");
    getCNLabelOtherSymbolLoc_ptr = v74[3];
    v43 = (void *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v43)
  {
    v54 = [MEMORY[0x263F08690] currentHandler];
    v55 = [NSString stringWithUTF8String:"NSString *getCNLabelOther(void)"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"WFContentProperty+CNLabeledValue.m", 18, @"%s", dlerror());

    goto LABEL_59;
  }
  [v17 addObject:*v43];
  if (v72)
  {
    objc_msgSend(v17, "if_map:", &__block_literal_global_4239);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v45 = v17;
  }
  v46 = v45;

  return v46;
}

id __70__WFContentProperty_CNLabeledValue__possibleLabelsForClass_localized___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContactLabeledValue localizedStringForLabel:a2];
}

- (id)preferredTransactionModeWithCurrentMode:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(WFContentProperty *)self allowedTransactionModes];
  char v6 = [v5 containsObject:v4];

  v7 = v4;
  if (v6) {
    goto LABEL_7;
  }
  if (![(WFContentProperty *)self multipleValues])
  {
    if ([(__CFString *)v4 isEqual:@"RemoveAll"])
    {
      id v8 = [(WFContentProperty *)self allowedTransactionModes];
      v7 = @"Remove";
      char v9 = [v8 containsObject:@"Remove"];

      if (v9) {
        goto LABEL_7;
      }
    }
  }
  v10 = [(WFContentProperty *)self allowedTransactionModes];
  v7 = @"Set";
  char v11 = [v10 containsObject:@"Set"];

  if ((v11 & 1) != 0
    || ([(WFContentProperty *)self allowedTransactionModes],
        v12 = objc_claimAutoreleasedReturnValue(),
        v7 = @"Append",
        int v13 = [v12 containsObject:@"Append"],
        v12,
        v13))
  {
LABEL_7:
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSSet)allowedTransactionModes
{
  if ([(WFContentProperty *)self isSettable])
  {
    v3 = objc_opt_new();
    if (![(WFContentProperty *)self isLabeledValue]) {
      [v3 addObject:@"Set"];
    }
    if ([(WFContentProperty *)self isAppendable]) {
      [v3 addObject:@"Append"];
    }
    if ([(WFContentProperty *)self isRemovable]) {
      [v3 addObject:@"Remove"];
    }
    if ([(WFContentProperty *)self multipleValues]) {
      [v3 addObject:@"RemoveAll"];
    }
  }
  else
  {
    v3 = objc_opt_new();
  }
  return (NSSet *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_measurementUnitType, 0);
  objc_storeStrong((id *)&self->_negativeName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_allowedOperators, 0);
  objc_storeStrong((id *)&self->_propertyClass, 0);
  objc_storeStrong((id *)&self->_singularItemName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)measurementUnitType
{
  return self->_measurementUnitType;
}

- (unint64_t)comparableUnits
{
  return self->_comparableUnits;
}

- (unint64_t)timeUnits
{
  return self->_timeUnits;
}

- (unint64_t)tense
{
  return self->_tense;
}

- (BOOL)isIrrational
{
  return self->_irrational;
}

- (NSString)negativeName
{
  return self->_negativeName;
}

- (BOOL)caseInsensitive
{
  return self->_caseInsensitive;
}

- (WFPropertyListObject)userInfo
{
  return self->_userInfo;
}

- (NSArray)allowedOperators
{
  return self->_allowedOperators;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (BOOL)isRemovable
{
  return self->_removable;
}

- (BOOL)isAppendable
{
  return self->_appendable;
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (BOOL)isGettable
{
  return self->_gettable;
}

- (BOOL)isSortable
{
  return self->_sortable;
}

- (BOOL)isFilterable
{
  return self->_filterable;
}

- (BOOL)multipleValues
{
  return self->_multipleValues;
}

- (Class)propertyClass
{
  return self->_propertyClass;
}

- (BOOL)canLowercaseName
{
  return self->_canLowercaseName;
}

- (NSString)singularItemName
{
  return self->_singularItemName;
}

- (NSString)name
{
  return self->_name;
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (id)block
{
  return self->_block;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)equivalentHash
{
  v3 = [(WFContentProperty *)self name];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(id)objc_opt_class() hash] ^ v4;
  BOOL v6 = [(WFContentProperty *)self multipleValues];
  uint64_t v7 = 3199029539;
  if (v6) {
    uint64_t v7 = 974800389;
  }
  unint64_t v8 = v5 ^ v7;

  return v8;
}

- (BOOL)isEquivalentToProperty:(id)a3
{
  uint64_t v4 = (WFContentProperty *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v5 = [(WFContentProperty *)self name];
    BOOL v6 = [(WFContentProperty *)v4 name];
    if ([v5 isEqualToString:v6]
      && (uint64_t v7 = [(WFContentProperty *)self propertyClass],
          v7 == [(WFContentProperty *)v4 propertyClass]))
    {
      BOOL v9 = [(WFContentProperty *)self multipleValues];
      BOOL v8 = v9 ^ [(WFContentProperty *)v4 multipleValues] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (void)updateWithValue:(id)a3 withTransaction:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  char v11 = [(WFContentProperty *)self setterBlock];

  if (v11)
  {
    id v12 = v8;
    if ([(WFContentProperty *)self multipleValues]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (v12)
      {
        v18[0] = v12;
        uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
        goto LABEL_10;
      }
      id v12 = (id)MEMORY[0x263EFFA68];
    }
    else if (![(WFContentProperty *)self multipleValues])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 firstObject];
LABEL_10:
        v14 = (void *)v13;

        id v12 = v14;
      }
    }
    id v15 = [v9 mode];
    if ([v15 isEqual:@"Remove"])
    {
      BOOL v16 = [(WFContentProperty *)self multipleValues];

      if (v16)
      {
LABEL_16:
        v17 = [(WFContentProperty *)self setterBlock];
        ((void (**)(void, id, id))v17)[2](v17, v9, v12);

        v10[2](v10, 1);
        goto LABEL_17;
      }
      id v15 = v12;
      id v12 = 0;
    }

    goto LABEL_16;
  }
  v10[2](v10, 0);
LABEL_17:
}

- (void)getValuesForObject:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__WFContentProperty_getValuesForObject_completionHandler___block_invoke;
    v8[3] = &unk_264288AF0;
    v8[4] = self;
    id v9 = v6;
    [(WFContentProperty *)self getValueForObject:a3 completionHandler:v8];
  }
}

void __58__WFContentProperty_getValuesForObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 && ![*(id *)(a1 + 32) multipleValues])
  {
    v6[0] = v3;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)getValueForObject:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    uint64_t v7 = [(WFContentProperty *)self block];

    if (v7)
    {
      id v8 = [(WFContentProperty *)self block];
      id v9 = [(WFContentProperty *)self userInfo];
      ((void (**)(void, id, void *, void (**)(id, void *)))v8)[2](v8, v13, v9, v6);
    }
    else
    {
      v10 = [(WFContentProperty *)self keyPath];

      if (v10)
      {
        char v11 = [(WFContentProperty *)self keyPath];
        id v12 = [v13 valueForKeyPath:v11];
        v6[2](v6, v12);
      }
      else
      {
        v6[2](v6, 0);
      }
    }
  }
}

- (Class)valueItemClass
{
  v2 = [(WFContentProperty *)self propertyClass];
  if ([(objc_class *)v2 isSubclassOfClass:objc_opt_class()])
  {
    id v3 = v2;
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  if ([(objc_class *)v2 isSubclassOfClass:objc_opt_class()])
  {
    objc_opt_class();
    id v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  uint64_t v5 = +[WFContentItemRegistry sharedRegistry];
  id v6 = +[WFObjectType typeWithClass:v2];
  uint64_t v4 = [v5 contentItemClassForType:v6];

LABEL_7:
  return (Class)v4;
}

- (BOOL)isLabeledValue
{
  if (([(objc_class *)[(WFContentProperty *)self propertyClass] isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)[(WFContentProperty *)self propertyClass] isEqual:objc_opt_class()] & 1) != 0)
  {
    return 1;
  }
  uint64_t v4 = [(WFContentProperty *)self propertyClass];
  uint64_t v5 = objc_opt_class();
  return [(objc_class *)v4 isEqual:v5];
}

- (void)setPossibleValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [WFContentPropertyPossibleValuesSynchronousGetter alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__WFContentProperty_setPossibleValues___block_invoke;
  v9[3] = &unk_264288AC8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(WFContentPropertyPossibleValuesSynchronousGetter *)v5 initWithSynchronousGetter:v9];
  possibleValues = self->_possibleValues;
  self->_possibleValues = v7;
}

id __39__WFContentProperty_setPossibleValues___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) copy];
  return v1;
}

- (WFContentPropertyPossibleValuesGetter)possibleValues
{
  possibleValues = self->_possibleValues;
  if (possibleValues) {
    id v3 = possibleValues;
  }
  else {
    id v3 = [[WFContentPropertyPossibleValuesSynchronousGetter alloc] initWithSynchronousGetter:&__block_literal_global_15481];
  }
  return (WFContentPropertyPossibleValuesGetter *)v3;
}

id __35__WFContentProperty_possibleValues__block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

- (BOOL)hasPossibleValues
{
  return self->_possibleValues != 0;
}

- (NSString)localizedSingularItemName
{
  v2 = [(WFContentProperty *)self singularItemName];
  id v3 = WFLocalizedContentPropertyName(v2);

  return (NSString *)v3;
}

- (NSString)localizedNegativeName
{
  id v3 = [(WFContentProperty *)self negativeName];
  if (v3)
  {
    id v4 = [(WFContentProperty *)self negativeName];
    uint64_t v5 = WFLocalizedContentPropertyName(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)hasNegative
{
  [(WFContentProperty *)self propertyClass];
  v2 = [NSNumber numberWithBool:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)localizedNameWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(WFContentProperty *)self displayName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(WFContentProperty *)self name];
  }
  id v8 = v7;

  id v9 = [v4 locale];

  id v10 = v8;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v10 stringResource];
    [v12 setLocale:v11];
    uint64_t v13 = [v12 localize];
  }
  else
  {
    v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "WFLocalizedContentPropertyNameWithLocale";
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_DEBUG, "%s Content property name: %@ is unable to be localized in a specific locale.", buf, 0x16u);
    }

    id v12 = [NSString stringWithFormat:@"%@ (Content Property Name)", v10];
    uint64_t v13 = WFLocalizedStringWithKey(v12, v10);
  }
  id v15 = (void *)v13;

  return v15;
}

- (NSString)localizedName
{
  id v3 = [(WFContentProperty *)self displayName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFContentProperty *)self name];
  }
  id v6 = v5;

  id v7 = WFLocalizedContentPropertyName(v6);

  return (NSString *)v7;
}

- (id)description
{
  id v3 = [(WFContentProperty *)self keyPath];
  if (v3)
  {
    id v4 = NSString;
    id v5 = [(WFContentProperty *)self keyPath];
    v33 = [v4 stringWithFormat:@", keyPath: %@", v5];
  }
  else
  {
    v33 = &stru_26C71CE08;
  }

  id v6 = [(WFContentProperty *)self keyPath];
  if (v6)
  {
    id v7 = NSString;
    id v8 = [(WFContentProperty *)self block];
    id v9 = _Block_copy(v8);
    id v32 = [v7 stringWithFormat:@", block: %@", v9];
  }
  else
  {
    id v32 = &stru_26C71CE08;
  }

  id v10 = [(WFContentProperty *)self userInfo];
  if (v10)
  {
    id v11 = NSString;
    id v12 = [(WFContentProperty *)self userInfo];
    v31 = [v11 stringWithFormat:@", userInfo: %@", v12];
  }
  else
  {
    v31 = &stru_26C71CE08;
  }

  uint64_t v13 = [(WFContentProperty *)self possibleValues];
  if (v13)
  {
    v14 = NSString;
    id v15 = [(WFContentProperty *)self possibleValues];
    v30 = [v14 stringWithFormat:@", possibleValues: %@", v15];
  }
  else
  {
    v30 = &stru_26C71CE08;
  }

  BOOL v16 = [(WFContentProperty *)self negativeName];
  if (v16)
  {
    v17 = NSString;
    v18 = [(WFContentProperty *)self negativeName];
    __int16 v19 = [v17 stringWithFormat:@", negativeName: %@", v18];
  }
  else
  {
    __int16 v19 = &stru_26C71CE08;
  }

  id v29 = NSString;
  id v20 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v20);
  uint64_t v21 = [(WFContentProperty *)self name];
  v22 = NSStringFromClass([(WFContentProperty *)self propertyClass]);
  if ([(WFContentProperty *)self multipleValues]) {
    id v23 = @"YES";
  }
  else {
    id v23 = @"NO";
  }
  if ([(WFContentProperty *)self isFilterable]) {
    v24 = @"YES";
  }
  else {
    v24 = @"NO";
  }
  if ([(WFContentProperty *)self isSortable]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  id v26 = [v29 stringWithFormat:@"<%@: %p%@%@, name: %@, class: %@, multipleValues: %@, filterable: %@, sortable: %@%@%@%@>", v28, self, v33, v32, v21, v22, v23, v24, v25, v31, v30, v19];

  return v26;
}

- (WFContentProperty)initWithKeyPath:(id)a3 block:(id)a4 setterBlock:(id)a5 name:(id)a6 propertyClass:(Class)a7 multipleValues:(BOOL)a8 filterable:(BOOL)a9 sortable:(BOOL)a10 gettable:(BOOL)a11 settable:(BOOL)a12 appendable:(BOOL)a13 removable:(BOOL)a14 primary:(BOOL)a15 allowedOperators:(id)a16 userInfo:(id)a17 possibleValues:(id)a18 caseInsensitive:(BOOL)a19 negativeName:(id)a20 singularItemName:(id)a21 irrational:(BOOL)a22 tense:(unint64_t)a23 timeUnits:(unint64_t)a24 comparableUnits:(unint64_t)a25 measurementUnitType:(id)a26 displayName:(id)a27 canLowercaseName:(BOOL)a28
{
  unint64_t v32 = (unint64_t)a3;
  unint64_t v33 = (unint64_t)a4;
  id v34 = a5;
  id v35 = a6;
  id v36 = a16;
  id v70 = a17;
  id v69 = a18;
  id v37 = a20;
  id v38 = a21;
  id v39 = a26;
  id v40 = a27;
  v41 = (void *)v32;
  if (v32 | v33)
  {
    if (v35) {
      goto LABEL_3;
    }
  }
  else
  {
    id v66 = v40;
    v60 = [MEMORY[0x263F08690] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"WFContentProperty.m", 94, @"Invalid parameter not satisfying: %@", @"block || keyPath" object file lineNumber description];

    id v40 = v66;
    if (v35) {
      goto LABEL_3;
    }
  }
  id v67 = v40;
  v61 = [MEMORY[0x263F08690] currentHandler];
  [v61 handleFailureInMethod:a2, self, @"WFContentProperty.m", 96, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  id v40 = v67;
LABEL_3:
  if (!a7)
  {
    id v68 = v40;
    v62 = [MEMORY[0x263F08690] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"WFContentProperty.m", 97, @"Invalid parameter not satisfying: %@", @"propertyClass" object file lineNumber description];

    id v40 = v68;
    if (!self) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (self)
  {
LABEL_5:
    id v65 = v40;
    v42 = (NSString *)[v41 copy];
    keyPath = self->_keyPath;
    self->_keyPath = v42;

    v44 = (void *)[(id)v33 copy];
    id block = self->_block;
    self->_id block = v44;

    v46 = (void *)[v34 copy];
    id setterBlock = self->_setterBlock;
    self->_id setterBlock = v46;

    v48 = (NSString *)[v35 copy];
    name = self->_name;
    self->_name = v48;

    objc_storeStrong((id *)&self->_propertyClass, a7);
    self->_multipleValues = a8;
    self->_filterable = a9;
    self->_sortable = a10;
    self->_gettable = a11;
    self->_settable = a12;
    self->_appendable = a13;
    self->_removable = a14;
    self->_primary = a15;
    v50 = (NSArray *)[v36 copy];
    allowedOperators = self->_allowedOperators;
    self->_allowedOperators = v50;

    objc_storeStrong((id *)&self->_userInfo, a17);
    objc_storeStrong((id *)&self->_possibleValues, a18);
    self->_caseInsensitive = a19;
    v52 = (NSString *)[v37 copy];
    negativeName = self->_negativeName;
    self->_negativeName = v52;

    v54 = (NSString *)[v38 copy];
    singularItemName = self->_singularItemName;
    self->_singularItemName = v54;

    self->_irrational = a22;
    self->_tense = a23;
    self->_timeUnits = a24;
    self->_comparableUnits = a25;
    objc_storeStrong((id *)&self->_measurementUnitType, a26);
    v56 = (NSString *)[v65 copy];
    displayName = self->_displayName;
    self->_displayName = v56;

    self->_canLowercaseName = a28;
    v58 = self;
    id v40 = v65;
  }
LABEL_6:

  return self;
}

@end