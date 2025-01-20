@interface VNFaceCoreExceptionUtils
+ (void)throwInvalidArgumentException:(id)a3;
+ (void)throwRuntimeErrorException:(id)a3;
@end

@implementation VNFaceCoreExceptionUtils

+ (void)throwInvalidArgumentException:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_FacecoreThrowi.isa, v3);
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, (const char *)[v3 UTF8String]);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
  __cxa_throw(exception, (struct type_info *)off_1E6C28C68, MEMORY[0x1E4FBA1E8]);
}

+ (void)throwRuntimeErrorException:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_FacecoreThrowi_0.isa, v3);
  exception = __cxa_allocate_exception(0x10uLL);
  MEMORY[0x1E0196B30](exception, [v3 UTF8String]);
  __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
}

@end