@interface GEORouteAttributes
+ (BOOL)isValid:(id)a3;
+ (id)defaultRouteAttributes;
- (BOOL)directZilchByLaneFlowlines;
- (BOOL)enableExperimentalMode;
- (BOOL)hasAutomobileOptions;
- (BOOL)hasBasicPointsToBeIncluded;
- (BOOL)hasCyclingOptions;
- (BOOL)hasDestinationInfo;
- (BOOL)hasDestinationType;
- (BOOL)hasDirectZilchByLaneFlowlines;
- (BOOL)hasEnableExperimentalMode;
- (BOOL)hasIncludeCellularCoverage;
- (BOOL)hasIncludeContingencyRoutes;
- (BOOL)hasIncludeCrossLanguagePhonetics;
- (BOOL)hasIncludeHistoricTravelTime;
- (BOOL)hasIncludeLaneGuidance;
- (BOOL)hasIncludeLaneWidths;
- (BOOL)hasIncludeManeuverIcons;
- (BOOL)hasIncludePhonetics;
- (BOOL)hasIncludeRoutingPathLeg;
- (BOOL)hasIncludeTrafficAlongRoute;
- (BOOL)hasIncludeTrafficIncidents;
- (BOOL)hasIncludeZilchPoints;
- (BOOL)hasMainTransportType;
- (BOOL)hasPhoneticLocaleIdentifier;
- (BOOL)hasTimepoint;
- (BOOL)hasTrafficType;
- (BOOL)hasTransitOptions;
- (BOOL)hasUseMetricThreshold;
- (BOOL)hasWalkingLimitMeters;
- (BOOL)hasWalkingOptions;
- (BOOL)includeCellularCoverage;
- (BOOL)includeContingencyRoutes;
- (BOOL)includeCrossLanguagePhonetics;
- (BOOL)includeHistoricTravelTime;
- (BOOL)includeLaneGuidance;
- (BOOL)includeLaneWidths;
- (BOOL)includeManeuverIcons;
- (BOOL)includePhonetics;
- (BOOL)includeRoutingPathLeg;
- (BOOL)includeTrafficAlongRoute;
- (BOOL)includeTrafficIncidents;
- (BOOL)includeZilchPoints;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)useMetricThreshold;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEORouteAttributes)init;
- (GEORouteAttributes)initWithData:(id)a3;
- (GEORouteAttributes)initWithDictionary:(id)a3;
- (GEORouteAttributes)initWithJSON:(id)a3;
- (GEOTimepoint)timepoint;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (GEOWaypointNameProperties)destinationInfo;
- (NSString)phoneticLocaleIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)additionalTransportTypesAsString:(int)a3;
- (id)basicPointsToBeIncludedAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)initialPromptTypesAsString:(int)a3;
- (id)jsonRepresentation;
- (id)mainTransportTypeAsString:(int)a3;
- (id)trafficTypeAsString:(int)a3;
- (id)uiContextsAsString:(int)a3;
- (int)StringAsAdditionalTransportTypes:(id)a3;
- (int)StringAsBasicPointsToBeIncluded:(id)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsInitialPromptTypes:(id)a3;
- (int)StringAsMainTransportType:(id)a3;
- (int)StringAsTrafficType:(id)a3;
- (int)StringAsUiContexts:(id)a3;
- (int)additionalTransportTypeAtIndex:(unint64_t)a3;
- (int)additionalTransportTypes;
- (int)basicPointsToBeIncluded;
- (int)destinationType;
- (int)initialPromptTypeAtIndex:(unint64_t)a3;
- (int)initialPromptTypes;
- (int)mainTransportType;
- (int)trafficType;
- (int)uiContextAtIndex:(unint64_t)a3;
- (int)uiContexts;
- (unint64_t)additionalTransportTypesCount;
- (unint64_t)hash;
- (unint64_t)initialPromptTypesCount;
- (unint64_t)uiContextsCount;
- (unsigned)walkingLimitMeters;
- (void)_readAdditionalTransportTypes;
- (void)_readAutomobileOptions;
- (void)_readCyclingOptions;
- (void)_readDestinationInfo;
- (void)_readInitialPromptTypes;
- (void)_readPhoneticLocaleIdentifier;
- (void)_readTransitOptions;
- (void)_readUiContexts;
- (void)_readWalkingOptions;
- (void)addAdditionalTransportType:(int)a3;
- (void)addInitialPromptType:(int)a3;
- (void)addUiContext:(int)a3;
- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5;
- (void)buildRouteAttributes:(id)a3 result:(id)a4;
- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5;
- (void)clearAdditionalTransportTypes;
- (void)clearInitialPromptTypes;
- (void)clearUiContexts;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalTransportTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAutomobileOptions:(id)a3;
- (void)setBasicPointsToBeIncluded:(int)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDestinationInfo:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setDirectZilchByLaneFlowlines:(BOOL)a3;
- (void)setEnableExperimentalMode:(BOOL)a3;
- (void)setHasBasicPointsToBeIncluded:(BOOL)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasDirectZilchByLaneFlowlines:(BOOL)a3;
- (void)setHasEnableExperimentalMode:(BOOL)a3;
- (void)setHasIncludeCellularCoverage:(BOOL)a3;
- (void)setHasIncludeContingencyRoutes:(BOOL)a3;
- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3;
- (void)setHasIncludeHistoricTravelTime:(BOOL)a3;
- (void)setHasIncludeLaneGuidance:(BOOL)a3;
- (void)setHasIncludeLaneWidths:(BOOL)a3;
- (void)setHasIncludeManeuverIcons:(BOOL)a3;
- (void)setHasIncludePhonetics:(BOOL)a3;
- (void)setHasIncludeRoutingPathLeg:(BOOL)a3;
- (void)setHasIncludeTrafficAlongRoute:(BOOL)a3;
- (void)setHasIncludeTrafficIncidents:(BOOL)a3;
- (void)setHasIncludeZilchPoints:(BOOL)a3;
- (void)setHasMainTransportType:(BOOL)a3;
- (void)setHasTimepoint:(BOOL)a3;
- (void)setHasTrafficType:(BOOL)a3;
- (void)setHasUseMetricThreshold:(BOOL)a3;
- (void)setHasWalkingLimitMeters:(BOOL)a3;
- (void)setIncludeCellularCoverage:(BOOL)a3;
- (void)setIncludeContingencyRoutes:(BOOL)a3;
- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3;
- (void)setIncludeHistoricTravelTime:(BOOL)a3;
- (void)setIncludeLaneGuidance:(BOOL)a3;
- (void)setIncludeLaneWidths:(BOOL)a3;
- (void)setIncludeManeuverIcons:(BOOL)a3;
- (void)setIncludePhonetics:(BOOL)a3;
- (void)setIncludeRoutingPathLeg:(BOOL)a3;
- (void)setIncludeTrafficAlongRoute:(BOOL)a3;
- (void)setIncludeTrafficIncidents:(BOOL)a3;
- (void)setIncludeZilchPoints:(BOOL)a3;
- (void)setInitialPromptTypes:(int *)a3 count:(unint64_t)a4;
- (void)setMainTransportType:(int)a3;
- (void)setPhoneticLocaleIdentifier:(id)a3;
- (void)setRoutePointTypeForTransportType:(int)a3;
- (void)setRoutePointTypeForTransportType:(int)a3 countryConfiguration:(id)a4;
- (void)setTimepoint:(GEOTimepoint *)a3;
- (void)setTrafficType:(int)a3;
- (void)setTransitOptions:(id)a3;
- (void)setUiContexts:(int *)a3 count:(unint64_t)a4;
- (void)setUseMetricThreshold:(BOOL)a3;
- (void)setWalkingLimitMeters:(unsigned int)a3;
- (void)setWalkingOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteAttributes

- (GEOAutomobileOptions)automobileOptions
{
  -[GEORouteAttributes _readAutomobileOptions]((uint64_t)self);
  automobileOptions = self->_automobileOptions;

  return automobileOptions;
}

- (void)_readAutomobileOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutomobileOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (void)setRoutePointTypeForTransportType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[GEOCountryConfiguration sharedConfiguration];
  [(GEORouteAttributes *)self setRoutePointTypeForTransportType:v3 countryConfiguration:v5];
}

- (void)setRoutePointTypeForTransportType:(int)a3 countryConfiguration:(id)a4
{
  id v6 = a4;
  [(GEORouteAttributes *)self setHasIncludeRoutingPathLeg:0];
  [(GEORouteAttributes *)self setHasIncludeZilchPoints:0];
  [(GEORouteAttributes *)self setHasBasicPointsToBeIncluded:0];
  if (a3 == 1 || !GEOConfigGetBOOL(GeoServicesConfig_RequestRoutingPathPoints, (uint64_t)off_1E9114308))
  {
    if ([v6 zilchPointsSupported]) {
      [(GEORouteAttributes *)self setIncludeZilchPoints:1];
    }
    else {
      [(GEORouteAttributes *)self setBasicPointsToBeIncluded:1];
    }
  }
  else
  {
    [(GEORouteAttributes *)self setIncludeRoutingPathLeg:1];
  }
}

- (void)setIncludeRoutingPathLeg:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80080000;
  self->_includeRoutingPathLeg = a3;
}

- (void)setHasIncludeZilchPoints:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147450880;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0x7FFF7FFF | v3);
}

- (void)setHasIncludeRoutingPathLeg:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2146959360;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (void)setHasBasicPointsToBeIncluded:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483646;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (void)setTrafficType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000010;
  self->_trafficType = a3;
}

