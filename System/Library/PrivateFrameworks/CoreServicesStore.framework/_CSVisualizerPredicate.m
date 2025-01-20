@interface _CSVisualizerPredicate
+ (BOOL)operatorIsNumeric:(unint64_t)a3;
+ (id)constantValueForExpression:(id)a3;
+ (id)predicateWithFormatString:(id)a3 error:(id *)a4;
+ (id)translateNSPredicate:(id)a3 error:(id *)a4;
+ (void)getRanges:(void *)a3 matchingPredicate:(id)a4 inDescription:(id)a5;
- (BOOL)evaluateNumerically:(id)a3;
- (BOOL)evaluateWithObject:(id)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (BOOL)getRanges:(void *)a3 inDescription:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 searchedInRange:(_NSRange *)a7;
- (_CSVisualizerPredicate)initWithExpression:(id)a3;
- (_CSVisualizerPredicate)initWithSearchString:(id)a3 forTitle:(id)a4 operator:(unint64_t)a5 error:(id *)a6;
- (_CSVisualizerPredicate)initWithSearchString:(id)a3 operator:(unint64_t)a4 error:(id *)a5;
- (id)debugDescription;
- (id)predicateFormat;
@end

@implementation _CSVisualizerPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericPredicate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_CSVisualizerPredicate *)self predicateFormat];
  v6 = [v3 stringWithFormat:@"<%@ %p> { \"%@\" }", v4, self, v5];

  return v6;
}

- (id)predicateFormat
{
  v3 = (void *)MEMORY[0x1AD0DB160](self, a2);
  if (self->_title) {
    title = (__CFString *)self->_title;
  }
  else {
    title = @"*";
  }
  v5 = [MEMORY[0x1E4F28C68] expressionForConstantValue:title];
  v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:self->_searchString];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v5 rightExpression:v6 modifier:0 type:self->_operator options:0];
  v8 = [v7 predicateFormat];

  return v8;
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __p = operator new(0x10uLL);
    v20 = __p;
    v21 = (char *)__p + 16;
    BOOL v6 = self->_operator == 9;
    long long v18 = xmmword_1A7DE45C0;
    v7 = (CSStore2 *)[(_CSVisualizerPredicate *)self getRanges:&__p inDescription:v5 options:4 * v6 limit:1 searchedInRange:&v18];
    if (v7)
    {
      unint64_t operator = self->_operator;
      switch(operator)
      {
        case 4uLL:
          v9 = __p;
          if (__p == v20) {
            goto LABEL_22;
          }
          BOOL v10 = *(void *)__p == (void)v18 && *((void *)__p + 1) == *((void *)&v18 + 1);
          goto LABEL_19;
        case 5uLL:
          v9 = __p;
          if (__p != v20)
          {
            BOOL v11 = 1;
            goto LABEL_28;
          }
          BOOL v11 = *(void *)__p != (void)v18 || *((void *)__p + 1) != *((void *)&v18 + 1);
          goto LABEL_27;
        case 6uLL:
        case 7uLL:
          goto LABEL_11;
        case 8uLL:
          v9 = __p;
          if (__p == v20) {
            goto LABEL_22;
          }
          uint64_t v12 = *(void *)__p;
          uint64_t v13 = v18;
          goto LABEL_18;
        case 9uLL:
          v9 = __p;
          if (__p == v20)
          {
LABEL_22:
            BOOL v11 = 0;
            goto LABEL_28;
          }
          uint64_t v12 = *(v20 - 1) + *(v20 - 2);
          uint64_t v13 = *((void *)&v18 + 1) + v18;
LABEL_18:
          BOOL v10 = v12 == v13;
LABEL_19:
          BOOL v11 = v10;
          goto LABEL_27;
        default:
          if (operator == 99 || self->_numericPredicate)
          {
LABEL_11:
            v9 = __p;
            BOOL v11 = __p != v20;
            goto LABEL_28;
          }
          v14 = CSStore2::GetLog(v7);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            unint64_t v17 = self->_operator;
            *(_DWORD *)buf = 67109120;
            int v23 = v17;
            _os_log_error_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_ERROR, "Unexpected predicate operator '%u'!", buf, 8u);
          }

          break;
      }
    }
    BOOL v11 = 0;
