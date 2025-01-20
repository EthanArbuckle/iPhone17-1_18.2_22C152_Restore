@interface WFImageContentItem
+ (BOOL)supportsSecureCoding;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)imageTypes;
+ (id)itemWithFile:(id)a3 preferredFileType:(id)a4;
+ (id)itemWithImage:(id)a3 named:(id)a4 preferredFileType:(id)a5;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedPasteboardTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)initialize;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)imageIsAnimated;
- (BOOL)isContent;
- (BOOL)isObjectBacked;
- (BOOL)isScreenshot;
- (BOOL)loadsListAltTextAsynchronously;
- (BOOL)loadsListSubtitleAsynchronously;
- (BOOL)loadsListThumbnailAsynchronously;
- (CGSize)size;
- (CLLocation)location;
- (WFFileType)preferredFileType;
- (WFImage)image;
- (WFImageContentItem)initWithCoder:(id)a3;
- (WFObjectType)preferredObjectType;
- (id)dateTaken;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateImageFileForType:(id)a3 includingMetadata:(BOOL)a4 compressionQuality:(id)a5 error:(id *)a6;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)height;
- (id)imageFile;
- (id)make;
- (id)metadata;
- (id)model;
- (id)orientation;
- (id)width;
- (void)copyStateToItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)setIsScreenshot:(BOOL)a3;
@end

@implementation WFImageContentItem

- (void).cxx_destruct
{
}

- (void)setIsScreenshot:(BOOL)a3
{
  self->_isScreenshot = a3;
}

