@interface KissNode
+ (id)kissNodeWithColor:(id)a3 size:(CGSize)a4;
- (BOOL)leavesMark;
- (CGPoint)position;
- (SKShader)shader;
- (SKSpriteNode)node;
- (UIColor)color;
- (double)colorBlendFactor;
- (double)zRotation;
- (int64_t)blendMode;
- (void)removeFromParent;
- (void)runAction:(id)a3;
- (void)setBlendMode:(int64_t)a3;
- (void)setColor:(id)a3;
- (void)setColorBlendFactor:(double)a3;
- (void)setColorBlendMode:(int64_t)a3;
- (void)setLeavesMark:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setScale:(double)a3;
- (void)setShader:(id)a3;
- (void)setZRotation:(double)a3;
@end

@implementation KissNode

+ (id)kissNodeWithColor:(id)a3 size:(CGSize)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(KissNode);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v6 = (void *)getSKSpriteNodeClass_softClass_2;
  uint64_t v16 = getSKSpriteNodeClass_softClass_2;
  if (!getSKSpriteNodeClass_softClass_2)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getSKSpriteNodeClass_block_invoke_2;
    v12[3] = &unk_264DEC848;
    v12[4] = &v13;
    __getSKSpriteNodeClass_block_invoke_2((uint64_t)v12);
    v6 = (void *)v14[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v13, 8);
  v8 = [MEMORY[0x263F1C550] clearColor];
  v9 = [v8 colorSpaceConvertedColor];
  v10 = objc_msgSend(v7, "spriteNodeWithColor:size:", v9, 256.0, 256.0);
  [(KissNode *)v5 setNode:v10];

  return v5;
}

- (void)setShader:(id)a3
{
  objc_storeStrong((id *)&self->_shader, a3);
  id v5 = a3;
  [(SKSpriteNode *)self->_node setShader:v5];
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  [(SKSpriteNode *)self->_node setColor:v5];
}

- (void)setColorBlendFactor:(double)a3
{
  self->_colorBlendFactor = a3;
  -[SKSpriteNode setColorBlendFactor:](self->_node, "setColorBlendFactor:");
}

- (void)setColorBlendMode:(int64_t)a3
{
  self->_blendMode = a3;
  -[SKSpriteNode setBlendMode:](self->_node, "setBlendMode:");
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
  -[SKSpriteNode setPosition:](self->_node, "setPosition:");
}

- (void)setZRotation:(double)a3
{
  self->_zRotation = a3;
  -[SKSpriteNode setZRotation:](self->_node, "setZRotation:");
}

- (void)setScale:(double)a3
{
}

- (void)runAction:(id)a3
{
}

- (void)removeFromParent
{
}

- (BOOL)leavesMark
{
  return self->_leavesMark;
}

- (void)setLeavesMark:(BOOL)a3
{
  self->_leavesMark = a3;
}

- (SKSpriteNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (SKShader)shader
{
  return self->_shader;
}

- (double)colorBlendFactor
{
  return self->_colorBlendFactor;
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int64_t)a3
{
  self->_blendMode = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)zRotation
{
  return self->_zRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_node, 0);
}

@end