@interface NSObject(AXCollectionsExtensions)
- (id)ax_prettyDescription;
- (void)_ax_appendPrettyDescriptionToString:()AXCollectionsExtensions indentationString:visitedCollections:;
@end

@implementation NSObject(AXCollectionsExtensions)

- (void)_ax_appendPrettyDescriptionToString:()AXCollectionsExtensions indentationString:visitedCollections:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  int v11 = [a1 conformsToProtocol:&unk_1EDF73528];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1B, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", @"accumulatorString <%@: %p> was supposed to be a mutable string", v14, v15, v16, (uint64_t)v13);
  }
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1C, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", @"indentationString <%@: %p> was supposed to be a mutable string", v19, v20, v21, (uint64_t)v18);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/DataStructures/NSObject+AXCollectionsExtensions.m", (void *)0x1D, (uint64_t)"-[NSObject(AXCollectionsExtensions) _ax_appendPrettyDescriptionToString:indentationString:visitedCollections:]", @"visitedCollections <%@: %p> was supposed to be a mutable set", v24, v25, v26, (uint64_t)v23);
    }
    v27 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a1];
    if ([v10 containsObject:v27])
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      [v8 appendFormat:@"<%@: %p>", v29, a1];
    }
    else
    {
      [v10 addObject:v27];
      [(__CFString *)v9 appendString:@"    "];
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      char v52 = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 appendString:@"{"];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __110__NSObject_AXCollectionsExtensions___ax_appendPrettyDescriptionToString_indentationString_visitedCollections___block_invoke;
        v44[3] = &unk_1E56729B8;
        v48 = &v49;
        id v45 = v8;
        v46 = v9;
        id v47 = v10;
        [a1 enumerateKeysAndObjectsUsingBlock:v44];

        v31 = @"}";
        id v32 = v45;
      }
      else
      {
        [v8 appendString:@"["];
        v39 = v27;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v32 = a1;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v53 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v41 != v34) {
                objc_enumerationMutation(v32);
              }
              v36 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              if (!*((unsigned char *)v50 + 24))
              {
                *((unsigned char *)v50 + 24) = 1;
                [v8 appendString:@"\n"];
              }
              [v8 appendString:v9];
              objc_msgSend(v36, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", v8, v9, v10);
              [v8 appendString:@",\n"];
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v53 count:16];
          }
          while (v33);
        }

        v27 = v39;
        v31 = @"]";
      }

      uint64_t v37 = [@"    " length];
      -[__CFString deleteCharactersInRange:](v9, "deleteCharactersInRange:", [(__CFString *)v9 length] - v37, v37);
      [v10 removeObject:v27];
      if (*((unsigned char *)v50 + 24)) {
        v38 = v9;
      }
      else {
        v38 = @" ";
      }
      [v8 appendString:v38];
      [v8 appendString:v31];
      _Block_object_dispose(&v49, 8);
    }
  }
  else
  {
    v30 = objc_msgSend(a1, "ax_prettyDescription");
    if (v30) {
      [v8 appendString:v30];
    }
    else {
      [v8 appendFormat:@"%@", 0];
    }
  }
}

- (id)ax_prettyDescription
{
  if ([a1 conformsToProtocol:&unk_1EDF73528])
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EDF601D0];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EDF601D0];
    v4 = objc_opt_new();
    objc_msgSend(a1, "_ax_appendPrettyDescriptionToString:indentationString:visitedCollections:", v2, v3, v4);
  }
  else
  {
    v2 = [a1 description];
  }
  return v2;
}

@end