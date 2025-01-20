@interface MSRichLinkGenerator
+ (MSRichLinkGenerator)linkGenerator;
+ (NSString)titleConvertToPlainLink;
+ (NSString)titleConvertToRichLink;
+ (NSString)titleOpenLink;
- (void)createRichLinkWithURL:(id)a3 completionHandler:(id)a4;
@end

@implementation MSRichLinkGenerator

+ (MSRichLinkGenerator)linkGenerator
{
  if (linkGenerator_onceToken != -1) {
    dispatch_once(&linkGenerator_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)linkGenerator_linkGenerator;
  return (MSRichLinkGenerator *)v2;
}

void __36__MSRichLinkGenerator_linkGenerator__block_invoke()
{
  v0 = objc_alloc_init(MSRichLinkGenerator);
  v1 = (void *)linkGenerator_linkGenerator;
  linkGenerator_linkGenerator = (uint64_t)v0;
}

+ (NSString)titleConvertToRichLink
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)titleConvertToPlainLink
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)titleOpenLink
{
  return (NSString *)_EFLocalizedString();
}

- (void)createRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (createRichLinkWithURL_completionHandler__onceToken[0] != -1) {
    dispatch_once(createRichLinkWithURL_completionHandler__onceToken, &__block_literal_global_9);
  }
  v7 = objc_msgSend(v5, "ef_urlByAddingSchemeIfNeeded");
  id v8 = objc_alloc_init(NSClassFromString(&cfstr_Lpmetadataprov.isa));
  [v8 setTimeout:5.0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_2;
  v11[3] = &unk_1E63FEFC0;
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v8 startFetchingMetadataForURL:v9 completionHandler:v11];
}

void *__63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke()
{
  return dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
}

void __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E63FEF98;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  id v35 = (id)[objc_alloc(NSClassFromString(&cfstr_Lplinkhtmltext.isa)) initWithURL:*(void *)(a1 + 32)];
  [v35 setMetadata:*(void *)(a1 + 40)];
  v2 = [v35 HTMLFragmentString];
  id v3 = [*(id *)(a1 + 40) image];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) icon];
  }
  id v6 = v5;

  v34 = v6;
  id v7 = [v6 data];
  id v8 = [*(id *)(a1 + 40) imageMetadata];
  id v9 = [v8 URL];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [*(id *)(a1 + 40) iconMetadata];
    id v11 = [v12 URL];
  }
  v33 = v11;
  id v13 = [v11 path];
  v14 = [v13 lastPathComponent];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    _EFLocalizedString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = [v17 pathExtension];
  v19 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  v20 = [v18 componentsSeparatedByCharactersInSet:v19];
  v21 = [v20 firstObject];

  if (v18 && ([v18 isEqualToString:v21] & 1) == 0)
  {
    v22 = [v17 stringByDeletingPathExtension];
    uint64_t v23 = [v22 stringByAppendingPathExtension:v21];

    v17 = (void *)v23;
  }
  if (!v7)
  {
    v25 = 0;
    goto LABEL_26;
  }
  v24 = [MEMORY[0x1E4F29128] UUID];
  v25 = [v24 UUIDString];

  v26 = [v33 absoluteString];
  v27 = objc_msgSend(v26, "ef_stringByEscapingForXML");

  if (v27 && [v2 containsString:v27])
  {
    [v2 stringByReplacingOccurrencesOfString:v27 withString:v25];
    v2 = v28 = v2;
  }
  else
  {
    if ([v2 containsString:@"class=\"lp-rich-link-mediaImage\""])
    {
      v29 = @"class=\"lp-rich-link-mediaImage\"";
    }
    else if ([v2 containsString:@"class=\"lp-rich-link-captionBar-rightIcon\""])
    {
      v29 = @"class=\"lp-rich-link-captionBar-rightIcon\"";
    }
    else
    {
      if (![v2 containsString:@"class=\"lp-rich-link-captionBar-leftIcon\""])
      {
        v28 = v7;
        id v7 = 0;
        goto LABEL_25;
      }
      v29 = @"class=\"lp-rich-link-captionBar-leftIcon\"";
    }
    v28 = [NSString stringWithFormat:@"%@ id=\"%@\"", v29, v25];
    uint64_t v30 = [v2 stringByReplacingOccurrencesOfString:v29 withString:v28];

    v2 = (void *)v30;
  }
LABEL_25:

LABEL_26:
  uint64_t v31 = *(void *)(a1 + 48);
  v32 = [v34 MIMEType];
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v31 + 16))(v31, v2, v7, v17, v32, v25);
}

@end