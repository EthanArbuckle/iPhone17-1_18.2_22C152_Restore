@interface SKButtonNodeSprite
+ (BOOL)supportsSecureCoding;
+ (id)buttonWithFontNamed:(id)a3;
- (SKAction)downAction;
- (SKAction)upAction;
- (SKButtonNodeSprite)init;
- (SKButtonNodeSprite)initWithCoder:(id)a3;
- (SKButtonNodeSpriteDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)onTouchDownInside:(id)a3;
- (void)onTouchUp:(id)a3;
- (void)onTouchUpInside:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownAction:(id)a3;
- (void)setUpAction:(id)a3;
- (void)touchBegan:(unint64_t)a3 location:(CGPoint)a4;
- (void)touchEnded:(unint64_t)a3 location:(CGPoint)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SKButtonNodeSprite

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKButtonNodeSprite)init
{
  v12.receiver = self;
  v12.super_class = (Class)SKButtonNodeSprite;
  v2 = [(SKSpriteNode *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(SKNode *)v2 setUserInteractionEnabled:1];
    v3->_touches = 0;
    uint64_t v4 = +[SKScale scaleBy:1.3 duration:0.05];
    downAction = v3->_downAction;
    v3->_downAction = (SKAction *)v4;

    uint64_t v6 = +[SKScale scaleBy:0.769230769 duration:0.1];
    upAction = v3->_upAction;
    v3->_upAction = (SKAction *)v6;

    objc_storeWeak((id *)&v3->_delegate, 0);
    id downBlock = v3->_downBlock;
    v3->_id downBlock = 0;

    id upBlock = v3->_upBlock;
    v3->_id upBlock = 0;

    id upInsideBlock = v3->_upInsideBlock;
    v3->_id upInsideBlock = 0;
  }
  return v3;
}

+ (id)buttonWithFontNamed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() labelNodeWithFontNamed:v3];

  return v4;
}

- (SKButtonNodeSprite)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKButtonNodeSprite;
  v5 = [(SKSpriteNode *)&v10 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(SKNode *)v5 setUserInteractionEnabled:1];
    v6->_touches = 0;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_downAction"];
    [(SKButtonNodeSprite *)v6 setDownAction:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_upAction"];
    [(SKButtonNodeSprite *)v6 setUpAction:v8];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKButtonNodeSprite;
  id v4 = a3;
  [(SKSpriteNode *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_downAction, @"_downAction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_upAction forKey:@"_upAction"];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    double v9 = *MEMORY[0x263F00148];
    double v10 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        v13 = [(SKNode *)self scene];
        double v14 = v10;
        double v15 = v9;
        if (v13)
        {
          [v12 locationInNode:v13];
          -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v13);
          double v15 = v16;
          double v14 = v17;
        }
        -[SKButtonNodeSprite touchBegan:location:](self, "touchBegan:location:", [v12 hash], v15, v14);

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    double v9 = *MEMORY[0x263F00148];
    double v10 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        v13 = [(SKNode *)self scene];
        double v14 = v10;
        double v15 = v9;
        if (v13)
        {
          [v12 locationInNode:v13];
          -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v13);
          double v15 = v16;
          double v14 = v17;
        }
        -[SKButtonNodeSprite touchEnded:location:](self, "touchEnded:location:", [v12 hash], v15, v14);

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)touchBegan:(unint64_t)a3 location:(CGPoint)a4
{
  int touches = self->_touches;
  self->_int touches = touches + 1;
  if (!touches)
  {
    if (self->_downAction)
    {
      [(SKNode *)self removeActionForKey:@"SKButtonNode.action.up", a4.x, a4.y];
      [(SKNode *)self runAction:self->_downAction withKey:@"SKButtonNode.action.down"];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 touchDownInsideButton:self];
    }
    id downBlock = self->_downBlock;
    if (downBlock)
    {
      double v9 = (void (*)(void))*((void *)downBlock + 2);
      v9();
    }
  }
}

- (void)touchEnded:(unint64_t)a3 location:(CGPoint)a4
{
  int touches = self->_touches;
  BOOL v5 = __OFSUB__(touches--, 1);
  self->_int touches = touches;
  if ((touches < 0) ^ v5 | (touches == 0))
  {
    double y = a4.y;
    double x = a4.x;
    self->_int touches = 0;
    upAction = self->_upAction;
    if (upAction)
    {
      double v10 = +[SKRunAction runAction:upAction afterActionWithKey:@"SKButtonNode.action.down"];
      [(SKNode *)self runAction:v10 withKey:@"SKButtonNode.action.up"];
    }
    id upBlock = (void (**)(id, SKButtonNodeSprite *))self->_upBlock;
    if (upBlock) {
      upBlock[2](upBlock, self);
    }
    if (-[SKNode containsPoint:](self, "containsPoint:", x, y))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 touchUpInsideButton:self];
      }
      id upInsideBlock = self->_upInsideBlock;
      if (upInsideBlock)
      {
        double v15 = (void (*)(void))*((void *)upInsideBlock + 2);
        v15();
      }
    }
  }
}

- (void)onTouchUpInside:(id)a3
{
  id v4 = (void *)MEMORY[0x21052F3F0](a3, a2);
  id upInsideBlock = self->_upInsideBlock;
  self->_id upInsideBlock = v4;
}

- (void)onTouchUp:(id)a3
{
  id v4 = (void *)MEMORY[0x21052F3F0](a3, a2);
  id upBlock = self->_upBlock;
  self->_id upBlock = v4;
}

- (void)onTouchDownInside:(id)a3
{
  id v4 = (void *)MEMORY[0x21052F3F0](a3, a2);
  id downBlock = self->_downBlock;
  self->_id downBlock = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKButtonNodeSprite;
  id v4 = [(SKSpriteNode *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 22, self->_downAction);
  objc_storeStrong(v4 + 23, self->_upAction);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v4 + 21, WeakRetained);

  return v4;
}

- (SKButtonNodeSpriteDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKButtonNodeSpriteDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKAction)downAction
{
  return self->_downAction;
}

- (void)setDownAction:(id)a3
{
}

- (SKAction)upAction
{
  return self->_upAction;
}

- (void)setUpAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upInsideBlock, 0);
  objc_storeStrong(&self->_upBlock, 0);
  objc_storeStrong(&self->_downBlock, 0);
  objc_storeStrong((id *)&self->_upAction, 0);
  objc_storeStrong((id *)&self->_downAction, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end