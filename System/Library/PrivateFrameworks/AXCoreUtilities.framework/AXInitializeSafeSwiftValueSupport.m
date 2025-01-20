@interface AXInitializeSafeSwiftValueSupport
@end

@implementation AXInitializeSafeSwiftValueSupport

void ___AXInitializeSafeSwiftValueSupport_block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = objc_opt_class();
  _bulkAddMethodsFromClass(v0, v1);
  Class v2 = NSClassFromString(&cfstr_Ttcs12Swiftobj.isa);
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    v4 = (objc_class *)objc_opt_class();
    _bulkAddMethodsFromClass(v4, v3);
  }
}

@end