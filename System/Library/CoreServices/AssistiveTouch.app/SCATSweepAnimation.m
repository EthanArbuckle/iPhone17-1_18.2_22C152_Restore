@interface SCATSweepAnimation
+ (id)sweepAnimationWithDirection:(BOOL)a3 scatLayer:(id)a4 animationKey:(id)a5;
- (BOOL)forwardDirection;
- (NSString)animationKey;
- (SCATAxisLayer)scatLayer;
- (SCATSweepAnimation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reversedAnimation;
- (void)_updateAnimationKeyWithPrefix:(id)a3 direction:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationKey:(id)a3;
- (void)setForwardDirection:(BOOL)a3;
- (void)setScatLayer:(id)a3;
@end

@implementation SCATSweepAnimation

+ (id)sweepAnimationWithDirection:(BOOL)a3 scatLayer:(id)a4 animationKey:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  v9 = +[SCATSweepAnimation animationWithKeyPath:@"position"];
  [v9 setForwardDirection:v6];
  [v9 setScatLayer:v8];

  [v9 _updateAnimationKeyWithPrefix:v7 direction:v6];

  return v9;
}

- (void)_updateAnimationKeyWithPrefix:(id)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 rangeOfString:@"-forward"];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v6 substringToIndex:v7];

    id v6 = (id)v8;
  }
  id v9 = [v6 rangeOfString:@"-reversed"];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v6 substringToIndex:v9];

    id v6 = (id)v10;
  }
  v11 = [v6 stringByReplacingOccurrencesOfString:@"-forward" withString:&stru_1001B1E10];
  id v17 = [v11 stringByReplacingOccurrencesOfString:@"-reversed" withString:&stru_1001B1E10];

  v12 = +[NSUUID UUID];
  uint64_t v13 = [v12 UUIDString];
  v14 = (void *)v13;
  if (v4) {
    CFStringRef v15 = @"%@-forward-%@";
  }
  else {
    CFStringRef v15 = @"%@-reversed-%@";
  }
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v17, v13);
  [(SCATSweepAnimation *)self setAnimationKey:v16];
}

- (id)description
{
  v3 = +[NSNumber numberWithBool:[(SCATSweepAnimation *)self forwardDirection]];
  BOOL v4 = [(SCATSweepAnimation *)self scatLayer];
  v5 = [(SCATSweepAnimation *)self delegate];
  id v6 = [(SCATSweepAnimation *)self animationKey];
  id v7 = [(SCATSweepAnimation *)self fromValue];
  uint64_t v8 = [(SCATSweepAnimation *)self toValue];
  [(SCATSweepAnimation *)self duration];
  id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v10 = [(SCATSweepAnimation *)self fillMode];
  v11 = +[NSNumber numberWithBool:[(SCATSweepAnimation *)self isRemovedOnCompletion]];
  v12 = +[NSString stringWithFormat:@"SCATSweepAnimation<%p>. forward:%@ scatLayer:%p delegate:%p animateKey:%@ from:%@ to:%@ duration:%@ fill:%@ rmOnComplete:%@", self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)reversedAnimation
{
  uint64_t v3 = [(SCATSweepAnimation *)self forwardDirection] ^ 1;
  BOOL v4 = [(SCATSweepAnimation *)self scatLayer];
  v5 = [(SCATSweepAnimation *)self animationKey];
  id v6 = +[SCATSweepAnimation sweepAnimationWithDirection:v3 scatLayer:v4 animationKey:v5];

  id v7 = [(SCATSweepAnimation *)self delegate];
  [v6 setDelegate:v7];

  uint64_t v8 = [(SCATSweepAnimation *)self fromValue];
  [v6 setToValue:v8];

  id v9 = [(SCATSweepAnimation *)self toValue];
  [v6 setFromValue:v9];

  [(SCATSweepAnimation *)self duration];
  objc_msgSend(v6, "setDuration:");
  objc_msgSend(v6, "setRemovedOnCompletion:", -[SCATSweepAnimation isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  uint64_t v10 = [(SCATSweepAnimation *)self fillMode];
  [v6 setFillMode:v10];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCATSweepAnimation;
  id v4 = a3;
  [(SCATSweepAnimation *)&v7 encodeWithCoder:v4];
  v5 = [(SCATSweepAnimation *)self scatLayer];
  [v4 encodeObject:v5 forKey:@"scatLayer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SCATSweepAnimation forwardDirection](self, "forwardDirection"), @"forwardDirection");
  id v6 = [(SCATSweepAnimation *)self animationKey];
  [v4 encodeObject:v6 forKey:@"animationKey"];
}

- (SCATSweepAnimation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATSweepAnimation;
  v5 = [(SCATSweepAnimation *)&v9 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"scatLayer"];
    [(SCATSweepAnimation *)v5 setScatLayer:v6];

    -[SCATSweepAnimation setForwardDirection:](v5, "setForwardDirection:", [v4 decodeBoolForKey:@"forwardDirection"]);
    objc_super v7 = [v4 decodeObjectForKey:@"animationKey"];
    [(SCATSweepAnimation *)v5 setAnimationKey:v7];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCATSweepAnimation;
  id v4 = [(SCATSweepAnimation *)&v9 copyWithZone:a3];
  v5 = [(SCATSweepAnimation *)self delegate];
  [v4 setDelegate:v5];

  id v6 = [(SCATSweepAnimation *)self scatLayer];
  [v4 setScatLayer:v6];

  objc_msgSend(v4, "setForwardDirection:", -[SCATSweepAnimation forwardDirection](self, "forwardDirection"));
  objc_super v7 = [(SCATSweepAnimation *)self animationKey];
  [v4 setAnimationKey:v7];

  return v4;
}

- (BOOL)forwardDirection
{
  return *((unsigned char *)&self->super.super.super._flags + 4);
}

- (void)setForwardDirection:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super._flags + 4) = a3;
}

- (SCATAxisLayer)scatLayer
{
  return *(SCATAxisLayer **)&self->_forwardDirection;
}

- (void)setScatLayer:(id)a3
{
  *(void *)&self->_forwardDirection = a3;
}

- (NSString)animationKey
{
  return (NSString *)&self->_scatLayer->super.super.isa;
}

- (void)setAnimationKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end