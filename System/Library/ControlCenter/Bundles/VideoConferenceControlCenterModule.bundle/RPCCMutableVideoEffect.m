@interface RPCCMutableVideoEffect
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIntensityName:(id)a3;
- (void)setName:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setTintColorName:(id)a3;
@end

@implementation RPCCMutableVideoEffect

- (void)setTintColorName:(id)a3
{
  self->super._tintColorName = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (void)setSymbolImageName:(id)a3
{
  self->super._symbolImageName = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (void)setName:(id)a3
{
  self->super._name = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (void)setIntensityName:(id)a3
{
  self->super._intensityName = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [RPCCVideoEffect alloc];

  return [(RPCCVideoEffect *)v4 _initWithEffect:self];
}

@end