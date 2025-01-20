@interface CNCroppedImageDataHelper
+ (BOOL)croppedImageDataAvailableForContact:(id)a3;
+ (id)descriptorForRequiredKeys;
- (CNContactStore)contactStore;
- (CNCroppedImageDataHelper)initWithContactStore:(id)a3;
- (id)croppedImageDataForContact:(id)a3;
- (id)squareImageData:(id)a3;
@end

@implementation CNCroppedImageDataHelper

+ (id)descriptorForRequiredKeys
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"thumbnailImageData";
  v7[1] = @"cropRect";
  v7[2] = @"imageDataAvailable";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  v4 = [a1 description];
  v5 = +[CNContact descriptorWithKeyDescriptors:v3 description:v4];

  return v5;
}

- (CNCroppedImageDataHelper)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCroppedImageDataHelper;
  v6 = [(CNCroppedImageDataHelper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)croppedImageDataAvailableForContact:(id)a3
{
  id v3 = a3;
  if ([v3 imageDataAvailable])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F5A268];
    v6 = [v3 thumbnailImageData];
    int v4 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;
  }
  return v4;
}

- (id)croppedImageDataForContact:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() croppedImageDataAvailableForContact:v4])
  {
    uint64_t v5 = [v4 thumbnailImageData];
    if (v5
      && (v6 = (void *)v5,
          [v4 thumbnailImageData],
          v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 length],
          v7,
          v6,
          v8))
    {
      v9 = [v4 thumbnailImageData];
      objc_super v10 = [(CNCroppedImageDataHelper *)self squareImageData:v9];
    }
    else
    {
      if ([v4 isKeyAvailable:@"imageData"])
      {
        id v11 = v4;
      }
      else
      {
        v12 = [(CNCroppedImageDataHelper *)self contactStore];
        v13 = [v4 identifier];
        v21[0] = @"imageData";
        v21[1] = @"cropRect";
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
        id v11 = [v12 unifiedContactWithIdentifier:v13 keysToFetch:v14 error:0];
      }
      objc_super v10 = [v11 imageData];

      if (v10)
      {
        v15 = [v11 imageData];
        [v11 cropRect];
        objc_super v10 = CNImageUtilsCroppedImageDataFromFullSizeImageData(v15, 0, v16, v17, v18, v19);
      }
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)squareImageData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = v3;
  if (!v3)
  {
    v15 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = CGImageSourceCreateWithData(v3, 0);
  if (v5)
  {
    v6 = v5;
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
    uint64_t v8 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v8 doubleValue];
    double v10 = v9;

    id v11 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v11 doubleValue];
    double v13 = v12;

    if (vabdd_f64(v10, v13) <= 1.0)
    {
      CFRelease(v6);
      v15 = v4;
      goto LABEL_14;
    }
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
    CFRelease(v6);
  }
  else
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(0, 0, 0);
    double v13 = 0.0;
    double v10 = 0.0;
  }
  if (v10 >= v13) {
    double v16 = v13;
  }
  else {
    double v16 = v10;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v19 = v16;
  v20 = CGImageCreateWithImageInRect(ImageAtIndex, *(CGRect *)(&v16 - 2));
  CGImageRelease(ImageAtIndex);
  v15 = (__CFData *)objc_opt_new();
  CGImageDestinationRef v21 = CGImageDestinationCreateWithData(v15, @"public.jpeg", 1uLL, 0);
  if (v21)
  {
    v22 = v21;
    v23 = [MEMORY[0x1E4F1CA60] dictionary];
    [v23 setObject:&unk_1EE089428 forKeyedSubscript:*MEMORY[0x1E4F2F430]];
    CGImageDestinationAddImage(v22, v20, (CFDictionaryRef)v23);
    CGImageDestinationFinalize(v22);
    CFRelease(v22);
  }
  CGImageRelease(v20);
LABEL_14:

  return v15;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end