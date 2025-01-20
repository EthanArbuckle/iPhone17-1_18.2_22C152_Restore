@interface CTFeatureSetting
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (CTFeatureSetting)initWithDictionary:(id)a3;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (uint64_t)isEqualToFeatureSetting:(uint64_t)result;
- (uint64_t)selector;
- (uint64_t)tag;
- (uint64_t)type;
- (uint64_t)value;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithNormalizedDictionary:(void *)a1;
- (void)initWithType:(uint64_t)a3 selector:(uint64_t)a4 tag:(NSNumber *)a5 value:;
@end

@implementation CTFeatureSetting

- (uint64_t)tag
{
  if (result) {
    return [*(id *)(result + 8) objectForKey:@"CTFeatureOpenTypeTag"];
  }
  return result;
}

- (uint64_t)value
{
  if (result) {
    return [*(id *)(result + 8) objectForKey:@"CTFeatureOpenTypeValue"];
  }
  return result;
}

- (uint64_t)isEqualToFeatureSetting:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 8) objectForKey:@"CTFeatureTypeIdentifier"];
    if (a2)
    {
      v5 = (const void *)v4;
      if (v4)
      {
        v6 = (const void *)[*(id *)(a2 + 8) objectForKey:@"CTFeatureTypeIdentifier"];
        if (v5 == v6 || v6 && CFEqual(v5, v6))
        {
          v7 = (const void *)[*(id *)(v3 + 8) objectForKey:@"CTFeatureSelectorIdentifier"];
          v8 = (const void *)[*(id *)(a2 + 8) objectForKey:@"CTFeatureSelectorIdentifier"];
          if (v7 == v8) {
            return 1;
          }
          BOOL v9 = !v7 || v8 == 0;
          if (!v9 && CFEqual(v7, v8)) {
            return 1;
          }
        }
      }
    }
    if ((uint64_t v10 = [*(id *)(v3 + 8) objectForKey:@"CTFeatureOpenTypeTag"], a2)
      && (v11 = (const void *)v10) != 0
      && ((v12 = (const void *)[*(id *)(a2 + 8) objectForKey:@"CTFeatureOpenTypeTag"], v11 == v12)
       || v12 && CFEqual(v11, v12))
      && ((v13 = (const void *)[*(id *)(v3 + 8) objectForKey:@"CTFeatureOpenTypeValue"],
           v14 = (const void *)[*(id *)(a2 + 8) objectForKey:@"CTFeatureOpenTypeValue"],
           v13 == v14)
       || (v13 ? (BOOL v15 = v14 == 0) : (BOOL v15 = 1), !v15 && CFEqual(v13, v14))))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKey:a3];
}

- (unint64_t)hash
{
  if (self)
  {
    id v3 = [(NSDictionary *)self->_dictionary objectForKey:@"CTFeatureTypeIdentifier"];
    if (v3)
    {
      int v4 = [v3 unsignedShortValue];
      return (int)(objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", @"CTFeatureSelectorIdentifier"), "unsignedShortValue") | (v4 << 16));
    }
    uint64_t v6 = objc_msgSend(-[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", @"CTFeatureOpenTypeTag"), "hash");
    id v7 = [(NSDictionary *)self->_dictionary objectForKey:@"CTFeatureOpenTypeValue"];
  }
  else
  {
    uint64_t v6 = [0 hash];
    id v7 = 0;
  }
  return v6 + [v7 unsignedIntValue];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return -[CTFeatureSetting isEqualToFeatureSetting:]((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dictionary = self->_dictionary;
      return [(NSDictionary *)dictionary isEqualToDictionary:a3];
    }
    else
    {
      return 0;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CTFeatureSetting;
  [(CTFeatureSetting *)&v3 dealloc];
}

- (uint64_t)type
{
  if (result) {
    return [*(id *)(result + 8) objectForKey:@"CTFeatureTypeIdentifier"];
  }
  return result;
}

- (uint64_t)selector
{
  if (result) {
    return [*(id *)(result + 8) objectForKey:@"CTFeatureSelectorIdentifier"];
  }
  return result;
}

- (void)initWithType:(uint64_t)a3 selector:(uint64_t)a4 tag:(NSNumber *)a5 value:
{
  if (a1)
  {
    BOOL v9 = ValidatedValue(a5);
    if (v9)
    {
      uint64_t v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a2, @"CTFeatureTypeIdentifier", a3, @"CTFeatureSelectorIdentifier", a4, @"CTFeatureOpenTypeTag", v9, @"CTFeatureOpenTypeValue", 0);
        v12 = (void *)[a1 initWithDictionary:v11];
LABEL_7:
        v13 = v12;

        return v13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"CTFeatureOpenTypeTag", v10, @"CTFeatureOpenTypeValue", 0);
        v12 = -[CTFeatureSetting initWithNormalizedDictionary:](a1, v11);
        goto LABEL_7;
      }
    }
  }
  return 0;
}

- (CTFeatureSetting)initWithDictionary:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
  }
  __int16 v9 = -21846;
  if (GetSettingValue<__CFNumber const*,unsigned short>([a3 objectForKey:@"CTFeatureTypeIdentifier"], &v9)&& v9)
  {
    if (GetSettingValue<__CFNumber const*,unsigned short>([a3 objectForKey:@"CTFeatureSelectorIdentifier"], 0))return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3); {
    objc_opt_class();
    }
    if (objc_opt_isKindOfClass()) {
      return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
    }
  }
  else
  {
    [a3 objectForKey:@"CTFeatureOpenTypeTag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (NSNumber *)[a3 objectForKey:@"CTFeatureOpenTypeValue"];
      id v7 = ValidatedValue(v6);
      if (v7)
      {
        v8 = v7;
        if (v7 != v6)
        {
          a3 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
          [a3 setObject:v8 forKey:@"CTFeatureOpenTypeValue"];
        }
        return (CTFeatureSetting *)-[CTFeatureSetting initWithNormalizedDictionary:](self, a3);
      }
    }
  }

  return 0;
}

- (void)initWithNormalizedDictionary:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)CTFeatureSetting;
  objc_super v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_dictionary count];
}

- (id)keyEnumerator
{
  return [(NSDictionary *)self->_dictionary keyEnumerator];
}

- (BOOL)isEqualToDictionary:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return -[CTFeatureSetting isEqualToFeatureSetting:]((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    dictionary = self->_dictionary;
    return [(NSDictionary *)dictionary isEqualToDictionary:a3];
  }
}

@end