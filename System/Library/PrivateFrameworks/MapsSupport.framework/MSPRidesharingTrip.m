@interface MSPRidesharingTrip
- (BOOL)hasEndWaypoint;
- (BOOL)hasStartWaypoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndWaypoint:(id)a3;
- (void)setStartWaypoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPRidesharingTrip

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPRidesharingTrip;
  v4 = [(MSPRidesharingTrip *)&v8 description];
  v5 = [(MSPRidesharingTrip *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  startWaypoint = self->_startWaypoint;
  if (startWaypoint)
  {
    v5 = [(GEOComposedWaypoint *)startWaypoint dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"startWaypoint"];
  }
  endWaypoint = self->_endWaypoint;
  if (endWaypoint)
  {
    v7 = [(GEOComposedWaypoint *)endWaypoint dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"endWaypoint"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRidesharingTripReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startWaypoint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_endWaypoint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startWaypoint)
  {
    objc_msgSend(v4, "setStartWaypoint:");
    id v4 = v5;
  }
  if (self->_endWaypoint)
  {
    objc_msgSend(v5, "setEndWaypoint:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(GEOComposedWaypoint *)self->_startWaypoint copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(GEOComposedWaypoint *)self->_endWaypoint copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((startWaypoint = self->_startWaypoint, !((unint64_t)startWaypoint | v4[3]))
     || -[GEOComposedWaypoint isEqual:](startWaypoint, "isEqual:")))
  {
    endWaypoint = self->_endWaypoint;
    if ((unint64_t)endWaypoint | v4[2]) {
      char v7 = -[GEOComposedWaypoint isEqual:](endWaypoint, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(GEOComposedWaypoint *)self->_startWaypoint hash];
  return [(GEOComposedWaypoint *)self->_endWaypoint hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  startWaypoint = self->_startWaypoint;
  uint64_t v6 = v4[3];
  v9 = v4;
  if (startWaypoint)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOComposedWaypoint mergeFrom:](startWaypoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MSPRidesharingTrip setStartWaypoint:](self, "setStartWaypoint:");
  }
  id v4 = v9;
LABEL_7:
  endWaypoint = self->_endWaypoint;
  uint64_t v8 = v4[2];
  if (endWaypoint)
  {
    if (v8) {
      -[GEOComposedWaypoint mergeFrom:](endWaypoint, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MSPRidesharingTrip setEndWaypoint:](self, "setEndWaypoint:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOComposedWaypoint)startWaypoint
{
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
}

- (GEOComposedWaypoint)endWaypoint
{
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end