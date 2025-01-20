@interface LPEmailCompatibleHTMLCaptionBarItemComponent
+ (id)ruleDictionaryForStyle:(id)a3;
- (LPEmailCompatibleHTMLCaptionBarItemComponent)initWithStyle:(id)a3 themePath:(id)a4 generator:(id)a5;
@end

@implementation LPEmailCompatibleHTMLCaptionBarItemComponent

- (LPEmailCompatibleHTMLCaptionBarItemComponent)initWithStyle:(id)a3 themePath:(id)a4 generator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)LPEmailCompatibleHTMLCaptionBarItemComponent;
  v11 = [(LPHTMLComponent *)&v27 initWithTagName:@"td" themePath:v9 generator:v10];
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__LPEmailCompatibleHTMLCaptionBarItemComponent_initWithStyle_themePath_generator___block_invoke;
    aBlock[3] = &unk_1E5B05090;
    id v12 = v9;
    id v26 = v12;
    v13 = (void (**)(void *, __CFString *, __CFString *))_Block_copy(aBlock);
    id v24 = v8;
    v14 = [v8 emailCompatibleMargin];
    v15 = objc_msgSend(v14, "_lp_CSSText");
    v16 = [v10 cssResolver];
    v17 = [v16 localVariables];
    v18 = v13[2](v13, @"local", @"margin");
    [v17 setObject:v15 forKeyedSubscript:v18];

    v19 = [v10 cssResolver];
    v20 = [NSString stringWithFormat:@"lp-rich-link-%@Item", v12];
    v21 = [(LPHTMLComponent *)v11 element];
    [v19 addStyle:v20 toElement:v21 inComponent:v11];

    v22 = v11;
    id v8 = v24;
  }

  return v11;
}

id __82__LPEmailCompatibleHTMLCaptionBarItemComponent_initWithStyle_themePath_generator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [NSString stringWithFormat:@"%@-%@Item-%@", v5, *(void *)(a1 + 32), v6];
  }
  else {
  v7 = [NSString stringWithFormat:@"%@Item-%@", *(void *)(a1 + 32), v6];
  }

  return v7;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"padding";
  v3 = [[LPCSSVariable alloc] initWithName:@"local-<theme-path>-margin"];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

@end