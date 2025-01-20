@interface CUIPSDLayerEffects
- (BOOL)visible;
- (CUIPSDLayerEffects)init;
- (NSMutableDictionary)effectList;
- (double)effectScale;
- (id)colorOverlay;
- (id)dropShadow;
- (void)addLayerEffectComponent:(id)a3;
- (void)dealloc;
- (void)setEffectList:(id)a3;
- (void)setEffectScale:(double)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CUIPSDLayerEffects

- (CUIPSDLayerEffects)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUIPSDLayerEffects;
  v2 = [(CUIPSDLayerEffects *)&v4 init];
  v2->_effectList = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
  return v2;
}

- (id)dropShadow
{
  return [(NSMutableDictionary *)self->_effectList objectForKey:&unk_1EF4A6B68];
}

- (id)colorOverlay
{
  return [(NSMutableDictionary *)self->_effectList objectForKey:&unk_1EF4A6B80];
}

- (void)addLayerEffectComponent:(id)a3
{
  id v5 = [a3 effectType];
  effectList = self->_effectList;
  v7 = +[NSNumber numberWithUnsignedInt:v5];
  [(NSMutableDictionary *)effectList setObject:a3 forKey:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffects;
  [(CUIPSDLayerEffects *)&v3 dealloc];
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (double)effectScale
{
  return self->_effectScale;
}

- (void)setEffectScale:(double)a3
{
  self->_effectScale = a3;
}

- (NSMutableDictionary)effectList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEffectList:(id)a3
{
}

@end