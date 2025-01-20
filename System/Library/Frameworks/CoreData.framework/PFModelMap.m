@interface PFModelMap
@end

@implementation PFModelMap

uint64_t __35___PFModelMap_initWithClientModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "ancillaryEntityOffset"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "ancillaryEntityOffset"));

  return [v4 compare:v5];
}

uint64_t __43___PFModelMap_ancillaryModelFactoryClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  _MergedGlobals_81 = result;
  return result;
}

@end