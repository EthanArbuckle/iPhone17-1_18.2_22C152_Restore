@interface ASDisplayContext
+ (id)_companionContext;
+ (id)_gizmoContext;
+ (id)displayContextWithName:(id)a3;
+ (void)_contentSizeChangeForContext:(id)a3 withBlock:(id)a4;
- (NSDictionary)keyColors;
- (NSDictionary)titleColors;
- (UIFont)dataFont;
- (UIFont)descriptionFont;
- (UIFont)multilineDataFont;
- (UIFont)multilineUnitFont;
- (UIFont)nameFont;
- (UIFont)unitFont;
- (id)keyColorForDisplayMode:(int64_t)a3;
- (id)titleColorForDisplayMode:(int64_t)a3;
- (void)setDataFont:(id)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setKeyColors:(id)a3;
- (void)setMultilineDataFont:(id)a3;
- (void)setMultilineUnitFont:(id)a3;
- (void)setNameFont:(id)a3;
- (void)setTitleColors:(id)a3;
- (void)setUnitFont:(id)a3;
@end

@implementation ASDisplayContext

+ (id)displayContextWithName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ASDisplayContextCompanion"])
  {
    uint64_t v4 = +[ASDisplayContext _companionContext];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"ASDisplayContextGizmo"])
  {
    uint64_t v4 = +[ASDisplayContext _gizmoContext];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

+ (id)_companionContext
{
  if (_companionContext_onceToken != -1) {
    dispatch_once(&_companionContext_onceToken, &__block_literal_global_3);
  }
  [a1 _contentSizeChangeForContext:_companionContext___companionContext withBlock:&__block_literal_global_30];
  id v3 = (void *)_companionContext___companionContext;
  return v3;
}

+ (void)_contentSizeChangeForContext:(id)a3 withBlock:(id)a4
{
  v10 = (void (**)(id, void *))a4;
  v5 = (void *)MEMORY[0x263F82438];
  v6 = a3;
  v7 = [v5 sharedApplication];
  v8 = [v7 preferredContentSizeCategory];

  uint64_t v9 = v6[9];
  if (([v8 isEqualToString:v9] & 1) == 0) {
    v10[2](v10, v8);
  }
}

void __37__ASDisplayContext__companionContext__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = *MEMORY[0x263F83570];
  id v7 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:0x8000 options:0];
  uint64_t v4 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
  [(id)_companionContext___companionContext setDescriptionFont:v4];

  v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:v3];
  [(id)_companionContext___companionContext setNameFont:v5];

  v6 = *(void **)(_companionContext___companionContext + 72);
  *(void *)(_companionContext___companionContext + 72) = v2;
}

void __37__ASDisplayContext__companionContext__block_invoke()
{
  v29[3] = *MEMORY[0x263EF8340];
  v0 = objc_alloc_init(ASDisplayContext);
  v1 = (void *)_companionContext___companionContext;
  _companionContext___companionContext = (uint64_t)v0;

  id v2 = objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 46.0);
  [(id)_companionContext___companionContext setDataFont:v2];

  uint64_t v3 = objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 30.0);
  [(id)_companionContext___companionContext setMultilineDataFont:v3];

  uint64_t v4 = [(id)_companionContext___companionContext dataFont];
  v5 = SmallCapsFontForFont(v4);
  [(id)_companionContext___companionContext setUnitFont:v5];

  v6 = [(id)_companionContext___companionContext multilineDataFont];
  id v7 = SmallCapsFontForFont(v6);
  [(id)_companionContext___companionContext setMultilineUnitFont:v7];

  v28[0] = &unk_26E806DD8;
  v8 = [MEMORY[0x263F23950] energyColors];
  uint64_t v9 = [v8 nonGradientTextColor];
  v29[0] = v9;
  v28[1] = &unk_26E806DF0;
  v10 = [MEMORY[0x263F23950] briskColors];
  v11 = [v10 nonGradientTextColor];
  v29[1] = v11;
  v28[2] = &unk_26E806E08;
  v12 = [MEMORY[0x263F23950] energyColors];
  v13 = [v12 nonGradientTextColor];
  v29[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  [(id)_companionContext___companionContext setTitleColors:v14];

  v26[0] = &unk_26E806E20;
  v25 = [MEMORY[0x263F23950] energyColors];
  v15 = [v25 nonGradientTextColor];
  v27[0] = v15;
  v26[1] = &unk_26E806DD8;
  v16 = [MEMORY[0x263F23950] energyColors];
  v17 = [v16 nonGradientTextColor];
  v27[1] = v17;
  v26[2] = &unk_26E806DF0;
  v18 = [MEMORY[0x263F23950] briskColors];
  v19 = [v18 nonGradientTextColor];
  v27[2] = v19;
  v26[3] = &unk_26E806E38;
  v20 = [MEMORY[0x263F825C8] lightGrayColor];
  v27[3] = v20;
  v26[4] = &unk_26E806E08;
  v21 = [MEMORY[0x263F23950] energyColors];
  v22 = [v21 nonGradientTextColor];
  v27[4] = v22;
  v26[5] = &unk_26E806E50;
  v23 = [MEMORY[0x263F825C8] lightGrayColor];
  v27[5] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];
  [(id)_companionContext___companionContext setKeyColors:v24];
}

- (id)keyColorForDisplayMode:(int64_t)a3
{
  v5 = [(ASDisplayContext *)self keyColors];
  v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = [(ASDisplayContext *)self keyColors];
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    v10 = [MEMORY[0x263F825C8] whiteColor];
  }

  return v10;
}

- (NSDictionary)keyColors
{
  return self->_keyColors;
}

