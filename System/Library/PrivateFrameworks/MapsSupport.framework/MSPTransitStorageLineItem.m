@interface MSPTransitStorageLineItem
+ (Class)incidentsType;
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasEncyclopedicInfo;
- (BOOL)hasIncidentComponent;
- (BOOL)hasLine;
- (BOOL)hasLineColorString;
- (BOOL)hasStoredMapRegion;
- (BOOL)hasTransitAttribution;
- (BOOL)isBus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncidentsTTLExpired;
- (BOOL)readFrom:(id)a3;
- (BOOL)showVehicleNumber;
- (GEOEncyclopedicInfo)encyclopedicInfo;
- (GEOMapItemIdentifier)identifier;
- (GEOMapRegion)storedMapRegion;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitSystem)system;
- (MSPTransitStorageAttribution)transitAttribution;
- (MSPTransitStorageLine)line;
- (MSPTransitStorageLineItem)initWithLineItem:(id)a3;
- (NSArray)incidents;
- (NSArray)labelItems;
- (NSArray)operatingHours;
- (NSString)description;
- (NSString)lineColorString;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)incidentsAtIndex:(unint64_t)a3;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)hash;
- (unint64_t)incidentsCount;
- (unint64_t)muid;
- (void)addIncidents:(id)a3;
- (void)clearIncidents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIncidents:(id)a3;
- (void)setLine:(id)a3;
- (void)setStoredMapRegion:(id)a3;
- (void)setTransitAttribution:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageLineItem

- (MSPTransitStorageLineItem)initWithLineItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MSPTransitStorageLineItem;
  v5 = [(MSPTransitStorageLineItem *)&v23 init];
  if (v5)
  {
    v6 = [[MSPTransitStorageLine alloc] initWithLine:v4];
    [(MSPTransitStorageLineItem *)v5 setLine:v6];

    v7 = [MSPTransitStorageAttribution alloc];
    v8 = [v4 attribution];
    v9 = [(MSPTransitStorageAttribution *)v7 initWithAttribution:v8];
    [(MSPTransitStorageLineItem *)v5 setTransitAttribution:v9];

    v10 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = objc_msgSend(v4, "incidents", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[MSPTransitStorageIncident alloc] initWithIncident:*(void *)(*((void *)&v19 + 1) + 8 * v15)];
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    [(MSPTransitStorageLineItem *)v5 setIncidents:v10];
    v17 = [v4 mapRegion];
    [(MSPTransitStorageLineItem *)v5 setStoredMapRegion:v17];
  }
  return v5;
}

- (unint64_t)muid
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  unint64_t v3 = [v2 muid];

  return v3;
}

- (GEOMapItemIdentifier)identifier
{
  unint64_t v3 = [(MSPTransitStorageLineItem *)self storedMapRegion];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F646B8]);
    v5 = [(MSPTransitStorageLineItem *)self line];
    uint64_t v6 = [v5 muid];
    v7 = [(MSPTransitStorageLineItem *)self storedMapRegion];
    [v7 centerLat];
    double v9 = v8;
    v10 = [(MSPTransitStorageLineItem *)self storedMapRegion];
    [v10 centerLng];
    uint64_t v12 = objc_msgSend(v4, "initWithMUID:resultProviderID:coordinate:", v6, 0, v9, v11);
  }
  else
  {
    v5 = [(MSPTransitStorageLineItem *)self line];
    uint64_t v12 = [v5 identifier];
  }

  return (GEOMapItemIdentifier *)v12;
}

- (NSString)name
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (GEOTransitSystem)system
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  unint64_t v3 = [v2 system];

  return (GEOTransitSystem *)v3;
}

- (unint64_t)departureTimeDisplayStyle
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  unint64_t v3 = [v2 departureTimeDisplayStyle];

  return v3;
}

- (BOOL)departuresAreVehicleSpecific
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 departuresAreVehicleSpecific];

  return v3;
}

- (GEOTransitArtworkDataSource)artwork
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 artwork];

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 modeArtwork];

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 alternateArtwork];

  return (GEOTransitArtworkDataSource *)v3;
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 headerArtwork];

  return (GEOTransitArtworkDataSource *)v3;
}

- (BOOL)hasLineColorString
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 hasLineColorString];

  return v3;
}

- (NSString)lineColorString
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 lineColorString];

  return (NSString *)v3;
}

- (BOOL)showVehicleNumber
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 showVehicleNumber];

  return v3;
}

- (NSArray)operatingHours
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 operatingHours];

  return (NSArray *)v3;
}

- (NSArray)labelItems
{
  return 0;
}

- (BOOL)isIncidentsTTLExpired
{
  return 0;
}

