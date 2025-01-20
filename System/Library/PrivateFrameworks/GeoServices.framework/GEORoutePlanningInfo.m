@interface GEORoutePlanningInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAdvisoriesInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasInfrastructureDescription;
- (BOOL)hasLabelAction;
- (BOOL)hasLabelArtwork;
- (BOOL)hasLabelDetailText;
- (BOOL)hasRoutePlanningDescription;
- (BOOL)hasTrafficDescriptionArtwork;
- (BOOL)hasTrafficDescriptionText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOFormattedString)infrastructureDescription;
- (GEOFormattedString)labelDetailText;
- (GEOFormattedString)trafficDescriptionText;
- (GEOLabelAction)labelAction;
- (GEOPBTransitArtwork)labelArtwork;
- (GEOPBTransitArtwork)trafficDescriptionArtwork;
- (GEORouteInformation)routePlanningDescription;
- (GEORoutePlanningInfo)init;
- (GEORoutePlanningInfo)initWithData:(id)a3;
- (GEORoutePlanningInfo)initWithDictionary:(id)a3;
- (GEORoutePlanningInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdvisoriesInfo;
- (void)_readInfrastructureDescription;
- (void)_readLabelAction;
- (void)_readLabelArtwork;
- (void)_readLabelDetailText;
- (void)_readRoutePlanningDescription;
- (void)_readTrafficDescriptionArtwork;
- (void)_readTrafficDescriptionText;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setInfrastructureDescription:(id)a3;
- (void)setLabelAction:(id)a3;
- (void)setLabelArtwork:(id)a3;
- (void)setLabelDetailText:(id)a3;
- (void)setRoutePlanningDescription:(id)a3;
- (void)setTrafficDescriptionArtwork:(id)a3;
- (void)setTrafficDescriptionText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoutePlanningInfo

- (GEORoutePlanningInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORoutePlanningInfo;
  v2 = [(GEORoutePlanningInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORoutePlanningInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORoutePlanningInfo;
  v3 = [(GEORoutePlanningInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRoutePlanningDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutePlanningDescription_tags_6536);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRoutePlanningDescription
{
  return self->_routePlanningDescription != 0;
}

- (GEORouteInformation)routePlanningDescription
{
  -[GEORoutePlanningInfo _readRoutePlanningDescription]((uint64_t)self);
  routePlanningDescription = self->_routePlanningDescription;

  return routePlanningDescription;
}

- (void)setRoutePlanningDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_routePlanningDescription, a3);
}

- (void)_readLabelDetailText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelDetailText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelDetailText
{
  return self->_labelDetailText != 0;
}

- (GEOFormattedString)labelDetailText
{
  -[GEORoutePlanningInfo _readLabelDetailText]((uint64_t)self);
  labelDetailText = self->_labelDetailText;

  return labelDetailText;
}

- (void)setLabelDetailText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_labelDetailText, a3);
}

- (void)_readLabelArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelArtwork
{
  return self->_labelArtwork != 0;
}

- (GEOPBTransitArtwork)labelArtwork
{
  -[GEORoutePlanningInfo _readLabelArtwork]((uint64_t)self);
  labelArtwork = self->_labelArtwork;

  return labelArtwork;
}

- (void)setLabelArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_labelArtwork, a3);
}

- (void)_readLabelAction
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelAction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasLabelAction
{
  return self->_labelAction != 0;
}

- (GEOLabelAction)labelAction
{
  -[GEORoutePlanningInfo _readLabelAction]((uint64_t)self);
  labelAction = self->_labelAction;

  return labelAction;
}

- (void)setLabelAction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_labelAction, a3);
}

- (void)_readInfrastructureDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInfrastructureDescription_tags_6537);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasInfrastructureDescription
{
  return self->_infrastructureDescription != 0;
}

- (GEOFormattedString)infrastructureDescription
{
  -[GEORoutePlanningInfo _readInfrastructureDescription]((uint64_t)self);
  infrastructureDescription = self->_infrastructureDescription;

  return infrastructureDescription;
}

- (void)setInfrastructureDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  objc_storeStrong((id *)&self->_infrastructureDescription, a3);
}

- (void)_readAdvisoriesInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEORoutePlanningInfo _readAdvisoriesInfo]((uint64_t)self);
  advisoriesInfo = self->_advisoriesInfo;

  return advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readTrafficDescriptionText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficDescriptionText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTrafficDescriptionText
{
  return self->_trafficDescriptionText != 0;
}

- (GEOFormattedString)trafficDescriptionText
{
  -[GEORoutePlanningInfo _readTrafficDescriptionText]((uint64_t)self);
  trafficDescriptionText = self->_trafficDescriptionText;

  return trafficDescriptionText;
}

- (void)setTrafficDescriptionText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_trafficDescriptionText, a3);
}