- (void)setMainTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000008;
  self->_mainTransportType = a3;
}

- (void)setIncludeTrafficIncidents:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80004000;
  self->_includeTrafficIncidents = a3;
}

- (void)setIncludeTrafficAlongRoute:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80002000;
  self->_includeTrafficAlongRoute = a3;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000200;
  self->_includeHistoricTravelTime = a3;
}

- (void)setAutomobileOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x82000000;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationInfo, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORouteAttributes;
  [(GEORouteAttributes *)&v3 dealloc];
}

void __76__GEORouteAttributes_GEORouteAttributesExtras__buildRouteAttributes_result___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_DWORD *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORouteAttributesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteAttributes *)self readAll:0];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 188) = self->_mainTransportType;
    *(_DWORD *)(v5 + 216) |= 8u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 206) = self->_includePhonetics;
  *(_DWORD *)(v5 + 216) |= 0x1000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(unsigned char *)(v5 + 205) = self->_includeManeuverIcons;
  *(_DWORD *)(v5 + 216) |= 0x800u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(unsigned char *)(v5 + 209) = self->_includeZilchPoints;
  *(_DWORD *)(v5 + 216) |= 0x8000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(unsigned char *)(v5 + 213) = self->_includeRoutingPathLeg;
  *(_DWORD *)(v5 + 216) |= 0x80000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v5 + 202) = self->_includeContingencyRoutes;
  *(_DWORD *)(v5 + 216) |= 0x100u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(unsigned char *)(v5 + 204) = self->_includeLaneGuidance;
  *(_DWORD *)(v5 + 216) |= 0x400u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_41:
  *(_DWORD *)(v5 + 180) = self->_basicPointsToBeIncluded;
  *(_DWORD *)(v5 + 216) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 192) = self->_trafficType;
    *(_DWORD *)(v5 + 216) |= 0x10u;
  }
LABEL_15:
  uint64_t v10 = [(NSString *)self->_phoneticLocaleIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v10;

  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 207) = self->_includeTrafficAlongRoute;
    *(_DWORD *)(v5 + 216) |= 0x2000u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = self->_flags;
    if ((*(unsigned char *)&v12 & 1) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v12 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&v12 & 1) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v27 = *(void *)&self->_timepoint._type;
  *(_OWORD *)(v5 + 96) = *(_OWORD *)&self->_timepoint._currentUserTime;
  *(void *)(v5 + 112) = v27;
  *(_DWORD *)(v5 + 216) |= 1u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 203) = self->_includeHistoricTravelTime;
  *(_DWORD *)(v5 + 216) |= 0x200u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v12 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_46:
  *(unsigned char *)(v5 + 208) = self->_includeTrafficIncidents;
  *(_DWORD *)(v5 + 216) |= 0x4000u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 196) = self->_walkingLimitMeters;
    *(_DWORD *)(v5 + 216) |= 0x20u;
  }
LABEL_21:
  PBRepeatedInt32Copy();
  id v13 = [(GEOAutomobileOptions *)self->_automobileOptions copyWithZone:a3];
  v14 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v13;

  id v15 = [(GEOCyclingOptions *)self->_cyclingOptions copyWithZone:a3];
  v16 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v15;

  id v17 = [(GEOTransitOptions *)self->_transitOptions copyWithZone:a3];
  v18 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v17;

  id v19 = [(GEOWalkingOptions *)self->_walkingOptions copyWithZone:a3];
  v20 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v19;

  PBRepeatedInt32Copy();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v21 = self->_flags;
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    *(unsigned char *)(v5 + 214) = self->_useMetricThreshold;
    *(_DWORD *)(v5 + 216) |= 0x100000u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v21 = self->_flags;
  }
  if ((*(unsigned char *)&v21 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 201) = self->_enableExperimentalMode;
    *(_DWORD *)(v5 + 216) |= 0x80u;
  }
  id v22 = [(GEOWaypointNameProperties *)self->_destinationInfo copyWithZone:a3];
  v23 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v22;

  $F4D580EDFB4761538EFAA3AFFA5BEEEF v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_destinationType;
    *(_DWORD *)(v5 + 216) |= 4u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v24 = self->_flags;
    if ((*(_DWORD *)&v24 & 0x20000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v24 & 0x40) == 0) {
        goto LABEL_28;
      }
LABEL_50:
      *(unsigned char *)(v5 + 200) = self->_directZilchByLaneFlowlines;
      *(_DWORD *)(v5 + 216) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x20000) == 0)
  {
    goto LABEL_27;
  }
  *(unsigned char *)(v5 + 211) = self->_includeCrossLanguagePhonetics;
  *(_DWORD *)(v5 + 216) |= 0x20000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 0x40) != 0) {
    goto LABEL_50;
  }
LABEL_28:
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
LABEL_29:
    *(unsigned char *)(v5 + 212) = self->_includeLaneWidths;
    *(_DWORD *)(v5 + 216) |= 0x40000u;
  }
LABEL_30:
  PBRepeatedInt32Copy();
  if (*((unsigned char *)&self->_flags + 2))
  {
    *(unsigned char *)(v5 + 210) = self->_includeCellularCoverage;
    *(_DWORD *)(v5 + 216) |= 0x10000u;
  }
  v25 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v25;
LABEL_33:

  return (id)v5;
}

- (GEORouteAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteAttributes;
  id v2 = [(GEORouteAttributes *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_5970;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_5971;
    }
    GEORouteAttributesReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORouteAttributesCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (void)buildRouteAttributes:(id)a3 result:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__GEORouteAttributes_GEORouteAttributesExtras__buildRouteAttributes_result___block_invoke;
  v8[3] = &unk_1E53D7C50;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

- (void)addUiContext:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (void)_readUiContexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 1) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUiContexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (GEORouteAttributes)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteAttributes;
  id v3 = [(GEORouteAttributes *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (int)mainTransportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_mainTransportType;
  }
  else {
    return 0;
  }
}

- (void)setHasMainTransportType:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483640;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMainTransportType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)mainTransportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v3 = off_1E53E0868[a3];
  }

  return v3;
}

- (int)StringAsMainTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)includePhonetics
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x1000) != 0 && self->_includePhonetics;
}

- (void)setIncludePhonetics:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80001000;
  self->_includePhonetics = a3;
}

- (void)setHasIncludePhonetics:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147479552;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasIncludePhonetics
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)includeManeuverIcons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x800) == 0 || self->_includeManeuverIcons;
}

- (void)setIncludeManeuverIcons:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000800;
  self->_includeManeuverIcons = a3;
}

- (void)setHasIncludeManeuverIcons:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147481600;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasIncludeManeuverIcons
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)includeZilchPoints
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x8000) != 0 && self->_includeZilchPoints;
}

- (void)setIncludeZilchPoints:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80008000;
  self->_includeZilchPoints = a3;
}

- (BOOL)hasIncludeZilchPoints
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)includeRoutingPathLeg
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_includeRoutingPathLeg;
}

- (BOOL)hasIncludeRoutingPathLeg
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)includeContingencyRoutes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x100) != 0 && self->_includeContingencyRoutes;
}

- (void)setIncludeContingencyRoutes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000100;
  self->_includeContingencyRoutes = a3;
}

- (void)setHasIncludeContingencyRoutes:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483392;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasIncludeContingencyRoutes
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (BOOL)includeLaneGuidance
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) != 0 && self->_includeLaneGuidance;
}

- (void)setIncludeLaneGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000400;
  self->_includeLaneGuidance = a3;
}

- (void)setHasIncludeLaneGuidance:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147482624;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasIncludeLaneGuidance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (int)basicPointsToBeIncluded
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_basicPointsToBeIncluded;
  }
  else {
    return 0;
  }
}

- (void)setBasicPointsToBeIncluded:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000002;
  self->_basicPointsToBeIncluded = a3;
}

- (BOOL)hasBasicPointsToBeIncluded
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)basicPointsToBeIncludedAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v3 = off_1E53E0560[a3];
  }

  return v3;
}

- (int)StringAsBasicPointsToBeIncluded:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FILTERED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)trafficType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_trafficType;
  }
  else {
    return 1;
  }
}

- (void)setHasTrafficType:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483632;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTrafficType
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v3 = off_1E53E0578[a3 - 1];
  }

  return v3;
}

- (int)StringAsTrafficType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATIC_SPEEDS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HISTORICAL_SPEEDS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LIVE_SPEEDS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)_readPhoneticLocaleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 0x10) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEORouteAttributes _readPhoneticLocaleIdentifier]((uint64_t)self);
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;

  return phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x90000000;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (BOOL)includeTrafficAlongRoute
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) != 0 && self->_includeTrafficAlongRoute;
}

- (void)setHasIncludeTrafficAlongRoute:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147475456;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasIncludeTrafficAlongRoute
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (GEOTimepoint)timepoint
{
  *retstr = self[4];
  return self;
}

- (void)setTimepoint:(GEOTimepoint *)a3
{
  *(_DWORD *)&self->_flags |= 0x80000001;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(void *)&self->_timepoint._type = v3;
}

- (void)setHasTimepoint:(BOOL)a3
{
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0x7FFFFFFE | a3 | 0x80000000);
}

- (BOOL)hasTimepoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)includeHistoricTravelTime
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x200) == 0 || self->_includeHistoricTravelTime;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483136;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)includeTrafficIncidents
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x4000) != 0 && self->_includeTrafficIncidents;
}

