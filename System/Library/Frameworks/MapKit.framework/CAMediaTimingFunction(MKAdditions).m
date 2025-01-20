@interface CAMediaTimingFunction(MKAdditions)
+ (id)sigmoidFunction;
@end

@implementation CAMediaTimingFunction(MKAdditions)

+ (id)sigmoidFunction
{
  v0 = (void *)sigmoidFunction__sigmoidFunction;
  if (!sigmoidFunction__sigmoidFunction)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v2) = 0.5;
    LODWORD(v3) = 0.5;
    LODWORD(v4) = 0.5;
    LODWORD(v5) = 1.0;
    uint64_t v6 = [v1 initWithControlPoints:v2 :v3 :v4 :v5];
    v7 = (void *)sigmoidFunction__sigmoidFunction;
    sigmoidFunction__sigmoidFunction = v6;

    v0 = (void *)sigmoidFunction__sigmoidFunction;
  }

  return v0;
}

@end