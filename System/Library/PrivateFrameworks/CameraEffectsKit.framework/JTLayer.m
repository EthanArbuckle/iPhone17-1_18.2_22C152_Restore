@interface JTLayer
- (BOOL)debuggingUIEnabled;
- (JTLayer)initWithDebugEnabled;
- (void)setDebuggingUIEnabled:(BOOL)a3;
@end

@implementation JTLayer

- (JTLayer)initWithDebugEnabled
{
  v5.receiver = self;
  v5.super_class = (Class)JTLayer;
  v2 = [(JTLayer *)&v5 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F1C550] greenColor];
    -[JTLayer setBorderColor:](v2, "setBorderColor:", [v3 CGColor]);

    [(JTLayer *)v2 setBorderWidth:2.0];
    [(JTLayer *)v2 setDebuggingUIEnabled:1];
  }
  return v2;
}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

@end