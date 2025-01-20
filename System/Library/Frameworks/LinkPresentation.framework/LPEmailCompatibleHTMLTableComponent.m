@interface LPEmailCompatibleHTMLTableComponent
+ (id)ruleDictionaryForStyle:(id)a3;
- (LPEmailCompatibleHTMLTableComponent)initWithThemePath:(id)a3 generator:(id)a4;
- (void)addChildAsRow:(id)a3;
@end

@implementation LPEmailCompatibleHTMLTableComponent

- (LPEmailCompatibleHTMLTableComponent)initWithThemePath:(id)a3 generator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)LPEmailCompatibleHTMLTableComponent;
  v8 = [(LPHTMLComponent *)&v30 initWithTagName:@"table" themePath:v6 generator:v7];
  v10 = v8;
  if (v8)
  {
    LPWebLock(v8, v9);
    v11 = [v7 rootWidth];
    v12 = objc_msgSend(v11, "_lp_CSSText");
    v13 = [v7 cssResolver];
    v14 = [v13 localVariables];
    [v14 setObject:v12 forKeyedSubscript:@"local-table-width"];

    v15 = [v7 backgroundColor];
    v16 = objc_msgSend(v15, "_lp_CSSText");
    v17 = [v7 cssResolver];
    v18 = [v17 localVariables];
    [v18 setObject:v16 forKeyedSubscript:@"local-table-backgroundColor"];

    v19 = [v7 cssResolver];
    v20 = [@"lp-rich-link-" stringByAppendingString:v6];
    v21 = [(LPHTMLComponent *)v10 element];
    [v19 addStyle:v20 toElement:v21 inComponent:v10];

    v22 = [(LPHTMLComponent *)v10 element];
    [v22 setAttribute:@"cellpadding" value:@"0"];

    v23 = [(LPHTMLComponent *)v10 element];
    [v23 setAttribute:@"cellspacing" value:@"0"];

    v24 = [(LPHTMLComponent *)v10 element];
    [v24 setAttribute:@"border" value:@"0"];

    v25 = [(LPHTMLComponent *)v10 element];
    v26 = [v7 rootWidth];
    v27 = objc_msgSend(v26, "_lp_HTMLAttributeText");
    [v25 setAttribute:@"width" value:v27];

    v28 = v10;
  }

  return v10;
}

- (void)addChildAsRow:(id)a3
{
  id v12 = a3;
  v4 = [LPHTMLComponent alloc];
  v5 = [(LPHTMLComponent *)self generator];
  id v6 = [(LPHTMLComponent *)v4 initWithTagName:@"tr" themePath:&stru_1EF6D6D90 generator:v5];

  id v7 = [LPHTMLComponent alloc];
  v8 = [(LPHTMLComponent *)self generator];
  uint64_t v9 = [(LPHTMLComponent *)v7 initWithTagName:@"td" themePath:&stru_1EF6D6D90 generator:v8];

  v10 = [(LPHTMLComponent *)v9 element];
  [v10 setAttribute:@"vertical-align" value:@"center"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [(LPHTMLComponent *)v9 element];
    [v11 setAttribute:@"align" value:@"center"];
  }
  [(LPHTMLComponent *)v9 addChild:v12];
  [(LPHTMLComponent *)v6 addChild:v9];
  [(LPHTMLComponent *)self addChild:v6];
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7[0] = @"width";
  v3 = [[LPCSSVariable alloc] initWithName:@"local-table-width"];
  v8[0] = v3;
  v8[1] = @"fixed";
  v7[1] = @"table-layout";
  v7[2] = @"border-collapse";
  v8[2] = @"collapse";
  v7[3] = @"background-color";
  v4 = [[LPCSSVariable alloc] initWithName:@"local-table-backgroundColor"];
  v7[4] = @"font-family";
  v8[3] = v4;
  v8[4] = @"-apple-system, Helvetica, Arial, sans-serif";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

@end