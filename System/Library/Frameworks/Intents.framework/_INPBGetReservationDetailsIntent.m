@interface _INPBGetReservationDetailsIntent
+ (BOOL)supportsSecureCoding;
+ (Class)reservationItemReferencesType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasReservationContainerReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)reservationItemReferences;
- (_INPBDataString)reservationContainerReference;
- (_INPBGetReservationDetailsIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)reservationItemReferencesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)reservationItemReferencesCount;
- (void)addReservationItemReferences:(id)a3;
- (void)clearReservationItemReferences;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setReservationContainerReference:(id)a3;
- (void)setReservationItemReferences:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetReservationDetailsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationItemReferences, 0);
  objc_storeStrong((id *)&self->_reservationContainerReference, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)reservationItemReferences
{
  return self->_reservationItemReferences;
}

- (_INPBDataString)reservationContainerReference
{
  return self->_reservationContainerReference;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  v6 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"reservationContainerReference"];

  if ([(NSArray *)self->_reservationItemReferences count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_reservationItemReferences;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"reservationItemReferences"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v4 = [(_INPBDataString *)self->_reservationContainerReference hash] ^ v3;
  return v4 ^ [(NSArray *)self->_reservationItemReferences hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];
  v6 = [v4 reservationContainerReference];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];
    v15 = [v4 reservationContainerReference];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBGetReservationDetailsIntent *)self reservationItemReferences];
  v6 = [v4 reservationItemReferences];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBGetReservationDetailsIntent *)self reservationItemReferences];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(_INPBGetReservationDetailsIntent *)self reservationItemReferences];
    v20 = [v4 reservationItemReferences];
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
  v5 = [+[_INPBGetReservationDetailsIntent allocWithZone:](_INPBGetReservationDetailsIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBGetReservationDetailsIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_reservationContainerReference copyWithZone:a3];
  [(_INPBGetReservationDetailsIntent *)v5 setReservationContainerReference:v7];

  v8 = (void *)[(NSArray *)self->_reservationItemReferences copyWithZone:a3];
  [(_INPBGetReservationDetailsIntent *)v5 setReservationItemReferences:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetReservationDetailsIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetReservationDetailsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetReservationDetailsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetReservationDetailsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetReservationDetailsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBGetReservationDetailsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];

  if (v7)
  {
    v8 = [(_INPBGetReservationDetailsIntent *)self reservationContainerReference];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_reservationItemReferences;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetReservationDetailsIntentReadFrom(self, (uint64_t)a3);
}

- (id)reservationItemReferencesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_reservationItemReferences objectAtIndexedSubscript:a3];
}

- (unint64_t)reservationItemReferencesCount
{
  return [(NSArray *)self->_reservationItemReferences count];
}

- (void)addReservationItemReferences:(id)a3
{
  id v4 = a3;
  reservationItemReferences = self->_reservationItemReferences;
  id v8 = v4;
  if (!reservationItemReferences)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_reservationItemReferences;
    self->_reservationItemReferences = v6;

    id v4 = v8;
    reservationItemReferences = self->_reservationItemReferences;
  }
  [(NSArray *)reservationItemReferences addObject:v4];
}

- (void)clearReservationItemReferences
{
}

- (void)setReservationItemReferences:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  reservationItemReferences = self->_reservationItemReferences;
  self->_reservationItemReferences = v4;

  MEMORY[0x1F41817F8](v4, reservationItemReferences);
}

- (BOOL)hasReservationContainerReference
{
  return self->_reservationContainerReference != 0;
}

- (void)setReservationContainerReference:(id)a3
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

+ (Class)reservationItemReferencesType
{
  return (Class)objc_opt_class();
}

@end