@interface NSFetchIndexElementDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isAscending;
- (BOOL)isEqual:(id)a3;
- (NSFetchIndexDescription)indexDescription;
- (NSFetchIndexElementDescription)initWithCoder:(id)a3;
- (NSFetchIndexElementDescription)initWithProperty:(NSPropertyDescription *)property collationType:(NSFetchIndexElementType)collationType;
- (NSFetchIndexElementType)collationType;
- (NSPropertyDescription)property;
- (NSString)propertyName;
- initWithPropertyName:(uint64_t)a3 collationType:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_validateCollationType:(void *)a3 forProperty:;
- (unint64_t)hash;
- (void)_setIndexDescription:(uint64_t)a1;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithPropertyName:(void *)a3 property:(uint64_t)a4 collationType:(int)a5 ascending:;
- (void)setAscending:(BOOL)ascending;
- (void)setCollationType:(NSFetchIndexElementType)collationType;
@end

@implementation NSFetchIndexElementDescription

- (NSPropertyDescription)property
{
  property = self->_property;
  if (!property)
  {
    indexDescription = self->_indexDescription;
    if (indexDescription)
    {
      uint64_t v6 = [(NSFetchIndexDescription *)indexDescription entity];
      if (v6) {
        property = (NSPropertyDescription *)[*(id *)(v6 + 96) objectForKey:self->_propertyName];
      }
      else {
        property = 0;
      }
      if (![(NSPropertyDescription *)property _isEditable])
      {
        __indexElementDescriptionFlags indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        if ((*(unsigned char *)&indexElementDescriptionFlags & 2) != 0)
        {

          __indexElementDescriptionFlags indexElementDescriptionFlags = self->_indexElementDescriptionFlags;
        }
        self->_property = property;
        self->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&indexElementDescriptionFlags & 0xFFFFFFFD);
      }
    }
    else
    {
      return 0;
    }
  }
  return property;
}

- (void)_setIndexDescription:(uint64_t)a1
{
  if (a1)
  {
    if (!a2 || *(void *)(a1 + 32) || [*(id *)(a1 + 8) _propertyType] == 5) {
      goto LABEL_10;
    }
    if ([a2 entity])
    {

      *(void *)(a1 + 8) = 0;
      unsigned int v4 = *(_DWORD *)(a1 + 40) & 0xFFFFFFFD;
    }
    else
    {
      if ((*(unsigned char *)(a1 + 40) & 2) != 0)
      {
LABEL_10:
        *(void *)(a1 + 32) = a2;
        return;
      }
      id v5 = *(id *)(a1 + 8);
      unsigned int v4 = *(_DWORD *)(a1 + 40) | 2;
    }
    *(_DWORD *)(a1 + 40) = v4;
    goto LABEL_10;
  }
}

- (NSFetchIndexElementType)collationType
{
  return self->_collationType;
}

- (NSFetchIndexElementDescription)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NSFetchIndexElementDescription;
  unsigned int v4 = [(NSFetchIndexElementDescription *)&v19 init];
  if (v4)
  {
    id v5 = +[PFModelDecoderContext retainedContext];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __48__NSFetchIndexElementDescription_initWithCoder___block_invoke;
    v17 = &unk_1E544B868;
    v18 = v5;
    uint64_t v6 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPropertyName"];
    v4->_propertyName = v6;
    if (v6 && ([(NSString *)v6 isNSString] & 1) == 0)
    {
      v10 = &unk_1ED7E2528;
    }
    else
    {
      uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFetchIndexDescription"];
      v4->_indexDescription = (NSFetchIndexDescription *)v7;
      if (!v7)
      {
LABEL_13:
        v11 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0, v14, v15), @"NSIndexedProperty");
        if (!v11) {
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 _propertyType] == 5 || !v4->_indexDescription)
          {
            v4->_property = (NSPropertyDescription *)v11;
            unsigned int v12 = *(_DWORD *)&v4->_indexElementDescriptionFlags | 2;
            goto LABEL_23;
          }
LABEL_17:
          v4->_property = 0;
          unsigned int v12 = *(_DWORD *)&v4->_indexElementDescriptionFlags & 0xFFFFFFFD;
LABEL_23:
          v4->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)v12;
          v4->_collationType = [a3 decodeIntegerForKey:@"NSFetchIndexElementType"];
          v4->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&v4->_indexElementDescriptionFlags & 0xFFFFFFFE | [a3 decodeBoolForKey:@"NSAscending"]);
          goto LABEL_24;
        }
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E25A0));

