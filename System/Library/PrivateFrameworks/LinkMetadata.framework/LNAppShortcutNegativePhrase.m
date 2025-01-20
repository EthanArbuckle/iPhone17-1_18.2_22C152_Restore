@interface LNAppShortcutNegativePhrase
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutNegativePhrase)initWithCoder:(id)a3;
- (LNAppShortcutNegativePhrase)initWithPhrase:(id)a3;
- (LNStaticDeferredLocalizedString)phrase;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutNegativePhrase

- (void).cxx_destruct
{
}

- (LNStaticDeferredLocalizedString)phrase
{
  return self->_phrase;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAppShortcutNegativePhrase *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNAppShortcutNegativePhrase *)self phrase];
      v8 = [(LNAppShortcutNegativePhrase *)v6 phrase];
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
          char v12 = [v9 isEqual:v10];
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
  v2 = [(LNAppShortcutNegativePhrase *)self phrase];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNAppShortcutNegativePhrase *)self phrase];
  v7 = [v3 stringWithFormat:@"<%@: %p, phrase: %@>", v5, self, v6];

  return v7;
}

- (LNAppShortcutNegativePhrase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];

  if (v5)
  {
    self = [(LNAppShortcutNegativePhrase *)self initWithPhrase:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNAppShortcutNegativePhrase *)self phrase];
  [v4 encodeObject:v5 forKey:@"phrase"];
}

- (LNAppShortcutNegativePhrase)initWithPhrase:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNAppShortcutNegativePhrase.m", 20, @"Invalid parameter not satisfying: %@", @"phrase" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNAppShortcutNegativePhrase;
  v6 = [(LNAppShortcutNegativePhrase *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    phrase = v6->_phrase;
    v6->_phrase = (LNStaticDeferredLocalizedString *)v7;

    id v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end