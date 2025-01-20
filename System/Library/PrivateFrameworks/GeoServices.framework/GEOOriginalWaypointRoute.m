@interface GEOOriginalWaypointRoute
+ (BOOL)isValid:(id)a3;
+ (Class)routeLegType;
- (BOOL)hasCreationMethod;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasLastValidUserOffsetCm;
- (BOOL)hasPurpose;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOOriginalWaypointRoute)initWithDictionary:(id)a3;
- (GEOOriginalWaypointRoute)initWithJSON:(id)a3;
- (NSMutableArray)routeLegs;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)creationMethodAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)purposeAsString:(int)a3;
- (id)routeLegAtIndex:(unint64_t)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsCreationMethod:(id)a3;
- (int)StringAsPurpose:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)creationMethod;
- (int)purpose;
- (int)source;
- (unint64_t)hash;
- (unint64_t)routeLegsCount;
- (unsigned)identifier;
- (unsigned)lastValidUserOffsetCm;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addRouteLeg:(id)a3;
- (void)clearRouteLegs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationMethod:(int)a3;
- (void)setHasCreationMethod:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasLastValidUserOffsetCm:(BOOL)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setLastValidUserOffsetCm:(unsigned int)a3;
- (void)setPurpose:(int)a3;
- (void)setRouteLegs:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOOriginalWaypointRoute

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (NSMutableArray)routeLegs
{
  return self->_routeLegs;
}

- (void)setRouteLegs:(id)a3
{
}

- (void)clearRouteLegs
{
}

- (void)addRouteLeg:(id)a3
{
  id v4 = a3;
  routeLegs = self->_routeLegs;
  id v8 = v4;
  if (!routeLegs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_routeLegs;
    self->_routeLegs = v6;

    id v4 = v8;
    routeLegs = self->_routeLegs;
  }
  [(NSMutableArray *)routeLegs addObject:v4];
}

- (unint64_t)routeLegsCount
{
  return [(NSMutableArray *)self->_routeLegs count];
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_routeLegs objectAtIndex:a3];
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (int)purpose
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_purpose;
  }
  else {
    return 1;
  }
}

- (void)setPurpose:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasPurpose
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E02F8[a3];
  }

  return v3;
}

- (int)StringAsPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PURPOSE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REROUTING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REROUTING_ONTO_ORIGINAL_ROUTE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ROUTE_FROM_ZILCH_POINTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BIASED_DIRECTIONS_TO_POI"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BIASED_DIRECTIONS_FROM_POI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CHANGE_WAYPOINTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CHANGE_ANCHORS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANGE_TRANSPORT_MODE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RESUME_NAV_AFTER_PAUSE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OFFLINE_TO_ONLINE_NAV_TRANSITION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"OFFLINE_TO_ONLINE_NEW_ROUTE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CONVERT_TO_NAVIGABLE_ROUTE"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)source
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0368[a3];
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ONLINE_SERVICE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OFFLINE_SERVICE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)lastValidUserOffsetCm
{
  return self->_lastValidUserOffsetCm;
}

- (void)setLastValidUserOffsetCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_lastValidUserOffsetCm = a3;
}

- (void)setHasLastValidUserOffsetCm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLastValidUserOffsetCm
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)creationMethod
{
  if (*(unsigned char *)&self->_flags) {
    return self->_creationMethod;
  }
  else {
    return 0;
  }
}

- (void)setCreationMethod:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_creationMethod = a3;
}

- (void)setHasCreationMethod:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCreationMethod
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)creationMethodAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0380[a3];
  }

  return v3;
}

