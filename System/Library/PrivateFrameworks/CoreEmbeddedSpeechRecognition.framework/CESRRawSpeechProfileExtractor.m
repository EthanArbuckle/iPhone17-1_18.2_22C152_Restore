@interface CESRRawSpeechProfileExtractor
+ (BOOL)_isValidCategoryWithName:(id)a3 data:(id)a4 error:(id *)a5;
+ (id)_convertItemsFromEntities:(id)a3 categoryName:(id)a4 converter:(id)a5 error:(id *)a6;
+ (id)_dictionaryFromUserDataArray:(id)a3 error:(id *)a4;
+ (id)_extractEntitiesFromCategoryData:(id)a3 categoryName:(id)a4 error:(id *)a5;
+ (id)_extractNamespaceFromCategoryName:(id)a3 error:(id *)a4;
+ (id)_extractUserDataFromRawSpeechProfile:(id)a3 error:(id *)a4;
+ (id)extractItemsFromRawSpeechProfile:(id)a3 converter:(id)a4 error:(id *)a5;
+ (id)extractLocaleFromRawSpeechProfile:(id)a3 error:(id *)a4;
@end

@implementation CESRRawSpeechProfileExtractor

+ (id)_convertItemsFromEntities:(id)a3 categoryName:(id)a4 converter:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(id)objc_opt_class() _extractNamespaceFromCategoryName:v10 error:a6];
  if (!v12)
  {
    id v25 = 0;
    goto LABEL_24;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  if (![v9 count])
  {
LABEL_16:
    id v25 = v13;
    goto LABEL_23;
  }
  v35 = a6;
  id v36 = v10;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  v16 = (os_log_t *)MEMORY[0x1E4F4E380];
  while (1)
  {
    v17 = [v9 objectAtIndex:v15];
    if (![v17 count])
    {
      os_log_t v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = NSNumber;
        v22 = v20;
        v23 = [v21 numberWithUnsignedInteger:v15];
        *(_DWORD *)buf = 136315650;
        v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
        __int16 v40 = 2112;
        v41 = v23;
        __int16 v42 = 2112;
        v43 = v36;
        _os_log_debug_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile has empty entity words at item index: %@ under category: %@", buf, 0x20u);
      }
      goto LABEL_12;
    }
    id v37 = 0;
    v18 = [v11 vocabularyItemFromSpeechWords:v17 speechNamespace:v12 error:&v37];
    id v19 = v37;
    if (v19) {
      break;
    }
    if (v18) {
      [v13 addObject:v18];
    }
    else {
      ++v14;
    }

LABEL_12:
    if (++v15 >= (unint64_t)[v9 count])
    {
      id v10 = v36;
      if (v14)
      {
        os_log_t v24 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
        {
          v32 = NSNumber;
          v33 = v24;
          v34 = [v32 numberWithUnsignedInteger:v14];
          *(_DWORD *)buf = 136315906;
          v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
          __int16 v40 = 2112;
          v41 = v34;
          __int16 v42 = 2112;
          v43 = v12;
          __int16 v44 = 2112;
          v45 = v36;
          _os_log_debug_impl(&dword_1B8CCB000, v33, OS_LOG_TYPE_DEBUG, "%s Skipped %@ vocabulary items with namespace: %@ in category: %@", buf, 0x2Au);
        }
      }
      goto LABEL_16;
    }
  }
  v26 = v19;
  os_log_t v27 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    v29 = NSNumber;
    v30 = v27;
    v31 = [v29 numberWithUnsignedInteger:v15];
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
    __int16 v40 = 2112;
    v41 = v31;
    __int16 v42 = 2112;
    v43 = v36;
    __int16 v44 = 2112;
    v45 = v26;
    _os_log_error_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_ERROR, "%s Conversion to vocabulary item at index: %@ in category: %@ failed with error: %@", buf, 0x2Au);
  }
  if (v35) {
    id *v35 = v26;
  }

  id v25 = 0;
  id v10 = v36;
LABEL_23:

LABEL_24:

  return v25;
}

