@interface _INPBRideVehicle
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocation;
- (BOOL)hasManufacturer;
- (BOOL)hasMapAnnotationImage;
- (BOOL)hasModel;
- (BOOL)hasRegistrationPlate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)registrationPlate;
- (_INPBImageValue)mapAnnotationImage;
- (_INPBRideVehicle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setMapAnnotationImage:(id)a3;
- (void)setModel:(id)a3;
- (void)setRegistrationPlate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideVehicle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationPlate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mapAnnotationImage, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (NSString)registrationPlate
{
  return self->_registrationPlate;
}

- (NSString)model
{
  return self->_model;
}

- (_INPBImageValue)mapAnnotationImage
{
  return self->_mapAnnotationImage;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (GEOLocation)location
{
  return self->_location;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRideVehicle *)self location];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"location"];

  if (self->_manufacturer)
  {
    v6 = [(_INPBRideVehicle *)self manufacturer];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"manufacturer"];
  }
  v8 = [(_INPBRideVehicle *)self mapAnnotationImage];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"mapAnnotationImage"];

  if (self->_model)
  {
    v10 = [(_INPBRideVehicle *)self model];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"model"];
  }
  if (self->_registrationPlate)
  {
    v12 = [(_INPBRideVehicle *)self registrationPlate];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"registrationPlate"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOLocation *)self->_location hash];
  NSUInteger v4 = [(NSString *)self->_manufacturer hash] ^ v3;
  unint64_t v5 = [(_INPBImageValue *)self->_mapAnnotationImage hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_model hash];
  return v6 ^ [(NSString *)self->_registrationPlate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBRideVehicle *)self location];
  NSUInteger v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBRideVehicle *)self location];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRideVehicle *)self location];
    v10 = [v4 location];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideVehicle *)self manufacturer];
  NSUInteger v6 = [v4 manufacturer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBRideVehicle *)self manufacturer];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRideVehicle *)self manufacturer];
    v15 = [v4 manufacturer];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideVehicle *)self mapAnnotationImage];
  NSUInteger v6 = [v4 mapAnnotationImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBRideVehicle *)self mapAnnotationImage];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRideVehicle *)self mapAnnotationImage];
    v20 = [v4 mapAnnotationImage];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideVehicle *)self model];
  NSUInteger v6 = [v4 model];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBRideVehicle *)self model];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRideVehicle *)self model];
    v25 = [v4 model];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRideVehicle *)self registrationPlate];
  NSUInteger v6 = [v4 registrationPlate];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBRideVehicle *)self registrationPlate];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBRideVehicle *)self registrationPlate];
    v30 = [v4 registrationPlate];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBRideVehicle allocWithZone:](_INPBRideVehicle, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(GEOLocation *)self->_location copyWithZone:a3];
  [(_INPBRideVehicle *)v5 setLocation:v6];

  uint64_t v7 = (void *)[(NSString *)self->_manufacturer copyWithZone:a3];
  [(_INPBRideVehicle *)v5 setManufacturer:v7];

  id v8 = [(_INPBImageValue *)self->_mapAnnotationImage copyWithZone:a3];
  [(_INPBRideVehicle *)v5 setMapAnnotationImage:v8];

  v9 = (void *)[(NSString *)self->_model copyWithZone:a3];
  [(_INPBRideVehicle *)v5 setModel:v9];

  v10 = (void *)[(NSString *)self->_registrationPlate copyWithZone:a3];
  [(_INPBRideVehicle *)v5 setRegistrationPlate:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideVehicle *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideVehicle)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideVehicle *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideVehicle *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideVehicle *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_INPBRideVehicle *)self location];

  if (v4)
  {
    unint64_t v5 = [(_INPBRideVehicle *)self location];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRideVehicle *)self manufacturer];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBRideVehicle *)self mapAnnotationImage];

  if (v7)
  {
    id v8 = [(_INPBRideVehicle *)self mapAnnotationImage];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBRideVehicle *)self model];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  v10 = [(_INPBRideVehicle *)self registrationPlate];

  int v11 = v12;
  if (v10)
  {
    PBDataWriterWriteStringField();
    int v11 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideVehicleReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRegistrationPlate
{
  return self->_registrationPlate != 0;
}

- (void)setRegistrationPlate:(id)a3
{
  self->_registrationPlate = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setModel:(id)a3
{
  self->_model = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasMapAnnotationImage
{
  return self->_mapAnnotationImage != 0;
}

- (void)setMapAnnotationImage:(id)a3
{
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (void)setManufacturer:(id)a3
{
  self->_manufacturer = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end