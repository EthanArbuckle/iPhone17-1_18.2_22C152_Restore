@interface GEOPDModuleConfigurationValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDModuleConfigurationValue)init;
- (GEOPDModuleConfigurationValue)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)businessInfosModuleConfiguration;
- (id)buttonModuleConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)headerButtonsConfiguration;
- (id)jsonRepresentation;
- (id)placeInfosModuleConfiguration;
- (id)ribbonModuleConfiguration;
- (id)templatePlaceModuleConfiguration;
- (id)unifiedActionModuleConfiguration;
- (id)webModuleConfiguration;
- (unint64_t)hash;
- (void)_readBusinessInfosModuleConfiguration;
- (void)_readButtonModuleConfiguration;
- (void)_readHeaderButtonsConfiguration;
- (void)_readPlaceInfosModuleConfiguration;
- (void)_readRibbonModuleConfiguration;
- (void)_readTemplatePlaceModuleConfiguration;
- (void)_readUnifiedActionModuleConfiguration;
- (void)_readWebModuleConfiguration;
- (void)readAll:(uint64_t)a1;
- (void)setWebModuleConfiguration:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDModuleConfigurationValue

- (GEOPDModuleConfigurationValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDModuleConfigurationValue;
  v2 = [(GEOPDModuleConfigurationValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDModuleConfigurationValue)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDModuleConfigurationValue;
  v3 = [(GEOPDModuleConfigurationValue *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRibbonModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRibbonModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)ribbonModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readRibbonModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readButtonModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)buttonModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readButtonModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readWebModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)webModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readWebModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setWebModuleConfiguration:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x400u;
    *(_WORD *)(a1 + 116) |= 0x800u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)_readTemplatePlaceModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTemplatePlaceModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)templatePlaceModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readTemplatePlaceModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPlaceInfosModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceInfosModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)placeInfosModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readPlaceInfosModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBusinessInfosModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBusinessInfosModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)businessInfosModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readBusinessInfosModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readHeaderButtonsConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHeaderButtonsConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)headerButtonsConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readHeaderButtonsConfiguration]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readUnifiedActionModuleConfiguration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnifiedActionModuleConfiguration_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)unifiedActionModuleConfiguration
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDModuleConfigurationValue _readUnifiedActionModuleConfiguration]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDModuleConfigurationValue;
  id v4 = [(GEOPDModuleConfigurationValue *)&v8 description];
  v5 = [(GEOPDModuleConfigurationValue *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDModuleConfigurationValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDModuleConfigurationValue readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDModuleConfigurationValue ribbonModuleConfiguration]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"ribbonModuleConfiguration";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"ribbon_module_configuration";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDModuleConfigurationValue buttonModuleConfiguration]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"buttonModuleConfiguration";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"button_module_configuration";
      }
      [v4 setObject:v11 forKey:v12];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRelatedPlaceModuleConfiguration_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v15 = *(id *)(a1 + 64);
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"relatedPlaceModuleConfiguration";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"related_place_module_configuration";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = -[GEOPDModuleConfigurationValue webModuleConfiguration]((id *)a1);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"webModuleConfiguration";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"web_module_configuration";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = -[GEOPDModuleConfigurationValue templatePlaceModuleConfiguration]((id *)a1);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"templatePlaceModuleConfiguration";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"template_place_module_configuration";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDModuleConfigurationValue placeInfosModuleConfiguration]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"placeInfosModuleConfiguration";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"place_infos_module_configuration";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = -[GEOPDModuleConfigurationValue businessInfosModuleConfiguration]((id *)a1);
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        v33 = [v31 jsonRepresentation];
        v34 = @"businessInfosModuleConfiguration";
      }
      else
      {
        v33 = [v31 dictionaryRepresentation];
        v34 = @"business_infos_module_configuration";
      }
      [v4 setObject:v33 forKey:v34];
    }
    v35 = -[GEOPDModuleConfigurationValue headerButtonsConfiguration]((id *)a1);
    v36 = v35;
    if (v35)
    {
      if (a2)
      {
        v37 = [v35 jsonRepresentation];
        v38 = @"headerButtonsConfiguration";
      }
      else
      {
        v37 = [v35 dictionaryRepresentation];
        v38 = @"header_buttons_configuration";
      }
      [v4 setObject:v37 forKey:v38];
    }
    v39 = -[GEOPDModuleConfigurationValue unifiedActionModuleConfiguration]((id *)a1);
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 jsonRepresentation];
        v42 = @"unifiedActionModuleConfiguration";
      }
      else
      {
        v41 = [v39 dictionaryRepresentation];
        v42 = @"unified_action_module_configuration";
      }
      [v4 setObject:v41 forKey:v42];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v43 = *(void **)(a1 + 8);
      if (v43)
      {
        id v44 = v43;
        objc_sync_enter(v44);
        GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHikingAssociationModuleConfiguration_tags);
        objc_sync_exit(v44);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    id v45 = *(id *)(a1 + 48);
    v46 = v45;
    if (v45)
    {
      if (a2)
      {
        v47 = [v45 jsonRepresentation];
        v48 = @"hikingAssociationModuleConfiguration";
      }
      else
      {
        v47 = [v45 dictionaryRepresentation];
        v48 = @"hiking_association_module_configuration";
      }
      [v4 setObject:v47 forKey:v48];
    }
    v49 = *(void **)(a1 + 16);
    if (v49)
    {
      v50 = [v49 dictionaryRepresentation];
      v51 = v50;
      if (a2)
      {
        v52 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __59__GEOPDModuleConfigurationValue__dictionaryRepresentation___block_invoke;
        v56[3] = &unk_1E53D8860;
        id v53 = v52;
        id v57 = v53;
        [v51 enumerateKeysAndObjectsUsingBlock:v56];
        id v54 = v53;

        v51 = v54;
      }
      [v4 setObject:v51 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDModuleConfigurationValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6629;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6630;
      }
      GEOPDModuleConfigurationValueReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDPlaceInfosModuleConfiguration readAll:](*(void *)(a1 + 56), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __59__GEOPDModuleConfigurationValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v255 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_super v6 = (id *)[a1 init];
  if (!v6) {
    goto LABEL_350;
  }
  if (a3) {
    objc_super v7 = @"ribbonModuleConfiguration";
  }
  else {
    objc_super v7 = @"ribbon_module_configuration";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
  int v241 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOPDPlaceRibbonConfiguration alloc];
    if (v10)
    {
      v11 = v10;
      id v12 = v8;
      v221 = [(GEOPDPlaceRibbonConfiguration *)v11 init];
      if (v221)
      {
        if (a3) {
          v13 = @"ribbonItem";
        }
        else {
          v13 = @"ribbon_item";
        }
        id v14 = [v12 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v211 = v12;
          v212 = v8;
          v215 = v6;
          long long v244 = 0u;
          long long v245 = 0u;
          long long v242 = 0u;
          long long v243 = 0u;
          v210 = v14;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v242 objects:&v250 count:16];
          uint64_t v17 = (uint64_t)v221;
          if (!v16) {
            goto LABEL_88;
          }
          uint64_t v18 = v16;
          v19 = @"factoid_ribbon_item";
          uint64_t v20 = *(void *)v243;
          if (a3) {
            v19 = @"factoidRibbonItem";
          }
          v232 = v19;
          v21 = @"factoid_item_index";
          if (a3) {
            v21 = @"factoidItemIndex";
          }
          v226 = v21;
          id v228 = v15;
          if (a3) {
            v22 = @"amenityRibbonItem";
          }
          else {
            v22 = @"amenity_ribbon_item";
          }
          v230 = v22;
          v23 = @"amenity_item_index";
          if (a3) {
            v23 = @"amenityItemIndex";
          }
          v225 = v23;
          uint64_t v234 = *(void *)v243;
          while (1)
          {
            uint64_t v24 = 0;
            uint64_t v236 = v18;
            do
            {
              if (*(void *)v243 != v20) {
                objc_enumerationMutation(v15);
              }
              v25 = *(void **)(*((void *)&v242 + 1) + 8 * v24);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v26 = [GEOPDRibbonItem alloc];
                if (v26)
                {
                  v27 = v26;
                  id v28 = v25;
                  uint64_t v29 = [(GEOPDRibbonItem *)v27 init];
                  if (v29)
                  {
                    v30 = [v28 objectForKeyedSubscript:@"type"];
                    objc_opt_class();
                    id v238 = v28;
                    if (objc_opt_isKindOfClass())
                    {
                      id v31 = v30;
                      if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_UNKNOWN"])
                      {
                        int v32 = 0;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_HOURS"])
                      {
                        int v32 = 1;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_RATINGS"])
                      {
                        int v32 = 2;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_AMENITIES"])
                      {
                        int v32 = 3;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_PRICE"])
                      {
                        int v32 = 4;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_CURATED_GUIDES"])
                      {
                        int v32 = 5;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_FACTOID"])
                      {
                        int v32 = 6;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_CALL_TO_ACTION"])
                      {
                        int v32 = 7;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_DISTANCE_FROM_CURRENT_LOCATION"])
                      {
                        int v32 = 8;
                      }
                      else if ([v31 isEqualToString:@"RIBBON_ITEM_TYPE_PLUGS_AVAILABILITY"])
                      {
                        int v32 = 9;
                      }
                      else
                      {
                        int v32 = 0;
                      }

                      uint64_t v20 = v234;
LABEL_54:
                      *(unsigned char *)(v29 + 56) |= 0x10u;
                      *(unsigned char *)(v29 + 56) |= 1u;
                      *(_DWORD *)(v29 + 52) = v32;
                      id v28 = v238;
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        int v32 = [v30 intValue];
                        goto LABEL_54;
                      }
                    }

                    v33 = [v28 objectForKeyedSubscript:v232];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v34 = [GEOPDFactoidRibbonItem alloc];
                      if (v34)
                      {
                        id v35 = v33;
                        v34 = [(GEOPDFactoidRibbonItem *)v34 init];
                        if (v34)
                        {
                          v36 = [v35 objectForKeyedSubscript:v226];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            unsigned int v37 = [v36 unsignedIntValue];
                            *(unsigned char *)&v34->_flags |= 1u;
                            v34->_factoidItemIndex = v37;
                          }

                          id v15 = v228;
                        }
                      }
                      v38 = v34;
                      *(unsigned char *)(v29 + 56) |= 8u;
                      *(unsigned char *)(v29 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v29 + 32), v34);

                      uint64_t v20 = v234;
                      id v28 = v238;
                    }

                    v39 = [v28 objectForKeyedSubscript:v230];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v40 = [GEOPDAmenityRibbonItem alloc];
                      if (v40)
                      {
                        v41 = v40;
                        id v42 = v39;
                        v43 = v41;
                        id v44 = v42;
                        id v45 = [(GEOPDAmenityRibbonItem *)v43 init];
                        if (v45)
                        {
                          v46 = [v44 objectForKeyedSubscript:v225];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v223 = v44;
                            v224 = v39;
                            long long v248 = 0u;
                            long long v249 = 0u;
                            long long v246 = 0u;
                            long long v247 = 0u;
                            v222 = v46;
                            id v47 = v46;
                            uint64_t v48 = [v47 countByEnumeratingWithState:&v246 objects:v254 count:16];
                            if (v48)
                            {
                              uint64_t v49 = v48;
                              uint64_t v50 = *(void *)v247;
                              do
                              {
                                for (uint64_t i = 0; i != v49; ++i)
                                {
                                  if (*(void *)v247 != v50) {
                                    objc_enumerationMutation(v47);
                                  }
                                  v52 = *(void **)(*((void *)&v246 + 1) + 8 * i);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [v52 unsignedIntValue];
                                    PBRepeatedUInt32Add();
                                  }
                                }
                                uint64_t v49 = [v47 countByEnumeratingWithState:&v246 objects:v254 count:16];
                              }
                              while (v49);
                            }

                            uint64_t v17 = (uint64_t)v221;
                            v46 = v222;
                            id v15 = v228;
                            id v44 = v223;
                            v39 = v224;
                          }
                        }
                      }
                      else
                      {
                        id v45 = 0;
                      }
                      id v53 = v45;
                      *(unsigned char *)(v29 + 56) |= 4u;
                      *(unsigned char *)(v29 + 56) |= 0x10u;
                      objc_storeStrong((id *)(v29 + 24), v45);

                      uint64_t v20 = v234;
                      id v28 = v238;
                    }
                  }
                }
                else
                {
                  uint64_t v29 = 0;
                }
                uint64_t v18 = v236;
                -[GEOPDPlaceRibbonConfiguration addRibbonItem:](v17, (void *)v29);
              }
              ++v24;
            }
            while (v24 != v18);
            uint64_t v54 = [v15 countByEnumeratingWithState:&v242 objects:&v250 count:16];
            uint64_t v18 = v54;
            if (!v54)
            {
LABEL_88:

              objc_super v6 = v215;
              v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
              id v12 = v211;
              objc_super v8 = v212;
              id v14 = v210;
              break;
            }
          }
        }
      }
    }
    else
    {
      v221 = 0;
    }
    v55 = v221;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x80u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 9, v221);
  }
  if (a3) {
    v56 = @"buttonModuleConfiguration";
  }
  else {
    v56 = @"button_module_configuration";
  }
  id v57 = objc_msgSend(v5, "objectForKeyedSubscript:", v56, v210, v211, v212);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58 = [GEOPDButtonModuleConfiguration alloc];
    if (v58)
    {
      id v59 = v57;
      v58 = [(GEOPDButtonModuleConfiguration *)v58 init];
      if (v58)
      {
        if (a3) {
          v60 = @"buttonItem";
        }
        else {
          v60 = @"button_item";
        }
        v61 = [v59 objectForKeyedSubscript:v60];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v216 = v6;
          long long v252 = 0u;
          long long v253 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          id v62 = v61;
          uint64_t v63 = [v62 countByEnumeratingWithState:&v250 objects:v254 count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            uint64_t v65 = *(void *)v251;
            do
            {
              for (uint64_t j = 0; j != v64; ++j)
              {
                if (*(void *)v251 != v65) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v67 = *(void *)(*((void *)&v250 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v68 = [GEOPDButtonItem alloc];
                  if (v241) {
                    v69 = [(GEOPDButtonItem *)v68 initWithJSON:v67];
                  }
                  else {
                    v69 = [(GEOPDButtonItem *)v68 initWithDictionary:v67];
                  }
                  v70 = v69;
                  -[GEOPDButtonModuleConfiguration addButtonItem:]((uint64_t)v58, v69);
                }
              }
              uint64_t v64 = [v62 countByEnumeratingWithState:&v250 objects:v254 count:16];
            }
            while (v64);
          }

          objc_super v6 = v216;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
          a3 = v241;
        }
      }
    }
    v71 = v58;
    *(_WORD *)((char *)v6 + v9[123]) |= 4u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 4, v58);
  }
  if (a3) {
    v72 = @"relatedPlaceModuleConfiguration";
  }
  else {
    v72 = @"related_place_module_configuration";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v74 = [GEOPDRelatedPlaceModuleConfiguration alloc];
    if (v74)
    {
      id v75 = v73;
      v74 = [(GEOPDRelatedPlaceModuleConfiguration *)v74 init];
      if (v74)
      {
        if (a3) {
          v76 = @"relatedPlaceComponentId";
        }
        else {
          v76 = @"related_place_component_id";
        }
        v77 = [v75 objectForKeyedSubscript:v76];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v78 = [v77 intValue];
          *(unsigned char *)&v74->_flags |= 2u;
          v74->_relatedPlaceComponentId = v78;
        }

        int v79 = a3;
        if (a3) {
          v80 = @"sectionTitle";
        }
        else {
          v80 = @"section_title";
        }
        v81 = [v75 objectForKeyedSubscript:v80];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v213 = v5;
          v217 = v6;
          long long v252 = 0u;
          long long v253 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          id v82 = v81;
          uint64_t v83 = [v82 countByEnumeratingWithState:&v250 objects:v254 count:16];
          if (v83)
          {
            uint64_t v84 = v83;
            uint64_t v85 = *(void *)v251;
            do
            {
              for (uint64_t k = 0; k != v84; ++k)
              {
                if (*(void *)v251 != v85) {
                  objc_enumerationMutation(v82);
                }
                uint64_t v87 = *(void *)(*((void *)&v250 + 1) + 8 * k);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v88 = [GEOLocalizedString alloc];
                  if (v241) {
                    v89 = [(GEOLocalizedString *)v88 initWithJSON:v87];
                  }
                  else {
                    v89 = [(GEOLocalizedString *)v88 initWithDictionary:v87];
                  }
                  v90 = v89;
                  -[GEOPDRelatedPlaceModuleConfiguration addSectionTitle:]((uint64_t)v74, v89);
                }
              }
              uint64_t v84 = [v82 countByEnumeratingWithState:&v250 objects:v254 count:16];
            }
            while (v84);
          }

          id v5 = v213;
          objc_super v6 = v217;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
          int v79 = v241;
        }

        int v91 = v79;
        if (v79) {
          v92 = @"numberOfRows";
        }
        else {
          v92 = @"number_of_rows";
        }
        v93 = [v75 objectForKeyedSubscript:v92];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v94 = [v93 intValue];
          *(unsigned char *)&v74->_flags |= 1u;
          v74->_numberOfRows = v94;
        }

        a3 = v91;
      }
    }
    v95 = v74;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x40u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 8, v74);
  }
  if (a3) {
    v96 = @"webModuleConfiguration";
  }
  else {
    v96 = @"web_module_configuration";
  }
  v97 = [v5 objectForKeyedSubscript:v96];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v98 = [GEOPDWebModuleConfiguration alloc];
    if (!v98)
    {
LABEL_174:
      -[GEOPDModuleConfigurationValue setWebModuleConfiguration:]((uint64_t)v6, v98);

      goto LABEL_175;
    }
    id v99 = v97;
    v98 = [(GEOPDWebModuleConfiguration *)v98 init];
    if (!v98)
    {
LABEL_173:

      goto LABEL_174;
    }
    v100 = [v99 objectForKeyedSubscript:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v101 = (void *)[v100 copy];
      -[GEOPDWebModuleConfiguration setUrl:]((uint64_t)v98, v101);
    }
    if (a3) {
      v102 = @"shouldRenderBackgroundPlatter";
    }
    else {
      v102 = @"should_render_background_platter";
    }
    v103 = [v99 objectForKeyedSubscript:v102];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v104 = [v103 BOOLValue];
      *(unsigned char *)&v98->_flags |= 2u;
      v98->_shouldRenderBackgroundPlatter = v104;
    }

    v105 = [v99 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v105 isEqualToString:@"WEB_MODULE_TYPE_GENERIC"];
      int v106 = 0;
      a3 = v241;
    }
    else
    {
      objc_opt_class();
      a3 = v241;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_172:

        goto LABEL_173;
      }
      int v106 = [v105 intValue];
    }
    *(unsigned char *)&v98->_flags |= 1u;
    v98->_type = v106;
    goto LABEL_172;
  }
