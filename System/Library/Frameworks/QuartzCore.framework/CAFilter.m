@interface CAFilter
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)filterTypes;
+ (id)filterWithType:(id)a3;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)cachesInputImage;
- (BOOL)isAccessibility;
- (BOOL)isEnabled;
- (CAFilter)initWithCoder:(id)a3;
- (CAFilter)initWithType:(id)a3;
- (NSString)name;
- (NSString)type;
- (Object)CA_copyRenderValue;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibility:(BOOL)a3;
- (void)setCachesInputImage:(BOOL)a3;
- (void)setDefaults;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CAFilter

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];

  if (self->_attr)
  {
    v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5) {
      v5 = (CA::Transaction *)CA::Transaction::create(v3);
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
  v9.super_class = (Class)CAFilter;
  [(CAFilter *)&v9 dealloc];
}

+ (id)filterWithType:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3];

  return v3;
}

- (CAFilter)initWithType:(id)a3
{
  self->_flags = 1;
  if (a3)
  {
    unsigned int type = CAInternAtom((const __CFString *)a3, 1);
    self->_unsigned int type = type;
  }
  else
  {
    unsigned int type = self->_type;
  }
  self->_name = (NSString *)CAAtomGetString(type);

  return [(CAFilter *)self init];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = a3;
  if (a4)
  {
    v7 = (CA::Transaction *)CAInternAtom((const __CFString *)a4, 1);
    if (v7 == 79)
    {
      BOOL v9 = *MEMORY[0x1E4F1CFC8] != (void)a3;
      [(CAFilter *)self setCachesInputImage:v9];
    }
    else
    {
      v8 = v7;
      if (v7 == 212)
      {
        BOOL v10 = *MEMORY[0x1E4F1CFC8] != (void)a3;
        [(CAFilter *)self setEnabled:v10];
      }
      else if (v7 == 397)
      {
        [(CAFilter *)self setName:a3];
      }
      else
      {
        id v17 = 0;
        v11 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
        if (!v11) {
          v11 = (CA::Transaction *)CA::Transaction::create(v7);
        }
        int v12 = *((_DWORD *)v11 + 25);
        *((_DWORD *)v11 + 25) = v12 + 1;
        if (!v12) {
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        }
        attr = self->_attr;
        if (!attr
          || !CA::AttrList::get((uint64_t)attr, (int)v8, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v17)|| ([v17 isEqual:a3] & 1) == 0)
        {
          [(CAFilter *)self willChangeValueForKey:a4];
          v14 = (CA::AttrList *)self->_attr;
          if (!v14)
          {
            malloc_zone = (malloc_zone_t *)get_malloc_zone();
            v14 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
          }
          self->_attr = CA::AttrList::set(v14, v8, 2, (unsigned __int8 *)v18);
          cache = (atomic_uint *)self->_cache;
          if (cache)
          {
            if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
            }
            self->_cache = 0;
          }
          [(CAFilter *)self didChangeValueForKey:a4];
        }
        CA::Transaction::unlock(v11);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (CA::Transaction *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    int v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6) {
      int v6 = (CA::Transaction *)CA::Transaction::create(v4);
    }
    *((_DWORD *)v5 + 2) = self->_type;
    *((void *)v5 + 2) = [(NSString *)self->_name copy];
    *((_DWORD *)v5 + 6) = self->_flags;
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
    *((void *)v5 + 4) = attr;
    CA::Transaction::unlock(v6);
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v4 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  int v5 = (int)v4;
  if ((int)v4 <= 396)
  {
    if (v4 == 79)
    {
      int v6 = NSNumber;
      BOOL v7 = [(CAFilter *)self cachesInputImage];
      goto LABEL_10;
    }
    if (v4 == 212)
    {
      int v6 = NSNumber;
      BOOL v7 = [(CAFilter *)self isEnabled];
LABEL_10:
      return (id)[v6 numberWithBool:v7];
    }
    goto LABEL_16;
  }
  if (v4 != 577)
  {
    if (v4 == 397) {
      return self->_name;
    }
LABEL_16:
    uint64_t v9 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v9) {
      uint64_t v9 = (CA::Transaction *)CA::Transaction::create(v4);
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

  return [(CAFilter *)self type];
}

- (NSString)name
{
  return self->_name;
}

- (Object)CA_copyRenderValue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_type) {
    return 0;
  }
  v2 = self;
  v3 = *(CAFilter **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
  {
    self = (CAFilter *)CA::Transaction::create((CA::Transaction *)self);
    v3 = self;
  }
  int isa_high = HIDWORD(v3[2].super.isa);
  HIDWORD(v3[2].super.isa) = isa_high + 1;
  if (!isa_high) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  if (!v2->_cache)
  {
    attr = (uint64_t *)v2->_attr;
    if (attr)
    {
      uint64_t v6 = -1;
      BOOL v7 = v2->_attr;
      do
      {
        BOOL v7 = (void *)*v7;
        ++v6;
      }
      while (v7);
      if (v6)
      {
        size_t v8 = 8 * v6;
        id v17 = 0;
        v18 = 0;
        uint64_t v19 = 0;
        if ((unint64_t)(8 * v6) <= 0x1000)
        {
          MEMORY[0x1F4188790](self);
          bzero((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
          v18 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
          LODWORD(v19) = v2->_type;
LABEL_16:
          CA::AttrList::for_each(*attr, (uint64_t (*)(void, void *, uint64_t, uint64_t))copy_attr, (uint64_t)&v17);
          if (v17)
          {
            int v10 = CA::Render::Array::new_array(v17, v18, 0, 0);
            goto LABEL_35;
          }
LABEL_34:
          int v10 = 0;
LABEL_35:
          if (v8 > 0x1000) {
            free(v18);
          }
          goto LABEL_19;
        }
        v18 = (char *)malloc_type_malloc(8 * v6, 0x2004093837F09uLL);
        LODWORD(v19) = v2->_type;
        if (v18)
        {
          attr = (uint64_t *)v2->_attr;
          if (!attr) {
            goto LABEL_34;
          }
          goto LABEL_16;
        }
      }
    }
    int v10 = 0;
LABEL_19:
    v11 = CA::Render::String::new_string((const __CFString *)v2->_name, (const __CFString *)a2);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v13 = (CA::Render::Filter *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x38uLL, 0x743898A5uLL);
    v14 = v13;
    if (v13) {
      CA::Render::Filter::Filter(v13, v2->_type, v11, v10);
    }
    if (v11 && atomic_fetch_add(v11 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v11 + 16))(v11);
    }
    if (v10 && atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v10 + 16))(v10);
    }
    unsigned int flags = v2->_flags;
    if (flags) {
      *((_DWORD *)v14 + 3) |= flags << 8;
    }
    v2->_cache = v14;
  }
  CA::Transaction::unlock((CA::Transaction *)v3);
  result = (Object *)v2->_cache;
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

- (NSString)type
{
  return (NSString *)CAAtomGetString(self->_type);
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    [(CAFilter *)self willChangeValueForKey:@"name"];

    self->_name = (NSString *)[a3 copy];
    cache = (atomic_uint *)self->_cache;
    if (cache)
    {
      if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
      }
      self->_cache = 0;
    }
    [(CAFilter *)self didChangeValueForKey:@"name"];
  }
}