LABEL_27:
    v9 = __p;
LABEL_28:
    if (v9)
    {
      v20 = v9;
      operator delete(v9);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)evaluateWithObject:(id)a3
{
  return [(_CSVisualizerPredicate *)self evaluateWithObject:a3 substitutionVariables:0];
}

- (BOOL)getRanges:(void *)a3 inDescription:(id)a4 options:(unint64_t)a5 limit:(unint64_t)a6 searchedInRange:(_NSRange *)a7
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  context = (void *)MEMORY[0x1AD0DB160]();
  uint64_t v13 = self->_searchString;
  v14 = [v12 string];
  v15 = v14;
  title = self->_title;
  if (title)
  {
    NSUInteger v17 = +[_CSVisualizer rangeOfValueForTitle:title inDescription:v12];
    NSUInteger v19 = v18;
    BOOL v20 = v17 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v19 = [v14 length];
    NSUInteger v17 = 0;
    BOOL v20 = 1;
  }
  BOOL v66 = v20;
  if (a7)
  {
    a7->location = v17;
    a7->length = v19;
  }
  if (v15 && v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_numericPredicate)
    {
      if ([(_CSVisualizerPredicate *)self evaluateNumerically:v12])
      {
        v22 = (NSUInteger *)*((void *)a3 + 1);
        unint64_t v21 = *((void *)a3 + 2);
        if ((unint64_t)v22 >= v21)
        {
          v49 = *(NSUInteger **)a3;
          uint64_t v50 = ((uint64_t)v22 - *(void *)a3) >> 4;
          unint64_t v51 = v50 + 1;
          if ((unint64_t)(v50 + 1) >> 60) {
            abort();
          }
          uint64_t v52 = v21 - (void)v49;
          if (v52 >> 3 > v51) {
            unint64_t v51 = v52 >> 3;
          }
          BOOL v44 = (unint64_t)v52 >= 0x7FFFFFFFFFFFFFF0;
          unint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v53 = v51;
          }
          if (v53)
          {
            unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v53);
            v49 = *(NSUInteger **)a3;
            v22 = (NSUInteger *)*((void *)a3 + 1);
          }
          else
          {
            uint64_t v54 = 0;
          }
          v55 = (NSUInteger *)(v53 + 16 * v50);
          unint64_t v56 = v53 + 16 * v54;
          NSUInteger *v55 = v17;
          v55[1] = v19;
          int v23 = v55 + 2;
          if (v22 != v49)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v22 - 1);
              v55 -= 2;
              v22 -= 2;
            }
            while (v22 != v49);
            v49 = *(NSUInteger **)a3;
          }
          *(void *)a3 = v55;
          *((void *)a3 + 1) = v23;
          *((void *)a3 + 2) = v56;
          if (v49) {
            operator delete(v49);
          }
        }
        else
        {
          NSUInteger *v22 = v17;
          v22[1] = v19;
          int v23 = v22 + 2;
        }
        *((void *)a3 + 1) = v23;
      }
    }
    else if ((self->_operator & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      if (-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once != -1) {
        dispatch_once(&-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::once, &__block_literal_global_207);
      }
      if (self->_operator == 7) {
        uint64_t v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate;
      }
      else {
        uint64_t v24 = &-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate;
      }
      id v25 = (id)*v24;
      v68[0] = @"HAYSTACK";
      v26 = objc_msgSend(v15, "substringWithRange:", v17, v19);
      v68[1] = @"NEEDLE";
      v69[0] = v26;
      v69[1] = v13;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];

      if ([v25 evaluateWithObject:0 substitutionVariables:v27])
      {
        v29 = (NSUInteger *)*((void *)a3 + 1);
        unint64_t v28 = *((void *)a3 + 2);
        if ((unint64_t)v29 >= v28)
        {
          v57 = *(NSUInteger **)a3;
          uint64_t v58 = ((uint64_t)v29 - *(void *)a3) >> 4;
          unint64_t v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) >> 60) {
            abort();
          }
          uint64_t v60 = v28 - (void)v57;
          if (v60 >> 3 > v59) {
            unint64_t v59 = v60 >> 3;
          }
          BOOL v44 = (unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0;
          unint64_t v61 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v61 = v59;
          }
          if (v61)
          {
            unint64_t v61 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v61);
            v57 = *(NSUInteger **)a3;
            v29 = (NSUInteger *)*((void *)a3 + 1);
          }
          else
          {
            uint64_t v62 = 0;
          }
          v63 = (NSUInteger *)(v61 + 16 * v58);
          unint64_t v64 = v61 + 16 * v62;
          NSUInteger *v63 = v17;
          v63[1] = v19;
          v30 = v63 + 2;
          if (v29 != v57)
          {
            do
            {
              *((_OWORD *)v63 - 1) = *((_OWORD *)v29 - 1);
              v63 -= 2;
              v29 -= 2;
            }
            while (v29 != v57);
            v57 = *(NSUInteger **)a3;
          }
          *(void *)a3 = v63;
          *((void *)a3 + 1) = v30;
          *((void *)a3 + 2) = v64;
          if (v57) {
            operator delete(v57);
          }
        }
        else
        {
          NSUInteger *v29 = v17;
          v29[1] = v19;
          v30 = v29 + 2;
        }
        *((void *)a3 + 1) = v30;
      }
    }
    else if (v19)
    {
      unint64_t v31 = a5 | 1;
      NSUInteger v32 = v17 + v19;
      v33 = (void *)*((void *)a3 + 1);
      do
      {
        if (a6 <= ((uint64_t)v33 - *(void *)a3) >> 4) {
          break;
        }
        uint64_t v34 = objc_msgSend(v15, "rangeOfString:options:range:", v13, v31, v17, v19);
        uint64_t v36 = v34;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v37 = v35;
        v39 = (uint64_t *)*((void *)a3 + 1);
        unint64_t v38 = *((void *)a3 + 2);
        if ((unint64_t)v39 >= v38)
        {
          v40 = *(uint64_t **)a3;
          uint64_t v41 = ((uint64_t)v39 - *(void *)a3) >> 4;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60) {
            abort();
          }
          uint64_t v43 = v38 - (void)v40;
          if (v43 >> 3 > v42) {
            unint64_t v42 = v43 >> 3;
          }
          BOOL v44 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0;
          unint64_t v45 = 0xFFFFFFFFFFFFFFFLL;
          if (!v44) {
            unint64_t v45 = v42;
          }
          if (v45)
          {
            unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v45);
            v40 = *(uint64_t **)a3;
            v39 = (uint64_t *)*((void *)a3 + 1);
          }
          else
          {
            uint64_t v46 = 0;
          }
          v47 = (uint64_t *)(v45 + 16 * v41);
          uint64_t *v47 = v36;
          v47[1] = v37;
          v48 = v47;
          if (v39 != v40)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v39 - 1);
              v48 -= 2;
              v39 -= 2;
            }
            while (v39 != v40);
            v40 = *(uint64_t **)a3;
          }
          v33 = v47 + 2;
          *(void *)a3 = v48;
          *((void *)a3 + 1) = v47 + 2;
          *((void *)a3 + 2) = v45 + 16 * v46;
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          uint64_t *v39 = v34;
          v39[1] = v35;
          v33 = v39 + 2;
        }
        *((void *)a3 + 1) = v33;
        NSUInteger v17 = v36 + v37;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        NSUInteger v19 = v32 - v17;
      }
      while (v32 != v17);
    }
  }

  return v66;
}