- (UIFont)multilineDataFont
{
  return self->_multilineDataFont;
}

- (UIFont)multilineUnitFont
{
  return self->_multilineUnitFont;
}

- (void)setUnitFont:(id)a3
{
}

- (void)setTitleColors:(id)a3
{
}

- (void)setNameFont:(id)a3
{
}

- (void)setMultilineUnitFont:(id)a3
{
}

- (void)setMultilineDataFont:(id)a3
{
}

- (void)setKeyColors:(id)a3
{
}

- (void)setDescriptionFont:(id)a3
{
}

- (void)setDataFont:(id)a3
{
}

- (UIFont)dataFont
{
  return self->_dataFont;
}

+ (id)_gizmoContext
{
  uint64_t v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:0x8000 options:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASDisplayContext__gizmoContext__block_invoke;
  block[3] = &unk_264C197E0;
  id v4 = v3;
  id v12 = v4;
  if (_gizmoContext_onceToken[0] != -1) {
    dispatch_once(_gizmoContext_onceToken, block);
  }
  uint64_t v5 = _gizmoContext___gizmoContext;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__ASDisplayContext__gizmoContext__block_invoke_2;
  v9[3] = &unk_264C19C20;
  id v10 = v4;
  id v6 = v4;
  [a1 _contentSizeChangeForContext:v5 withBlock:v9];
  id v7 = (id)_gizmoContext___gizmoContext;

  return v7;
}

void __33__ASDisplayContext__gizmoContext__block_invoke(uint64_t a1)
{
  v33[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(ASDisplayContext);
  uint64_t v3 = (void *)_gizmoContext___gizmoContext;
  _gizmoContext___gizmoContext = (uint64_t)v2;

  id v4 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setNameFont:v4];

  uint64_t v5 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setDataFont:v5];

  id v6 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setDescriptionFont:v6];

  id v7 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setMultilineDataFont:v7];

  v8 = [(id)_gizmoContext___gizmoContext dataFont];
  uint64_t v9 = SmallCapsFontForFont(v8);
  [(id)_gizmoContext___gizmoContext setUnitFont:v9];

  id v10 = [(id)_gizmoContext___gizmoContext multilineDataFont];
  v11 = SmallCapsFontForFont(v10);
  [(id)_gizmoContext___gizmoContext setMultilineUnitFont:v11];

  v32[0] = &unk_26E806DD8;
  id v12 = [MEMORY[0x263F23950] energyColors];
  v13 = [v12 nonGradientTextColor];
  v33[0] = v13;
  v32[1] = &unk_26E806DF0;
  v14 = [MEMORY[0x263F23950] briskColors];
  v15 = [v14 nonGradientTextColor];
  v33[1] = v15;
  v32[2] = &unk_26E806E08;
  v16 = [MEMORY[0x263F23950] energyColors];
  v17 = [v16 nonGradientTextColor];
  v33[2] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  [(id)_gizmoContext___gizmoContext setTitleColors:v18];

  v30[0] = &unk_26E806E20;
  v29 = [MEMORY[0x263F23950] energyColors];
  v19 = [v29 nonGradientTextColor];
  v31[0] = v19;
  v30[1] = &unk_26E806DD8;
  v20 = [MEMORY[0x263F23950] energyColors];
  v21 = [v20 nonGradientTextColor];
  v31[1] = v21;
  v30[2] = &unk_26E806DF0;
  v22 = [MEMORY[0x263F23950] briskColors];
  v23 = [v22 nonGradientTextColor];
  v31[2] = v23;
  v30[3] = &unk_26E806E38;
  v24 = [MEMORY[0x263F825C8] lightGrayColor];
  v31[3] = v24;
  v30[4] = &unk_26E806E08;
  v25 = [MEMORY[0x263F23950] energyColors];
  v26 = [v25 nonGradientTextColor];
  v31[4] = v26;
  v30[5] = &unk_26E806E50;
  v27 = [MEMORY[0x263F825C8] lightGrayColor];
  v31[5] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  [(id)_gizmoContext___gizmoContext setKeyColors:v28];
}

void __33__ASDisplayContext__gizmoContext__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setNameFont:v4];

  uint64_t v5 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setDataFont:v5];

  id v6 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setDescriptionFont:v6];

  id v7 = [MEMORY[0x263F81708] fontWithDescriptor:*(void *)(a1 + 32) size:0.0];
  [(id)_gizmoContext___gizmoContext setMultilineDataFont:v7];

  v8 = [(id)_gizmoContext___gizmoContext dataFont];
  uint64_t v9 = SmallCapsFontForFont(v8);
  [(id)_gizmoContext___gizmoContext setUnitFont:v9];

  id v10 = [(id)_gizmoContext___gizmoContext multilineDataFont];
  v11 = SmallCapsFontForFont(v10);
  [(id)_gizmoContext___gizmoContext setMultilineUnitFont:v11];

  id v12 = *(void **)(_gizmoContext___gizmoContext + 72);
  *(void *)(_gizmoContext___gizmoContext + 72) = v3;
}

- (id)titleColorForDisplayMode:(int64_t)a3
{
  uint64_t v5 = [(ASDisplayContext *)self titleColors];
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = [(ASDisplayContext *)self titleColors];
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    id v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v10 = [MEMORY[0x263F825C8] whiteColor];
  }

  return v10;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (NSDictionary)titleColors
{
  return self->_titleColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyColors, 0);
  objc_storeStrong((id *)&self->_titleColors, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_multilineUnitFont, 0);
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_multilineDataFont, 0);
  objc_storeStrong((id *)&self->_dataFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
}

@end