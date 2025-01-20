@interface NSPropertyTransform
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSPropertyTransform)initWithCoder:(id)a3;
- (NSPropertyTransform)initWithPropertyName:(id)a3 valueExpression:(id)a4;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPropertyTransform

- (NSPropertyTransform)initWithPropertyName:(id)a3 valueExpression:(id)a4
{
  v6 = [(NSPropertyTransform *)self init];
  v8 = v6;
  if (v6)
  {
    objc_setProperty_nonatomic(v6, v7, a3, 16);
    objc_setProperty_nonatomic(v8, v9, a4, 8);
  }
  return v8;
}

- (void)dealloc
{
  self->_prerequisiteTransform = 0;
  self->_valueExpression = 0;

  self->_propertyName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPropertyTransform;
  [(NSPropertyTransform *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self)
  {
    [a3 encodeObject:self->_valueExpression forKey:@"NSValueExpression"];
    [a3 encodeObject:self->_propertyName forKey:@"NSPropertyName"];
    [a3 encodeObject:self->_prerequisiteTransform forKey:@"NSPrerequisiteTransform"];
    BOOL replaceMissingValueOnly = self->_replaceMissingValueOnly;
  }
  else
  {
    [a3 encodeObject:0 forKey:@"NSValueExpression"];
    [a3 encodeObject:0 forKey:@"NSPropertyName"];
    [a3 encodeObject:0 forKey:@"NSPrerequisiteTransform"];
    BOOL replaceMissingValueOnly = 0;
  }

  [a3 encodeBool:replaceMissingValueOnly forKey:@"NSReplaceMissingValueOnly"];
}

- (NSPropertyTransform)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSPropertyTransform;
  v4 = [(NSPropertyTransform *)&v7 init];
  if (v4)
  {
    v4->_BOOL replaceMissingValueOnly = [a3 decodeBoolForKey:@"NSReplaceMissingValueOnly"];
    v4->_prerequisiteTransform = (NSPropertyTransform *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPrerequisiteTransform"];
    v4->_valueExpression = (NSExpression *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSValueExpression"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(NSExpression *)v4->_valueExpression allowEvaluation];
    }
    v5 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPropertyName"];
    v4->_propertyName = v5;
    if (v5 && ([(NSString *)v5 isNSString] & 1) == 0)
    {
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E21E0));

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (!a3) {
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  if (!self)
  {
    if (!*((void *)a3 + 2))
    {
      uint64_t v12 = *((void *)a3 + 1);
      if (!v12)
      {
        LOBYTE(v7) = 0;
        if (*((void *)a3 + 3)) {
          return v7;
        }
        goto LABEL_18;
      }
    }
    goto LABEL_22;
  }
  propertyName = self->_propertyName;
  v6 = (NSString *)*((void *)a3 + 2);
  if (propertyName != v6)
  {
    LOBYTE(v7) = 0;
    if (!propertyName || !v6) {
      return v7;
    }
    if ((-[NSString isEqual:](self->_propertyName, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  valueExpression = self->_valueExpression;
  SEL v9 = (NSExpression *)*((void *)a3 + 1);
  if (valueExpression != v9)
  {
    LOBYTE(v7) = 0;
    if (!valueExpression || !v9) {
      return v7;
    }
    if ((-[NSExpression isEqual:](self->_valueExpression, "isEqual:") & 1) == 0)
    {
LABEL_22:
      LOBYTE(v7) = 0;
      return v7;
    }
  }
  prerequisiteTransform = self->_prerequisiteTransform;
  v11 = (NSPropertyTransform *)*((void *)a3 + 3);
  if (prerequisiteTransform == v11
    || (LOBYTE(v7) = 0, prerequisiteTransform)
    && v11
    && (int v7 = -[NSPropertyTransform isEqual:](self->_prerequisiteTransform, "isEqual:")) != 0)
  {
    LOBYTE(v12) = self->_replaceMissingValueOnly;
LABEL_18:
    LOBYTE(v7) = v12 ^ (*((unsigned char *)a3 + 32) == 0);
  }
  return v7;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"NO";
  if (self)
  {
    valueExpression = self->_valueExpression;
    propertyName = self->_propertyName;
    prerequisiteTransform = self->_prerequisiteTransform;
    if (self->_replaceMissingValueOnly) {
      v5 = @"YES";
    }
  }
  else
  {
    valueExpression = 0;
    propertyName = 0;
    prerequisiteTransform = 0;
  }
  return (id)[v3 stringWithFormat:@"(%@), propertyName %@, valueExpression %@, prerequisiteTransform %@, replaceMissingValueOnly %@", v4, propertyName, valueExpression, prerequisiteTransform, v5];
}

@end