LABEL_20:
        unsigned int v4 = 0;
LABEL_24:
        v16((uint64_t)&v14);
        return v4;
      }
      if (v5) {
        v8 = (void *)v5[3];
      }
      else {
        v8 = 0;
      }
      [v8 addObject:v7];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        v10 = &unk_1ED7E2578;
      }
      else {
        v10 = &unk_1ED7E2550;
      }
      if (v5 != 0 && (isKindOfClass & 1) != 0)
      {
        if (v5[1] || v5[2]) {
          goto LABEL_13;
        }
        v10 = &unk_1ED7E2578;
      }
    }
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v10));

    goto LABEL_20;
  }
  return v4;
}

void __48__NSFetchIndexElementDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (void)initWithPropertyName:(void *)a3 property:(uint64_t)a4 collationType:(int)a5 ascending:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)NSFetchIndexElementDescription;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    v9[2] = a2;
    if (a3 && [a3 _propertyType] == 5)
    {
      v9[1] = a3;
      unsigned int v10 = *((_DWORD *)v9 + 10) | 2;
    }
    else
    {
      v9[1] = 0;
      unsigned int v10 = v9[5] & 0xFFFFFFFD;
    }
    v9[3] = a4;
    *((_DWORD *)v9 + 10) = v10 & 0xFFFFFFFE | a5;
  }
  return v9;
}

- (NSFetchIndexElementDescription)initWithProperty:(NSPropertyDescription *)property collationType:(NSFetchIndexElementType)collationType
{
  if (!property)
  {

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"Can't create an index element without a property";
    goto LABEL_17;
  }
  if (![(NSPropertyDescription *)property name])
  {

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"Can't create an index element with an unnamed property";
    goto LABEL_17;
  }
  unint64_t v7 = [(NSPropertyDescription *)property _propertyType];
  if (v7 - 4 >= 3 && v7 != 2)
  {
    if (v7 == 7)
    {

      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      v13 = @"Can't create an index element with composite property";
    }
    else
    {

      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      v13 = @"Can't create an index element with non-attribute property";
    }
LABEL_17:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  }
  -[NSFetchIndexElementDescription _validateCollationType:forProperty:]((uint64_t)self, collationType, property);
  v14.receiver = self;
  v14.super_class = (Class)NSFetchIndexElementDescription;
  v8 = [(NSFetchIndexElementDescription *)&v14 init];
  if (v8)
  {
    if ([(NSPropertyDescription *)property _propertyType] == 5 || !v8->_indexDescription)
    {
      v8->_property = property;
      unsigned int v9 = *(_DWORD *)&v8->_indexElementDescriptionFlags | 2;
    }
    else
    {
      v8->_property = property;
      unsigned int v9 = *(_DWORD *)&v8->_indexElementDescriptionFlags & 0xFFFFFFFD;
    }
    v8->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)v9;
    v8->_propertyName = [(NSPropertyDescription *)property name];
    v8->_collationType = collationType;
    *(_DWORD *)&v8->_indexElementDescriptionFlags |= 1u;
  }
  return v8;
}

- (uint64_t)_validateCollationType:(void *)a3 forProperty:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (result && a2 == 1)
  {
    if ([a3 _propertyType] == 2 || objc_msgSend(a3, "_propertyType") == 6)
    {
      result = [a3 attributeType];
      if (result == 100 || result == 200 || result == 600) {
        return result;
      }
      unsigned int v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      v8 = @"property";
      unsigned int v9 = a3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      unint64_t v7 = @"Invalid collation type (rtree indexes can only be created for floats or integers < 32 bit).";
    }
    else
    {
      unsigned int v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      unsigned int v10 = @"property";
      v11[0] = a3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      unint64_t v7 = @"Invalid collation type (rtree indexes can only be created on attributes).";
    }
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v7 userInfo:v6]);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isAscending
{
  return *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
}