- (WFObjectType)preferredObjectType
{
  return +[WFObjectType typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
}

- (WFFileType)preferredFileType
{
  preferredFileType = self->_preferredFileType;
  if (preferredFileType)
  {
    v3 = preferredFileType;
  }
  else if ([(WFImageContentItem *)self imageIsAnimated])
  {
    v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFImageContentItem;
    v3 = [(WFContentItem *)&v6 preferredFileType];
  }
  return v3;
}

- (void)copyStateToItem:(id)a3
{
}

- (BOOL)imageIsAnimated
{
  if ([(WFImageContentItem *)self isObjectBacked])
  {
    v3 = [(WFImageContentItem *)self image];
    if (![v3 allowsAnimated])
    {
      BOOL IsAnimatedGIF = 0;
      goto LABEL_8;
    }
    v4 = [v3 data];
  }
  else
  {
    v5 = [(WFContentItem *)self internalRepresentationType];
    uint64_t v6 = *MEMORY[0x263F1DAD0];
    int v7 = [v5 conformsToUTType:*MEMORY[0x263F1DAD0]];

    if (!v7) {
      return 0;
    }
    v8 = [MEMORY[0x263F852B8] typeWithUTType:v6];
    v3 = [(WFContentItem *)self fileRepresentationForType:v8];

    v4 = [v3 mappedData];
  }
  v9 = v4;
  BOOL IsAnimatedGIF = WFImageDataIsAnimatedGIF(v4);

LABEL_8:
  return IsAnimatedGIF;
}

- (BOOL)isContent
{
  return 1;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F852B8] typeWithString:@"com.ilm.openexr-image"];
  char v6 = [v4 conformsToType:v5];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFImageContentItem;
    BOOL v7 = [(WFGenericFileContentItem *)&v9 canGenerateRepresentationForType:v4];
  }

  return v7;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  objc_super v9 = +[WFObjectType typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
  int v10 = [v9 isEqualToClass:a3];

  if (v10)
  {
    v11 = [(WFImageContentItem *)self image];
    v12 = [v11 platformImage];
LABEL_3:
    v13 = [(WFContentItem *)self name];
    v14 = +[WFObjectRepresentation object:v12 named:v13];

LABEL_4:
    goto LABEL_5;
  }
  if ((Class)objc_opt_class() != a3)
  {
    if ((Class)objc_opt_class() == a3)
    {
      v20 = [(WFImageContentItem *)self preferredFileType];
      v21 = [(WFContentItem *)self getRepresentationsForType:v20 error:a5];
      v22 = [v21 firstObject];

      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x2050000000;
      v23 = (void *)getNSTextAttachmentClass_softClass;
      uint64_t v46 = getNSTextAttachmentClass_softClass;
      if (!getNSTextAttachmentClass_softClass)
      {
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __getNSTextAttachmentClass_block_invoke;
        v42[3] = &unk_26428AC60;
        v42[4] = &v43;
        __getNSTextAttachmentClass_block_invoke((uint64_t)v42);
        v23 = (void *)v44[3];
      }
      v24 = v23;
      _Block_object_dispose(&v43, 8);
      id v25 = [v24 alloc];
      v26 = [v22 data];
      v27 = [v22 wfType];
      v28 = [v27 string];
      v29 = (void *)[v25 initWithData:v26 ofType:v28];

      v30 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v29];
      v31 = [v22 wfName];
      v14 = +[WFObjectRepresentation object:v30 named:v31];
    }
    else
    {
      v16 = NSStringFromClass(a3);
      int v17 = [@"CLLocation" isEqualToString:v16];

      if (v17)
      {
        v11 = [(WFImageContentItem *)self location];
        if (v11)
        {
          v18 = [(WFContentItem *)self name];
          v14 = +[WFObjectRepresentation object:v11 named:v18];
        }
        else
        {
          v14 = 0;
        }
        goto LABEL_4;
      }
      if ((Class)objc_opt_class() != a3)
      {
        v14 = 0;
        goto LABEL_5;
      }
      if ([(WFImageContentItem *)self isObjectBacked])
      {
        v38 = [(WFImageContentItem *)self image];
        CFDataRef v39 = [v38 PNGRepresentation];
        v14 = CGImageSourceCreateWithData(v39, 0);
      }
      else
      {
        v38 = [(WFImageContentItem *)self imageFile];
        v14 = WFImageSourceCreateFromFile(v38, 0);
      }

      if (!v14) {
        goto LABEL_5;
      }
      v22 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
      CFRelease(v14);
      if (v22)
      {
        v40 = WFLocalizedContentPropertyNameMarker(@"Metadata");
        v14 = +[WFObjectRepresentation object:v22 named:v40];
      }
      else
      {
        v14 = 0;
      }
    }

    goto LABEL_5;
  }
  if ([(WFImageContentItem *)self isObjectBacked])
  {
    v19 = +[WFObjectType typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
    v11 = -[WFContentItem objectForClass:](self, "objectForClass:", [v19 objectClass]);

    v12 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithPlatformImage:v11];
    goto LABEL_3;
  }
  v32 = [(WFImageContentItem *)self imageFile];
  id v41 = 0;
  v33 = [v32 mappedDataWithError:&v41];
  id v34 = v41;
  v35 = v34;
  if (v33)
  {
    v36 = [MEMORY[0x263F85308] imageWithData:v33];
    if (v36)
    {
      v37 = [(WFContentItem *)self name];
      v14 = +[WFObjectRepresentation object:v36 named:v37];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    *a5 = v34;
  }

LABEL_5:
  return v14;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = NSStringFromClass(a5);
  int v11 = [@"UIPrintFormatter" isEqualToString:v10];

  if (v11)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_26428AAB0;
    id v17 = v8;
    id v15 = v9;
    v16 = self;
    v12 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
    [(WFContentItem *)self getFileRepresentation:v14 forType:v12];
  }
  else
  {
    v13 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v13);
  }
}

void __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = +[WFWebResource webResourceWithFile:a2];
    uint64_t v4 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
    v7[3] = &unk_264288DB8;
    id v5 = *(id *)(a1 + 48);
    v7[4] = *(void *)(a1 + 40);
    id v8 = v5;
    +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v3, 0, v4, v7, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  else
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

