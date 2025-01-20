@interface PBCodable(GEOClientMetrics)
- (void)setClientMetricsIfSupported:()GEOClientMetrics;
@end

@implementation PBCodable(GEOClientMetrics)

- (void)setClientMetricsIfSupported:()GEOClientMetrics
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [a1 setClientMetrics:v4];
  }
}

@end