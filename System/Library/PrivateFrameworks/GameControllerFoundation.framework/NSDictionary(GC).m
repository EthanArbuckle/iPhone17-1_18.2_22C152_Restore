@interface NSDictionary(GC)
- (id)gc_dictionaryByRemovingObjectsForKeys:()GC;
- (id)gc_objectForKey:()GC ofClass:;
- (id)gc_objectForKey:()GC ofClass:error:;
- (id)gc_requiredObjectForKey:()GC ofClass:;
- (id)gc_requiredObjectForKey:()GC ofClass:error:;
- (uint64_t)gc_enumerateKeysAndObjectsUsingBlock:()GC;
- (void)gc_makeValuesPerformSelector:()GC withObject:;
@end

@implementation NSDictionary(GC)

- (id)gc_objectForKey:()GC ofClass:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSDictionary(GC) gc_objectForKey:ofClass:]");
    id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v8);
  }
  id v6 = (id)objc_msgSend(a1, "objectForKey:");
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [a3 description];
    uint64_t v10 = NSStringFromClass(a4);
    v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = +[NSString stringWithFormat:@"Value for key '%@' has unexpected class '%@'.", v9, v12];
    v16[0] = @"GC_NSExceptionErrorDomain";
    v16[1] = @"GC_NSExceptionErrorCode";
    v17[0] = @"NSCollectionErrorDomain";
    v17[1] = &unk_26BEE20F8;
    v16[2] = NSLocalizedDescriptionKey;
    v16[3] = @"NSCollectionErrorIndexKey";
    v17[2] = @"Invalid dictionary.";
    v17[3] = v9;
    v16[4] = @"NSCollectionErrorElementClassKey";
    v16[5] = @"NSCollectionErrorExpectedClassKey";
    v17[4] = v12;
    v17[5] = v10;
    v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];
    id v15 = +[NSException exceptionWithName:@"NSInvalidCollectionException" reason:v13 userInfo:v14];

    objc_exception_throw(v15);
  }

  return v6;
}

- (id)gc_objectForKey:()GC ofClass:error:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSDictionary(GC) gc_objectForKey:ofClass:error:]");
    id v11 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v11);
  }
  id v8 = (id)objc_msgSend(a1, "objectForKey:");
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      uint64_t v12 = [a3 description];
      uint64_t v13 = NSStringFromClass(a4);
      v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      v16 = +[NSString stringWithFormat:@"Value for key '%@' has unexpected class '%@'.", v12, v15];
      v18[0] = NSLocalizedDescriptionKey;
      v18[1] = NSLocalizedFailureReasonErrorKey;
      v19[0] = @"Invalid dictionary.";
      v19[1] = v16;
      v18[2] = @"NSCollectionErrorIndexKey";
      v18[3] = @"NSCollectionErrorElementClassKey";
      v19[2] = v12;
      v19[3] = v15;
      v18[4] = @"NSCollectionErrorExpectedClassKey";
      v19[4] = v13;
      v17 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
      *a5 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:3 userInfo:v17];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)gc_requiredObjectForKey:()GC ofClass:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSDictionary(GC) gc_requiredObjectForKey:ofClass:]");
    id v9 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v9);
  }
  id v6 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v6)
  {
    uint64_t v10 = [a3 description];
    uint64_t v11 = +[NSString stringWithFormat:@"Missing required key '%@'.", v10];
    v22[0] = @"GC_NSExceptionErrorDomain";
    v22[1] = @"GC_NSExceptionErrorCode";
    v23[0] = @"NSCollectionErrorDomain";
    v23[1] = &unk_26BEE2110;
    v22[2] = NSLocalizedDescriptionKey;
    v22[3] = @"NSCollectionErrorIndexKey";
    v23[2] = @"Invalid dictionary.";
    v23[3] = v10;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    uint64_t v13 = v11;
    goto LABEL_10;
  }
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [a3 description];
    uint64_t v15 = NSStringFromClass(a4);
    v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = +[NSString stringWithFormat:@"Value for key '%@' has unexpected class '%@'.", v14, v17];
    v20[0] = @"GC_NSExceptionErrorDomain";
    v20[1] = @"GC_NSExceptionErrorCode";
    v21[0] = @"NSCollectionErrorDomain";
    v21[1] = &unk_26BEE20F8;
    v20[2] = NSLocalizedDescriptionKey;
    v20[3] = @"NSCollectionErrorIndexKey";
    v21[2] = @"Invalid dictionary.";
    v21[3] = v14;
    v20[4] = @"NSCollectionErrorElementClassKey";
    v20[5] = @"NSCollectionErrorExpectedClassKey";
    v21[4] = v17;
    v21[5] = v15;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
    uint64_t v13 = v18;
LABEL_10:
    id v19 = +[NSException exceptionWithName:@"NSInvalidCollectionException" reason:v13 userInfo:v12];

    objc_exception_throw(v19);
  }

  return v7;
}

- (id)gc_requiredObjectForKey:()GC ofClass:error:
{
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: aClass cannot be nil", "-[NSDictionary(GC) gc_requiredObjectForKey:ofClass:error:]");
    id v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v12);
  }
  id v8 = (id)objc_msgSend(a1, "objectForKey:");
  if (v8)
  {
    id v9 = v8;
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_5;
    }
    if (a5)
    {
      uint64_t v13 = [a3 description];
      uint64_t v14 = NSStringFromClass(a4);
      v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      uint64_t v18 = +[NSString stringWithFormat:@"Value for key '%@' has unexpected class '%@'.", v13, v17];
      v20[0] = NSLocalizedDescriptionKey;
      v20[1] = NSLocalizedFailureReasonErrorKey;
      v21[0] = @"Invalid dictionary.";
      v21[1] = v18;
      v20[2] = @"NSCollectionErrorIndexKey";
      v20[3] = @"NSCollectionErrorElementClassKey";
      v21[2] = v13;
      v21[3] = v17;
      v20[4] = @"NSCollectionErrorExpectedClassKey";
      v21[4] = v14;
      id v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
      *a5 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:3 userInfo:v19];

      goto LABEL_13;
    }
  }
  else if (a5)
  {
    uint64_t v13 = [a3 description];
    uint64_t v14 = +[NSString stringWithFormat:@"Missing required key '%@'.", v13];
    v22[0] = NSLocalizedDescriptionKey;
    v22[1] = NSLocalizedFailureReasonErrorKey;
    v23[0] = @"Invalid dictionary.";
    v23[1] = v14;
    v22[2] = @"NSCollectionErrorIndexKey";
    v23[2] = v13;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    *a5 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:1 userInfo:v15];

LABEL_13:
  }
  id v10 = 0;
LABEL_5:

  return v10;
}

- (void)gc_makeValuesPerformSelector:()GC withObject:
{
  id v6 = [a1 allValues];
  [v6 makeObjectsPerformSelector:a3 withObject:a4];
}

- (uint64_t)gc_enumerateKeysAndObjectsUsingBlock:()GC
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v4[3] = &__block_descriptor_40_e15_v32__0_8_16_B24lu32l8;
  v4[4] = a3;
  return [a1 enumerateKeysAndObjectsUsingBlock:v4];
}

- (id)gc_dictionaryByRemovingObjectsForKeys:()GC
{
  if (!a3)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"*** %s: keys cannot be nil", "-[NSDictionary(GC) gc_dictionaryByRemovingObjectsForKeys:]");
    id v7 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v7);
  }
  v4 = (void *)[a1 mutableCopy];
  [v4 removeObjectsForKeys:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

@end