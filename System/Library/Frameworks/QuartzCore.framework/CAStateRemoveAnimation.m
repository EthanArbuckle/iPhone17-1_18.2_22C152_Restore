@interface CAStateRemoveAnimation
+ (BOOL)supportsSecureCoding;
- (BOOL)matches:(id)a3;
- (CAStateRemoveAnimation)initWithCoder:(id)a3;
- (NSString)key;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)keyPath;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation CAStateRemoveAnimation

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_loadWeak((id *)&self->super._target);
  uint64_t v5 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"{%@:%p %@:%p %@}", v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_key];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateRemoveAnimation;
  [(CAStateElement *)&v3 dealloc];
}

- (CAStateRemoveAnimation)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveAnimation;
  uint64_t v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_key = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"key"), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAStateRemoveAnimation;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_key forKey:@"key"];
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"key"]) {
    return @"string";
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveAnimation;
  return [(CAStateElement *)&v6 CAMLTypeForKey:a3];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveAnimation;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  key = self->_key;
  if (key) {
    [a3 setElementAttribute:key forKey:@"key"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateRemoveAnimation);
  v4->_key = self->_key;
  [(CAStateElement *)v4 setTarget:objc_loadWeak((id *)&self->super._target)];
  return v4;
}

- (void)apply:(id)a3
{
  if (self->_key)
  {
    if (a3)
    {
      uint64_t v5 = [objc_loadWeak((id *)&self->super._target) animationForKey:self->_key];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = objc_alloc_init(CAStateAddAnimation);
        [(CAStateAddAnimation *)v7 setKey:self->_key];
        [(CAStateAddAnimation *)v7 setAnimation:v6];
      }
      else
      {
        uint64_t v7 = objc_alloc_init(CAStateRemoveAnimation);
        [(CAStateAddAnimation *)v7 setKey:self->_key];
      }
      [(CAStateElement *)v7 setTarget:objc_loadWeak((id *)&self->super._target)];
      [(CAStateElement *)v7 setSource:self];
      [a3 addElement:v7];
    }
    id Weak = objc_loadWeak((id *)&self->super._target);
    key = self->_key;
    [Weak removeAnimationForKey:key];
  }
}

- (BOOL)matches:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  id v5 = (id)[a3 target];
  if (v5 != objc_loadWeak((id *)&self->super._target)) {
    return 0;
  }
  uint64_t v7 = (void *)[a3 key];
  key = self->_key;

  return [v7 isEqualToString:key];
}

- (id)keyPath
{
  key = self->_key;
  if (key) {
    return (id)[NSString stringWithFormat:@"animations.%@", key];
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end