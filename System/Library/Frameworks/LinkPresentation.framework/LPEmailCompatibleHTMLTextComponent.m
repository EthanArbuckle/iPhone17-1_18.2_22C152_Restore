@interface LPEmailCompatibleHTMLTextComponent
+ (id)baseRules;
+ (id)ruleDictionaryForStyle:(id)a3;
- (LPEmailCompatibleHTMLTextComponent)initWithCaption:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6;
@end

@implementation LPEmailCompatibleHTMLTextComponent

- (LPEmailCompatibleHTMLTextComponent)initWithCaption:(id)a3 style:(id)a4 themePath:(id)a5 generator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v71.receiver = self;
  v71.super_class = (Class)LPEmailCompatibleHTMLTextComponent;
  v14 = [(LPHTMLComponent *)&v71 initWithTagName:@"div" themePath:v12 generator:v13];
  v16 = v14;
  if (v14)
  {
    LPWebLock(v14, v15);
    v17 = [v10 attributedText];
    id v65 = v10;
    id v61 = v13;
    id v62 = v12;
    v18 = [v11 adjustedForString:v17];

    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke;
    v66[3] = &unk_1E5B06910;
    id v19 = v13;
    id v67 = v19;
    id v20 = v12;
    id v68 = v20;
    id v21 = v10;
    id v69 = v21;
    id v11 = v18;
    id v70 = v11;
    v63 = __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke((id *)v66);
    v64 = objc_msgSend(v63, "_lp_CSSText");
    [v21 textScale];
    double v23 = v22;
    id v24 = [v11 font];
    v25 = NSString;
    [v24 pointSize];
    v27 = objc_msgSend(v25, "stringWithFormat:", @"%gpx", v23 * v26);

    v28 = [v19 cssResolver];
    v29 = [v28 localVariables];
    v30 = [NSString stringWithFormat:@"local-%@-font-size", v20];
    [v29 setObject:v27 forKeyedSubscript:v30];

    v31 = CSSAlignmentFromLPTextAlignment([v11 textAlignment]);
    v32 = [v19 cssResolver];
    v33 = [v32 localVariables];
    v34 = [NSString stringWithFormat:@"local-%@-text-alignment", v20];
    [v33 setObject:v31 forKeyedSubscript:v34];

    v35 = [v19 cssResolver];
    v36 = [@"lp-rich-link-" stringByAppendingString:v20];
    v37 = [(LPHTMLComponent *)v16 element];
    [v35 addStyle:v36 toElement:v37 inComponent:v16];

    v38 = [(LPHTMLComponent *)v16 generator];
    v39 = [v38 parentDocument];
    v40 = [v39 createElement:@"a"];

    [v40 setAttribute:@"rel" value:@"nofollow"];
    v41 = [(LPHTMLComponent *)v16 generator];
    v42 = [v41 URL];
    v43 = [v42 absoluteString];
    [v40 setAttribute:@"href" value:v43];

    [v40 setAttribute:@"style" value:@"text-decoration: none"];
    [v40 setAttribute:@"draggable" value:@"false"];
    v44 = [(LPHTMLComponent *)v16 generator];
    v45 = [v44 parentDocument];
    v46 = [v45 createElement:@"font"];

    [v46 setAttribute:@"color" value:v64];
    v47 = NSString;
    v48 = objc_msgSend(v63, "_lp_CSSTextForcingUserInterfaceStyle:", 0);
    v49 = [v47 stringWithFormat:@"color: %@;", v48];
    [v46 setAttribute:@"style" value:v49];

    id v50 = (id)[v40 appendChild:v46];
    v51 = [(LPHTMLComponent *)v16 generator];
    v52 = [v51 parentDocument];
    v53 = [v21 text];
    v54 = truncatedStringAtMaximumMetadataLength(v53);
    v55 = [v52 createTextNode:v54];
    id v56 = (id)[v46 appendChild:v55];

    v57 = [(LPHTMLComponent *)v16 element];
    id v58 = (id)[v57 appendChild:v40];

    v59 = v16;
    id v10 = v65;
    id v13 = v61;
    id v12 = v62;
  }

  return v16;
}

id __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke_2;
  aBlock[3] = &unk_1E5B068E8;
  id v9 = a1[4];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (([a1[5] containsString:@"mediaTopCaptionBar"] & 1) != 0
    || [a1[5] containsString:@"mediaBottomCaptionBar"])
  {
    v3 = +[LPTheme primaryLabelColor];
    uint64_t v4 = v2[2](v2, v3);
LABEL_4:
    v5 = (void *)v4;

    goto LABEL_5;
  }
  v7 = [a1[6] color];

  if (!v7)
  {
    v3 = [a1[7] color];
    uint64_t v4 = v2[2](v2, v3);
    goto LABEL_4;
  }
  v5 = [a1[6] color];
LABEL_5:

  return v5;
}

id __80__LPEmailCompatibleHTMLTextComponent_initWithCaption_style_themePath_generator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dominantImageBackgroundColor];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) dominantImageBackgroundColor];
    BOOL v6 = [v5 deprecatedLuminosityLevel] == 1;

    objc_msgSend(v3, "_lp_colorForcingUserInterfaceStyle:", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v3;
  }
  v8 = v7;

  return v8;
}

+ (id)baseRules
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"hidden";
  v7[0] = @"overflow";
  v7[1] = @"font-size";
  v2 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-font-size"];
  v8[1] = v2;
  v7[2] = @"font-weight";
  id v3 = [[LPCSSVariable alloc] initWithName:@"<theme-path>-font-_lp_CSSFontWeight"];
  v8[2] = v3;
  v7[3] = @"text-align";
  uint64_t v4 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-text-alignment"];
  v8[3] = v4;
  v8[4] = @"break-word";
  v7[4] = @"word-wrap";
  v7[5] = @"text-overflow";
  v8[5] = @"ellipsis";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];

  return v5;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  id v3 = objc_msgSend(a1, "baseRules", a3);

  return v3;
}

@end