void __68__WFImageContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [a2 viewPrintFormatter];
  uint64_t v4 = [*(id *)(a1 + 32) name];
  (*(void (**)(uint64_t, id, void *, void))(v3 + 16))(v3, v5, v4, 0);
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v8 conformsToUTType:*MEMORY[0x263F1DBA8]])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__WFImageContentItem_generateFileRepresentation_options_forType___block_invoke;
    v11[3] = &unk_26428AA60;
    id v12 = v7;
    id v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAD0]];
    [(WFContentItem *)self getFileRepresentation:v11 forType:v9];
  }
  else
  {
    int v10 = [(id)objc_opt_class() badCoercionErrorForType:v8];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

void __65__WFImageContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 wfName];
  id v4 = WFGenerateVideoFromGIF(v5, v3, 1, *(void **)(a1 + 32));
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  return [(WFImageContentItem *)self generateImageFileForType:a3 includingMetadata:1 compressionQuality:0 error:a5];
}

- (id)generateImageFileForType:(id)a3 includingMetadata:(BOOL)a4 compressionQuality:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (!v10 || [v10 isEqualToUTType:*MEMORY[0x263F1DB18]])
  {
    uint64_t v12 = [(WFImageContentItem *)self preferredFileType];

    id v10 = (id)v12;
  }
  if ([(WFImageContentItem *)self isObjectBacked]
    && (uint64_t v13 = *MEMORY[0x263F1DAD0], [v10 conformsToUTType:*MEMORY[0x263F1DAD0]])
    && [(WFImageContentItem *)self imageIsAnimated])
  {
    v14 = [(WFImageContentItem *)self image];
    id v15 = [v14 UIImage];
    v16 = WFUIImageAnimatedGIFRepresentationAndOptions(v15, 0, a6, 0.0);

    CFURLRef v17 = [MEMORY[0x263F852B8] typeWithUTType:v13];
    id v18 = [(WFContentItem *)self name];
    v19 = +[WFFileRepresentation fileWithData:v16 ofType:v17 proposedFilename:v18];
  }
  else
  {
    v20 = [(id)objc_opt_class() imageTypes];
    int v21 = [v20 containsObject:v10];

    if (!v21)
    {
      v19 = 0;
      goto LABEL_24;
    }
    v22 = [(WFContentItem *)self name];
    v16 = +[WFFileRepresentation proposedFilenameForFile:v22 ofType:v10];

    CFURLRef v17 = +[WFTemporaryFileManager createTemporaryFileWithFilename:v16];
    v23 = [(WFContentItem *)self name];
    id v18 = +[WFFileRepresentation fileWithURL:v17 options:1 ofType:v10 proposedFilename:v23];

    v24 = [v10 utType];
    id v25 = [v24 identifier];
    v26 = CGImageDestinationCreateWithURL(v17, v25, 1uLL, 0);

    if (v26)
    {
      BOOL v27 = [(WFImageContentItem *)self isObjectBacked];
      v28 = objc_opt_new();
      v29 = v28;
      if (v8)
      {
        v30 = [(WFImageContentItem *)self metadata];
        [v29 addEntriesFromDictionary:v30];
      }
      else if (!v27)
      {
        uint64_t v31 = *MEMORY[0x263EFFD08];
        [v28 setObject:*MEMORY[0x263EFFD08] forKey:*MEMORY[0x263F0F518]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F370]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F498]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F248]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F4E0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F470]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F3C0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F508]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F0A0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F4A8]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F4B0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F050]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F138]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F1C0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F4C0]];
        [v29 setObject:v31 forKey:*MEMORY[0x263F0F4A0]];
      }
      if (v11) {
        [v29 setObject:v11 forKey:*MEMORY[0x263F0EFE8]];
      }
      if (v27)
      {
        v32 = [(WFImageContentItem *)self image];
        v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v32, "orientation"));
        [v29 setObject:v33 forKey:*MEMORY[0x263F0F4C8]];

        CGImageDestinationAddImage(v26, (CGImageRef)[v32 CGImage], (CFDictionaryRef)v29);
      }
      else
      {
        id v34 = [(WFImageContentItem *)self imageFile];
        v35 = WFImageSourceCreateFromFile(v34, 0);

        if (v35)
        {
          CGImageDestinationAddImageFromSource(v26, v35, 0, (CFDictionaryRef)v29);
          CFRelease(v35);
        }
      }
      CGImageDestinationFinalize(v26);
      CFRelease(v26);
      id v18 = v18;

      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
  }