+ (id)_extractNamespaceFromCategoryName:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = 0;
  v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?<=urn:)(.+)(?=:)" options:1 error:&v18];
  id v7 = v18;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28228];
      id v11 = [NSString stringWithFormat:@"Failed to extract namespace from category name: %@", v5];
      os_log_t v20 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      v13 = [v10 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:2 userInfo:v12];
      uint64_t v14 = v13;
      if (a4 && v13) {
        *a4 = v13;
      }

      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = objc_msgSend(v5, "substringWithRange:", v8, v9);
    }
  }
  else
  {
    v16 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[CESRRawSpeechProfileExtractor _extractNamespaceFromCategoryName:error:]";
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create regular expression, error: %@", buf, 0x16u);
    }
    uint64_t v15 = 0;
    if (a4 && v7)
    {
      uint64_t v15 = 0;
      *a4 = v7;
    }
  }

  return v15;
}

+ (id)_extractEntitiesFromCategoryData:(id)a3 categoryName:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (![v6 count])
  {
LABEL_15:
    id v16 = v7;
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  v34 = v7;
  id v35 = v6;
  while (1)
  {
    uint64_t v9 = [v6 objectAtIndex:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 objectForKey:@"attributes"];
      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28228];
      os_log_t v27 = NSString;
      v28 = [NSNumber numberWithUnsignedInteger:v8];
      v29 = [v27 stringWithFormat:@"rawSpeechProfile has malformed entity words array at index: %@ in category: %@", v28, v36];
      v40[0] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      v31 = [v26 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v30];
      v32 = v31;
      if (a5 && v31) {
        *a5 = v31;
      }

      id v16 = 0;
      goto LABEL_20;
    }
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    if ([v10 count]) {
      break;
    }
LABEL_13:
    id v7 = v34;
    [v34 addObject:v11];

    id v6 = v35;
LABEL_14:

    if (++v8 >= (unint64_t)[v6 count]) {
      goto LABEL_15;
    }
  }
  uint64_t v12 = 0;
  while (1)
  {
    v13 = [v10 objectAtIndex:v12];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v14 = [[CESRRawSpeechProfileWord alloc] initWithSpeechWordDictionary:v13];
    if (!v14) {
      break;
    }
    uint64_t v15 = v14;
    [v11 addObject:v14];

    if (++v12 >= (unint64_t)[v10 count]) {
      goto LABEL_13;
    }
  }
  v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v37 = *MEMORY[0x1E4F28228];
  id v18 = NSString;
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v8];
  os_log_t v20 = [NSNumber numberWithUnsignedInteger:v12];
  v21 = [v18 stringWithFormat:@"rawSpeechProfile has malformed entity word dictionary at item index: %@ word index: %@ in category: %@", v19, v20, v36];
  v38 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  __int16 v23 = [v17 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v22];
  id v24 = v23;
  if (a5 && v23) {
    *a5 = v23;
  }

  id v16 = 0;
  id v7 = v34;
  id v6 = v35;
LABEL_20:

  return v16;
}

+ (BOOL)_isValidCategoryWithName:(id)a3 data:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v9 = 1;
      goto LABEL_10;
    }
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    os_log_t v20 = NSString;
    v21 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v21);
    v22 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v22);
    id v16 = [v20 stringWithFormat:@"rawSpeechProfile has unexpected value class for category: %@. Found: %@ expected: %@", v7, v13, v15, v27];
    v28 = v16;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = &v28;
    uint64_t v19 = &v27;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    id v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = [v11 stringWithFormat:@"rawSpeechProfile contains category name with unrecognized format. Found: %@ expected: %@", v13, v15];
    v30[0] = v16;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = (void **)v30;
    uint64_t v19 = &v29;
  }
  __int16 v23 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
  id v24 = [v10 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v23];
  uint64_t v25 = v24;
  if (a5 && v24) {
    *a5 = v24;
  }

  BOOL v9 = 0;
LABEL_10:

  return v9;
}

+ (id)_dictionaryFromUserDataArray:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    id obj = v6;
LABEL_3:
    id v10 = v5;
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v36 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      v13 = [v12 objectForKey:@"categoryName"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v43 = *MEMORY[0x1E4F28228];
        uint64_t v27 = NSString;
        v28 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v28);
        uint64_t v29 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v29);
        __int16 v23 = [v27 stringWithFormat:@"rawSpeechProfile has unexpected category name value class: %@ expected: %@", v21, v22];
        __int16 v44 = v23;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        v30 = [v26 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v25];
        v31 = v30;
        if (a4 && v30) {
          *a4 = v30;
        }

