@interface SKRemove
+ (BOOL)supportsSecureCoding;
+ (id)removeFromParent;
- (SKRemove)init;
- (SKRemove)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SKRemove

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRemove)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKRemove;
  result = [(SKAction *)&v3 init];
  if (result) {
    result->_hasFired = 0;
  }
  return result;
}

- (SKRemove)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRemove;
  v5 = [(SKAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hasFired"];
    v5->_hasFired = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKRemove;
  [(SKAction *)&v6 encodeWithCoder:v4];
  v5 = [NSNumber numberWithBool:self->_hasFired];
  [v4 encodeObject:v5 forKey:@"_hasFired"];
}

+ (id)removeFromParent
{
  v2 = objc_alloc_init(SKRemove);

  return v2;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKRemove;
  [(SKAction *)&v5 willStartWithTarget:a3 atTime:a4];
  self->_hasFired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v5 = a3;
  if (!self->_hasFired)
  {
    [(SKAction *)self setFinished:1];
    [v5 removeFromParent];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return v2;
}

@end