- (BOOL)evaluateNumerically:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  title = self->_title;
  if (title)
  {
    uint64_t v8 = +[_CSVisualizer rangeOfValueForTitle:title inDescription:v4];
  }
  else
  {
    uint64_t v7 = [v4 length];
    uint64_t v8 = 0;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = objc_msgSend(v5, "attributedSubstringFromRange:", v8, v7);
    uint64_t v11 = [v10 attribute:@"_CSVNum" atIndex:0 effectiveRange:0];
    if (!v11)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28FE8]);
      NSUInteger v17 = [v10 string];
      v14 = (void *)[v16 initWithString:v17];

      [v14 setCaseSensitive:0];
      uint64_t v23 = 0;
      long long v21 = 0uLL;
      int v22 = 0;
      if ([v14 scanString:@"0x" intoString:0]
        && [v14 scanHexLongLong:&v23])
      {
        uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v23];
      }
      else
      {
        if (([v14 scanDecimal:&v21] & 1) == 0)
        {
          BOOL v9 = 0;
          goto LABEL_8;
        }
        long long v19 = v21;
        int v20 = v22;
        uint64_t v18 = [MEMORY[0x1E4F28C28] decimalNumberWithDecimal:&v19];
      }
      uint64_t v11 = v18;

      if (!v11)
      {
        BOOL v9 = 0;
        goto LABEL_9;
      }
    }
    numericPredicate = self->_numericPredicate;
    uint64_t v24 = @"HAYSTACK";
    v25[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    BOOL v9 = [(NSPredicate *)numericPredicate evaluateWithObject:0 substitutionVariables:v13];

    v14 = (void *)v11;
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 forTitle:(id)a4 operator:(unint64_t)a5 error:(id *)a6
{
  v40[6] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_CSVisualizerPredicate;
  id v12 = [(_CSVisualizerPredicate *)&v34 init];
  if (!v12)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    v35[0] = *MEMORY[0x1E4F28228];
    v35[1] = @"Line";
    v36[0] = @"mFulErr";
    v36[1] = &unk_1EFE439C8;
    uint64_t v25 = *MEMORY[0x1E4F28588];
    v36[2] = @"Failed to allocate NSPredicate instance.";
    v35[2] = v25;
    v35[3] = @"Operator";
    v26 = [NSNumber numberWithUnsignedInteger:a5];
    v36[3] = v26;
    v36[4] = v10;
    v35[4] = @"SearchString";
    v35[5] = @"Title";
    v36[5] = v11;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];
    uint64_t v28 = [v24 errorWithDomain:*MEMORY[0x1E4F28760] code:-41 userInfo:v27];
LABEL_8:
    id v17 = (id)v28;

    if (a6)
    {
      id v17 = v17;
      id v12 = 0;
      *a6 = v17;
    }
    else
    {
      id v12 = 0;
    }
    goto LABEL_11;
  }
  uint64_t v13 = [v10 copy];
  searchString = v12->_searchString;
  v12->_searchString = (NSString *)v13;

  uint64_t v15 = [v11 copy];
  title = v12->_title;
  v12->_title = (NSString *)v15;

  id v17 = 0;
  v12->_unint64_t operator = a5;
  if (a5 - 4 >= 6 && a5 != 99)
  {
    if (v11)
    {
      if ([(id)objc_opt_class() operatorIsNumeric:a5])
      {
        uint64_t v18 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v10];
        id v19 = objc_alloc(MEMORY[0x1E4F28B98]);
        int v20 = [MEMORY[0x1E4F28C68] expressionForVariable:@"HAYSTACK"];
        long long v21 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v18];
        uint64_t v22 = [v19 initWithLeftExpression:v20 rightExpression:v21 modifier:0 type:a5 options:0];
        numericPredicate = v12->_numericPredicate;
        v12->_numericPredicate = (NSPredicate *)v22;

        id v17 = 0;
        goto LABEL_11;
      }

      NSUInteger v32 = (void *)MEMORY[0x1E4F28C58];
      v39[0] = *MEMORY[0x1E4F28228];
      v39[1] = @"Line";
      v40[0] = @"kCSStorePredicateErr";
      v40[1] = &unk_1EFE43998;
      uint64_t v33 = *MEMORY[0x1E4F28588];
      v40[2] = @"Unsupported operator type.";
      v39[2] = v33;
      v39[3] = @"Operator";
      v26 = [NSNumber numberWithUnsignedInteger:a5];
      v40[3] = v26;
      v40[4] = v10;
      v39[4] = @"SearchString";
      v39[5] = @"Title";
      v40[5] = v11;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:6];
      uint64_t v28 = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v27];
    }
    else
    {

      v30 = (void *)MEMORY[0x1E4F28C58];
      v37[0] = *MEMORY[0x1E4F28228];
      v37[1] = @"Line";
      v38[0] = @"kCSStorePredicateErr";
      v38[1] = &unk_1EFE439B0;
      uint64_t v31 = *MEMORY[0x1E4F28588];
      v38[2] = @"Unsupported operator type.";
      v37[2] = v31;
      v37[3] = @"Operator";
      v26 = [NSNumber numberWithUnsignedInteger:a5];
      v37[4] = @"SearchString";
      v38[3] = v26;
      v38[4] = v10;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:5];
      uint64_t v28 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v27];
    }
    goto LABEL_8;
  }
