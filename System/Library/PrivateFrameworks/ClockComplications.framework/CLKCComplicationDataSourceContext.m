@interface CLKCComplicationDataSourceContext
- (BOOL)showsBackground;
- (CLKCComplicationDataSourceContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setShowsBackground:(BOOL)a3;
@end

@implementation CLKCComplicationDataSourceContext

- (CLKCComplicationDataSourceContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKCComplicationDataSourceContext;
  result = [(CLKCComplicationDataSourceContext *)&v3 init];
  if (result) {
    result->_showsBackground = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((unsigned char *)result + 8) = self->_showsBackground;
  return result;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (void)setShowsBackground:(BOOL)a3
{
  self->_showsBackground = a3;
}

@end