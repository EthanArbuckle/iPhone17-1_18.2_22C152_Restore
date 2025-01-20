@interface NSDictionary(MCUtilities)
+ (id)MCDictionaryFromFile:()MCUtilities;
+ (id)MCShortenedArray:()MCUtilities;
+ (id)MCShortenedData:()MCUtilities;
+ (id)MCShortenedDictionary:()MCUtilities;
+ (id)MCShortenedObject:()MCUtilities;
- (id)MCDictionaryAdditiveDeltaToCreateDictionary:()MCUtilities;
- (id)MCDictionarySubtractiveDeltaToCreateDictionary:()MCUtilities;
- (id)MCDictionaryWithLeafValuesSetToValue:()MCUtilities;
- (id)MCInsertedKeysFromDictionary:()MCUtilities withNewLeafValue:;
- (id)MCRemovedKeysFromDictionary:()MCUtilities;
- (id)MCRetainRequiredNonZeroLengthStringKey:()MCUtilities errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:;
- (id)MCRetainRequiredObjectKey:()MCUtilities type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:;
- (id)MCShortenedPlistDescription;
- (uint64_t)MCDeepCopy;
- (uint64_t)MCMutableDeepCopy;
- (uint64_t)MCValidateBoolRestriction:()MCUtilities inRestrictions:defaultRestrictions:;
- (uint64_t)MCValidateIntersectionRestriction:()MCUtilities inRestrictions:defaultRestrictions:;
- (uint64_t)MCValidateRestrictions;
- (uint64_t)MCValidateUnionRestriction:()MCUtilities inRestrictions:defaultRestrictions:;
- (uint64_t)MCValidateValueRestriction:()MCUtilities inRestrictions:defaultRestrictions:;
- (uint64_t)MCWriteToBinaryFile:()MCUtilities;
- (uint64_t)MCWriteToBinaryFile:()MCUtilities atomically:;
- (void)MCMutableDeepCopyWithZone:()MCUtilities;
- (void)MCRetainOptionalNonZeroLengthStringKey:()MCUtilities errorDomain:invalidDataCode:invalidDataErrorString:outError:;
- (void)MCRetainOptionalObjectKey:()MCUtilities type:errorDomain:invalidDataCode:invalidDataErrorString:outError:;
@end

@implementation NSDictionary(MCUtilities)

- (uint64_t)MCWriteToBinaryFile:()MCUtilities
{
  id v4 = a3;
  v5 = [[MCDictionaryWriter alloc] initWithDictionary:a1 path:v4];

  uint64_t v6 = [(MCDictionaryWriter *)v5 write];
  return v6;
}

- (uint64_t)MCWriteToBinaryFile:()MCUtilities atomically:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1A6232D90]();
  id v17 = 0;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a1 format:200 options:0 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v16 = 0;
    char v10 = [v8 writeToFile:v6 options:a4 error:&v16];
    id v11 = v16;
    if (v10)
    {
      uint64_t v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v13 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl(&dword_1A13F0000, v13, OS_LOG_TYPE_ERROR, "Could not serialize data for %{public}@: %{public}@", buf, 0x16u);
    }
    id v11 = 0;
  }
  v14 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_ERROR, "Could not write data to path %{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

+ (id)MCDictionaryFromFile:()MCUtilities
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  id v9 = 0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    v7 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_1A13F0000, v7, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (void)MCMutableDeepCopyWithZone:()MCUtilities
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a1 keyEnumerator];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = v10;
        if ([v10 conformsToProtocol:&unk_1EF4EA288])
        {
          id v11 = (void *)[v10 mutableCopyWithZone:a3];
        }
        __int16 v12 = [a1 objectForKey:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 MCMutableDeepCopyWithZone:a3];
LABEL_13:
          uint64_t v14 = (void *)v13;
          [v5 setObject:v13 forKey:v11];

          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || [v12 conformsToProtocol:&unk_1EF4EA288])
        {
          uint64_t v13 = [v12 mutableCopyWithZone:a3];
          goto LABEL_13;
        }
        if ([v12 conformsToProtocol:&unk_1EF4DD250])
        {
          uint64_t v13 = [v12 copyWithZone:a3];
          goto LABEL_13;
        }
        [v5 setObject:v12 forKey:v11];
LABEL_14:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }

  return v5;
}

- (uint64_t)MCMutableDeepCopy
{
  return [a1 MCMutableDeepCopyWithZone:0];
}

- (uint64_t)MCDeepCopy
{
  return [a1 MCDeepCopyWithZone:0];
}

