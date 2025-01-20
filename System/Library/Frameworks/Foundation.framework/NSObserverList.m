@interface NSObserverList
@end

@implementation NSObserverList

size_t __59___NSObserverList__copyObserversOfObject_creatingIfAbsent___block_invoke()
{
  qword_1EB1EDED0 = objc_opt_class();
  size_t result = class_getInstanceSize((Class)qword_1EB1EDED0);
  qword_1EB1EDEC8 = result;
  return result;
}

size_t __48___NSObserverList_destroyObserverListForObject___block_invoke(uint64_t a1)
{
  size_t result = class_getInstanceSize(*(Class *)(a1 + 32));
  qword_1EB1EDEE0 = result;
  return result;
}

uint64_t __34___NSObserverList_finishObserving__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _receiveBox:a2];
}

void __31___NSObserverList__receiveBox___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3 < 2)
  {
    if (!a3) {
      return;
    }
    int v17 = 0;
  }
  else if ([*(id *)(a1 + 32) _isToManyChangeInformation])
  {
    int v17 = 1;
  }
  else
  {
    int v17 = [*(id *)(*(void *)(a1 + 32) + 8) conformsToProtocol:&unk_1ECABC9F8];
  }
  uint64_t v6 = 0;
  do
  {
    if (*(void *)(a2 + 8 * v6))
    {
      v7 = *(void **)(*(void *)(a1 + 32) + 8);
      if (v17) {
        id v8 = (id)[v7 copyWithZone:0];
      }
      else {
        id v8 = v7;
      }
      v9 = v8;
      int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v19 = __31___NSObserverList__receiveBox___block_invoke_2;
      v20 = &__block_descriptor_48_e25_v16__0__NSObservedValue_8l;
      uint64_t v21 = a2;
      uint64_t v22 = v6;
      v23[0] = 0;
      uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v23);
      MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
      v15 = objc_constructInstance(v14, (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      v15[6] = v10;
      *((void *)v15 + 1) = v9;
      *((void *)v15 + 2) = v11;
      v19((uint64_t)v18, (uint64_t)v15);
    }
    ++v6;
  }
  while (a3 != v6);
}

uint64_t __31___NSObserverList__receiveBox___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8 * *(void *)(a1 + 40)) _receiveBox:a2];
}

uint64_t __30___NSObserverList_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [NSString alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [a2 count];
  uint64_t result = -[NSString initWithFormat:](v6, "initWithFormat:", @"%@(%p) of %lu observers of %@: %@", v7, v8, v9, *(void *)(*(void *)(a1 + 32) + 8), [MEMORY[0x1E4F1C978] arrayWithObjects:a2 count:a3]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end