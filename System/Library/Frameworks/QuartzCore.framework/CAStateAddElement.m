@interface CAStateAddElement
+ (BOOL)supportsSecureCoding;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)matches:(id)a3;
- (CAStateAddElement)initWithCoder:(id)a3;
- (NSString)keyPath;
- (id)CAMLTypeForKey:(id)a3;
- (id)beforeObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)object;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)foreachLayer:(id)a3;
- (void)setBeforeObject:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation CAStateAddElement

- (void)setBeforeObject:(id)a3
{
}

- (id)beforeObject
{
  return self->_beforeObject;
}

- (void)setObject:(id)a3
{
}

- (id)object
{
  return self->_object;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_loadWeak((id *)&self->super._target);
  uint64_t v5 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"{%@:%p %@:%p %@ %@ before %@}", v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_object, self->_beforeObject];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateAddElement;
  [(CAStateElement *)&v3 dealloc];
}

- (CAStateAddElement)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  uint64_t v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"keyPath"), "copy");
    v4->_object = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", @"object");
    v4->_beforeObject = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", @"beforeObject");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAStateAddElement;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_keyPath forKey:@"keyPath"];
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_object, @"object", 0);
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_beforeObject, @"beforeObject", 0);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"object"] & 1) != 0
    || ([a3 isEqualToString:@"beforeObject"] & 1) != 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  return [(CAStateElement *)&v6 CAMLTypeSupportedForKey:a3];
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"keyPath"] & 1) != 0
    || ([a3 isEqualToString:@"objectId"] & 1) != 0
    || ([a3 isEqualToString:@"beforeObjectId"] & 1) != 0)
  {
    return @"string";
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  return [(CAStateElement *)&v6 CAMLTypeForKey:a3];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateAddElement;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  keyPath = self->_keyPath;
  if (keyPath) {
    [a3 setElementAttribute:keyPath forKey:@"keyPath"];
  }
  if (self->_object)
  {
    [a3 beginPropertyElement:@"object"];
    [a3 encodeObject:self->_object];
    [a3 endElement];
  }
  if (self->_beforeObject)
  {
    [a3 beginPropertyElement:@"beforeObject"];
    [a3 encodeObject:self->_beforeObject];
    [a3 endElement];
  }
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  objc_super v5 = (__CFString *)a5;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"objectId"])
  {
    objc_super v5 = @"object";
LABEL_5:
    a4 = (id)[a3 objectById:a4];
    goto LABEL_6;
  }
  if ([(__CFString *)v5 isEqualToString:@"beforeObjectId"])
  {
    objc_super v5 = @"beforeObject";
    goto LABEL_5;
  }
LABEL_6:
  v9.receiver = self;
  v9.super_class = (Class)CAStateAddElement;
  [(CAStateElement *)&v9 CAMLParser:a3 setValue:a4 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateAddElement);
  [(CAStateAddElement *)v4 setKeyPath:self->_keyPath];
  [(CAStateAddElement *)v4 setObject:self->_object];
  [(CAStateAddElement *)v4 setBeforeObject:self->_beforeObject];
  [(CAStateElement *)v4 setTarget:[(CAStateElement *)self target]];
  return v4;
}

- (void)foreachLayer:(id)a3
{
  if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
  {
    id object = self->_object;
    objc_super v6 = (void (*)(id, id))*((void *)a3 + 2);
    v6(a3, object);
  }
}

- (void)apply:(id)a3
{
  if (self->_object && self->_keyPath)
  {
    id v5 = (id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->super._target), "valueForKeyPath:", self->_keyPath), "mutableCopy");
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v9 = v5;
    if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
    {
      uint64_t v6 = [v9 indexOfObjectIdenticalTo:self->_object];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        [v9 removeObjectAtIndex:v6];
      }
    }
    if (a3)
    {
      uint64_t v7 = objc_alloc_init(CAStateRemoveElement);
      [(CAStateElement *)v7 setTarget:objc_loadWeak((id *)&self->super._target)];
      [(CAStateRemoveElement *)v7 setKeyPath:self->_keyPath];
      [(CAStateRemoveElement *)v7 setObject:self->_object];
      [(CAStateElement *)v7 setSource:self];
      [a3 addElement:v7];

      if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
      {
        if (objc_opt_respondsToSelector()) {
          [a3 willAddLayer:self->_object];
        }
      }
    }
    if (!self->_beforeObject || (uint64_t v8 = objc_msgSend(v9, "indexOfObjectIdenticalTo:"), v8 == 0x7FFFFFFFFFFFFFFFLL)) {
      uint64_t v8 = [v9 count];
    }
    [v9 insertObject:self->_object atIndex:v8];
    [objc_loadWeak((id *)&self->super._target) setValue:v9 forKeyPath:self->_keyPath];
  }
}

- (BOOL)matches:(id)a3
{
  id v5 = (id)[a3 target];
  if (v5 != objc_loadWeak((id *)&self->super._target)) {
    return 0;
  }
  uint64_t v7 = (void *)[a3 keyPath];
  keyPath = self->_keyPath;

  return [v7 isEqualToString:keyPath];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end