- (int)StringAsCreationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ROUTE_CREATION_METHOD_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROUTE_CREATION_METHOD_USER_CREATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROUTE_CREATION_METHOD_APPLE_CURATED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOOriginalWaypointRoute;
  int v4 = [(GEOOriginalWaypointRoute *)&v8 description];
  v5 = [(GEOOriginalWaypointRoute *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_47;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 44) & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    [v4 setObject:v5 forKey:@"identifier"];
  }
  if ([*(id *)(a1 + 16) count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = *(id *)(a1 + 16);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (a2) {
            [v12 jsonRepresentation];
          }
          else {
          v13 = [v12 dictionaryRepresentation];
          }
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
    }

    if (a2) {
      v14 = @"routeLeg";
    }
    else {
      v14 = @"route_leg";
    }
    [v4 setObject:v6 forKey:v14];
  }
  char v15 = *(unsigned char *)(a1 + 44);
  if ((v15 & 8) != 0)
  {
    uint64_t v16 = *(int *)(a1 + 36);
    if (v16 >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E53E02F8[v16];
    }
    [v4 setObject:v17 forKey:@"purpose"];

    char v15 = *(unsigned char *)(a1 + 44);
    if ((v15 & 0x10) == 0)
    {
LABEL_21:
      if ((v15 & 4) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 0x10) == 0)
  {
    goto LABEL_21;
  }
  uint64_t v18 = *(int *)(a1 + 40);
  if (v18 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E53E0368[v18];
  }
  [v4 setObject:v19 forKey:@"source"];

  char v15 = *(unsigned char *)(a1 + 44);
  if ((v15 & 4) == 0)
  {
LABEL_22:
    if ((v15 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
LABEL_32:
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  if (a2) {
    v21 = @"lastValidUserOffsetCm";
  }
  else {
    v21 = @"last_valid_user_offset_cm";
  }
  [v4 setObject:v20 forKey:v21];

  if (*(unsigned char *)(a1 + 44))
  {
LABEL_36:
    uint64_t v22 = *(int *)(a1 + 24);
    if (v22 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53E0380[v22];
    }
    if (a2) {
      v24 = @"creationMethod";
    }
    else {
      v24 = @"creation_method";
    }
    [v4 setObject:v23 forKey:v24];
  }
LABEL_43:
  v25 = *(void **)(a1 + 8);
  if (v25)
  {
    v26 = [v25 dictionaryRepresentation];
    v27 = v26;
    if (a2)
    {
      v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __54__GEOOriginalWaypointRoute__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E53D8860;
      id v29 = v28;
      id v33 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v32];
      id v30 = v29;

      v27 = v30;
    }
    [v4 setObject:v27 forKey:@"Unknown Fields"];
  }
LABEL_47:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOOriginalWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOOriginalWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOOriginalWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOOriginalWaypointRoute *)-[GEOOriginalWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
      }

      if (a3) {
        id v7 = @"routeLeg";
      }
      else {
        id v7 = @"route_leg";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v5;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v33 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v15 = [GEOOriginalRouteLeg alloc];
                if (a3) {
                  uint64_t v16 = [(GEOOriginalRouteLeg *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOOriginalRouteLeg *)v15 initWithDictionary:v14];
                }
                v17 = (void *)v16;
                [a1 addRouteLeg:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v11);
        }

        id v5 = v31;
      }

      uint64_t v18 = [v5 objectForKeyedSubscript:@"purpose"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        if ([v19 isEqualToString:@"PURPOSE_UNKNOWN"])
        {
          uint64_t v20 = 0;
        }
        else if ([v19 isEqualToString:@"REROUTING"])
        {
          uint64_t v20 = 1;
        }
        else if ([v19 isEqualToString:@"REROUTING_ONTO_ORIGINAL_ROUTE"])
        {
          uint64_t v20 = 13;
        }
        else if ([v19 isEqualToString:@"ROUTE_FROM_ZILCH_POINTS"])
        {
          uint64_t v20 = 2;
        }
        else if ([v19 isEqualToString:@"BIASED_DIRECTIONS_TO_POI"])
        {
          uint64_t v20 = 3;
        }
        else if ([v19 isEqualToString:@"BIASED_DIRECTIONS_FROM_POI"])
        {
          uint64_t v20 = 4;
        }
        else if ([v19 isEqualToString:@"CHANGE_WAYPOINTS"])
        {
          uint64_t v20 = 5;
        }
        else if ([v19 isEqualToString:@"CHANGE_ANCHORS"])
        {
          uint64_t v20 = 11;
        }
        else if ([v19 isEqualToString:@"RESUME_ROUTE"])
        {
          uint64_t v20 = 6;
        }
        else if ([v19 isEqualToString:@"CHANGE_TRANSPORT_MODE"])
        {
          uint64_t v20 = 7;
        }
        else if ([v19 isEqualToString:@"RESUME_NAV_AFTER_PAUSE"])
        {
          uint64_t v20 = 8;
        }
        else if ([v19 isEqualToString:@"OFFLINE_TO_ONLINE_NAV_TRANSITION"])
        {
          uint64_t v20 = 9;
        }
        else if ([v19 isEqualToString:@"OFFLINE_TO_ONLINE_NEW_ROUTE"])
        {
          uint64_t v20 = 10;
        }
        else if ([v19 isEqualToString:@"CONVERT_TO_NAVIGABLE_ROUTE"])
        {
          uint64_t v20 = 12;
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_56;
        }
        uint64_t v20 = [v18 intValue];
      }
      [a1 setPurpose:v20];
LABEL_56:

      v21 = [v5 objectForKeyedSubscript:@"source"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        if ([v22 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v23 = 0;
        }
        else if ([v22 isEqualToString:@"ONLINE_SERVICE"])
        {
          uint64_t v23 = 1;
        }
        else if ([v22 isEqualToString:@"OFFLINE_SERVICE"])
        {
          uint64_t v23 = 2;
        }
        else
        {
          uint64_t v23 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_68;
        }
        uint64_t v23 = [v21 intValue];
      }
      [a1 setSource:v23];
LABEL_68:

      if (a3) {
        v24 = @"lastValidUserOffsetCm";
      }
      else {
        v24 = @"last_valid_user_offset_cm";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLastValidUserOffsetCm:", objc_msgSend(v25, "unsignedIntValue"));
      }

      if (a3) {
        v26 = @"creationMethod";
      }
      else {
        v26 = @"creation_method";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v27;
        if ([v28 isEqualToString:@"ROUTE_CREATION_METHOD_DEFAULT"])
        {
          uint64_t v29 = 0;
        }
        else if ([v28 isEqualToString:@"ROUTE_CREATION_METHOD_USER_CREATED"])
        {
          uint64_t v29 = 1;
        }
        else if ([v28 isEqualToString:@"ROUTE_CREATION_METHOD_APPLE_CURATED"])
        {
          uint64_t v29 = 2;
        }
        else
        {
          uint64_t v29 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_88:

          goto LABEL_89;
        }
        uint64_t v29 = [v27 intValue];
      }
      [a1 setCreationMethod:v29];
      goto LABEL_88;
    }
  }
