@interface GEOPDETAFilter
+ (id)_etaFilterWithTransportTypes:(int *)a3 transportTypesCount:(unint64_t)a4 automobileOptions:(id)a5 transitOptions:(id)a6 walkingOptions:(id)a7 cyclingOptions:(id)a8;
+ (id)etaFilterForRouteAttributes:(id)a3;
+ (id)etaFilterForTraits:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDETAFilter)init;
- (GEOPDETAFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)automobileOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)setTransportTypes:(uint64_t)a3 count:;
- (unint64_t)hash;
- (void)_readAutomobileOptions;
- (void)_readTransportTypes;
- (void)addTransportType:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAutomobileOptions:(uint64_t)a1;
- (void)setClientCapabilities:(uint64_t)a1;
- (void)setCyclingOptions:(uint64_t)a1;
- (void)setTransitOptions:(uint64_t)a1;
- (void)setWalkingOptions:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDETAFilter

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_4179;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_4180;
      }
      GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDETAFilterCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

+ (id)etaFilterForTraits:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 hasNavigationTransportType])
    {
      int v18 = [v5 navigationTransportType];
      v6 = [v5 automobileOptions];
      v7 = [v5 transitOptions];
      v8 = [v5 walkingOptions];
      v9 = [v5 cyclingOptions];
      v10 = [a1 _etaFilterWithTransportTypes:&v18 transportTypesCount:1 automobileOptions:v6 transitOptions:v7 walkingOptions:v8 cyclingOptions:v9];
    }
    else
    {
      uint64_t v11 = [v5 transportTypes];
      uint64_t v12 = [v5 transportTypesCount];
      v13 = [v5 automobileOptions];
      v14 = [v5 transitOptions];
      v15 = [v5 walkingOptions];
      v16 = [v5 cyclingOptions];
      v10 = [a1 _etaFilterWithTransportTypes:v11 transportTypesCount:v12 automobileOptions:v13 transitOptions:v14 walkingOptions:v15 cyclingOptions:v16];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)etaFilterForRouteAttributes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [v4 additionalTransportTypesCount];
  uint64_t v7 = v6 + [v5 hasMainTransportType];
  v8 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: transportTypes != ((void *)0)", v19, 2u);
    }
    goto LABEL_12;
  }
  v9 = v8;
  if ([v5 hasMainTransportType])
  {
    _DWORD *v9 = [v5 mainTransportType];
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v5 additionalTransportTypesCount])
  {
    unint64_t v11 = 0;
    uint64_t v12 = &v9[v10];
    do
    {
      v12[v11] = *(_DWORD *)([v5 additionalTransportTypes] + 4 * v11);
      ++v11;
    }
    while (v11 < [v5 additionalTransportTypesCount]);
  }
  v13 = [v5 automobileOptions];
  v14 = [v5 transitOptions];
  v15 = [v5 walkingOptions];
  v16 = [v5 cyclingOptions];
  v17 = [a1 _etaFilterWithTransportTypes:v9 transportTypesCount:v7 automobileOptions:v13 transitOptions:v14 walkingOptions:v15 cyclingOptions:v16];

  free(v9);
LABEL_13:

  return v17;
}

+ (id)_etaFilterWithTransportTypes:(int *)a3 transportTypesCount:(unint64_t)a4 automobileOptions:(id)a5 transitOptions:(id)a6 walkingOptions:(id)a7 cyclingOptions:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = objc_alloc_init((Class)a1);
  v19 = v18;
  if (a4) {
    -[GEOPDETAFilter setTransportTypes:count:]((uint64_t)v18, (uint64_t)a3, a4);
  }
  if (v14) {
    -[GEOPDETAFilter setAutomobileOptions:]((uint64_t)v19, v14);
  }
  if (v15) {
    -[GEOPDETAFilter setTransitOptions:]((uint64_t)v19, v15);
  }
  if (v17)
  {
    -[GEOPDETAFilter setWalkingOptions:]((uint64_t)v19, v16);
    -[GEOPDETAFilter setCyclingOptions:]((uint64_t)v19, v17);
  }

  return v19;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = (uint64_t)v3;
  if (!a1) {
    goto LABEL_44;
  }
  uint64_t v22 = (uint64_t)v3;
  -[GEOPDETAFilter readAll:]((uint64_t)v3, 0);
  uint64_t v4 = v22;
  if (v22)
  {
    -[GEOPDETAFilter _readTransportTypes](v22);
    uint64_t v4 = v22;
    uint64_t v5 = *(void *)(v22 + 32);
    if (v5)
    {
      unint64_t v6 = 0;
      uint64_t v7 = *MEMORY[0x1E4F1C4A8];
      do
      {
        -[GEOPDETAFilter _readTransportTypes](v4);
        unint64_t v8 = *(void *)(v22 + 32);
        if (v8 <= v6)
        {
          v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v6, v8);
          unint64_t v11 = [v9 exceptionWithName:v7 reason:v10 userInfo:0];
          [v11 raise];
        }
        -[GEOPDETAFilter addTransportType:](a1);
        uint64_t v4 = v22;
        ++v6;
      }
      while (v5 != v6);
    }
  }
  if ((*(_WORD *)(v4 + 104) & 2) != 0)
  {
    *(unsigned char *)(a1 + 101) = *(unsigned char *)(v4 + 101);
    *(_WORD *)(a1 + 104) |= 2u;
  }
  uint64_t v12 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(v4 + 48);
  if (v12)
  {
    if (!v13) {
      goto LABEL_16;
    }
    objc_msgSend(v12, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_16;
    }
    -[GEOPDETAFilter setAutomobileOptions:](a1, *(void **)(v4 + 48));
  }
  uint64_t v4 = v22;
