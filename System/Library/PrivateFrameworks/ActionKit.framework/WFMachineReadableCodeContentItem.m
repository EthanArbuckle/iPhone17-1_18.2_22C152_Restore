@interface WFMachineReadableCodeContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)qrCodeItemWithString:(id)a3 errorCorrectionLevel:(id)a4;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (WFFileType)preferredFileType;
- (WFMachineReadableCode)codeObject;
- (WFObjectType)preferredObjectType;
- (id)generateImageOfSize:(CGSize)a3 error:(id *)a4;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFMachineReadableCodeContentItem

- (WFFileType)preferredFileType
{
  v3 = [(WFMachineReadableCodeContentItem *)self codeObject];
  uint64_t v4 = [v3 errorCorrectionLevel];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
    BOOL v7 = [(WFMachineReadableCodeContentItem *)self canGenerateRepresentationForType:v6];

    if (v7)
    {
      v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v10.receiver = self;
  v10.super_class = (Class)WFMachineReadableCodeContentItem;
  v8 = [(WFMachineReadableCodeContentItem *)&v10 preferredFileType];
LABEL_6:
  return (WFFileType *)v8;
}

- (WFObjectType)preferredObjectType
{
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [(WFMachineReadableCodeContentItem *)self codeObject];
  uint64_t v5 = [v4 errorCorrectionLevel];
  if (v5)
  {
    v6 = (void *)v5;
    BOOL v7 = [(WFMachineReadableCodeContentItem *)self canGenerateRepresentationForType:v3];

    if (v7)
    {
      id v8 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v11.receiver = self;
  v11.super_class = (Class)WFMachineReadableCodeContentItem;
  id v8 = [(WFMachineReadableCodeContentItem *)&v11 preferredObjectType];
LABEL_6:
  v9 = v8;

  return (WFObjectType *)v9;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    uint64_t v5 = [MEMORY[0x263F00640] filterWithName:@"CIQRCodeGenerator"];
    if (v5)
    {
      v6 = [(WFMachineReadableCodeContentItem *)self codeObject];
      BOOL v7 = [v6 type];
      id v8 = getAVMetadataObjectTypeQRCode();
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMachineReadableCodeContentItem;
    unsigned __int8 v9 = [(WFGenericFileContentItem *)&v11 canGenerateRepresentationForType:v4];
  }

  return v9;
}

- (id)generateImageOfSize:(CGSize)a3 error:(id *)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v7 = (void *)MEMORY[0x263F00640];
  id v8 = [(WFMachineReadableCodeContentItem *)self codeObject];
  unsigned __int8 v9 = [v8 stringValue];
  objc_super v10 = [v9 dataUsingEncoding:4];
  objc_super v11 = [(WFMachineReadableCodeContentItem *)self codeObject];
  uint64_t v12 = [v11 errorCorrectionLevel];
  v13 = (void *)v12;
  v14 = @"M";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v15 = objc_msgSend(v7, "filterWithName:keysAndValues:", @"CIQRCodeGenerator", @"inputMessage", v10, @"inputCorrectionLevel", v14, 0);

  v16 = objc_msgSend(MEMORY[0x263F85188], "contextWithSize:scale:", width, height, 1.0);
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
    CGContextSetInterpolationQuality((CGContextRef)[v18 CGContext], kCGInterpolationNone);
    v19 = (void *)MEMORY[0x263F00628];
    id v20 = v18;
    v21 = objc_msgSend(v19, "contextWithCGContext:options:", objc_msgSend(v20, "CGContext"), 0);
    v22 = [v15 outputImage];
    v23 = [v15 outputImage];
    [v23 extent];
    objc_msgSend(v21, "drawImage:inRect:fromRect:", v22, 0.0, 0.0, width, height, v24, v25, v26, v27);

    v28 = [v20 image];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    unsigned __int8 v9 = (void *)MEMORY[0x263F33908];
    objc_super v10 = [(WFMachineReadableCodeContentItem *)self codeObject];
    objc_super v11 = [v10 stringValue];
    id v8 = [v9 object:v11];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      id v8 = 0;
      goto LABEL_9;
    }
    objc_super v10 = -[WFMachineReadableCodeContentItem generateImageOfSize:error:](self, "generateImageOfSize:error:", a5, 556.0, 556.0);
    if (v10)
    {
      id v8 = [MEMORY[0x263F33908] object:v10];
    }
    else
    {
      id v8 = 0;
    }
  }

LABEL_9:
  return v8;
}

- (WFMachineReadableCode)codeObject
{
  uint64_t v3 = objc_opt_class();
  return (WFMachineReadableCode *)[(WFMachineReadableCodeContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Barcodes");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Barcodes", @"Barcodes");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Barcode", @"Barcode");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFMachineReadableCodeContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)qrCodeItemWithString:(id)a3 errorCorrectionLevel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = [WFMachineReadableCode alloc];
  id v8 = getAVMetadataObjectTypeQRCode();
  unsigned __int8 v9 = [(WFMachineReadableCode *)v7 initWithType:v8 stringValue:v6 errorCorrectionLevel:v5];

  objc_super v10 = +[WFContentItem itemWithObject:v9];

  return v10;
}

@end