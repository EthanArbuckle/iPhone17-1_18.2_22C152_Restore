@interface TIErrorGenerator
+ (TIErrorGenerator)errorGeneratorWithAttributes:(id)a3;
- (CGPoint)globalBias;
- (CGPoint)persistentBiasForBottomRow:(CGRect)a3;
- (CGPoint)persistentBiasForKeyString:(id)a3 rect:(CGRect)a4;
- (CGPoint)persistentBiasForSpaceBarRect:(CGRect)a3;
- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4;
- (CGPoint)randomPointInDistribution;
- (CGPoint)uniformRandomPointInRect:(CGRect)a3;
- (TIErrorGenerator)init;
- (TIErrorGenerator)initWithAttributes:(id)a3;
- (TIKeyboardInfoDelegate)keyboardInfoDelgate;
- (double)probTappingSpaceInsteadOfBottomRow;
- (double)probTappingSpaceReplacedByBottomRow;
- (double)spaceVerticalBias;
- (double)uniformRandomNumber;
- (id)errorForKeyString:(id)a3 rect:(CGRect)a4;
- (int64_t)spaceHorizontalErrorMode;
- (int64_t)spacingErrorMaxCount;
- (int64_t)spacingErrorsApplied;
- (void)dealloc;
- (void)reset;
- (void)setKeyboardInfoDelgate:(id)a3;
- (void)setProbTappingSpaceInsteadOfBottomRow:(double)a3;
- (void)setProbTappingSpaceReplacedByBottomRow:(double)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setSpaceHorizontalErrorMode:(int64_t)a3;
- (void)setSpaceVerticalBias:(double)a3;
- (void)setSpacingErrorMaxCount:(int64_t)a3;
- (void)setSpacingErrorsApplied:(int64_t)a3;
@end

@implementation TIErrorGenerator

+ (TIErrorGenerator)errorGeneratorWithAttributes:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForKey:@"ERROR_GENERATOR"];
  v5 = NSClassFromString(v4);
  if (!v5) {
    v5 = (objc_class *)objc_opt_class();
  }
  id v6 = [[v5 alloc] initWithAttributes:v3];

  return (TIErrorGenerator *)v6;
}

- (TIErrorGenerator)initWithAttributes:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIErrorGenerator;
  v5 = [(TIErrorGenerator *)&v25 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"SPACE_HORIZONTAL_ERROR_BIAS"];
    v7 = v6;
    if (!v6) {
      id v6 = @"1";
    }
    v5->_spaceHorizontalErrorMode = (int64_t)[(__CFString *)v6 integerValue];

    v8 = [v4 objectForKey:@"SPACE_VERTICAL_ERROR_BIAS"];
    v9 = v8;
    if (!v8) {
      v8 = @"0.0";
    }
    [(__CFString *)v8 floatValue];
    v5->_spaceVerticalBias = v10;

    v11 = [v4 valueForKey:@"PROB_SPACE_REPLACED_BY_BOTTOM_ROW"];
    [v11 floatValue];
    v5->_probTappingSpaceReplacedByBottomRow = v12;

    v13 = [v4 valueForKey:@"PROB_SPACE_INSTEAD_OF_BOTTOM_ROW"];
    [v13 floatValue];
    v5->_probTappingSpaceInsteadOfBottomRow = v14;

    v15 = [v4 valueForKey:@"MAX_SPACE_ERRORS_PER_TEST"];
    v5->_spacingErrorMaxCount = (int)[v15 intValue];

    v16 = [v4 valueForKey:@"REL_ERROR_NUMBERS_PUNCTATION"];
    v17 = v16;
    if (!v16) {
      v16 = &off_94008;
    }
    [v16 floatValue];
    v5->_relErrorNumbersPunctuation = v18;

    v19 = [v4 valueForKey:@"REL_ERROR_CONTROL_KEYS"];
    v20 = v19;
    if (!v19) {
      v19 = &off_94008;
    }
    [v19 floatValue];
    v5->_relErrorControlKeys = v21;

    v22 = [v4 valueForKey:@"RNG_SEED_SALT"];
    v23 = v22;
    if (!v22) {
      v22 = &off_94018;
    }
    v5->_RNGSeedSalt = [v22 integerValue];

    operator new();
  }

  return 0;
}