- (void)setHasIncludeTrafficIncidents:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147467264;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasIncludeTrafficIncidents
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (unsigned)walkingLimitMeters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_walkingLimitMeters;
  }
  else {
    return 800000;
  }
}

- (void)setWalkingLimitMeters:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000020;
  self->_walkingLimitMeters = a3;
}

- (void)setHasWalkingLimitMeters:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483616;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasWalkingLimitMeters
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readAdditionalTransportTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 218) & 0x40) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalTransportTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (unint64_t)additionalTransportTypesCount
{
  return self->_additionalTransportTypes.count;
}

- (int)additionalTransportTypes
{
  return self->_additionalTransportTypes.list;
}

- (void)clearAdditionalTransportTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  PBRepeatedInt32Clear();
}

- (void)addAdditionalTransportType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (int)additionalTransportTypeAtIndex:(unint64_t)a3
{
  -[GEORouteAttributes _readAdditionalTransportTypes]((uint64_t)self);
  p_additionalTransportTypes = &self->_additionalTransportTypes;
  unint64_t count = self->_additionalTransportTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_additionalTransportTypes->list[a3];
}

- (void)setAdditionalTransportTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  MEMORY[0x1F4147390](&self->_additionalTransportTypes, a3, a4);
}

- (id)additionalTransportTypesAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0868[a3];
  }

  return v3;
}

- (int)StringAsAdditionalTransportTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasAutomobileOptions
{
  return self->_automobileOptions != 0;
}

- (void)_readCyclingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 4) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCyclingOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasCyclingOptions
{
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEORouteAttributes _readCyclingOptions]((uint64_t)self);
  cyclingOptions = self->_cyclingOptions;

  return cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x84000000;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)_readTransitOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 0x20) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasTransitOptions
{
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEORouteAttributes _readTransitOptions]((uint64_t)self);
  transitOptions = self->_transitOptions;

  return transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xA0000000;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 0x40) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalkingOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasWalkingOptions
{
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEORouteAttributes _readWalkingOptions]((uint64_t)self);
  walkingOptions = self->_walkingOptions;

  return walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(_DWORD *)&self->_flags |= 0xC0000000;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (unint64_t)uiContextsCount
{
  return self->_uiContexts.count;
}

- (int)uiContexts
{
  return self->_uiContexts.list;
}

- (void)clearUiContexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  PBRepeatedInt32Clear();
}

- (int)uiContextAtIndex:(unint64_t)a3
{
  -[GEORouteAttributes _readUiContexts]((uint64_t)self);
  p_uiContexts = &self->_uiContexts;
  unint64_t count = self->_uiContexts.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_uiContexts->list[a3];
}

- (void)setUiContexts:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  MEMORY[0x1F4147390](&self->_uiContexts, a3, a4);
}

- (id)uiContextsAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E0590[a3 - 1];
  }

  return v3;
}

- (int)StringAsUiContexts:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SIGN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LIST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GENERIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPOKEN"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)useMetricThreshold
{
  return self->_useMetricThreshold;
}

- (void)setUseMetricThreshold:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80100000;
  self->_useMetricThreshold = a3;
}

- (void)setHasUseMetricThreshold:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2146435072;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (BOOL)hasUseMetricThreshold
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)enableExperimentalMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x80) != 0 && self->_enableExperimentalMode;
}

- (void)setEnableExperimentalMode:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000080;
  self->_enableExperimentalMode = a3;
}

- (void)setHasEnableExperimentalMode:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483520;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasEnableExperimentalMode
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readDestinationInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 219) & 8) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestinationInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (BOOL)hasDestinationInfo
{
  return self->_destinationInfo != 0;
}

- (GEOWaypointNameProperties)destinationInfo
{
  -[GEORouteAttributes _readDestinationInfo]((uint64_t)self);
  destinationInfo = self->_destinationInfo;

  return destinationInfo;
}

- (void)setDestinationInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x88000000;
  objc_storeStrong((id *)&self->_destinationInfo, a3);
}

- (int)destinationType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 4) != 0) {
    return self->_destinationType;
  }
  else {
    return 0;
  }
}

- (void)setDestinationType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x80000004;
  self->_destinationType = a3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483644;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDestinationType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)destinationTypeAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v3 = off_1E53E05B0[a3];
  }

  return v3;
}

- (int)StringAsDestinationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WAYPOINT_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_WORK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_HOME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_WORK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_HOME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_OTHER"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_POI"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_ADDRESS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_UNKNOWN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CUSTOM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_SCHOOL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_SCHOOL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_PERSON_LOCATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)includeCrossLanguagePhonetics
{
  return self->_includeCrossLanguagePhonetics;
}

- (void)setIncludeCrossLanguagePhonetics:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80020000;
  self->_includeCrossLanguagePhonetics = a3;
}

- (void)setHasIncludeCrossLanguagePhonetics:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147352576;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasIncludeCrossLanguagePhonetics
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)directZilchByLaneFlowlines
{
  return self->_directZilchByLaneFlowlines;
}

- (void)setDirectZilchByLaneFlowlines:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000040;
  self->_directZilchByLaneFlowlines = a3;
}

- (void)setHasDirectZilchByLaneFlowlines:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147483584;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasDirectZilchByLaneFlowlines
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)includeLaneWidths
{
  return self->_includeLaneWidths;
}

- (void)setIncludeLaneWidths:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80040000;
  self->_includeLaneWidths = a3;
}

- (void)setHasIncludeLaneWidths:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147221504;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasIncludeLaneWidths
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (void)_readInitialPromptTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 176));
    if ((*(unsigned char *)(a1 + 218) & 0x80) == 0)
    {
      id v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteAttributesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInitialPromptTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 176));
  }
}

- (unint64_t)initialPromptTypesCount
{
  return self->_initialPromptTypes.count;
}

- (int)initialPromptTypes
{
  return self->_initialPromptTypes.list;
}

- (void)clearInitialPromptTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  PBRepeatedInt32Clear();
}

- (void)addInitialPromptType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;
}

- (int)initialPromptTypeAtIndex:(unint64_t)a3
{
  -[GEORouteAttributes _readInitialPromptTypes]((uint64_t)self);
  p_initialPromptTypes = &self->_initialPromptTypes;
  unint64_t count = self->_initialPromptTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_initialPromptTypes->list[a3];
}

- (void)setInitialPromptTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x80000000;

  MEMORY[0x1F4147390](&self->_initialPromptTypes, a3, a4);
}

- (id)initialPromptTypesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"PROMPT_DISCOVER_INCIDENTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"PROMPT_UNKNOWN";
  }
  return v4;
}

- (int)StringAsInitialPromptTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PROMPT_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PROMPT_DISCOVER_INCIDENTS"];
  }

  return v4;
}

- (BOOL)includeCellularCoverage
{
  return self->_includeCellularCoverage;
}

- (void)setIncludeCellularCoverage:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80010000;
  self->_includeCellularCoverage = a3;
}

- (void)setHasIncludeCellularCoverage:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = -2147418112;
  }
  else {
    unsigned int v3 = 0x80000000;
  }
  self->_$F4D580EDFB4761538EFAA3AFFA5BEEEF flags = ($F4D580EDFB4761538EFAA3AFFA5BEEEF)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasIncludeCellularCoverage
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (id)description
{
  unsigned int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteAttributes;
  int v4 = [(GEORouteAttributes *)&v8 description];
  uint64_t v5 = [(GEORouteAttributes *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v77 = 0;
    goto LABEL_131;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 8) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 188);
    if (v6 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 188));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = off_1E53E0868[v6];
    }
    [v4 setObject:v7 forKey:@"mainTransportType"];

    int v5 = *(_DWORD *)(a1 + 216);
  }
  unint64_t v8 = 0x1E4F28000uLL;
  if ((v5 & 0x1000) != 0)
  {
    id v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 206)];
    [v4 setObject:v9 forKey:@"includePhonetics"];

    int v5 = *(_DWORD *)(a1 + 216);
    if ((v5 & 0x800) == 0)
    {
LABEL_9:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 205)];
  [v4 setObject:v10 forKey:@"includeManeuverIcons"];

  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 209)];
  [v4 setObject:v11 forKey:@"includeZilchPoints"];

  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_19:
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 213)];
  if (a2) {
    id v13 = @"includeRoutingPathLeg";
  }
  else {
    id v13 = @"include_routing_path_leg";
  }
  [v4 setObject:v12 forKey:v13];

  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 202)];
  [v4 setObject:v14 forKey:@"includeContingencyRoutes"];

  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 0x400) == 0)
  {
LABEL_13:
    if ((v5 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  id v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 204)];
  [v4 setObject:v15 forKey:@"includeLaneGuidance"];

  int v5 = *(_DWORD *)(a1 + 216);
  if ((v5 & 2) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t v16 = *(int *)(a1 + 180);
  if (v16 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 180));
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = off_1E53E0560[v16];
  }
  [v4 setObject:v17 forKey:@"basicPointsToBeIncluded"];

  if ((*(_DWORD *)(a1 + 216) & 0x10) != 0)
  {
LABEL_29:
    unsigned int v18 = *(_DWORD *)(a1 + 192) - 1;
    if (v18 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 192));
      id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = off_1E53E0578[v18];
    }
    [v4 setObject:v19 forKey:@"trafficType"];
  }