LABEL_175:

  if (a3) {
    v107 = @"templatePlaceModuleConfiguration";
  }
  else {
    v107 = @"template_place_module_configuration";
  }
  v108 = [v5 objectForKeyedSubscript:v107];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v109 = [GEOPDTemplatePlaceModuleConfiguration alloc];
    if (v109) {
      v110 = (void *)-[GEOPDTemplatePlaceModuleConfiguration _initWithDictionary:isJSON:](v109, v108, a3);
    }
    else {
      v110 = 0;
    }
    id v111 = v110;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x100u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 10, v110);
  }
  if (a3) {
    v112 = @"placeInfosModuleConfiguration";
  }
  else {
    v112 = @"place_infos_module_configuration";
  }
  v113 = [v5 objectForKeyedSubscript:v112];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_270;
  }
  v114 = [GEOPDPlaceInfosModuleConfiguration alloc];
  if (!v114)
  {
    uint64_t v235 = 0;
    goto LABEL_269;
  }
  v115 = v114;
  id v116 = v113;
  uint64_t v235 = [(GEOPDPlaceInfosModuleConfiguration *)v115 init];
  if (v235)
  {
    if (a3) {
      v117 = @"locationInfoItem";
    }
    else {
      v117 = @"location_info_item";
    }
    v233 = v116;
    v118 = [v116 objectForKeyedSubscript:v117];
    objc_opt_class();
    v229 = v113;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_211:

      if (a3) {
        v126 = @"factoidInfoItem";
      }
      else {
        v126 = @"factoid_info_item";
      }
      v127 = v233;
      v128 = [v233 objectForKeyedSubscript:v126];
      objc_opt_class();
      v231 = v128;
      if (objc_opt_isKindOfClass())
      {
        v129 = [GEOPDFactoidInfoItem alloc];
        if (v129)
        {
          v130 = v129;
          id v131 = v128;
          v132 = v130;
          v133 = v131;
          v134 = [(GEOPDFactoidInfoItem *)v132 init];
          if (v134)
          {
            int v135 = a3;
            if (a3) {
              v136 = @"factoidReference";
            }
            else {
              v136 = @"factoid_reference";
            }
            v137 = [v133 objectForKeyedSubscript:v136];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v227 = v133;
              id v214 = v5;
              v218 = v6;
              long long v252 = 0u;
              long long v253 = 0u;
              long long v250 = 0u;
              long long v251 = 0u;
              id v138 = v137;
              uint64_t v139 = [v138 countByEnumeratingWithState:&v250 objects:v254 count:16];
              if (!v139) {
                goto LABEL_252;
              }
              uint64_t v140 = v139;
              v141 = @"factoid_item_index";
              uint64_t v142 = *(void *)v251;
              if (v241) {
                v141 = @"factoidItemIndex";
              }
              v237 = v137;
              v239 = v141;
              while (1)
              {
                uint64_t v143 = 0;
                do
                {
                  if (*(void *)v251 != v142) {
                    objc_enumerationMutation(v138);
                  }
                  v144 = *(void **)(*((void *)&v250 + 1) + 8 * v143);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v145 = [GEOPDFactoidReference alloc];
                    if (v145)
                    {
                      v146 = v145;
                      id v147 = v144;
                      uint64_t v148 = [(GEOPDFactoidReference *)v146 init];
                      if (v148)
                      {
                        v149 = [v147 objectForKeyedSubscript:v239];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          int v150 = [v149 unsignedIntValue];
                          *(unsigned char *)(v148 + 24) |= 1u;
                          *(_DWORD *)(v148 + 16) = v150;
                        }

                        v151 = [v147 objectForKeyedSubscript:@"style"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v152 = v151;
                          if ([v152 isEqualToString:@"FACTOID_STYLE_DEFAULT"])
                          {
                            int v153 = 0;
                          }
                          else if ([v152 isEqualToString:@"FACTOID_STYLE_DIRECTIONS"])
                          {
                            int v153 = 1;
                          }
                          else if ([v152 isEqualToString:@"FACTOID_STYLE_LINK"])
                          {
                            int v153 = 2;
                          }
                          else
                          {
                            int v153 = 0;
                          }

LABEL_244:
                          *(unsigned char *)(v148 + 24) |= 2u;
                          *(_DWORD *)(v148 + 20) = v153;
                          v137 = v237;
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v153 = [v151 intValue];
                            goto LABEL_244;
                          }
                        }
                      }
                    }
                    else
                    {
                      uint64_t v148 = 0;
                    }
                    -[GEOPDFactoidInfoItem addFactoidReference:]((uint64_t)v134, (void *)v148);
                  }
                  ++v143;
                }
                while (v140 != v143);
                uint64_t v154 = [v138 countByEnumeratingWithState:&v250 objects:v254 count:16];
                uint64_t v140 = v154;
                if (!v154)
                {
LABEL_252:

                  id v5 = v214;
                  objc_super v6 = v218;
                  v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
                  int v135 = v241;
                  v133 = v227;
                  break;
                }
              }
            }

            a3 = v135;
          }
        }
        else
        {
          v134 = 0;
        }
        v155 = v134;
        *(unsigned char *)(v235 + 56) |= 4u;
        *(unsigned char *)(v235 + 56) |= 0x10u;
        objc_storeStrong((id *)(v235 + 24), v134);

        v113 = v229;
        v127 = v233;
      }

      if (a3) {
        v156 = @"attributionType";
      }
      else {
        v156 = @"attribution_type";
      }
      v157 = [v127 objectForKeyedSubscript:v156];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v158 = v113;
        id v159 = v157;
        if ([v159 isEqualToString:@"ATTRIBUTION_TYPE_VENDOR"]) {
          int v160 = 0;
        }
        else {
          int v160 = [v159 isEqualToString:@"ATTRIBUTION_TYPE_INDIGENOUS_ACKNOWLEDGEMENT"];
        }

        v113 = v158;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_267:

          id v116 = v233;
          goto LABEL_268;
        }
        int v160 = [v157 intValue];
      }
      *(unsigned char *)(v235 + 56) |= 0x10u;
      *(unsigned char *)(v235 + 56) |= 1u;
      *(_DWORD *)(v235 + 52) = v160;
      goto LABEL_267;
    }
    v119 = [GEOPDLocationInfoItem alloc];
    if (!v119)
    {
LABEL_210:
      v125 = v119;
      *(unsigned char *)(v235 + 56) |= 8u;
      *(unsigned char *)(v235 + 56) |= 0x10u;
      objc_storeStrong((id *)(v235 + 32), v119);

      v113 = v229;
      goto LABEL_211;
    }
    id v120 = v118;
    v119 = [(GEOPDLocationInfoItem *)v119 init];
    if (!v119)
    {
LABEL_209:

      goto LABEL_210;
    }
    int v121 = a3;
    v122 = [v120 objectForKeyedSubscript:@"style"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v123 = v122;
      if ([v123 isEqualToString:@"UNKNOWN"])
      {
        int v124 = 0;
      }
      else if ([v123 isEqualToString:@"LOCATION"])
      {
        int v124 = 1;
      }
      else if ([v123 isEqualToString:@"ADDRESS"])
      {
        int v124 = 2;
      }
      else if ([v123 isEqualToString:@"NONE"])
      {
        int v124 = 3;
      }
      else
      {
        int v124 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_208:

        a3 = v121;
        goto LABEL_209;
      }
      int v124 = [v122 intValue];
    }
    *(unsigned char *)&v119->_flags |= 1u;
    v119->_style = v124;
    goto LABEL_208;
  }
