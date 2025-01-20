@interface NSJSONSerialization(BRAdditions)
+ (id)_jsonifyObject:()BRAdditions;
+ (id)jsonStringFromDictionary:()BRAdditions options:error:;
@end

@implementation NSJSONSerialization(BRAdditions)

+ (id)_jsonifyObject:()BRAdditions
{
  id v4 = a3;
  if (_jsonifyObject__onceToken != -1) {
    dispatch_once(&_jsonifyObject__onceToken, &__block_literal_global_30);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_opt_new();
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_2;
      v14[3] = &unk_1E59AF888;
      id v7 = v6;
      id v15 = v7;
      uint64_t v16 = a1;
      [v4 enumerateKeysAndObjectsUsingBlock:v14];
      v8 = v15;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = v4;
        goto LABEL_11;
      }
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_3;
      v11[3] = &unk_1E59AF8B0;
      id v7 = v9;
      id v12 = v7;
      uint64_t v13 = a1;
      [v4 enumerateObjectsUsingBlock:v11];
      v8 = v12;
    }

    goto LABEL_12;
  }
  id v5 = [(id)_jsonifyObject__dateFormatter stringFromDate:v4];
LABEL_11:
  id v7 = v5;
LABEL_12:

  return v7;
}

+ (id)jsonStringFromDictionary:()BRAdditions options:error:
{
  v6 = objc_msgSend(a1, "_jsonifyObject:");
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:1 error:&v12];
  id v8 = v12;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else
  {
    v10 = 0;
    if (a5) {
      *a5 = v8;
    }
  }

  return v10;
}

@end