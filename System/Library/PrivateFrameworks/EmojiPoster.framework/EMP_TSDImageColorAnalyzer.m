@interface EMP_TSDImageColorAnalyzer
- (EMP_TSDImageColorAnalyzer)initWithImage:(id)a3;
- (NSArray)dominantColors;
- (NSOrderedSet)interestingColors;
- (UIColor)backgroundColor;
- (id)textColorForBackgroundColor:(id)a3;
- (id)textShadowColorForTextColor:(id)a3 backgroundColor:(id)a4;
- (void)dealloc;
- (void)filterInterestingColorsUsingBlock:(id)a3;
- (void)p_prepareInterestingColors;
@end

@implementation EMP_TSDImageColorAnalyzer

- (EMP_TSDImageColorAnalyzer)initWithImage:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMP_TSDImageColorAnalyzer;
  if ([(EMP_TSDImageColorAnalyzer *)&v6 init]) {
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  imageAnalyzer = (JCImageAnalyzer *)self->_imageAnalyzer;
  if (imageAnalyzer)
  {
    JCImageAnalyzer::~JCImageAnalyzer(imageAnalyzer);
    MEMORY[0x21053AA70]();
  }
  v4.receiver = self;
  v4.super_class = (Class)EMP_TSDImageColorAnalyzer;
  [(EMP_TSDImageColorAnalyzer *)&v4 dealloc];
}

- (NSArray)dominantColors
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v4 = JCImageAnalyzer::DominantColors((JCImageAnalyzer *)self->_imageAnalyzer);
  v5 = (const JCColor *)*v4;
  objc_super v6 = (const JCColor *)v4[1];
  if ((const JCColor *)*v4 != v6)
  {
    do
    {
      JCColor::JCColor((JCColor *)v18, v5);
      v7 = [MEMORY[0x263F825C8] colorWithCGColor:v18[0]];
      [v3 addObject:v7];

      JCColor::~JCColor((JCColor *)v18);
      v5 = (const JCColor *)((char *)v5 + 16);
    }
    while (v5 != v6);
  }
  if ((unint64_t)[v3 count] <= 1)
  {
    v8 = [(EMP_TSDImageColorAnalyzer *)self backgroundColor];
    v9 = (void *)MEMORY[0x263EFF9C0];
    v10 = [MEMORY[0x263F825C8] blackColor];
    v19[0] = v10;
    v11 = [MEMORY[0x263F825C8] whiteColor];
    v19[1] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v13 = [v9 setWithArray:v12];

    v14 = [(EMP_TSDImageColorAnalyzer *)self backgroundColor];
    BOOL v15 = v14 == 0;

    if (!v15) {
      [v13 addObject:v8];
    }
    v16 = [v13 allObjects];
    [v3 addObjectsFromArray:v16];
  }
  return (NSArray *)v3;
}

- (UIColor)backgroundColor
{
  JCColor::JCColor((JCColor *)v4, (const JCColor *)((char *)self->_imageAnalyzer + 24));
  if (v4[0])
  {
    v2 = objc_msgSend(MEMORY[0x263F825C8], "colorWithCGColor:");
  }
  else
  {
    v2 = 0;
  }
  JCColor::~JCColor((JCColor *)v4);
  return (UIColor *)v2;
}

- (NSOrderedSet)interestingColors
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_interestingColors copy];
  return (NSOrderedSet *)v2;
}

- (void)filterInterestingColorsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  interestingColors = self->_interestingColors;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __63__EMP_TSDImageColorAnalyzer_filterInterestingColorsUsingBlock___block_invoke;
  v11 = &unk_264087FC0;
  id v7 = v4;
  id v12 = v5;
  id v13 = v7;
  [(NSMutableOrderedSet *)interestingColors enumerateObjectsUsingBlock:&v8];
  -[NSMutableOrderedSet minusSet:](self->_interestingColors, "minusSet:", v5, v8, v9, v10, v11);
}

- (id)textColorForBackgroundColor:(id)a3
{
  id v4 = a3;
  JCColor::JCColor((JCColor *)v8, (CGColorRef)[v4 CGColor]);
  JCImageAnalyzer::GetTextColorForBackgroundColor((JCImageAnalyzer *)self->_imageAnalyzer, v8, (JCColor *)v7);
  id v5 = [MEMORY[0x263F825C8] colorWithCGColor:v7[0]];
  JCColor::~JCColor((JCColor *)v7);
  JCColor::~JCColor((JCColor *)v8);

  return v5;
}

- (id)textShadowColorForTextColor:(id)a3 backgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  JCColor::JCColor((JCColor *)v13, (CGColorRef)[v7 CGColor]);
  id v8 = v6;
  JCColor::JCColor((JCColor *)v12, (CGColorRef)[v8 CGColor]);
  JCImageAnalyzer::GetTextShadowColor(v13, v12, (JCColor *)v11);
  uint64_t v9 = [MEMORY[0x263F825C8] colorWithCGColor:v11[0]];
  JCColor::~JCColor((JCColor *)v11);
  JCColor::~JCColor((JCColor *)v12);
  JCColor::~JCColor((JCColor *)v13);

  return v9;
}

- (void)p_prepareInterestingColors
{
  interestingColors = self->_interestingColors;
  id v4 = [(EMP_TSDImageColorAnalyzer *)self dominantColors];
  [(NSMutableOrderedSet *)interestingColors addObjectsFromArray:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = self->_interestingColors;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  CGColorRef v8[2] = __55__EMP_TSDImageColorAnalyzer_p_prepareInterestingColors__block_invoke;
  v8[3] = &unk_264087FE8;
  v8[4] = v6;
  v8[5] = v5;
  [(NSMutableOrderedSet *)v7 enumerateObjectsUsingBlock:v8];
  [(NSMutableOrderedSet *)self->_interestingColors minusSet:v5];
}

- (void).cxx_destruct
{
}

@end