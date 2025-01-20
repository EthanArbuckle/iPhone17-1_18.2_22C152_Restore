@interface ATXHeroAndClipSessionLogSampledEvent
- (ATXAppOrClipLaunch)launch;
- (BOOL)isClip;
- (id)bundleId;
- (id)initFromLaunch:(id)a3;
- (id)location;
- (void)setLaunch:(id)a3;
@end

@implementation ATXHeroAndClipSessionLogSampledEvent

- (id)initFromLaunch:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAndClipSessionLogSampledEvent;
  v6 = [(ATXHeroAndClipSessionLogSampledEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_launch, a3);
  }

  return v7;
}

- (id)location
{
  id v3 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [(ATXAppOrClipLaunch *)self->_launch latitude];
  double v5 = v4;
  [(ATXAppOrClipLaunch *)self->_launch longitude];
  v7 = (void *)[v3 initWithLatitude:v5 longitude:v6];
  return v7;
}

- (id)bundleId
{
  return [(ATXAppOrClipLaunch *)self->_launch bundleId];
}

- (BOOL)isClip
{
  return [(ATXAppOrClipLaunch *)self->_launch isClip];
}

- (ATXAppOrClipLaunch)launch
{
  return self->_launch;
}

- (void)setLaunch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end