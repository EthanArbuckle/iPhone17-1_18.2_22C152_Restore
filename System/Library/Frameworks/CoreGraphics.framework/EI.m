@interface EI
@end

@implementation EI

void *__op_EI_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (CGLibraryLoadImageIODYLD_once != -1) {
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_5_21597);
  }
  if (!CGLibraryLoadImageIODYLD_handle) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageSourceCreateImageAtIndex");
  }
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageSourceCreateImageAtIndex");
  if (!result) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageSourceCreateImageAtIndex");
  }
  op_EI_f_85 = (uint64_t (*)(void, void, void))result;
  return result;
}

void *__op_EI_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (CGLibraryLoadImageIODYLD_once != -1) {
    dispatch_once(&CGLibraryLoadImageIODYLD_once, &__block_literal_global_5_21597);
  }
  if (!CGLibraryLoadImageIODYLD_handle) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 28, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "handle != NULL", "Handle for \"%s\" failed to load", a6, a7, a8, (char)"CGImageSourceCreateWithData");
  }
  result = dlsym((void *)CGLibraryLoadImageIODYLD_handle, "CGImageSourceCreateWithData");
  if (!result) {
    _CGHandleAssert("CGLibraryLoadImageIOFunction", 30, "/Library/Caches/com.apple.xbs/Sources/CoreGraphics/CoreGraphics/Images/CGImageIO.h", "ptr != NULL", "Could not find symbol \"%s\" in library handle %p", v9, v10, v11, (char)"CGImageSourceCreateWithData");
  }
  op_EI_f = (uint64_t (*)(void, void))result;
  return result;
}

@end