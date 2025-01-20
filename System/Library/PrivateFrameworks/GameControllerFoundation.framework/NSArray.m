@interface NSArray
@end

@implementation NSArray

uint64_t __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke_2;
  v7[3] = &__block_descriptor_48_e12__24__0_8__16lu32l8;
  v7[4] = a2;
  v7[5] = a3;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, a3, a4, a5, a6);
}

id __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke_2(uint64_t a1, objc_class *a2, void *a3)
{
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(id *)(a1 + 32);
  }
  else
  {
    if (a3)
    {
      v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
      v9 = [v8 description];

      v10 = NSStringFromClass(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = +[NSString stringWithFormat:@"Element at index '%@' has unexpected class '%@'.", v9, v12];
      v15[0] = NSLocalizedDescriptionKey;
      v15[1] = NSLocalizedFailureReasonErrorKey;
      v16[0] = @"Invalid array.";
      v16[1] = v13;
      v15[2] = @"NSCollectionErrorIndexKey";
      v15[3] = @"NSCollectionErrorElementClassKey";
      v16[2] = v9;
      v16[3] = v12;
      v15[4] = @"NSCollectionErrorExpectedClassesKey";
      v16[4] = v10;
      v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
      *a3 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:3 userInfo:v14];
    }
    id v6 = 0;
  }

  return v6;
}

@end