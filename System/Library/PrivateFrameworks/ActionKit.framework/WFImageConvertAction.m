@interface WFImageConvertAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)preserveMetadataWithPreserveMetadata:(BOOL)a3 imageFormat:(id)a4;
- (id)imageQualityWithQuality:(id)a3 imageFormat:(id)a4;
- (id)typeFromImageFormatString:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFImageConvertAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageFormat" ofClass:objc_opt_class()];
    v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImageCompressionQuality" ofClass:objc_opt_class()];
    v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFImagePreserveMetadata" ofClass:objc_opt_class()];
    uint64_t v11 = [v10 BOOLValue];

    v12 = [*(id *)(a1 + 32) typeFromImageFormatString:v8];
    v13 = [*(id *)(a1 + 32) imageQualityWithQuality:v9 imageFormat:v12];

    char v14 = [*(id *)(a1 + 32) preserveMetadataWithPreserveMetadata:v11 imageFormat:v12];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_2;
    v18[3] = &unk_264E58468;
    char v21 = v14;
    id v19 = v12;
    id v20 = v13;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_3;
    v17[3] = &unk_264E5E840;
    v17[4] = *(void *)(a1 + 32);
    id v15 = v13;
    id v16 = v12;
    [v6 transformItemsUsingBlock:v18 completionHandler:v17];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = [a2 generateImageFileForType:v5 includingMetadata:v4 compressionQuality:v6 error:0];
  v7[2](v7, v8, 0);
}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (BOOL)preserveMetadataWithPreserveMetadata:(BOOL)a3 imageFormat:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5
    && ([v5 conformsToUTType:*MEMORY[0x263F1DB40]] & 1) == 0
    && ([v6 conformsToUTType:*MEMORY[0x263F1DC08]] & 1) == 0
    && ([v6 conformsToUTType:*MEMORY[0x263F1DCE0]] & 1) == 0)
  {
    v4 &= [v6 conformsToUTType:*MEMORY[0x263F1DAE8]];
  }

  return v4;
}

- (id)imageQualityWithQuality:(id)a3 imageFormat:(id)a4
{
  id v5 = a3;
  if ([a4 conformsToUTType:*MEMORY[0x263F1DB40]]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)typeFromImageFormatString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"JPEG"] & 1) != 0
    || ([v3 isEqualToString:@"JPEG-2000"] & 1) != 0)
  {
    int v4 = (void *)MEMORY[0x263F1DB40];
LABEL_4:
    id v5 = [MEMORY[0x263F852B8] typeWithUTType:*v4];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"PNG"])
  {
    int v4 = (void *)MEMORY[0x263F1DC08];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"TIFF"])
  {
    int v4 = (void *)MEMORY[0x263F1DCE0];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"GIF"])
  {
    int v4 = (void *)MEMORY[0x263F1DAD0];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"BMP"])
  {
    int v4 = (void *)MEMORY[0x263F1D9C8];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"PDF"])
  {
    int v4 = (void *)MEMORY[0x263F1DBF0];
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"HEIF"])
  {
    int v4 = (void *)MEMORY[0x263F1DAE8];
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

@end