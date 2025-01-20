@interface LNSpeakableString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNSpeakableString)initWithCoder:(id)a3;
- (LNSpeakableString)initWithSpoken:(id)a3 printed:(id)a4;
- (LNStaticDeferredLocalizedString)printed;
- (LNStaticDeferredLocalizedString)spoken;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSpeakableString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printed, 0);
  objc_storeStrong((id *)&self->_spoken, 0);
}

- (LNStaticDeferredLocalizedString)printed
{
  return self->_printed;
}

- (LNStaticDeferredLocalizedString)spoken
{
  return self->_spoken;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNSpeakableString *)self spoken];
  [v4 encodeObject:v5 forKey:@"spoken"];

  id v6 = [(LNSpeakableString *)self printed];
  [v4 encodeObject:v6 forKey:@"printed"];
}

- (LNSpeakableString)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spoken"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"printed"];
    if (v6)
    {
      self = [(LNSpeakableString *)self initWithSpoken:v5 printed:v6];
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(LNSpeakableString *)self spoken];
  v7 = [(LNSpeakableString *)self printed];
  v8 = [v3 stringWithFormat:@"<%@: %p, spoken: %@, printed: %@>", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(LNSpeakableString *)self spoken];
  uint64_t v4 = [v3 hash];
  v5 = [(LNSpeakableString *)self printed];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNSpeakableString *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNSpeakableString *)self spoken];
      v8 = [(LNSpeakableString *)v6 spoken];
      if ([v7 isEqual:v8])
      {
        v9 = [(LNSpeakableString *)self printed];
        v10 = [(LNSpeakableString *)v6 printed];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (LNSpeakableString)initWithSpoken:(id)a3 printed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNSpeakableString.m", 20, @"Invalid parameter not satisfying: %@", @"spoken" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNSpeakableString.m", 21, @"Invalid parameter not satisfying: %@", @"printed" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNSpeakableString;
  v10 = [(LNSpeakableString *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    spoken = v10->_spoken;
    v10->_spoken = (LNStaticDeferredLocalizedString *)v11;

    uint64_t v13 = [v9 copy];
    printed = v10->_printed;
    v10->_printed = (LNStaticDeferredLocalizedString *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end