LABEL_33:
  v20 = [(id)a1 phoneticLocaleIdentifier];
  if (v20) {
    [v4 setObject:v20 forKey:@"phoneticLocaleIdentifier"];
  }

  int v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x2000) != 0)
  {
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 207)];
    [v4 setObject:v30 forKey:@"includeTrafficAlongRoute"];

    int v21 = *(_DWORD *)(a1 + 216);
    if ((v21 & 1) == 0)
    {
LABEL_37:
      if ((v21 & 0x200) == 0) {
        goto LABEL_38;
      }
      goto LABEL_54;
    }
  }
  else if ((v21 & 1) == 0)
  {
    goto LABEL_37;
  }
  _GEOTimepointDictionaryRepresentation(a1 + 96, a2);
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  [v4 setObject:v31 forKey:@"timepoint"];
  int v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x200) == 0)
  {
LABEL_38:
    if ((v21 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_55;
  }
LABEL_54:
  v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 203)];
  [v4 setObject:v32 forKey:@"includeHistoricTravelTime"];

  int v21 = *(_DWORD *)(a1 + 216);
  if ((v21 & 0x4000) == 0)
  {
LABEL_39:
    if ((v21 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_55:
  v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 208)];
  [v4 setObject:v33 forKey:@"includeTrafficIncidents"];

  if ((*(_DWORD *)(a1 + 216) & 0x20) != 0)
  {
LABEL_40:
    id v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 196)];
    [v4 setObject:v22 forKey:@"walkingLimitMeters"];
  }
LABEL_41:
  if (*(void *)(a1 + 32))
  {
    v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v24 = (void *)(a1 + 24);
    if (*(void *)(a1 + 32))
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = *(int *)(*v24 + 4 * v25);
        if (v26 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
          uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v27 = off_1E53E0868[v26];
        }
        [v23 addObject:v27];

        ++v25;
        $F4D580EDFB4761538EFAA3AFFA5BEEEF v24 = (void *)(a1 + 24);
      }
      while (v25 < *(void *)(a1 + 32));
    }
    [v4 setObject:v23 forKey:@"additionalTransportType"];

    unint64_t v8 = 0x1E4F28000;
  }
  v28 = [(id)a1 automobileOptions];
  v29 = v28;
  if (v28)
  {
    if (a2) {
      [v28 jsonRepresentation];
    }
    else {
    id v34 = [v28 dictionaryRepresentation];
    }

    [v4 setObject:v34 forKey:@"automobileOptions"];
  }

  v35 = [(id)a1 cyclingOptions];
  v36 = v35;
  if (v35)
  {
    if (a2) {
      [v35 jsonRepresentation];
    }
    else {
    id v37 = [v35 dictionaryRepresentation];
    }

    [v4 setObject:v37 forKey:@"cyclingOptions"];
  }

  v38 = [(id)a1 transitOptions];
  v39 = v38;
  if (v38)
  {
    if (a2) {
      [v38 jsonRepresentation];
    }
    else {
    id v40 = [v38 dictionaryRepresentation];
    }

    [v4 setObject:v40 forKey:@"transitOptions"];
  }

  v41 = [(id)a1 walkingOptions];
  v42 = v41;
  if (v41)
  {
    if (a2) {
      [v41 jsonRepresentation];
    }
    else {
    id v43 = [v41 dictionaryRepresentation];
    }

    [v4 setObject:v43 forKey:@"walkingOptions"];
  }

  if (*(void *)(a1 + 80))
  {
    v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v45 = (void *)(a1 + 72);
    if (*(void *)(a1 + 80))
    {
      unint64_t v46 = 0;
      do
      {
        uint64_t v47 = *(unsigned int *)(*v45 + 4 * v46);
        if ((v47 - 1) >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v47);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v48 = off_1E53E0590[(int)v47 - 1];
        }
        [v44 addObject:v48];

        ++v46;
        v45 = (void *)(a1 + 72);
      }
      while (v46 < *(void *)(a1 + 80));
    }
    if (a2) {
      v49 = @"uiContext";
    }
    else {
      v49 = @"ui_context";
    }
    [v4 setObject:v44 forKey:v49];

    unint64_t v8 = 0x1E4F28000uLL;
  }
  int v50 = *(_DWORD *)(a1 + 216);
  if ((v50 & 0x100000) != 0)
  {
    v51 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 214)];
    if (a2) {
      v52 = @"useMetricThreshold";
    }
    else {
      v52 = @"use_metric_threshold";
    }
    [v4 setObject:v51 forKey:v52];

    int v50 = *(_DWORD *)(a1 + 216);
  }
  if ((v50 & 0x80) != 0)
  {
    v53 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 201)];
    if (a2) {
      v54 = @"enableExperimentalMode";
    }
    else {
      v54 = @"enable_experimental_mode";
    }
    [v4 setObject:v53 forKey:v54];
  }
  v55 = [(id)a1 destinationInfo];
  v56 = v55;
  if (v55)
  {
    if (a2)
    {
      v57 = [v55 jsonRepresentation];
      v58 = @"destinationInfo";
    }
    else
    {
      v57 = [v55 dictionaryRepresentation];
      v58 = @"destination_info";
    }
    id v59 = v57;

    [v4 setObject:v59 forKey:v58];
  }

  int v60 = *(_DWORD *)(a1 + 216);
  if ((v60 & 4) != 0)
  {
    uint64_t v79 = *(int *)(a1 + 184);
    if (v79 >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 184));
      v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = off_1E53E05B0[v79];
    }
    if (a2) {
      v81 = @"destinationType";
    }
    else {
      v81 = @"destination_type";
    }
    [v4 setObject:v80 forKey:v81];

    int v60 = *(_DWORD *)(a1 + 216);
    if ((v60 & 0x20000) == 0)
    {
LABEL_102:
      if ((v60 & 0x40) == 0) {
        goto LABEL_103;
      }
LABEL_145:
      v84 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 200)];
      if (a2) {
        v85 = @"directZilchByLaneFlowlines";
      }
      else {
        v85 = @"direct_zilch_by_lane_flowlines";
      }
      [v4 setObject:v84 forKey:v85];

      if ((*(_DWORD *)(a1 + 216) & 0x40000) == 0) {
        goto LABEL_108;
      }
      goto LABEL_104;
    }
  }
  else if ((v60 & 0x20000) == 0)
  {
    goto LABEL_102;
  }
  v82 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 211)];
  if (a2) {
    v83 = @"includeCrossLanguagePhonetics";
  }
  else {
    v83 = @"include_cross_language_phonetics";
  }
  [v4 setObject:v82 forKey:v83];

  int v60 = *(_DWORD *)(a1 + 216);
  if ((v60 & 0x40) != 0) {
    goto LABEL_145;
  }
LABEL_103:
  if ((v60 & 0x40000) != 0)
  {
LABEL_104:
    v61 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 212)];
    if (a2) {
      v62 = @"includeLaneWidths";
    }
    else {
      v62 = @"include_lane_widths";
    }
    [v4 setObject:v61 forKey:v62];
  }
LABEL_108:
  if (*(void *)(a1 + 56))
  {
    v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v64 = (void *)(a1 + 48);
    if (*(void *)(a1 + 56))
    {
      unint64_t v65 = 0;
      do
      {
        uint64_t v66 = *(unsigned int *)(*v64 + 4 * v65);
        if (v66)
        {
          if (v66 == 1)
          {
            v67 = @"PROMPT_DISCOVER_INCIDENTS";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v66);
            v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v67 = @"PROMPT_UNKNOWN";
        }
        [v63 addObject:v67];

        ++v65;
        v64 = (void *)(a1 + 48);
      }
      while (v65 < *(void *)(a1 + 56));
    }
    if (a2) {
      v68 = @"initialPromptType";
    }
    else {
      v68 = @"initial_prompt_type";
    }
    [v4 setObject:v63 forKey:v68];

    unint64_t v8 = 0x1E4F28000uLL;
  }
  if (*(unsigned char *)(a1 + 218))
  {
    v69 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 210)];
    if (a2) {
      v70 = @"includeCellularCoverage";
    }
    else {
      v70 = @"include_cellular_coverage";
    }
    [v4 setObject:v69 forKey:v70];
  }
  v71 = *(void **)(a1 + 16);
  if (v71)
  {
    v72 = [v71 dictionaryRepresentation];
    v73 = v72;
    if (a2)
    {
      v74 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v72, "count"));
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __48__GEORouteAttributes__dictionaryRepresentation___block_invoke;
      v86[3] = &unk_1E53D8860;
      id v75 = v74;
      id v87 = v75;
      [v73 enumerateKeysAndObjectsUsingBlock:v86];
      id v76 = v75;

      v73 = v76;
    }
    [v4 setObject:v73 forKey:@"Unknown Fields"];
  }
  id v77 = v4;

LABEL_131:

  return v77;
}

