@interface PHPlaceholderImageHelper
+ (id)placeholderImageDataForImageSize:(CGSize)a3 qualityClass:(id)a4 dataSpecification:(PHAssetResourceTableDataSpecification *)a5;
@end

@implementation PHPlaceholderImageHelper

+ (id)placeholderImageDataForImageSize:(CGSize)a3 qualityClass:(id)a4 dataSpecification:(PHAssetResourceTableDataSpecification *)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = 0;
  v8 = (void *)MEMORY[0x1E4F8AAC8];
  id v9 = a4;
  v10 = [v8 sharedManager];
  v11 = [v9 backingImageFormat];

  v12 = objc_msgSend(v10, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", objc_msgSend(v11, "formatID"), (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20, (char *)&v19 + 4, width, height, &v19);

  if (a5)
  {
    int v13 = v21;
    int v15 = v20;
    int v14 = HIDWORD(v20);
    int v17 = v19;
    int v16 = HIDWORD(v19);
    a5->var0 = HIDWORD(v21);
    a5->var1 = v13;
    a5->var2 = v14;
    a5->var3 = v15;
    a5->var4 = v16;
    a5->var5 = v17;
    a5->var6 = 0;
  }

  return v12;
}

@end