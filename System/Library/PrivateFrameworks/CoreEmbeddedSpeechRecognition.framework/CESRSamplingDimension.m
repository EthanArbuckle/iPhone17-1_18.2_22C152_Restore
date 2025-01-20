@interface CESRSamplingDimension
- (BOOL)matches:(id)a3;
- (CESRSamplingDimension)initWithAsrLocale:(id)a3;
- (NSString)asrLocale;
- (id)description;
@end

@implementation CESRSamplingDimension

- (void).cxx_destruct
{
}

- (NSString)asrLocale
{
  return self->_asrLocale;
}

- (BOOL)matches:(id)a3
{
  v4 = (CESRSamplingDimension *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v7 = 0;
    goto LABEL_7;
  }
  asrLocale = self->_asrLocale;
  if (!asrLocale)
  {
LABEL_5:
    char v7 = 1;
  }
  else
  {
    v6 = [(CESRSamplingDimension *)v4 asrLocale];
    char v7 = [(NSString *)asrLocale isEqual:v6];
  }
LABEL_7:

  return v7;
}

- (id)description
{
  v2 = NSString;
  v3 = [(CESRSamplingDimension *)self asrLocale];
  v4 = [v2 stringWithFormat:@"< asrLocale=%@ >", v3];

  return v4;
}

- (CESRSamplingDimension)initWithAsrLocale:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CESRSamplingDimension;
  v6 = [(CESRSamplingDimension *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_asrLocale, a3);
  }

  return v7;
}

@end