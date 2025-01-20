@interface _INPBListRideOptionsIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDropOffLocation;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPickupLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBListRideOptionsIntent)initWithCoder:(id)a3;
- (_INPBLocation)dropOffLocation;
- (_INPBLocation)pickupLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPickupLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBListRideOptionsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_dropOffLocation, 0);
}

- (_INPBLocation)pickupLocation
{
  return self->_pickupLocation;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBLocation)dropOffLocation
{
  return self->_dropOffLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBListRideOptionsIntent *)self dropOffLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dropOffLocation"];

  v6 = [(_INPBListRideOptionsIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBListRideOptionsIntent *)self pickupLocation];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"pickupLocation"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocation *)self->_dropOffLocation hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(_INPBLocation *)self->_pickupLocation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBListRideOptionsIntent *)self dropOffLocation];
  v6 = [v4 dropOffLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBListRideOptionsIntent *)self dropOffLocation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBListRideOptionsIntent *)self dropOffLocation];
    v10 = [v4 dropOffLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBListRideOptionsIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBListRideOptionsIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBListRideOptionsIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBListRideOptionsIntent *)self pickupLocation];
  v6 = [v4 pickupLocation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBListRideOptionsIntent *)self pickupLocation];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBListRideOptionsIntent *)self pickupLocation];
    v20 = [v4 pickupLocation];
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
  v5 = [+[_INPBListRideOptionsIntent allocWithZone:](_INPBListRideOptionsIntent, "allocWithZone:") init];
  id v6 = [(_INPBLocation *)self->_dropOffLocation copyWithZone:a3];
  [(_INPBListRideOptionsIntent *)v5 setDropOffLocation:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBListRideOptionsIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBLocation *)self->_pickupLocation copyWithZone:a3];
  [(_INPBListRideOptionsIntent *)v5 setPickupLocation:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBListRideOptionsIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBListRideOptionsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBListRideOptionsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBListRideOptionsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBListRideOptionsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBListRideOptionsIntent *)self dropOffLocation];

  if (v4)
  {
    v5 = [(_INPBListRideOptionsIntent *)self dropOffLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBListRideOptionsIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBListRideOptionsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBListRideOptionsIntent *)self pickupLocation];

  if (v8)
  {
    v9 = [(_INPBListRideOptionsIntent *)self pickupLocation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBListRideOptionsIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setPickupLocation:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setDropOffLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end