- (void)dealloc
{
  self->_propertyName = 0;
  if ((*(unsigned char *)&self->_indexElementDescriptionFlags & 2) != 0)
  {

    self->_property = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSFetchIndexElementDescription;
  [(NSFetchIndexElementDescription *)&v3 dealloc];
}

- initWithPropertyName:(uint64_t)a3 collationType:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)NSFetchIndexElementDescription;
  uint64_t v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    id v6 = a2;
    int v7 = v5[10];
    *((void *)v5 + 2) = v6;
    *((void *)v5 + 3) = a3;
    v5[10] = v7 & 0xFFFFFFFC | 1;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_propertyName forKey:@"NSPropertyName"];
  if ([(NSPropertyDescription *)self->_property _propertyType] == 5) {
    [a3 encodeObject:self->_property forKey:@"NSIndexedProperty"];
  }
  [a3 encodeInteger:self->_collationType forKey:@"NSFetchIndexElementType"];
  [a3 encodeObject:self->_indexDescription forKey:@"NSFetchIndexDescription"];
  uint64_t v5 = *(_DWORD *)&self->_indexElementDescriptionFlags & 1;

  [a3 encodeBool:v5 forKey:@"NSAscending"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 16) = [(NSString *)self->_propertyName copy];
    if ([(NSPropertyDescription *)self->_property _propertyType] == 5) {
      id v6 = (NSPropertyDescription *)[(NSPropertyDescription *)self->_property copy];
    }
    else {
      id v6 = [(NSFetchIndexElementDescription *)self property];
    }
    *(void *)(v5 + 8) = v6;
    int v7 = *(_DWORD *)(v5 + 40) | 2;
    *(_DWORD *)(v5 + 40) = v7;
    *(void *)(v5 + 24) = self->_collationType;
    *(_DWORD *)(v5 + 40) = v7 & 0xFFFFFFFE | *(_DWORD *)&self->_indexElementDescriptionFlags & 1;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unint64_t collationType = self->_collationType, collationType == [a3 collationType])
      && (int v12 = [(NSFetchIndexElementDescription *)self isAscending],
          v12 == [a3 isAscending]))
    {
      propertyName = self->_propertyName;
      uint64_t v13 = [a3 propertyName];
      if (propertyName == (NSString *)v13
        || (uint64_t v15 = v13, LOBYTE(v13) = 0, propertyName)
        && v15
        && (LODWORD(v13) = -[NSString isEqual:](propertyName, "isEqual:"), v13))
      {
        if ([(NSPropertyDescription *)self->_property _propertyType] != 5
          || (property = self->_property, uint64_t v13 = [a3 property], property == (NSPropertyDescription *)v13)
          || (uint64_t v17 = v13, LOBYTE(v13) = 0, property)
          && v17
          && (LODWORD(v13) = -[NSPropertyDescription isEqual:](property, "isEqual:"), v13))
        {
          LOBYTE(v13) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (unint64_t)hash
{
  return [(NSString *)self->_propertyName hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  propertyName = self->_propertyName;
  if ([(NSPropertyDescription *)self->_property _propertyType] == 5) {
    property = self->_property;
  }
  else {
    property = (NSPropertyDescription *)@"modeled property";
  }
  unint64_t collationType = self->_collationType;
  BOOL v7 = [(NSFetchIndexElementDescription *)self isAscending];
  uint64_t v8 = @"descending";
  if (v7) {
    uint64_t v8 = @"ascending";
  }
  return (id)[v3 stringWithFormat:@"<NSFetchIndexElementDescription : (%@ (%@), %d, %@)>", propertyName, property, collationType, v8];
}

- (void)_throwIfNotEditable
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    v2 = (void *)[result property];
    if (!v2 && v1[2])
    {
      uint64_t v3 = *MEMORY[0x1E4F1C3B8];
      uint64_t v4 = @"offender";
      v5[0] = v1;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v3, @"Broken logic around index elements", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
    }
    return (void *)[v2 _throwIfNotEditable];
  }
  return result;
}

- (void)setCollationType:(NSFetchIndexElementType)collationType
{
  if (self->_collationType != collationType)
  {
    -[NSFetchIndexElementDescription _validateCollationType:forProperty:]((uint64_t)self, collationType, self->_property);
    -[NSFetchIndexDescription _validateCollationTypeChangeFrom:to:]((unint64_t)self->_indexDescription, self->_collationType, collationType);
    self->_unint64_t collationType = collationType;
  }
}

- (void)setAscending:(BOOL)ascending
{
  BOOL v3 = ascending;
  -[NSFetchIndexElementDescription _throwIfNotEditable](self);
  self->___indexElementDescriptionFlags indexElementDescriptionFlags = (__indexElementDescriptionFlags)(*(_DWORD *)&self->_indexElementDescriptionFlags & 0xFFFFFFFE | v3);
}

- (NSFetchIndexDescription)indexDescription
{
  return self->_indexDescription;
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end