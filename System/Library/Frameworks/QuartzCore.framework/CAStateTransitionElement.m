@interface CAStateTransitionElement
+ (BOOL)supportsSecureCoding;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)isEnabled;
- (CAAnimation)animation;
- (CALayer)target;
- (CAStateTransitionElement)init;
- (CAStateTransitionElement)initWithCoder:(id)a3;
- (NSString)key;
- (double)beginTime;
- (double)duration;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimation:(id)a3;
- (void)setBeginTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation CAStateTransitionElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALayer)target
{
  return (CALayer *)objc_loadWeak((id *)&self->_target);
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (id)CAMLTypeForKey:(id)a3
{
  v4 = (void *)-[CAStateTransitionElement CAMLTypeForKey:]::dict;
  if (!-[CAStateTransitionElement CAMLTypeForKey:]::dict)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"CALayer", @"target", @"string", @"targetId", @"CAAnimation", @"animation", @"string", @"key", @"BOOL", @"enabled", 0);
    -[CAStateTransitionElement CAMLTypeForKey:]::dict = (uint64_t)v4;
  }

  return (id)[v4 objectForKey:a3];
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  v5 = (__CFString *)a5;
  if ([a5 isEqualToString:@"targetId"])
  {
    a4 = (id)[a3 objectById:a4];
    v5 = @"target";
  }

  [(CAStateTransitionElement *)self setValue:a4 forKey:v5];
}

- (void)setKey:(id)a3
{
}

- (void)setAnimation:(id)a3
{
}

- (CAStateTransitionElement)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAStateTransitionElement;
  v4 = [(CAStateTransitionElement *)&v8 init];
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"target");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeWeak((id *)&v4->_target, v5);
    }
    v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"animation");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_animation = (CAAnimation *)v6;
    }
    v4->_key = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"key"), "copy");
    if ([a3 containsValueForKey:@"enabled"]) {
      v4->_enabled = [a3 decodeBoolForKey:@"enabled"];
    }
    else {
      v4->_enabled = 1;
    }
  }
  return v4;
}

- (void)setTarget:(id)a3
{
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

- (CAStateTransitionElement)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->_enabled = 1;
  v3.receiver = self;
  v3.super_class = (Class)CAStateTransitionElement;
  return [(CAStateTransitionElement *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  p_target = &self->_target;
  objc_loadWeak((id *)&self->_target);
  uint64_t v5 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<CAStateTransitionElement target=<%@: %p> key=%@ %@>", v5, objc_loadWeak((id *)p_target), self->_key, self->_animation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateTransitionElement);
  [(CAStateTransitionElement *)v4 setEnabled:self->_enabled];
  [(CAStateTransitionElement *)v4 setTarget:objc_loadWeak((id *)&self->_target)];
  [(CAStateTransitionElement *)v4 setAnimation:self->_animation];
  [(CAStateTransitionElement *)v4 setKey:self->_key];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  p_target = &self->_target;
  if (objc_loadWeak((id *)&self->_target)) {
    [a3 encodeConditionalObject:objc_loadWeak((id *)p_target) forKey:@"target"];
  }
  animation = self->_animation;
  if (animation) {
    [a3 encodeObject:animation forKey:@"animation"];
  }
  key = self->_key;
  if (key) {
    [a3 encodeObject:key forKey:@"key"];
  }
  if (!self->_enabled)
  {
    [a3 encodeBool:0 forKey:@"enabled"];
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
  if (!self->_enabled) {
    [a3 setElementAttribute:@"false" forKey:@"enabled"];
  }
  key = self->_key;
  if (key) {
    [a3 setElementAttribute:key forKey:@"key"];
  }
  if (objc_loadWeak((id *)&self->_target))
  {
    [a3 beginPropertyElement:@"target"];
    [a3 encodeObject:objc_loadWeak((id *)&self->_target)];
    [a3 endElement];
  }
  if (self->_animation)
  {
    [a3 beginPropertyElement:@"animation"];
    [a3 encodeObject:self->_animation];
    [a3 endElement];
  }
}

- (void)setDuration:(double)a3
{
}

- (double)duration
{
  animation = self->_animation;
  if (!animation) {
    return 0.0;
  }
  [(CAAnimation *)animation duration];
  return result;
}

- (void)setBeginTime:(double)a3
{
}

- (double)beginTime
{
  animation = self->_animation;
  if (!animation) {
    return 0.0;
  }
  [(CAAnimation *)animation beginTime];
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateTransitionElement;
  [(CAStateTransitionElement *)&v3 dealloc];
}

@end