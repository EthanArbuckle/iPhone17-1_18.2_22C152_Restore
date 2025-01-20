@interface CAShapeLayerAnimated
- (id)actionForKey:(id)a3;
@end

@implementation CAShapeLayerAnimated

- (id)actionForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    v5 = [MEMORY[0x263F15760] animationWithKeyPath:v4];

    objc_msgSend(v5, "setFromValue:", -[CAShapeLayerAnimated path](self, "path"));
    [MEMORY[0x263F158F8] animationDuration];
    objc_msgSend(v5, "setDuration:");
    id v4 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v5 setTimingFunction:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAShapeLayerAnimated;
    v5 = [(CAShapeLayerAnimated *)&v7 actionForKey:v4];
  }

  return v5;
}

@end