LABEL_89:

  return a1;
}

- (GEOOriginalWaypointRoute)initWithJSON:(id)a3
{
  return (GEOOriginalWaypointRoute *)-[GEOOriginalWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_routeLegs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_12:
      if ((flags & 4) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if (flags) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_routeLegs;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  BOOL v9 = a3;
  [(GEOOriginalWaypointRoute *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v9[7] = self->_identifier;
    *((unsigned char *)v9 + 44) |= 2u;
  }
  if ([(GEOOriginalWaypointRoute *)self routeLegsCount])
  {
    [v9 clearRouteLegs];
    unint64_t v4 = [(GEOOriginalWaypointRoute *)self routeLegsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOOriginalWaypointRoute *)self routeLegAtIndex:i];
        [v9 addRouteLeg:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v9[9] = self->_purpose;
    *((unsigned char *)v9 + 44) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_9;
  }
  v9[10] = self->_source;
  *((unsigned char *)v9 + 44) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_10:
    if ((flags & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  v9[8] = self->_lastValidUserOffsetCm;
  *((unsigned char *)v9 + 44) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_11:
    v9[6] = self->_creationMethod;
    *((unsigned char *)v9 + 44) |= 1u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_identifier;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_routeLegs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addRouteLeg:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_purpose;
    *(unsigned char *)(v6 + 44) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_12:
      if ((flags & 4) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      *(_DWORD *)(v6 + 32) = self->_lastValidUserOffsetCm;
      *(unsigned char *)(v6 + 44) |= 4u;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 40) = self->_source;
  *(unsigned char *)(v6 + 44) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if (flags)
  {
LABEL_14:
    *(_DWORD *)(v6 + 24) = self->_creationMethod;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
LABEL_15:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  [(GEOOriginalWaypointRoute *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_identifier != *((_DWORD *)v4 + 7)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](routeLegs, "isEqual:"))
    {
LABEL_29:
      BOOL v8 = 0;
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_purpose != *((_DWORD *)v4 + 9)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_source != *((_DWORD *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_lastValidUserOffsetCm != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_29;
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_creationMethod != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  [(GEOOriginalWaypointRoute *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_identifier;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_routeLegs hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_purpose;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_source;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_lastValidUserOffsetCm;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_creationMethod;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOOriginalWaypointRoute addRouteLeg:](self, "addRouteLeg:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 44);
  if ((v10 & 8) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_flags |= 8u;
    char v10 = *((unsigned char *)v4 + 44);
    if ((v10 & 0x10) == 0)
    {
LABEL_12:
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      self->_lastValidUserOffsetCm = *((_DWORD *)v4 + 8);
      *(unsigned char *)&self->_flags |= 4u;
      if ((*((unsigned char *)v4 + 44) & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_source = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v10 = *((unsigned char *)v4 + 44);
  if ((v10 & 4) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if (v10)
  {
LABEL_14:
    self->_creationMethod = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_15:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOOriginalWaypointRoute *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_routeLegs;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeLegs, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end