- (CAFilter)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CAFilter;
  v4 = [(CAFilter *)&v11 init];
  if (v4)
  {
    CFStringRef v5 = (const __CFString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"CAFilterType"];
    if (v5) {
      v4->_unsigned int type = CAInternAtom(v5, 1);
    }
    v4->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"CAFilterName"];
    if ([a3 containsValueForKey:@"CAFilterEnabled"]
      && ![a3 decodeBoolForKey:@"CAFilterEnabled"])
    {
      unsigned int v6 = v4->_flags & 0xFFFFFFFE;
    }
    else
    {
      unsigned int v6 = v4->_flags | 1;
    }
    v4->_unsigned int flags = v6;
    CFDictionaryRef v7 = (const __CFDictionary *)objc_msgSend(a3, "CA_decodeObjectForKey:", @"CAFilterInputs");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)CAMLTypeForKey:(id)a3
{
  int v4 = CAInternAtom((const __CFString *)a3, 0);
  if (v4 == 79 || v4 == 212) {
    return @"BOOL";
  }
  if (v4 == 397) {
    return @"string";
  }
  unsigned int v7 = 0;
  while (filter_inputs[v7] != self->_type)
  {
    v7 += filter_inputs[v7 + 1] + 2;
    if (v7 >= 0xA5) {
      return 0;
    }
  }
  CFStringRef v5 = 0;
  if (v7 != 41 && v7 != 120)
  {
    unsigned int v8 = filter_inputs[v7 + 1];
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    for (unsigned int i = v7 + 2; filter_inputs[i] != v4; ++i)
    {
      CFStringRef v5 = 0;
      if (!--v9) {
        return v5;
      }
    }
    if (v4 > 403)
    {
      if (v4 != 507)
      {
        if (v4 == 468) {
          return @"string";
        }
        if (v4 != 404) {
          return 0;
        }
      }
      return @"real";
    }
    CFStringRef v5 = @"BOOL";
    switch(v4)
    {
      case 234:
      case 279:
      case 280:
      case 286:
      case 287:
      case 288:
      case 296:
      case 316:
        CFStringRef v5 = @"CGColor";
        break;
      case 273:
      case 276:
      case 277:
      case 278:
      case 282:
      case 293:
      case 294:
      case 307:
      case 310:
      case 314:
      case 317:
      case 318:
      case 319:
      case 358:
        return @"real";
      case 274:
      case 281:
      case 291:
      case 292:
      case 297:
      case 300:
      case 301:
      case 303:
      case 305:
      case 308:
      case 313:
      case 320:
      case 336:
        return v5;
      case 275:
      case 284:
      case 299:
      case 312:
      case 321:
        CFStringRef v5 = @"NSArray";
        break;
      case 283:
      case 298:
      case 311:
        CFStringRef v5 = @"CGPoint";
        break;
      case 285:
      case 315:
        CFStringRef v5 = @"CGRect";
        break;
      case 289:
      case 304:
        CFStringRef v5 = @"CGImage";
        break;
      case 290:
        CFStringRef v5 = @"CAColorMatrix";
        break;
      case 302:
      case 309:
        return @"string";
      default:
        return 0;
    }
  }
  return v5;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  objc_msgSend(a3, "setElementAttribute:forKey:", -[CAFilter type](self, "type"), @"filter");
  CFStringRef v5 = [(CAFilter *)self name];
  if (v5) {
    [a3 setElementAttribute:v5 forKey:@"name"];
  }
  if (![(CAFilter *)self isEnabled]) {
    [a3 setElementAttribute:@"0" forKey:@"enabled"];
  }
  uint64_t v6 = [(CAFilter *)self cachesInputImage];
  if (v6) {
    uint64_t v6 = [a3 setElementAttribute:@"1" forKey:@"cachesInputImage"];
  }
  if (self->_attr)
  {
    unsigned int v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      unsigned int v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v6);
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

- (void)encodeWithCoder:(id)a3
{
  CFStringRef v5 = (CA::Transaction *)[a3 encodeObject:CAAtomGetString(self->_type) forKey:@"CAFilterType"];
  name = self->_name;
  if (name) {
    CFStringRef v5 = (CA::Transaction *)[a3 encodeObject:name forKey:@"CAFilterName"];
  }
  if ((self->_flags & 1) == 0) {
    CFStringRef v5 = (CA::Transaction *)[a3 encodeBool:0 forKey:@"CAFilterEnabled"];
  }
  if (self->_attr)
  {
    unsigned int v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      unsigned int v7 = (CA::Transaction *)CA::Transaction::create(v5);
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
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v11, @"CAFilterInputs", 0);
  }
}

