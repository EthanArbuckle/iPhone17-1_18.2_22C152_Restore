@interface MSPTransitStorageLine
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasAlternateArtwork;
- (BOOL)hasArtwork;
- (BOOL)hasHeaderArtwork;
- (BOOL)hasLineColorString;
- (BOOL)hasLocationHint;
- (BOOL)hasModeArtwork;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)hasSystem;
- (BOOL)isBus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)showVehicleNumber;
- (GEOLatLng)locationHint;
- (GEOMapItemIdentifier)identifier;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitSystem)system;
- (MSPTransitStorageLine)initWithLine:(id)a3;
- (NSArray)operatingHours;
- (NSString)description;
- (NSString)lineColorString;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternateArtwork:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHeaderArtwork:(id)a3;
- (void)setLineColorString:(id)a3;
- (void)setLocationHint:(id)a3;
- (void)setModeArtwork:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setSystem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageLine

- (MSPTransitStorageLine)initWithLine:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MSPTransitStorageLine;
  v5 = [(MSPTransitStorageLine *)&v33 init];
  if (v5)
  {
    v6 = [v4 identifier];
    -[MSPTransitStorageLine setMuid:](v5, "setMuid:", [v6 muid]);
    v7 = [v4 name];
    [(MSPTransitStorageLine *)v5 setName:v7];

    v8 = [v4 lineColorString];
    [(MSPTransitStorageLine *)v5 setLineColorString:v8];

    if ([v6 hasCoordinate])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F64638]);
      [v6 coordinate];
      v10 = objc_msgSend(v9, "initWithCoordinate:");
      [(MSPTransitStorageLine *)v5 setLocationHint:v10];
    }
    v11 = [v4 system];

    if (v11)
    {
      v12 = [MSPTransitStorageSystem alloc];
      v13 = [v4 system];
      v14 = [(MSPTransitStorageSystem *)v12 initWithSystem:v13];
      [(MSPTransitStorageLine *)v5 setSystem:v14];
    }
    v15 = [v4 artwork];

    if (v15)
    {
      v16 = [MSPTransitStorageArtwork alloc];
      v17 = [v4 artwork];
      v18 = [(MSPTransitStorageArtwork *)v16 initWithArtwork:v17];
      [(MSPTransitStorageLine *)v5 setArtwork:v18];
    }
    v19 = [v4 modeArtwork];

    if (v19)
    {
      v20 = [MSPTransitStorageArtwork alloc];
      v21 = [v4 modeArtwork];
      v22 = [(MSPTransitStorageArtwork *)v20 initWithArtwork:v21];
      [(MSPTransitStorageLine *)v5 setModeArtwork:v22];
    }
    v23 = [v4 alternateArtwork];

    if (v23)
    {
      v24 = [MSPTransitStorageArtwork alloc];
      v25 = [v4 alternateArtwork];
      v26 = [(MSPTransitStorageArtwork *)v24 initWithArtwork:v25];
      [(MSPTransitStorageLine *)v5 setAlternateArtwork:v26];
    }
    v27 = [v4 headerArtwork];

    if (v27)
    {
      v28 = [MSPTransitStorageArtwork alloc];
      v29 = [v4 headerArtwork];
      v30 = [(MSPTransitStorageArtwork *)v28 initWithArtwork:v29];
      [(MSPTransitStorageLine *)v5 setHeaderArtwork:v30];
    }
    v31 = v5;
  }
  return v5;
}

- (GEOMapItemIdentifier)identifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F646B8]);
  unint64_t v4 = [(MSPTransitStorageLine *)self muid];
  if ([(MSPTransitStorageLine *)self hasLocationHint])
  {
    v5 = [(MSPTransitStorageLine *)self locationHint];
    [v5 coordinate];
    v6 = objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v4, 0);
  }
  else
  {
    v6 = objc_msgSend(v3, "initWithMUID:resultProviderID:coordinate:", v4, 0, -180.0, -180.0);
  }

  return (GEOMapItemIdentifier *)v6;
}

- (unint64_t)departureTimeDisplayStyle
{
  return 0;
}

- (NSArray)operatingHours
{
  return 0;
}

- (BOOL)showVehicleNumber
{
  return 0;
}

- (BOOL)departuresAreVehicleSpecific
{
  return 0;
}