- (id)jsonRepresentation
{
  return -[GEORouteAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEORouteAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    unint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    unint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORouteAttributes)initWithDictionary:(id)a3
{
  return (GEORouteAttributes *)-[GEORouteAttributes _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_246;
  }
  id v6 = (id)[a1 init];

  if (!v6)
  {
    a1 = 0;
    goto LABEL_246;
  }
  objc_super v7 = [v5 objectForKeyedSubscript:@"mainTransportType"];
  unint64_t v8 = 0x1E4F29000uLL;
  objc_opt_class();
  unint64_t v9 = 0x1E4F28000uLL;
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    if ([v10 isEqualToString:@"AUTOMOBILE"])
    {
      uint64_t v11 = 0;
    }
    else if ([v10 isEqualToString:@"TRANSIT"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"WALKING"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"BICYCLE"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
    {
      uint64_t v11 = 4;
    }
    else if ([v10 isEqualToString:@"FERRY"])
    {
      uint64_t v11 = 5;
    }
    else if ([v10 isEqualToString:@"RIDESHARE"])
    {
      uint64_t v11 = 6;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    uint64_t v11 = [v7 intValue];
  }
  [v6 setMainTransportType:v11];
LABEL_24:

  $F4D580EDFB4761538EFAA3AFFA5BEEEF v12 = [v5 objectForKeyedSubscript:@"includePhonetics"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludePhonetics:", objc_msgSend(v12, "BOOLValue"));
  }

  id v13 = [v5 objectForKeyedSubscript:@"includeManeuverIcons"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeManeuverIcons:", objc_msgSend(v13, "BOOLValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"includeZilchPoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeZilchPoints:", objc_msgSend(v14, "BOOLValue"));
  }

  if (a3) {
    id v15 = @"includeRoutingPathLeg";
  }
  else {
    id v15 = @"include_routing_path_leg";
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeRoutingPathLeg:", objc_msgSend(v16, "BOOLValue"));
  }

  id v17 = [v5 objectForKeyedSubscript:@"includeContingencyRoutes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeContingencyRoutes:", objc_msgSend(v17, "BOOLValue"));
  }

  unsigned int v18 = [v5 objectForKeyedSubscript:@"includeLaneGuidance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeLaneGuidance:", objc_msgSend(v18, "BOOLValue"));
  }

  id v19 = [v5 objectForKeyedSubscript:@"basicPointsToBeIncluded"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"NONE"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"ALL"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"FILTERED"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    uint64_t v21 = [v19 intValue];
  }
  [v6 setBasicPointsToBeIncluded:v21];
LABEL_51:

  id v22 = [v5 objectForKeyedSubscript:@"trafficType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"STATIC_SPEEDS"])
    {
      uint64_t v24 = 1;
    }
    else if ([v23 isEqualToString:@"HISTORICAL_SPEEDS"])
    {
      uint64_t v24 = 2;
    }
    else if ([v23 isEqualToString:@"LIVE_SPEEDS"])
    {
      uint64_t v24 = 3;
    }
    else
    {
      uint64_t v24 = 1;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_63;
    }
    uint64_t v24 = [v22 intValue];
  }
  [v6 setTrafficType:v24];
LABEL_63:

  unint64_t v25 = [v5 objectForKeyedSubscript:@"phoneticLocaleIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = (void *)[v25 copy];
    [v6 setPhoneticLocaleIdentifier:v26];
  }
  uint64_t v27 = [v5 objectForKeyedSubscript:@"includeTrafficAlongRoute"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeTrafficAlongRoute:", objc_msgSend(v27, "BOOLValue"));
  }

  v28 = [v5 objectForKeyedSubscript:@"timepoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v120 = 0uLL;
    uint64_t v121 = 0;
    _GEOTimepointFromDictionaryRepresentation(v28, (uint64_t)&v120, a3);
    long long v118 = v120;
    uint64_t v119 = v121;
    [v6 setTimepoint:&v118];
  }

  v29 = [v5 objectForKeyedSubscript:@"includeHistoricTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeHistoricTravelTime:", objc_msgSend(v29, "BOOLValue"));
  }

  v30 = [v5 objectForKeyedSubscript:@"includeTrafficIncidents"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeTrafficIncidents:", objc_msgSend(v30, "BOOLValue"));
  }

  id v31 = [v5 objectForKeyedSubscript:@"walkingLimitMeters"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setWalkingLimitMeters:", objc_msgSend(v31, "unsignedIntValue"));
  }

  v32 = [v5 objectForKeyedSubscript:@"additionalTransportType"];
  objc_opt_class();
  id v105 = v5;
  int v104 = a3;
  if (objc_opt_isKindOfClass())
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v101 = v32;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v114 objects:v124 count:16];
    if (!v34) {
      goto LABEL_103;
    }
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v115;
    while (1)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v115 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v114 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v39 = v38;
          if ([v39 isEqualToString:@"AUTOMOBILE"])
          {
            uint64_t v40 = 0;
          }
          else if ([v39 isEqualToString:@"TRANSIT"])
          {
            uint64_t v40 = 1;
          }
          else if ([v39 isEqualToString:@"WALKING"])
          {
            uint64_t v40 = 2;
          }
          else if ([v39 isEqualToString:@"BICYCLE"])
          {
            uint64_t v40 = 3;
          }
          else if ([v39 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
          {
            uint64_t v40 = 4;
          }
          else if ([v39 isEqualToString:@"FERRY"])
          {
            uint64_t v40 = 5;
          }
          else if ([v39 isEqualToString:@"RIDESHARE"])
          {
            uint64_t v40 = 6;
          }
          else
          {
            uint64_t v40 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v40 = [v38 intValue];
        }
        [v6 addAdditionalTransportType:v40];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v114 objects:v124 count:16];
      if (!v35)
      {
LABEL_103:

        id v5 = v105;
        unint64_t v9 = 0x1E4F28000uLL;
        v32 = v101;
        break;
      }
    }
  }

  v41 = [v5 objectForKeyedSubscript:@"automobileOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOAutomobileOptions alloc];
    if (a3) {
      uint64_t v43 = [(GEOAutomobileOptions *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEOAutomobileOptions *)v42 initWithDictionary:v41];
    }
    v44 = (void *)v43;
    [v6 setAutomobileOptions:v43];
  }
  v45 = [v5 objectForKeyedSubscript:@"cyclingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v46 = [GEOCyclingOptions alloc];
    if (a3) {
      uint64_t v47 = [(GEOCyclingOptions *)v46 initWithJSON:v45];
    }
    else {
      uint64_t v47 = [(GEOCyclingOptions *)v46 initWithDictionary:v45];
    }
    v48 = (void *)v47;
    [v6 setCyclingOptions:v47];
  }
  v49 = [v5 objectForKeyedSubscript:@"transitOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v50 = [GEOTransitOptions alloc];
    if (a3) {
      uint64_t v51 = [(GEOTransitOptions *)v50 initWithJSON:v49];
    }
    else {
      uint64_t v51 = [(GEOTransitOptions *)v50 initWithDictionary:v49];
    }
    v52 = (void *)v51;
    [v6 setTransitOptions:v51];
  }
  v53 = [v5 objectForKeyedSubscript:@"walkingOptions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [GEOWalkingOptions alloc];
    if (a3) {
      uint64_t v55 = [(GEOWalkingOptions *)v54 initWithJSON:v53];
    }
    else {
      uint64_t v55 = [(GEOWalkingOptions *)v54 initWithDictionary:v53];
    }
    v56 = (void *)v55;
    [v6 setWalkingOptions:v55];
  }
  if (a3) {
    v57 = @"uiContext";
  }
  else {
    v57 = @"ui_context";
  }
  v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v102 = v58;
    id v59 = v58;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v110 objects:v123 count:16];
    if (!v60) {
      goto LABEL_149;
    }
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v111;
    while (1)
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v111 != v62) {
          objc_enumerationMutation(v59);
        }
        v64 = *(void **)(*((void *)&v110 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v65 = v8;
          unint64_t v66 = v9;
          id v67 = v64;
          if ([v67 isEqualToString:@"SIGN"])
          {
            uint64_t v68 = 1;
          }
          else if ([v67 isEqualToString:@"LIST"])
          {
            uint64_t v68 = 2;
          }
          else if ([v67 isEqualToString:@"GENERIC"])
          {
            uint64_t v68 = 3;
          }
          else if ([v67 isEqualToString:@"SPOKEN"])
          {
            uint64_t v68 = 4;
          }
          else
          {
            uint64_t v68 = 1;
          }

          unint64_t v9 = v66;
          unint64_t v8 = v65;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v68 = [v64 intValue];
        }
        [v6 addUiContext:v68];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v110 objects:v123 count:16];
      if (!v61)
      {
LABEL_149:

        id v5 = v105;
        a3 = v104;
        v58 = v102;
        break;
      }
    }
  }

  if (a3) {
    v69 = @"useMetricThreshold";
  }
  else {
    v69 = @"use_metric_threshold";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setUseMetricThreshold:", objc_msgSend(v70, "BOOLValue"));
  }

  if (a3) {
    v71 = @"enableExperimentalMode";
  }
  else {
    v71 = @"enable_experimental_mode";
  }
  v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setEnableExperimentalMode:", objc_msgSend(v72, "BOOLValue"));
  }

  if (a3) {
    v73 = @"destinationInfo";
  }
  else {
    v73 = @"destination_info";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v75 = [GEOWaypointNameProperties alloc];
    if (a3) {
      uint64_t v76 = [(GEOWaypointNameProperties *)v75 initWithJSON:v74];
    }
    else {
      uint64_t v76 = [(GEOWaypointNameProperties *)v75 initWithDictionary:v74];
    }
    id v77 = (void *)v76;
    [v6 setDestinationInfo:v76];
  }
  if (a3) {
    v78 = @"destinationType";
  }
  else {
    v78 = @"destination_type";
  }
  uint64_t v79 = [v5 objectForKeyedSubscript:v78];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v80 = v79;
    if ([v80 isEqualToString:@"WAYPOINT_UNSPECIFIED"])
    {
      uint64_t v81 = 0;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_WORK"])
    {
      uint64_t v81 = 1;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_HOME"])
    {
      uint64_t v81 = 2;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CONTACT_WORK"])
    {
      uint64_t v81 = 3;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CONTACT_HOME"])
    {
      uint64_t v81 = 4;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CONTACT_OTHER"])
    {
      uint64_t v81 = 5;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_POI"])
    {
      uint64_t v81 = 6;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_ADDRESS"])
    {
      uint64_t v81 = 7;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_UNKNOWN"])
    {
      uint64_t v81 = 8;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CUSTOM"])
    {
      uint64_t v81 = 9;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_SCHOOL"])
    {
      uint64_t v81 = 10;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CONTACT_SCHOOL"])
    {
      uint64_t v81 = 11;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_PERSON_LOCATION"])
    {
      uint64_t v81 = 12;
    }
    else if ([v80 isEqualToString:@"WAYPOINT_CONTACT_CUSTOM_LABEL_ADDRESS"])
    {
      uint64_t v81 = 13;
    }
    else
    {
      uint64_t v81 = 0;
    }

    goto LABEL_204;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v81 = [v79 intValue];
LABEL_204:
    [v6 setDestinationType:v81];
  }

  if (a3) {
    v82 = @"includeCrossLanguagePhonetics";
  }
  else {
    v82 = @"include_cross_language_phonetics";
  }
  v83 = [v5 objectForKeyedSubscript:v82];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeCrossLanguagePhonetics:", objc_msgSend(v83, "BOOLValue"));
  }

  if (a3) {
    v84 = @"directZilchByLaneFlowlines";
  }
  else {
    v84 = @"direct_zilch_by_lane_flowlines";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setDirectZilchByLaneFlowlines:", objc_msgSend(v85, "BOOLValue"));
  }

  if (a3) {
    v86 = @"includeLaneWidths";
  }
  else {
    v86 = @"include_lane_widths";
  }
  id v87 = [v5 objectForKeyedSubscript:v86];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeLaneWidths:", objc_msgSend(v87, "BOOLValue"));
  }

  if (a3) {
    v88 = @"initialPromptType";
  }
  else {
    v88 = @"initial_prompt_type";
  }
  v89 = [v5 objectForKeyedSubscript:v88];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v103 = v89;
    id v90 = v89;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v106 objects:v122 count:16];
    if (!v91) {
      goto LABEL_239;
    }
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v107;
    while (1)
    {
      for (uint64_t k = 0; k != v92; ++k)
      {
        if (*(void *)v107 != v93) {
          objc_enumerationMutation(v90);
        }
        v95 = *(void **)(*((void *)&v106 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v96 = v95;
          if ([v96 isEqualToString:@"PROMPT_UNKNOWN"]) {
            uint64_t v97 = 0;
          }
          else {
            uint64_t v97 = [v96 isEqualToString:@"PROMPT_DISCOVER_INCIDENTS"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v97 = [v95 intValue];
        }
        [v6 addInitialPromptType:v97];
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v106 objects:v122 count:16];
      if (!v92)
      {
LABEL_239:

        id v5 = v105;
        a3 = v104;
        v89 = v103;
        break;
      }
    }
  }

  if (a3) {
    v98 = @"includeCellularCoverage";
  }
  else {
    v98 = @"include_cellular_coverage";
  }
  v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v6, "setIncludeCellularCoverage:", objc_msgSend(v99, "BOOLValue"));
  }

  a1 = v6;
LABEL_246:

  return a1;
}

- (GEORouteAttributes)initWithJSON:(id)a3
{
  return (GEORouteAttributes *)-[GEORouteAttributes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteAttributesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteAttributesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteAttributesIsDirty((uint64_t)self) & 1) == 0)
  {
    id v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_71;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORouteAttributes *)self readAll:0];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x10) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_phoneticLocaleIdentifier) {
    PBDataWriterWriteStringField();
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 1) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v7 & 1) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterPlaceMark();
  GEOTimepointWriteTo((uint64_t)&self->_timepoint);
  PBDataWriterRecallMark();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
  if (self->_additionalTransportTypes.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_additionalTransportTypes.count);
  }
  if (self->_automobileOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cyclingOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_transitOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_walkingOptions) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_uiContexts.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_uiContexts.count);
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v10 = self->_flags;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v10 = self->_flags;
  }
  if ((*(unsigned char *)&v10 & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_destinationInfo) {
    PBDataWriterWriteSubmessage();
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v11 = self->_flags;
    if ((*(_DWORD *)&v11 & 0x20000) == 0)
    {
LABEL_43:
      if ((*(unsigned char *)&v11 & 0x40) == 0) {
        goto LABEL_44;
      }
LABEL_68:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x20000) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteBOOLField();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x40) != 0) {
    goto LABEL_68;
  }
