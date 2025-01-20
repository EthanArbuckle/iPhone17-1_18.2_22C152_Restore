@interface _DASActivityResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (_DASActivityResult)initWithCoder:(id)a3;
- (_DASActivityResult)initWithIdentifier:(id)a3;
- (_DASActivityResult)initWithIdentifier:(id)a3 count:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(int64_t)a3;
@end

@implementation _DASActivityResult

- (_DASActivityResult)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityResult;
  v6 = [(_DASActivityResult *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_count = 0;
  }

  return v7;
}

- (_DASActivityResult)initWithIdentifier:(id)a3 count:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityResult;
  v8 = [(_DASActivityResult *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_DASActivityResult *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(_DASActivityResult *)v4 identifier];
      char v6 = [v5 isEqual:self->_identifier];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %@: count: %ld>", objc_opt_class(), self->_identifier, self->_count];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  int64_t count = self->_count;

  return (id)[v4 initWithIdentifier:identifier count:count];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  int64_t count = self->_count;

  return (id)[v4 initWithIdentifier:identifier count:count];
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  id v6 = [NSNumber numberWithInteger:self->_count];
  [v5 encodeObject:v6 forKey:@"count"];
}

- (_DASActivityResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"count"];

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
    v8 = (_DASActivityResult *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:count:", v5, (int)objc_msgSend(v6, "intValue"));
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_int64_t count = a3;
}

- (void).cxx_destruct
{
}

- (id)dictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int64_t count = self->_count;
  identifier = self->_identifier;
  v3 = [NSNumber numberWithInteger:count];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&identifier count:1];

  return v4;
}

@end