- (BOOL)isBus
{
  return 0;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLineColorString
{
  return self->_lineColorString != 0;
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (BOOL)hasModeArtwork
{
  return self->_modeArtwork != 0;
}

- (BOOL)hasSystem
{
  return self->_system != 0;
}

- (BOOL)hasAlternateArtwork
{
  return self->_alternateArtwork != 0;
}

- (BOOL)hasLocationHint
{
  return self->_locationHint != 0;
}

- (BOOL)hasHeaderArtwork
{
  return self->_headerArtwork != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageLine;
  unint64_t v4 = [(MSPTransitStorageLine *)&v8 description];
  v5 = [(MSPTransitStorageLine *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_muid];
    [v3 setObject:v4 forKey:@"muid"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  lineColorString = self->_lineColorString;
  if (lineColorString) {
    [v3 setObject:lineColorString forKey:@"line_color_string"];
  }
  artwork = self->_artwork;
  if (artwork)
  {
    objc_super v8 = [(MSPTransitStorageArtwork *)artwork dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"artwork"];
  }
  modeArtwork = self->_modeArtwork;
  if (modeArtwork)
  {
    v10 = [(MSPTransitStorageArtwork *)modeArtwork dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"mode_artwork"];
  }
  system = self->_system;
  if (system)
  {
    v12 = [(MSPTransitStorageSystem *)system dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"system"];
  }
  alternateArtwork = self->_alternateArtwork;
  if (alternateArtwork)
  {
    v14 = [(MSPTransitStorageArtwork *)alternateArtwork dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"alternate_artwork"];
  }
  locationHint = self->_locationHint;
  if (locationHint)
  {
    v16 = [(GEOLatLng *)locationHint dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"location_hint"];
  }
  headerArtwork = self->_headerArtwork;
  if (headerArtwork)
  {
    v18 = [(MSPTransitStorageArtwork *)headerArtwork dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"header_artwork"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v20 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageLineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_lineColorString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_modeArtwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_system)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_alternateArtwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_locationHint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_headerArtwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_muid;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_lineColorString)
  {
    objc_msgSend(v5, "setLineColorString:");
    id v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    id v4 = v5;
  }
  if (self->_modeArtwork)
  {
    objc_msgSend(v5, "setModeArtwork:");
    id v4 = v5;
  }
  if (self->_system)
  {
    objc_msgSend(v5, "setSystem:");
    id v4 = v5;
  }
  if (self->_alternateArtwork)
  {
    objc_msgSend(v5, "setAlternateArtwork:");
    id v4 = v5;
  }
  if (self->_locationHint)
  {
    objc_msgSend(v5, "setLocationHint:");
    id v4 = v5;
  }
  if (self->_headerArtwork)
  {
    objc_msgSend(v5, "setHeaderArtwork:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 16) = self->_muid;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v7;

  uint64_t v9 = [(NSString *)self->_lineColorString copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  id v11 = [(MSPTransitStorageArtwork *)self->_artwork copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  id v13 = [(MSPTransitStorageArtwork *)self->_modeArtwork copyWithZone:a3];
  v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  id v15 = [(MSPTransitStorageSystem *)self->_system copyWithZone:a3];
  v16 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v15;

  id v17 = [(MSPTransitStorageArtwork *)self->_alternateArtwork copyWithZone:a3];
  v18 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v17;

  uint64_t v19 = [(GEOLatLng *)self->_locationHint copyWithZone:a3];
  v20 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v19;

  id v21 = [(MSPTransitStorageArtwork *)self->_headerArtwork copyWithZone:a3];
  v22 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v21;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_23:
    char v13 = 0;
    goto LABEL_24;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 9) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_23;
  }
  lineColorString = self->_lineColorString;
  if ((unint64_t)lineColorString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](lineColorString, "isEqual:")) {
      goto LABEL_23;
    }
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 4))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](artwork, "isEqual:")) {
      goto LABEL_23;
    }
  }
  modeArtwork = self->_modeArtwork;
  if ((unint64_t)modeArtwork | *((void *)v4 + 8))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](modeArtwork, "isEqual:")) {
      goto LABEL_23;
    }
  }
  system = self->_system;
  if ((unint64_t)system | *((void *)v4 + 10))
  {
    if (!-[MSPTransitStorageSystem isEqual:](system, "isEqual:")) {
      goto LABEL_23;
    }
  }
  alternateArtwork = self->_alternateArtwork;
  if ((unint64_t)alternateArtwork | *((void *)v4 + 3))
  {
    if (!-[MSPTransitStorageArtwork isEqual:](alternateArtwork, "isEqual:")) {
      goto LABEL_23;
    }
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](locationHint, "isEqual:")) {
      goto LABEL_23;
    }
  }
  headerArtwork = self->_headerArtwork;
  if ((unint64_t)headerArtwork | *((void *)v4 + 5)) {
    char v13 = -[MSPTransitStorageArtwork isEqual:](headerArtwork, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_lineColorString hash];
  unint64_t v6 = v4 ^ v5 ^ [(MSPTransitStorageArtwork *)self->_artwork hash];
  unint64_t v7 = [(MSPTransitStorageArtwork *)self->_modeArtwork hash];
  unint64_t v8 = v7 ^ [(MSPTransitStorageSystem *)self->_system hash];
  unint64_t v9 = v6 ^ v8 ^ [(MSPTransitStorageArtwork *)self->_alternateArtwork hash];
  uint64_t v10 = [(GEOLatLng *)self->_locationHint hash];
  return v9 ^ v10 ^ [(MSPTransitStorageArtwork *)self->_headerArtwork hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  NSUInteger v5 = v4;
  if (v4[11])
  {
    self->_muid = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  v18 = v4;
  if (v4[9])
  {
    -[MSPTransitStorageLine setName:](self, "setName:");
    NSUInteger v5 = v18;
  }
  if (v5[6])
  {
    -[MSPTransitStorageLine setLineColorString:](self, "setLineColorString:");
    NSUInteger v5 = v18;
  }
  artwork = self->_artwork;
  uint64_t v7 = v5[4];
  if (artwork)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[MSPTransitStorageArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[MSPTransitStorageLine setArtwork:](self, "setArtwork:");
  }
  NSUInteger v5 = v18;
LABEL_13:
  modeArtwork = self->_modeArtwork;
  uint64_t v9 = v5[8];
  if (modeArtwork)
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[MSPTransitStorageArtwork mergeFrom:](modeArtwork, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_19;
    }
    -[MSPTransitStorageLine setModeArtwork:](self, "setModeArtwork:");
  }
  NSUInteger v5 = v18;
LABEL_19:
  system = self->_system;
  uint64_t v11 = v5[10];
  if (system)
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[MSPTransitStorageSystem mergeFrom:](system, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_25;
    }
    -[MSPTransitStorageLine setSystem:](self, "setSystem:");
  }
  NSUInteger v5 = v18;
LABEL_25:
  alternateArtwork = self->_alternateArtwork;
  uint64_t v13 = v5[3];
  if (alternateArtwork)
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[MSPTransitStorageArtwork mergeFrom:](alternateArtwork, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_31;
    }
    -[MSPTransitStorageLine setAlternateArtwork:](self, "setAlternateArtwork:");
  }
  NSUInteger v5 = v18;
