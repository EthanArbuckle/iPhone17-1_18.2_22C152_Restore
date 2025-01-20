@interface CAEmitterBehavior
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)behaviorTypes;
+ (id)behaviorWithType:(id)a3;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)isEnabled;
- (CAEmitterBehavior)initWithCoder:(id)a3;
- (CAEmitterBehavior)initWithType:(id)a3;
- (NSString)name;
- (NSString)type;
- (Object)CA_copyRenderValue;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation CAEmitterBehavior

- (id)CAMLTypeForKey:(id)a3
{
  int v4 = CAInternAtom((const __CFString *)a3, 0);
  if (v4 == 212) {
    return @"BOOL";
  }
  if (v4 != 397)
  {
    unsigned int v6 = 0;
    while (1)
    {
      int v7 = behavior_inputs[v6];
      unsigned int v8 = behavior_inputs[v6 + 1];
      unsigned int v9 = v6 + 2;
      if (v7 == self->_type) {
        break;
      }
      unsigned int v6 = v9 + v8;
      if (v6 >= 0x51) {
        return 0;
      }
    }
    if (v8 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v8;
    }
    while (behavior_inputs[v9] != v4)
    {
      ++v9;
      if (!--v10) {
        return 0;
      }
    }
    v5 = @"BOOL";
    if (v4 > 237)
    {
      if (v4 > 446)
      {
        if (v4 <= 530)
        {
          if (v4 == 447) {
            return v5;
          }
          if (v4 != 454 && v4 != 481) {
            return 0;
          }
          return @"real";
        }
        if (v4 <= 586)
        {
          if (v4 == 531) {
            return v5;
          }
          if (v4 != 538) {
            return 0;
          }
          return @"real";
        }
        if (v4 != 587)
        {
          if (v4 != 615) {
            return 0;
          }
          return @"real";
        }
      }
      else
      {
        if (v4 <= 364)
        {
          if (v4 == 238) {
            return @"real";
          }
          if (v4 == 245) {
            return @"CAValueFunction";
          }
          if (v4 != 339) {
            return 0;
          }
          return @"NSString";
        }
        if ((v4 - 413) < 2) {
          return @"real";
        }
        if (v4 != 365)
        {
          if (v4 == 438) {
            return @"CGPoint";
          }
          return 0;
        }
      }
    }
    else
    {
      if (v4 > 173)
      {
        char v12 = v4 + 82;
        if ((v4 - 174) > 0x3B) {
          return 0;
        }
        if (((1 << v12) & 0xC0000000200DLL) == 0)
        {
          if (((1 << v12) & 0x800000000000002) != 0) {
            return @"CAPoint3D";
          }
          return 0;
        }
        return @"real";
      }
      if (v4 <= 91)
      {
        if (v4 <= 34)
        {
          if (v4 == 3) {
            return v5;
          }
          if (v4 != 26) {
            return 0;
          }
          return @"real";
        }
        if (v4 == 35) {
          return v5;
        }
        if (v4 != 46) {
          return 0;
        }
        return @"NSString";
      }
      if ((v4 - 115) < 2) {
        return @"real";
      }
      if (v4 == 92) {
        return @"CGColor";
      }
      if (v4 != 110) {
        return 0;
      }
    }
    return @"NSArray";
  }
  return @"string";
}

- (void)encodeWithCAMLWriter:(id)a3
{
  objc_msgSend(a3, "setElementAttribute:forKey:", -[CAEmitterBehavior type](self, "type"), @"behavior");
  v5 = [(CAEmitterBehavior *)self name];
  if (v5) {
    [a3 setElementAttribute:v5 forKey:@"name"];
  }
  uint64_t v6 = [(CAEmitterBehavior *)self isEnabled];
  if ((v6 & 1) == 0) {
    uint64_t v6 = [a3 setElementAttribute:@"0" forKey:@"enabled"];
  }
  if (self->_attr)
  {
    int v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      int v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v6);
    }
    int v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (uint64_t *)self->_attr;
    if (attr) {
      CA::AttrList::for_each(*attr, (uint64_t (*)(void, void *, uint64_t, uint64_t))write_attr, (uint64_t)a3);
    }
    CA::Transaction::unlock(v7);
  }
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
}

