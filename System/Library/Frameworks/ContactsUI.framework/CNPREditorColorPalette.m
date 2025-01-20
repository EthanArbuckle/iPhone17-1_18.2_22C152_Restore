@interface CNPREditorColorPalette
+ (id)standardPalette;
- (CNPREditorColorPalette)initWithEditorColorPalette:(id)a3;
- (id)colors;
@end

@implementation CNPREditorColorPalette

- (void).cxx_destruct
{
}

- (id)colors
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(PREditorColorPalette *)self->_wrappedEditorColorPalette colors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CNPREditorColorPalette_colors__block_invoke;
  v7[3] = &unk_1E549BCD8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __32__CNPREditorColorPalette_colors__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 color];
  [v2 addObject:v3];
}

- (CNPREditorColorPalette)initWithEditorColorPalette:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPREditorColorPalette;
  v6 = [(CNPREditorColorPalette *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedEditorColorPalette, a3);
  }

  return v7;
}

+ (id)standardPalette
{
  v2 = [CNPREditorColorPalette alloc];
  id v3 = [(Class)getPREditorColorPaletteClass[0]() standardPalette];
  v4 = [(CNPREditorColorPalette *)v2 initWithEditorColorPalette:v3];

  return v4;
}

@end