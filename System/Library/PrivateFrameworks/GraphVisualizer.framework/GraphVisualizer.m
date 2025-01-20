uint64_t _traverse_postorder(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  unsigned char v42[128];
  unsigned char v43[128];
  unsigned char v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v13 = (void *)result;
    result = [a7 containsObject:result];
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v13, a2, a3);
      if ((result & 1) == 0)
      {
        v29 = a2;
        if (a4 == 2)
        {
          v19 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "inNodes"));
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "outNodes"));
          [v19 minusSet:a7];
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v20 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v20)
          {
            v21 = v20;
            v22 = *(void *)v31;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(void *)v31 != v22) {
                  objc_enumerationMutation(v19);
                }
                _traverse_postorder(*(void *)(*((void *)&v30 + 1) + 8 * i), v13, a3 + 1, 2, a5, a6, a7);
              }
              v21 = [v19 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v21);
          }
        }
        else if (a4 == 1)
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v24 = (void *)[v13 inNodes];
          v25 = [v24 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v25)
          {
            v26 = v25;
            v27 = *(void *)v35;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(void *)v35 != v27) {
                  objc_enumerationMutation(v24);
                }
                _traverse_postorder(*(void *)(*((void *)&v34 + 1) + 8 * j), v13, a3 + 1, 1, a5, a6, a7);
              }
              v26 = [v24 countByEnumeratingWithState:&v34 objects:v43 count:16];
            }
            while (v26);
          }
        }
        else
        {
          if (a4) {
            _traverse_postorder_cold_1();
          }
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v14 = (void *)[v13 outNodes];
          v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v15)
          {
            v16 = v15;
            v17 = *(void *)v39;
            do
            {
              for (k = 0; k != v16; ++k)
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v14);
                }
                _traverse_postorder(*(void *)(*((void *)&v38 + 1) + 8 * k), v13, a3 + 1, 0, a5, a6, a7);
              }
              v16 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
            }
            while (v16);
          }
        }
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(a6 + 16))(a6, v13, v29, a3);
        return [a7 addObject:v13];
      }
    }
  }
  return result;
}

uint64_t _traverse_postorder_randomized(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v13 = (void *)result;
    result = [a7 containsObject:result];
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v13, a2, a3);
      if ((result & 1) == 0)
      {
        uint64_t v30 = a2;
        if (a4 == 2)
        {
          v19 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "inNodes"));
          objc_msgSend(v19, "unionOrderedSet:", objc_msgSend(v13, "outNodes"));
          [v19 minusSet:a7];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          v20 = fisherYates(v19);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v32 != v23) {
                  objc_enumerationMutation(v20);
                }
                _traverse_postorder(*(void *)(*((void *)&v31 + 1) + 8 * i), (uint64_t)v13, a3 + 1, 2, a5, a6, a7);
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v43 count:16];
            }
            while (v22);
          }
        }
        else if (a4 == 1)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v25 = fisherYates((void *)[v13 inNodes]);
          uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v36 != v28) {
                  objc_enumerationMutation(v25);
                }
                _traverse_postorder_randomized(*(void *)(*((void *)&v35 + 1) + 8 * j), v13, a3 + 1, 1, a5, a6, a7);
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v27);
          }
        }
        else
        {
          if (a4) {
            _traverse_postorder_randomized_cold_1();
          }
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v14 = fisherYates((void *)[v13 outNodes]);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v16; ++k)
              {
                if (*(void *)v40 != v17) {
                  objc_enumerationMutation(v14);
                }
                _traverse_postorder_randomized(*(void *)(*((void *)&v39 + 1) + 8 * k), v13, a3 + 1, 0, a5, a6, a7);
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
            }
            while (v16);
          }
        }
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(a6 + 16))(a6, v13, v30, a3);
        return [a7 addObject:v13];
      }
    }
  }
  return result;
}

