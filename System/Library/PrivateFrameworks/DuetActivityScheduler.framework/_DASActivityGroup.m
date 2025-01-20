@interface _DASActivityGroup
+ (BOOL)supportsSecureCoding;
+ (id)groupWithName:(id)a3 maxConcurrent:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (_DASActivityGroup)initWithCoder:(id)a3;
- (_DASActivityGroup)initWithName:(id)a3 maxConcurrent:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maxConcurrent;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxConcurrent:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation _DASActivityGroup

- (unint64_t)maxConcurrent
{
  return self->_maxConcurrent;
}

- (_DASActivityGroup)initWithName:(id)a3 maxConcurrent:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityGroup;
  v8 = [(_DASActivityGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_maxConcurrent = a4;
  }

  return v9;
}

+ (id)groupWithName:(id)a3 maxConcurrent:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v5 maxConcurrent:a4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(_DASActivityGroup *)self name];
  v6 = objc_msgSend(v4, "initWithName:maxConcurrent:", v5, -[_DASActivityGroup maxConcurrent](self, "maxConcurrent"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_maxConcurrent];
  [v5 encodeObject:v6 forKey:@"max"];
}

- (_DASActivityGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"max"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    v8 = 0;
  }
  else {
    v8 = (_DASActivityGroup *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:maxConcurrent:", v5, objc_msgSend(v6, "unsignedIntegerValue"));
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  name = self->_name;
  id v4 = [NSNumber numberWithUnsignedInteger:self->_maxConcurrent];
  id v5 = [v2 stringWithFormat:@"<_DASActivityGroup: %@ (%@)>", name, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASActivityGroup *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      name = self->_name;
      id v6 = [(_DASActivityGroup *)v4 name];
      char v7 = [(NSString *)name isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setMaxConcurrent:(unint64_t)a3
{
  self->_maxConcurrent = a3;
}

- (void).cxx_destruct
{
}

@end