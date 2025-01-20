@interface LNActionSideEffect
+ (BOOL)supportsSecureCoding;
+ (id)noneSideEffect;
+ (id)sideEffectWithChangeEffect:(int64_t)a3;
+ (id)unknownSideEffect;
- (BOOL)isEqual:(id)a3;
- (LNActionSideEffect)initWithCoder:(id)a3;
- (LNActionSideEffect)initWithSideEffect:(int64_t)a3 changeEffect:(int64_t)a4;
- (id)description;
- (int64_t)changeEffect;
- (int64_t)effect;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionSideEffect

- (LNActionSideEffect)initWithSideEffect:(int64_t)a3 changeEffect:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)LNActionSideEffect;
  v6 = [(LNActionSideEffect *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_effect = a3;
    v6->_changeEffect = a4;
    v8 = v6;
  }

  return v7;
}

- (LNActionSideEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"effect"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"changeEffect"];

  return [(LNActionSideEffect *)self initWithSideEffect:v5 changeEffect:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionSideEffect effect](self, "effect"), @"effect");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionSideEffect changeEffect](self, "changeEffect"), @"changeEffect");
}

- (int64_t)effect
{
  return self->_effect;
}

- (int64_t)changeEffect
{
  return self->_changeEffect;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionSideEffect *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
    goto LABEL_10;
  }
  uint64_t v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v6 = 0;
    goto LABEL_7;
  }
  int64_t v7 = [(LNActionSideEffect *)self effect];
  if (v7 != [(LNActionSideEffect *)v6 effect])
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  int64_t v8 = [(LNActionSideEffect *)self changeEffect];
  BOOL v9 = v8 == [(LNActionSideEffect *)v6 changeEffect];
LABEL_8:

LABEL_10:
  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNActionSideEffect *)self effect];
  return [(LNActionSideEffect *)self changeEffect] ^ v3;
}

- (id)description
{
  int64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNActionSideEffect *)self effect];
  int64_t v7 = @"Unknown";
  if (!v6) {
    int64_t v7 = @"None";
  }
  if (v6 == 1) {
    int64_t v7 = @"Change";
  }
  int64_t v8 = v7;
  BOOL v9 = LNChangeEffectAsString([(LNActionSideEffect *)self changeEffect]);
  objc_super v10 = [v3 stringWithFormat:@"<%@: %p, change: %@, effects: %@>", v5, self, v8, v9];

  return v10;
}

+ (id)sideEffectWithChangeEffect:(int64_t)a3
{
  int64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSideEffect:1 changeEffect:a3];
  return v3;
}

+ (id)noneSideEffect
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSideEffect:0 changeEffect:0];
  return v2;
}

+ (id)unknownSideEffect
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSideEffect:-1 changeEffect:-1];
  return v2;
}

@end