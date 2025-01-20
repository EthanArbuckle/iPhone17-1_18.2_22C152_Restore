@interface CAStateRemoveElement
+ (BOOL)supportsSecureCoding;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)matches:(id)a3;
- (CAStateRemoveElement)initWithCoder:(id)a3;
- (NSString)keyPath;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)object;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation CAStateRemoveElement

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
  return (id)[v3 stringWithFormat:@"{%@:%p %@:%p %@ %@}", v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_object];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateRemoveElement;
  [(CAStateElement *)&v3 dealloc];
}

- (CAStateRemoveElement)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  uint64_t v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"keyPath"), "copy");
    v4->_object = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", @"object");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAStateRemoveElement;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_keyPath forKey:@"keyPath"];
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_object, @"object", 0);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"object"]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  return [(CAStateElement *)&v6 CAMLTypeSupportedForKey:a3];
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"keyPath"] & 1) != 0
    || ([a3 isEqualToString:@"objectId"] & 1) != 0)
  {
    return @"string";
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
  return [(CAStateElement *)&v6 CAMLTypeForKey:a3];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateRemoveElement;
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
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  objc_super v5 = (__CFString *)a5;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"objectId"])
  {
    a4 = (id)[a3 objectById:a4];
    objc_super v5 = @"object";
  }
  v9.receiver = self;
  v9.super_class = (Class)CAStateRemoveElement;
  [(CAStateElement *)&v9 CAMLParser:a3 setValue:a4 forKey:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateRemoveElement);
  [(CAStateRemoveElement *)v4 setKeyPath:self->_keyPath];
  [(CAStateRemoveElement *)v4 setObject:self->_object];
  [(CAStateElement *)v4 setTarget:[(CAStateElement *)self target]];
  return v4;
}

- (void)apply:(id)a3
{
  if (self->_object)
  {
    if (self->_keyPath)
    {
      objc_super v5 = (void *)[objc_loadWeak((id *)&self->super._target) valueForKeyPath:self->_keyPath];
      if (v5)
      {
        objc_super v6 = v5;
        uint64_t v7 = [v5 indexOfObjectIdenticalTo:self->_object];
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v8 = v7;
          if (a3)
          {
            if (v7 >= [v6 count] - 1) {
              uint64_t v9 = 0;
            }
            else {
              uint64_t v9 = [v6 objectAtIndex:v8 + 1];
            }
            uint64_t v10 = objc_alloc_init(CAStateAddElement);
            [(CAStateElement *)v10 setTarget:objc_loadWeak((id *)&self->super._target)];
            [(CAStateAddElement *)v10 setKeyPath:self->_keyPath];
            -[CAStateAddElement setObject:](v10, "setObject:", [v6 objectAtIndex:v8]);
            [(CAStateAddElement *)v10 setBeforeObject:v9];
            [(CAStateElement *)v10 setSource:self];
            [a3 addElement:v10];
          }
          id v11 = (id)[v6 mutableCopy];
          if (!v11) {
            id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          id v14 = v11;
          [v11 removeObjectAtIndex:v8];
          id Weak = objc_loadWeak((id *)&self->super._target);
          if ([v14 count]) {
            id v13 = v14;
          }
          else {
            id v13 = 0;
          }
          [Weak setValue:v13 forKeyPath:self->_keyPath];
        }
      }
    }
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