- (void)_readTrafficDescriptionArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORoutePlanningInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTrafficDescriptionArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTrafficDescriptionArtwork
{
  return self->_trafficDescriptionArtwork != 0;
}

- (GEOPBTransitArtwork)trafficDescriptionArtwork
{
  -[GEORoutePlanningInfo _readTrafficDescriptionArtwork]((uint64_t)self);
  trafficDescriptionArtwork = self->_trafficDescriptionArtwork;

  return trafficDescriptionArtwork;
}

- (void)setTrafficDescriptionArtwork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoutePlanningInfo;
  v4 = [(GEORoutePlanningInfo *)&v8 description];
  v5 = [(GEORoutePlanningInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutePlanningInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 routePlanningDescription];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"routePlanningDescription";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"route_planning_description";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 labelDetailText];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"labelDetailText";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"label_detail_text";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 labelArtwork];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"labelArtwork";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"label_artwork";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [a1 labelAction];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"labelAction";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"label_action";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = [a1 infrastructureDescription];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"infrastructureDescription";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"infrastructure_description";
      }
      [v4 setObject:v23 forKey:v24];
    }
    v25 = [a1 advisoriesInfo];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        v27 = [v25 jsonRepresentation];
        v28 = @"advisoriesInfo";
      }
      else
      {
        v27 = [v25 dictionaryRepresentation];
        v28 = @"advisories_info";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = [a1 trafficDescriptionText];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        v31 = [v29 jsonRepresentation];
        v32 = @"trafficDescriptionText";
      }
      else
      {
        v31 = [v29 dictionaryRepresentation];
        v32 = @"traffic_description_text";
      }
      [v4 setObject:v31 forKey:v32];
    }
    v33 = [a1 trafficDescriptionArtwork];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 jsonRepresentation];
        v36 = @"trafficDescriptionArtwork";
      }
      else
      {
        v35 = [v33 dictionaryRepresentation];
        v36 = @"traffic_description_artwork";
      }
      [v4 setObject:v35 forKey:v36];
    }
    v37 = (void *)a1[2];
    if (v37)
    {
      v38 = [v37 dictionaryRepresentation];
      v39 = v38;
      if (a2)
      {
        v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __50__GEORoutePlanningInfo__dictionaryRepresentation___block_invoke;
        v44[3] = &unk_1E53D8860;
        id v41 = v40;
        id v45 = v41;
        [v39 enumerateKeysAndObjectsUsingBlock:v44];
        id v42 = v41;

        v39 = v42;
      }
      [v4 setObject:v39 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutePlanningInfo _dictionaryRepresentation:](self, 1);
}

void __50__GEORoutePlanningInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORoutePlanningInfo)initWithDictionary:(id)a3
{
  return (GEORoutePlanningInfo *)-[GEORoutePlanningInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"routePlanningDescription";
      }
      else {
        objc_super v6 = @"route_planning_description";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORouteInformation alloc];
        if (v8) {
          v9 = (void *)-[GEORouteInformation _initWithDictionary:isJSON:](v8, v7, a3);
        }
        else {
          v9 = 0;
        }
        [a1 setRoutePlanningDescription:v9];
      }
      if (a3) {
        id v10 = @"labelDetailText";
      }
      else {
        id v10 = @"label_detail_text";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOFormattedString *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setLabelDetailText:v13];
      }
      if (a3) {
        v15 = @"labelArtwork";
      }
      else {
        v15 = @"label_artwork";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v18 = [(GEOPBTransitArtwork *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOPBTransitArtwork *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setLabelArtwork:v18];
      }
      if (a3) {
        v20 = @"labelAction";
      }
      else {
        v20 = @"label_action";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOLabelAction alloc];
        if (a3) {
          uint64_t v23 = [(GEOLabelAction *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOLabelAction *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setLabelAction:v23];
      }
      if (a3) {
        v25 = @"infrastructureDescription";
      }
      else {
        v25 = @"infrastructure_description";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v28 = [(GEOFormattedString *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOFormattedString *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setInfrastructureDescription:v28];
      }
      if (a3) {
        v30 = @"advisoriesInfo";
      }
      else {
        v30 = @"advisories_info";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEOAdvisoriesInfo alloc];
        if (a3) {
          uint64_t v33 = [(GEOAdvisoriesInfo *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEOAdvisoriesInfo *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setAdvisoriesInfo:v33];
      }
      if (a3) {
        v35 = @"trafficDescriptionText";
      }
      else {
        v35 = @"traffic_description_text";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v38 = [(GEOFormattedString *)v37 initWithJSON:v36];
        }
        else {
          uint64_t v38 = [(GEOFormattedString *)v37 initWithDictionary:v36];
        }
        v39 = (void *)v38;
        [a1 setTrafficDescriptionText:v38];
      }
      if (a3) {
        v40 = @"trafficDescriptionArtwork";
      }
      else {
        v40 = @"traffic_description_artwork";
      }
      id v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v43 = [(GEOPBTransitArtwork *)v42 initWithJSON:v41];
        }
        else {
          uint64_t v43 = [(GEOPBTransitArtwork *)v42 initWithDictionary:v41];
        }
        v44 = (void *)v43;
        [a1 setTrafficDescriptionArtwork:v43];
      }
    }
  }

  return a1;
}

