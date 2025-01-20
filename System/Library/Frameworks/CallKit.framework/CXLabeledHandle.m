@interface CXLabeledHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabeledHandle:(id)a3;
- (CXHandle)handle;
- (CXLabeledHandle)init;
- (CXLabeledHandle)initWithCoder:(id)a3;
- (CXLabeledHandle)initWithHandle:(id)a3 label:(id)a4;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CXLabeledHandle

- (CXLabeledHandle)initWithHandle:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CXLabeledHandle;
  v9 = [(CXLabeledHandle *)&v13 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_handle, a3);
        uint64_t v10 = [v8 copy];
        label = v9->_label;
        v9->_label = (NSString *)v10;

        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXLabeledHandle initWithHandle:label:]", @"handle" format];
      if (v8) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXLabeledHandle initWithHandle:label:]", @"label" format];
    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (CXLabeledHandle)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXLabeledHandle *)self handle];
  v6 = [(CXLabeledHandle *)self label];
  id v7 = [v3 stringWithFormat:@"<%@ %p handle=%@ label=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXLabeledHandle *)self isEqualToLabeledHandle:v4];

  return v5;
}

- (BOOL)isEqualToLabeledHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXLabeledHandle *)self handle];
  v6 = [v4 handle];
  if ([v5 isEqualToHandle:v6])
  {
    uint64_t v7 = [(CXLabeledHandle *)self label];
    uint64_t v8 = [v4 label];
    char v9 = (v7 | v8) == 0;
    if (v8) {
      char v9 = [(id)v7 isEqualToString:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(CXLabeledHandle *)self handle];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXLabeledHandle *)self label];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CXLabeledHandle *)self handle];
  unint64_t v6 = [(CXLabeledHandle *)self label];
  uint64_t v7 = (void *)[v4 initWithHandle:v5 label:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXLabeledHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSStringFromSelector(sel_handle);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  char v9 = NSStringFromSelector(sel_label);
  uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = [(CXLabeledHandle *)self initWithHandle:v7 label:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXLabeledHandle *)self handle];
  unint64_t v6 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(CXLabeledHandle *)self label];
  uint64_t v7 = NSStringFromSelector(sel_label);
  [v4 encodeObject:v8 forKey:v7];
}

- (CXHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end