LABEL_44:
  if ((*(_DWORD *)&v11 & 0x40000) != 0) {
LABEL_45:
  }
    PBDataWriterWriteBOOLField();
LABEL_46:
  if (self->_initialPromptTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_initialPromptTypes.count);
  }
  if (*((unsigned char *)&self->_flags + 2)) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_71:
}

- (void)copyTo:(id)a3
{
  id v20 = (id *)a3;
  [(GEORouteAttributes *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 42) = self->_readerMarkPos;
  *((_DWORD *)v20 + 43) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v20;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    *((_DWORD *)v20 + 47) = self->_mainTransportType;
    *((_DWORD *)v20 + 54) |= 8u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v20 + 206) = self->_includePhonetics;
  *((_DWORD *)v20 + 54) |= 0x1000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v20 + 205) = self->_includeManeuverIcons;
  *((_DWORD *)v20 + 54) |= 0x800u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v20 + 209) = self->_includeZilchPoints;
  *((_DWORD *)v20 + 54) |= 0x8000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)v20 + 213) = self->_includeRoutingPathLeg;
  *((_DWORD *)v20 + 54) |= 0x80000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)v20 + 202) = self->_includeContingencyRoutes;
  *((_DWORD *)v20 + 54) |= 0x100u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((unsigned char *)v20 + 204) = self->_includeLaneGuidance;
  *((_DWORD *)v20 + 54) |= 0x400u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_62:
  *((_DWORD *)v20 + 45) = self->_basicPointsToBeIncluded;
  *((_DWORD *)v20 + 54) |= 2u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v20 + 48) = self->_trafficType;
    *((_DWORD *)v20 + 54) |= 0x10u;
  }
LABEL_11:
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v20, "setPhoneticLocaleIdentifier:");
    id v4 = v20;
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 207) = self->_includeTrafficAlongRoute;
    *((_DWORD *)v4 + 54) |= 0x2000u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_16;
      }
      goto LABEL_66;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_15;
  }
  id v19 = *(void **)&self->_timepoint._type;
  *((_OWORD *)v4 + 6) = *(_OWORD *)&self->_timepoint._currentUserTime;
  v4[14] = v19;
  *((_DWORD *)v4 + 54) |= 1u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_67:
    *((unsigned char *)v4 + 208) = self->_includeTrafficIncidents;
    *((_DWORD *)v4 + 54) |= 0x4000u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_66:
  *((unsigned char *)v4 + 203) = self->_includeHistoricTravelTime;
  *((_DWORD *)v4 + 54) |= 0x200u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x4000) != 0) {
    goto LABEL_67;
  }
LABEL_17:
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 49) = self->_walkingLimitMeters;
    *((_DWORD *)v4 + 54) |= 0x20u;
  }
