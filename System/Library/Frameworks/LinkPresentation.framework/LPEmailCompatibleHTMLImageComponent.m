@interface LPEmailCompatibleHTMLImageComponent
+ (id)ruleDictionaryForStyle:(id)a3;
- (LPEmailCompatibleHTMLImageComponent)initWithImage:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6;
@end

@implementation LPEmailCompatibleHTMLImageComponent

- (LPEmailCompatibleHTMLImageComponent)initWithImage:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v10 = a3;
  id v77 = a4;
  id v11 = a5;
  id v12 = a6;
  v80.receiver = self;
  v80.super_class = (Class)LPEmailCompatibleHTMLImageComponent;
  v13 = [(LPHTMLComponent *)&v80 initWithTagName:@"img" themePath:v11 generator:v12];
  v15 = v13;
  if (v13)
  {
    LPWebLock(v13, v14);
    v16 = [v10 _alternateHTMLImageGenerator];

    id v74 = v11;
    if (v16)
    {
      v17 = [v10 _alternateHTMLImageGenerator];
      uint64_t v18 = v17[2]();

      id v10 = (id)v18;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__LPEmailCompatibleHTMLImageComponent_initWithImage_style_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E5B05090;
    id v73 = v11;
    id v79 = v73;
    v75 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
    id v10 = v10;
    v19 = [v10 _remoteURLsForEmailCompatibleOutput];

    if (v19)
    {
      v20 = [(LPHTMLComponent *)v15 element];
      v21 = [v10 _remoteURLsForEmailCompatibleOutput];
      v22 = [v21 firstObject];
      v23 = [v22 URL];
      v24 = [v23 absoluteString];
      [v20 setAttribute:@"src" value:v24];

      v25 = [(LPHTMLComponent *)v15 element];
      v26 = [v10 _srcsetForRemoteURLs];
      [v25 setAttribute:@"srcset" value:v26];
      v76 = v10;
    }
    else
    {
      v76 = v10;
      if ([v77 filter] == 4)
      {
        v27 = [v77 maskColor];
        v76 = flatImageWithColor(v10, v27);
      }
      v25 = [(LPHTMLComponent *)v15 element];
      v26 = [v12 _URLForImage:v76];
      [v25 setAttribute:@"src" value:v26];
    }

    v28 = [(LPHTMLComponent *)v15 element];
    v29 = [v10 properties];
    v30 = [v29 accessibilityText];
    [v28 setAttribute:@"alt" value:v30];

    v31 = [v77 fixedSize];
    if (v31
      && ([v77 fixedSize],
          v32 = objc_claimAutoreleasedReturnValue(),
          char v33 = [v32 isEmpty],
          v32,
          v31,
          (v33 & 1) == 0))
    {
      v46 = [v77 fixedSize];
      v44 = [v46 width];

      v47 = [v77 fixedSize];
      v45 = [v47 height];
    }
    else
    {
      [v76 _pixelSize];
      double v35 = v34;
      double v37 = v36;
      v38 = [v12 rootWidth];
      [v38 value];
      sizeFittingInsideSizeMaintainingAspectRatio(v35, v37, v39, 500.0);
      double v41 = v40;
      double v43 = v42;

      v44 = [[LPPointUnit alloc] initWithValue:v41];
      v45 = [[LPPointUnit alloc] initWithValue:v43];
    }
    v48 = [(LPPointUnit *)v44 _lp_CSSText];
    v49 = [v12 cssResolver];
    v50 = [v49 localVariables];
    v51 = v75[2](v75, @"local", @"width");
    [v50 setObject:v48 forKeyedSubscript:v51];

    v52 = [(LPPointUnit *)v45 _lp_CSSText];
    v53 = [v12 cssResolver];
    v54 = [v53 localVariables];
    v55 = v75[2](v75, @"local", @"height");
    [v54 setObject:v52 forKeyedSubscript:v55];

    uint64_t v56 = [v77 filter];
    double v57 = 0.0;
    if (v56 == 2) {
      objc_msgSend(v77, "darkeningAmount", 0.0);
    }
    float v58 = v57;
    if (v58 == 0.0)
    {
      v59 = &stru_1EF6D6D90;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"brightness(%g)", (float)(1.0 - v58));
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v60 = [v12 cssResolver];
    v61 = [v60 localVariables];
    v62 = v75[2](v75, @"local", @"filter");
    [v61 setObject:v59 forKeyedSubscript:v62];

    if (v58 != 0.0) {
    v63 = [v12 cssResolver];
    }
    v64 = [@"lp-rich-link-" stringByAppendingString:v73];
    v65 = [(LPHTMLComponent *)v15 element];
    [v63 addStyle:v64 toElement:v65 inComponent:v15];

    v66 = [(LPHTMLComponent *)v15 element];
    v67 = [(LPPointUnit *)v44 _lp_HTMLAttributeText];
    [v66 setAttribute:@"width" value:v67];

    v68 = [(LPHTMLComponent *)v15 element];
    v69 = [(LPPointUnit *)v45 _lp_HTMLAttributeText];
    [v68 setAttribute:@"height" value:v69];

    v70 = [(LPHTMLComponent *)v15 element];
    [v70 setAttribute:@"draggable" value:@"false"];

    v71 = v15;
    id v11 = v74;
  }

  return v15;
}

id __79__LPEmailCompatibleHTMLImageComponent_initWithImage_style_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [NSString stringWithFormat:@"%@-%@-%@", v5, *(void *)(a1 + 32), v6];
  }
  else {
  v7 = [NSString stringWithFormat:@"%@-%@", *(void *)(a1 + 32), v6];
  }

  return v7;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"width";
  v3 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-width"];
  v9[0] = v3;
  v8[1] = @"height";
  v4 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-height"];
  v9[1] = v4;
  v8[2] = @"filter";
  id v5 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-filter"];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

@end