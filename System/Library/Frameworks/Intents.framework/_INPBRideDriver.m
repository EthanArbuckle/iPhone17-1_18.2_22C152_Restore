@interface _INPBRideDriver
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage;
- (BOOL)hasPerson;
- (BOOL)hasPhoneNumber;
- (BOOL)hasRating;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)phoneNumber;
- (NSString)rating;
- (_INPBContactValue)person;
- (_INPBImageValue)image;
- (_INPBRideDriver)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRating:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideDriver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_person, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (NSString)rating
{
  return self->_rating;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (_INPBContactValue)person
{
  return self->_person;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRideDriver *)self image];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"image"];

  v6 = [(_INPBRideDriver *)self person];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"person"];

  if (self->_phoneNumber)
  {
    v8 = [(_INPBRideDriver *)self phoneNumber];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"phoneNumber"];
  }
  if (self->_rating)
  {
    v10 = [(_INPBRideDriver *)self rating];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"rating"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBImageValue *)self->_image hash];
  unint64_t v4 = [(_INPBContactValue *)self->_person hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_phoneNumber hash];
  return v4 ^ v5 ^ [(NSString *)self->_rating hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBRideDriver *)self image];
  v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBRideDriver *)self image];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRideDriver *)self image];
    v10 = [v4 image];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRideDriver *)self person];
  v6 = [v4 person];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBRideDriver *)self person];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRideDriver *)self person];
    v15 = [v4 person];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRideDriver *)self phoneNumber];
  v6 = [v4 phoneNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBRideDriver *)self phoneNumber];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRideDriver *)self phoneNumber];
    v20 = [v4 phoneNumber];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBRideDriver *)self rating];
  v6 = [v4 rating];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBRideDriver *)self rating];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBRideDriver *)self rating];
    v25 = [v4 rating];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBRideDriver allocWithZone:](_INPBRideDriver, "allocWithZone:") init];
  id v6 = [(_INPBImageValue *)self->_image copyWithZone:a3];
  [(_INPBRideDriver *)v5 setImage:v6];

  id v7 = [(_INPBContactValue *)self->_person copyWithZone:a3];
  [(_INPBRideDriver *)v5 setPerson:v7];

  v8 = (void *)[(NSString *)self->_phoneNumber copyWithZone:a3];
  [(_INPBRideDriver *)v5 setPhoneNumber:v8];

  v9 = (void *)[(NSString *)self->_rating copyWithZone:a3];
  [(_INPBRideDriver *)v5 setRating:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideDriver *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideDriver)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideDriver *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideDriver *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideDriver *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBRideDriver *)self image];

  if (v4)
  {
    NSUInteger v5 = [(_INPBRideDriver *)self image];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRideDriver *)self person];

  if (v6)
  {
    uint64_t v7 = [(_INPBRideDriver *)self person];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_INPBRideDriver *)self phoneNumber];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(_INPBRideDriver *)self rating];

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideDriverReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRating
{
  return self->_rating != 0;
}

- (void)setRating:(id)a3
{
  self->_rating = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (void)setPhoneNumber:(id)a3
{
  self->_phoneNumber = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setPerson:(id)a3
{
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setImage:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end