@interface GEORestrictionZoneInfo
+ (BOOL)isValid:(id)a3;
+ (Class)restrictedZoneIdsType;
- (BOOL)hasEnvironmentalCongestionZoneImpact;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLicensePlateRestrictionImpact;
- (BOOL)hasTollCongestionZoneImpact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORestrictionZoneInfo)initWithDictionary:(id)a3;
- (GEORestrictionZoneInfo)initWithJSON:(id)a3;
- (NSMutableArray)restrictedZoneIds;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)environmentalCongestionZoneImpactAsString:(int)a3;
- (id)jsonRepresentation;
- (id)licensePlateRestrictionImpactAsString:(int)a3;
- (id)restrictedZoneIdsAtIndex:(unint64_t)a3;
- (id)tollCongestionZoneImpactAsString:(int)a3;
- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3;
- (int)StringAsLicensePlateRestrictionImpact:(id)a3;
- (int)StringAsTollCongestionZoneImpact:(id)a3;
- (int)environmentalCongestionZoneImpact;
- (int)licensePlateRestrictionImpact;
- (int)tollCongestionZoneImpact;
- (unint64_t)hash;
- (unint64_t)restrictedZoneIdsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addRestrictedZoneIds:(id)a3;
- (void)clearRestrictedZoneIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnvironmentalCongestionZoneImpact:(int)a3;
- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3;
- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3;
- (void)setHasTollCongestionZoneImpact:(BOOL)a3;
- (void)setLicensePlateRestrictionImpact:(int)a3;
- (void)setRestrictedZoneIds:(id)a3;
- (void)setTollCongestionZoneImpact:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORestrictionZoneInfo

- (NSMutableArray)restrictedZoneIds
{
  return self->_restrictedZoneIds;
}

- (void)setRestrictedZoneIds:(id)a3
{
}

- (void)clearRestrictedZoneIds
{
}

- (void)addRestrictedZoneIds:(id)a3
{
  id v4 = a3;
  restrictedZoneIds = self->_restrictedZoneIds;
  id v8 = v4;
  if (!restrictedZoneIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_restrictedZoneIds;
    self->_restrictedZoneIds = v6;

    id v4 = v8;
    restrictedZoneIds = self->_restrictedZoneIds;
  }
  [(NSMutableArray *)restrictedZoneIds addObject:v4];
}

- (unint64_t)restrictedZoneIdsCount
{
  return [(NSMutableArray *)self->_restrictedZoneIds count];
}

- (id)restrictedZoneIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_restrictedZoneIds objectAtIndex:a3];
}

+ (Class)restrictedZoneIdsType
{
  return (Class)objc_opt_class();
}

- (int)licensePlateRestrictionImpact
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_licensePlateRestrictionImpact;
  }
  else {
    return 0;
  }
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)environmentalCongestionZoneImpact
{
  if (*(unsigned char *)&self->_flags) {
    return self->_environmentalCongestionZoneImpact;
  }
  else {
    return 0;
  }
}

- (void)setEnvironmentalCongestionZoneImpact:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_environmentalCongestionZoneImpact = a3;
}

- (void)setHasEnvironmentalCongestionZoneImpact:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEnvironmentalCongestionZoneImpact
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)environmentalCongestionZoneImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsEnvironmentalCongestionZoneImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)tollCongestionZoneImpact
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_tollCongestionZoneImpact;
  }
  else {
    return 0;
  }
}

- (void)setTollCongestionZoneImpact:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_tollCongestionZoneImpact = a3;
}

- (void)setHasTollCongestionZoneImpact:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTollCongestionZoneImpact
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)tollCongestionZoneImpactAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E0508[a3];
  }

  return v3;
}