LABEL_19:
  if ([(GEORouteAttributes *)self additionalTransportTypesCount])
  {
    [v20 clearAdditionalTransportTypes];
    unint64_t v7 = [(GEORouteAttributes *)self additionalTransportTypesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        objc_msgSend(v20, "addAdditionalTransportType:", -[GEORouteAttributes additionalTransportTypeAtIndex:](self, "additionalTransportTypeAtIndex:", i));
    }
  }
  if (self->_automobileOptions) {
    objc_msgSend(v20, "setAutomobileOptions:");
  }
  if (self->_cyclingOptions) {
    objc_msgSend(v20, "setCyclingOptions:");
  }
  if (self->_transitOptions) {
    objc_msgSend(v20, "setTransitOptions:");
  }
  if (self->_walkingOptions) {
    objc_msgSend(v20, "setWalkingOptions:");
  }
  if ([(GEORouteAttributes *)self uiContextsCount])
  {
    [v20 clearUiContexts];
    unint64_t v10 = [(GEORouteAttributes *)self uiContextsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v20, "addUiContext:", -[GEORouteAttributes uiContextAtIndex:](self, "uiContextAtIndex:", j));
    }
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v13 = self->_flags;
  v14 = v20;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    *((unsigned char *)v20 + 214) = self->_useMetricThreshold;
    *((_DWORD *)v20 + 54) |= 0x100000u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v13 = self->_flags;
  }
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    *((unsigned char *)v20 + 201) = self->_enableExperimentalMode;
    *((_DWORD *)v20 + 54) |= 0x80u;
  }
  if (self->_destinationInfo)
  {
    objc_msgSend(v20, "setDestinationInfo:");
    v14 = v20;
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    *((_DWORD *)v14 + 46) = self->_destinationType;
    *((_DWORD *)v14 + 54) |= 4u;
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v15 = self->_flags;
    if ((*(_DWORD *)&v15 & 0x20000) == 0)
    {
LABEL_43:
      if ((*(unsigned char *)&v15 & 0x40) == 0) {
        goto LABEL_44;
      }
LABEL_71:
      *((unsigned char *)v14 + 200) = self->_directZilchByLaneFlowlines;
      *((_DWORD *)v14 + 54) |= 0x40u;
      if ((*(_DWORD *)&self->_flags & 0x40000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x20000) == 0)
  {
    goto LABEL_43;
  }
  *((unsigned char *)v14 + 211) = self->_includeCrossLanguagePhonetics;
  *((_DWORD *)v14 + 54) |= 0x20000u;
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v15 = self->_flags;
  if ((*(unsigned char *)&v15 & 0x40) != 0) {
    goto LABEL_71;
  }
LABEL_44:
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
LABEL_45:
    *((unsigned char *)v14 + 212) = self->_includeLaneWidths;
    *((_DWORD *)v14 + 54) |= 0x40000u;
  }
LABEL_46:
  if ([(GEORouteAttributes *)self initialPromptTypesCount])
  {
    [v20 clearInitialPromptTypes];
    unint64_t v16 = [(GEORouteAttributes *)self initialPromptTypesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t k = 0; k != v17; ++k)
        objc_msgSend(v20, "addInitialPromptType:", -[GEORouteAttributes initialPromptTypeAtIndex:](self, "initialPromptTypeAtIndex:", k));
    }
  }
  if (*((unsigned char *)&self->_flags + 2))
  {
    *((unsigned char *)v20 + 210) = self->_includeCellularCoverage;
    *((_DWORD *)v20 + 54) |= 0x10000u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_171;
  }
  [(GEORouteAttributes *)self readAll:1];
  [v4 readAll:1];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 54);
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mainTransportType != *((_DWORD *)v4 + 47)) {
      goto LABEL_171;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0) {
      goto LABEL_171;
    }
    if (self->_includePhonetics)
    {
      if (!*((unsigned char *)v4 + 206)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 206))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0) {
      goto LABEL_171;
    }
    if (self->_includeManeuverIcons)
    {
      if (!*((unsigned char *)v4 + 205)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 205))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeZilchPoints)
    {
      if (!*((unsigned char *)v4 + 209)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 209))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeRoutingPathLeg)
    {
      if (!*((unsigned char *)v4 + 213)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 213))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_171;
    }
    if (self->_includeContingencyRoutes)
    {
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 202))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_171;
    }
    if (self->_includeLaneGuidance)
    {
      if (!*((unsigned char *)v4 + 204)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 204))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_171;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_basicPointsToBeIncluded != *((_DWORD *)v4 + 45)) {
      goto LABEL_171;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_171;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_trafficType != *((_DWORD *)v4 + 48)) {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_171;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:")) {
      goto LABEL_171;
    }
    $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 54);
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeTrafficAlongRoute)
    {
      if (!*((unsigned char *)v4 + 207)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 207))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_171;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_171;
    }
    BOOL v8 = *(void *)&self->_timepoint._currentUserTime == *((void *)v4 + 12)
      && *(void *)&self->_timepoint._time == *((void *)v4 + 13);
    if (!v8 || *(void *)&self->_timepoint._type != *((void *)v4 + 14)) {
      goto LABEL_171;
    }
  }
  else if (v6)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_171;
    }
    if (self->_includeHistoricTravelTime)
    {
      if (!*((unsigned char *)v4 + 203)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 203))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeTrafficIncidents)
    {
      if (!*((unsigned char *)v4 + 208)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 208))
    {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_walkingLimitMeters != *((_DWORD *)v4 + 49)) {
      goto LABEL_171;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_171;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_171;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((void *)v4 + 15))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:")) {
      goto LABEL_171;
    }
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((void *)v4 + 16))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:")) {
      goto LABEL_171;
    }
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((void *)v4 + 19))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:")) {
      goto LABEL_171;
    }
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((void *)v4 + 20))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:")) {
      goto LABEL_171;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_171;
  }
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v14 = self->_flags;
  int v15 = *((_DWORD *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0) {
      goto LABEL_171;
    }
    if (self->_useMetricThreshold)
    {
      if (!*((unsigned char *)v4 + 214)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 214))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0) {
      goto LABEL_171;
    }
    if (self->_enableExperimentalMode)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_171;
  }
  destinationInfo = self->_destinationInfo;
  if ((unint64_t)destinationInfo | *((void *)v4 + 17))
  {
    if (!-[GEOWaypointNameProperties isEqual:](destinationInfo, "isEqual:")) {
      goto LABEL_171;
    }
    $F4D580EDFB4761538EFAA3AFFA5BEEEF v14 = self->_flags;
    int v15 = *((_DWORD *)v4 + 54);
  }
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_destinationType != *((_DWORD *)v4 + 46)) {
      goto LABEL_171;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeCrossLanguagePhonetics)
    {
      if (!*((unsigned char *)v4 + 211)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 211))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_171;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0) {
      goto LABEL_171;
    }
    if (self->_directZilchByLaneFlowlines)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_171;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0) {
      goto LABEL_171;
    }
    if (self->_includeLaneWidths)
    {
      if (!*((unsigned char *)v4 + 212)) {
        goto LABEL_171;
      }
    }
    else if (*((unsigned char *)v4 + 212))
    {
      goto LABEL_171;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_171;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_171;
  }
  int v17 = *((_DWORD *)v4 + 54);
  if (*((unsigned char *)&self->_flags + 2))
  {
    if ((v17 & 0x10000) != 0)
    {
      if (self->_includeCellularCoverage)
      {
        if (!*((unsigned char *)v4 + 210)) {
          goto LABEL_171;
        }
      }
      else if (*((unsigned char *)v4 + 210))
      {
        goto LABEL_171;
      }
      BOOL v18 = 1;
      goto LABEL_172;
    }
LABEL_171:
    BOOL v18 = 0;
    goto LABEL_172;
  }
  BOOL v18 = (v17 & 0x10000) == 0;
LABEL_172:

  return v18;
}

