@interface NSJSONSerialization
@end

@implementation NSJSONSerialization

void __66__NSJSONSerialization_HealthKit__hk_JSONObjectSecureCodingClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v8 = (id)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  Class v5 = NSClassFromString(&cfstr_Nsjsonroundtri.isa);
  if (v5) {
    [v8 addObject:v5];
  }
  uint64_t v6 = [v8 copy];
  v7 = (void *)hk_JSONObjectSecureCodingClasses_classes;
  hk_JSONObjectSecureCodingClasses_classes = v6;
}

@end