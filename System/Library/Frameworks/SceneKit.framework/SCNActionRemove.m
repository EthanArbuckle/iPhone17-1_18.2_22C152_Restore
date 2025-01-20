@interface SCNActionRemove
+ (BOOL)supportsSecureCoding;
+ (id)removeFromParentNode;
- (SCNActionRemove)init;
- (SCNActionRemove)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SCNActionRemove

- (SCNActionRemove)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRemove;
  result = [(SCNAction *)&v3 init];
  if (result) {
    result->_hasFired = 0;
  }
  return result;
}

- (SCNActionRemove)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionRemove;
  v4 = -[SCNAction initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_hasFired = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_hasFired"), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionRemove;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_hasFired), @"_hasFired");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)removeFromParentNode
{
  v2 = objc_alloc_init(SCNActionRemove);

  return v2;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionRemove;
  [(SCNAction *)&v5 willStartWithTarget:a3 atTime:a4];
  self->_hasFired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  if (!self->_hasFired)
  {
    -[SCNAction setFinished:](self, "setFinished:", 1, a4);
    id v5 = a3;
    [a3 removeFromParentNode];
    id v6 = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[SCNActionRemove removeFromParentNode];

  return v3;
}

- (id)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return v2;
}

@end