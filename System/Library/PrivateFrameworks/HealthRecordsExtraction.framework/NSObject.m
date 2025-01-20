@interface NSObject
@end

@implementation NSObject

id __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id obj = 0;
    v7 = +[HDHealthRecordsExtractionUtilities resourceReferencedBy:a2 containedIn:v6 error:&obj];
    objc_storeStrong(v3, obj);
    v5 = [v7 JSONObject];
  }
  return v5;
}

uint64_t __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __65__NSObject_HealthRecordUtils__hd_handleExtensionComponent_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 JSONDictionary];
}

@end