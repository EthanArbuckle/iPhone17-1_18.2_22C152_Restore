@interface LNDialog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDialog)initWithCoder:(id)a3;
- (LNDialog)initWithLocaleIdentifier:(id)a3;
- (NSString)localeIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDialog

- (void).cxx_destruct
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNDialog *)self localeIdentifier];
  [v4 encodeObject:v5 forKey:@"localeIdentifier"];
}

- (LNDialog)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];

  if (v5)
  {
    self = [(LNDialog *)self initWithLocaleIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNDialog *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNDialog *)self localeIdentifier];
      v8 = [(LNDialog *)v6 localeIdentifier];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(LNDialog *)self localeIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (LNDialog)initWithLocaleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNDialog.m", 17, @"Invalid parameter not satisfying: %@", @"localeIdentifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNDialog;
  v6 = [(LNDialog *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    localeIdentifier = v6->_localeIdentifier;
    v6->_localeIdentifier = (NSString *)v7;

    id v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end