- (void)setDefaults
{
  if (self->_attr)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3) {
      v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    }
    int v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (CA::AttrList *)self->_attr;
    if (attr) {
      CA::AttrList::free(attr, a2);
    }
    self->_attr = 0;
    CA::Transaction::unlock(v3);
    cache = (atomic_uint *)self->_cache;
    if (cache)
    {
      if (atomic_fetch_add(cache + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)cache + 16))(cache);
      }
      self->_cache = 0;
    }
  }
}

- (void)setAccessibility:(BOOL)a3
{
}

- (BOOL)isAccessibility
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (void)setCachesInputImage:(BOOL)a3
{
}

- (BOOL)cachesInputImage
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setEnabled:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return self->_flags & 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4 = [a3 attributeForKey:@"filter" remove:1];
  if (v4)
  {
    CFStringRef v5 = +[CAFilter filterWithType:v4];
    [a3 setElementValue:v5];
  }
  else
  {
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)filterTypes
{
  id result = (id)+[CAFilter filterTypes]::names;
  if (!+[CAFilter filterTypes]::names)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (int i = 0; i < 165; i += v5[1] + 2)
    {
      CFStringRef v5 = &filter_inputs[i];
      [v3 addObject:CAAtomGetString(*v5)];
    }
    +[CAFilter filterTypes]::names = [v3 copy];

    return (id)+[CAFilter filterTypes]::names;
  }
  return result;
}

@end