- (CAEmitterBehavior)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CAEmitterBehavior;
  int v4 = [(CAEmitterBehavior *)&v11 init];
  if (v4)
  {
    CFStringRef v5 = (const __CFString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    if (v5) {
      v4->_type = CAInternAtom(v5, 1);
    }
    v4->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    if ([a3 containsValueForKey:@"enabled"]
      && ![a3 decodeBoolForKey:@"enabled"])
    {
      unsigned int v6 = v4->_flags & 0xFFFFFFFE;
    }
    else
    {
      unsigned int v6 = v4->_flags | 1;
    }
    v4->_flags = v6;
    CFDictionaryRef v7 = (const __CFDictionary *)objc_msgSend(a3, "CA_decodeObjectForKey:", @"values");
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      CFTypeID v9 = CFGetTypeID(v7);
      if (v9 == CFDictionaryGetTypeID()) {
        CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)set_attr, v4);
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CFStringRef v5 = (CA::Transaction *)[a3 encodeObject:CAAtomGetString(self->_type) forKey:@"type"];
  name = self->_name;
  if (name) {
    CFStringRef v5 = (CA::Transaction *)[a3 encodeObject:name forKey:@"name"];
  }
  if ((self->_flags & 1) == 0) {
    CFStringRef v5 = (CA::Transaction *)[a3 encodeBool:0 forKey:@"enabled"];
  }
  if (self->_attr)
  {
    CFDictionaryRef v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      CFDictionaryRef v7 = (CA::Transaction *)CA::Transaction::create(v5);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v9 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v9 + 1;
    id v11 = v8;
    if (!v9) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (uint64_t *)self->_attr;
    if (attr) {
      CA::AttrList::for_each(*attr, (uint64_t (*)(void, void *, uint64_t, uint64_t))copy_dictionary, (uint64_t)v11);
    }
    CA::Transaction::unlock(v7);
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v11, @"values", 0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = (CA::Transaction *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  CFStringRef v5 = v4;
  if (v4)
  {
    unsigned int v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6) {
      unsigned int v6 = (CA::Transaction *)CA::Transaction::create(v4);
    }
    *((_DWORD *)v5 + 2) = self->_type;
    *((void *)v5 + 2) = [(NSString *)self->_name copy];
    int v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (CA::AttrList *)self->_attr;
    if (attr)
    {
      uint64_t v9 = *((void *)attr + 1) & 7;
      if (v9 == 7) {
        attr = (CA::AttrList *)CA::AttrList::copy_(attr);
      }
      else {
        *((void *)attr + 1) = *((void *)attr + 1) & 0xFFFFFFFFFFFFFFF8 | (v9 + 1);
      }
    }
    *((void *)v5 + 3) = attr;
    CA::Transaction::unlock(v6);
    *((_DWORD *)v5 + 10) = self->_flags;
  }
  return v5;
}

- (Object)CA_copyRenderValue
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_type) {
    return 0;
  }
  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  if (!self->_cache)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    unsigned int v6 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x30uLL, 0x743898A5uLL);
    id v8 = v6;
    if (v6)
    {
      *((_DWORD *)v6 + 2) = 1;
      ++dword_1EB2ADDFC;
      *unsigned int v6 = &unk_1ED02E198;
      *(void *)((char *)v6 + 12) = 13;
      v6[4] = 0;
      v6[5] = 0;
      v6[3] = 0;
      int v9 = 13;
    }
    else
    {
      int v9 = MEMORY[0xC];
    }
    *((_DWORD *)v6 + 4) = self->_type;
    *((_DWORD *)v6 + 3) = v9 | (self->_flags << 8);
    id v11 = CA::Render::String::new_string((const __CFString *)self->_name, v7);
    uint64_t v12 = (atomic_uint *)v8[3];
    v8[3] = v11;
    if (v12 && atomic_fetch_add(v12 + 2, 0xFFFFFFFF) == 1) {
      uint64_t v12 = (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)v12 + 16))(v12);
    }
    attr = (uint64_t *)self->_attr;
    if (!attr) {
      goto LABEL_28;
    }
    uint64_t v14 = -1;
    v15 = self->_attr;
    do
    {
      v15 = (void *)*v15;
      ++v14;
    }
    while (v15);
    if (!v14) {
      goto LABEL_28;
    }
    size_t v16 = 8 * v14;
    v21 = 0;
    v22 = 0;
    if ((unint64_t)(8 * v14) > 0x1000)
    {
      v22 = (char *)malloc_type_malloc(8 * v14, 0x2004093837F09uLL);
      if (!v22)
      {
LABEL_28:
        self->_cache = v8;
        goto LABEL_29;
      }
      attr = (uint64_t *)self->_attr;
      if (!attr)
      {
LABEL_26:
        if (v16 > 0x1000) {
          free(v22);
        }
        goto LABEL_28;
      }
    }
    else
    {
      MEMORY[0x1F4188790](v12);
      bzero((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
      v22 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    }
    CA::AttrList::for_each(*attr, (uint64_t (*)(void, void *, uint64_t, uint64_t))copy_attr, (uint64_t)&v21);
    if (v21)
    {
      v17 = CA::Render::Array::new_array(v21, v22, 0, 0);
      v18 = (atomic_uint *)v8[4];
      v8[4] = v17;
      if (v18)
      {
        if (atomic_fetch_add(v18 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v18 + 16))(v18);
        }
      }
    }
    goto LABEL_26;
  }
