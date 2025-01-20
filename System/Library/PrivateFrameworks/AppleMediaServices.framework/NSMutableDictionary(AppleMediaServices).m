@interface NSMutableDictionary(AppleMediaServices)
- (uint64_t)ams_deleteValueForKeyPath:()AppleMediaServices;
- (void)ams_flatInsertValue:()AppleMediaServices forKeyPath:;
- (void)ams_insertValue:()AppleMediaServices forKeyPath:;
- (void)ams_setNullableObject:()AppleMediaServices forKey:;
- (void)ams_setValue:()AppleMediaServices forKeyPath:;
- (void)ams_setValue:()AppleMediaServices forKeyPath:shouldAppendToContainers:shouldFlatten:;
- (void)ams_setValue:()AppleMediaServices forKeyPathComponents:shouldAppendToContainers:shouldFlatten:;
@end

@implementation NSMutableDictionary(AppleMediaServices)

- (void)ams_setNullableObject:()AppleMediaServices forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (void)ams_setValue:()AppleMediaServices forKeyPath:
{
  if (a3) {
    return objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 0, 0);
  }
  return a1;
}

- (void)ams_setValue:()AppleMediaServices forKeyPath:shouldAppendToContainers:shouldFlatten:
{
  id v13 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    v11 = [v10 componentsSeparatedByString:@"."];
    v12 = (void *)[v11 mutableCopy];

    if ([v12 count] && (objc_msgSend(v12, "containsObject:", &stru_1EDCA7308) & 1) == 0) {
      objc_msgSend(a1, "ams_setValue:forKeyPathComponents:shouldAppendToContainers:shouldFlatten:", v13, v12, a5, a6);
    }
  }
}

- (void)ams_setValue:()AppleMediaServices forKeyPathComponents:shouldAppendToContainers:shouldFlatten:
{
  id v40 = a3;
  id v10 = a4;
  if (![v10 count]) {
    goto LABEL_64;
  }
  int v37 = a6;
  int v39 = a5;
  if (_MergedGlobals_161 != -1) {
    dispatch_once(&_MergedGlobals_161, &__block_literal_global_149);
  }
  id v41 = (id)qword_1EB38E168;
  id v11 = a1;
  unint64_t v12 = 0;
  while (v12 < [v10 count] - 1)
  {
    id v13 = [v10 objectAtIndexedSubscript:v12];
    v14 = [v10 objectAtIndexedSubscript:v12 + 1];
    v15 = [v41 numberFromString:v13];
    v16 = [v41 numberFromString:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v11;
      v18 = [v17 objectForKey:v13];
      id v19 = (id)[v18 mutableCopy];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
        if (!v19)
        {
LABEL_16:
          if (!v40) {
            goto LABEL_32;
          }
          uint64_t v22 = objc_opt_new();

          id v19 = (id)v22;
          goto LABEL_18;
        }
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (!v19) {
          goto LABEL_16;
        }
      }
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_16;
      }
LABEL_18:
      [v17 setObject:v19 forKeyedSubscript:v13];
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v11;
      if (!v15 || (unint64_t v21 = [v15 unsignedIntegerValue], v21 > objc_msgSend(v17, "count")))
      {
        id v19 = 0;
        goto LABEL_32;
      }
      if (v21 >= [v17 count])
      {
        id v19 = 0;
      }
      else
      {
        v38 = [v17 objectAtIndex:v21];
        id v19 = (id)[v38 mutableCopy];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v24 = 1;
        if (!v19)
        {
LABEL_30:
          if (v40)
          {
            uint64_t v25 = objc_opt_new();

            [v17 addObject:v25];
            id v19 = (id)v25;
            goto LABEL_19;
          }
LABEL_32:
          char v23 = 0;
LABEL_33:

          id v11 = v17;
          goto LABEL_34;
        }
      }
      else
      {
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();
        if (!v19) {
          goto LABEL_30;
        }
      }
      if ((v24 & 1) == 0) {
        goto LABEL_30;
      }
      [v17 replaceObjectAtIndex:v21 withObject:v19];
LABEL_19:

      id v19 = v19;
      char v23 = 1;
      id v17 = v19;
      goto LABEL_33;
    }
    char v23 = 0;
LABEL_34:

    ++v12;
    if ((v23 & 1) == 0) {
      goto LABEL_63;
    }
  }
  v26 = [v10 lastObject];
  v27 = [v41 numberFromString:v26];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v27) {
      goto LABEL_62;
    }
    unint64_t v32 = [v27 unsignedIntegerValue];
    id v33 = v11;
    if (!v40 && v32 < [v33 count])
    {
      [v33 removeObjectAtIndex:v32];
      goto LABEL_61;
    }
    if (v32 >= [v33 count])
    {
      [v33 addObject:v40];
      goto LABEL_61;
    }
    v34 = [v33 objectAtIndexedSubscript:v32];
    id v35 = v40;
    if (v39)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v36 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v34];
        [v36 addEntriesFromDictionary:v35];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_75;
        }
        v36 = (void *)[v34 mutableCopy];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v37) {
          [v36 addObjectsFromArray:v35];
        }
        else {
          [v36 addObject:v35];
        }
      }

      id v35 = v36;
    }
    if (!v35)
    {
LABEL_76:

      goto LABEL_61;
    }
    [v33 replaceObjectAtIndex:v32 withObject:v35];
LABEL_75:

    goto LABEL_76;
  }
  id v28 = v11;
  uint64_t v29 = [v28 objectForKeyedSubscript:v26];
  v30 = (void *)v29;
  if (v39 && v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = (void *)[v30 mutableCopy];
        [v31 addEntriesFromDictionary:v40];
        goto LABEL_59;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 mutableCopy];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v37) {
        [v31 addObjectsFromArray:v40];
      }
      else {
        [v31 addObject:v40];
      }
LABEL_59:
      [v28 setObject:v31 forKeyedSubscript:v26];
    }
  }
  else
  {
    [v28 setObject:v40 forKeyedSubscript:v26];
  }

LABEL_61:
LABEL_62:

LABEL_63:
LABEL_64:
}

- (uint64_t)ams_deleteValueForKeyPath:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", 0, a3, 0, 0);
}

- (void)ams_insertValue:()AppleMediaServices forKeyPath:
{
  if (a3) {
    return objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 1, 0);
  }
  return a1;
}

- (void)ams_flatInsertValue:()AppleMediaServices forKeyPath:
{
  if (a3) {
    return objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 1, 1);
  }
  return a1;
}

@end