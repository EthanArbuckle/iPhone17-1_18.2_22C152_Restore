@interface MKRoutePolyline
- (BOOL)_requiresModernMap;
- (id)_stepWithRange:(_NSRange)a3;
- (void)_setRequiresModernMap:(BOOL)a3;
@end

@implementation MKRoutePolyline

- (id)_stepWithRange:(_NSRange)a3
{
  id v3 = -[MKRouteStepPolyline _initWithRoute:range:]([MKRouteStepPolyline alloc], "_initWithRoute:range:", self, a3.location, a3.length);

  return v3;
}

- (BOOL)_requiresModernMap
{
  return (GEOConfigGetBOOL() & 1) == 0 && *(&self->super.super._selfIntersecting + 2);
}

- (void)_setRequiresModernMap:(BOOL)a3
{
  *(&self->super.super._selfIntersecting + 2) = a3;
}

@end