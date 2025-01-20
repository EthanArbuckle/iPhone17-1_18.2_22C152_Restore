@interface ACUILinkButton
- (ACUILinkButton)initWithText:(id)a3 target:(id)a4 action:(SEL)a5;
- (NSString)acui_titleString;
- (id)_highlightedStringAttributes;
- (id)_normalStringAttributes;
- (void)drawRect:(CGRect)a3;
- (void)setAcui_titleString:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ACUILinkButton

- (ACUILinkButton)initWithText:(id)a3 target:(id)a4 action:(SEL)a5
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  SEL v25 = a5;
  v5 = v28;
  v28 = 0;
  v24.receiver = v5;
  v24.super_class = (Class)ACUILinkButton;
  v21 = [(ACUILinkButton *)&v24 init];
  v28 = v21;
  objc_storeStrong((id *)&v28, v21);
  if (v21)
  {
    [(ACUILinkButton *)v28 setAcui_titleString:location[0]];
    [(ACUILinkButton *)v28 addTarget:v26 action:v25 forControlEvents:64];
    v12 = v28;
    UIEdgeInsetsMake();
    v23[1] = v6;
    v23[2] = v7;
    v23[3] = v8;
    v23[4] = v9;
    -[ACUILinkButton setContentEdgeInsets:](v12, "setContentEdgeInsets:", *(double *)&v6, *(double *)&v7, *(double *)&v8, *(double *)&v9);
    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v13 = location[0];
    id v15 = [(ACUILinkButton *)v28 _normalStringAttributes];
    v23[0] = (id)objc_msgSend(v14, "initWithString:attributes:", v13);

    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v16 = location[0];
    id v18 = [(ACUILinkButton *)v28 _highlightedStringAttributes];
    id v22 = (id)objc_msgSend(v17, "initWithString:attributes:", v16);

    [(ACUILinkButton *)v28 setAttributedTitle:v23[0] forState:0];
    [(ACUILinkButton *)v28 setAttributedTitle:v22 forState:1];
    [(ACUILinkButton *)v28 sizeToFit];
    objc_storeStrong(&v22, 0);
    objc_storeStrong(v23, 0);
  }
  v11 = v28;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v11;
}

- (id)_highlightedStringAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F42508];
  id v5 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v7[0] = v5;
  v6[1] = *MEMORY[0x1E4F42510];
  id v3 = (id)[MEMORY[0x1E4F428B8] whiteColor];
  v7[1] = v3;
  id v4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_normalStringAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F42508];
  id v5 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v7[0] = v5;
  v6[1] = *MEMORY[0x1E4F42510];
  id v3 = (id)[MEMORY[0x1E4F428B8] _systemInteractionTintColor];
  v7[1] = v3;
  id v4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ACUILinkButton;
  [(ACUILinkButton *)&v3 setHighlighted:a3];
  [(ACUILinkButton *)v6 setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGRect v11 = a3;
  v10 = self;
  v9[1] = (id)a2;
  if ([(ACUILinkButton *)self isHighlighted])
  {
    id v7 = (id)[MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.200000003];
    [v7 set];

    v8 = (void *)MEMORY[0x1E4F427D0];
    [(ACUILinkButton *)v10 bounds];
    v9[0] = (id)objc_msgSend(v8, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", 255, v3, v4, v5, v6, 4.0);
    [v9[0] fill];
    objc_storeStrong(v9, 0);
  }
}

- (NSString)acui_titleString
{
  return (NSString *)objc_getProperty(self, a2, 744, 1);
}

- (void)setAcui_titleString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end