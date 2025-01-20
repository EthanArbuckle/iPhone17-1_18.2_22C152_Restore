@interface DESSeparatedDPParameters
- (DESSeparatedDPParameters)initWithRecipe:(id)a3;
- (double)maxNorm;
- (id)description;
- (int64_t)normBinCount;
@end

@implementation DESSeparatedDPParameters

- (DESSeparatedDPParameters)initWithRecipe:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  v6 = [v4 maxNorm];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v7 = [v5 normBinCount];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)DESSeparatedDPParameters;
  v9 = [(DESSeparatedDPParameters *)&v15 init];
  if (v9)
  {
    v10 = [v5 maxNorm];
    [v10 doubleValue];
    v9->_maxNorm = v11;

    v12 = [v5 normBinCount];
    v9->_normBinCount = [v12 integerValue];
  }
  self = v9;
  v13 = self;
LABEL_9:

  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(%f, %ld)", v5, *(void *)&self->_maxNorm, self->_normBinCount];

  return v6;
}

- (int64_t)normBinCount
{
  return self->_normBinCount;
}

- (double)maxNorm
{
  return self->_maxNorm;
}

@end