- (BOOL)hasIncidentComponent
{
  v2 = [(MSPTransitStorageLineItem *)self incidents];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasEncyclopedicInfo
{
  return 0;
}

- (GEOEncyclopedicInfo)encyclopedicInfo
{
  return 0;
}

- (BOOL)isBus
{
  v2 = [(MSPTransitStorageLineItem *)self line];
  char v3 = [v2 isBus];

  return v3;
}

- (BOOL)hasLine
{
  return self->_line != 0;
}

- (BOOL)hasStoredMapRegion
{
  return self->_storedMapRegion != 0;
}

- (BOOL)hasTransitAttribution
{
  return self->_transitAttribution != 0;
}

- (void)clearIncidents
{
}

- (void)addIncidents:(id)a3
{
  id v4 = a3;
  incidents = self->_incidents;
  id v8 = v4;
  if (!incidents)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_incidents;
    self->_incidents = v6;

    id v4 = v8;
    incidents = self->_incidents;
  }
  [(NSMutableArray *)incidents addObject:v4];
}

- (unint64_t)incidentsCount
{
  return [(NSMutableArray *)self->_incidents count];
}

- (id)incidentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_incidents objectAtIndex:a3];
}

+ (Class)incidentsType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageLineItem;
  id v4 = [(MSPTransitStorageLineItem *)&v8 description];
  v5 = [(MSPTransitStorageLineItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  line = self->_line;
  if (line)
  {
    v5 = [(MSPTransitStorageLine *)line dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"line"];
  }
  storedMapRegion = self->_storedMapRegion;
  if (storedMapRegion)
  {
    v7 = [(GEOMapRegion *)storedMapRegion dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"stored_map_region"];
  }
  transitAttribution = self->_transitAttribution;
  if (transitAttribution)
  {
    double v9 = [(MSPTransitStorageAttribution *)transitAttribution dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"transit_attribution"];
  }
  if ([(NSMutableArray *)self->_incidents count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_incidents, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v11 = self->_incidents;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"incidents"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v18 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageLineItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_line) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_storedMapRegion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_transitAttribution) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_incidents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_line) {
    objc_msgSend(v8, "setLine:");
  }
  if (self->_storedMapRegion) {
    objc_msgSend(v8, "setStoredMapRegion:");
  }
  if (self->_transitAttribution) {
    objc_msgSend(v8, "setTransitAttribution:");
  }
  if ([(MSPTransitStorageLineItem *)self incidentsCount])
  {
    [v8 clearIncidents];
    unint64_t v4 = [(MSPTransitStorageLineItem *)self incidentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MSPTransitStorageLineItem *)self incidentsAtIndex:i];
        [v8 addIncidents:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MSPTransitStorageLine *)self->_line copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(GEOMapRegion *)self->_storedMapRegion copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(MSPTransitStorageAttribution *)self->_transitAttribution copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_incidents;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addIncidents:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((line = self->_line, !((unint64_t)line | v4[3])) || -[MSPTransitStorageLine isEqual:](line, "isEqual:"))
    && ((storedMapRegion = self->_storedMapRegion, !((unint64_t)storedMapRegion | v4[4]))
     || -[GEOMapRegion isEqual:](storedMapRegion, "isEqual:"))
    && ((transitAttribution = self->_transitAttribution, !((unint64_t)transitAttribution | v4[5]))
     || -[MSPTransitStorageAttribution isEqual:](transitAttribution, "isEqual:")))
  {
    incidents = self->_incidents;
    if ((unint64_t)incidents | v4[2]) {
      char v9 = -[NSMutableArray isEqual:](incidents, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MSPTransitStorageLine *)self->_line hash];
  uint64_t v4 = [(GEOMapRegion *)self->_storedMapRegion hash] ^ v3;
  unint64_t v5 = [(MSPTransitStorageAttribution *)self->_transitAttribution hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_incidents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  line = self->_line;
  uint64_t v6 = *((void *)v4 + 3);
  if (line)
  {
    if (v6) {
      -[MSPTransitStorageLine mergeFrom:](line, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MSPTransitStorageLineItem setLine:](self, "setLine:");
  }
  storedMapRegion = self->_storedMapRegion;
  uint64_t v8 = *((void *)v4 + 4);
  if (storedMapRegion)
  {
    if (v8) {
      -[GEOMapRegion mergeFrom:](storedMapRegion, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MSPTransitStorageLineItem setStoredMapRegion:](self, "setStoredMapRegion:");
  }
  transitAttribution = self->_transitAttribution;
  uint64_t v10 = *((void *)v4 + 5);
  if (transitAttribution)
  {
    if (v10) {
      -[MSPTransitStorageAttribution mergeFrom:](transitAttribution, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[MSPTransitStorageLineItem setTransitAttribution:](self, "setTransitAttribution:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 2);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[MSPTransitStorageLineItem addIncidents:](self, "addIncidents:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (MSPTransitStorageLine)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
}

- (GEOMapRegion)storedMapRegion
{
  return self->_storedMapRegion;
}

- (void)setStoredMapRegion:(id)a3
{
}

- (MSPTransitStorageAttribution)transitAttribution
{
  return self->_transitAttribution;
}

- (void)setTransitAttribution:(id)a3
{
}

- (NSArray)incidents
{
  return &self->_incidents->super;
}

- (void)setIncidents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitAttribution, 0);
  objc_storeStrong((id *)&self->_storedMapRegion, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_incidents, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end