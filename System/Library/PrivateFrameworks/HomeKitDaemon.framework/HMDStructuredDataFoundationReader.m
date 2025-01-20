@interface HMDStructuredDataFoundationReader
+ (uint64_t)tokenForValue:(uint64_t)a1;
- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3;
- (void)_push;
- (void)failWithError:(id)a3;
- (void)initWithInput:(void *)a1;
@end

@implementation HMDStructuredDataFoundationReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  if (a3 && a3->type == 5)
  {
    v4 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:a3->value];
    char v5 = 1;
    if (!v4) {
      goto LABEL_4;
    }
  }
  else
  {
    v4 = [(NSEnumerator *)self->_enumerator nextObject];
    char v5 = 0;
    if (!v4)
    {
LABEL_4:
      if ([(NSMutableArray *)self->_stack count])
      {
        dictionary = self->_dictionary;
        v7 = [(NSMutableArray *)self->_stack lastObject];
        enumerator = self->_enumerator;
        self->_enumerator = v7;

        [(NSMutableArray *)self->_stack removeLastObject];
        id v9 = [(NSMutableArray *)self->_stack lastObject];
        v10 = v9;
        if ((id)*MEMORY[0x263EFFD08] == v9) {
          v11 = 0;
        }
        else {
          v11 = v9;
        }
        v12 = v11;

        v13 = self->_dictionary;
        self->_dictionary = v12;

        [(NSMutableArray *)self->_stack removeLastObject];
        id v14 = 0;
        if (dictionary) {
          uint64_t v15 = 4;
        }
        else {
          uint64_t v15 = 2;
        }
      }
      else
      {
        v31 = self->_enumerator;
        self->_enumerator = 0;

        stack = self->_stack;
        self->_stack = 0;

        id v14 = 0;
        uint64_t v15 = -1;
      }
      goto LABEL_23;
    }
  }
  if (!self->_dictionary) {
    char v5 = 1;
  }
  if (v5)
  {
    uint64_t v16 = +[HMDStructuredDataFoundationReader tokenForValue:]((uint64_t)HMDStructuredDataFoundationReader, v4);
    id v14 = v17;
    if (v16 == 3)
    {
      -[HMDStructuredDataFoundationReader _push]((uint64_t)self);
      objc_storeStrong((id *)&self->_dictionary, v4);
      v33 = [(NSDictionary *)self->_dictionary keyEnumerator];
      v34 = self->_enumerator;
      self->_enumerator = v33;

      uint64_t v15 = 3;
    }
    else
    {
      uint64_t v15 = v16;
      if (v16 == 1)
      {
        -[HMDStructuredDataFoundationReader _push]((uint64_t)self);
        v18 = [v4 objectEnumerator];
        v19 = self->_enumerator;
        self->_enumerator = v18;

        uint64_t v15 = 1;
      }
    }
  }
  else
  {
    CFTypeID v20 = CFGetTypeID(v4);
    if (v20 == CFStringGetTypeID())
    {
      id v14 = v4;
      uint64_t v15 = 5;
    }
    else
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      uint64_t v15 = HMDStructuredDataErrorWithReason(@"Invalid (non-string) key type in structured data: %@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v22);
      id v14 = v30;
    }
  }
LABEL_23:

  int64_t v35 = v15;
  v36 = v14;
  result.value = v36;
  result.type = v35;
  return result;
}

+ (uint64_t)tokenForValue:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (tokenForValue__once != -1) {
    dispatch_once(&tokenForValue__once, &__block_literal_global_69980);
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 == tokenForValue__arrayTypeID)
  {
    uint64_t v4 = [v2 count];
    if (v4 == -1)
    {
      uint64_t v6 = 1;
      goto LABEL_27;
    }
    id v5 = [NSNumber numberWithUnsignedInteger:v4];
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  if (v3 == tokenForValue__dictionaryTypeID)
  {
    uint64_t v7 = [v2 count];
    if (v7 == -1)
    {
      uint64_t v6 = 3;
      goto LABEL_27;
    }
    id v5 = [NSNumber numberWithUnsignedInteger:v7];
    uint64_t v6 = 3;
LABEL_9:

    goto LABEL_27;
  }
  if (v3 == tokenForValue__nullTypeID)
  {
    uint64_t v6 = 6;
  }
  else if (v3 == tokenForValue__BOOLeanTypeID)
  {
    uint64_t v8 = [v2 BOOLValue];
    [NSNumber numberWithBool:v8];
    objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 7;
  }
  else if (v3 == tokenForValue__stringTypeID)
  {
    v2;
    uint64_t v6 = 8;
  }
  else if (v3 == tokenForValue__numberTypeID)
  {
    v2;
    uint64_t v6 = 9;
  }
  else if (v3 == tokenForValue__dataTypeID)
  {
    v2;
    uint64_t v6 = 10;
  }
  else if (v3 == tokenForValue__dateTypeID)
  {
    v2;
    uint64_t v6 = 11;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2;
      uint64_t v6 = 12;
    }
    else
    {
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      uint64_t v6 = HMDStructuredDataErrorWithReason(@"Invalid type in structured data: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    }
  }
LABEL_27:

  return v6;
}

- (void)_push
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 40);
    CFTypeID v3 = *(void **)(a1 + 32);
    if (!v3) {
      CFTypeID v3 = (void *)*MEMORY[0x263EFFD08];
    }
    id v4 = v3;
    [v2 addObject:v4];

    id v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 24)];
    uint64_t v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

CFTypeID __51__HMDStructuredDataFoundationReader_tokenForValue___block_invoke()
{
  tokenForValue__arrayTypeID = CFArrayGetTypeID();
  tokenForValue__dictionaryTypeID = CFDictionaryGetTypeID();
  tokenForValue__nullTypeID = CFNullGetTypeID();
  tokenForValue__BOOLeanTypeID = CFBooleanGetTypeID();
  tokenForValue__stringTypeID = CFStringGetTypeID();
  tokenForValue__numberTypeID = CFNumberGetTypeID();
  tokenForValue__dataTypeID = CFDataGetTypeID();
  CFTypeID result = CFDateGetTypeID();
  tokenForValue__dateTypeID = result;
  return result;
}

- (void)failWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDStructuredDataFoundationReader;
  [(HMDTokenBasedStructuredReader *)&v7 failWithError:a3];
  enumerator = self->_enumerator;
  self->_enumerator = 0;

  dictionary = self->_dictionary;
  self->_dictionary = 0;

  stack = self->_stack;
  self->_stack = 0;
}

- (void)initWithInput:(void *)a1
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)HMDStructuredDataFoundationReader;
    a1 = objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v11[0] = v3;
      id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      uint64_t v5 = [v4 objectEnumerator];
      uint64_t v6 = (void *)a1[3];
      a1[3] = v5;

      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v8 = (void *)a1[5];
      a1[5] = v7;
    }
  }

  return a1;
}

@end