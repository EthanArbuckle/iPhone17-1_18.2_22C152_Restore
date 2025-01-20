@interface _INPBAirline
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIataCode;
- (BOOL)hasIcaoCode;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)iataCode;
- (NSString)icaoCode;
- (NSString)name;
- (_INPBAirline)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIataCode:(id)a3;
- (void)setIcaoCode:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAirline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icaoCode, 0);

  objc_storeStrong((id *)&self->_iataCode, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)icaoCode
{
  return self->_icaoCode;
}

- (NSString)iataCode
{
  return self->_iataCode;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_iataCode)
  {
    v4 = [(_INPBAirline *)self iataCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"iataCode"];
  }
  if (self->_icaoCode)
  {
    v6 = [(_INPBAirline *)self icaoCode];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"icaoCode"];
  }
  if (self->_name)
  {
    v8 = [(_INPBAirline *)self name];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"name"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_iataCode hash];
  NSUInteger v4 = [(NSString *)self->_icaoCode hash] ^ v3;
  return v4 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBAirline *)self iataCode];
  v6 = [v4 iataCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBAirline *)self iataCode];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAirline *)self iataCode];
    v10 = [v4 iataCode];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAirline *)self icaoCode];
  v6 = [v4 icaoCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBAirline *)self icaoCode];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAirline *)self icaoCode];
    v15 = [v4 icaoCode];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAirline *)self name];
  v6 = [v4 name];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBAirline *)self name];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBAirline *)self name];
    v20 = [v4 name];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBAirline allocWithZone:](_INPBAirline, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_iataCode copyWithZone:a3];
  [(_INPBAirline *)v5 setIataCode:v6];

  uint64_t v7 = (void *)[(NSString *)self->_icaoCode copyWithZone:a3];
  [(_INPBAirline *)v5 setIcaoCode:v7];

  v8 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBAirline *)v5 setName:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAirline *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAirline)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAirline *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAirline *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAirline *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBAirline *)self iataCode];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBAirline *)self icaoCode];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBAirline *)self name];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAirlineReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  MEMORY[0x1F41817F8](v4, name);
}

- (BOOL)hasIcaoCode
{
  return self->_icaoCode != 0;
}

- (void)setIcaoCode:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  icaoCode = self->_icaoCode;
  self->_icaoCode = v4;

  MEMORY[0x1F41817F8](v4, icaoCode);
}

- (BOOL)hasIataCode
{
  return self->_iataCode != 0;
}

- (void)setIataCode:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  iataCode = self->_iataCode;
  self->_iataCode = v4;

  MEMORY[0x1F41817F8](v4, iataCode);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end