LABEL_24:
  return v19;
}

- (id)imageFile
{
  uint64_t v3 = [(WFContentItem *)self internalRepresentationType];
  id v4 = [(WFContentItem *)self fileRepresentationForType:v3];

  return v4;
}

- (WFImage)image
{
  uint64_t v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  id v5 = [v4 firstObject];
  char v6 = [v5 object];

  return (WFImage *)v6;
}

- (BOOL)isObjectBacked
{
  v2 = [(WFContentItem *)self internalRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isScreenshot
{
  if (self->_isScreenshot) {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x263F85308];
  [(WFImageContentItem *)self size];
  return objc_msgSend(v3, "imageSizeIndicatesScreenshot:");
}

- (id)orientation
{
  if ([(WFImageContentItem *)self isObjectBacked])
  {
    uint64_t v3 = [(WFImageContentItem *)self image];
    int v4 = [v3 orientation];
  }
  else
  {
    uint64_t v3 = [(WFImageContentItem *)self metadata];
    int v4 = WFImageOrientationFromMetadata(v3);
  }
  int v5 = v4;

  WFImageStringFromOrientation(v5);
  char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!v6) {
    char v6 = &stru_26C71CE08;
  }
  BOOL v8 = v6;

  return v8;
}

- (CLLocation)location
{
  v2 = [(WFImageContentItem *)self metadata];
  uint64_t v3 = WFImageLocationTakenFromMetadata(v2);

  return (CLLocation *)v3;
}

- (id)height
{
  v2 = NSNumber;
  [(WFImageContentItem *)self size];
  return (id)[v2 numberWithDouble:v3];
}

- (id)width
{
  v2 = NSNumber;
  [(WFImageContentItem *)self size];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)model
{
  v2 = [(WFImageContentItem *)self metadata];
  double v3 = WFImageModelFromMetadata(v2);

  return v3;
}

- (id)make
{
  v2 = [(WFImageContentItem *)self metadata];
  double v3 = WFImageMakeFromMetadata(v2);

  return v3;
}

- (id)dateTaken
{
  v2 = [(WFImageContentItem *)self metadata];
  double v3 = WFImageDateTakenFromMetadata(v2);

  return v3;
}

- (CGSize)size
{
  if ([(WFImageContentItem *)self isObjectBacked])
  {
    double v3 = [(WFImageContentItem *)self image];
    [v3 sizeInPixels];
  }
  else
  {
    double v3 = [(WFImageContentItem *)self metadata];
    WFImageSizeFromMetadata(v3);
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)metadata
{
  double v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  double v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  double v5 = [v4 firstObject];
  double v6 = [v5 object];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WFImageContentItem;
  [(WFContentItem *)&v7 encodeWithCoder:v4];
  double v5 = [@"WFImageContentItem" stringByAppendingString:@"preferredFileType"];
  [v4 encodeObject:self->_preferredFileType forKey:v5];
  if (self->_isScreenshot)
  {
    double v6 = [@"WFImageContentItem" stringByAppendingString:@"isScreenshot"];
    [v4 encodeBool:1 forKey:v6];
  }
}

- (WFImageContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFImageContentItem;
  double v5 = [(WFContentItem *)&v12 initWithCoder:v4];
  if (v5)
  {
    double v6 = [@"WFImageContentItem" stringByAppendingString:@"preferredFileType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v6];
    preferredFileType = v5->_preferredFileType;
    v5->_preferredFileType = (WFFileType *)v7;

    double v9 = [@"WFImageContentItem" stringByAppendingString:@"isScreenshot"];
    v5->_isScreenshot = [v4 decodeBoolForKey:v9];
    id v10 = v5;
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x263EFF9D8];
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    double v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, objc_opt_class(), 0);
    +[WFCoercionOptions registerDefaultDisallowedCoercionPath:v5];

    double v6 = (void *)MEMORY[0x263EFF9D8];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v6, "orderedSetWithObjects:", v7, v8, objc_opt_class(), 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    +[WFCoercionOptions registerDefaultDisallowedCoercionPath:v9];
  }
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Images");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Images", @"Images");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Image (singular)", @"Image");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"UIPrintFormatter" frameworkName:@"UIKit" location:2];
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  double v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  double v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v7 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)ownedPasteboardTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856B0]];
  uint64_t v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  id v3 = (void *)MEMORY[0x263EFF9B0];
  uint64_t v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  double v5 = [v3 orderedSetWithObject:v4];

  double v6 = +[WFObjectType typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
  [v5 addObject:v6];

  uint64_t v7 = [a1 imageTypes];
  [v5 unionOrderedSet:v7];

  uint64_t v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
  [v5 addObject:v8];

  id v9 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DBF0]];
  [v5 removeObject:v9];

  return v5;
}

