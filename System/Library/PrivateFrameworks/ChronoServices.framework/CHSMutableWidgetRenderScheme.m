@interface CHSMutableWidgetRenderScheme
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundViewPolicy:(unint64_t)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setRenderingModes:(unint64_t)a3;
@end

@implementation CHSMutableWidgetRenderScheme

- (void)setRenderingMode:(unint64_t)a3
{
  self->super._renderingMode = a3;
}

- (void)setBackgroundViewPolicy:(unint64_t)a3
{
  self->super._backgroundViewPolicy = a3;
}

- (void)setRenderingModes:(unint64_t)a3
{
  self->super._renderingModes = a3;
}

- (void)setOpaque:(BOOL)a3
{
  self->super._backgroundViewPolicy = !a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CHSWidgetRenderScheme allocWithZone:a3];
  return -[CHSWidgetRenderScheme _initWithWidgetRenderScheme:](v4, self);
}

@end