LABEL_22:
        id v5 = v10;
        id v6 = obj;
        goto LABEL_23;
      }
      uint64_t v14 = [v12 objectForKey:@"categoryData"];
      if (v14)
      {
        [v10 setObject:v14 forKey:v13];
      }
      else
      {
        uint64_t v15 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v40 = "+[CESRRawSpeechProfileExtractor _dictionaryFromUserDataArray:error:]";
          __int16 v41 = 2112;
          __int16 v42 = v13;
          _os_log_debug_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_DEBUG, "%s Skipping category with name: %@ found to have no category data.", buf, 0x16u);
        }
      }

      if (v8 == ++v11)
      {
        id v6 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
        id v5 = v10;
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    id v18 = NSString;
    uint64_t v19 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v19);
    os_log_t v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = [v18 stringWithFormat:@"rawSpeechProfile has unexpected category class: %@ expected: %@", v13, v21];
    uint64_t v46 = v22;
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v24 = [v17 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v23];
    id v25 = v24;
    if (!a4) {
      goto LABEL_22;
    }
    id v5 = v10;
    id v6 = obj;
    if (v24)
    {
      id v25 = v24;
      *a4 = v25;
    }
LABEL_23:

    id v16 = 0;
    goto LABEL_24;
  }
LABEL_14:

  id v16 = v5;
LABEL_24:

  return v16;
}

+ (id)_extractUserDataFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:@"userData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [(id)objc_opt_class() _dictionaryFromUserDataArray:v6 error:a4];
      }
      else
      {
        id v7 = v6;
        id v6 = v7;
      }
      uint64_t v11 = v7;
      goto LABEL_16;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v14);
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = [v13 stringWithFormat:@"rawSpeechProfile user data value for key: %@ has unexpected class: %@ expected %@ or %@", @"userData", v10, v16, v18];
    id v25 = v19;
    os_log_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v21 = [v12 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v20];
    v22 = v21;
    if (a4 && v21) {
      *a4 = v21;
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    v27[0] = @"rawSpeechProfile is nil or not an instance of NSDictionary.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v9 = [v8 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v6];
    id v10 = v9;
    if (a4 && v9) {
      *a4 = v9;
    }
  }

  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

+ (id)extractItemsFromRawSpeechProfile:(id)a3 converter:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(id)objc_opt_class() _extractUserDataFromRawSpeechProfile:v7 error:a5];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v9 allKeys];
    uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v28 = *(void *)v30;
      id v25 = v7;
      uint64_t v26 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = v9;
          id v16 = objc_msgSend(v9, "objectForKey:", v14, v25);
          if (![(id)objc_opt_class() _isValidCategoryWithName:v14 data:v16 error:a5]) {
            goto LABEL_17;
          }
          v17 = [v8 speechCategoryId];
          int v18 = [v14 hasSuffix:v17];

          if (v18)
          {
            uint64_t v19 = [(id)objc_opt_class() _extractEntitiesFromCategoryData:v16 categoryName:v14 error:a5];
            if (!v19) {
              goto LABEL_17;
            }
            os_log_t v20 = (void *)v19;
            uint64_t v21 = [(id)objc_opt_class() _convertItemsFromEntities:v19 categoryName:v14 converter:v8 error:a5];
            if (!v21)
            {

LABEL_17:
              id v23 = 0;
              uint64_t v9 = v15;
              id v7 = v25;
              id v10 = v26;
              goto LABEL_18;
            }
            v22 = (void *)v21;
            [v26 addObjectsFromArray:v21];
          }
          uint64_t v9 = v15;
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        id v7 = v25;
        id v10 = v26;
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v23 = v10;
LABEL_18:
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)extractLocaleFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:@"language"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
      goto LABEL_12;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    id v10 = [NSString stringWithFormat:@"rawSpeechProfile is missing locale identifier with key: %@", @"language", *MEMORY[0x1E4F28228]];
    v17 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v13 = [v11 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v12];
    uint64_t v14 = v13;
    if (a4 && v13) {
      *a4 = v13;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"rawSpeechProfile is nil or not an instance of NSDictionary.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v9 = [v8 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v6];
    id v10 = v9;
    if (a4 && v9) {
      *a4 = v9;
    }
  }

  id v7 = 0;
LABEL_12:

  return v7;
}

@end