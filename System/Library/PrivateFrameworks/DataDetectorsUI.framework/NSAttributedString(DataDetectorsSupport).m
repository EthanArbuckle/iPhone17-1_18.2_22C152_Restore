@interface NSAttributedString(DataDetectorsSupport)
+ (uint64_t)dd_isTransientAttribute:()DataDetectorsSupport;
- (id)dd_contextAtLocation:()DataDetectorsSupport;
- (uint64_t)dd_resultAtLocation:()DataDetectorsSupport;
@end

@implementation NSAttributedString(DataDetectorsSupport)

+ (uint64_t)dd_isTransientAttribute:()DataDetectorsSupport
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = dd_transientAttributesSet();
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)dd_contextAtLocation:()DataDetectorsSupport
{
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:a1 forKey:@"TextStorage"];
  v6 = [a1 attribute:@"DDContext" atIndex:a3 effectiveRange:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 addEntriesFromDictionary:v6];
  }

  return v5;
}

- (uint64_t)dd_resultAtLocation:()DataDetectorsSupport
{
  id v3 = [a1 attribute:*MEMORY[0x1E4F5F118] atIndex:a3 effectiveRange:0];
  objc_opt_class();
  uint64_t v4 = 0;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 coreResult];
  }

  return v4;
}

@end