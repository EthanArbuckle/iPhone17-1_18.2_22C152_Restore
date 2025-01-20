@interface SKOverlayConfiguration
- (ASOOverlayConfiguration)_backing;
- (SKOverlayConfiguration)initWithBacking:(id)a3;
- (id)_init;
@end

@implementation SKOverlayConfiguration

- (SKOverlayConfiguration)initWithBacking:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlayConfiguration;
  v6 = [(SKOverlayConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__backing, a3);
  }

  return v7;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SKOverlayConfiguration;
  return [(SKOverlayConfiguration *)&v3 init];
}

- (ASOOverlayConfiguration)_backing
{
  return self->__backing;
}

- (void).cxx_destruct
{
}

@end