- (int)StringAsTollCongestionZoneImpact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)GEORestrictionZoneInfo;
  int v4 = [(GEORestrictionZoneInfo *)&v8 description];
  v5 = [(GEORestrictionZoneInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORestrictionZoneInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_46;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 16) count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v6 = *(id *)(a1 + 16);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = [v11 dictionaryRepresentation];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"restrictedZoneIds";
    }
    else {
      v13 = @"restricted_zone_ids";
    }
    [v4 setObject:v5 forKey:v13];
  }
  char v14 = *(unsigned char *)(a1 + 36);
  if ((v14 & 2) != 0)
  {
    uint64_t v15 = *(int *)(a1 + 28);
    if (v15 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E53E0508[v15];
    }
    if (a2) {
      v17 = @"licensePlateRestrictionImpact";
    }
    else {
      v17 = @"license_plate_restriction_impact";
    }
    [v4 setObject:v16 forKey:v17];

    char v14 = *(unsigned char *)(a1 + 36);
    if ((v14 & 1) == 0)
    {
LABEL_19:
      if ((v14 & 4) == 0) {
        goto LABEL_42;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 1) == 0)
  {
    goto LABEL_19;
  }
  uint64_t v18 = *(int *)(a1 + 24);
  if (v18 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E53E0508[v18];
  }
  if (a2) {
    v20 = @"environmentalCongestionZoneImpact";
  }
  else {
    v20 = @"environmental_congestion_zone_impact";
  }
  [v4 setObject:v19 forKey:v20];

  if ((*(unsigned char *)(a1 + 36) & 4) != 0)
  {
LABEL_35:
    uint64_t v21 = *(int *)(a1 + 32);
    if (v21 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E53E0508[v21];
    }
    if (a2) {
      v23 = @"tollCongestionZoneImpact";
    }
    else {
      v23 = @"toll_congestion_zone_impact";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_42:
  v24 = *(void **)(a1 + 8);
  if (v24)
  {
    v25 = [v24 dictionaryRepresentation];
    v26 = v25;
    if (a2)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __52__GEORestrictionZoneInfo__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E53D8860;
      id v28 = v27;
      id v32 = v28;
      [v26 enumerateKeysAndObjectsUsingBlock:v31];
      id v29 = v28;

      v26 = v29;
    }
    [v4 setObject:v26 forKey:@"Unknown Fields"];
  }
LABEL_46:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORestrictionZoneInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORestrictionZoneInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEORestrictionZoneInfo)initWithDictionary:(id)a3
{
  return (GEORestrictionZoneInfo *)-[GEORestrictionZoneInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"restrictedZoneIds";
      }
      else {
        id v6 = @"restricted_zone_ids";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v5;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v14 = [GEORestrictedZoneId alloc];
                if (a3) {
                  uint64_t v15 = [(GEORestrictedZoneId *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORestrictedZoneId *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addRestrictedZoneIds:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v10);
        }

        id v5 = v30;
      }

      if (a3) {
        v17 = @"licensePlateRestrictionImpact";
      }
      else {
        v17 = @"license_plate_restriction_impact";
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
        {
          uint64_t v20 = 0;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
        {
          uint64_t v20 = 1;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
        {
          uint64_t v20 = 2;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
        {
          uint64_t v20 = 3;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
        {
          uint64_t v20 = 4;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
        {
          uint64_t v20 = 5;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
        {
          uint64_t v20 = 6;
        }
        else if ([v19 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
        {
          uint64_t v20 = 7;
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
          goto LABEL_45;
        }
        uint64_t v20 = [v18 intValue];
      }
      [a1 setLicensePlateRestrictionImpact:v20];
LABEL_45:

      if (a3) {
        uint64_t v21 = @"environmentalCongestionZoneImpact";
      }
      else {
        uint64_t v21 = @"environmental_congestion_zone_impact";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = v22;
        if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
        {
          uint64_t v24 = 0;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
        {
          uint64_t v24 = 1;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
        {
          uint64_t v24 = 2;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
        {
          uint64_t v24 = 3;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
        {
          uint64_t v24 = 4;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
        {
          uint64_t v24 = 5;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
        {
          uint64_t v24 = 6;
        }
        else if ([v23 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
        {
          uint64_t v24 = 7;
        }
        else
        {
          uint64_t v24 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_70;
        }
        uint64_t v24 = [v22 intValue];
      }
      [a1 setEnvironmentalCongestionZoneImpact:v24];
LABEL_70:

      if (a3) {
        v25 = @"tollCongestionZoneImpact";
      }
      else {
        v25 = @"toll_congestion_zone_impact";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v26;
        if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_UNKNOWN"])
        {
          uint64_t v28 = 0;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_NOT_AFFECTED"])
        {
          uint64_t v28 = 1;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION"])
        {
          uint64_t v28 = 2;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED"])
        {
          uint64_t v28 = 3;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_IN"])
        {
          uint64_t v28 = 4;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_DESTINATION_IN"])
        {
          uint64_t v28 = 5;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN"])
        {
          uint64_t v28 = 6;
        }
        else if ([v27 isEqualToString:@"RESTRICTION_ZONE_IMPACT_CUT_THROUGH"])
        {
          uint64_t v28 = 7;
        }
        else
        {
          uint64_t v28 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_95:

          goto LABEL_96;
        }
        uint64_t v28 = [v26 intValue];
      }
      [a1 setTollCongestionZoneImpact:v28];
      goto LABEL_95;
    }
  }
LABEL_96:

  return a1;
}

- (GEORestrictionZoneInfo)initWithJSON:(id)a3
{
  return (GEORestrictionZoneInfo *)-[GEORestrictionZoneInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORestrictionZoneInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORestrictionZoneInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_restrictedZoneIds;
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
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_14;
  }
LABEL_10:
  if ((flags & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
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
  id v4 = self->_restrictedZoneIds;
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
  id v9 = a3;
  [(GEORestrictionZoneInfo *)self readAll:0];
  if ([(GEORestrictionZoneInfo *)self restrictedZoneIdsCount])
  {
    [v9 clearRestrictedZoneIds];
    unint64_t v4 = [(GEORestrictionZoneInfo *)self restrictedZoneIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORestrictionZoneInfo *)self restrictedZoneIdsAtIndex:i];
        [v9 addRestrictedZoneIds:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 7) = self->_licensePlateRestrictionImpact;
    *((unsigned char *)v9 + 36) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v9 + 6) = self->_environmentalCongestionZoneImpact;
  *((unsigned char *)v9 + 36) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v9 + 8) = self->_tollCongestionZoneImpact;
    *((unsigned char *)v9 + 36) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_restrictedZoneIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addRestrictedZoneIds:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    *(_DWORD *)(v5 + 24) = self->_environmentalCongestionZoneImpact;
    *(unsigned char *)(v5 + 36) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 28) = self->_licensePlateRestrictionImpact;
  *(unsigned char *)(v5 + 36) |= 2u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_14;
  }
LABEL_10:
  if ((flags & 4) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 32) = self->_tollCongestionZoneImpact;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_12:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORestrictionZoneInfo *)self readAll:1];
  [v4 readAll:1];
  restrictedZoneIds = self->_restrictedZoneIds;
  if ((unint64_t)restrictedZoneIds | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](restrictedZoneIds, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_environmentalCongestionZoneImpact != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_tollCongestionZoneImpact != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEORestrictionZoneInfo *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_restrictedZoneIds hash];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_licensePlateRestrictionImpact;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_environmentalCongestionZoneImpact;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_tollCongestionZoneImpact;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
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
        -[GEORestrictionZoneInfo addRestrictedZoneIds:](self, "addRestrictedZoneIds:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 36);
  if ((v10 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    self->_environmentalCongestionZoneImpact = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_flags |= 2u;
  char v10 = *((unsigned char *)v4 + 36);
  if (v10) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v10 & 4) != 0)
  {
LABEL_11:
    self->_tollCongestionZoneImpact = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_12:
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
    [(GEORestrictionZoneInfo *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_restrictedZoneIds;
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
  objc_storeStrong((id *)&self->_restrictedZoneIds, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end