LABEL_16:
  id v14 = *(void **)(a1 + 64);
  uint64_t v15 = *(void *)(v4 + 64);
  if (v14)
  {
    if (!v15) {
      goto LABEL_22;
    }
    objc_msgSend(v14, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_22;
    }
    -[GEOPDETAFilter setCyclingOptions:](a1, *(void **)(v4 + 64));
  }
  uint64_t v4 = v22;
LABEL_22:
  id v16 = *(void **)(a1 + 72);
  uint64_t v17 = *(void *)(v4 + 72);
  if (v16)
  {
    if (!v17) {
      goto LABEL_28;
    }
    objc_msgSend(v16, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_28;
    }
    -[GEOPDETAFilter setTransitOptions:](a1, *(void **)(v4 + 72));
  }
  uint64_t v4 = v22;
LABEL_28:
  id v18 = *(void **)(a1 + 80);
  uint64_t v19 = *(void *)(v4 + 80);
  if (v18)
  {
    if (!v19) {
      goto LABEL_34;
    }
    objc_msgSend(v18, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_34;
    }
    -[GEOPDETAFilter setWalkingOptions:](a1, *(void **)(v4 + 80));
  }
  uint64_t v4 = v22;
LABEL_34:
  if ((*(_WORD *)(v4 + 104) & 4) != 0)
  {
    *(unsigned char *)(a1 + 102) = *(unsigned char *)(v4 + 102);
    *(_WORD *)(a1 + 104) |= 4u;
  }
  v20 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(v4 + 56);
  if (v20)
  {
    if (!v21) {
      goto LABEL_42;
    }
    objc_msgSend(v20, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_42;
    }
    -[GEOPDETAFilter setClientCapabilities:](a1, *(void **)(v4 + 56));
  }
  uint64_t v4 = v22;
LABEL_42:
  if (*(_WORD *)(v4 + 104))
  {
    *(unsigned char *)(a1 + 100) = *(unsigned char *)(v4 + 100);
    *(_WORD *)(a1 + 104) |= 1u;
  }
LABEL_44:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 8u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDETAFilter readAll:](a1, 0);
      [*(id *)(a1 + 48) clearUnknownFields:1];
      [*(id *)(a1 + 64) clearUnknownFields:1];
      [*(id *)(a1 + 72) clearUnknownFields:1];
      [*(id *)(a1 + 80) clearUnknownFields:1];
      uint64_t v5 = *(void **)(a1 + 56);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDETAFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDETAFilter;
  v2 = [(GEOPDETAFilter *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDETAFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDETAFilter;
  id v3 = [(GEOPDETAFilter *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDETAFilter;
  [(GEOPDETAFilter *)&v3 dealloc];
}

- (void)_readTransportTypes
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransportTypes_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addTransportType:(uint64_t)a1
{
  *(_WORD *)(a1 + 104) |= 0x10u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  *(_WORD *)(a1 + 104) |= 0x400u;
}

- (uint64_t)setTransportTypes:(uint64_t)a3 count:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v5 + 104) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 96));
    *(_WORD *)(v5 + 104) |= 0x400u;
    return MEMORY[0x1F4147390](v5 + 24, a2, a3);
  }
  return result;
}