LABEL_31:
  locationHint = self->_locationHint;
  uint64_t v15 = v5[7];
  if (locationHint)
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[GEOLatLng mergeFrom:](locationHint, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[MSPTransitStorageLine setLocationHint:](self, "setLocationHint:");
  }
  NSUInteger v5 = v18;
LABEL_37:
  headerArtwork = self->_headerArtwork;
  uint64_t v17 = v5[5];
  if (headerArtwork)
  {
    if (v17) {
      -[MSPTransitStorageArtwork mergeFrom:](headerArtwork, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[MSPTransitStorageLine setHeaderArtwork:](self, "setHeaderArtwork:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)lineColorString
{
  return self->_lineColorString;
}

- (void)setLineColorString:(id)a3
{
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)self->_modeArtwork;
}

- (void)setModeArtwork:(id)a3
{
}

- (GEOTransitSystem)system
{
  return (GEOTransitSystem *)self->_system;
}

- (void)setSystem:(id)a3
{
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)self->_alternateArtwork;
}

- (void)setAlternateArtwork:(id)a3
{
}

- (GEOLatLng)locationHint
{
  return self->_locationHint;
}

- (void)setLocationHint:(id)a3
{
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)self->_headerArtwork;
}

- (void)setHeaderArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modeArtwork, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_lineColorString, 0);
  objc_storeStrong((id *)&self->_headerArtwork, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_alternateArtwork, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end