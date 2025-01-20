@interface CIFilterClassAttributes
+ (id)_attributesWithClass:(Class)a3;
+ (id)cache;
+ (id)classAttributesForClass:(Class)a3;
+ (id)classAttributesForName:(id)a3;
+ (void)clearCache;
@end

@implementation CIFilterClassAttributes

+ (id)_attributesWithClass:(Class)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (![(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 0;
  }
  CustomAttributes = (void *)getCustomAttributes(a3);
  v41 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v39 = NSStringFromClass(a3);
  v5 = (void *)bundleForCIFilter();
  v37 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:a3];
  int IsBuiltinFilter = classIsBuiltinFilter(a3);
  if (IsBuiltinFilter) {
    int IsSystemFilter = 1;
  }
  else {
    int IsSystemFilter = classIsSystemFilter(a3);
  }
  uint64_t v6 = [CustomAttributes valueForKey:@"CIAttributeFilterName"];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (uint64_t)v39;
  }
  [v41 setValue:v7 forKey:@"CIAttributeFilterName"];
  uint64_t v8 = [CustomAttributes valueForKey:@"CIAttributeFilterDisplayName"];
  char v9 = IsBuiltinFilter ^ 1;
  if (v8) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0) {
    uint64_t v8 = [v5 localizedStringForKey:v39 value:0 table:@"Filters"];
  }
  if (!v8) {
    uint64_t v8 = [v37 localizedStringForKey:v39 value:0 table:@"Filters"];
  }
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = (uint64_t)v39;
  }
  [v41 setValue:v10 forKey:@"CIAttributeFilterDisplayName"];
  uint64_t v11 = objc_msgSend(CustomAttributes, "valueForKey:");
  if (v11) {
    [v41 setValue:v11 forKey:@"CIAttributeDescription"];
  }
  id v12 = +[CIFilterClassCategories classCategoriesForClass:a3];
  if (v12) {
    [v41 setValue:v12 forKey:@"CIAttributeFilterCategories"];
  }
  uint64_t v13 = [CustomAttributes valueForKey:@"CIAttributeFilterAvailable_iOS"];
  if (v13) {
    int v14 = IsSystemFilter;
  }
  else {
    int v14 = 0;
  }
  if (v14 == 1) {
    [v41 setValue:v13 forKey:@"CIAttributeFilterAvailable_iOS"];
  }
  uint64_t v15 = [CustomAttributes valueForKey:@"CIAttributeFilterAvailable_Mac"];
  if (v15) {
    int v16 = IsSystemFilter;
  }
  else {
    int v16 = 0;
  }
  if (v16 == 1) {
    [v41 setValue:v15 forKey:@"CIAttributeFilterAvailable_Mac"];
  }
  uint64_t v17 = [CustomAttributes valueForKey:@"CIAttributeReferenceDocumentation"];
  if (v17) {
    int v18 = 0;
  }
  else {
    int v18 = IsSystemFilter;
  }
  if (v18 == 1)
  {
    uint64_t v19 = [NSString stringWithFormat:@"http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/%@", v39];
    uint64_t v17 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
  }
  if (v17) {
    [v41 setValue:v17 forKey:@"CIAttributeReferenceDocumentation"];
  }
  id v20 = +[CIFilterClassInfo classInfoForClass:a3];
  if (objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "count"))
  {
    uint64_t v21 = 0;
    id v35 = v20;
    v36 = v5;
    while (1)
    {
      v22 = (NSString *)objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "objectAtIndexedSubscript:", v21);
      v23 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      uint64_t StdAttrsForKey = getStdAttrsForKey(v22);
      if (StdAttrsForKey) {
        [v23 addEntriesFromDictionary:StdAttrsForKey];
      }
      v25 = (__CFString *)objc_msgSend((id)objc_msgSend(v20, "inputClasses"), "objectAtIndexedSubscript:", v21);
      if ([(__CFString *)v25 length])
      {
        if ([(__CFString *)v25 isEqualToString:@"__WrappedNSNumber"]) {
          v25 = @"NSNumber";
        }
        [v23 setValue:v25 forKey:@"CIAttributeClass"];
      }
      if (IsBuiltinFilter) {
        break;
      }
      uint64_t v30 = [(NSString *)v22 substringFromIndex:5];
      if ((IsSystemFilter & 1) == 0)
      {
        v28 = v23;
        v29 = (void *)v30;
        v32 = @"CIAttributeDisplayName";
        goto LABEL_60;
      }
      [v23 setValue:objc_msgSend(v37, "localizedStringForKey:value:table:", objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v39, v22), v30, @"Filters", @"CIAttributeDisplayName" forKey];
      id v20 = v35;
      v5 = v36;
      uint64_t v31 = [v37 localizedStringForKey:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@.description", v39, v22), 0, @"Filters" value table];
      if (v31)
      {
        v29 = (void *)v31;
        v28 = v23;
        goto LABEL_58;
      }
LABEL_61:
      uint64_t v33 = [CustomAttributes valueForKey:v22];
      if (v33) {
        [v23 addEntriesFromDictionary:v33];
      }
      [v41 setValue:v23 forKey:v22];
      if (objc_msgSend((id)objc_msgSend(v20, "inputKeys"), "count") <= (unint64_t)++v21) {
        goto LABEL_64;
      }
    }
    if (![v23 objectForKey:@"CIAttributeType"])
    {
      if ([(__CFString *)v25 isEqual:@"CIColor"]) {
        [v23 setValue:@"CIAttributeTypeColor" forKey:@"CIAttributeType"];
      }
      if ([(__CFString *)v25 isEqual:@"CIImage"]) {
        [v23 setValue:@"CIAttributeTypeImage" forKey:@"CIAttributeType"];
      }
    }
    objc_msgSend(v23, "setValue:forKey:", objc_msgSend(v5, "localizedStringForKey:value:table:", v22, -[NSString substringFromIndex:](v22, "substringFromIndex:", 5), @"Keys"), @"CIAttributeDisplayName");
    uint64_t v26 = [v5 localizedStringForKey:v22 value:@"<none>" table:@"Descriptions"];
    v27 = (void *)[v5 localizedStringForKey:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v39, v22), v26, @"Descriptions" value table];
    if ([v27 isEqual:@"<none>"]) {
      goto LABEL_61;
    }
    v28 = v23;
    v29 = v27;
