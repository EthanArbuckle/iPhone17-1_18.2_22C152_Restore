@interface NSCoder(SCNExtensions)
- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions containingNestedContainersForKey:;
- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions forKey:;
- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions containingNestedContainersForKey:;
- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions forKey:;
- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:containingNestedContainersForKey:;
- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:forKey:;
- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:containingNestedContainersForKey:;
- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:forKey:;
- (uint64_t)scn_decodeObjectOfClass:()SCNExtensions forKey:;
- (uint64_t)scn_decodeObjectOfClasses:()SCNExtensions forKey:;
@end

@implementation NSCoder(SCNExtensions)

- (uint64_t)scn_decodeObjectOfClass:()SCNExtensions forKey:
{
  uint64_t v1 = objc_msgSend(a1, "decodeObjectOfClass:forKey:");
  if (objc_opt_isKindOfClass()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)scn_decodeObjectOfClasses:()SCNExtensions forKey:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v11;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v11 != v7) {
      objc_enumerationMutation(a3);
    }
    if (objc_opt_isKindOfClass()) {
      return v4;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions forKey:
{
  if ([a1 requiresSecureCoding])
  {
    return [a1 decodeArrayOfObjectsOfClass:a3 forKey:a4];
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), a3, 0);
    return [a1 decodeObjectOfClasses:v8 forKey:a4];
  }
}

- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions forKey:
{
  if ([a1 requiresSecureCoding])
  {
    return [a1 decodeArrayOfObjectsOfClasses:a3 forKey:a4];
  }
  else
  {
    uint64_t v8 = [a3 setByAddingObject:objc_opt_class()];
    return [a1 decodeObjectOfClasses:v8 forKey:a4];
  }
}

- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions containingNestedContainersForKey:
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  v10[0] = objc_opt_class();
  v10[1] = a3;
  uint64_t v8 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 2)), a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v8;
  }
  else {
    return 0;
  }
}

- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions containingNestedContainersForKey:
{
  uint64_t v4 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "setByAddingObject:", objc_opt_class()), a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v4;
  }
  else {
    return 0;
  }
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:forKey:
{
  if ([a1 requiresSecureCoding])
  {
    return [a1 decodeDictionaryWithKeysOfClass:a3 objectsOfClass:a4 forKey:a5];
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), a3, a4, 0);
    return [a1 decodeObjectOfClasses:v10 forKey:a5];
  }
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:forKey:
{
  if ([a1 requiresSecureCoding])
  {
    return [a1 decodeDictionaryWithKeysOfClasses:a3 objectsOfClasses:a4 forKey:a5];
  }
  else
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4), "setByAddingObject:", objc_opt_class());
    return [a1 decodeObjectOfClasses:v10 forKey:a5];
  }
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:containingNestedContainersForKey:
{
  v12[3] = *MEMORY[0x263EF8340];
  v9 = (void *)MEMORY[0x263EFFA08];
  v12[0] = objc_opt_class();
  v12[1] = a3;
  v12[2] = a4;
  uint64_t v10 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 3)), a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v10;
  }
  else {
    return 0;
  }
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:containingNestedContainersForKey:
{
  uint64_t v5 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4), "setByAddingObject:", objc_opt_class()), a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v5;
  }
  else {
    return 0;
  }
}

@end