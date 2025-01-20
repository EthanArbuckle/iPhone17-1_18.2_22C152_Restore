@interface LNAppShortcutDynamicOptionsProviderReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutDynamicOptionsProviderReference)initWithAppShortcutsProviderMangledTypeName:(id)a3 parameterIdentifier:(id)a4 appShortcutIndex:(int64_t)a5 optionsProviderIndex:(int64_t)a6;
- (LNAppShortcutDynamicOptionsProviderReference)initWithCoder:(id)a3;
- (NSString)appShortcutsProviderMangledTypeName;
- (id)description;
- (int64_t)appShortcutIndex;
- (int64_t)optionsProviderIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutDynamicOptionsProviderReference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAppShortcutDynamicOptionsProviderReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appShortcutsProviderMangledTypeName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"appShortcutIndex"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"optionsProviderIndex"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = [(LNAppShortcutDynamicOptionsProviderReference *)self initWithAppShortcutsProviderMangledTypeName:v5 parameterIdentifier:v6 appShortcutIndex:v7 optionsProviderIndex:v8];
    v10 = self;
  }

  return v10;
}

- (LNAppShortcutDynamicOptionsProviderReference)initWithAppShortcutsProviderMangledTypeName:(id)a3 parameterIdentifier:(id)a4 appShortcutIndex:(int64_t)a5 optionsProviderIndex:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNAppShortcutDynamicOptionsProviderReference.m", 22, @"Invalid parameter not satisfying: %@", @"appShortcutsProviderMangledTypeName" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  v13 = [(LNDynamicOptionsProviderReference *)&v19 initWithParameterIdentifier:v12];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    appShortcutsProviderMangledTypeName = v13->_appShortcutsProviderMangledTypeName;
    v13->_appShortcutsProviderMangledTypeName = (NSString *)v14;

    v13->_appShortcutIndex = a5;
    v13->_optionsProviderIndex = a6;
    v16 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (int64_t)optionsProviderIndex
{
  return self->_optionsProviderIndex;
}

- (int64_t)appShortcutIndex
{
  return self->_appShortcutIndex;
}

- (NSString)appShortcutsProviderMangledTypeName
{
  return self->_appShortcutsProviderMangledTypeName;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  id v4 = a3;
  [(LNDynamicOptionsProviderReference *)&v6 encodeWithCoder:v4];
  v5 = [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutsProviderMangledTypeName];
  [v4 encodeObject:v5 forKey:@"appShortcutsProviderMangledTypeName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex"), @"appShortcutIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex"), @"optionsProviderIndex");
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  unint64_t v3 = [(LNDynamicOptionsProviderReference *)&v9 hash];
  id v4 = [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutsProviderMangledTypeName];
  uint64_t v5 = [v4 hash];
  int64_t v6 = v5 ^ [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutIndex];
  unint64_t v7 = v6 ^ [(LNAppShortcutDynamicOptionsProviderReference *)self optionsProviderIndex] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAppShortcutDynamicOptionsProviderReference *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
    if ([(LNDynamicOptionsProviderReference *)&v16 isEqual:v4])
    {
      uint64_t v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        BOOL v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      int64_t v6 = [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutsProviderMangledTypeName];
      unint64_t v7 = [(LNAppShortcutDynamicOptionsProviderReference *)v5 appShortcutsProviderMangledTypeName];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if (!v8 || !v9)
        {

          goto LABEL_17;
        }
        int v11 = [v8 isEqualToString:v9];

        if (!v11) {
          goto LABEL_17;
        }
      }
      int64_t v13 = [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutIndex];
      if (v13 == [(LNAppShortcutDynamicOptionsProviderReference *)v5 appShortcutIndex])
      {
        int64_t v14 = [(LNAppShortcutDynamicOptionsProviderReference *)self optionsProviderIndex];
        BOOL v12 = v14 == [(LNAppShortcutDynamicOptionsProviderReference *)v5 optionsProviderIndex];
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:
      BOOL v12 = 0;
      goto LABEL_18;
    }
    BOOL v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNAppShortcutDynamicOptionsProviderReference *)self appShortcutsProviderMangledTypeName];
  unint64_t v7 = [(LNDynamicOptionsProviderReference *)self parameterIdentifier];
  id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex"));
  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex"));
  v10 = [v3 stringWithFormat:@"<%@: %p, appShortcutsProviderMangledTypeName: %@, parameterIdentifier: %@, appShortcutIndex: %@, optionsProviderIndex: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

@end