@interface INAirline
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAirline)initWithCoder:(id)a3;
- (INAirline)initWithName:(NSString *)name iataCode:(NSString *)iataCode icaoCode:(NSString *)icaoCode;
- (NSString)description;
- (NSString)iataCode;
- (NSString)icaoCode;
- (NSString)name;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INAirline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icaoCode, 0);
  objc_storeStrong((id *)&self->_iataCode, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)icaoCode
{
  return self->_icaoCode;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (NSString)name
{
  return self->_name;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"name";
  name = self->_name;
  v4 = name;
  if (!name)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"iataCode";
  iataCode = self->_iataCode;
  v6 = iataCode;
  if (!iataCode)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"icaoCode";
  icaoCode = self->_icaoCode;
  v8 = icaoCode;
  if (!icaoCode)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (icaoCode)
  {
    if (iataCode) {
      goto LABEL_9;
    }
LABEL_14:

    if (name) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!iataCode) {
    goto LABEL_14;
  }
LABEL_9:
  if (name) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INAirline;
  v6 = [(INAirline *)&v11 description];
  v7 = [(INAirline *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INAirline *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_name];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"name");

  v9 = [v6 encodeObject:self->_iataCode];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"iataCode");

  v10 = [v6 encodeObject:self->_icaoCode];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"icaoCode");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_iataCode forKey:@"iataCode"];
  [v5 encodeObject:self->_icaoCode forKey:@"icaoCode"];
}

- (INAirline)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"name"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"iataCode"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"icaoCode"];

  v17 = [(INAirline *)self initWithName:v8 iataCode:v12 icaoCode:v16];
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INAirline *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      name = self->_name;
      BOOL v9 = 0;
      if (name == v5->_name || -[NSString isEqual:](name, "isEqual:"))
      {
        iataCode = self->_iataCode;
        if (iataCode == v5->_iataCode || -[NSString isEqual:](iataCode, "isEqual:"))
        {
          icaoCode = self->_icaoCode;
          if (icaoCode == v5->_icaoCode || -[NSString isEqual:](icaoCode, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_iataCode hash] ^ v3;
  return v4 ^ [(NSString *)self->_icaoCode hash];
}

- (INAirline)initWithName:(NSString *)name iataCode:(NSString *)iataCode icaoCode:(NSString *)icaoCode
{
  v8 = name;
  BOOL v9 = iataCode;
  uint64_t v10 = icaoCode;
  v19.receiver = self;
  v19.super_class = (Class)INAirline;
  objc_super v11 = [(INAirline *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [(NSString *)v9 copy];
    v15 = v11->_iataCode;
    v11->_iataCode = (NSString *)v14;

    uint64_t v16 = [(NSString *)v10 copy];
    v17 = v11->_icaoCode;
    v11->_icaoCode = (NSString *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"name"];
    v8 = [v6 objectForKeyedSubscript:@"iataCode"];
    BOOL v9 = [v6 objectForKeyedSubscript:@"icaoCode"];
    uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithName:v7 iataCode:v8 icaoCode:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end