LABEL_29:
  CA::Transaction::unlock(v3);
  result = (Object *)self->_cache;
  if (result)
  {
    p_var1 = &result->var1;
    if (!atomic_fetch_add(&result->var1.var0.var0, 1u))
    {
      result = 0;
      atomic_fetch_add(&p_var1->var0.var0, 0xFFFFFFFF);
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];

  if (self->_attr)
  {
    CFStringRef v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5) {
      CFStringRef v5 = (CA::Transaction *)CA::Transaction::create(v3);
    }
    int v6 = *((_DWORD *)v5 + 25);
    *((_DWORD *)v5 + 25) = v6 + 1;
    if (!v6) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (CA::AttrList *)self->_attr;
    if (attr) {
      CA::AttrList::free(attr, v4);
    }
    self->_attr = 0;
    CA::Transaction::unlock(v5);
  }
  cache = (atomic_uint *)self->_cache;
  if (cache && atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
  }
  v9.receiver = self;
  v9.super_class = (Class)CAEmitterBehavior;
  [(CAEmitterBehavior *)&v9 dealloc];
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_cache)
  {
    int v5 = CAInternAtom((const __CFString *)a3, 0);
    if (v5 == 110 || v5 == 587 || v5 == 365)
    {
      cache = (atomic_uint *)self->_cache;
      if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
      }
      self->_cache = 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CAEmitterBehavior;
  [(CAEmitterBehavior *)&v7 didChangeValueForKey:a3];
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (id)valueForKey:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  int v4 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  if (v4 != 212)
  {
    int v5 = (int)v4;
    if (v4 == 397) {
      return self->_name;
    }
    objc_super v9 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v9) {
      objc_super v9 = (CA::Transaction *)CA::Transaction::create(v4);
    }
    int v10 = *((_DWORD *)v9 + 25);
    *((_DWORD *)v9 + 25) = v10 + 1;
    if (!v10) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = self->_attr;
    if (attr)
    {
      v13[0] = 0;
      int v12 = CA::AttrList::get((uint64_t)attr, v5, (const CGAffineTransform *)1, (CA::Mat4Impl *)v13);
      CA::Transaction::unlock(v9);
      if (v12) {
        return (id)v13[0];
      }
      else {
        return 0;
      }
    }
    CA::Transaction::unlock(v9);
    return 0;
  }
  objc_super v7 = NSNumber;
  BOOL v8 = [(CAEmitterBehavior *)self isEnabled];

  return (id)[v7 numberWithBool:v8];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  if (a4)
  {
    objc_super v7 = (CA::Transaction *)CAInternAtom((const __CFString *)a4, 1);
    if (v7 == 212)
    {
      BOOL v9 = *MEMORY[0x1E4F1CFC8] != (void)a3;
      [(CAEmitterBehavior *)self setEnabled:v9];
    }
    else
    {
      BOOL v8 = v7;
      if (v7 == 397)
      {
        [(CAEmitterBehavior *)self setName:a3];
      }
      else
      {
        id v16 = 0;
        int v10 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
        if (!v10) {
          int v10 = (CA::Transaction *)CA::Transaction::create(v7);
        }
        int v11 = *((_DWORD *)v10 + 25);
        *((_DWORD *)v10 + 25) = v11 + 1;
        if (!v11) {
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        }
        attr = self->_attr;
        if (!attr
          || !CA::AttrList::get((uint64_t)attr, (int)v8, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v16)|| ([v16 isEqual:a3] & 1) == 0)
        {
          [(CAEmitterBehavior *)self willChangeValueForKey:a4];
          v13 = (CA::AttrList *)self->_attr;
          if (!v13)
          {
            malloc_zone = (malloc_zone_t *)get_malloc_zone();
            v13 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
          }
          self->_attr = CA::AttrList::set(v13, v8, 2, (unsigned __int8 *)v17);
          cache = (atomic_uint *)self->_cache;
          if (cache)
          {
            if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
            }
            self->_cache = 0;
          }
          [(CAEmitterBehavior *)self didChangeValueForKey:a4];
        }
        CA::Transaction::unlock(v10);
      }
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (((((self->_flags & 1) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(CAEmitterBehavior *)self willChangeValueForKey:@"enabled"];
    self->_flags = self->_flags & 0xFFFFFFFE | v3;
    cache = (atomic_uint *)self->_cache;
    if (cache)
    {
      if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
      }
      self->_cache = 0;
    }
    [(CAEmitterBehavior *)self didChangeValueForKey:@"enabled"];
  }
}

- (BOOL)isEnabled
{
  return self->_flags & 1;
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    [(CAEmitterBehavior *)self willChangeValueForKey:@"name"];

    self->_name = (NSString *)[a3 copy];
    cache = (atomic_uint *)self->_cache;
    if (cache)
    {
      if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
      }
      self->_cache = 0;
    }
    [(CAEmitterBehavior *)self didChangeValueForKey:@"name"];
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return (NSString *)CAAtomGetString(self->_type);
}

- (CAEmitterBehavior)initWithType:(id)a3
{
  self->_flags = 1;
  if (a3) {
    self->_type = CAInternAtom((const __CFString *)a3, 1);
  }

  return [(CAEmitterBehavior *)self init];
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4 = [a3 attributeForKey:@"behavior" remove:1];
  if (v4)
  {
    int v5 = +[CAEmitterBehavior behaviorWithType:v4];
    [a3 setElementValue:v5];
  }
  else
  {
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)behaviorWithType:(id)a3
{
  BOOL v3 = (void *)[objc_alloc((Class)a1) initWithType:a3];

  return v3;
}

+ (id)behaviorTypes
{
  id result = (id)+[CAEmitterBehavior behaviorTypes]::names;
  if (!+[CAEmitterBehavior behaviorTypes]::names)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (int i = 0; i < 81; i += v5[1] + 2)
    {
      int v5 = &behavior_inputs[i];
      [v3 addObject:CAAtomGetString(*v5)];
    }
    +[CAEmitterBehavior behaviorTypes]::names = [v3 copy];

    return (id)+[CAEmitterBehavior behaviorTypes]::names;
  }
  return result;
}

@end