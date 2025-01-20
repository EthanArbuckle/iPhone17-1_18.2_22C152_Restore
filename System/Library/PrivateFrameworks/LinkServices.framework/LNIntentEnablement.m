@interface LNIntentEnablement
+ (BOOL)supportsSecureCoding;
+ (id)disabledWithReason:(id)a3;
+ (id)enabled;
- (BOOL)isEqual:(id)a3;
- (LNIntentEnablement)initWithCoder:(id)a3;
- (LNIntentEnablement)initWithValue:(int64_t)a3 disabledReason:(id)a4;
- (LNStaticDeferredLocalizedString)disabledReason;
- (id)description;
- (int64_t)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNIntentEnablement

- (void).cxx_destruct
{
}

- (LNStaticDeferredLocalizedString)disabledReason
{
  return self->_disabledReason;
}

- (int64_t)value
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNIntentEnablement *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNIntentEnablement *)self value];
        if (v7 != [(LNIntentEnablement *)v6 value])
        {
          char v13 = 0;
LABEL_16:

          goto LABEL_17;
        }
        v8 = [(LNIntentEnablement *)self disabledReason];
        v9 = [(LNIntentEnablement *)v6 disabledReason];
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          char v13 = 1;
        }
        else
        {
          char v13 = 0;
          if (v10 && v11) {
            char v13 = [(LNIntentEnablement *)v10 isEqual:v11];
          }
        }
      }
      else
      {
        char v13 = 0;
        v10 = v6;
        v6 = 0;
      }
    }
    else
    {
      v10 = 0;
      char v13 = 0;
    }

    goto LABEL_16;
  }
  char v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNIntentEnablement *)self value];
  v4 = [(LNIntentEnablement *)self disabledReason];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  int64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNIntentEnablement *)self value];
  int64_t v7 = [(LNIntentEnablement *)self disabledReason];
  v8 = [v3 stringWithFormat:@"<%@: %p, value: %ld, disabledReason: %@>", v5, self, v6, v7];

  return v8;
}

- (LNIntentEnablement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"value"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disabledReason"];

  int64_t v7 = [(LNIntentEnablement *)self initWithValue:v5 disabledReason:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNIntentEnablement value](self, "value"), @"value");
  id v5 = [(LNIntentEnablement *)self disabledReason];
  [v4 encodeObject:v5 forKey:@"disabledReason"];
}

- (LNIntentEnablement)initWithValue:(int64_t)a3 disabledReason:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNIntentEnablement;
  v8 = [(LNIntentEnablement *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_disabledReason, a4);
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)enabled
{
  v2 = [[LNIntentEnablement alloc] initWithValue:1 disabledReason:0];
  return v2;
}

+ (id)disabledWithReason:(id)a3
{
  id v3 = a3;
  id v4 = [[LNIntentEnablement alloc] initWithValue:0 disabledReason:v3];

  return v4;
}

@end