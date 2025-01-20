@interface STPersonContactHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersonContactHandle:(id)a3;
- (NSString)handle;
- (NSString)label;
- (STPersonContactHandle)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabel:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation STPersonContactHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (STPersonContactHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STPersonContactHandle;
  v5 = [(STPersonContactHandle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"_handle"];
  [v5 encodeObject:self->_label forKey:@"_label"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(STPersonContactHandle *)self type];
  id v4 = [(STPersonContactHandle *)self label];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(STPersonContactHandle *)self handle];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(STPersonContactHandle *)self isEqualToPersonContactHandle:v4];

  return v5;
}

- (BOOL)isEqualToPersonContactHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(STPersonContactHandle *)self type];
  if (v5 != [v4 type]) {
    goto LABEL_10;
  }
  uint64_t v6 = [(STPersonContactHandle *)self label];
  if (v6)
  {
  }
  else
  {
    objc_super v11 = [v4 label];

    if (v11) {
      goto LABEL_10;
    }
  }
  unint64_t v7 = [(STPersonContactHandle *)self label];
  uint64_t v8 = [v4 label];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [(STPersonContactHandle *)self handle];
    if (v10)
    {

LABEL_12:
      v15 = [(STPersonContactHandle *)self handle];
      v16 = [v4 handle];
      char v13 = [v15 isEqualToString:v16];

      goto LABEL_11;
    }
    v12 = [v4 handle];

    if (!v12) {
      goto LABEL_12;
    }
  }
LABEL_10:
  char v13 = 0;
LABEL_11:

  return v13;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(STPersonContactHandle *)self handle];
  uint64_t v6 = [(STPersonContactHandle *)self label];
  unint64_t v7 = [v3 stringWithFormat:@"<%@: %p handle=%@ (%@)>", v4, self, v5, v6];;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end