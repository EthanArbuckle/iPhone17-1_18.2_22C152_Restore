@interface NSDictionary(AXPropertyListCoersion)
- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion;
- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion;
@end

@implementation NSDictionary(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = a1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v3) {
    goto LABEL_17;
  }
  uint64_t v4 = v3;
  uint64_t v15 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v19 != v15) {
        objc_enumerationMutation(v2);
      }
      v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v7 = (void *)MEMORY[0x1BA9EDE10]();
      v8 = [v2 objectForKey:v6];
      if (objc_opt_respondsToSelector())
      {
        v9 = [v6 _axDictionaryKeyReplacementRepresentation];
        if (!v9)
        {

          id v12 = 0;
          v13 = v16;
          goto LABEL_18;
        }
      }
      else
      {
        v9 = [NSString stringWithFormat:@"%@", v6];
      }
      if (objc_opt_respondsToSelector())
      {
        id v17 = 0;
        v10 = [v8 _axRecursivelyPropertyListCoercedRepresentationWithError:&v17];
        id v11 = v17;
        if (v10) {
          goto LABEL_15;
        }
      }
      else
      {
        id v11 = 0;
      }
      v10 = &stru_1F141B5A8;
LABEL_15:
      [v16 setObject:v10 forKey:v9];
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v4);
LABEL_17:

  v13 = v16;
  id v12 = v16;
LABEL_18:

  return v12;
}

- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  id v4 = a1;
  v5 = [v4 objectForKey:@"SmugType"];
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t v6 = [v5 unsignedIntegerValue], v6 <= 9))
  {
    v7 = ((void (*)(id, id *))*(&off_1F1419B98 + v6))(v4, &v30);
  }
  else
  {
    v7 = 0;
  }

  id v8 = v30;
  v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else if (v8)
  {
    id v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v4 keyEnumerator];
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      v24 = 0;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v18 = objc_msgSend(v4, "objectForKey:", v17, v24);
          uint64_t v19 = [v17 _axReconstitutedRepresentationForDictionaryKeyReplacement];
          if (!v19) {
            goto LABEL_26;
          }
          long long v20 = (void *)v19;
          long long v21 = a3;
          uint64_t v22 = [v18 _axRecursivelyReconstitutedRepresentationFromPropertyListWithError:a3];
          if (!v22)
          {

LABEL_26:
            id v10 = 0;
            v9 = v24;
            goto LABEL_27;
          }
          uint64_t v23 = (void *)v22;
          [v12 setObject:v22 forKey:v20];

          a3 = v21;
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
        v9 = v24;
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v10 = v12;
LABEL_27:
  }
  return v10;
}

@end