- (id)MCRetainRequiredObjectKey:()MCUtilities type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  v26 = [a1 objectForKey:v15];
  if (v26)
  {
    if (objc_opt_isKindOfClass())
    {
      id v34 = v26;
      goto LABEL_10;
    }
    if (a10)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      v36 = MCErrorArray(v18, v27, v28, v29, v30, v31, v32, v33, v15);
      v37 = v40;
      id v38 = v16;
      uint64_t v39 = a8;
      goto LABEL_8;
    }
  }
  else if (a10)
  {
    v35 = (void *)MEMORY[0x1E4F28C58];
    v36 = MCErrorArray(v17, v19, v20, v21, v22, v23, v24, v25, v15);
    v37 = v35;
    id v38 = v16;
    uint64_t v39 = a6;
LABEL_8:
    *a10 = [v37 MCErrorWithDomain:v38 code:v39 descriptionArray:v36 errorType:@"MCFatalError"];
  }
  id v34 = 0;
LABEL_10:

  return v34;
}

- (void)MCRetainOptionalObjectKey:()MCUtilities type:errorDomain:invalidDataCode:invalidDataErrorString:outError:
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = [a1 objectForKey:v13];
  if (v16 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a8)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = MCErrorArray(v15, v17, v18, v19, v20, v21, v22, v23, v13);
      *a8 = [v24 MCErrorWithDomain:v14 code:a6 descriptionArray:v25 errorType:@"MCFatalError"];

      a8 = 0;
    }
  }
  else
  {
    a8 = v16;
  }

  return a8;
}

- (id)MCRetainRequiredNonZeroLengthStringKey:()MCUtilities errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = [a1 objectForKey:v15];
  if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a9)
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      v36 = MCErrorArray(v18, v20, v21, v22, v23, v24, v25, v26, v15);
      v37 = v35;
      id v38 = v16;
      uint64_t v39 = a7;
LABEL_9:
      *a9 = [v37 MCErrorWithDomain:v38 code:v39 descriptionArray:v36 errorType:@"MCFatalError"];
    }
  }
  else
  {
    if ([v19 length])
    {
      id v34 = v19;
      goto LABEL_11;
    }
    if (a9)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      v36 = MCErrorArray(v17, v27, v28, v29, v30, v31, v32, v33, v15);
      v37 = v40;
      id v38 = v16;
      uint64_t v39 = a5;
      goto LABEL_9;
    }
  }
  id v34 = 0;
LABEL_11:

  return v34;
}

- (void)MCRetainOptionalNonZeroLengthStringKey:()MCUtilities errorDomain:invalidDataCode:invalidDataErrorString:outError:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [a1 objectForKey:v12];
  if (!v15) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v15 length])
    {
LABEL_4:
      a7 = v15;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a7) {
      goto LABEL_8;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = MCErrorArray(v14, v16, v17, v18, v19, v20, v21, v22, v12);
    *a7 = [v23 MCErrorWithDomain:v13 code:a5 descriptionArray:v24 errorType:@"MCFatalError"];
  }
  a7 = 0;
LABEL_8:

  return a7;
}

- (id)MCShortenedPlistDescription
{
  v1 = [(id)objc_opt_class() MCShortenedDictionary:a1];
  v2 = [v1 description];

  return v2;
}

+ (id)MCShortenedObject:()MCUtilities
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 MCShortenedArray:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 MCShortenedDictionary:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [a1 MCShortenedData:v4];
      }
      else
      {
        id v5 = v4;
      }
    }
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)MCShortenedData:()MCUtilities
{
  id v3 = a3;
  if ([v3 length])
  {
    unint64_t v4 = [v3 length];
    id v5 = NSString;
    if (v4 > 0x10)
    {
      uint64_t v6 = objc_msgSend(v3, "subdataWithRange:", 0, 8);
      uint64_t v8 = [v6 MCHexString];
      uint64_t v9 = objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 8, 8);
      id v10 = [v9 MCHexString];
      uint64_t v7 = [v5 stringWithFormat:@"0x%@ ... 0x%@", v8, v10];
    }
    else
    {
      uint64_t v6 = [v3 MCHexString];
      uint64_t v7 = [v5 stringWithFormat:@"0x%@", v6];
    }
  }
  else
  {
    uint64_t v7 = @"<empty>";
  }
  id v11 = [NSString stringWithFormat:@"Data { length = %lu, bytes = %@ }", objc_msgSend(v3, "length"), v7];

  return v11;
}

+ (id)MCShortenedArray:()MCUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "MCShortenedObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)MCShortenedDictionary:()MCUtilities
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__NSDictionary_MCUtilities__MCShortenedDictionary___block_invoke;
  v9[3] = &unk_1E5A659C0;
  id v7 = v6;
  id v10 = v7;
  uint64_t v11 = a1;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

