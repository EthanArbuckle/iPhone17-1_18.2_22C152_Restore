@interface MLMultiArrayView
+ (BOOL)isSqueezableShape:(id)a3;
+ (BOOL)isSqueezableShape:(id)a3 dimensions:(id)a4;
+ (void)squeezeShape:(id)a3 strides:(id)a4 resultingShape:(id *)a5 resultingStrides:(id *)a6;
- (MLMultiArray)parent;
- (id)initExpandingDimensionsOfMultiArray:(id)a3 axis:(int64_t)a4;
- (id)initSlicingMultiArray:(id)a3 origin:(id)a4 shape:(id)a5 squeeze:(BOOL)a6 error:(id *)a7;
- (id)initSqueezingMultiArray:(id)a3 dimensions:(id)a4 error:(id *)p_isa;
@end

@implementation MLMultiArrayView

- (void).cxx_destruct
{
}

- (MLMultiArray)parent
{
  return self->_parent;
}

- (id)initExpandingDimensionsOfMultiArray:(id)a3 axis:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v6 addObject:&unk_1EF11A028];
  v8 = [v5 shape];
  [v6 addObjectsFromArray:v8];

  [v6 addObject:&unk_1EF11A028];
  [v7 addObject:&unk_1EF11A028];
  v9 = [v5 strides];
  [v7 addObjectsFromArray:v9];

  [v7 addObject:&unk_1EF11A028];
  id v10 = [v5 strides];
  v11 = [v10 firstObject];
  uint64_t v12 = [v11 integerValue];
  v13 = [v10 lastObject];
  uint64_t v14 = [v13 integerValue];

  v15 = NSNumber;
  if (v12 >= v14)
  {
    v16 = [v6 objectAtIndexedSubscript:1];
    uint64_t v20 = [v16 unsignedIntegerValue];
    v18 = [v7 objectAtIndexedSubscript:1];
    v19 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") * v20);
    [v7 setObject:v19 atIndexedSubscript:0];
  }
  else
  {
    v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    uint64_t v17 = [v16 unsignedIntegerValue];
    v18 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
    v19 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") * v17);
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v19, objc_msgSend(v7, "count") - 1);
  }

  v21 = [v5 shape];
  uint64_t v22 = [v21 count] + 1;

  int64_t v23 = (a4 % v22 + v22) % v22;
  v24 = [v7 objectAtIndexedSubscript:v23];
  unint64_t v25 = [v24 unsignedIntegerValue];
  int64_t v26 = v23 + 1;
  v27 = [v7 objectAtIndexedSubscript:v26];
  unint64_t v28 = [v27 unsignedIntegerValue];

  [v6 insertObject:&unk_1EF11A028 atIndex:v26];
  if (v25 <= v28) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v25;
  }
  v30 = [NSNumber numberWithUnsignedInteger:v29];
  [v7 insertObject:v30 atIndex:v26];

  id v31 = v5;
  uint64_t v32 = [v31 mutableBytes];
  v33 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
  uint64_t v34 = [v31 dataType];
  v35 = objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 2);
  v39.receiver = self;
  v39.super_class = (Class)MLMultiArrayView;
  v36 = [(MLMultiArray *)&v39 initWithDataPointer:v32 shape:v33 dataType:v34 strides:v35 deallocator:0 error:0];

  if (v36) {
    objc_storeStrong((id *)&v36->_parent, v31);
  }

  return v36;
}

- (id)initSqueezingMultiArray:(id)a3 dimensions:(id)a4 error:(id *)p_isa
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_class();
  v11 = [v8 shape];
  int v12 = [v10 isSqueezableShape:v11];

  if (!v12)
  {
    uint64_t v25 = [v8 shape];
    id v24 = [v8 strides];
    id v22 = (id)v25;
LABEL_15:
    id v28 = v8;
    v38.receiver = self;
    v38.super_class = (Class)MLMultiArrayView;
    unint64_t v29 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](&v38, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, [v28 mutableBytes], v22, objc_msgSend(v28, "dataType"), v24, 0, p_isa);
    v30 = v29;
    if (v29) {
      objc_storeStrong((id *)&v29->_parent, v28);
    }
    self = v30;
    p_isa = (id *)&self->super.super.isa;
    goto LABEL_18;
  }
  if (!v9)
  {
    int64_t v26 = objc_opt_class();
    v16 = [v8 shape];
    v27 = [v8 strides];
    id v39 = 0;
    id v40 = 0;
    [v26 squeezeShape:v16 strides:v27 resultingShape:&v40 resultingStrides:&v39];
    id v22 = v40;
    id v24 = v39;

LABEL_14:
    goto LABEL_15;
  }
  v13 = objc_opt_class();
  uint64_t v14 = [v8 shape];
  char v15 = [v13 isSqueezableShape:v14 dimensions:v9];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F28E60] indexSet];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v42;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(v16, "addIndex:", objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v20++), "unsignedIntegerValue"));
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v18);
    }

    v21 = [v8 shape];
    id v22 = (id)[v21 mutableCopy];

    int64_t v23 = [v8 strides];
    id v24 = (id)[v23 mutableCopy];

    [v22 removeObjectsAtIndexes:v16];
    [v24 removeObjectsAtIndexes:v16];
    goto LABEL_14;
  }
  uint64_t v32 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v37 = [v8 shape];
    *(_DWORD *)buf = 138412546;
    v49 = v37;
    __int16 v50 = 2112;
    id v51 = v9;
    _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Shape %@ is not squeezable at dimensions %@", buf, 0x16u);
  }
  if (p_isa)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    uint64_t v34 = NSString;
    uint64_t v35 = [v8 shape];
    id v24 = [v34 stringWithFormat:@"Shape %@ is not squeezable at dimensions %@", v35, v9];
    id v47 = v24;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    *p_isa = [v33 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v36];

    p_isa = 0;
    id v22 = (id)v35;
