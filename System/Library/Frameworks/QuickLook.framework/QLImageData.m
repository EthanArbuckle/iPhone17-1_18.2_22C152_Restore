@interface QLImageData
- (CGSize)size;
- (QLImageData)initWithImageSource:(CGImageSource *)a3;
- (id)durations;
- (id)imageAtIndex:(unint64_t)a3;
- (id)type;
- (int64_t)orientation;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation QLImageData

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)QLImageData;
  [(QLImageData *)&v4 dealloc];
}

- (QLImageData)initWithImageSource:(CGImageSource *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLImageData;
  objc_super v4 = [(QLImageData *)&v8 init];
  v5 = v4;
  v6 = 0;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_imageSource = a3;
    v6 = v5;
  }

  return v6;
}

- (id)imageAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(QLImageData *)self count];
  if (v5 <= a3) {
    goto LABEL_6;
  }
  unint64_t v6 = v5;
  int64_t v7 = [(QLImageData *)self orientation];
  objc_super v8 = [MEMORY[0x263F82B60] mainScreen];
  [v8 scale];
  double v10 = v9;

  if (v6 >= 2)
  {
    [(QLImageData *)self size];
    QLGetScaleForAnimatedImageWithSize();
    double v10 = v11;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, a3, 0);
  if (ImageAtIndex)
  {
    CGImageRef v13 = ImageAtIndex;
    v14 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:ImageAtIndex scale:v7 orientation:v10];
    CFRelease(v13);
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (id)durations
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(QLImageData *)self count];
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_28;
  }
  if (v3 == 1)
  {
    id v4 = &unk_26C913340;
    goto LABEL_28;
  }
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v3];
  unint64_t v6 = (void *)MEMORY[0x263F1D920];
  int64_t v7 = [(QLImageData *)self type];
  objc_super v8 = [v6 typeWithIdentifier:v7];

  if ([v8 conformsToType:*MEMORY[0x263F1DAD0]])
  {
    double v9 = (id *)MEMORY[0x263F0F370];
  }
  else if ([v8 conformsToType:*MEMORY[0x263F1DC08]])
  {
    double v9 = (id *)MEMORY[0x263F0F4E0];
  }
  else if ([v8 conformsToType:*MEMORY[0x263F1DAE8]])
  {
    double v9 = (id *)MEMORY[0x263F0F450];
  }
  else
  {
    if (![v8 conformsToType:*MEMORY[0x263F1DD78]])
    {
      v25 = [MEMORY[0x263F1D920] typeWithIdentifier:@"public.heics"];
      if (v25 && [v8 conformsToType:v25]) {
        id v10 = (id)*MEMORY[0x263F0F430];
      }
      else {
        id v10 = 0;
      }

      goto LABEL_14;
    }
    double v9 = (id *)MEMORY[0x263F0F570];
  }
  id v10 = *v9;
LABEL_14:
  CFDictionaryRef v11 = CGImageSourceCopyProperties(self->_imageSource, 0);
  v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:v10];
  CGImageRef v13 = [v12 objectForKeyedSubscript:@"FrameInfo"];

  if (v13)
  {
    id v26 = v10;
    v27 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "objectForKeyedSubscript:", @"DelayTime", v26, v27, (void)v28);
          [v19 doubleValue];
          double v21 = v20;

          if (v21 >= 0.0109999999) {
            double v22 = v21;
          }
          else {
            double v22 = 0.100000001;
          }
          v23 = [NSNumber numberWithDouble:v22];
          [v5 addObject:v23];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    id v4 = v5;
    id v10 = v26;
    objc_super v8 = v27;
  }
  else
  {
    id v4 = &unk_26C913358;
  }

LABEL_28:

  return v4;
}

- (int64_t)orientation
{
  if (self->_imageSource && [(QLImageData *)self count])
  {
    CFDictionaryRef v3 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
    CFDictionaryRef v4 = v3;
    if (!v3)
    {
      int64_t v10 = 0;
LABEL_16:

      return v10;
    }
    CFDictionaryRef v5 = v3;
    uint64_t v6 = *MEMORY[0x263F0F4C8];
    int64_t v7 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x263F0F4C8]];
    if (!v7)
    {
      objc_super v8 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x263F0F518]];
      int64_t v7 = [v8 objectForKey:v6];

      if (!v7) {
        goto LABEL_12;
      }
    }
    uint64_t v9 = [v7 integerValue];
    switch(v9)
    {
      case 3:
        int64_t v10 = 1;
        break;
      case 8:
        int64_t v10 = 2;
        break;
      case 6:
        int64_t v10 = 3;
        break;
      default:
LABEL_12:
        int64_t v10 = 0;
        break;
    }

    goto LABEL_16;
  }
  return 0;
}

- (CGSize)size
{
  double v2 = 0.0;
  if (self->_imageSource)
  {
    double v4 = 0.0;
    if ([(QLImageData *)self count])
    {
      CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, 0, 0);
      CFDictionaryRef v6 = v5;
      if (v5)
      {
        int64_t v7 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x263F0F4F8]];
        [v7 floatValue];
        double v4 = v8;
        uint64_t v9 = [(__CFDictionary *)v6 objectForKey:*MEMORY[0x263F0F4F0]];
        [v9 floatValue];
        double v2 = v10;
      }
    }
  }
  else
  {
    double v4 = 0.0;
  }
  double v11 = v4;
  double v12 = v2;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)count
{
  return CGImageSourceGetCount(self->_imageSource);
}

- (id)type
{
  return (id)CGImageSourceGetType(self->_imageSource);
}

@end