LABEL_58:
    v32 = @"CIAttributeDescription";
LABEL_60:
    [v28 setValue:v29 forKey:v32];
    goto LABEL_61;
  }
LABEL_64:
  if ((IsSystemFilter & 1) != 0 && ![v41 valueForKey:@"CIAttributeFilterCategories"])
  {
    v42[0] = @"CICategoryApplePrivate";
    objc_msgSend(v41, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v42, 1), @"CIAttributeFilterCategories");
  }
  return v41;
}

+ (id)classAttributesForClass:(Class)a3
{
  v4 = (void *)[a1 cache];
  v5 = (objc_class *)objc_opt_class();
  if (![(objc_class *)a3 isSubclassOfClass:v5]) {
    return 0;
  }
  if (v5 == a3) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  id v6 = (id)[v4 objectForKey:a3];
  if (!v6)
  {
    id v6 = +[CIFilterClassAttributes _attributesWithClass:a3];
    [v4 setObject:v6 forKey:a3];
  }
  return v6;
}

+ (id)cache
{
  if (+[CIFilterClassAttributes cache]::onceToken != -1) {
    dispatch_once(&+[CIFilterClassAttributes cache]::onceToken, &__block_literal_global_29);
  }
  return (id)+[CIFilterClassAttributes cache]::cache;
}

uint64_t __32__CIFilterClassAttributes_cache__block_invoke()
{
  +[CIFilterClassAttributes cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  [(id)+[CIFilterClassAttributes cache]::cache setName:@"com.apple.coreimage.nscache.CIFilterClassAttributes"];
  [(id)+[CIFilterClassAttributes cache]::cache setCountLimit:256];
  v0 = (void *)+[CIFilterClassAttributes cache]::cache;

  return [v0 setEvictsObjectsWhenApplicationEntersBackground:1];
}

+ (void)clearCache
{
  v2 = (void *)[a1 cache];

  [v2 removeAllObjects];
}

+ (id)classAttributesForName:(id)a3
{
  Class v4 = NSClassFromString((NSString *)a3);

  return (id)[a1 classAttributesForClass:v4];
}

@end