LABEL_268:

LABEL_269:
  id v161 = (id)v235;
  *(_WORD *)((char *)v6 + v9[123]) |= 0x20u;
  *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
  objc_storeStrong(v6 + 7, (id)v235);

LABEL_270:
  if (a3) {
    v162 = @"businessInfosModuleConfiguration";
  }
  else {
    v162 = @"business_infos_module_configuration";
  }
  v163 = [v5 objectForKeyedSubscript:v162];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v164 = [GEOPDBusinessInfosModuleConfiguration alloc];
    if (v164)
    {
      id v165 = v163;
      v164 = [(GEOPDBusinessInfosModuleConfiguration *)v164 init];
      if (v164)
      {
        if (a3) {
          v166 = @"factoidItemIndex";
        }
        else {
          v166 = @"factoid_item_index";
        }
        v167 = [v165 objectForKeyedSubscript:v166];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v219 = v6;
          long long v252 = 0u;
          long long v253 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          v240 = v167;
          id v168 = v167;
          uint64_t v169 = [v168 countByEnumeratingWithState:&v250 objects:v254 count:16];
          if (v169)
          {
            uint64_t v170 = v169;
            uint64_t v171 = *(void *)v251;
            do
            {
              for (uint64_t m = 0; m != v170; ++m)
              {
                if (*(void *)v251 != v171) {
                  objc_enumerationMutation(v168);
                }
                v173 = *(void **)(*((void *)&v250 + 1) + 8 * m);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v173 unsignedIntValue];
                  PBRepeatedUInt32Add();
                }
              }
              uint64_t v170 = [v168 countByEnumeratingWithState:&v250 objects:v254 count:16];
            }
            while (v170);
          }

          objc_super v6 = v219;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
          a3 = v241;
          v167 = v240;
        }
      }
    }
    v174 = v164;
    *(_WORD *)((char *)v6 + v9[123]) |= 2u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 3, v164);
  }
  if (a3) {
    v175 = @"headerButtonsConfiguration";
  }
  else {
    v175 = @"header_buttons_configuration";
  }
  v176 = [v5 objectForKeyedSubscript:v175];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v177 = [GEOPDHeaderButtonsConfiguration alloc];
    if (v177)
    {
      id v178 = v176;
      v177 = [(GEOPDHeaderButtonsConfiguration *)v177 init];
      if (v177)
      {
        if (a3) {
          v179 = @"shouldSuppressDirectionsAction";
        }
        else {
          v179 = @"should_suppress_directions_action";
        }
        v180 = [v178 objectForKeyedSubscript:v179];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v181 = [v180 BOOLValue];
          *(unsigned char *)&v177->_flags |= 1u;
          v177->_shouldSuppressDirectionsActiouint64_t n = v181;
        }
      }
    }
    v182 = v177;
    *(_WORD *)((char *)v6 + v9[123]) |= 8u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 5, v177);
  }
  if (a3) {
    v183 = @"unifiedActionModuleConfiguration";
  }
  else {
    v183 = @"unified_action_module_configuration";
  }
  v184 = [v5 objectForKeyedSubscript:v183];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v185 = [GEOPDUnifiedActionModuleConfiguration alloc];
    if (v185)
    {
      id v186 = v184;
      v185 = [(GEOPDUnifiedActionModuleConfiguration *)v185 init];
      if (v185)
      {
        if (a3) {
          v187 = @"buttonItem";
        }
        else {
          v187 = @"button_item";
        }
        v188 = [v186 objectForKeyedSubscript:v187];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v220 = v6;
          long long v252 = 0u;
          long long v253 = 0u;
          long long v250 = 0u;
          long long v251 = 0u;
          id v189 = v188;
          uint64_t v190 = [v189 countByEnumeratingWithState:&v250 objects:v254 count:16];
          if (v190)
          {
            uint64_t v191 = v190;
            uint64_t v192 = *(void *)v251;
            do
            {
              for (uint64_t n = 0; n != v191; ++n)
              {
                if (*(void *)v251 != v192) {
                  objc_enumerationMutation(v189);
                }
                uint64_t v194 = *(void *)(*((void *)&v250 + 1) + 8 * n);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v195 = [GEOPDButtonItem alloc];
                  if (v241) {
                    v196 = [(GEOPDButtonItem *)v195 initWithJSON:v194];
                  }
                  else {
                    v196 = [(GEOPDButtonItem *)v195 initWithDictionary:v194];
                  }
                  v197 = v196;
                  -[GEOPDUnifiedActionModuleConfiguration addButtonItem:]((uint64_t)v185, v196);
                }
              }
              uint64_t v191 = [v189 countByEnumeratingWithState:&v250 objects:v254 count:16];
            }
            while (v191);
          }

          objc_super v6 = v220;
          v9 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__flags;
          a3 = v241;
        }
      }
    }
    v198 = v185;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x200u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 11, v185);
  }
  if (a3) {
    v199 = @"hikingAssociationModuleConfiguration";
  }
  else {
    v199 = @"hiking_association_module_configuration";
  }
  v200 = [v5 objectForKeyedSubscript:v199];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v201 = [GEOPDHikingAssociationModuleConfiguration alloc];
    if (v201)
    {
      id v202 = v200;
      v201 = [(GEOPDHikingAssociationModuleConfiguration *)v201 init];
      if (v201)
      {
        if (a3) {
          v203 = @"templatePlaceConfiguration";
        }
        else {
          v203 = @"template_place_configuration";
        }
        v204 = [v202 objectForKeyedSubscript:v203];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v205 = [GEOPDTemplatePlaceModuleConfiguration alloc];
          if (v205) {
            v206 = (void *)-[GEOPDTemplatePlaceModuleConfiguration _initWithDictionary:isJSON:](v205, v204, a3);
          }
          else {
            v206 = 0;
          }
          id v207 = v206;
          objc_storeStrong((id *)&v201->_templatePlaceConfiguration, v206);
        }
      }
    }
    v208 = v201;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x10u;
    *(_WORD *)((char *)v6 + v9[123]) |= 0x800u;
    objc_storeStrong(v6 + 6, v201);
  }