- (uint64_t)MCValidateRestrictions
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = +[MCRestrictionManager sharedManager];
  id v3 = [v2 defaultRestrictions];

  [a1 objectForKeyedSubscript:@"restrictedBool"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![a1 MCValidateBoolRestriction:*(void *)(*((void *)&v38 + 1) + 8 * v8) inRestrictions:v4 defaultRestrictions:v3])
        {
          uint64_t v24 = 0;
          id v9 = v4;
          goto LABEL_41;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [a1 objectForKeyedSubscript:@"restrictedValue"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        if (![a1 MCValidateValueRestriction:*(void *)(*((void *)&v34 + 1) + 8 * v13) inRestrictions:v9 defaultRestrictions:v3])
        {
          uint64_t v24 = 0;
          id v14 = v9;
          goto LABEL_40;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  [a1 objectForKeyedSubscript:@"intersection"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        if (![a1 MCValidateIntersectionRestriction:*(void *)(*((void *)&v30 + 1) + 8 * v18) inRestrictions:v14 defaultRestrictions:v3])
        {
          uint64_t v24 = 0;
          id v19 = v14;
          goto LABEL_39;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v43 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  [a1 objectForKeyedSubscript:@"union"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    while (2)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        if (!objc_msgSend(a1, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", *(void *)(*((void *)&v26 + 1) + 8 * v23), v19, v3, (void)v26))
        {
          uint64_t v24 = 0;
          goto LABEL_38;
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v42 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  uint64_t v24 = 1;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v24;
}

- (uint64_t)MCValidateBoolRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:@"restrictedBool"];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v7];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"preference"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:v7];
      uint64_t v13 = [(id)v10 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10 & 1;
}

- (uint64_t)MCValidateValueRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:@"restrictedValue"];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v7];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"preferSmallerValues"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:v7];
      uint64_t v13 = [(id)v10 objectForKeyedSubscript:@"value"];

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10 & 1;
}

- (uint64_t)MCValidateIntersectionRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:@"intersection"];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v7];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"values"];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (uint64_t)MCValidateUnionRestriction:()MCUtilities inRestrictions:defaultRestrictions:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:@"union"];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v7];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"values"];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)MCDictionaryAdditiveDeltaToCreateDictionary:()MCUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v16);
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        if (!v12) {
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        if ([v13 isEqual:v12]) {
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v12 MCDictionaryAdditiveDeltaToCreateDictionary:v13];
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
        else
        {
LABEL_11:
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
LABEL_12:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCDictionarySubtractiveDeltaToCreateDictionary:()MCUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v16);
        uint64_t v13 = [v4 objectForKeyedSubscript:v11];
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v13 isEqual:v12] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [v12 MCDictionarySubtractiveDeltaToCreateDictionary:v13];
              if ([v14 count]) {
                [v5 setObject:v14 forKeyedSubscript:v11];
              }
            }
          }
        }
        else
        {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCRemovedKeysFromDictionary:()MCUtilities
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    long long v18 = a1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [a1 objectForKeyedSubscript:v11];
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v14 = v5;
            uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
            long long v16 = [v15 MCRemovedKeysFromDictionary:v13];

            uint64_t v5 = v14;
            if ([v16 count]) {
              [v14 setObject:v16 forKeyedSubscript:v11];
            }
            else {
              [v14 removeObjectForKey:v11];
            }

            a1 = v18;
          }
          else
          {
            [v5 removeObjectForKey:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCInsertedKeysFromDictionary:()MCUtilities withNewLeafValue:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v24 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    long long v21 = a1;
    uint64_t v22 = *(void *)v26;
    id v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [a1 objectForKeyedSubscript:v10];
        uint64_t v12 = [v8 objectForKeyedSubscript:v10];
        uint64_t v13 = (void *)v12;
        if (v7) {
          id v14 = v7;
        }
        else {
          id v14 = (void *)v12;
        }
        id v15 = v14;
        long long v16 = v13;
        if (v7)
        {
          objc_opt_class();
          long long v16 = v7;
          if (objc_opt_isKindOfClass())
          {
            long long v16 = [v13 MCDictionaryWithLeafValuesSetToValue:v7];
          }
        }
        if (v11
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          long long v17 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
          long long v18 = [v17 MCInsertedKeysFromDictionary:v13 withNewLeafValue:v7];

          id v8 = v20;
          [v23 setObject:v18 forKeyedSubscript:v10];

          a1 = v21;
        }
        else
        {
          [v23 setObject:v16 forKeyedSubscript:v10];
        }
      }
      uint64_t v24 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }

  return v23;
}

- (id)MCDictionaryWithLeafValuesSetToValue:()MCUtilities
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 MCDictionaryWithLeafValuesSetToValue:v4];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
        else
        {
          [v5 setObject:v4 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

@end