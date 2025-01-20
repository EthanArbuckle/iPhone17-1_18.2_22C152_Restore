@interface BSUIMapKitBrandDataSourceObjcShim
- (BSOpaqueWrapper)opaqueWrapper;
- (BSUIMapKitBrandDataSourceObjcShim)init;
@end

@implementation BSUIMapKitBrandDataSourceObjcShim

- (BSOpaqueWrapper)opaqueWrapper
{
  return (BSOpaqueWrapper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___BSUIMapKitBrandDataSourceObjcShim_opaqueWrapper));
}

- (BSUIMapKitBrandDataSourceObjcShim)init
{
  return (BSUIMapKitBrandDataSourceObjcShim *)MapKitBrandDataSourceObjcShim.init()();
}

- (void).cxx_destruct
{
}

@end