+ (id)imageTypes
{
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
  [v2 addObject:v3];

  uint64_t v4 = (void *)MEMORY[0x263F852B8];
  CFArrayRef v5 = CGImageDestinationCopyTypeIdentifiers();
  double v6 = [v4 typesFromStrings:v5];
  [v2 addObjectsFromArray:v6];

  return v2;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v87[17] = *MEMORY[0x263EF8340];
  v81 = WFLocalizedContentPropertyNameMarkerWithContext(@"Album", @"Image Content Item");
  v80 = +[WFContentPropertyBuilder block:&__block_literal_global_871 name:v81 class:objc_opt_class()];
  v79 = [v80 multipleValues:1];
  v78 = [v79 filterable:0];
  v77 = [v78 sortable:0];
  v87[0] = v77;
  v76 = WFLocalizedContentPropertyNameMarker(@"Width");
  v75 = +[WFContentPropertyBuilder keyPath:@"width" name:v76 class:objc_opt_class()];
  v87[1] = v75;
  v74 = WFLocalizedContentPropertyNameMarker(@"Height");
  v73 = +[WFContentPropertyBuilder keyPath:@"height" name:v74 class:objc_opt_class()];
  v87[2] = v73;
  v72 = WFLocalizedContentPropertyNameMarker(@"Date Taken");
  v71 = +[WFContentPropertyBuilder keyPath:@"dateTaken" name:v72 class:objc_opt_class()];
  v70 = [v71 tense:1];
  v69 = [v70 timeUnits:8220];
  v68 = [v69 comparableUnits:8220];
  v87[3] = v68;
  v67 = WFLocalizedContentPropertyNameMarker(@"Time Taken");
  v66 = +[WFContentPropertyBuilder keyPath:@"dateTaken" name:v67 class:objc_opt_class()];
  v65 = [v66 tense:1];
  v64 = [v65 timeUnits:224];
  v63 = [v64 comparableUnits:224];
  v62 = [v63 gettable:0];
  v87[4] = v62;
  v61 = WFLocalizedContentPropertyNameMarker(@"Media Type");
  v60 = +[WFContentPropertyBuilder block:&__block_literal_global_96 name:v61 class:objc_opt_class()];
  v59 = WFPhotoLibraryPossibleMediaTypes();
  v58 = [v60 possibleValues:v59];
  v57 = [v58 sortable:0];
  v87[5] = v57;
  v56 = WFLocalizedContentPropertyNameMarker(@"Photo Type");
  v55 = +[WFContentPropertyBuilder block:&__block_literal_global_98 name:v56 class:objc_opt_class()];
  v54 = WFPhotoLibraryPossiblePhotoTypes();
  v53 = [v55 possibleValues:v54];
  v52 = [v53 multipleValues:1];
  v51 = [v52 sortable:0];
  v87[6] = v51;
  v50 = WFLocalizedContentPropertyNameMarker(@"Is a Screenshot");
  v49 = [NSNumber numberWithBool:1];
  v48 = +[WFContentPropertyBuilder keyPath:@"isScreenshot" name:v50 class:objc_opt_class()];
  v47 = WFLocalizedContentPropertyNameMarker(@"Is Not a Screenshot");
  uint64_t v46 = [v48 negativeName:v47];
  uint64_t v45 = WFLocalizedStringWithKey(@"Image (item name)", @"Image");
  v44 = [v46 singularItemName:v45];
  v87[7] = v44;
  uint64_t v43 = WFLocalizedContentPropertyNameMarker(@"Is a Screen Recording");
  v42 = [NSNumber numberWithBool:1];
  id v41 = +[WFContentPropertyBuilder block:&__block_literal_global_112 name:v43 class:objc_opt_class()];
  v40 = WFLocalizedContentPropertyNameMarker(@"Is Not a Screen Recording");
  CFDataRef v39 = [v41 negativeName:v40];
  v38 = WFLocalizedStringWithKey(@"Image (item name)", @"Image");
  v37 = [v39 singularItemName:v38];
  v87[8] = v37;
  v36 = WFLocalizedContentPropertyNameMarker(@"Location");
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2050000000;
  v2 = (void *)getCLLocationClass_softClass_875;
  uint64_t v86 = getCLLocationClass_softClass_875;
  if (!getCLLocationClass_softClass_875)
  {
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = __getCLLocationClass_block_invoke_876;
    v82[3] = &unk_26428AC60;
    v82[4] = &v83;
    __getCLLocationClass_block_invoke_876((uint64_t)v82);
    v2 = (void *)v84[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v83, 8);
  v35 = +[WFContentPropertyBuilder keyPath:@"location" name:v36 class:v3];
  v87[9] = v35;
  id v34 = WFLocalizedContentPropertyNameMarker(@"Duration");
  v33 = +[WFContentPropertyBuilder block:&__block_literal_global_120 name:v34 class:objc_opt_class()];
  v32 = [v33 timeUnits:224];
  v87[10] = v32;
  uint64_t v31 = WFLocalizedContentPropertyNameMarker(@"Frame Rate");
  v30 = +[WFContentPropertyBuilder block:&__block_literal_global_126 name:v31 class:objc_opt_class()];
  v29 = [v30 irrational:1];
  v87[11] = v29;
  v28 = WFLocalizedContentPropertyNameMarker(@"Orientation");
  BOOL v27 = +[WFContentPropertyBuilder keyPath:@"orientation" name:v28 class:objc_opt_class()];
  v26 = WFImagePossibleOrientationStrings();
  id v25 = [v27 possibleValues:v26];
  v87[12] = v25;
  v24 = WFLocalizedContentPropertyNameMarker(@"Camera Make");
  v23 = +[WFContentPropertyBuilder keyPath:@"make" name:v24 class:objc_opt_class()];
  v22 = [v23 sortable:0];
  int v21 = [v22 filterable:0];
  v87[13] = v21;
  v20 = WFLocalizedContentPropertyNameMarker(@"Camera Model");
  v19 = +[WFContentPropertyBuilder keyPath:@"model" name:v20 class:objc_opt_class()];
  id v18 = [v19 sortable:0];
  CFURLRef v17 = [v18 filterable:0];
  v87[14] = v17;
  v16 = WFLocalizedContentPropertyNameMarker(@"Metadata Dictionary");
  uint64_t v4 = +[WFContentPropertyBuilder keyPath:@"metadata" name:v16 class:objc_opt_class()];
  CFArrayRef v5 = [v4 sortable:0];
  double v6 = [v5 filterable:0];
  v87[15] = v6;
  uint64_t v7 = WFLocalizedContentPropertyNameMarker(@"Is Favorite");
  uint64_t v8 = [NSNumber numberWithBool:1];
  id v9 = +[WFContentPropertyBuilder block:&__block_literal_global_144 name:v7 class:objc_opt_class()];
  id v10 = WFLocalizedContentPropertyNameMarker(@"Is Not Favorite");
  id v11 = [v9 negativeName:v10];
  objc_super v12 = WFLocalizedStringWithKey(@"Image (item name)", @"Image");
  uint64_t v13 = [v11 singularItemName:v12];
  v87[16] = v13;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:17];

  return v15;
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, MEMORY[0x263EFFA80]);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, MEMORY[0x263EFFA68]);
}

