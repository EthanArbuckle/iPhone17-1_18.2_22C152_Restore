@interface VNFgBgPreProcessing
+ (vImage_Buffer)rescaleImage:(SEL)a3 toWidth:(vImage_Buffer *)a4 toHeight:(unint64_t)a5;
@end

@implementation VNFgBgPreProcessing

+ (vImage_Buffer)rescaleImage:(SEL)a3 toWidth:(vImage_Buffer *)a4 toHeight:(unint64_t)a5
{
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  ImageProcessing_reallocVImageBuffer((uint64_t)retstr, a5, a6, 4);

  return (vImage_Buffer *)vImageScale_ARGB8888(a4, retstr, 0, 0x20u);
}

@end