@interface QUINTIC
@end

@implementation QUINTIC

long double ___QUINTIC_GENERATOR_block_invoke(double *a1, long double a2)
{
  double v4 = a1[4];
  double v5 = pow(a2, 5.0);
  double v6 = a1[5];
  long double v7 = pow(a2, 4.0) * v6 + v4 * v5;
  double v8 = a1[6];
  return v7 + v8 * pow(a2, 3.0) + a1[7] * (a2 * a2) + a1[8] * a2;
}

@end