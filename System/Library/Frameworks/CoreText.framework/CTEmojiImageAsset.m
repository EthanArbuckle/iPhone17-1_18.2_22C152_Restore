@interface CTEmojiImageAsset
- (CTEmojiImageAsset)initWithContentIdentifier:(id)a3 shortDescription:(id)a4 strikeImages:(id)a5;
- (NSArray)strikes;
- (NSData)heicData;
- (NSString)contentIdentifier;
- (NSString)shortDescription;
- (id)_IPTCDictionaryWithProvenanceInfo:(id)a3;
- (id)_TIFFDictionaryWithEmojiInfoAndAlignmentInset:(CGSize)a3;
- (id)_attachmentProperties;
- (id)_imagePropertiesForImage:(CGImage *)a3 withAlignmentInset:(CGSize)a4 provenanceInfo:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageData;
- (id)preferredFilenameForData;
- (void)_finalizeImageData;
- (void)setContentIdentifier:(id)a3;
- (void)setHeicData:(id)a3;
- (void)setShortDescription:(id)a3;
- (void)setStrikes:(id)a3;
@end

@implementation CTEmojiImageAsset

- (CTEmojiImageAsset)initWithContentIdentifier:(id)a3 shortDescription:(id)a4 strikeImages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CTEmojiImageAsset.m", 79, @"Invalid identifier %@", v9 object file lineNumber description];
  }
  if (![v10 length])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"CTEmojiImageAsset.m", 80, @"Invalid description %@", v10 object file lineNumber description];
  }
  if (![v11 count])
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"CTEmojiImageAsset.m" lineNumber:81 description:@"Empty images"];
  }
  if ([v9 length] && objc_msgSend(v10, "length") && objc_msgSend(v11, "count"))
  {
    v19.receiver = self;
    v19.super_class = (Class)CTEmojiImageAsset;
    v12 = [(CTEmojiImageAsset *)&v19 init];
    v13 = v12;
    if (v12)
    {
      [(CTEmojiImageAsset *)v12 setContentIdentifier:v9];
      [(CTEmojiImageAsset *)v13 setShortDescription:v10];
      [(CTEmojiImageAsset *)v13 setStrikes:v11];
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_IPTCDictionaryWithProvenanceInfo:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCapacity:2];
  uint64_t v6 = *MEMORY[0x1E4F2FB68];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FB68]];
  uint64_t v8 = *MEMORY[0x1E4F2FBA8];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2FBA8]];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [v5 setObject:v7 forKeyedSubscript:v6];
    [v5 setObject:v9 forKeyedSubscript:v8];
  }

  return v5;
}

- (id)_TIFFDictionaryWithEmojiInfoAndAlignmentInset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F2FD48];
  uint64_t v6 = [(CTEmojiImageAsset *)self contentIdentifier];
  v15[0] = v6;
  v14[1] = *MEMORY[0x1E4F2FD58];
  v7 = [(CTEmojiImageAsset *)self shortDescription];
  uint64_t v8 = *MEMORY[0x1E4F2FD88];
  v15[1] = v7;
  v15[2] = @"Apple TextKit";
  uint64_t v9 = *MEMORY[0x1E4F2FDA0];
  v14[2] = v8;
  v14[3] = v9;
  BOOL v10 = [NSNumber numberWithDouble:width];
  v15[3] = v10;
  v14[4] = *MEMORY[0x1E4F2FDB0];
  id v11 = [NSNumber numberWithDouble:height];
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

