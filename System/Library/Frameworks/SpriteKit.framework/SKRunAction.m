@interface SKRunAction
+ (BOOL)supportsSecureCoding;
+ (id)runAction:(id)a3 afterActionWithKey:(id)a4;
+ (id)runAction:(id)a3 onFirstChildWithName:(id)a4;
- (SKRunAction)init;
- (SKRunAction)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SKRunAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRunAction)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKRunAction;
  v2 = [(SKAction *)&v8 init];
  v3 = v2;
  if (v2)
  {
    action = v2->_action;
    v2->_action = 0;

    subSpriteKey = v3->_subSpriteKey;
    v3->_subSpriteKey = 0;

    actionKey = v3->_actionKey;
    v3->_actionKey = 0;

    v3->_waitForKeyedAction = 0;
    v3->_runOnSubSprite = 0;
    v3->_fired = 0;
  }
  return v3;
}

- (SKRunAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKRunAction;
  v5 = [(SKAction *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_action"];
    action = v5->_action;
    v5->_action = (SKAction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subSpriteKey"];
    subSpriteKey = v5->_subSpriteKey;
    v5->_subSpriteKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_actionKey"];
    actionKey = v5->_actionKey;
    v5->_actionKey = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_waitForKeyedAction"];
    v5->_waitForKeyedAction = [v12 BOOLValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_runOnSubSprite"];
    v5->_runOnSubSprite = [v13 BOOLValue];

    v5->_fired = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKRunAction;
  [(SKAction *)&v7 encodeWithCoder:v4];
  [v4 encodeObject:self->_action forKey:@"_action"];
  [v4 encodeObject:self->_subSpriteKey forKey:@"_subSpriteKey"];
  [v4 encodeObject:self->_actionKey forKey:@"_actionKey"];
  v5 = [NSNumber numberWithBool:self->_waitForKeyedAction];
  [v4 encodeObject:v5 forKey:@"_waitForKeyedAction"];

  uint64_t v6 = [NSNumber numberWithBool:self->_runOnSubSprite];
  [v4 encodeObject:v6 forKey:@"_runOnSubSprite"];
}

+ (id)runAction:(id)a3 onFirstChildWithName:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (NSString *)a4;
  objc_super v7 = objc_alloc_init(SKRunAction);
  uint64_t v8 = [v5 copy];
  action = v7->_action;
  v7->_action = (SKAction *)v8;

  subSpriteKey = v7->_subSpriteKey;
  v7->_subSpriteKey = v6;

  v7->_runOnSubSprite = 1;

  return v7;
}

+ (id)runAction:(id)a3 afterActionWithKey:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (NSString *)a4;
  objc_super v7 = objc_alloc_init(SKRunAction);
  uint64_t v8 = [v5 copy];
  action = v7->_action;
  v7->_action = (SKAction *)v8;

  actionKey = v7->_actionKey;
  v7->_actionKey = v6;

  v7->_waitForKeyedAction = 1;

  return v7;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKRunAction;
  [(SKAction *)&v5 willStartWithTarget:a3 atTime:a4];
  self->_fired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v5 = a3;
  if (!self->_fired)
  {
    if (self->_runOnSubSprite)
    {
      id v9 = v5;
      uint64_t v6 = [v5 childNodeWithName:self->_subSpriteKey];
      objc_super v7 = v6;
      if (v6) {
        [v6 runAction:self->_action];
      }
      self->_fired = 1;
      [(SKAction *)self setFinished:1];

      goto LABEL_6;
    }
    if (self->_waitForKeyedAction)
    {
      id v9 = v5;
      uint64_t v8 = [v5 actionForKey:self->_actionKey];

      id v5 = v9;
      if (!v8)
      {
        [v9 runAction:self->_action];
        self->_fired = 1;
LABEL_6:
        id v5 = v9;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SKRunAction);
  id v5 = [(SKAction *)self->_action copy];
  action = v4->_action;
  v4->_action = v5;

  objc_storeStrong((id *)&v4->_actionKey, self->_actionKey);
  objc_storeStrong((id *)&v4->_subSpriteKey, self->_subSpriteKey);
  v4->_waitForKeyedAction = self->_waitForKeyedAction;
  v4->_runOnSubSprite = self->_runOnSubSprite;
  return v4;
}

- (id)reversedAction
{
  v3 = objc_alloc_init(SKRunAction);
  uint64_t v4 = [(SKAction *)self->_action reversedAction];
  action = v3->_action;
  v3->_action = (SKAction *)v4;

  objc_storeStrong((id *)&v3->_actionKey, self->_actionKey);
  objc_storeStrong((id *)&v3->_subSpriteKey, self->_subSpriteKey);
  v3->_waitForKeyedAction = self->_waitForKeyedAction;
  v3->_runOnSubSprite = self->_runOnSubSprite;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_subSpriteKey, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end