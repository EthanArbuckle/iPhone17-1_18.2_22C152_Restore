@interface GEOPDTransitNearbyPaymentMethodLookupOrigin
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setWaypointTyped:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitNearbyPaymentMethodLookupOrigin

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitNearbyPaymentMethodLookupOriginReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOWaypointTyped *)self->_waypointTyped copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 16);
    id v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        v8 = @"waypointTyped";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        v8 = @"waypoint_typed";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __73__GEOPDTransitNearbyPaymentMethodLookupOrigin__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_waypointTyped)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

void __73__GEOPDTransitNearbyPaymentMethodLookupOrigin__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (void)setWaypointTyped:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitNearbyPaymentMethodLookupOrigin;
  id v4 = [(GEOPDTransitNearbyPaymentMethodLookupOrigin *)&v8 description];
  id v5 = [(GEOPDTransitNearbyPaymentMethodLookupOrigin *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitNearbyPaymentMethodLookupOrigin _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitNearbyPaymentMethodLookupOrigin _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    waypointTyped = self->_waypointTyped;
    if ((unint64_t)waypointTyped | v4[2]) {
      char v6 = -[GEOWaypointTyped isEqual:](waypointTyped, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(GEOWaypointTyped *)self->_waypointTyped hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointTyped, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end