LABEL_18:
  }
  return p_isa;
}

- (id)initSlicingMultiArray:(id)a3 origin:(id)a4 shape:(id)a5 squeeze:(BOOL)a6 error:(id *)a7
{
  BOOL v42 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v45 = v9;
  int v12 = [v9 shape];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [v10 count];

  if (v13 != v14)
  {
    unint64_t v29 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v10;
      __int16 v57 = 2112;
      id v58 = v45;
      _os_log_error_impl(&dword_19E58B000, v29, OS_LOG_TYPE_ERROR, "Invalid origin %@ for slicing %@", buf, 0x16u);
    }

    if (a7)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      id v26 = [NSString stringWithFormat:@"Invalid origin %@ for slicing %@", v10, v45];
      id v54 = v26;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v28 = [v30 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v27];
      goto LABEL_18;
    }
LABEL_20:
    v33 = 0;
    goto LABEL_21;
  }
  uint64_t v15 = [v11 count];
  if (v15 == [v10 count])
  {
    unint64_t v16 = 0;
    do
    {
      if (v16 >= [v11 count])
      {
        if (v42 && [(id)objc_opt_class() isSqueezableShape:v11])
        {
          uint64_t v35 = objc_opt_class();
          v36 = [v45 strides];
          id v47 = 0;
          id v48 = 0;
          [v35 squeezeShape:v11 strides:v36 resultingShape:&v48 resultingStrides:&v47];
          id v26 = v48;
          id v27 = v47;
        }
        else
        {
          id v26 = v11;
          id v27 = [v45 strides];
        }
        uint64_t v37 = [v45 offsetForKeyedSubscript:v10];
        uint64_t v38 = [v45 numberOfBytesPerElement];
        id v39 = v45;
        v46.receiver = self;
        v46.super_class = (Class)MLMultiArrayView;
        id v40 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](&v46, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, [v39 mutableBytes] + v38 * v37, v26, objc_msgSend(v39, "dataType"), v27, 0, a7);
        long long v41 = v40;
        if (v40) {
          objc_storeStrong((id *)&v40->_parent, v39);
        }
        v33 = v41;
        self = v33;
        goto LABEL_19;
      }
      id v17 = [v10 objectAtIndexedSubscript:v16];
      int v18 = [v17 unsignedIntValue];
      uint64_t v19 = [v11 objectAtIndexedSubscript:v16];
      int v20 = [v19 unsignedIntValue];
      v21 = [v45 shape];
      id v22 = [v21 objectAtIndexedSubscript:v16];
      unsigned int v23 = [v22 unsignedIntValue];

      ++v16;
    }
    while (v20 + v18 <= v23);
    id v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v10;
      __int16 v57 = 2112;
      id v58 = v11;
      _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Slice at %@ with shape %@ is out of bounds", buf, 0x16u);
    }

    if (a7)
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      id v26 = [NSString stringWithFormat:@"Slice at %@ with shape %@ is out of bounds", v10, v11];
      id v50 = v26;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v28 = [v25 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v27];
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  id v31 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v56 = v11;
    __int16 v57 = 2112;
    id v58 = v45;
    _os_log_error_impl(&dword_19E58B000, v31, OS_LOG_TYPE_ERROR, "Invalid shape %@ for slicing %@", buf, 0x16u);
  }

  if (!a7) {
    goto LABEL_20;
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  id v26 = [NSString stringWithFormat:@"Invalid shape %@ for slicing %@", v11, v45];
  id v52 = v26;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  id v28 = [v32 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v27];
LABEL_18:
  v33 = 0;
  *a7 = v28;
LABEL_19:

LABEL_21:
  return v33;
}

+ (void)squeezeShape:(id)a3 strides:(id)a4 resultingShape:(id *)a5 resultingStrides:(id *)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; i < [v19 count]; ++i)
  {
    uint64_t v13 = [v19 objectAtIndexedSubscript:i];
    int v14 = [v13 intValue];

    if (v14 != 1)
    {
      uint64_t v15 = [v19 objectAtIndexedSubscript:i];
      [v10 addObject:v15];

      unint64_t v16 = [v9 objectAtIndexedSubscript:i];
      [v11 addObject:v16];
    }
  }
  if (![v10 count])
  {
    [v10 addObject:&unk_1EF11A028];
    [v11 addObject:&unk_1EF11A028];
  }
  id v17 = v10;
  *a5 = v17;
  id v18 = v11;
  *a6 = v18;
}

+ (BOOL)isSqueezableShape:(id)a3 dimensions:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "unsignedIntegerValue", (void)v15);
        if (v10 < [v5 count])
        {
          id v11 = [v5 objectAtIndexedSubscript:v10];
          BOOL v12 = [v11 intValue] == 1;

          if (v12) {
            continue;
          }
        }
        BOOL v13 = 0;
        goto LABEL_13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_13:

  return v13;
}

+ (BOOL)isSqueezableShape:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  do
  {
    unint64_t v5 = v4;
    unint64_t v6 = [v3 count];
    if (v5 >= v6) {
      break;
    }
    uint64_t v7 = [v3 objectAtIndexedSubscript:v5];
    int v8 = [v7 intValue];

    unint64_t v4 = v5 + 1;
  }
  while (v8 != 1);

  return v5 < v6;
}

@end