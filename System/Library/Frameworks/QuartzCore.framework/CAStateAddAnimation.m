@interface CAStateAddAnimation
+ (BOOL)supportsSecureCoding;
- (BOOL)matches:(id)a3;
- (CAAnimation)animation;
- (CAStateAddAnimation)initWithCoder:(id)a3;
- (NSString)key;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)keyPath;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimation:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation CAStateAddAnimation

- (void)setAnimation:(id)a3
{
}

- (CAAnimation)animation
{
  return self->_animation;
}

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
  return (id)[v3 stringWithFormat:@"{%@:%p %@:%p %@ %@}", v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_key, self->_animation];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateAddAnimation;
  [(CAStateElement *)&v3 dealloc];
}

- (CAStateAddAnimation)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CAStateAddAnimation;
  uint64_t v4 = -[CAStateElement initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_key = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"key"), "copy");
    uint64_t v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"animation");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_animation = (CAAnimation *)v5;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAStateAddAnimation;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_key forKey:@"key"];
  [a3 encodeObject:self->_animation forKey:@"animation"];
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"key"]) {
    return @"string";
  }
  if ([a3 isEqualToString:@"animation"]) {
    return @"CAAnimation";
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddAnimation;
  return [(CAStateElement *)&v6 CAMLTypeForKey:a3];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddAnimation;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  key = self->_key;
  if (key) {
    [a3 setElementAttribute:key forKey:@"key"];
  }
  if (self->_animation)
  {
    [a3 beginPropertyElement:@"animation"];
    [a3 encodeObject:self->_animation];
    [a3 endElement];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateAddAnimation);
  v4->_key = self->_key;
  v4->_animation = self->_animation;
  [(CAStateElement *)v4 setTarget:objc_loadWeak((id *)&self->super._target)];
  return v4;
}

- (void)apply:(id)a3
{
  if (self->_animation && self->_key)
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
    [objc_loadWeak((id *)&self->super._target) addAnimation:self->_animation forKey:self->_key];
    uint64_t v8 = [objc_loadWeak((id *)&self->super._target) animationForKey:self->_key];
    animation = self->_animation;
    if ((CAAnimation *)v8 != animation)
    {
      v10 = (void *)v8;

      self->_animation = (CAAnimation *)v10;
    }
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