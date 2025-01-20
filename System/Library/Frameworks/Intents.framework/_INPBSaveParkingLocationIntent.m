@interface _INPBSaveParkingLocationIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasParkingLocation;
- (BOOL)hasParkingNote;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)parkingLocation;
- (_INPBSaveParkingLocationIntent)initWithCoder:(id)a3;
- (_INPBString)parkingNote;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setParkingLocation:(id)a3;
- (void)setParkingNote:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSaveParkingLocationIntent

- (void)writeTo:(id)a3
{
  id v10 = a3;
  v4 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];

  if (v6)
  {
    v7 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_INPBSaveParkingLocationIntent *)self parkingNote];

  if (v8)
  {
    v9 = [(_INPBSaveParkingLocationIntent *)self parkingNote];
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSaveParkingLocationIntent allocWithZone:](_INPBSaveParkingLocationIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSaveParkingLocationIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBLocation *)self->_parkingLocation copyWithZone:a3];
  [(_INPBSaveParkingLocationIntent *)v5 setParkingLocation:v7];

  id v8 = [(_INPBString *)self->_parkingNote copyWithZone:a3];
  [(_INPBSaveParkingLocationIntent *)v5 setParkingNote:v8];

  return v5;
}

- (_INPBSaveParkingLocationIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSaveParkingLocationIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSaveParkingLocationIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSaveParkingLocationIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];
  id v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];
    id v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];
  id v6 = [v4 parkingLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];
    v15 = [v4 parkingLocation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBSaveParkingLocationIntent *)self parkingNote];
  id v6 = [v4 parkingNote];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBSaveParkingLocationIntent *)self parkingNote];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBSaveParkingLocationIntent *)self parkingNote];
    v20 = [v4 parkingNote];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkingNote, 0);
  objc_storeStrong((id *)&self->_parkingLocation, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBString)parkingNote
{
  return self->_parkingNote;
}

- (_INPBLocation)parkingLocation
{
  return self->_parkingLocation;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(_INPBSaveParkingLocationIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  id v6 = [(_INPBSaveParkingLocationIntent *)self parkingLocation];
  uint64_t v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"parkingLocation"];

  id v8 = [(_INPBSaveParkingLocationIntent *)self parkingNote];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"parkingNote"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBLocation *)self->_parkingLocation hash] ^ v3;
  return v4 ^ [(_INPBString *)self->_parkingNote hash];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSaveParkingLocationIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSaveParkingLocationIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasParkingNote
{
  return self->_parkingNote != 0;
}

- (void)setParkingNote:(id)a3
{
}

- (BOOL)hasParkingLocation
{
  return self->_parkingLocation != 0;
}

- (void)setParkingLocation:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end