uint64_t _traverse_preorder(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v11 = (void *)result;
    result = [a6 containsObject:result];
    if ((result & 1) == 0)
    {
      result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 16))(a5, v11, a2, a3);
      if ((result & 1) == 0)
      {
        [a6 addObject:v11];
        if (a4 == 2)
        {
          uint64_t v17 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
          objc_msgSend(v17, "unionOrderedSet:", objc_msgSend(v11, "inNodes"));
          objc_msgSend(v17, "unionOrderedSet:", objc_msgSend(v11, "outNodes"));
          [v17 minusSet:a6];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          result = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (result)
          {
            uint64_t v18 = result;
            uint64_t v19 = *(void *)v28;
            uint64_t v20 = a3 + 1;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v28 != v19) {
                  objc_enumerationMutation(v17);
                }
                _traverse_preorder(*(void *)(*((void *)&v27 + 1) + 8 * v21++), v11, v20, 2, a5, a6);
              }
              while (v18 != v21);
              result = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
              uint64_t v18 = result;
            }
            while (result);
          }
        }
        else if (a4 == 1)
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v22 = (void *)[v11 inNodes];
          result = [v22 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (result)
          {
            uint64_t v23 = result;
            uint64_t v24 = *(void *)v32;
            uint64_t v25 = a3 + 1;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v32 != v24) {
                  objc_enumerationMutation(v22);
                }
                _traverse_preorder(*(void *)(*((void *)&v31 + 1) + 8 * v26++), v11, v25, 1, a5, a6);
              }
              while (v23 != v26);
              result = [v22 countByEnumeratingWithState:&v31 objects:v40 count:16];
              uint64_t v23 = result;
            }
            while (result);
          }
        }
        else
        {
          if (a4) {
            _traverse_preorder_cold_1();
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v12 = (void *)[v11 outNodes];
          result = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
          if (result)
          {
            uint64_t v13 = result;
            uint64_t v14 = *(void *)v36;
            uint64_t v15 = a3 + 1;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v36 != v14) {
                  objc_enumerationMutation(v12);
                }
                _traverse_preorder(*(void *)(*((void *)&v35 + 1) + 8 * v16++), v11, v15, 0, a5, a6);
              }
              while (v13 != v16);
              result = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
              uint64_t v13 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

void *fisherYates(void *a1)
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "array"), "mutableCopy");
  uint64_t v3 = [a1 count];
  uint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    do
    {
      [v2 exchangeObjectAtIndex:arc4random() % (unint64_t)(v4 + 1) withObjectAtIndex:v4];
      --v4;
    }
    while (v4);
  }
  return v2;
}

void sub_1DD6CA7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return [a2 inPriority];
}

uint64_t _block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 outPriority];
}

unint64_t medianX(void *a1)
{
  unint64_t result = [a1 count];
  if (result)
  {
    unint64_t v3 = result >> 1;
    if (result)
    {
      uint64_t v4 = (void *)[a1 objectAtIndexedSubscript:v3];
      return [v4 cx];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3 - 1), "cx");
      return objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3), "cx");
    }
  }
  return result;
}

uint64_t _block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 inPriority];
}

uint64_t _block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 outPriority];
}

unint64_t medianY(void *a1)
{
  unint64_t result = [a1 count];
  if (result)
  {
    unint64_t v3 = result >> 1;
    if (result)
    {
      uint64_t v4 = (void *)[a1 objectAtIndexedSubscript:v3];
      return [v4 y];
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3 - 1), "y");
      return objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", v3), "y");
    }
  }
  return result;
}

void sub_1DD6CDC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sortByIndex_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 index];
  if (v5 < [a3 index]) {
    return -1;
  }
  uint64_t v7 = [a2 index];
  return v7 > [a3 index];
}

uint64_t __sortByInPriority_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 inPriority];
  if (v5 < [a3 inPriority]) {
    return -1;
  }
  unint64_t v7 = [a2 inPriority];
  return v7 > [a3 inPriority];
}

uint64_t __sortByOutPriority_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 outPriority];
  if (v5 < [a3 outPriority]) {
    return -1;
  }
  unint64_t v7 = [a2 outPriority];
  return v7 > [a3 outPriority];
}

uint64_t __sortByDegree_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  int v5 = [a2 inDegree];
  int v6 = v5 - 2 * [v4 outDegree];
  LODWORD(v4) = [a3 inDegree];
  int v7 = v4 - 2 * [a3 outDegree];
  BOOL v8 = v6 < v7;
  BOOL v9 = v6 > v7;
  if (v8) {
    return -1;
  }
  else {
    return v9;
  }
}

void _traverse_postorder_cold_1()
{
}

void _traverse_postorder_randomized_cold_1()
{
}

void _traverse_preorder_cold_1()
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}