- (unint64_t)hash
{
  [(GEORouteAttributes *)self readAll:1];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    uint64_t v38 = 2654435761 * self->_mainTransportType;
    if ((*(_WORD *)&flags & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v37 = 2654435761 * self->_includePhonetics;
      if ((*(_WORD *)&flags & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(_WORD *)&flags & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v37 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_includeManeuverIcons;
    if ((*(_WORD *)&flags & 0x8000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v36 = 0;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
LABEL_5:
    uint64_t v35 = 2654435761 * self->_includeZilchPoints;
    if ((*(_DWORD *)&flags & 0x80000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
LABEL_6:
    uint64_t v34 = 2654435761 * self->_includeRoutingPathLeg;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v34 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_7:
    uint64_t v33 = 2654435761 * self->_includeContingencyRoutes;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v33 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_8:
    uint64_t v32 = 2654435761 * self->_includeLaneGuidance;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v31 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v32 = 0;
  if ((*(unsigned char *)&flags & 2) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v31 = 2654435761 * self->_basicPointsToBeIncluded;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
LABEL_10:
    uint64_t v30 = 2654435761 * self->_trafficType;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v30 = 0;
LABEL_20:
  NSUInteger v29 = [(NSString *)self->_phoneticLocaleIdentifier hash];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    uint64_t v28 = 2654435761 * self->_includeTrafficAlongRoute;
    if (*(unsigned char *)&v4)
    {
LABEL_22:
      uint64_t v27 = PBHashBytes();
      $F4D580EDFB4761538EFAA3AFFA5BEEEF v4 = self->_flags;
      if ((*(_WORD *)&v4 & 0x200) != 0) {
        goto LABEL_23;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if (*(unsigned char *)&v4) {
      goto LABEL_22;
    }
  }
  uint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_23:
    uint64_t v26 = 2654435761 * self->_includeHistoricTravelTime;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_30;
  }
LABEL_28:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  uint64_t v25 = 2654435761 * self->_includeTrafficIncidents;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_25:
    uint64_t v24 = 2654435761 * self->_walkingLimitMeters;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v24 = 0;
LABEL_31:
  uint64_t v23 = PBRepeatedInt32Hash();
  unint64_t v22 = [(GEOAutomobileOptions *)self->_automobileOptions hash];
  unint64_t v21 = [(GEOCyclingOptions *)self->_cyclingOptions hash];
  unint64_t v20 = [(GEOTransitOptions *)self->_transitOptions hash];
  unint64_t v19 = [(GEOWalkingOptions *)self->_walkingOptions hash];
  uint64_t v17 = PBRepeatedInt32Hash();
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v5 = self->_flags;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v6 = 2654435761 * self->_useMetricThreshold;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0)
    {
LABEL_33:
      uint64_t v7 = 2654435761 * self->_enableExperimentalMode;
      goto LABEL_36;
    }
  }
  uint64_t v7 = 0;
LABEL_36:
  unint64_t v8 = [(GEOWaypointNameProperties *)self->_destinationInfo hash];
  $F4D580EDFB4761538EFAA3AFFA5BEEEF v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_destinationType;
    if ((*(_DWORD *)&v9 & 0x20000) != 0)
    {
LABEL_38:
      uint64_t v11 = 2654435761 * self->_includeCrossLanguagePhonetics;
      if ((*(unsigned char *)&v9 & 0x40) != 0) {
        goto LABEL_39;
      }
LABEL_43:
      uint64_t v12 = 0;
      if ((*(_DWORD *)&v9 & 0x40000) != 0) {
        goto LABEL_40;
      }
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_DWORD *)&v9 & 0x20000) != 0) {
      goto LABEL_38;
    }
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&v9 & 0x40) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v12 = 2654435761 * self->_directZilchByLaneFlowlines;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
LABEL_40:
    uint64_t v13 = 2654435761 * self->_includeLaneWidths;
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v13 = 0;
LABEL_45:
  uint64_t v14 = PBRepeatedInt32Hash();
  if (*((unsigned char *)&self->_flags + 2)) {
    uint64_t v15 = 2654435761 * self->_includeCellularCoverage;
  }
  else {
    uint64_t v15 = 0;
  }
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v29 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v31 = a3;
  [v31 readAll:0];
  id v4 = v31;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 8) != 0)
  {
    self->_mainTransportType = *((_DWORD *)v31 + 47);
    *(_DWORD *)&self->_flags |= 8u;
    int v5 = *((_DWORD *)v31 + 54);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_includePhonetics = *((unsigned char *)v31 + 206);
  *(_DWORD *)&self->_flags |= 0x1000u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_includeManeuverIcons = *((unsigned char *)v31 + 205);
  *(_DWORD *)&self->_flags |= 0x800u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x8000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_includeZilchPoints = *((unsigned char *)v31 + 209);
  *(_DWORD *)&self->_flags |= 0x8000u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x80000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_includeRoutingPathLeg = *((unsigned char *)v31 + 213);
  *(_DWORD *)&self->_flags |= 0x80000u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_includeContingencyRoutes = *((unsigned char *)v31 + 202);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_includeLaneGuidance = *((unsigned char *)v31 + 204);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v5 = *((_DWORD *)v31 + 54);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_32:
  self->_basicPointsToBeIncluded = *((_DWORD *)v31 + 45);
  *(_DWORD *)&self->_flags |= 2u;
  if ((*((_DWORD *)v31 + 54) & 0x10) != 0)
  {
LABEL_10:
    self->_trafficType = *((_DWORD *)v31 + 48);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_11:
  if (*((void *)v31 + 18))
  {
    -[GEORouteAttributes setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
    id v4 = v31;
  }
  int v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x2000) != 0)
  {
    self->_includeTrafficAlongRoute = *((unsigned char *)v4 + 207);
    *(_DWORD *)&self->_flags |= 0x2000u;
    int v6 = *((_DWORD *)v4 + 54);
    if ((v6 & 1) == 0)
    {
LABEL_15:
      if ((v6 & 0x200) == 0) {
        goto LABEL_16;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_15;
  }
  uint64_t v13 = *((void *)v4 + 14);
  *(_OWORD *)&self->_timepoint._currentUserTime = *((_OWORD *)v4 + 6);
  *(void *)&self->_timepoint._type = v13;
  *(_DWORD *)&self->_flags |= 1u;
  int v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x200) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_includeHistoricTravelTime = *((unsigned char *)v4 + 203);
  *(_DWORD *)&self->_flags |= 0x200u;
  int v6 = *((_DWORD *)v4 + 54);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_37:
  self->_includeTrafficIncidents = *((unsigned char *)v4 + 208);
  *(_DWORD *)&self->_flags |= 0x4000u;
  if ((*((_DWORD *)v4 + 54) & 0x20) != 0)
  {
LABEL_18:
    self->_walkingLimitMeters = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_19:
  uint64_t v7 = [v4 additionalTransportTypesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEORouteAttributes addAdditionalTransportType:](self, "addAdditionalTransportType:", [v31 additionalTransportTypeAtIndex:i]);
  }
  automobileOptions = self->_automobileOptions;
  uint64_t v11 = v31;
  uint64_t v12 = *((void *)v31 + 15);
  if (automobileOptions)
  {
    if (!v12) {
      goto LABEL_42;
    }
    -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_42;
    }
    -[GEORouteAttributes setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  uint64_t v11 = v31;
LABEL_42:
  cyclingOptions = self->_cyclingOptions;
  uint64_t v15 = v11[16];
  if (cyclingOptions)
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[GEORouteAttributes setCyclingOptions:](self, "setCyclingOptions:");
  }
  uint64_t v11 = v31;
LABEL_48:
  transitOptions = self->_transitOptions;
  uint64_t v17 = v11[19];
  if (transitOptions)
  {
    if (!v17) {
      goto LABEL_54;
    }
    -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_54;
    }
    -[GEORouteAttributes setTransitOptions:](self, "setTransitOptions:");
  }
  uint64_t v11 = v31;
LABEL_54:
  walkingOptions = self->_walkingOptions;
  uint64_t v19 = v11[20];
  if (walkingOptions)
  {
    if (!v19) {
      goto LABEL_60;
    }
    -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_60;
    }
    -[GEORouteAttributes setWalkingOptions:](self, "setWalkingOptions:");
  }
  uint64_t v11 = v31;
LABEL_60:
  uint64_t v20 = [v11 uiContextsCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t j = 0; j != v21; ++j)
      -[GEORouteAttributes addUiContext:](self, "addUiContext:", [v31 uiContextAtIndex:j]);
  }
  id v23 = v31;
  int v24 = *((_DWORD *)v31 + 54);
  if ((v24 & 0x100000) != 0)
  {
    self->_useMetricThreshold = *((unsigned char *)v31 + 214);
    *(_DWORD *)&self->_flags |= 0x100000u;
    int v24 = *((_DWORD *)v31 + 54);
  }
  if ((v24 & 0x80) != 0)
  {
    self->_enableExperimentalMode = *((unsigned char *)v31 + 201);
    *(_DWORD *)&self->_flags |= 0x80u;
  }
  destinationInfo = self->_destinationInfo;
  uint64_t v26 = *((void *)v31 + 17);
  if (destinationInfo)
  {
    if (!v26) {
      goto LABEL_73;
    }
    -[GEOWaypointNameProperties mergeFrom:](destinationInfo, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_73;
    }
    -[GEORouteAttributes setDestinationInfo:](self, "setDestinationInfo:");
  }
  id v23 = v31;
LABEL_73:
  int v27 = *((_DWORD *)v23 + 54);
  if ((v27 & 4) != 0)
  {
    self->_destinationType = *((_DWORD *)v23 + 46);
    *(_DWORD *)&self->_flags |= 4u;
    int v27 = *((_DWORD *)v23 + 54);
    if ((v27 & 0x20000) == 0)
    {
LABEL_75:
      if ((v27 & 0x40) == 0) {
        goto LABEL_76;
      }
      goto LABEL_88;
    }
  }
  else if ((v27 & 0x20000) == 0)
  {
    goto LABEL_75;
  }
  self->_includeCrossLanguagePhonetics = *((unsigned char *)v23 + 211);
  *(_DWORD *)&self->_flags |= 0x20000u;
  int v27 = *((_DWORD *)v23 + 54);
  if ((v27 & 0x40) == 0)
  {
LABEL_76:
    if ((v27 & 0x40000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_88:
  self->_directZilchByLaneFlowlines = *((unsigned char *)v23 + 200);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v23 + 54) & 0x40000) != 0)
  {
LABEL_77:
    self->_includeLaneWidths = *((unsigned char *)v23 + 212);
    *(_DWORD *)&self->_flags |= 0x40000u;
  }
LABEL_78:
  uint64_t v28 = [v23 initialPromptTypesCount];
  if (v28)
  {
    uint64_t v29 = v28;
    for (uint64_t k = 0; k != v29; ++k)
      -[GEORouteAttributes addInitialPromptType:](self, "addInitialPromptType:", [v31 initialPromptTypeAtIndex:k]);
  }
  if (*((unsigned char *)v31 + 218))
  {
    self->_includeCellularCoverage = *((unsigned char *)v31 + 210);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEORouteAttributesReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_5975);
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
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80200000;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORouteAttributes *)self readAll:0];
    [(GEOAutomobileOptions *)self->_automobileOptions clearUnknownFields:1];
    [(GEOCyclingOptions *)self->_cyclingOptions clearUnknownFields:1];
    [(GEOTransitOptions *)self->_transitOptions clearUnknownFields:1];
    [(GEOWalkingOptions *)self->_walkingOptions clearUnknownFields:1];
    destinationInfo = self->_destinationInfo;
    [(GEOWaypointNameProperties *)destinationInfo clearUnknownFields:1];
  }
}

+ (id)defaultRouteAttributes
{
  id v2 = objc_alloc_init(GEORouteAttributes);
  [(GEORouteAttributes *)v2 setRoutePointTypeForTransportType:4];
  [(GEORouteAttributes *)v2 setIncludeManeuverIcons:1];
  [(GEORouteAttributes *)v2 setTrafficType:3];
  [(GEORouteAttributes *)v2 setIncludeTrafficAlongRoute:1];
  [(GEORouteAttributes *)v2 setIncludeTrafficIncidents:1];
  [(GEORouteAttributes *)v2 setIncludeLaneGuidance:1];
  BOOL v3 = +[GEOPlatform sharedPlatform];
  if ([v3 supportsAdvancedMap]) {
    uint64_t IsEnabled = MapsFeature_IsEnabled(MapsFeaturesConfig_ShelbyvilleTerrain, off_1E9111C98);
  }
  else {
    uint64_t IsEnabled = 0;
  }

  [(GEORouteAttributes *)v2 setIncludeLaneWidths:IsEnabled];
  [(GEORouteAttributes *)v2 setDirectZilchByLaneFlowlines:IsEnabled];
  [(GEORouteAttributes *)v2 addUiContext:2];
  [(GEORouteAttributes *)v2 addUiContext:1];

  return v2;
}

- (void)buildRouteAttributes:(id)a3 queue:(id)a4 result:(id)a5
{
}

- (void)buildRouteAttributesForETAUpdateRequest:(id)a3 queue:(id)a4 result:(id)a5
{
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

@end