- (TIErrorGenerator)init
{
  return [(TIErrorGenerator *)self initWithAttributes:&__NSDictionary0__struct];
}

- (void)dealloc
{
  if (self->m_generator) {
    operator delete();
  }
  if (self->m_distribution) {
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)TIErrorGenerator;
  [(TIErrorGenerator *)&v2 dealloc];
}

- (void)reset
{
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  unsigned int v3 = 257 * self->_RNGSeedSalt + a3;
  m_generator = self->m_generator;
  _DWORD *m_generator = v3;
  for (uint64_t i = 1; i != 624; ++i)
  {
    unsigned int v3 = i + 1812433253 * (v3 ^ (v3 >> 30));
    m_generator[i] = v3;
  }
  *((void *)m_generator + 312) = 0;
  [(TIErrorGenerator *)self reset];
}

- (double)uniformRandomNumber
{
  return sub_FAA8((double *)self->m_distribution, (uint64_t)self->m_generator);
}

- (CGPoint)uniformRandomPointInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v9 = x + v8 * width;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v11 = y + v10 * height;
  double v12 = v9;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (CGPoint)persistentBiasForSpaceBarRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGPointZero.y;
  double v9 = CGRectGetHeight(a3);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v24) - v9;
  int64_t v11 = [(TIErrorGenerator *)self spaceHorizontalErrorMode];
  double v12 = CGPointZero.x + v10 * -0.5;
  double v13 = CGPointZero.x + v10 * 0.5;
  if (v11 != 2) {
    double v13 = CGPointZero.x;
  }
  if (v11 == 3) {
    double v14 = CGPointZero.x + v10 * -0.5;
  }
  else {
    double v14 = v13;
  }
  [(TIErrorGenerator *)self spaceVerticalBias];
  double v16 = v8 - v9 * v15;
  uint64_t v17 = [(TIErrorGenerator *)self spacingErrorsApplied];
  if (v17 < [(TIErrorGenerator *)self spacingErrorMaxCount])
  {
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v19 = v18;
    [(TIErrorGenerator *)self probTappingSpaceReplacedByBottomRow];
    if (v19 < v20)
    {
      double v16 = v16 - v9;
      [(TIErrorGenerator *)self setSpacingErrorsApplied:(char *)[(TIErrorGenerator *)self spacingErrorsApplied] + 1];
    }
  }
  double v21 = v14;
  double v22 = v16;
  result.CGFloat y = v22;
  result.CGFloat x = v21;
  return result;
}

- (CGPoint)persistentBiasForBottomRow:(CGRect)a3
{
  double y = CGPointZero.y;
  double Height = CGRectGetHeight(a3);
  uint64_t v6 = [(TIErrorGenerator *)self spacingErrorsApplied];
  if (v6 < [(TIErrorGenerator *)self spacingErrorMaxCount])
  {
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v8 = v7;
    [(TIErrorGenerator *)self probTappingSpaceInsteadOfBottomRow];
    if (v8 < v9)
    {
      double y = y + Height;
      [(TIErrorGenerator *)self setSpacingErrorsApplied:(char *)[(TIErrorGenerator *)self spacingErrorsApplied] + 1];
    }
  }
  double x = CGPointZero.x;
  double v11 = y;
  result.double y = v11;
  result.double x = x;
  return result;
}

