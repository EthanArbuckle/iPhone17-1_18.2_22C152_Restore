@interface CBAmmolite
- (CBAmmolite)initWithParams:(id)a3;
@end

@implementation CBAmmolite

- (CBAmmolite)initWithParams:(id)a3
{
  v4 = objc_alloc_init(CBAmmolitePolicy);
  v7 = [(CBChromaticCorrection *)self initWithBacklightParams:a3 andPolicy:v4];

  return v7;
}

@end