LABEL_350:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDModuleConfigurationValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xDC4) != 0) {
    goto LABEL_8;
  }
  if ((flags & 0x20) != 0)
  {
    placeInfosModuleConfiguratiouint64_t n = self->_placeInfosModuleConfiguration;
    if (placeInfosModuleConfiguration)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&placeInfosModuleConfiguration->_readerLock);
      int v7 = *(unsigned char *)&placeInfosModuleConfiguration->_flags & 0x1C;
      os_unfair_lock_unlock(&placeInfosModuleConfiguration->_readerLock);
      if (v7) {
        goto LABEL_8;
      }
      __int16 flags = (__int16)self->_flags;
    }
  }
  if ((flags & 0x21A) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v11 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_29;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 0);
  if (self->_ribbonModuleConfiguration) {
    PBDataWriterWriteSubmessage();
  }
  id v8 = v11;
  if (self->_buttonModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_relatedPlaceModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_webModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_templatePlaceModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_placeInfosModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_businessInfosModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_headerButtonsConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_unifiedActionModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  if (self->_hikingAssociationModuleConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v8 = v11;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v8];
LABEL_29:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  int v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDPlaceRibbonConfiguration *)self->_ribbonModuleConfiguration copyWithZone:a3];
    v9 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v8;

    id v10 = [(GEOPDButtonModuleConfiguration *)self->_buttonModuleConfiguration copyWithZone:a3];
    id v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    id v12 = [(GEOPDRelatedPlaceModuleConfiguration *)self->_relatedPlaceModuleConfiguration copyWithZone:a3];
    v13 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v12;

    id v14 = [(GEOPDWebModuleConfiguration *)self->_webModuleConfiguration copyWithZone:a3];
    id v15 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v14;

    id v16 = [(GEOPDTemplatePlaceModuleConfiguration *)self->_templatePlaceModuleConfiguration copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v16;

    id v18 = [(GEOPDPlaceInfosModuleConfiguration *)self->_placeInfosModuleConfiguration copyWithZone:a3];
    v19 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v18;

    id v20 = [(GEOPDBusinessInfosModuleConfiguration *)self->_businessInfosModuleConfiguration copyWithZone:a3];
    v21 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v20;

    id v22 = [(GEOPDHeaderButtonsConfiguration *)self->_headerButtonsConfiguration copyWithZone:a3];
    v23 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v22;

    id v24 = [(GEOPDUnifiedActionModuleConfiguration *)self->_unifiedActionModuleConfiguration copyWithZone:a3];
    v25 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v24;

    id v26 = [(GEOPDHikingAssociationModuleConfiguration *)self->_hikingAssociationModuleConfiguration copyWithZone:a3];
    v27 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v26;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDModuleConfigurationValueReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 1);
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)v4, 1);
  ribbonModuleConfiguratiouint64_t n = self->_ribbonModuleConfiguration;
  if ((unint64_t)ribbonModuleConfiguration | v4[9])
  {
    if (!-[GEOPDPlaceRibbonConfiguration isEqual:](ribbonModuleConfiguration, "isEqual:")) {
      goto LABEL_22;
    }
  }
  buttonModuleConfiguratiouint64_t n = self->_buttonModuleConfiguration;
  if ((unint64_t)buttonModuleConfiguration | v4[4]
    && !-[GEOPDButtonModuleConfiguration isEqual:](buttonModuleConfiguration, "isEqual:"))
  {
    goto LABEL_22;
  }
  if (((relatedPlaceModuleConfiguratiouint64_t n = self->_relatedPlaceModuleConfiguration,
         !((unint64_t)relatedPlaceModuleConfiguration | v4[8]))
     || -[GEOPDRelatedPlaceModuleConfiguration isEqual:](relatedPlaceModuleConfiguration, "isEqual:"))
    && ((webModuleConfiguratiouint64_t n = self->_webModuleConfiguration, !((unint64_t)webModuleConfiguration | v4[12]))
     || -[GEOPDWebModuleConfiguration isEqual:](webModuleConfiguration, "isEqual:"))
    && ((templatePlaceModuleConfiguratiouint64_t n = self->_templatePlaceModuleConfiguration,
         !((unint64_t)templatePlaceModuleConfiguration | v4[10]))
     || -[GEOPDTemplatePlaceModuleConfiguration isEqual:](templatePlaceModuleConfiguration, "isEqual:"))
    && ((placeInfosModuleConfiguratiouint64_t n = self->_placeInfosModuleConfiguration,
         !((unint64_t)placeInfosModuleConfiguration | v4[7]))
     || -[GEOPDPlaceInfosModuleConfiguration isEqual:](placeInfosModuleConfiguration, "isEqual:"))
    && ((businessInfosModuleConfiguratiouint64_t n = self->_businessInfosModuleConfiguration,
         !((unint64_t)businessInfosModuleConfiguration | v4[3]))
     || -[GEOPDBusinessInfosModuleConfiguration isEqual:](businessInfosModuleConfiguration, "isEqual:"))
    && ((headerButtonsConfiguratiouint64_t n = self->_headerButtonsConfiguration,
         !((unint64_t)headerButtonsConfiguration | v4[5]))
     || -[GEOPDHeaderButtonsConfiguration isEqual:](headerButtonsConfiguration, "isEqual:"))
    && ((unifiedActionModuleConfiguratiouint64_t n = self->_unifiedActionModuleConfiguration,
         !((unint64_t)unifiedActionModuleConfiguration | v4[11]))
     || -[GEOPDUnifiedActionModuleConfiguration isEqual:](unifiedActionModuleConfiguration, "isEqual:")))
  {
    hikingAssociationModuleConfiguratiouint64_t n = self->_hikingAssociationModuleConfiguration;
    if ((unint64_t)hikingAssociationModuleConfiguration | v4[6]) {
      char v15 = -[GEOPDHikingAssociationModuleConfiguration isEqual:](hikingAssociationModuleConfiguration, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  -[GEOPDModuleConfigurationValue readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDPlaceRibbonConfiguration *)self->_ribbonModuleConfiguration hash];
  unint64_t v4 = [(GEOPDButtonModuleConfiguration *)self->_buttonModuleConfiguration hash] ^ v3;
  unint64_t v5 = v4 ^ [(GEOPDRelatedPlaceModuleConfiguration *)self->_relatedPlaceModuleConfiguration hash];
  unint64_t v6 = [(GEOPDWebModuleConfiguration *)self->_webModuleConfiguration hash];
  unint64_t v7 = v6 ^ [(GEOPDTemplatePlaceModuleConfiguration *)self->_templatePlaceModuleConfiguration hash];
  unint64_t v8 = v5 ^ v7 ^ [(GEOPDPlaceInfosModuleConfiguration *)self->_placeInfosModuleConfiguration hash];
  unint64_t v9 = [(GEOPDBusinessInfosModuleConfiguration *)self->_businessInfosModuleConfiguration hash];
  unint64_t v10 = v9 ^ [(GEOPDHeaderButtonsConfiguration *)self->_headerButtonsConfiguration hash];
  unint64_t v11 = v10 ^ [(GEOPDUnifiedActionModuleConfiguration *)self->_unifiedActionModuleConfiguration hash];
  return v8 ^ v11 ^ [(GEOPDHikingAssociationModuleConfiguration *)self->_hikingAssociationModuleConfiguration hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_unifiedActionModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_templatePlaceModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_ribbonModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedPlaceModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_placeInfosModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_hikingAssociationModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_headerButtonsConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_businessInfosModuleConfiguration, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end