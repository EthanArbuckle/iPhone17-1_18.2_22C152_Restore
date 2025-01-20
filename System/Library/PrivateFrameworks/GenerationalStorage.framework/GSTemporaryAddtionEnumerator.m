@interface GSTemporaryAddtionEnumerator
- (GSTemporaryAddtionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7;
- (NSError)error;
- (id)_nextURL;
- (id)nextObject;
@end

@implementation GSTemporaryAddtionEnumerator

- (GSTemporaryAddtionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  v36.receiver = self;
  v36.super_class = (Class)GSTemporaryAddtionEnumerator;
  v16 = [(GSTemporaryAddtionEnumerator *)&v36 init];
  v17 = v16;
  if (v16)
  {
    v16->_withOptions = a5;
    v16->_withoutOption = a6;
    uint64_t v18 = [v14 copy];
    nameSpace = v17->_nameSpace;
    v17->_nameSpace = (NSString *)v18;

    objc_storeStrong((id *)&v17->_storage, a3);
    id v35 = 0;
    v20 = [v13 _URLForNameSpace:v14 createIfNeeded:0 allowMissing:1 error:&v35];
    id v21 = v35;
    id v22 = v35;
    if (v20)
    {
      objc_initWeak(&location, v17);
      v37[0] = *MEMORY[0x1E4F1C530];
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke;
      v32[3] = &unk_1E6C9F4F0;
      objc_copyWeak(&v33, &location);
      v24 = [v15 enumeratorAtURL:v20 includingPropertiesForKeys:v23 options:1 errorHandler:v32];

      if (a7)
      {
        enumerator = [v24 allObjects];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke_2;
        v30[3] = &__block_descriptor_36_e25_q24__0__NSURL_8__NSURL_16l;
        int v31 = a7;
        uint64_t v26 = [enumerator sortedArrayUsingComparator:v30];
        array = v17->_array;
        v17->_array = (NSArray *)v26;
      }
      else
      {
        v28 = v24;
        enumerator = v17->_enumerator;
        v17->_enumerator = v28;
      }

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_storeStrong((id *)&v17->_error, v21);
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    id v22 = 0;
  }

  return v17;
}

uint64_t __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 5, a3);
  }

  return 0;
}

uint64_t __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C530];
  id v6 = a3;
  [a2 getResourceValue:&v13 forKey:v5 error:0];
  id v7 = v13;
  v12 = 0;
  [v6 getResourceValue:&v12 forKey:v5 error:0];

  id v8 = v12;
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    v9 = v7;
  }
  else
  {
    v9 = v12;
    id v8 = v7;
  }
  uint64_t v10 = [v9 compare:v8];

  return v10;
}

- (id)_nextURL
{
  enumerator = self->_enumerator;
  if (enumerator)
  {
    v4 = [(NSDirectoryEnumerator *)enumerator nextObject];
  }
  else
  {
    unint64_t pos = self->_pos;
    if (pos >= [(NSArray *)self->_array count])
    {
      v4 = 0;
    }
    else
    {
      array = self->_array;
      ++self->_pos;
      v4 = -[NSArray objectAtIndex:](array, "objectAtIndex:");
    }
  }
  return v4;
}

- (id)nextObject
{
  uint64_t v3 = [(GSTemporaryAddtionEnumerator *)self _nextURL];
  if (!v3)
  {
LABEL_11:
    id v6 = 0;
    goto LABEL_13;
  }
  v4 = (void *)v3;
  while (1)
  {
    uint64_t v5 = [v4 lastPathComponent];
    if (([v5 hasPrefix:@"."] & 1) == 0) {
      break;
    }
    id v6 = 0;
LABEL_10:

    uint64_t v8 = [(GSTemporaryAddtionEnumerator *)self _nextURL];

    v4 = (void *)v8;
    if (!v8) {
      goto LABEL_11;
    }
  }
  id v7 = [(GSTemporaryStorage *)self->_storage additionWithName:v5 inNameSpace:self->_nameSpace error:0];
  id v6 = v7;
  if (!v7
    || self->_withOptions && (self->_withOptions & ~[v7 options]) != 0
    || self->_withoutOption && (self->_withoutOption & [v6 options]) != 0)
  {
    goto LABEL_10;
  }

LABEL_13:
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end