- (CGPoint)globalBias
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)persistentBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if ([v9 isEqualToString:@" "])
  {
    -[TIErrorGenerator persistentBiasForSpaceBarRect:](self, "persistentBiasForSpaceBarRect:", x, y, width, height);
  }
  else
  {
    double v12 = [(TIErrorGenerator *)self keyboardInfoDelgate];
    unsigned int v13 = [v12 isKeyStringAboveSpaceBar:v9];

    if (!v13)
    {
      CGFloat v14 = CGPointZero.x;
      CGFloat v15 = CGPointZero.y;
      goto LABEL_7;
    }
    -[TIErrorGenerator persistentBiasForBottomRow:](self, "persistentBiasForBottomRow:", x, y, width, height);
  }
  CGFloat v14 = v10;
  CGFloat v15 = v11;
LABEL_7:

  double v16 = v14;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)errorForKeyString:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [(TIErrorGenerator *)self globalBias];
  double v11 = v10;
  double v13 = v12;
  if (sub_FFA4(v9))
  {
    float relErrorNumbersPunctuation = self->_relErrorNumbersPunctuation;
  }
  else
  {
    if (!sub_10044(v9)) {
      goto LABEL_6;
    }
    float relErrorNumbersPunctuation = self->_relErrorControlKeys;
  }
  double v15 = relErrorNumbersPunctuation;
  double v11 = v11 * v15;
  double v13 = v13 * v15;
LABEL_6:
  -[TIErrorGenerator persistentBiasForKeyString:rect:](self, "persistentBiasForKeyString:rect:", v9, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  -[TIErrorGenerator randomErrorForKeyString:rect:](self, "randomErrorForKeyString:rect:", v9, x, y, width, height);
  double v21 = v20;
  double v23 = v22;
  if (sub_FFA4(v9))
  {
    float relErrorControlKeys = self->_relErrorNumbersPunctuation;
  }
  else
  {
    if (!sub_10044(v9)) {
      goto LABEL_11;
    }
    float relErrorControlKeys = self->_relErrorControlKeys;
  }
  double v25 = relErrorControlKeys;
  double v21 = v21 * v25;
  double v23 = v23 * v25;
LABEL_11:
  v26 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v11 + 0.0 + v17 + v21, v13 + 0.0 + v19 + v23);

  return v26;
}

- (CGPoint)randomPointInDistribution
{
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v4 = v3;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (int64_t)spaceHorizontalErrorMode
{
  return self->_spaceHorizontalErrorMode;
}

- (void)setSpaceHorizontalErrorMode:(int64_t)a3
{
  self->_spaceHorizontalErrorMode = a3;
}

- (double)spaceVerticalBias
{
  return self->_spaceVerticalBias;
}

- (void)setSpaceVerticalBias:(double)a3
{
  self->_spaceVerticalBias = a3;
}

- (double)probTappingSpaceInsteadOfBottomRow
{
  return self->_probTappingSpaceInsteadOfBottomRow;
}

- (void)setProbTappingSpaceInsteadOfBottomRow:(double)a3
{
  self->_probTappingSpaceInsteadOfBottomRow = a3;
}

- (double)probTappingSpaceReplacedByBottomRow
{
  return self->_probTappingSpaceReplacedByBottomRow;
}

- (void)setProbTappingSpaceReplacedByBottomRow:(double)a3
{
  self->_probTappingSpaceReplacedByBottomRow = a3;
}

- (TIKeyboardInfoDelegate)keyboardInfoDelgate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardInfoDelgate);

  return (TIKeyboardInfoDelegate *)WeakRetained;
}

- (void)setKeyboardInfoDelgate:(id)a3
{
}

- (int64_t)spacingErrorsApplied
{
  return self->_spacingErrorsApplied;
}

- (void)setSpacingErrorsApplied:(int64_t)a3
{
  self->_spacingErrorsApplied = a3;
}

- (int64_t)spacingErrorMaxCount
{
  return self->_spacingErrorMaxCount;
}

- (void)setSpacingErrorMaxCount:(int64_t)a3
{
  self->_spacingErrorMaxCount = a3;
}

- (void).cxx_destruct
{
}

@end