void __38__WFImageContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  CFArrayRef v5 = a4;
  WFLocalizedContentPropertyPossibleValueMarker(@"Image");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a4)[2](v5, v6);
}

uint64_t __38__WFImageContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)itemWithFile:(id)a3 preferredFileType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFImageContentItem.m", 112, @"Invalid parameter not satisfying: %@", @"fileRepresentation" object file lineNumber description];
  }
  id v9 = [a1 itemWithFile:v7];
  id v10 = (void *)v9[7];
  v9[7] = v8;

  return v9;
}

+ (id)itemWithImage:(id)a3 named:(id)a4 preferredFileType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFImageContentItem.m", 105, @"Invalid parameter not satisfying: %@", @"image" object file lineNumber description];
  }
  objc_super v12 = [a1 itemWithObject:v9 named:v10];
  uint64_t v13 = (void *)v12[7];
  v12[7] = v11;

  return v12;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_alloc(MEMORY[0x263EFF9B0]);
  v53 = v10;
  id v15 = [v10 allKeys];
  v16 = (void *)[v14 initWithArray:v15];

  CFURLRef v17 = (void *)*MEMORY[0x263F1DB08];
  id v18 = [(id)*MEMORY[0x263F1DB08] identifier];
  int v19 = [v16 containsObject:v18];

  if (v19)
  {
    v20 = [v17 identifier];
    [v16 removeObject:v20];

    int v21 = [v17 identifier];
    [v16 addObject:v21];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v16;
  uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v22)
  {
    v36 = 0;
    goto LABEL_31;
  }
  uint64_t v23 = v22;
  id v49 = v11;
  id v50 = v13;
  id v48 = v12;
  uint64_t v24 = *(void *)v55;
  id v25 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v55 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x263F852B8], "typeWithString:", v27, v48);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = [v25 ownedTypes];
      if ([v29 containsObject:v28])
      {
      }
      else
      {
        v30 = [v25 ownedPasteboardTypes];
        int v31 = [v30 containsObject:v28];

        if (!v31) {
          goto LABEL_14;
        }
      }
      v32 = [v53 objectForKey:v27];
      v33 = +[WFObjectType typeWithClass:objc_opt_class()];
      id v34 = +[WFObjectType typeWithClassName:@"UIImage" frameworkName:@"UIKit" location:2];
      int v35 = [v33 conformsToType:v34];

      if (v35)
      {
        id v12 = v48;
        id v11 = v49;
        id v13 = v50;
        v36 = [a1 itemWithObject:v32 named:v49 attributionSet:v48 cachingIdentifier:v50];
        uint64_t v37 = *MEMORY[0x263F1DB18];
        if (![v28 conformsToUTType:*MEMORY[0x263F1DB18]]) {
          goto LABEL_30;
        }
        if ([v28 isEqualToUTType:v37]) {
          goto LABEL_30;
        }
        v38 = [MEMORY[0x263F1D920] typeWithIdentifier:*MEMORY[0x263F856B0]];
        char v39 = [v28 isEqualToUTType:v38];

        if (v39) {
          goto LABEL_30;
        }
        id v28 = v28;
        v40 = (void *)v36[7];
        v36[7] = v28;
LABEL_29:

        id v13 = v50;
LABEL_30:

        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [v53 objectForKey:v27];
        id v41 = +[WFApplicationContext sharedContext];
        v42 = [v41 provider];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v11 = v49;
          v44 = +[WFFileRepresentation proposedFilenameForFile:v49 ofType:v28];
          uint64_t v45 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v44];
          id v12 = v48;
          if ([v40 writeToURL:v45 atomically:0])
          {
            uint64_t v46 = +[WFFileRepresentation fileWithURL:v45 options:1];
            v36 = [a1 itemWithFile:v46 attributionSet:v48 cachingIdentifier:v50];
          }
          else
          {
            v36 = 0;
          }
        }
        else
        {
          id v11 = v49;
          v44 = +[WFFileRepresentation fileWithData:v40 ofType:v28 proposedFilename:v49];
          id v12 = v48;
          v36 = [a1 itemWithFile:v44 attributionSet:v48 cachingIdentifier:v50];
        }

        goto LABEL_29;
      }

      id v25 = a1;
