@interface CGPDFNodeCreateImageData
@end

@implementation CGPDFNodeCreateImageData

uint64_t (*__CGPDFNodeCreateImageData_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(void)
{
  if (CGLibraryLoadImageIODYLD_once != -1) {
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_5_21597);
  }
  if (!CGLibraryLoadImageIODYLD_handle) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageDestinationFinalize");
  }
  result = (uint64_t (*)(void))dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageDestinationFinalize");
  if (!result) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageDestinationFinalize");
  }
  CGPDFNodeCreateImageData_f_43 = result;
  return result;
}

@end