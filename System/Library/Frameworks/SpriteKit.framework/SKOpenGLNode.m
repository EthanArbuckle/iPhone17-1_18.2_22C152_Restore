@interface SKOpenGLNode
+ (id)openGLNodeWithViewportSize:(CGSize)a3;
- (BOOL)needsRenderForTime:(double)a3;
- (CGSize)viewportSize;
- (SKOpenGLNode)init;
- (SKOpenGLNode)initWithCoder:(id)a3;
- (SKOpenGLNode)initWithViewportSize:(CGSize)a3;
- (void)encodeWithCoder:(id)a3;
- (void)renderForTime:(double)a3;
@end

@implementation SKOpenGLNode

- (SKOpenGLNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKOpenGLNode;
  return [(SKNode *)&v3 init];
}

- (SKOpenGLNode)initWithViewportSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKOpenGLNode;
  return [(SKNode *)&v4 init];
}

- (SKOpenGLNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKOpenGLNode;
  return [(SKNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKOpenGLNode;
  [(SKNode *)&v5 encodeWithCoder:v4];
  [(SKOpenGLNode *)self viewportSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"viewportSize");
}

- (CGSize)viewportSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)openGLNodeWithViewportSize:(CGSize)a3
{
  double v3 = -[SKOpenGLNode initWithViewportSize:]([SKOpenGLNode alloc], "initWithViewportSize:", a3.width, a3.height);

  return v3;
}

- (BOOL)needsRenderForTime:(double)a3
{
  return 0;
}

- (void)renderForTime:(double)a3
{
  glClearColor(0.0, 0.0, 0.0, 0.0);

  glClear(0x4400u);
}

@end