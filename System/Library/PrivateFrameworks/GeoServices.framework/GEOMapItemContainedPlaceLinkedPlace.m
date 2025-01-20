@interface GEOMapItemContainedPlaceLinkedPlace
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasMUID;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasResultProviderID;
- (BOOL)_isInLinkedPlaceRelationship;
- (BOOL)_responseStatusIsIncomplete;
- (BOOL)isValid;
- (GEOMapItemContainedPlaceLinkedPlace)initWithLinkedPlace:(id)a3;
- (id)_identifier;
- (id)_styleAttributes;
- (id)description;
- (id)name;
- (int)_resultProviderID;
- (int)referenceFrame;
- (unint64_t)_muid;
@end

@implementation GEOMapItemContainedPlaceLinkedPlace

- (GEOMapItemContainedPlaceLinkedPlace)initWithLinkedPlace:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOMapItemContainedPlaceLinkedPlace;
  v6 = [(GEOMapItemContainedPlaceLinkedPlace *)&v20 init];
  v7 = v6;
  if (v6)
  {
    p_linkedPlace = (uint64_t *)&v6->_linkedPlace;
    objc_storeStrong((id *)&v6->_linkedPlace, a3);
    uint64_t v9 = *p_linkedPlace;
    if (*p_linkedPlace)
    {
      -[GEOPDLinkedPlace _readMapsId](*p_linkedPlace);
      if (*(void *)(v9 + 40))
      {
        v10 = [GEOMapItemIdentifier alloc];
        v11 = -[GEOPDLinkedPlace mapsId]((id *)*p_linkedPlace);
        uint64_t v12 = [(GEOMapItemIdentifier *)v10 initWithMapsIdentifier:v11];
        identifier = v7->_identifier;
        v7->_identifier = (GEOMapItemIdentifier *)v12;
      }
      uint64_t v14 = *p_linkedPlace;
      if (*p_linkedPlace)
      {
        -[GEOPDLinkedPlace _readStyleAttributes](*p_linkedPlace);
        if (*(void *)(v14 + 56))
        {
          v15 = [GEOFeatureStyleAttributes alloc];
          v16 = -[GEOPDLinkedPlace styleAttributes]((id *)*p_linkedPlace);
          uint64_t v17 = [(GEOFeatureStyleAttributes *)v15 initWithPlaceDataStyleAttributes:v16];
          styleAttributes = v7->_styleAttributes;
          v7->_styleAttributes = (GEOFeatureStyleAttributes *)v17;
        }
      }
    }
  }

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return -[GEOPDLinkedPlace name]((id *)&self->_linkedPlace->super.super.isa);
}

- (int)referenceFrame
{
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  v3 = -[GEOPDLinkedPlace center]((id *)&self->_linkedPlace->super.super.isa);
  v4 = v3;
  if (v3)
  {
    [v3 lat];
    unint64_t v6 = v5;
    [v4 lng];
    unint64_t v8 = v7;
  }
  else
  {
    identifier = self->_identifier;
    if (identifier)
    {
      [(GEOMapItemIdentifier *)identifier coordinate];
      unint64_t v6 = v10;
      unint64_t v8 = v11;
    }
    else
    {
      unint64_t v6 = 0xC066800000000000;
      unint64_t v8 = 0xC066800000000000;
    }
  }

  double v12 = *(double *)&v6;
  double v13 = *(double *)&v8;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (BOOL)_hasMUID
{
  linkedPlace = self->_linkedPlace;
  if (!linkedPlace) {
    return 0;
  }
  -[GEOPDLinkedPlace _readMapsId]((uint64_t)self->_linkedPlace);
  if (!linkedPlace->_mapsId) {
    return 0;
  }
  v4 = -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
  if ([v4 hasShardedId])
  {
    unint64_t v5 = -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
    unint64_t v6 = [v5 shardedId];
    char v7 = [v6 hasMuid];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)_muid
{
  return [(GEOMapItemIdentifier *)self->_identifier muid];
}

- (id)_identifier
{
  return self->_identifier;
}

- (BOOL)_hasResultProviderID
{
  linkedPlace = self->_linkedPlace;
  if (!linkedPlace) {
    return 0;
  }
  -[GEOPDLinkedPlace _readMapsId]((uint64_t)self->_linkedPlace);
  if (!linkedPlace->_mapsId) {
    return 0;
  }
  v4 = -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
  if ([v4 hasShardedId])
  {
    unint64_t v5 = -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
    unint64_t v6 = [v5 shardedId];
    char v7 = [v6 hasResultProviderId];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int)_resultProviderID
{
  return [(GEOMapItemIdentifier *)self->_identifier resultProviderID];
}

- (id)_styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%p %@>\n%@", self, v5, self->_linkedPlace];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_linkedPlace, 0);
}

@end