LABEL_11:

  return v12;
}

- (_CSVisualizerPredicate)initWithSearchString:(id)a3 operator:(unint64_t)a4 error:(id *)a5
{
  return [(_CSVisualizerPredicate *)self initWithSearchString:a3 forTitle:0 operator:a4 error:a5];
}

- (_CSVisualizerPredicate)initWithExpression:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() constantValueForExpression:v4];
  if (v5)
  {
    BOOL v6 = [(_CSVisualizerPredicate *)self initWithSearchString:v5 operator:99 error:0];
  }
  else
  {

    BOOL v6 = 0;
  }

  return v6;
}

+ (void)getRanges:(void *)a3 matchingPredicate:(id)a4 inDescription:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"CSPredicate.mm", 373, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  int v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"CSPredicate.mm", 374, @"Invalid parameter not satisfying: %@", @"description != nil" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    uint64_t v13 = v12;
    if (v12[4] != 5) {
      [v12 getRanges:a3 inDescription:v11 options:0 limit:-1 searchedInRange:0];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v9;
      if ([v14 compoundPredicateType])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v15 = [v14 subpredicates];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v22;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v15);
              }
              [a1 getRanges:a3 matchingPredicate:*(void *)(*((void *)&v21 + 1) + 8 * v18++) inDescription:v11];
            }
            while (v16 != v18);
            uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v16);
        }
      }
    }
  }
}