- (id)_imagePropertiesForImage:(CGImage *)a3 withAlignmentInset:(CGSize)a4 provenanceInfo:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = *MEMORY[0x1E4F2F880];
  id v8 = a5;
  uint64_t v9 = [(CTEmojiImageAsset *)self contentIdentifier];
  v20[0] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  uint64_t v11 = *MEMORY[0x1E4F2F800];
  v18[0] = v10;
  uint64_t v12 = *MEMORY[0x1E4F2FD40];
  v17[0] = v11;
  v17[1] = v12;
  v13 = -[CTEmojiImageAsset _TIFFDictionaryWithEmojiInfoAndAlignmentInset:](self, "_TIFFDictionaryWithEmojiInfoAndAlignmentInset:", width, height);
  v18[1] = v13;
  v17[2] = *MEMORY[0x1E4F2FB80];
  v14 = [(CTEmojiImageAsset *)self _IPTCDictionaryWithProvenanceInfo:v8];

  v18[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v15;
}

- (id)_attachmentProperties
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F2FD40];
  v2 = -[CTEmojiImageAsset _TIFFDictionaryWithEmojiInfoAndAlignmentInset:](self, "_TIFFDictionaryWithEmojiInfoAndAlignmentInset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)_finalizeImageData
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CTEmojiImageAsset *)v2 heicData];

  if (!v3)
  {
    id v4 = (__CFData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x80000];
    CFDictionaryRef v5 = [(CTEmojiImageAsset *)v2 _attachmentProperties];
    uint64_t v6 = [(CTEmojiImageAsset *)v2 strikes];
    size_t v7 = [v6 count];
    id v8 = CGImageDestinationCreateWithData(v4, @"public.heic", v7, MEMORY[0x1E4F1CC08]);

    if (v8)
    {
      CFDictionaryRef v23 = v5;
      v24 = v4;
      CGImageDestinationSetProperties(v8, v5);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [(CTEmojiImageAsset *)v2 strikes];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
            v15 = (void *)MEMORY[0x185327A40](v10);
            uint64_t v16 = objc_msgSend(v14, "cgImage", v23);
            [v14 alignmentInset];
            double v18 = v17;
            double v20 = v19;
            v21 = [v14 provenance];
            -[CTEmojiImageAsset _imagePropertiesForImage:withAlignmentInset:provenanceInfo:](v2, "_imagePropertiesForImage:withAlignmentInset:provenanceInfo:", v16, v21, v18, v20);
            CFDictionaryRef v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

            CGImageDestinationAddImage(v8, (CGImageRef)[v14 cgImage], v22);
            ++v13;
          }
          while (v11 != v13);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
          uint64_t v11 = v10;
        }
        while (v10);
      }

      id v4 = v24;
      if (CGImageDestinationFinalize(v8)) {
        [(CTEmojiImageAsset *)v2 setHeicData:v24];
      }
      CFRelease(v8);
    }
    else
    {
    }
  }
  objc_sync_exit(v2);
}

- (id)imageData
{
  [(CTEmojiImageAsset *)self _finalizeImageData];

  return [(CTEmojiImageAsset *)self heicData];
}

- (id)preferredFilenameForData
{
  v2 = NSString;
  v3 = [(CTEmojiImageAsset *)self contentIdentifier];
  id v4 = [v2 stringWithFormat:@"%@.heic", v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  CFDictionaryRef v5 = [(CTEmojiImageAsset *)self contentIdentifier];
  [v4 setContentIdentifier:v5];

  uint64_t v6 = [(CTEmojiImageAsset *)self shortDescription];
  [v4 setShortDescription:v6];

  size_t v7 = [(CTEmojiImageAsset *)self strikes];
  [v4 setStrikes:v7];

  id v8 = [(CTEmojiImageAsset *)self heicData];
  [v4 setHeicData:v8];

  return v4;
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContentIdentifier:(id)a3
{
}

- (NSString)shortDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShortDescription:(id)a3
{
}

- (NSData)heicData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeicData:(id)a3
{
}

- (NSArray)strikes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStrikes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->strikes, 0);
  objc_storeStrong((id *)&self->heicData, 0);
  objc_storeStrong((id *)&self->shortDescription, 0);

  objc_storeStrong((id *)&self->contentIdentifier, 0);
}

@end