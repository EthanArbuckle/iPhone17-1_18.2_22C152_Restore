@interface BrightnessSystem
- (BOOL)isAlsSupported;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BrightnessSystem)init;
- (id)copyPropertyForKey:(id)a3;
- (void)dealloc;
- (void)registerNotificationBlock:(id)a3;
- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4;
@end

@implementation BrightnessSystem

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return -[BrightnessSystemInternal setProperty:forKey:client:](self->bsi, "setProperty:forKey:client:", a3, a4, 0, a4, a3, a2, self);
}

- (BrightnessSystem)init
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BrightnessSystem;
  v6 = [(BrightnessSystem *)&v4 init];
  if (v6)
  {
    v2 = objc_alloc_init(BrightnessSystemInternal);
    v6->bsi = v2;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (self->bsi)
  {
    [(BrightnessSystemInternal *)v4->bsi destroyServer];
  }
  v2.receiver = v4;
  v2.super_class = (Class)BrightnessSystem;
  [(BrightnessSystem *)&v2 dealloc];
}

- (id)copyPropertyForKey:(id)a3
{
  return [(BrightnessSystemInternal *)self->bsi copyPropertyForKey:a3 client:0];
}

- (BOOL)isAlsSupported
{
  return [(BrightnessSystemInternal *)self->bsi isAlsSupported];
}

- (void)registerNotificationBlock:(id)a3
{
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
}

@end