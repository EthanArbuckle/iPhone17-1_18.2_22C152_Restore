@interface NSArray(GC)
- (id)gc_arrayByTransformingElementsWithOptions:()GC usingBlock:;
- (id)gc_requiredObjectAtIndex:()GC ofClass:;
- (id)gc_reversedArray;
- (uint64_t)gc_arrayByTransformingElementsUsingBlock:()GC;
- (uint64_t)gc_enumerateObjectsUsingBlock:()GC;
- (uint64_t)gc_enumerateObjectsWithOptions:()GC usingBlock:;
- (void)gc_requiredObjectAtIndex:()GC ofClass:error:;
@end

@implementation NSArray(GC)

- (id)gc_requiredObjectAtIndex:()GC ofClass:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSArray(GC) gc_requiredObjectAtIndex:ofClass:]");
    id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v8);
  }
  v6 = objc_msgSend(a1, "objectAtIndex:");
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = NSStringFromClass(a4);
    v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    uint64_t v12 = +[NSString stringWithFormat:@"Object at index '%llu' has unexpected class '%@'.", a3, v11];
    v16[0] = @"GC_NSExceptionErrorDomain";
    v16[1] = @"GC_NSExceptionErrorCode";
    v17[0] = @"NSCollectionErrorDomain";
    v17[1] = &unk_26BEE2170;
    v17[2] = @"Invalid array.";
    v16[2] = NSLocalizedDescriptionKey;
    v16[3] = @"NSCollectionErrorIndexKey";
    v13 = +[NSNumber numberWithUnsignedInteger:a3];
    v17[3] = v13;
    v17[4] = v11;
    v16[4] = @"NSCollectionErrorElementClassKey";
    v16[5] = @"NSCollectionErrorExpectedClassKey";
    v17[5] = v9;
    v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];
    id v15 = +[NSException exceptionWithName:@"NSInvalidCollectionException" reason:v12 userInfo:v14];

    objc_exception_throw(v15);
  }

  return v6;
}

- (void)gc_requiredObjectAtIndex:()GC ofClass:error:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSArray(GC) gc_requiredObjectAtIndex:ofClass:error:]");
    id v15 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v15);
  }
  if ([a1 count] > a3
    && ([a1 objectAtIndex:a3], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (id)v9;
    if (objc_opt_isKindOfClass())
    {
      id v10 = v10;
      a5 = v10;
      goto LABEL_10;
    }
    if (a5)
    {
      v16 = NSStringFromClass(a4);
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = +[NSString stringWithFormat:@"Element at index '%llu' has unexpected class '%@'.", a3, v18];
      v22[0] = NSLocalizedDescriptionKey;
      v22[1] = NSLocalizedFailureReasonErrorKey;
      v23[0] = @"Invalid array.";
      v23[1] = v19;
      v22[2] = @"NSCollectionErrorIndexKey";
      v20 = +[NSNumber numberWithUnsignedInteger:a3];
      v23[2] = v20;
      v23[3] = v18;
      v22[3] = @"NSCollectionErrorElementClassKey";
      v22[4] = @"NSCollectionErrorExpectedClassKey";
      v23[4] = v16;
      v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
      *a5 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:3 userInfo:v21];

      goto LABEL_8;
    }
  }
  else
  {
    if (a5)
    {
      uint64_t v11 = +[NSString stringWithFormat:@"Missing required element at index '%llu'.", a3];
      v24[0] = NSLocalizedDescriptionKey;
      v24[1] = NSLocalizedFailureReasonErrorKey;
      v25[0] = @"Invalid array.";
      v25[1] = v11;
      v24[2] = @"NSCollectionErrorIndexKey";
      uint64_t v12 = +[NSNumber numberWithUnsignedInteger:a3];
      v25[2] = v12;
      v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
      *a5 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:1 userInfo:v13];

      id v10 = 0;
LABEL_8:
      a5 = 0;
      goto LABEL_10;
    }
    id v10 = 0;
  }
LABEL_10:

  return a5;
}

- (id)gc_reversedArray
{
  v2 = objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "reverseObjectEnumerator", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v8 = (void *)[v2 copy];

  return v8;
}

- (id)gc_arrayByTransformingElementsWithOptions:()GC usingBlock:
{
  v7 = objc_msgSend(objc_alloc((Class)&off_26BEEB1B8), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = a3 & 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = (*(void (**)(uint64_t, void, uint64_t))(a4 + 16))(a4, *(void *)(*((void *)&v19 + 1) + 8 * i), v11 + i);
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v13 == 0;
        }
        if (v16) {
          objc_msgSend(v7, "addObject:", v15, (void)v19);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      v11 += i;
    }
    while (v10);
  }

  v17 = (void *)[v7 copy];

  return v17;
}

- (uint64_t)gc_arrayByTransformingElementsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 0, a3);
}

- (uint64_t)gc_enumerateObjectsWithOptions:()GC usingBlock:
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24lu32l8;
  v5[4] = a4;
  return [a1 enumerateObjectsUsingBlock:v5];
}

- (uint64_t)gc_enumerateObjectsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

@end