@interface MUImageReader
+ (BOOL)hasPrivateImageMetadata:(id)a3;
+ (id)_privateImageMetadataDescriptors;
+ (id)cleanImageMetadataFromData:(id)a3;
+ (id)imageDescriptionFromSourceContent:(id)a3;
- (BOOL)readAnnotationsFromArchivedModelData:(id)a3 toController:(id)a4;
- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3;
- (id)_readBaseImageFromDataProvider:(CGDataProvider *)a3 providerSource:(id)a4 baseWasValid:(BOOL *)a5;
- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4;
- (id)readArchivedModelDataFromImageData:(id)a3;
- (id)readArchivedModelDataFromImageURL:(id)a3;
- (id)readBaseImageFromData:(id)a3 baseWasValid:(BOOL *)a4;
- (id)readBaseImageFromImageAtURL:(id)a3 baseWasValid:(BOOL *)a4;
@end

@implementation MUImageReader

- (id)readArchivedModelDataFromImageData:(id)a3
{
  CGDataProviderRef v4 = CGDataProviderCreateWithCFData((CFDataRef)a3);
  if (v4)
  {
    CGDataProviderRef v5 = v4;
    v6 = [(MUImageReader *)self _readAnnotationsFromDataProvider:v4];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)readArchivedModelDataFromImageURL:(id)a3
{
  CGDataProviderRef v4 = CGDataProviderCreateWithURL((CFURLRef)a3);
  if (v4)
  {
    CGDataProviderRef v5 = v4;
    v6 = [(MUImageReader *)self _readAnnotationsFromDataProvider:v4];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)readAnnotationsFromArchivedModelData:(id)a3 toController:(id)a4
{
  id v5 = a3;
  v6 = [a4 modelController];
  char v7 = [v6 populateFromArchivedPageModelControllers:v5];

  return v7;
}

- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3
{
  CGDataProviderRef v4 = CGImageSourceCreateWithDataProvider(a3, 0);
  if (v4)
  {
    id v5 = v4;
    CGImageMetadataRef v6 = CGImageSourceCopyMetadataAtIndex(v4, 0, 0);
    if (v6)
    {
      CGImageMetadataRef v7 = v6;
      v8 = [NSString stringWithFormat:@"%@:enc_model", kMetadataPrefixAnnotationKit];
      v9 = [(MUImageReader *)self _readDataFromTagAtPath:v8 inMetadata:v7];
      v10 = +[MUPayloadEncryption sharedInstance];
      v11 = [v10 decryptData:v9];

      if (!v11)
      {
        NSLog(&cfstr_DidNotFindEncM.isa);
        v12 = [NSString stringWithFormat:@"%@:model", kMetadataPrefixAnnotationKit];
        v11 = [(MUImageReader *)self _readDataFromTagAtPath:v12 inMetadata:v7];
      }
      CFRelease(v7);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)readBaseImageFromData:(id)a3 baseWasValid:(BOOL *)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  CGDataProviderRef v7 = CGDataProviderCreateWithCFData(v6);
  if (v7)
  {
    CGDataProviderRef v8 = v7;
    v9 = [(MUImageReader *)self _readBaseImageFromDataProvider:v7 providerSource:v6 baseWasValid:a4];
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)readBaseImageFromImageAtURL:(id)a3 baseWasValid:(BOOL *)a4
{
  CFURLRef v6 = (const __CFURL *)a3;
  CGDataProviderRef v7 = CGDataProviderCreateWithURL(v6);
  if (v7)
  {
    CGDataProviderRef v8 = v7;
    v9 = [(MUImageReader *)self _readBaseImageFromDataProvider:v7 providerSource:v6 baseWasValid:a4];
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_readBaseImageFromDataProvider:(CGDataProvider *)a3 providerSource:(id)a4 baseWasValid:(BOOL *)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  CGDataProviderRef v8 = CGImageSourceCreateWithDataProvider(a3, 0);
  v9 = v8;
  if (v8)
  {
    CGImageMetadataRef v10 = CGImageSourceCopyMetadataAtIndex(v8, 0, 0);
    if (v10)
    {
      CGImageMetadataRef v11 = v10;
      v12 = [NSString stringWithFormat:@"%@:enc_base_image", kMetadataPrefixAnnotationKit];
      v13 = [(MUImageReader *)self _readDataFromTagAtPath:v12 inMetadata:v11];
      v14 = +[MUPayloadEncryption sharedInstance];
      CFDataRef v15 = [v14 decryptData:v13];

      if (!v15)
      {
        NSLog(&cfstr_DidNotFindEncB.isa);
        v16 = [NSString stringWithFormat:@"%@:base_image", kMetadataPrefixAnnotationKit];
        CFDataRef v15 = [(MUImageReader *)self _readDataFromTagAtPath:v16 inMetadata:v11];
      }
      CFRelease(v11);

      if (v15)
      {
        v17 = CGImageSourceCreateWithData(v15, 0);
        if (v17)
        {
          v18 = v17;
          CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
          if (ImageAtIndex)
          {
            CFRelease(ImageAtIndex);
            CFRelease(v18);
            NSLog(&cfstr_SFoundValidBas.isa, "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
            if (a5) {
              *a5 = 1;
            }
            goto LABEL_23;
          }
          CFRelease(v18);
        }
        if (a5) {
          *a5 = 0;
        }
        v20 = [MEMORY[0x263EFF990] data];
        CFStringRef Type = CGImageSourceGetType(v9);
        v22 = CGImageDestinationCreateWithData(v20, Type, 1uLL, 0);
        CGImageMetadataRef v23 = CGImageSourceCopyMetadataAtIndex(v9, 0, 0);
        if (v23)
        {
          v24 = v23;
          NSLog(&cfstr_SBaseImageMeta.isa, "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
          MutableCopy = CGImageMetadataCreateMutableCopy(v24);
          CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, kMetadataNamespaceAnnotationKit, kMetadataPrefixAnnotationKit, 0);
          v26 = [NSString stringWithFormat:@"%@:enc_model", kMetadataPrefixAnnotationKit];
          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v26);
          v27 = [NSString stringWithFormat:@"%@:model", kMetadataPrefixAnnotationKit];

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v27);
          v28 = [NSString stringWithFormat:@"%@:enc_base_image", kMetadataPrefixAnnotationKit];

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v28);
          v29 = [NSString stringWithFormat:@"%@:base_image", kMetadataPrefixAnnotationKit];

          CGImageMetadataRemoveTagWithPath(MutableCopy, 0, v29);
          uint64_t v34 = *MEMORY[0x263F0F000];
          v35[0] = MutableCopy;
          CFDictionaryRef v30 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
          CGImageDestinationCopyImageSource(v22, v9, v30, 0);
          v31 = v20;

          if (MutableCopy) {
            CFRelease(MutableCopy);
          }

          CFRelease(v24);
          CFDataRef v15 = v31;
          if (!v22) {
            goto LABEL_22;
          }
        }
        else
        {
          NSLog(&cfstr_SBaseImageMeta_0.isa, "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
          CFDataRef v33 = CGDataProviderCopyData(a3);

          CFDataRef v15 = v33;
          if (!v22) {
            goto LABEL_22;
          }
        }
        CFRelease(v22);
LABEL_22:

LABEL_23:
        CFRelease(v9);
        goto LABEL_24;
      }
    }
  }
  NSLog(&cfstr_SBaseImageDoes.isa, "-[MUImageReader _readBaseImageFromDataProvider:providerSource:baseWasValid:]");
  CFDataRef v15 = CGDataProviderCopyData(a3);
  if (a5) {
    *a5 = 0;
  }
  if (v9) {
    goto LABEL_23;
  }
LABEL_24:
  return v15;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if ([(__CFData *)v4 length])
  {
    id v5 = CGImageSourceCreateWithData(v4, 0);
    CFURLRef v6 = v5;
    if (v5)
    {
      CGDataProviderRef v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
      if (v7)
      {
        CGDataProviderRef v8 = [a1 _privateImageMetadataDescriptors];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __41__MUImageReader_hasPrivateImageMetadata___block_invoke;
        v12[3] = &unk_2649C2778;
        id v9 = v8;
        id v13 = v9;
        v14 = &v15;
        CGImageMetadataEnumerateTagsUsingBlock(v7, 0, 0, v12);
        CFRelease(v7);
      }
      CFRelease(v6);
    }
  }
  char v10 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __41__MUImageReader_hasPrivateImageMetadata___block_invoke(uint64_t a1, int a2, CGImageMetadataTagRef tag)
{
  CFStringRef v5 = CGImageMetadataTagCopyPrefix(tag);
  if (!v5) {
    return 1;
  }
  CFStringRef v6 = v5;
  CGDataProviderRef v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v7 && (CFStringRef v8 = CGImageMetadataTagCopyName(tag)) != 0)
  {
    CFStringRef v9 = v8;
    int v10 = [v7 containsObject:v8];
    if (v10) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    uint64_t v11 = v10 ^ 1u;
    CFRelease(v9);
  }
  else
  {
    uint64_t v11 = 1;
  }
  CFRelease(v6);

  return v11;
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  CFDataRef v4 = (const __CFData *)a3;
  CFDataRef v5 = v4;
  if (v4)
  {
    CFStringRef v6 = CGImageSourceCreateWithData(v4, 0);
    CGDataProviderRef v7 = v5;
    if (v6)
    {
      CFStringRef v8 = v6;
      CGImageMetadataRef v9 = CGImageSourceCopyMetadataAtIndex(v6, 0, 0);
      CGDataProviderRef v7 = v5;
      if (v9)
      {
        int v10 = v9;
        uint64_t v11 = [a1 _privateImageMetadataDescriptors];
        CGMutableImageMetadataRef MutableCopy = CGImageMetadataCreateMutableCopy(v10);
        CGDataProviderRef v7 = v5;
        if (MutableCopy)
        {
          CGMutableImageMetadataRef v13 = MutableCopy;
          uint64_t v28 = 0;
          v29 = &v28;
          uint64_t v30 = 0x2020000000;
          char v31 = 0;
          uint64_t v21 = MEMORY[0x263EF8330];
          uint64_t v22 = 3221225472;
          CGImageMetadataRef v23 = __44__MUImageReader_cleanImageMetadataFromData___block_invoke;
          v24 = &unk_2649C27A0;
          v26 = &v28;
          CGMutableImageMetadataRef v27 = MutableCopy;
          id v25 = v11;
          CGImageMetadataEnumerateTagsUsingBlock(v10, 0, 0, &v21);
          CGDataProviderRef v7 = v5;
          if (*((unsigned char *)v29 + 24))
          {
            objc_msgSend(MEMORY[0x263EFF990], "data", v21, v22, v23, v24);
            v14 = (__CFData *)objc_claimAutoreleasedReturnValue();
            CFStringRef Type = CGImageSourceGetType(v8);
            size_t Count = CGImageSourceGetCount(v8);
            uint64_t v17 = CGImageDestinationCreateWithData(v14, Type, Count, 0);
            CGDataProviderRef v7 = v5;
            if (v17)
            {
              char v18 = (void *)*MEMORY[0x263F0F000];
              values = v13;
              keys[0] = v18;
              CFDictionaryRef v19 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
              CGDataProviderRef v7 = v5;
              if (v19)
              {
                CGDataProviderRef v7 = v5;
                if (CGImageDestinationCopyImageSource(v17, v8, v19, 0))
                {
                  CGDataProviderRef v7 = v14;
                }
                CFRelease(v19);
              }
              CFRelease(v17);
            }
          }
          CFRelease(v13);

          _Block_object_dispose(&v28, 8);
        }
        CFRelease(v10);
      }
      CFRelease(v8);
    }
  }
  else
  {
    CGDataProviderRef v7 = 0;
  }

  return v7;
}

uint64_t __44__MUImageReader_cleanImageMetadataFromData___block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  CFStringRef v6 = CGImageMetadataTagCopyPrefix(tag);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFStringRef v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (v8)
    {
      CFStringRef v9 = CGImageMetadataTagCopyName(tag);
      if (v9)
      {
        CFStringRef v10 = v9;
        if ([v8 containsObject:v9])
        {
          CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 48), 0, a2);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        CFRelease(v10);
      }
    }
    CFRelease(v7);
  }
  return 1;
}

- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4
{
  CFDataRef v4 = CGImageMetadataCopyTagWithPath(a4, 0, (CFStringRef)a3);
  if (v4)
  {
    CFDataRef v5 = v4;
    CFTypeRef v6 = CGImageMetadataTagCopyValue(v4);
    if (v6)
    {
      CFStringRef v7 = (void *)v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        CFStringRef v9 = (objc_class *)MEMORY[0x263EFF8F8];
        id v10 = v7;
        uint64_t v11 = (void *)[[v9 alloc] initWithBase64EncodedString:v10 options:0];
      }
      else
      {
        uint64_t v11 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      uint64_t v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

+ (id)_privateImageMetadataDescriptors
{
  return &unk_26E189F80;
}

+ (id)imageDescriptionFromSourceContent:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDataRef v4 = CGDataProviderCreateWithURL(v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:
      CFStringRef v9 = 0;
      goto LABEL_19;
    }
    CFDataRef v4 = CGDataProviderCreateWithCFData(v3);
  }
  CFDataRef v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  CGImageSourceRef v6 = CGImageSourceCreateWithDataProvider(v4, 0);
  if (v6)
  {
    CGImageSourceRef v7 = v6;
    CFErrorRef err = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    CFTypeID v8 = (uint64_t (*)(CGImageSourceRef, CFErrorRef *))getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr;
    uint64_t v17 = getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr;
    if (!getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_ptr)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke;
      v13[3] = &unk_2649C27C8;
      v13[4] = &v14;
      __getMAImageCaptioningCopyCaptionWithSourceSymbolLoc_block_invoke((uint64_t)v13);
      CFTypeID v8 = (uint64_t (*)(CGImageSourceRef, CFErrorRef *))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v8) {
      +[MUImageReader imageDescriptionFromSourceContent:]();
    }
    CFStringRef v9 = (void *)v8(v7, &err);
    if (err)
    {
      id v10 = (__CFString *)CFErrorCopyDescription(err);
      if ([(__CFString *)v10 length]) {
        NSLog(&cfstr_S.isa, "+[MUImageReader imageDescriptionFromSourceContent:]", v10);
      }
      else {
        NSLog(&cfstr_SErrorReadingI.isa, "+[MUImageReader imageDescriptionFromSourceContent:]");
      }
      CFRelease(err);
    }
    CFRelease(v7);
  }
  else
  {
    CFStringRef v9 = 0;
  }
  CFRelease(v5);
LABEL_19:

  return v9;
}

+ (void)imageDescriptionFromSourceContent:.cold.1()
{
}

@end