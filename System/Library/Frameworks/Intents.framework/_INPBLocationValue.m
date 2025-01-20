@interface _INPBLocationValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMapItemStorage;
- (BOOL)hasPlace;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapItemStorage)mapItemStorage;
- (GEOPDPlace)place;
- (_INPBLocationValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setPlace:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLocationValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_place, 0);

  objc_storeStrong((id *)&self->_mapItemStorage, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (GEOPDPlace)place
{
  return self->_place;
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBLocationValue *)self mapItemStorage];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"mapItemStorage"];

  v6 = [(_INPBLocationValue *)self place];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"place"];

  v8 = [(_INPBLocationValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOMapItemStorage *)self->_mapItemStorage hash];
  uint64_t v4 = [(GEOPDPlace *)self->_place hash] ^ v3;
  return v4 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBLocationValue *)self mapItemStorage];
  v6 = [v4 mapItemStorage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBLocationValue *)self mapItemStorage];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBLocationValue *)self mapItemStorage];
    v10 = [v4 mapItemStorage];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBLocationValue *)self place];
  v6 = [v4 place];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBLocationValue *)self place];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBLocationValue *)self place];
    v15 = [v4 place];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBLocationValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBLocationValue *)self valueMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBLocationValue *)self valueMetadata];
    v20 = [v4 valueMetadata];
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
  v5 = [+[_INPBLocationValue allocWithZone:](_INPBLocationValue, "allocWithZone:") init];
  v6 = (void *)[(GEOMapItemStorage *)self->_mapItemStorage copyWithZone:a3];
  [(_INPBLocationValue *)v5 setMapItemStorage:v6];

  uint64_t v7 = (void *)[(GEOPDPlace *)self->_place copyWithZone:a3];
  [(_INPBLocationValue *)v5 setPlace:v7];

  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBLocationValue *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLocationValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLocationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLocationValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLocationValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLocationValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBLocationValue *)self mapItemStorage];

  if (v4)
  {
    v5 = [(_INPBLocationValue *)self mapItemStorage];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBLocationValue *)self place];

  if (v6)
  {
    uint64_t v7 = [(_INPBLocationValue *)self place];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBLocationValue *)self valueMetadata];

  if (v8)
  {
    v9 = [(_INPBLocationValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocationValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (void)setPlace:(id)a3
{
}

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (void)setMapItemStorage:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end