@interface DNDContactHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesContactHandle:(id)a3;
- (DNDContactHandle)initWithCoder:(id)a3;
- (NSString)contactIdentifier;
- (NSString)value;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)normalizedValue;
- (id)redactedDescription;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDContactHandle

- (id)_initWithContactIdentifier:(id)a3 type:(unint64_t)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DNDContactHandle;
  v10 = [(DNDContactHandle *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    v10->_type = a4;
    uint64_t v13 = [v9 copy];
    value = v10->_value;
    v10->_value = (NSString *)v13;
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(DNDContactHandle *)self contactIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDContactHandle *)self type] ^ v4;
  v6 = [(DNDContactHandle *)self value];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v7 = (DNDContactHandle *)a3;
  if (self == v7)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(DNDContactHandle *)self contactIdentifier];
      v10 = [(DNDContactHandle *)v8 contactIdentifier];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDContactHandle *)self contactIdentifier];
        if (!v11)
        {
          char v13 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v3 = (void *)v11;
        uint64_t v4 = [(DNDContactHandle *)v8 contactIdentifier];
        if (!v4)
        {
          char v13 = 0;
LABEL_27:

          goto LABEL_28;
        }
        v12 = [(DNDContactHandle *)self contactIdentifier];
        unint64_t v5 = [(DNDContactHandle *)v8 contactIdentifier];
        if (![v12 isEqual:v5])
        {
          char v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v12;
      }
      unint64_t v14 = [(DNDContactHandle *)self type];
      if (v14 == [(DNDContactHandle *)v8 type])
      {
        v15 = [(DNDContactHandle *)self value];
        uint64_t v16 = [(DNDContactHandle *)v8 value];
        if (v15 != (void *)v16)
        {
          v17 = (void *)v16;
          v25 = v5;
          uint64_t v18 = [(DNDContactHandle *)self value];
          if (v18)
          {
            v19 = (void *)v18;
            v20 = [(DNDContactHandle *)v8 value];
            if (v20)
            {
              v24 = v20;
              v23 = [(DNDContactHandle *)self value];
              v22 = [(DNDContactHandle *)v8 value];
              char v13 = [v23 isEqual:v22];

              v20 = v24;
            }
            else
            {
              char v13 = 0;
            }
          }
          else
          {

            char v13 = 0;
          }
          unint64_t v5 = v25;
          v12 = v26;
          if (v9 == v10) {
            goto LABEL_28;
          }
          goto LABEL_26;
        }

        char v13 = 1;
      }
      else
      {
        char v13 = 0;
      }
      v12 = v26;
      if (v9 == v10) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
    char v13 = 0;
  }
LABEL_29:

  return v13;
}

- (BOOL)matchesContactHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DNDContactHandle *)self contactIdentifier];
  if (v5)
  {
    v6 = [(DNDContactHandle *)self contactIdentifier];
    unint64_t v7 = [v4 contactIdentifier];
    if (v6 == v7)
    {
      char v12 = 1;
    }
    else
    {
      id v8 = [(DNDContactHandle *)self contactIdentifier];
      if (v8)
      {
        id v9 = [v4 contactIdentifier];
        if (v9)
        {
          v10 = [(DNDContactHandle *)self contactIdentifier];
          uint64_t v11 = [v4 contactIdentifier];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  char v13 = [(DNDContactHandle *)self value];
  if (v13 && (unint64_t v14 = -[DNDContactHandle type](self, "type"), v14 == [v4 type]))
  {
    v15 = [(DNDContactHandle *)self value];
    uint64_t v16 = [v4 value];
    if (v15 == v16)
    {
      char v21 = 1;
    }
    else
    {
      v17 = [(DNDContactHandle *)self value];
      if (v17)
      {
        uint64_t v18 = [v4 value];
        if (v18)
        {
          v19 = [(DNDContactHandle *)self value];
          v20 = [v4 value];
          char v21 = [v19 isEqual:v20];
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        char v21 = 0;
      }
    }
  }
  else
  {
    char v21 = 0;
  }

  return v12 | v21;
}

- (id)description
{
  return [(DNDContactHandle *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDContactHandle *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  unint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  contactIdentifier = self->_contactIdentifier;
  unint64_t type = self->_type;
  id v9 = @"unknown";
  if (type == 2) {
    id v9 = @"phone";
  }
  if (type == 1) {
    v10 = @"email";
  }
  else {
    v10 = v9;
  }
  value = self->_value;
  char v12 = v10;
  char v13 = v12;
  if (a3)
  {
    uint64_t v14 = [(NSString *)value dnd_privacyObfuscatedString];
    objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; contactIdentifier: %@; type: %@; value: %@;>",
      v6,
      self,
      contactIdentifier,
      v13,
    v15 = v14);

    char v13 = (void *)v14;
  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; contactIdentifier: %@; type: %@; value: %@;>",
      v6,
      self,
      contactIdentifier,
      v12,
    v15 = value);
  }

  return v15;
}

- (id)normalizedValue
{
  normalizedValue = self->_normalizedValue;
  if (!normalizedValue)
  {
    id v4 = [(DNDContactHandle *)self value];
    unint64_t v5 = [(DNDContactHandle *)self type];
    id v6 = v4;
    unint64_t v7 = v6;
    if (v5 == 2)
    {
      unint64_t v7 = +[DNDContact normalizePhoneNumber:v6];
    }
    id v8 = (NSString *)[v7 copy];
    id v9 = self->_normalizedValue;
    self->_normalizedValue = v8;

    normalizedValue = self->_normalizedValue;
  }
  return normalizedValue;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DNDMutableContactHandle alloc];
  contactIdentifier = self->_contactIdentifier;
  unint64_t type = self->_type;
  value = self->_value;
  return [(DNDContactHandle *)v4 _initWithContactIdentifier:contactIdentifier type:type value:value];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDContactHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  id v8 = [(DNDContactHandle *)self _initWithContactIdentifier:v5 type:v6 value:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end