LABEL_14:
    }
    uint64_t v23 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v23) {
      continue;
    }
    break;
  }
  v36 = 0;
  id v12 = v48;
  id v11 = v49;
  id v13 = v50;
LABEL_31:

  return v36;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

- (BOOL)loadsListAltTextAsynchronously
{
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke;
    v7[3] = &unk_26428A288;
    id v8 = v4;
    [(WFContentItem *)self getPreferredFileSize:v7];
  }
  return 1;
}

void __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F086F0] stringFromByteCount:a2 countStyle:0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke_2;
  v6[3] = &unk_264288800;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __53__WFImageContentItem_ChooseFromList__getListAltText___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke;
    v7[3] = &unk_26428AA60;
    id v8 = v4;
    [(WFContentItem *)self getFileRepresentation:v7 forType:0];
  }
  return 1;
}

void __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 wfType];
    id v4 = [v3 fileExtension];

    id v5 = NSString;
    id v6 = WFLocalizedString(@"%@ Image");
    id v7 = [v4 localizedUppercaseString];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke_2;
    block[3] = &unk_264288800;
    id v9 = *(id *)(a1 + 32);
    id v13 = v8;
    id v14 = v9;
    id v10 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v11();
  }
}

uint64_t __54__WFImageContentItem_ChooseFromList__getListSubtitle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_2642887D8;
    id v11 = v7;
    CGFloat v12 = width;
    CGFloat v13 = height;
    [(WFContentItem *)self getFileRepresentation:v10 forType:0];
  }
  return 1;
}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = WFImageSizeFromFile(v5, 0);
    double v9 = v8;
    id v10 = [MEMORY[0x263F85258] currentDevice];
    [v10 screenScale];
    CGFloat v12 = v11;

    CGAffineTransformMakeScale(&v31, v12, v12);
    double v13 = *(double *)(a1 + 40);
    double v14 = *(double *)(a1 + 48);
    double v15 = v14 * v31.c + v31.a * v13;
    double v16 = v14 * v31.d + v31.b * v13;
    if (v7 <= v15 && v9 <= v16)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_4;
      block[3] = &unk_264288788;
      id v26 = *(id *)(a1 + 32);
      id v25 = v5;
      CGFloat v27 = v12;
      dispatch_async(MEMORY[0x263EF83A0], block);

      uint64_t v23 = v26;
    }
    else
    {
      BOOL v18 = v7 <= v9;
      double v19 = round(v7 / v9 * v16);
      double v20 = round(v9 / v7 * v15);
      if (v7 > v9) {
        double v21 = v15;
      }
      else {
        double v21 = v19;
      }
      if (v18) {
        double v22 = v16;
      }
      else {
        double v22 = v20;
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_2;
      v28[3] = &unk_2642887B0;
      id v29 = *(id *)(a1 + 32);
      CGFloat v30 = v12;
      WFAsyncTransformedImageFromImage(v5, 0, 0, v28, v21, v22);
      uint64_t v23 = v29;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_3;
  block[3] = &unk_264288788;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  uint64_t v9 = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F85308];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) mappedData];
  id v4 = [v2 imageWithData:v5 scale:*(double *)(a1 + 48)];
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
}

void __63__WFImageContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke_3(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v2)
  {
    id v5 = (void *)MEMORY[0x263F85308];
    id v8 = [v2 mappedData];
    id v6 = [v5 imageWithData:v8 scale:*(double *)(a1 + 48)];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v6, 0);
  }
  else
  {
    id v7 = *(void (**)(uint64_t, void, void))(v3 + 16);
    v7(v3, 0, 0);
  }
}

@end