@interface CAStateSetValue
+ (BOOL)supportsSecureCoding;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)matches:(id)a3;
- (CAStateSetValue)initWithCoder:(id)a3;
- (NSString)keyPath;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)value;
- (void)apply:(id)a3;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)foreachLayer:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CAStateSetValue

- (void)setValue:(id)a3
{
  id value = self->_value;
  if (value != a3)
  {

    if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a3];
    }
    else if (objc_opt_respondsToSelector())
    {
      id v6 = (id)[a3 copyWithZone:0];
    }
    else
    {
      id v6 = a3;
    }
    self->_id value = v6;
  }
}

- (void)apply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = objc_alloc_init(CAStateSetValue);
    [(CAStateElement *)v5 setSource:self];
    [(CAStateElement *)v5 setTarget:objc_loadWeak((id *)&self->super._target)];
    [(CAStateSetValue *)v5 setKeyPath:self->_keyPath];
    id v6 = (void *)[objc_loadWeak((id *)&self->super._target) valueForKeyPath:self->_keyPath];
    id v7 = (objc_opt_respondsToSelector() & 1) != 0 ? (id)[v6 copy] : v6;
    v5->_id value = v7;
    [a3 addElement:v5];

    if (objc_opt_respondsToSelector())
    {
      if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id value = self->_value;
        uint64_t v9 = [value countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(value);
              }
              v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              if (![v13 superlayer]) {
                [a3 willAddLayer:v13];
              }
            }
            uint64_t v10 = [value countByEnumeratingWithState:&v16 objects:v15 count:16];
          }
          while (v10);
        }
      }
      else if ([(NSString *)self->_keyPath isEqualToString:@"mask"])
      {
        id v14 = self->_value;
        if (![v14 superlayer]) {
          [a3 willAddLayer:v14];
        }
      }
    }
  }
  [objc_loadWeak((id *)&self->super._target) setValue:self->_value forKeyPath:self->_keyPath];
}

- (void)setKeyPath:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)CAMLTypeForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"keyPath"]) {
    return @"string";
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  return [(CAStateElement *)&v6 CAMLTypeForKey:a3];
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"value"]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  return [(CAStateElement *)&v6 CAMLTypeSupportedForKey:a3];
}

- (CAStateSetValue)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  v4 = -[CAStateElement initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_keyPath = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"keyPath"), "copy");
    v4->_id value = (id)objc_msgSend(a3, "CA_decodeObjectForKey:", @"value");
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAStateSetValue;
  [(CAStateElement *)&v3 dealloc];
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAStateSetValue;
  -[CAStateElement encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_keyPath forKey:@"keyPath"];
  objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", self->_value, @"value", 0);
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_loadWeak((id *)&self->super._target);
  uint64_t v5 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"{%@:%p %@:%p %@ %@}", v4, self, v5, objc_loadWeak((id *)&self->super._target), self->_keyPath, self->_value];
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateSetValue;
  -[CAStateElement encodeWithCAMLWriter:](&v6, sel_encodeWithCAMLWriter_);
  keyPath = self->_keyPath;
  if (keyPath) {
    [a3 setElementAttribute:keyPath forKey:@"keyPath"];
  }
  if (self->_value)
  {
    [a3 beginPropertyElement:@"value"];
    [a3 encodeObject:self->_value];
    [a3 endElement];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CAStateSetValue);
  v4->_keyPath = self->_keyPath;
  v4->_id value = self->_value;
  [(CAStateElement *)v4 setTarget:[(CAStateElement *)self target]];
  return v4;
}

- (void)foreachLayer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_keyPath isEqualToString:@"sublayers"])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id value = self->_value;
    uint64_t v6 = [value countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(value);
          }
          (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v13 + 1) + 8 * i));
        }
        uint64_t v7 = [value countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v7);
    }
  }
  else if ([(NSString *)self->_keyPath isEqualToString:@"mask"])
  {
    id v10 = self->_value;
    uint64_t v11 = (void (*)(id, id))*((void *)a3 + 2);
    v11(a3, v10);
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

- (id)value
{
  return self->_value;
}

@end