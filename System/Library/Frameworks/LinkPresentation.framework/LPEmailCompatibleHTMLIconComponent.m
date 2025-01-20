@interface LPEmailCompatibleHTMLIconComponent
+ (id)baseRules;
+ (id)ruleDictionaryForStyle:(id)a3;
- (LPEmailCompatibleHTMLIconComponent)initWithImage:(id)a3 style:(id)a4 properties:(id)a5 themePath:(id)a6 generator:(id)a7;
@end

@implementation LPEmailCompatibleHTMLIconComponent

- (LPEmailCompatibleHTMLIconComponent)initWithImage:(id)a3 style:(id)a4 properties:(id)a5 themePath:(id)a6 generator:(id)a7
{
  id v12 = a3;
  id v85 = a4;
  id v13 = a5;
  id v14 = a6;
  v89.receiver = self;
  v89.super_class = (Class)LPEmailCompatibleHTMLIconComponent;
  id v86 = a7;
  v15 = -[LPHTMLComponent initWithTagName:themePath:generator:](&v89, sel_initWithTagName_themePath_generator_, @"img", v14);
  v17 = v15;
  if (v15)
  {
    LPWebLock(v15, v16);
    v18 = [v12 _alternateHTMLImageGenerator];

    id v84 = v14;
    if (v18)
    {
      v19 = [v12 _alternateHTMLImageGenerator];
      uint64_t v20 = v19[2]();

      id v12 = (id)v20;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__LPEmailCompatibleHTMLIconComponent_initWithImage_style_properties_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E5B05090;
    id v83 = v14;
    id v88 = v83;
    v21 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
    unint64_t v22 = LPImageViewFilterResolve(v12, v13, v85);
    v23 = [v12 _remoteURLsForEmailCompatibleOutput];

    if (v23)
    {
      v24 = [v85 cornerRadius];
      [v24 value];
      double v26 = v25;

      if (v26 != 0.0)
      {
        v27 = NSString;
        v28 = [v85 cornerRadius];
        [v28 value];
        v30 = objc_msgSend(v27, "stringWithFormat:", @"%gpx", v29);
        v31 = [v86 cssResolver];
        v32 = [v31 localVariables];
        v33 = v21[2](v21, @"local", @"corner-radius");
        [v32 setObject:v30 forKeyedSubscript:v33];
      }
      v34 = [(LPHTMLComponent *)v17 element];
      v35 = [v12 _remoteURLsForEmailCompatibleOutput];
      v36 = [v35 firstObject];
      v37 = [v36 URL];
      v38 = [v37 absoluteString];
      [v34 setAttribute:@"src" value:v38];

      v39 = [(LPHTMLComponent *)v17 element];
      v40 = [v12 _srcsetForRemoteURLs];
      [v39 setAttribute:@"srcset" value:v40];
      goto LABEL_15;
    }
    id v41 = v12;
    v42 = [v13 maskColor];

    v39 = v41;
    if (v42)
    {
      v43 = [v13 maskColor];
      v39 = flatImageWithColor(v41, v43);
    }
    if (v22 <= 0xE)
    {
      if (((1 << v22) & 0x6808) != 0)
      {
        v44 = [v85 fixedSize];
        [v44 asSize];
        double v46 = v45;
        double v48 = v47;

        v49 = [v85 cornerRadius];
        [v49 value];
        double v51 = v50;

        v52 = [v85 backgroundColor];
        v53 = [v85 backgroundInset];
        [v53 value];
        uint64_t v55 = squareImageWithCornerRadius(v39, v52, v46, v48, v51, 2.0, v54);

        v39 = v52;
      }
      else
      {
        if (v22 != 1) {
          goto LABEL_14;
        }
        [v41 _pixelSize];
        double v76 = v75;
        [v41 _pixelSize];
        if (v76 == v77) {
          goto LABEL_14;
        }
        v78 = [v85 fixedSize];
        [v78 asSize];
        double v80 = v79;
        double v82 = v81;

        uint64_t v55 = squareBitmapImageWithInlaidImage(v39, v80, v82, 2.0);
      }

      v39 = (void *)v55;
    }
LABEL_14:
    v40 = [(LPHTMLComponent *)v17 element];
    v56 = [v86 _URLForImage:v39];
    [v40 setAttribute:@"src" value:v56];

LABEL_15:
    v57 = [(LPHTMLComponent *)v17 element];
    [v57 setAttribute:@"draggable" value:@"false"];

    v58 = [LPCSSVariable alloc];
    v59 = v21[2](v21, 0, @"fixedSize-width");
    v60 = [(LPCSSVariable *)v58 initWithName:v59];
    v61 = [v86 cssResolver];
    v62 = [v61 localVariables];
    v63 = v21[2](v21, @"local", @"size-width");
    [v62 setObject:v60 forKeyedSubscript:v63];

    v64 = [LPCSSVariable alloc];
    v65 = v21[2](v21, 0, @"fixedSize-height");
    v66 = [(LPCSSVariable *)v64 initWithName:v65];
    v67 = [v86 cssResolver];
    v68 = [v67 localVariables];
    v69 = v21[2](v21, @"local", @"size-height");
    [v68 setObject:v66 forKeyedSubscript:v69];

    v70 = [v86 cssResolver];
    v71 = [@"lp-rich-link-" stringByAppendingString:v83];
    id v14 = v84;
    v72 = [(LPHTMLComponent *)v17 element];
    [v70 addStyle:v71 toElement:v72 inComponent:v17];

    v73 = v17;
  }

  return v17;
}

id __89__LPEmailCompatibleHTMLIconComponent_initWithImage_style_properties_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)baseRules
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"inline-block";
  v7[0] = @"display";
  v7[1] = @"width";
  v2 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-size-width"];
  v8[1] = v2;
  v7[2] = @"height";
  v3 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-size-height"];
  v8[2] = v3;
  v8[3] = @"none !important";
  v7[3] = @"pointer-events";
  v7[4] = @"border-radius";
  v4 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-corner-radius"];
  v8[4] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  v3 = objc_msgSend(a1, "baseRules", a3);

  return v3;
}

@end