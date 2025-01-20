@interface __CTAdaptiveImageGlyphStorage
+ (id)adaptiveImageGlyphStorageWithContentIdentifier:(id)a3 imageContent:(id)a4;
+ (void)flushInstanceCache;
- (CGImageSource)imageSourceRef;
- (NSData)_RTFDImageData;
- (NSData)_fallbackImageData;
- (NSData)imageContent;
- (NSString)contentIdentifier;
- (NSString)imageDescription;
- (__CTAdaptiveImageGlyphStorage)initWithImageContent:(id)a3;
- (id)_nominalTextAttachment;
- (void)_setNominalTextAttachment:(id)a3;
- (void)dealloc;
@end

@implementation __CTAdaptiveImageGlyphStorage

+ (id)adaptiveImageGlyphStorageWithContentIdentifier:(id)a3 imageContent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_class();
  objc_sync_enter(v7);
  v8 = [(id)__CTAdaptiveImageGlyphStorageCache objectForKey:v6];

  if (v5)
  {
    if (!v8)
    {
      v8 = [[__CTAdaptiveImageGlyphStorage alloc] initWithImageContent:v5];
      if (v8)
      {
        v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
        if (__CTAdaptiveImageGlyphStorageCache)
        {
          if (v6) {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
          v11 = (void *)__CTAdaptiveImageGlyphStorageCache;
          __CTAdaptiveImageGlyphStorageCache = v10;

          v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
          if (v6) {
            goto LABEL_11;
          }
        }
        v12 = [(__CTAdaptiveImageGlyphStorage *)v8 contentIdentifier];
        v13 = [v9 objectForKey:v12];

        if (v13)
        {
          v14 = v13;

          v8 = v14;
LABEL_12:

          goto LABEL_13;
        }
        v9 = (void *)__CTAdaptiveImageGlyphStorageCache;
LABEL_11:
        v14 = [(__CTAdaptiveImageGlyphStorage *)v8 contentIdentifier];
        [v9 setObject:v8 forKey:v14];
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  objc_sync_exit(v7);

  return v8;
}

- (__CTAdaptiveImageGlyphStorage)initWithImageContent:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  v21.receiver = self;
  v21.super_class = (Class)__CTAdaptiveImageGlyphStorage;
  id v5 = [(__CTAdaptiveImageGlyphStorage *)&v21 init];
  if (!v5) {
    goto LABEL_14;
  }
  id v6 = CGImageSourceCreateWithData(v4, 0);
  v7 = v6;
  if (v6)
  {
    if (CGImageSourceGetCount(v6))
    {
      CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FD48]];
      id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FD58]];

      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      id v11 = 0;
    }
    CFRelease(v7);
    id v10 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  id v10 = 0;
  id v11 = 0;
LABEL_10:
  id v12 = v10;
  id v13 = v11;
  v5->_imageSourceRef = v7;
  if (v7)
  {
    uint64_t v14 = [(__CFData *)v4 copy];
    imageContent = v5->_imageContent;
    v5->_imageContent = (NSData *)v14;

    uint64_t v16 = [v12 copy];
    contentIdentifier = v5->_contentIdentifier;
    v5->_contentIdentifier = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    imageDescription = (__CTAdaptiveImageGlyphStorage *)v5->_imageDescription;
    v5->_imageDescription = (NSString *)v18;
  }
  else
  {
    imageDescription = v5;
    id v5 = 0;
  }

LABEL_14:
  return v5;
}

- (void)dealloc
{
  imageSourceRef = self->_imageSourceRef;
  if (imageSourceRef) {
    CFRelease(imageSourceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)__CTAdaptiveImageGlyphStorage;
  [(__CTAdaptiveImageGlyphStorage *)&v4 dealloc];
}

+ (void)flushInstanceCache
{
}

- (NSData)_fallbackImageData
{
  p_fallbackImageData = &self->_fallbackImageData;
  fallbackImageData = self->_fallbackImageData;
  if (fallbackImageData)
  {
    objc_super v4 = fallbackImageData;
  }
  else
  {
    id v6 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    CGImageDestinationRef v7 = CGImageDestinationCreateWithData(v6, @"public.png", 1uLL, 0);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      size_t Count = CGImageSourceGetCount(self->_imageSourceRef);
      if (Count)
      {
        size_t v10 = Count;
        size_t v11 = 0;
        uint64_t v12 = *MEMORY[0x1E4F2FCE8];
        size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        double v14 = 0.0;
        do
        {
          CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(self->_imageSourceRef, v11, 0);
          uint64_t v16 = [(__CFDictionary *)v15 objectForKeyedSubscript:v12];
          v17 = v16;
          if (v16)
          {
            [v16 doubleValue];
            if (v18 >= v14)
            {
              size_t v13 = v11;
              double v14 = v18;
            }
          }

          ++v11;
        }
        while (v10 != v11);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          CGImageDestinationAddImageFromSource(v8, self->_imageSourceRef, v13, 0);
          if (CGImageDestinationFinalize(v8)) {
            objc_storeStrong((id *)p_fallbackImageData, v6);
          }
        }
      }
      CFRelease(v8);
      objc_super v4 = *p_fallbackImageData;
    }
    else
    {
      objc_super v4 = 0;
    }
  }

  return v4;
}

- (NSData)_RTFDImageData
{
  p_RTFDImageData = &self->_RTFDImageData;
  RTFDImageData = self->_RTFDImageData;
  if (!RTFDImageData)
  {
    id v5 = __CTEmojiImageSourceCopyImageStrikes(self->_imageSourceRef);
    uint64_t v6 = [v5 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      while (1)
      {
        v9 = [v5 objectAtIndexedSubscript:v8];
        size_t v10 = (CGImage *)[v9 cgImage];

        size_t Width = CGImageGetWidth(v10);
        size_t Height = CGImageGetHeight(v10);
        if (Width == 64 && Height == 64) {
          break;
        }
        if (v7 == ++v8) {
          goto LABEL_15;
        }
      }
      if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        size_t v13 = objc_opt_new();
        double v14 = [v5 objectAtIndexedSubscript:v8];
        [v13 addObject:v14];

        for (uint64_t i = 0; i != v7; ++i)
        {
          if (v8 != i)
          {
            uint64_t v16 = [v5 objectAtIndexedSubscript:i];
            [v13 addObject:v16];
          }
        }
        id v17 = v13;

        double v18 = [[CTEmojiImageAsset alloc] initWithContentIdentifier:self->_contentIdentifier shortDescription:self->_imageDescription strikeImages:v17];
        v19 = [(CTEmojiImageAsset *)v18 imageData];
        v20 = self->_RTFDImageData;
        self->_RTFDImageData = v19;

        id v5 = v17;
      }
    }
LABEL_15:
    if (!*p_RTFDImageData) {
      objc_storeStrong((id *)p_RTFDImageData, self->_imageContent);
    }

    RTFDImageData = *p_RTFDImageData;
  }

  return RTFDImageData;
}

- (NSData)imageContent
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)imageDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CGImageSource)imageSourceRef
{
  return self->_imageSourceRef;
}

- (id)_nominalTextAttachment
{
  return self->_nominalTextAttachment;
}

- (void)_setNominalTextAttachment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nominalTextAttachment, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_imageContent, 0);
  objc_storeStrong((id *)&self->_RTFDImageData, 0);

  objc_storeStrong((id *)&self->_fallbackImageData, 0);
}

@end