@interface STKAnimatedStickerUtilities
+ (id)downSampledHeicsDataFromData:(id)a3 maxLength:(unint64_t)a4;
@end

@implementation STKAnimatedStickerUtilities

+ (id)downSampledHeicsDataFromData:(id)a3 maxLength:(unint64_t)a4
{
  v17[8] = *(CFTypeRef *)MEMORY[0x263EF8340];
  CFTypeRef arg = 0;
  id v4 = a3;
  v17[0] = 0;
  if (CMPhotoDecompressionSessionCreate()
    || (CFAutorelease(v17[0]), v16[0] = 0, CMPhotoDecompressionSessionCreateContainer())
    || (CFAutorelease(v16[0]), CMPhotoDecompressionContainerCreateSequenceContainer()))
  {

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  CFAutorelease(arg);

  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v12[0] = 0;
  if (CMPhotoCompressionSessionCreate()) {
    goto LABEL_5;
  }
  CFAutorelease(v12[0]);
  v8 = (const void *)*MEMORY[0x263F2F868];
  v16[0] = *(CFTypeRef *)MEMORY[0x263F2F870];
  v16[1] = v8;
  v17[0] = &unk_26FA2CAC8;
  v17[1] = &unk_26FA2CAE0;
  v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  if (CMPhotoCompressionSessionOpenEmptyContainer()
    || CMPhotoCompressionSessionStartImageSequence()
    || CMPhotoDecompressionContainerGetImageCountWithOptions()
    || CMPhotoDecompressionContainerCreateDictionaryDescription())
  {

    goto LABEL_5;
  }
  CFAutorelease(0);
  Value = (void *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x263F2F928]);

  id v11 = Value;
  if (CMPhotoCompressionSessionEndImageSequence()
    || (v12[0] = 0, CMPhotoCompressionSessionCloseContainerAndCopyBacking()))
  {
    v5 = 0;
  }
  else
  {
    v5 = (id)v12[0];
  }

LABEL_6:
  id v6 = v5;

  return v6;
}

@end