- (GEORoutePlanningInfo)initWithJSON:(id)a3
{
  return (GEORoutePlanningInfo *)-[GEORoutePlanningInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_6576;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_6577;
    }
    GEORoutePlanningInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORoutePlanningInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutePlanningInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutePlanningInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORoutePlanningInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORoutePlanningInfo *)self readAll:0];
    if (self->_routePlanningDescription) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_labelDetailText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_labelArtwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_labelAction)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_infrastructureDescription)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_advisoriesInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_trafficDescriptionText)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_trafficDescriptionArtwork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORoutePlanningInfo _readAdvisoriesInfo]((uint64_t)self);
  advisoriesInfo = self->_advisoriesInfo;

  return [(GEOAdvisoriesInfo *)advisoriesInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORoutePlanningInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routePlanningDescription) {
    objc_msgSend(v5, "setRoutePlanningDescription:");
  }
  if (self->_labelDetailText) {
    objc_msgSend(v5, "setLabelDetailText:");
  }
  v4 = v5;
  if (self->_labelArtwork)
  {
    objc_msgSend(v5, "setLabelArtwork:");
    v4 = v5;
  }
  if (self->_labelAction)
  {
    objc_msgSend(v5, "setLabelAction:");
    v4 = v5;
  }
  if (self->_infrastructureDescription)
  {
    objc_msgSend(v5, "setInfrastructureDescription:");
    v4 = v5;
  }
  if (self->_advisoriesInfo)
  {
    objc_msgSend(v5, "setAdvisoriesInfo:");
    v4 = v5;
  }
  if (self->_trafficDescriptionText)
  {
    objc_msgSend(v5, "setTrafficDescriptionText:");
    v4 = v5;
  }
  if (self->_trafficDescriptionArtwork)
  {
    objc_msgSend(v5, "setTrafficDescriptionArtwork:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORoutePlanningInfo *)self readAll:0];
    id v8 = [(GEORouteInformation *)self->_routePlanningDescription copyWithZone:a3];
    v9 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v8;

    id v10 = [(GEOFormattedString *)self->_labelDetailText copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    id v12 = [(GEOPBTransitArtwork *)self->_labelArtwork copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    id v14 = [(GEOLabelAction *)self->_labelAction copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    id v16 = [(GEOFormattedString *)self->_infrastructureDescription copyWithZone:a3];
    v17 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v16;

    id v18 = [(GEOAdvisoriesInfo *)self->_advisoriesInfo copyWithZone:a3];
    v19 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v18;

    id v20 = [(GEOFormattedString *)self->_trafficDescriptionText copyWithZone:a3];
    v21 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v20;

    id v22 = [(GEOPBTransitArtwork *)self->_trafficDescriptionArtwork copyWithZone:a3];
    uint64_t v23 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v22;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORoutePlanningInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORoutePlanningInfo *)self readAll:1];
  [v4 readAll:1];
  routePlanningDescription = self->_routePlanningDescription;
  if ((unint64_t)routePlanningDescription | v4[8])
  {
    if (!-[GEORouteInformation isEqual:](routePlanningDescription, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (((labelDetailText = self->_labelDetailText, !((unint64_t)labelDetailText | v4[7]))
     || -[GEOFormattedString isEqual:](labelDetailText, "isEqual:"))
    && ((labelArtwork = self->_labelArtwork, !((unint64_t)labelArtwork | v4[6]))
     || -[GEOPBTransitArtwork isEqual:](labelArtwork, "isEqual:"))
    && ((labelAction = self->_labelAction, !((unint64_t)labelAction | v4[5]))
     || -[GEOLabelAction isEqual:](labelAction, "isEqual:"))
    && ((infrastructureDescription = self->_infrastructureDescription,
         !((unint64_t)infrastructureDescription | v4[4]))
     || -[GEOFormattedString isEqual:](infrastructureDescription, "isEqual:"))
    && ((advisoriesInfo = self->_advisoriesInfo, !((unint64_t)advisoriesInfo | v4[3]))
     || -[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
    && ((trafficDescriptionText = self->_trafficDescriptionText, !((unint64_t)trafficDescriptionText | v4[10]))
     || -[GEOFormattedString isEqual:](trafficDescriptionText, "isEqual:")))
  {
    trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
    if ((unint64_t)trafficDescriptionArtwork | v4[9]) {
      char v13 = -[GEOPBTransitArtwork isEqual:](trafficDescriptionArtwork, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
LABEL_18:
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  [(GEORoutePlanningInfo *)self readAll:1];
  unint64_t v3 = [(GEORouteInformation *)self->_routePlanningDescription hash];
  unint64_t v4 = [(GEOFormattedString *)self->_labelDetailText hash] ^ v3;
  unint64_t v5 = [(GEOPBTransitArtwork *)self->_labelArtwork hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOLabelAction *)self->_labelAction hash];
  unint64_t v7 = [(GEOFormattedString *)self->_infrastructureDescription hash];
  unint64_t v8 = v7 ^ [(GEOAdvisoriesInfo *)self->_advisoriesInfo hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOFormattedString *)self->_trafficDescriptionText hash];
  return v9 ^ [(GEOPBTransitArtwork *)self->_trafficDescriptionArtwork hash];
}

- (void)mergeFrom:(id)a3
{
  id v20 = a3;
  [v20 readAll:0];
  routePlanningDescription = self->_routePlanningDescription;
  unint64_t v5 = (void *)v20[8];
  if (routePlanningDescription)
  {
    if (v5) {
      -[GEORouteInformation mergeFrom:](routePlanningDescription, v5);
    }
  }
  else if (v5)
  {
    [(GEORoutePlanningInfo *)self setRoutePlanningDescription:v20[8]];
  }
  labelDetailText = self->_labelDetailText;
  uint64_t v7 = v20[7];
  if (labelDetailText)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](labelDetailText, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORoutePlanningInfo setLabelDetailText:](self, "setLabelDetailText:");
  }
  labelArtwork = self->_labelArtwork;
  uint64_t v9 = v20[6];
  if (labelArtwork)
  {
    if (v9) {
      -[GEOPBTransitArtwork mergeFrom:](labelArtwork, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORoutePlanningInfo setLabelArtwork:](self, "setLabelArtwork:");
  }
  labelAction = self->_labelAction;
  uint64_t v11 = v20[5];
  if (labelAction)
  {
    if (v11) {
      -[GEOLabelAction mergeFrom:](labelAction, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORoutePlanningInfo setLabelAction:](self, "setLabelAction:");
  }
  infrastructureDescription = self->_infrastructureDescription;
  uint64_t v13 = v20[4];
  if (infrastructureDescription)
  {
    if (v13) {
      -[GEOFormattedString mergeFrom:](infrastructureDescription, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORoutePlanningInfo setInfrastructureDescription:](self, "setInfrastructureDescription:");
  }
  advisoriesInfo = self->_advisoriesInfo;
  uint64_t v15 = v20[3];
  if (advisoriesInfo)
  {
    if (v15) {
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORoutePlanningInfo setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  trafficDescriptionText = self->_trafficDescriptionText;
  uint64_t v17 = v20[10];
  if (trafficDescriptionText)
  {
    if (v17) {
      -[GEOFormattedString mergeFrom:](trafficDescriptionText, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORoutePlanningInfo setTrafficDescriptionText:](self, "setTrafficDescriptionText:");
  }
  trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
  uint64_t v19 = v20[9];
  if (trafficDescriptionArtwork)
  {
    if (v19) {
      -[GEOPBTransitArtwork mergeFrom:](trafficDescriptionArtwork, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEORoutePlanningInfo setTrafficDescriptionArtwork:](self, "setTrafficDescriptionArtwork:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORoutePlanningInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6581);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x201u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORoutePlanningInfo *)self readAll:0];
    -[GEORouteInformation clearUnknownFields:]((uint64_t)self->_routePlanningDescription);
    [(GEOFormattedString *)self->_labelDetailText clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_labelArtwork clearUnknownFields:1];
    [(GEOLabelAction *)self->_labelAction clearUnknownFields:1];
    [(GEOFormattedString *)self->_infrastructureDescription clearUnknownFields:1];
    [(GEOAdvisoriesInfo *)self->_advisoriesInfo clearUnknownFields:1];
    [(GEOFormattedString *)self->_trafficDescriptionText clearUnknownFields:1];
    trafficDescriptionArtwork = self->_trafficDescriptionArtwork;
    [(GEOPBTransitArtwork *)trafficDescriptionArtwork clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptionText, 0);
  objc_storeStrong((id *)&self->_trafficDescriptionArtwork, 0);
  objc_storeStrong((id *)&self->_routePlanningDescription, 0);
  objc_storeStrong((id *)&self->_labelDetailText, 0);
  objc_storeStrong((id *)&self->_labelArtwork, 0);
  objc_storeStrong((id *)&self->_labelAction, 0);
  objc_storeStrong((id *)&self->_infrastructureDescription, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end