- (void)_readAutomobileOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutomobileOptions_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)automobileOptions
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDETAFilter _readAutomobileOptions]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAutomobileOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x20u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setCyclingOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x80u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setTransitOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x100u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setWalkingOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x200u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)setClientCapabilities:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x40u;
  *(_WORD *)(a1 + 104) |= 0x400u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDETAFilter;
  id v4 = [(GEOPDETAFilter *)&v8 description];
  uint64_t v5 = [(GEOPDETAFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDETAFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDETAFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      objc_super v6 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 7)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E3898[v8];
          }
          [v5 addObject:v9];

          ++v7;
          objc_super v6 = (void *)(a1 + 24);
        }
        while (v7 < *(void *)(a1 + 32));
      }
      if (a2) {
        uint64_t v10 = @"transportType";
      }
      else {
        uint64_t v10 = @"transport_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if ((*(_WORD *)(a1 + 104) & 2) != 0)
    {
      unint64_t v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 101)];
      if (a2) {
        uint64_t v12 = @"includeHistoricTravelTime";
      }
      else {
        uint64_t v12 = @"include_historic_travel_time";
      }
      [v4 setObject:v11 forKey:v12];
    }
    uint64_t v13 = -[GEOPDETAFilter automobileOptions]((id *)a1);
    id v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      uint64_t v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"automobileOptions"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      id v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingOptions_tags_1);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v18 = *(id *)(a1 + 64);
    uint64_t v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"cyclingOptions"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      uint64_t v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitOptions_tags_1);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v23 = *(id *)(a1 + 72);
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"transitOptions"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingOptions_tags_1);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v28 = *(id *)(a1 + 80);
    v29 = v28;
    if (v28)
    {
      if (a2) {
        [v28 jsonRepresentation];
      }
      else {
      v30 = [v28 dictionaryRepresentation];
      }
      [v4 setObject:v30 forKey:@"walkingOptions"];
    }
    if ((*(_WORD *)(a1 + 104) & 4) != 0)
    {
      v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 102)];
      if (a2) {
        v32 = @"includeRouteTrafficDetail";
      }
      else {
        v32 = @"include_route_traffic_detail";
      }
      [v4 setObject:v31 forKey:v32];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v33 = *(void **)(a1 + 8);
      if (v33)
      {
        id v34 = v33;
        objc_sync_enter(v34);
        GEOPDETAFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientCapabilities_tags_0);
        objc_sync_exit(v34);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v35 = *(id *)(a1 + 56);
    v36 = v35;
    if (v35)
    {
      if (a2) {
        [v35 jsonRepresentation];
      }
      else {
      v37 = [v35 dictionaryRepresentation];
      }
      [v4 setObject:v37 forKey:@"clientCapabilities"];
    }
    if (*(_WORD *)(a1 + 104))
    {
      v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
      if (a2) {
        v39 = @"includeEtaRouteIncidents";
      }
      else {
        v39 = @"include_eta_route_incidents";
      }
      [v4 setObject:v38 forKey:v39];
    }
    v40 = *(void **)(a1 + 16);
    if (v40)
    {
      v41 = [v40 dictionaryRepresentation];
      v42 = v41;
      if (a2)
      {
        v43 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __44__GEOPDETAFilter__dictionaryRepresentation___block_invoke;
        v47[3] = &unk_1E53D8860;
        id v44 = v43;
        id v48 = v44;
        [v42 enumerateKeysAndObjectsUsingBlock:v47];
        id v45 = v44;

        v42 = v45;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
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
  return -[GEOPDETAFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDETAFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [a1 init];
    if (v6)
    {
      if (a3) {
        unint64_t v7 = @"transportType";
      }
      else {
        unint64_t v7 = @"transport_type";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v47 = v5;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v46 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (!v10) {
          goto LABEL_27;
        }
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v49;
        while (1)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v49 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              if (([v15 isEqualToString:@"AUTOMOBILE"] & 1) == 0
                && ([v15 isEqualToString:@"TRANSIT"] & 1) == 0
                && ([v15 isEqualToString:@"WALKING"] & 1) == 0
                && ([v15 isEqualToString:@"BICYCLE"] & 1) == 0
                && ([v15 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"] & 1) == 0
                && ([v15 isEqualToString:@"FERRY"] & 1) == 0)
              {
                [v15 isEqualToString:@"RIDESHARE"];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v14 intValue];
            }
            -[GEOPDETAFilter addTransportType:](v6);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (!v11)
          {
LABEL_27:

            id v5 = v47;
            uint64_t v8 = v46;
            break;
          }
        }
      }

      if (a3) {
        id v16 = @"includeHistoricTravelTime";
      }
      else {
        id v16 = @"include_historic_travel_time";
      }
      id v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v18 = [v17 BOOLValue];
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 2u;
        *(unsigned char *)(v6 + 101) = v18;
      }

      uint64_t v19 = [v5 objectForKeyedSubscript:@"automobileOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOAutomobileOptions alloc];
        if (a3) {
          uint64_t v21 = [(GEOAutomobileOptions *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOAutomobileOptions *)v20 initWithDictionary:v19];
        }
        id v22 = v21;
        -[GEOPDETAFilter setAutomobileOptions:](v6, v21);
      }
      id v23 = [v5 objectForKeyedSubscript:@"cyclingOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = [GEOCyclingOptions alloc];
        if (a3) {
          v25 = [(GEOCyclingOptions *)v24 initWithJSON:v23];
        }
        else {
          v25 = [(GEOCyclingOptions *)v24 initWithDictionary:v23];
        }
        v26 = v25;
        -[GEOPDETAFilter setCyclingOptions:](v6, v25);
      }
      id v27 = [v5 objectForKeyedSubscript:@"transitOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = [GEOTransitOptions alloc];
        if (a3) {
          v29 = [(GEOTransitOptions *)v28 initWithJSON:v27];
        }
        else {
          v29 = [(GEOTransitOptions *)v28 initWithDictionary:v27];
        }
        v30 = v29;
        -[GEOPDETAFilter setTransitOptions:](v6, v29);
      }
      v31 = [v5 objectForKeyedSubscript:@"walkingOptions"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEOWalkingOptions alloc];
        if (a3) {
          v33 = [(GEOWalkingOptions *)v32 initWithJSON:v31];
        }
        else {
          v33 = [(GEOWalkingOptions *)v32 initWithDictionary:v31];
        }
        id v34 = v33;
        -[GEOPDETAFilter setWalkingOptions:](v6, v33);
      }
      if (a3) {
        id v35 = @"includeRouteTrafficDetail";
      }
      else {
        id v35 = @"include_route_traffic_detail";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v37 = [v36 BOOLValue];
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 4u;
        *(unsigned char *)(v6 + 102) = v37;
      }

      v38 = [v5 objectForKeyedSubscript:@"clientCapabilities"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = [GEOClientCapabilities alloc];
        if (a3) {
          v40 = [(GEOClientCapabilities *)v39 initWithJSON:v38];
        }
        else {
          v40 = [(GEOClientCapabilities *)v39 initWithDictionary:v38];
        }
        v41 = v40;
        -[GEOPDETAFilter setClientCapabilities:](v6, v40);
      }
      if (a3) {
        v42 = @"includeEtaRouteIncidents";
      }
      else {
        v42 = @"include_eta_route_incidents";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v44 = [v43 BOOLValue];
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 1u;
        *(unsigned char *)(v6 + 100) = v44;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDETAFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDETAFilterIsDirty((uint64_t)self))
  {
    unint64_t v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDETAFilter readAll:]((uint64_t)self, 0);
    id v5 = v9;
    if (self->_transportTypes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_transportTypes.count);
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_automobileOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_cyclingOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_transitOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_walkingOptions)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_clientCapabilities)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDETAFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETAFilter readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 101) = self->_includeHistoricTravelTime;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  id v9 = [(GEOAutomobileOptions *)self->_automobileOptions copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOCyclingOptions *)self->_cyclingOptions copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  id v13 = [(GEOTransitOptions *)self->_transitOptions copyWithZone:a3];
  id v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  id v15 = [(GEOWalkingOptions *)self->_walkingOptions copyWithZone:a3];
  id v16 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v15;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 102) = self->_includeRouteTrafficDetail;
    *(_WORD *)(v5 + 104) |= 4u;
  }
  id v17 = [(GEOClientCapabilities *)self->_clientCapabilities copyWithZone:a3];
  char v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  if (*(_WORD *)&self->_flags)
  {
    *(unsigned char *)(v5 + 100) = self->_includeEtaRouteIncidents;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  uint64_t v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  -[GEOPDETAFilter readAll:]((uint64_t)self, 1);
  -[GEOPDETAFilter readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_32;
  }
  __int16 v5 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_32;
    }
    if (self->_includeHistoricTravelTime)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_32;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_32;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((void *)v4 + 6)
    && !-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
  {
    goto LABEL_32;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((void *)v4 + 8))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((void *)v4 + 9))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((void *)v4 + 10))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v11 = *((_WORD *)v4 + 52);
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0) {
      goto LABEL_32;
    }
    if (self->_includeRouteTrafficDetail)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_32;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_32;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((void *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:")) {
      goto LABEL_32;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v11 = *((_WORD *)v4 + 52);
  }
  BOOL v13 = (v11 & 1) == 0;
  if (flags)
  {
    if (v11)
    {
      if (self->_includeEtaRouteIncidents)
      {
        if (!*((unsigned char *)v4 + 100)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 100))
      {
        goto LABEL_32;
      }
      BOOL v13 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v13 = 0;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDETAFilter readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_includeHistoricTravelTime;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOAutomobileOptions *)self->_automobileOptions hash];
  unint64_t v6 = [(GEOCyclingOptions *)self->_cyclingOptions hash];
  unint64_t v7 = [(GEOTransitOptions *)self->_transitOptions hash];
  unint64_t v8 = [(GEOWalkingOptions *)self->_walkingOptions hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_includeRouteTrafficDetail;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(GEOClientCapabilities *)self->_clientCapabilities hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v11 = 2654435761 * self->_includeEtaRouteIncidents;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end