@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_2;
  v13 = &__block_descriptor_40_e12__24__0_8__16lu32l8;
  uint64_t v14 = a2;
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_3;
  v7 = &__block_descriptor_48_e12__24__0_8__16lu32l8u40l8;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_2(uint64_t a1, objc_class *a2, void *a3)
{
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(id *)(a1 + 32);
  }
  else
  {
    if (a3)
    {
      uint64_t v8 = [*(id *)(a1 + 32) description];
      uint64_t v9 = NSStringFromClass(a2);
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      v12 = +[NSString stringWithFormat:@"Key '%@' has unexpected class '%@'.", v8, v11];
      v14[0] = NSLocalizedDescriptionKey;
      v14[1] = NSLocalizedFailureReasonErrorKey;
      v15[0] = @"Invalid dictionary.";
      v15[1] = v12;
      v14[2] = @"NSCollectionErrorIndexKey";
      v14[3] = @"NSCollectionErrorIndexClassKey";
      v15[2] = v8;
      v15[3] = v11;
      v14[4] = @"NSCollectionErrorExpectedClassKey";
      v15[4] = v9;
      v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
      *a3 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:2 userInfo:v13];
    }
    id v6 = 0;
  }

  return v6;
}

id __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke_3(uint64_t a1, objc_class *a2, void *a3)
{
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(id *)(a1 + 32);
  }
  else
  {
    if (a3)
    {
      uint64_t v8 = [*(id *)(a1 + 40) description];
      uint64_t v9 = NSStringFromClass(a2);
      v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      v12 = +[NSString stringWithFormat:@"Value for key '%@' has unexpected class '%@'.", v8, v11];
      v14[0] = NSLocalizedDescriptionKey;
      v14[1] = NSLocalizedFailureReasonErrorKey;
      v15[0] = @"Invalid dictionary.";
      v15[1] = v12;
      v14[2] = @"NSCollectionErrorIndexKey";
      v14[3] = @"NSCollectionErrorElementClassKey";
      v15[2] = v8;
      v15[3] = v11;
      v14[4] = @"NSCollectionErrorExpectedClassKey";
      v15[4] = v9;
      v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
      *a3 = +[NSError errorWithDomain:@"NSCollectionErrorDomain" code:3 userInfo:v13];
    }
    id v6 = 0;
  }

  return v6;
}

@end