+ (id)predicateWithFormatString:(id)a3 error:(id *)a4
{
  v18[15] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1AD0DB160]();
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:v6 argumentArray:MEMORY[0x1E4F1CBF0]];
  if (v8)
  {
    v16[0] = 0;
    id v9 = [a1 translateNSPredicate:v8 error:v16];
    id v10 = v16[0];

    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [MEMORY[0x1E4F28C68] expressionWithFormat:v6 argumentArray:MEMORY[0x1E4F1CBF0]];
  if (v11)
  {
    id v9 = (void *)[objc_alloc((Class)a1) initWithExpression:v11];
    if (!v9)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      v17[0] = *MEMORY[0x1E4F28228];
      v17[1] = @"Line";
      v18[0] = @"kCSStorePredicateErr";
      v18[1] = &unk_1EFE43968;
      v17[2] = *MEMORY[0x1E4F28588];
      v17[3] = @"Expression";
      v18[2] = @"Could not translate generated expression to a form usable by CoreServicesStore.";
      v18[3] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
      uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v13];

      id v9 = 0;
      id v10 = (id)v14;
    }
  }
  else
  {
    id v9 = 0;
  }

LABEL_10:
  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

+ (id)translateNSPredicate:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  unint64_t v38 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v37 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  if (([v39 isEqual:v38] & 1) != 0 || objc_msgSend(v39, "isEqual:", v37)) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v39;
    id v11 = [v35 subpredicates];
    if ([v11 count] == 1)
    {
      uint64_t v12 = [v35 compoundPredicateType];

      if (v12)
      {
        uint64_t v13 = [v35 subpredicates];
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        id v47 = 0;
        id v5 = [a1 translateNSPredicate:v14 error:&v47];
        id v6 = v47;
LABEL_33:

        uint64_t v14 = v13;
        goto LABEL_34;
      }
    }
    else
    {
    }
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v13 = [v35 subpredicates];
    id v6 = 0;
    uint64_t v24 = [v13 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v44;
      while (2)
      {
        uint64_t v26 = 0;
        v27 = v6;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v13);
          }
          id v28 = *(id *)(*((void *)&v43 + 1) + 8 * v26);
          id v42 = v27;
          v29 = [a1 translateNSPredicate:v28 error:&v42];
          id v6 = v42;

          if (!v29)
          {
            id v5 = 0;
            goto LABEL_33;
          }
          [v14 addObject:v29];

          ++v26;
          v27 = v6;
        }
        while (v24 != v26);
        uint64_t v24 = [v13 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    if (!v14)
    {
      id v5 = 0;
      goto LABEL_35;
    }
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(v35, "compoundPredicateType"), v14);
LABEL_34:

LABEL_35:
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v39;
    uint64_t v16 = [v15 leftExpression];
    uint64_t v17 = [a1 constantValueForExpression:v16];

    uint64_t v18 = [v15 predicateOperatorType];
    id v19 = [v15 rightExpression];
    int v20 = [a1 constantValueForExpression:v19];

    if (v17)
    {
      if (v20)
      {
        if (![v15 comparisonPredicateModifier])
        {
          id v22 = v17;
          id v32 = v20;
          if ([v22 isEqualToString:@"*"])
          {
            uint64_t v41 = 0;
            uint64_t v33 = (id *)&v41;
            objc_super v34 = [[_CSVisualizerPredicate alloc] initWithSearchString:v32 operator:v18 error:&v41];
          }
          else
          {
            uint64_t v40 = 0;
            uint64_t v33 = (id *)&v40;
            objc_super v34 = [[_CSVisualizerPredicate alloc] initWithSearchString:v32 forTitle:v22 operator:v18 error:&v40];
          }
          id v5 = v34;
          id v6 = *v33;

          goto LABEL_39;
        }
        long long v21 = (void *)MEMORY[0x1E4F28C58];
        v50[0] = *MEMORY[0x1E4F28228];
        v50[1] = @"Line";
        v51[0] = @"kCSStorePredicateErr";
        v51[1] = &unk_1EFE43920;
        v50[2] = *MEMORY[0x1E4F28588];
        v50[3] = @"Predicate";
        v51[2] = @"Aggregate operations (ANY, ALL, etc.) are not supported.";
        v51[3] = v15;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:4];
        uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v22];
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
        v52[0] = *MEMORY[0x1E4F28228];
        v52[1] = @"Line";
        v53[0] = @"kCSStorePredicateErr";
        v53[1] = &unk_1EFE43908;
        v52[2] = *MEMORY[0x1E4F28588];
        v52[3] = @"Predicate";
        v53[2] = @"Unsupported expression type (right-hand side).";
        v53[3] = v15;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
        uint64_t v23 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v22];
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      v54[0] = *MEMORY[0x1E4F28228];
      v54[1] = @"Line";
      v55[0] = @"kCSStorePredicateErr";
      v55[1] = &unk_1EFE438F0;
      v54[2] = *MEMORY[0x1E4F28588];
      v54[3] = @"Predicate";
      v55[2] = @"Unsupported expression type (left-hand side).";
      v55[3] = v15;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:4];
      uint64_t v23 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v22];
    }
    id v6 = (id)v23;
    id v5 = 0;
LABEL_39:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = 0;
    id v5 = 0;
    goto LABEL_4;
  }
LABEL_3:
  id v5 = v39;
  id v6 = 0;
LABEL_4:
  if (a4 && !v5)
  {
    if (!v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      v48[0] = *MEMORY[0x1E4F28228];
      v48[1] = @"Line";
      v49[0] = @"kCSStorePredicateErr";
      v49[1] = &unk_1EFE43938;
      v48[2] = *MEMORY[0x1E4F28588];
      v48[3] = @"Predicate";
      v49[2] = @"Could not translate generated predicate to a form usable by CoreServicesStore.";
      v49[3] = v39;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];
      id v6 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v8];
    }
    id v6 = v6;
    *a4 = v6;
  }
  id v9 = v5;

  return v9;
}

+ (BOOL)operatorIsNumeric:(unint64_t)a3
{
  return a3 < 6 || a3 == 100;
}

+ (id)constantValueForExpression:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if ([v3 expressionType])
  {
    if ([v4 expressionType] == 3)
    {
      uint64_t v5 = [v4 keyPath];
      goto LABEL_7;
    }
LABEL_5:
    id v6 = 0;
LABEL_12:
    id v11 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [v4 constantValue];
LABEL_7:
  id v6 = (void *)v5;
  if (!v5) {
    goto LABEL_12;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v6))
  {
    int v8 = [v6 BOOLValue];
    id v9 = @"false";
    if (v8) {
      id v9 = @"true";
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [v6 description];
  }
  id v11 = v10;
LABEL_15:

  return v11;
}

@end