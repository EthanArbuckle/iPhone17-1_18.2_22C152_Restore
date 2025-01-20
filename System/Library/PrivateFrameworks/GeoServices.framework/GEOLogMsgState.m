@interface GEOLogMsgState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccount;
- (BOOL)hasActionButtonDetails;
- (BOOL)hasApplicationIdentifier;
- (BOOL)hasArpPhotoSubmission;
- (BOOL)hasArpRatingPhotoSubmission;
- (BOOL)hasArpRatingSubmission;
- (BOOL)hasCarPlay;
- (BOOL)hasCuratedCollection;
- (BOOL)hasDetailLookAroundLog;
- (BOOL)hasDeviceBase;
- (BOOL)hasDeviceConnection;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasDeviceLocale;
- (BOOL)hasDeviceSettings;
- (BOOL)hasDirectionsDetail;
- (BOOL)hasElementImpression;
- (BOOL)hasExperiments;
- (BOOL)hasExtension;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImpressionObject;
- (BOOL)hasLookAroundView;
- (BOOL)hasMapLaunch;
- (BOOL)hasMapRestore;
- (BOOL)hasMapSettings;
- (BOOL)hasMapUi;
- (BOOL)hasMapUiShown;
- (BOOL)hasMapView;
- (BOOL)hasMapViewLocation;
- (BOOL)hasMapsFeatures;
- (BOOL)hasMapsPlaceIds;
- (BOOL)hasMapsServer;
- (BOOL)hasMapsUserSettings;
- (BOOL)hasMarket;
- (BOOL)hasMuninResource;
- (BOOL)hasNavigation;
- (BOOL)hasNearbyTransit;
- (BOOL)hasOffline;
- (BOOL)hasOfflineDownload;
- (BOOL)hasPairedDevice;
- (BOOL)hasPlaceCard;
- (BOOL)hasPlaceCardRap;
- (BOOL)hasPlaceRequest;
- (BOOL)hasPlaceSummaryLayout;
- (BOOL)hasRap;
- (BOOL)hasRoute;
- (BOOL)hasRoutingSettings;
- (BOOL)hasRoutingWaypoints;
- (BOOL)hasSearchResults;
- (BOOL)hasStateOrigin;
- (BOOL)hasStateType;
- (BOOL)hasSuggestions;
- (BOOL)hasSummaryLookAroundLog;
- (BOOL)hasTapEvent;
- (BOOL)hasTileSet;
- (BOOL)hasTransit;
- (BOOL)hasTransitStep;
- (BOOL)hasUgcPhoto;
- (BOOL)hasUser;
- (BOOL)hasUserSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgState)init;
- (GEOLogMsgState)initWithData:(id)a3;
- (GEOLogMsgState)initWithDictionary:(id)a3;
- (GEOLogMsgState)initWithJSON:(id)a3;
- (GEOLogMsgStateARPPhotoSubmission)arpPhotoSubmission;
- (GEOLogMsgStateARPRatingPhotoSubmission)arpRatingPhotoSubmission;
- (GEOLogMsgStateARPRatingSubmission)arpRatingSubmission;
- (GEOLogMsgStateAccount)account;
- (GEOLogMsgStateActionButtonDetails)actionButtonDetails;
- (GEOLogMsgStateApplicationIdentifier)applicationIdentifier;
- (GEOLogMsgStateCarPlay)carPlay;
- (GEOLogMsgStateCuratedCollection)curatedCollection;
- (GEOLogMsgStateDetailLookAroundLog)detailLookAroundLog;
- (GEOLogMsgStateDeviceBase)deviceBase;
- (GEOLogMsgStateDeviceConnection)deviceConnection;
- (GEOLogMsgStateDeviceIdentifier)deviceIdentifier;
- (GEOLogMsgStateDeviceLocale)deviceLocale;
- (GEOLogMsgStateDeviceSettings)deviceSettings;
- (GEOLogMsgStateDirectionsDetail)directionsDetail;
- (GEOLogMsgStateElementImpression)elementImpression;
- (GEOLogMsgStateExperiments)experiments;
- (GEOLogMsgStateExtension)extension;
- (GEOLogMsgStateImpressionObject)impressionObject;
- (GEOLogMsgStateLookAroundView)lookAroundView;
- (GEOLogMsgStateMapLaunch)mapLaunch;
- (GEOLogMsgStateMapRestore)mapRestore;
- (GEOLogMsgStateMapSettings)mapSettings;
- (GEOLogMsgStateMapUI)mapUi;
- (GEOLogMsgStateMapUIShown)mapUiShown;
- (GEOLogMsgStateMapView)mapView;
- (GEOLogMsgStateMapViewLocation)mapViewLocation;
- (GEOLogMsgStateMapsFeatures)mapsFeatures;
- (GEOLogMsgStateMapsPlaceIds)mapsPlaceIds;
- (GEOLogMsgStateMapsServer)mapsServer;
- (GEOLogMsgStateMapsUserSettings)mapsUserSettings;
- (GEOLogMsgStateMarket)market;
- (GEOLogMsgStateMuninResource)muninResource;
- (GEOLogMsgStateNavigation)navigation;
- (GEOLogMsgStateNearbyTransit)nearbyTransit;
- (GEOLogMsgStateOffline)offline;
- (GEOLogMsgStateOfflineDownload)offlineDownload;
- (GEOLogMsgStatePairedDevice)pairedDevice;
- (GEOLogMsgStatePlaceCard)placeCard;
- (GEOLogMsgStatePlaceCardRap)placeCardRap;
- (GEOLogMsgStatePlaceRequest)placeRequest;
- (GEOLogMsgStatePlaceSummaryLayout)placeSummaryLayout;
- (GEOLogMsgStateRAP)rap;
- (GEOLogMsgStateRoute)route;
- (GEOLogMsgStateRoutingSettings)routingSettings;
- (GEOLogMsgStateRoutingWaypoints)routingWaypoints;
- (GEOLogMsgStateSearchResults)searchResults;
- (GEOLogMsgStateSuggestions)suggestions;
- (GEOLogMsgStateSummaryLookAroundLog)summaryLookAroundLog;
- (GEOLogMsgStateTapEvent)tapEvent;
- (GEOLogMsgStateTileSet)tileSet;
- (GEOLogMsgStateTransit)transit;
- (GEOLogMsgStateTransitStep)transitStep;
- (GEOLogMsgStateUGCPhoto)ugcPhoto;
- (GEOLogMsgStateUser)user;
- (GEOLogMsgStateUserSession)userSession;
- (NSString)stateOrigin;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)stateTypeAsString:(int)a3;
- (int)StringAsStateType:(id)a3;
- (int)stateType;
- (unint64_t)hash;
- (void)_readAccount;
- (void)_readActionButtonDetails;
- (void)_readApplicationIdentifier;
- (void)_readArpPhotoSubmission;
- (void)_readArpRatingPhotoSubmission;
- (void)_readArpRatingSubmission;
- (void)_readCarPlay;
- (void)_readCuratedCollection;
- (void)_readDetailLookAroundLog;
- (void)_readDeviceBase;
- (void)_readDeviceConnection;
- (void)_readDeviceIdentifier;
- (void)_readDeviceLocale;
- (void)_readDeviceSettings;
- (void)_readDirectionsDetail;
- (void)_readElementImpression;
- (void)_readExperiments;
- (void)_readExtension;
- (void)_readImpressionObject;
- (void)_readLookAroundView;
- (void)_readMapLaunch;
- (void)_readMapRestore;
- (void)_readMapSettings;
- (void)_readMapUi;
- (void)_readMapUiShown;
- (void)_readMapView;
- (void)_readMapViewLocation;
- (void)_readMapsFeatures;
- (void)_readMapsPlaceIds;
- (void)_readMapsServer;
- (void)_readMapsUserSettings;
- (void)_readMarket;
- (void)_readMuninResource;
- (void)_readNavigation;
- (void)_readNearbyTransit;
- (void)_readOffline;
- (void)_readOfflineDownload;
- (void)_readPairedDevice;
- (void)_readPlaceCard;
- (void)_readPlaceCardRap;
- (void)_readPlaceRequest;
- (void)_readPlaceSummaryLayout;
- (void)_readRap;
- (void)_readRoute;
- (void)_readRoutingSettings;
- (void)_readRoutingWaypoints;
- (void)_readSearchResults;
- (void)_readStateOrigin;
- (void)_readSuggestions;
- (void)_readSummaryLookAroundLog;
- (void)_readTapEvent;
- (void)_readTileSet;
- (void)_readTransit;
- (void)_readTransitStep;
- (void)_readUgcPhoto;
- (void)_readUser;
- (void)_readUserSession;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccount:(id)a3;
- (void)setActionButtonDetails:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setArpPhotoSubmission:(id)a3;
- (void)setArpRatingPhotoSubmission:(id)a3;
- (void)setArpRatingSubmission:(id)a3;
- (void)setCarPlay:(id)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setDetailLookAroundLog:(id)a3;
- (void)setDeviceBase:(id)a3;
- (void)setDeviceConnection:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceLocale:(id)a3;
- (void)setDeviceSettings:(id)a3;
- (void)setDirectionsDetail:(id)a3;
- (void)setElementImpression:(id)a3;
- (void)setExperiments:(id)a3;
- (void)setExtension:(id)a3;
- (void)setHasStateType:(BOOL)a3;
- (void)setImpressionObject:(id)a3;
- (void)setLookAroundView:(id)a3;
- (void)setMapLaunch:(id)a3;
- (void)setMapRestore:(id)a3;
- (void)setMapSettings:(id)a3;
- (void)setMapUi:(id)a3;
- (void)setMapUiShown:(id)a3;
- (void)setMapView:(id)a3;
- (void)setMapViewLocation:(id)a3;
- (void)setMapsFeatures:(id)a3;
- (void)setMapsPlaceIds:(id)a3;
- (void)setMapsServer:(id)a3;
- (void)setMapsUserSettings:(id)a3;
- (void)setMarket:(id)a3;
- (void)setMuninResource:(id)a3;
- (void)setNavigation:(id)a3;
- (void)setNearbyTransit:(id)a3;
- (void)setOffline:(id)a3;
- (void)setOfflineDownload:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPlaceCard:(id)a3;
- (void)setPlaceCardRap:(id)a3;
- (void)setPlaceRequest:(id)a3;
- (void)setPlaceSummaryLayout:(id)a3;
- (void)setRap:(id)a3;
- (void)setRoute:(id)a3;
- (void)setRoutingSettings:(id)a3;
- (void)setRoutingWaypoints:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setStateOrigin:(id)a3;
- (void)setStateType:(int)a3;
- (void)setSuggestions:(id)a3;
- (void)setSummaryLookAroundLog:(id)a3;
- (void)setTapEvent:(id)a3;
- (void)setTileSet:(id)a3;
- (void)setTransit:(id)a3;
- (void)setTransitStep:(id)a3;
- (void)setUgcPhoto:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserSession:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgState

- (int)stateType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $4616208CC255E1CA823F391899A05A96 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_stateType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSearchResults
{
  return self->_searchResults != 0;
}

- (void)_readSearchResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateMapSettings)mapSettings
{
  -[GEOLogMsgState _readMapSettings]((uint64_t)self);
  mapSettings = self->_mapSettings;

  return mapSettings;
}

- (BOOL)hasMapSettings
{
  return self->_mapSettings != 0;
}

- (void)_readMapSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapSettings_tags_5699);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateCarPlay)carPlay
{
  -[GEOLogMsgState _readCarPlay]((uint64_t)self);
  carPlay = self->_carPlay;

  return carPlay;
}

- (BOOL)hasCarPlay
{
  return self->_carPlay != 0;
}

- (void)_readCarPlay
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCarPlay_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
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
    if ((*((unsigned char *)&self->_flags + 7) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgState *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_stateOrigin copyWithZone:a3];
  v10 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v9;

  id v11 = [(GEOLogMsgStateUser *)self->_user copyWithZone:a3];
  v12 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v11;

  id v13 = [(GEOLogMsgStateAccount *)self->_account copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  id v15 = [(GEOLogMsgStateRAP *)self->_rap copyWithZone:a3];
  v16 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v15;

  id v17 = [(GEOLogMsgStatePlaceSummaryLayout *)self->_placeSummaryLayout copyWithZone:a3];
  v18 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v17;

  id v19 = [(GEOLogMsgStateTransitStep *)self->_transitStep copyWithZone:a3];
  v20 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v19;

  id v21 = [(GEOLogMsgStateNearbyTransit *)self->_nearbyTransit copyWithZone:a3];
  v22 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v21;

  id v23 = [(GEOLogMsgStateSearchResults *)self->_searchResults copyWithZone:a3];
  v24 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v23;

  id v25 = [(GEOLogMsgStateElementImpression *)self->_elementImpression copyWithZone:a3];
  v26 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v25;

  id v27 = [(GEOLogMsgStateImpressionObject *)self->_impressionObject copyWithZone:a3];
  v28 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v27;

  id v29 = [(GEOLogMsgStateTapEvent *)self->_tapEvent copyWithZone:a3];
  v30 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v29;

  id v31 = [(GEOLogMsgStateActionButtonDetails *)self->_actionButtonDetails copyWithZone:a3];
  v32 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v31;

  id v33 = [(GEOLogMsgStateRoutingWaypoints *)self->_routingWaypoints copyWithZone:a3];
  v34 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v33;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 484) = self->_stateType;
    *(void *)(v5 + 488) |= 1uLL;
  }
  id v35 = [(GEOLogMsgStateDeviceIdentifier *)self->_deviceIdentifier copyWithZone:a3];
  v36 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v35;

  id v37 = [(GEOLogMsgStateApplicationIdentifier *)self->_applicationIdentifier copyWithZone:a3];
  v38 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v37;

  id v39 = [(GEOLogMsgStateDeviceBase *)self->_deviceBase copyWithZone:a3];
  v40 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v39;

  id v41 = [(GEOLogMsgStateDeviceLocale *)self->_deviceLocale copyWithZone:a3];
  v42 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v41;

  id v43 = [(GEOLogMsgStateDeviceConnection *)self->_deviceConnection copyWithZone:a3];
  v44 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v43;

  id v45 = [(GEOLogMsgStateCarPlay *)self->_carPlay copyWithZone:a3];
  v46 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v45;

  id v47 = [(GEOLogMsgStatePairedDevice *)self->_pairedDevice copyWithZone:a3];
  v48 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v47;

  id v49 = [(GEOLogMsgStateExtension *)self->_extension copyWithZone:a3];
  v50 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v49;

  id v51 = [(GEOLogMsgStateDeviceSettings *)self->_deviceSettings copyWithZone:a3];
  v52 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v51;

  id v53 = [(GEOLogMsgStateMapView *)self->_mapView copyWithZone:a3];
  v54 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v53;

  id v55 = [(GEOLogMsgStateMapViewLocation *)self->_mapViewLocation copyWithZone:a3];
  v56 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v55;

  id v57 = [(GEOLogMsgStateTransit *)self->_transit copyWithZone:a3];
  v58 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v57;

  id v59 = [(GEOLogMsgStateMapSettings *)self->_mapSettings copyWithZone:a3];
  v60 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v59;

  id v61 = [(GEOLogMsgStateMapUI *)self->_mapUi copyWithZone:a3];
  v62 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v61;

  id v63 = [(GEOLogMsgStateMapUIShown *)self->_mapUiShown copyWithZone:a3];
  v64 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v63;

  id v65 = [(GEOLogMsgStateUserSession *)self->_userSession copyWithZone:a3];
  v66 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v65;

  id v67 = [(GEOLogMsgStateExperiments *)self->_experiments copyWithZone:a3];
  v68 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v67;

  id v69 = [(GEOLogMsgStatePlaceCard *)self->_placeCard copyWithZone:a3];
  v70 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v69;

  id v71 = [(GEOLogMsgStateRoute *)self->_route copyWithZone:a3];
  v72 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v71;

  id v73 = [(GEOLogMsgStateMapsServer *)self->_mapsServer copyWithZone:a3];
  v74 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v73;

  id v75 = [(GEOLogMsgStateTileSet *)self->_tileSet copyWithZone:a3];
  v76 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v75;

  id v77 = [(GEOLogMsgStatePlaceRequest *)self->_placeRequest copyWithZone:a3];
  v78 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v77;

  id v79 = [(GEOLogMsgStateNavigation *)self->_navigation copyWithZone:a3];
  v80 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v79;

  id v81 = [(GEOLogMsgStateMapRestore *)self->_mapRestore copyWithZone:a3];
  v82 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v81;

  id v83 = [(GEOLogMsgStateSuggestions *)self->_suggestions copyWithZone:a3];
  v84 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v83;

  id v85 = [(GEOLogMsgStateOffline *)self->_offline copyWithZone:a3];
  v86 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v85;

  id v87 = [(GEOLogMsgStateSummaryLookAroundLog *)self->_summaryLookAroundLog copyWithZone:a3];
  v88 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v87;

  id v89 = [(GEOLogMsgStateDetailLookAroundLog *)self->_detailLookAroundLog copyWithZone:a3];
  v90 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v89;

  id v91 = [(GEOLogMsgStateLookAroundView *)self->_lookAroundView copyWithZone:a3];
  v92 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v91;

  id v93 = [(GEOLogMsgStateMuninResource *)self->_muninResource copyWithZone:a3];
  v94 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v93;

  id v95 = [(GEOLogMsgStateMapLaunch *)self->_mapLaunch copyWithZone:a3];
  v96 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v95;

  id v97 = [(GEOLogMsgStateCuratedCollection *)self->_curatedCollection copyWithZone:a3];
  v98 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v97;

  id v99 = [(GEOLogMsgStateUGCPhoto *)self->_ugcPhoto copyWithZone:a3];
  v100 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v99;

  id v101 = [(GEOLogMsgStateDirectionsDetail *)self->_directionsDetail copyWithZone:a3];
  v102 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v101;

  id v103 = [(GEOLogMsgStateMarket *)self->_market copyWithZone:a3];
  v104 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v103;

  id v105 = [(GEOLogMsgStateRoutingSettings *)self->_routingSettings copyWithZone:a3];
  v106 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v105;

  id v107 = [(GEOLogMsgStateMapsFeatures *)self->_mapsFeatures copyWithZone:a3];
  v108 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v107;

  id v109 = [(GEOLogMsgStateMapsUserSettings *)self->_mapsUserSettings copyWithZone:a3];
  v110 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v109;

  id v111 = [(GEOLogMsgStateARPPhotoSubmission *)self->_arpPhotoSubmission copyWithZone:a3];
  v112 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v111;

  id v113 = [(GEOLogMsgStateARPRatingSubmission *)self->_arpRatingSubmission copyWithZone:a3];
  v114 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v113;

  id v115 = [(GEOLogMsgStateARPRatingPhotoSubmission *)self->_arpRatingPhotoSubmission copyWithZone:a3];
  v116 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v115;

  id v117 = [(GEOLogMsgStateMapsPlaceIds *)self->_mapsPlaceIds copyWithZone:a3];
  v118 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v117;

  id v119 = [(GEOLogMsgStatePlaceCardRap *)self->_placeCardRap copyWithZone:a3];
  v120 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v119;

  id v121 = [(GEOLogMsgStateOfflineDownload *)self->_offlineDownload copyWithZone:a3];
  id v8 = *(id *)(v5 + 296);
  *(void *)(v5 + 296) = v121;
LABEL_8:

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStateIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgState *)self readAll:0];
    if (self->_stateOrigin) {
      PBDataWriterWriteStringField();
    }
    if (self->_user) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_account) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rap) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeSummaryLayout) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitStep) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_nearbyTransit) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_searchResults) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_elementImpression) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_impressionObject) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tapEvent) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_actionButtonDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routingWaypoints) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_deviceIdentifier) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_applicationIdentifier) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_deviceBase) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_deviceLocale) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_deviceConnection) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_carPlay) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_pairedDevice) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_extension) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_deviceSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapView) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapViewLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transit) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapUi) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapUiShown) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_userSession) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_experiments) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeCard) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_route) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsServer) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_tileSet) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeRequest) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_navigation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapRestore) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_suggestions) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_offline) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_summaryLookAroundLog) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_detailLookAroundLog) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_lookAroundView) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_muninResource) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapLaunch) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_curatedCollection) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_ugcPhoto) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_directionsDetail) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_market) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_routingSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsFeatures) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsUserSettings) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arpPhotoSubmission) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arpRatingSubmission) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_arpRatingPhotoSubmission) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapsPlaceIds) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeCardRap) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_offlineDownload) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_6016;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_6017;
    }
    GEOLogMsgStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgState;
  v2 = [(GEOLogMsgState *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setStateType:(int)a3
{
  *(void *)&self->_flags |= 0x400000000000001uLL;
  self->_stateType = a3;
}

- (void)setPlaceRequest:(id)a3
{
  *(void *)&self->_flags |= 0x400020000000000uLL;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (GEOLogMsgStatePlaceRequest)placeRequest
{
  -[GEOLogMsgState _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return placeRequest;
}

- (void)_readPlaceRequest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceRequest_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateLookAroundView)lookAroundView
{
  -[GEOLogMsgState _readLookAroundView]((uint64_t)self);
  lookAroundView = self->_lookAroundView;

  return lookAroundView;
}

- (void)_readLookAroundView
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLookAroundView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceRequest
{
  return self->_placeRequest != 0;
}

- (BOOL)hasLookAroundView
{
  return self->_lookAroundView != 0;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (GEOLogMsgStateMapView)mapView
{
  -[GEOLogMsgState _readMapView]((uint64_t)self);
  mapView = self->_mapView;

  return mapView;
}

- (void)_readMapView
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapView_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateUserSession)userSession
{
  -[GEOLogMsgState _readUserSession]((uint64_t)self);
  userSession = self->_userSession;

  return userSession;
}

- (void)_readUserSession
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 495) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserSession_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateMapUI)mapUi
{
  -[GEOLogMsgState _readMapUi]((uint64_t)self);
  mapUi = self->_mapUi;

  return mapUi;
}

- (void)_readMapUi
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapUi_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)setUserSession:(id)a3
{
  *(void *)&self->_flags |= 0x500000000000000uLL;
  objc_storeStrong((id *)&self->_userSession, a3);
}

- (GEOLogMsgStateMapUIShown)mapUiShown
{
  -[GEOLogMsgState _readMapUiShown]((uint64_t)self);
  mapUiShown = self->_mapUiShown;

  return mapUiShown;
}

- (void)_readMapUiShown
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapUiShown_tags_5700);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateDeviceLocale)deviceLocale
{
  -[GEOLogMsgState _readDeviceLocale]((uint64_t)self);
  deviceLocale = self->_deviceLocale;

  return deviceLocale;
}

- (void)_readDeviceLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLocale_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)setOffline:(id)a3
{
  *(void *)&self->_flags |= 0x400002000000000uLL;
  objc_storeStrong((id *)&self->_offline, a3);
}

- (void)setMarket:(id)a3
{
  *(void *)&self->_flags |= 0x400000100000000uLL;
  objc_storeStrong((id *)&self->_market, a3);
}

- (void)setDeviceLocale:(id)a3
{
  *(void *)&self->_flags |= 0x400000000002000uLL;
  objc_storeStrong((id *)&self->_deviceLocale, a3);
}

- (void)setDeviceConnection:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000800uLL;
  objc_storeStrong((id *)&self->_deviceConnection, a3);
}

- (void)setCarPlay:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000080uLL;
  objc_storeStrong((id *)&self->_carPlay, a3);
}

- (void)setMapViewLocation:(id)a3
{
  *(void *)&self->_flags |= 0x400000004000000uLL;
  objc_storeStrong((id *)&self->_mapViewLocation, a3);
}

- (GEOLogMsgStateDeviceIdentifier)deviceIdentifier
{
  -[GEOLogMsgState _readDeviceIdentifier]((uint64_t)self);
  deviceIdentifier = self->_deviceIdentifier;

  return deviceIdentifier;
}

- (void)_readDeviceIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateExperiments)experiments
{
  -[GEOLogMsgState _readExperiments]((uint64_t)self);
  experiments = self->_experiments;

  return experiments;
}

- (void)_readExperiments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExperiments_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)setMapView:(id)a3
{
  *(void *)&self->_flags |= 0x400000008000000uLL;
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void)setMapUiShown:(id)a3
{
  *(void *)&self->_flags |= 0x400000001000000uLL;
  objc_storeStrong((id *)&self->_mapUiShown, a3);
}

- (void)setMapUi:(id)a3
{
  *(void *)&self->_flags |= 0x400000002000000uLL;
  objc_storeStrong((id *)&self->_mapUi, a3);
}

- (void)setMapSettings:(id)a3
{
  *(void *)&self->_flags |= 0x400000000800000uLL;
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (void)setExperiments:(id)a3
{
  *(void *)&self->_flags |= 0x400000000020000uLL;
  objc_storeStrong((id *)&self->_experiments, a3);
}

- (void)setDeviceSettings:(id)a3
{
  *(void *)&self->_flags |= 0x400000000004000uLL;
  objc_storeStrong((id *)&self->_deviceSettings, a3);
}

- (void)setDeviceIdentifier:(id)a3
{
  *(void *)&self->_flags |= 0x400000000001000uLL;
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_ugcPhoto, 0);
  objc_storeStrong((id *)&self->_transit, 0);
  objc_storeStrong((id *)&self->_transitStep, 0);
  objc_storeStrong((id *)&self->_tileSet, 0);
  objc_storeStrong((id *)&self->_tapEvent, 0);
  objc_storeStrong((id *)&self->_summaryLookAroundLog, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_stateOrigin, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_routingSettings, 0);
  objc_storeStrong((id *)&self->_routingWaypoints, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_rap, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayout, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_storeStrong((id *)&self->_placeCardRap, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_offline, 0);
  objc_storeStrong((id *)&self->_offlineDownload, 0);
  objc_storeStrong((id *)&self->_nearbyTransit, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_storeStrong((id *)&self->_muninResource, 0);
  objc_storeStrong((id *)&self->_market, 0);
  objc_storeStrong((id *)&self->_mapsUserSettings, 0);
  objc_storeStrong((id *)&self->_mapsServer, 0);
  objc_storeStrong((id *)&self->_mapsPlaceIds, 0);
  objc_storeStrong((id *)&self->_mapsFeatures, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_mapViewLocation, 0);
  objc_storeStrong((id *)&self->_mapUi, 0);
  objc_storeStrong((id *)&self->_mapUiShown, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_mapRestore, 0);
  objc_storeStrong((id *)&self->_mapLaunch, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_impressionObject, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_experiments, 0);
  objc_storeStrong((id *)&self->_elementImpression, 0);
  objc_storeStrong((id *)&self->_directionsDetail, 0);
  objc_storeStrong((id *)&self->_deviceSettings, 0);
  objc_storeStrong((id *)&self->_deviceLocale, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_deviceBase, 0);
  objc_storeStrong((id *)&self->_detailLookAroundLog, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_arpRatingSubmission, 0);
  objc_storeStrong((id *)&self->_arpRatingPhotoSubmission, 0);
  objc_storeStrong((id *)&self->_arpPhotoSubmission, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_actionButtonDetails, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOLogMsgStateOffline)offline
{
  -[GEOLogMsgState _readOffline]((uint64_t)self);
  offline = self->_offline;

  return offline;
}

- (void)_readOffline
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOffline_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateDeviceConnection)deviceConnection
{
  -[GEOLogMsgState _readDeviceConnection]((uint64_t)self);
  deviceConnection = self->_deviceConnection;

  return deviceConnection;
}

- (void)_readDeviceConnection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceConnection_tags_5697);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateUser)user
{
  -[GEOLogMsgState _readUser]((uint64_t)self);
  user = self->_user;

  return user;
}

- (void)_readUser
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 495) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUser_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateMarket)market
{
  -[GEOLogMsgState _readMarket]((uint64_t)self);
  market = self->_market;

  return market;
}

- (void)_readMarket
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMarket_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateApplicationIdentifier)applicationIdentifier
{
  -[GEOLogMsgState _readApplicationIdentifier]((uint64_t)self);
  applicationIdentifier = self->_applicationIdentifier;

  return applicationIdentifier;
}

- (void)_readApplicationIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readApplicationIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (GEOLogMsgStateDeviceSettings)deviceSettings
{
  -[GEOLogMsgState _readDeviceSettings]((uint64_t)self);
  deviceSettings = self->_deviceSettings;

  return deviceSettings;
}

- (void)_readDeviceSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSettings_tags_5698);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void)setUser:(id)a3
{
  *(void *)&self->_flags |= 0x600000000000000uLL;
  objc_storeStrong((id *)&self->_user, a3);
}

- (void)setApplicationIdentifier:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000008uLL;
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (GEOLogMsgState)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgState;
  id v3 = [(GEOLogMsgState *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readStateOrigin
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStateOrigin_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasStateOrigin
{
  return self->_stateOrigin != 0;
}

- (NSString)stateOrigin
{
  -[GEOLogMsgState _readStateOrigin]((uint64_t)self);
  stateOrigin = self->_stateOrigin;

  return stateOrigin;
}

- (void)setStateOrigin:(id)a3
{
  *(void *)&self->_flags |= 0x401000000000000uLL;
  objc_storeStrong((id *)&self->_stateOrigin, a3);
}

- (BOOL)hasUser
{
  return self->_user != 0;
}

- (void)_readAccount
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccount_tags_5696);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAccount
{
  return self->_account != 0;
}

- (GEOLogMsgStateAccount)account
{
  -[GEOLogMsgState _readAccount]((uint64_t)self);
  account = self->_account;

  return account;
}

- (void)setAccount:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000002uLL;
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)_readRap
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRap_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRap
{
  return self->_rap != 0;
}

- (GEOLogMsgStateRAP)rap
{
  -[GEOLogMsgState _readRap]((uint64_t)self);
  rap = self->_rap;

  return rap;
}

- (void)setRap:(id)a3
{
  *(void *)&self->_flags |= 0x400080000000000uLL;
  objc_storeStrong((id *)&self->_rap, a3);
}

- (void)_readPlaceSummaryLayout
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSummaryLayout_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceSummaryLayout
{
  return self->_placeSummaryLayout != 0;
}

- (GEOLogMsgStatePlaceSummaryLayout)placeSummaryLayout
{
  -[GEOLogMsgState _readPlaceSummaryLayout]((uint64_t)self);
  placeSummaryLayout = self->_placeSummaryLayout;

  return placeSummaryLayout;
}

- (void)setPlaceSummaryLayout:(id)a3
{
  *(void *)&self->_flags |= 0x400040000000000uLL;
  objc_storeStrong((id *)&self->_placeSummaryLayout, a3);
}

- (void)_readTransitStep
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitStep_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTransitStep
{
  return self->_transitStep != 0;
}

- (GEOLogMsgStateTransitStep)transitStep
{
  -[GEOLogMsgState _readTransitStep]((uint64_t)self);
  transitStep = self->_transitStep;

  return transitStep;
}

- (void)setTransitStep:(id)a3
{
  *(void *)&self->_flags |= 0x420000000000000uLL;
  objc_storeStrong((id *)&self->_transitStep, a3);
}

- (void)_readNearbyTransit
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbyTransit_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasNearbyTransit
{
  return self->_nearbyTransit != 0;
}

- (GEOLogMsgStateNearbyTransit)nearbyTransit
{
  -[GEOLogMsgState _readNearbyTransit]((uint64_t)self);
  nearbyTransit = self->_nearbyTransit;

  return nearbyTransit;
}

- (void)setNearbyTransit:(id)a3
{
  *(void *)&self->_flags |= 0x400000800000000uLL;
  objc_storeStrong((id *)&self->_nearbyTransit, a3);
}

- (GEOLogMsgStateSearchResults)searchResults
{
  -[GEOLogMsgState _readSearchResults]((uint64_t)self);
  searchResults = self->_searchResults;

  return searchResults;
}

- (void)setSearchResults:(id)a3
{
  *(void *)&self->_flags |= 0x400800000000000uLL;
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void)_readElementImpression
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readElementImpression_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasElementImpression
{
  return self->_elementImpression != 0;
}

- (GEOLogMsgStateElementImpression)elementImpression
{
  -[GEOLogMsgState _readElementImpression]((uint64_t)self);
  elementImpression = self->_elementImpression;

  return elementImpression;
}

- (void)setElementImpression:(id)a3
{
  *(void *)&self->_flags |= 0x400000000010000uLL;
  objc_storeStrong((id *)&self->_elementImpression, a3);
}

- (void)_readImpressionObject
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpressionObject_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasImpressionObject
{
  return self->_impressionObject != 0;
}

- (GEOLogMsgStateImpressionObject)impressionObject
{
  -[GEOLogMsgState _readImpressionObject]((uint64_t)self);
  impressionObject = self->_impressionObject;

  return impressionObject;
}

- (void)setImpressionObject:(id)a3
{
  *(void *)&self->_flags |= 0x400000000080000uLL;
  objc_storeStrong((id *)&self->_impressionObject, a3);
}

- (void)_readTapEvent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTapEvent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTapEvent
{
  return self->_tapEvent != 0;
}

- (GEOLogMsgStateTapEvent)tapEvent
{
  -[GEOLogMsgState _readTapEvent]((uint64_t)self);
  tapEvent = self->_tapEvent;

  return tapEvent;
}

- (void)setTapEvent:(id)a3
{
  *(void *)&self->_flags |= 0x408000000000000uLL;
  objc_storeStrong((id *)&self->_tapEvent, a3);
}

- (void)_readActionButtonDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionButtonDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasActionButtonDetails
{
  return self->_actionButtonDetails != 0;
}

- (GEOLogMsgStateActionButtonDetails)actionButtonDetails
{
  -[GEOLogMsgState _readActionButtonDetails]((uint64_t)self);
  actionButtonDetails = self->_actionButtonDetails;

  return actionButtonDetails;
}

- (void)setActionButtonDetails:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000004uLL;
  objc_storeStrong((id *)&self->_actionButtonDetails, a3);
}

- (void)_readRoutingWaypoints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingWaypoints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoutingWaypoints
{
  return self->_routingWaypoints != 0;
}

- (GEOLogMsgStateRoutingWaypoints)routingWaypoints
{
  -[GEOLogMsgState _readRoutingWaypoints]((uint64_t)self);
  routingWaypoints = self->_routingWaypoints;

  return routingWaypoints;
}

- (void)setRoutingWaypoints:(id)a3
{
  *(void *)&self->_flags |= 0x400200000000000uLL;
  objc_storeStrong((id *)&self->_routingWaypoints, a3);
}

- (void)setHasStateType:(BOOL)a3
{
  self->_$4616208CC255E1CA823F391899A05A96 flags = ($4616208CC255E1CA823F391899A05A96)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x400000000000000);
}

- (BOOL)hasStateType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)stateTypeAsString:(int)a3
{
  if (a3 > 600)
  {
    switch(a3)
    {
      case 702:
        v4 = @"PLACE_CARD";
        break;
      case 703:
        v4 = @"ROUTE";
        break;
      case 704:
        v4 = @"FLYOVER";
        break;
      case 705:
        v4 = @"MAPS_SERVER";
        break;
      case 706:
        v4 = @"TILE_SET";
        break;
      case 707:
        v4 = @"PLACE_REQUEST";
        break;
      case 708:
        v4 = @"NAVIGATION";
        break;
      case 709:
        v4 = @"MAP_RESTORE";
        break;
      case 710:
        v4 = @"SUGGESTIONS";
        break;
      case 711:
        v4 = @"REPORT_AN_ISSUE";
        break;
      case 712:
        v4 = @"REALTIME_TRAFFIC";
        break;
      case 713:
        v4 = @"OFFLINE";
        break;
      case 714:
        v4 = @"SUMMARY_LOOK_AROUND_LOG";
        break;
      case 715:
        v4 = @"DETAIL_LOOK_AROUND_LOG";
        break;
      case 716:
        v4 = @"LOOK_AROUND_VIEW";
        break;
      case 717:
        v4 = @"MUNIN_RESOURCE_LOG";
        break;
      case 718:
        v4 = @"MAPS_LAUNCH";
        break;
      case 719:
        v4 = @"CURATED_COLLECTION";
        break;
      case 720:
        v4 = @"UGC_PHOTO";
        break;
      case 721:
        v4 = @"DIRECTIONS_DETAIL";
        break;
      case 722:
        v4 = @"MARKET";
        break;
      case 723:
        v4 = @"ROUTING_SETTINGS";
        break;
      case 724:
        v4 = @"MAPS_FEATURES";
        break;
      case 725:
        v4 = @"MAPS_USER_SETTINGS";
        break;
      case 726:
        v4 = @"PHOTO_SUBMISSION";
        break;
      case 727:
        v4 = @"RATING_SUBMISSION";
        break;
      case 728:
        v4 = @"RATING_PHOTO_SUBMISSION";
        break;
      case 729:
        v4 = @"MAPS_PLACE_IDS";
        break;
      case 730:
        v4 = @"PLACE_CARD_RAP";
        break;
      case 731:
        v4 = @"OFFLINE_DOWNLOAD";
        break;
      default:
        if (a3 == 601)
        {
          v4 = @"USER_SESSION";
        }
        else if (a3 == 602)
        {
          v4 = @"EXPERIMENTS";
        }
        else
        {
LABEL_166:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_167:
        }
        break;
    }
  }
  else if (a3 > 300)
  {
    switch(a3)
    {
      case 501:
        v4 = @"MAP_VIEW";
        break;
      case 502:
        v4 = @"MAP_VIEW_LOCATION";
        break;
      case 503:
        v4 = @"TRANSIT";
        break;
      case 504:
        v4 = @"MAP_SETTINGS";
        break;
      case 505:
        v4 = @"MAP_UI";
        break;
      case 506:
        v4 = @"MAP_UI_SHOWN";
        break;
      default:
        if (a3 != 301) {
          goto LABEL_166;
        }
        v4 = @"APPLICATION_IDENTIFIER";
        break;
    }
  }
  else
  {
    v4 = @"LOG_MSG_STATE_TYPE_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_167;
      case 1:
        goto LABEL_166;
      case 2:
        v4 = @"MAPS_USER";
        break;
      case 3:
        v4 = @"ACCOUNT";
        break;
      case 4:
        v4 = @"RAP";
        break;
      case 5:
        v4 = @"PLACE_SUMMARY_LAYOUT";
        break;
      case 6:
        v4 = @"TRANSIT_STEP";
        break;
      case 7:
        v4 = @"NEARBY_TRANSIT";
        break;
      case 8:
        v4 = @"SEARCH_RESULTS";
        break;
      case 9:
        v4 = @"ELEMENT_IMPRESSION";
        break;
      case 10:
        v4 = @"IMPRESSION_OBJECT";
        break;
      case 11:
        v4 = @"TAP_EVENT";
        break;
      case 12:
        v4 = @"ACTION_BUTTON_DETAILS";
        break;
      case 13:
        v4 = @"ROUTING_WAYPOINTS";
        break;
      default:
        if (a3 != 201) {
          goto LABEL_166;
        }
        v4 = @"DEVICE_IDENTIFIER";
        break;
    }
  }
  return v4;
}

- (int)StringAsStateType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOG_MSG_STATE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAPS_USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ACCOUNT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RAP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PLACE_SUMMARY_LAYOUT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRANSIT_STEP"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NEARBY_TRANSIT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ELEMENT_IMPRESSION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"IMPRESSION_OBJECT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TAP_EVENT"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ACTION_BUTTON_DETAILS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ROUTING_WAYPOINTS"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DEVICE_IDENTIFIER"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"APPLICATION_IDENTIFIER"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"DEVICE_BASE"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"DEVICE_LOCALE"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"DEVICE_CONNECTION"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"CAR_PLAY"])
  {
    int v4 = 404;
  }
  else if ([v3 isEqualToString:@"PAIRED_DEVICE"])
  {
    int v4 = 405;
  }
  else if ([v3 isEqualToString:@"EXTENSION"])
  {
    int v4 = 406;
  }
  else if ([v3 isEqualToString:@"DEVICE_SETTINGS"])
  {
    int v4 = 407;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW_LOCATION"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"MAP_SETTINGS"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"MAP_UI"])
  {
    int v4 = 505;
  }
  else if ([v3 isEqualToString:@"MAP_UI_SHOWN"])
  {
    int v4 = 506;
  }
  else if ([v3 isEqualToString:@"USER_SESSION"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"EXPERIMENTS"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"PLACE_CARD"])
  {
    int v4 = 702;
  }
  else if ([v3 isEqualToString:@"ROUTE"])
  {
    int v4 = 703;
  }
  else if ([v3 isEqualToString:@"FLYOVER"])
  {
    int v4 = 704;
  }
  else if ([v3 isEqualToString:@"MAPS_SERVER"])
  {
    int v4 = 705;
  }
  else if ([v3 isEqualToString:@"TILE_SET"])
  {
    int v4 = 706;
  }
  else if ([v3 isEqualToString:@"PLACE_REQUEST"])
  {
    int v4 = 707;
  }
  else if ([v3 isEqualToString:@"NAVIGATION"])
  {
    int v4 = 708;
  }
  else if ([v3 isEqualToString:@"MAP_RESTORE"])
  {
    int v4 = 709;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS"])
  {
    int v4 = 710;
  }
  else if ([v3 isEqualToString:@"REPORT_AN_ISSUE"])
  {
    int v4 = 711;
  }
  else if ([v3 isEqualToString:@"REALTIME_TRAFFIC"])
  {
    int v4 = 712;
  }
  else if ([v3 isEqualToString:@"OFFLINE"])
  {
    int v4 = 713;
  }
  else if ([v3 isEqualToString:@"SUMMARY_LOOK_AROUND_LOG"])
  {
    int v4 = 714;
  }
  else if ([v3 isEqualToString:@"DETAIL_LOOK_AROUND_LOG"])
  {
    int v4 = 715;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_VIEW"])
  {
    int v4 = 716;
  }
  else if ([v3 isEqualToString:@"MUNIN_RESOURCE_LOG"])
  {
    int v4 = 717;
  }
  else if ([v3 isEqualToString:@"MAPS_LAUNCH"])
  {
    int v4 = 718;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION"])
  {
    int v4 = 719;
  }
  else if ([v3 isEqualToString:@"UGC_PHOTO"])
  {
    int v4 = 720;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS_DETAIL"])
  {
    int v4 = 721;
  }
  else if ([v3 isEqualToString:@"MARKET"])
  {
    int v4 = 722;
  }
  else if ([v3 isEqualToString:@"ROUTING_SETTINGS"])
  {
    int v4 = 723;
  }
  else if ([v3 isEqualToString:@"MAPS_FEATURES"])
  {
    int v4 = 724;
  }
  else if ([v3 isEqualToString:@"MAPS_USER_SETTINGS"])
  {
    int v4 = 725;
  }
  else if ([v3 isEqualToString:@"PHOTO_SUBMISSION"])
  {
    int v4 = 726;
  }
  else if ([v3 isEqualToString:@"RATING_SUBMISSION"])
  {
    int v4 = 727;
  }
  else if ([v3 isEqualToString:@"RATING_PHOTO_SUBMISSION"])
  {
    int v4 = 728;
  }
  else if ([v3 isEqualToString:@"MAPS_PLACE_IDS"])
  {
    int v4 = 729;
  }
  else if ([v3 isEqualToString:@"PLACE_CARD_RAP"])
  {
    int v4 = 730;
  }
  else if ([v3 isEqualToString:@"OFFLINE_DOWNLOAD"])
  {
    int v4 = 731;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasApplicationIdentifier
{
  return self->_applicationIdentifier != 0;
}

- (void)_readDeviceBase
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceBase_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceBase
{
  return self->_deviceBase != 0;
}

- (GEOLogMsgStateDeviceBase)deviceBase
{
  -[GEOLogMsgState _readDeviceBase]((uint64_t)self);
  deviceBase = self->_deviceBase;

  return deviceBase;
}

- (void)setDeviceBase:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000400uLL;
  objc_storeStrong((id *)&self->_deviceBase, a3);
}

- (BOOL)hasDeviceLocale
{
  return self->_deviceLocale != 0;
}

- (BOOL)hasDeviceConnection
{
  return self->_deviceConnection != 0;
}

- (void)_readPairedDevice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPairedDevice_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPairedDevice
{
  return self->_pairedDevice != 0;
}

- (GEOLogMsgStatePairedDevice)pairedDevice
{
  -[GEOLogMsgState _readPairedDevice]((uint64_t)self);
  pairedDevice = self->_pairedDevice;

  return pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
  *(void *)&self->_flags |= 0x400004000000000uLL;
  objc_storeStrong((id *)&self->_pairedDevice, a3);
}

- (void)_readExtension
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExtension_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (GEOLogMsgStateExtension)extension
{
  -[GEOLogMsgState _readExtension]((uint64_t)self);
  extension = self->_extension;

  return extension;
}

- (void)setExtension:(id)a3
{
  *(void *)&self->_flags |= 0x400000000040000uLL;
  objc_storeStrong((id *)&self->_extension, a3);
}

- (BOOL)hasDeviceSettings
{
  return self->_deviceSettings != 0;
}

- (BOOL)hasMapView
{
  return self->_mapView != 0;
}

- (void)_readMapViewLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapViewLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapViewLocation
{
  return self->_mapViewLocation != 0;
}

- (GEOLogMsgStateMapViewLocation)mapViewLocation
{
  -[GEOLogMsgState _readMapViewLocation]((uint64_t)self);
  mapViewLocation = self->_mapViewLocation;

  return mapViewLocation;
}

- (void)_readTransit
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransit_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTransit
{
  return self->_transit != 0;
}

- (GEOLogMsgStateTransit)transit
{
  -[GEOLogMsgState _readTransit]((uint64_t)self);
  transit = self->_transit;

  return transit;
}

- (void)setTransit:(id)a3
{
  *(void *)&self->_flags |= 0x440000000000000uLL;
  objc_storeStrong((id *)&self->_transit, a3);
}

- (BOOL)hasMapUi
{
  return self->_mapUi != 0;
}

- (BOOL)hasMapUiShown
{
  return self->_mapUiShown != 0;
}

- (BOOL)hasUserSession
{
  return self->_userSession != 0;
}

- (BOOL)hasExperiments
{
  return self->_experiments != 0;
}

- (void)_readPlaceCard
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceCard
{
  return self->_placeCard != 0;
}

- (GEOLogMsgStatePlaceCard)placeCard
{
  -[GEOLogMsgState _readPlaceCard]((uint64_t)self);
  placeCard = self->_placeCard;

  return placeCard;
}

- (void)setPlaceCard:(id)a3
{
  *(void *)&self->_flags |= 0x400010000000000uLL;
  objc_storeStrong((id *)&self->_placeCard, a3);
}

- (void)_readRoute
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoute_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoute
{
  return self->_route != 0;
}

- (GEOLogMsgStateRoute)route
{
  -[GEOLogMsgState _readRoute]((uint64_t)self);
  route = self->_route;

  return route;
}

- (void)setRoute:(id)a3
{
  *(void *)&self->_flags |= 0x400100000000000uLL;
  objc_storeStrong((id *)&self->_route, a3);
}

- (void)_readMapsServer
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsServer_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsServer
{
  return self->_mapsServer != 0;
}

- (GEOLogMsgStateMapsServer)mapsServer
{
  -[GEOLogMsgState _readMapsServer]((uint64_t)self);
  mapsServer = self->_mapsServer;

  return mapsServer;
}

- (void)setMapsServer:(id)a3
{
  *(void *)&self->_flags |= 0x400000040000000uLL;
  objc_storeStrong((id *)&self->_mapsServer, a3);
}

- (void)_readTileSet
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileSet_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTileSet
{
  return self->_tileSet != 0;
}

- (GEOLogMsgStateTileSet)tileSet
{
  -[GEOLogMsgState _readTileSet]((uint64_t)self);
  tileSet = self->_tileSet;

  return tileSet;
}

- (void)setTileSet:(id)a3
{
  *(void *)&self->_flags |= 0x410000000000000uLL;
  objc_storeStrong((id *)&self->_tileSet, a3);
}

- (void)_readNavigation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNavigation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasNavigation
{
  return self->_navigation != 0;
}

- (GEOLogMsgStateNavigation)navigation
{
  -[GEOLogMsgState _readNavigation]((uint64_t)self);
  navigation = self->_navigation;

  return navigation;
}

- (void)setNavigation:(id)a3
{
  *(void *)&self->_flags |= 0x400000400000000uLL;
  objc_storeStrong((id *)&self->_navigation, a3);
}

- (void)_readMapRestore
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRestore_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapRestore
{
  return self->_mapRestore != 0;
}

- (GEOLogMsgStateMapRestore)mapRestore
{
  -[GEOLogMsgState _readMapRestore]((uint64_t)self);
  mapRestore = self->_mapRestore;

  return mapRestore;
}

- (void)setMapRestore:(id)a3
{
  *(void *)&self->_flags |= 0x400000000400000uLL;
  objc_storeStrong((id *)&self->_mapRestore, a3);
}

- (void)_readSuggestions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSuggestions
{
  return self->_suggestions != 0;
}

- (GEOLogMsgStateSuggestions)suggestions
{
  -[GEOLogMsgState _readSuggestions]((uint64_t)self);
  suggestions = self->_suggestions;

  return suggestions;
}

- (void)setSuggestions:(id)a3
{
  *(void *)&self->_flags |= 0x402000000000000uLL;
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (BOOL)hasOffline
{
  return self->_offline != 0;
}

- (void)_readSummaryLookAroundLog
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSummaryLookAroundLog_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSummaryLookAroundLog
{
  return self->_summaryLookAroundLog != 0;
}

- (GEOLogMsgStateSummaryLookAroundLog)summaryLookAroundLog
{
  -[GEOLogMsgState _readSummaryLookAroundLog]((uint64_t)self);
  summaryLookAroundLog = self->_summaryLookAroundLog;

  return summaryLookAroundLog;
}

- (void)setSummaryLookAroundLog:(id)a3
{
  *(void *)&self->_flags |= 0x404000000000000uLL;
  objc_storeStrong((id *)&self->_summaryLookAroundLog, a3);
}

- (void)_readDetailLookAroundLog
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetailLookAroundLog_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDetailLookAroundLog
{
  return self->_detailLookAroundLog != 0;
}

- (GEOLogMsgStateDetailLookAroundLog)detailLookAroundLog
{
  -[GEOLogMsgState _readDetailLookAroundLog]((uint64_t)self);
  detailLookAroundLog = self->_detailLookAroundLog;

  return detailLookAroundLog;
}

- (void)setDetailLookAroundLog:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000200uLL;
  objc_storeStrong((id *)&self->_detailLookAroundLog, a3);
}

- (void)setLookAroundView:(id)a3
{
  *(void *)&self->_flags |= 0x400000000100000uLL;
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (void)_readMuninResource
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMuninResource_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMuninResource
{
  return self->_muninResource != 0;
}

- (GEOLogMsgStateMuninResource)muninResource
{
  -[GEOLogMsgState _readMuninResource]((uint64_t)self);
  muninResource = self->_muninResource;

  return muninResource;
}

- (void)setMuninResource:(id)a3
{
  *(void *)&self->_flags |= 0x400000200000000uLL;
  objc_storeStrong((id *)&self->_muninResource, a3);
}

- (void)_readMapLaunch
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 490) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapLaunch_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapLaunch
{
  return self->_mapLaunch != 0;
}

- (GEOLogMsgStateMapLaunch)mapLaunch
{
  -[GEOLogMsgState _readMapLaunch]((uint64_t)self);
  mapLaunch = self->_mapLaunch;

  return mapLaunch;
}

- (void)setMapLaunch:(id)a3
{
  *(void *)&self->_flags |= 0x400000000200000uLL;
  objc_storeStrong((id *)&self->_mapLaunch, a3);
}

- (void)_readCuratedCollection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCuratedCollection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasCuratedCollection
{
  return self->_curatedCollection != 0;
}

- (GEOLogMsgStateCuratedCollection)curatedCollection
{
  -[GEOLogMsgState _readCuratedCollection]((uint64_t)self);
  curatedCollection = self->_curatedCollection;

  return curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000100uLL;
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (void)_readUgcPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 494) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUgcPhoto_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasUgcPhoto
{
  return self->_ugcPhoto != 0;
}

- (GEOLogMsgStateUGCPhoto)ugcPhoto
{
  -[GEOLogMsgState _readUgcPhoto]((uint64_t)self);
  ugcPhoto = self->_ugcPhoto;

  return ugcPhoto;
}

- (void)setUgcPhoto:(id)a3
{
  *(void *)&self->_flags |= 0x480000000000000uLL;
  objc_storeStrong((id *)&self->_ugcPhoto, a3);
}

- (void)_readDirectionsDetail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 489) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsDetail_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDirectionsDetail
{
  return self->_directionsDetail != 0;
}

- (GEOLogMsgStateDirectionsDetail)directionsDetail
{
  -[GEOLogMsgState _readDirectionsDetail]((uint64_t)self);
  directionsDetail = self->_directionsDetail;

  return directionsDetail;
}

- (void)setDirectionsDetail:(id)a3
{
  *(void *)&self->_flags |= 0x400000000008000uLL;
  objc_storeStrong((id *)&self->_directionsDetail, a3);
}

- (BOOL)hasMarket
{
  return self->_market != 0;
}

- (void)_readRoutingSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 493) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoutingSettings_tags_5701);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoutingSettings
{
  return self->_routingSettings != 0;
}

- (GEOLogMsgStateRoutingSettings)routingSettings
{
  -[GEOLogMsgState _readRoutingSettings]((uint64_t)self);
  routingSettings = self->_routingSettings;

  return routingSettings;
}

- (void)setRoutingSettings:(id)a3
{
  *(void *)&self->_flags |= 0x400400000000000uLL;
  objc_storeStrong((id *)&self->_routingSettings, a3);
}

- (void)_readMapsFeatures
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsFeatures_tags_5702);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsFeatures
{
  return self->_mapsFeatures != 0;
}

- (GEOLogMsgStateMapsFeatures)mapsFeatures
{
  -[GEOLogMsgState _readMapsFeatures]((uint64_t)self);
  mapsFeatures = self->_mapsFeatures;

  return mapsFeatures;
}

- (void)setMapsFeatures:(id)a3
{
  *(void *)&self->_flags |= 0x400000010000000uLL;
  objc_storeStrong((id *)&self->_mapsFeatures, a3);
}

- (void)_readMapsUserSettings
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsUserSettings_tags_5703);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsUserSettings
{
  return self->_mapsUserSettings != 0;
}

- (GEOLogMsgStateMapsUserSettings)mapsUserSettings
{
  -[GEOLogMsgState _readMapsUserSettings]((uint64_t)self);
  mapsUserSettings = self->_mapsUserSettings;

  return mapsUserSettings;
}

- (void)setMapsUserSettings:(id)a3
{
  *(void *)&self->_flags |= 0x400000080000000uLL;
  objc_storeStrong((id *)&self->_mapsUserSettings, a3);
}

- (void)_readArpPhotoSubmission
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArpPhotoSubmission_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpPhotoSubmission
{
  return self->_arpPhotoSubmission != 0;
}

- (GEOLogMsgStateARPPhotoSubmission)arpPhotoSubmission
{
  -[GEOLogMsgState _readArpPhotoSubmission]((uint64_t)self);
  arpPhotoSubmission = self->_arpPhotoSubmission;

  return arpPhotoSubmission;
}

- (void)setArpPhotoSubmission:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000010uLL;
  objc_storeStrong((id *)&self->_arpPhotoSubmission, a3);
}

- (void)_readArpRatingSubmission
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArpRatingSubmission_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpRatingSubmission
{
  return self->_arpRatingSubmission != 0;
}

- (GEOLogMsgStateARPRatingSubmission)arpRatingSubmission
{
  -[GEOLogMsgState _readArpRatingSubmission]((uint64_t)self);
  arpRatingSubmission = self->_arpRatingSubmission;

  return arpRatingSubmission;
}

- (void)setArpRatingSubmission:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000040uLL;
  objc_storeStrong((id *)&self->_arpRatingSubmission, a3);
}

- (void)_readArpRatingPhotoSubmission
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 488) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArpRatingPhotoSubmission_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpRatingPhotoSubmission
{
  return self->_arpRatingPhotoSubmission != 0;
}

- (GEOLogMsgStateARPRatingPhotoSubmission)arpRatingPhotoSubmission
{
  -[GEOLogMsgState _readArpRatingPhotoSubmission]((uint64_t)self);
  arpRatingPhotoSubmission = self->_arpRatingPhotoSubmission;

  return arpRatingPhotoSubmission;
}

- (void)setArpRatingPhotoSubmission:(id)a3
{
  *(void *)&self->_flags |= 0x400000000000020uLL;
  objc_storeStrong((id *)&self->_arpRatingPhotoSubmission, a3);
}

- (void)_readMapsPlaceIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 491) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsPlaceIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsPlaceIds
{
  return self->_mapsPlaceIds != 0;
}

- (GEOLogMsgStateMapsPlaceIds)mapsPlaceIds
{
  -[GEOLogMsgState _readMapsPlaceIds]((uint64_t)self);
  mapsPlaceIds = self->_mapsPlaceIds;

  return mapsPlaceIds;
}

- (void)setMapsPlaceIds:(id)a3
{
  *(void *)&self->_flags |= 0x400000020000000uLL;
  objc_storeStrong((id *)&self->_mapsPlaceIds, a3);
}

- (void)_readPlaceCardRap
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceCardRap_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceCardRap
{
  return self->_placeCardRap != 0;
}

- (GEOLogMsgStatePlaceCardRap)placeCardRap
{
  -[GEOLogMsgState _readPlaceCardRap]((uint64_t)self);
  placeCardRap = self->_placeCardRap;

  return placeCardRap;
}

- (void)setPlaceCardRap:(id)a3
{
  *(void *)&self->_flags |= 0x400008000000000uLL;
  objc_storeStrong((id *)&self->_placeCardRap, a3);
}

- (void)_readOfflineDownload
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(unsigned char *)(a1 + 492) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOfflineDownload_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOfflineDownload
{
  return self->_offlineDownload != 0;
}

- (GEOLogMsgStateOfflineDownload)offlineDownload
{
  -[GEOLogMsgState _readOfflineDownload]((uint64_t)self);
  offlineDownload = self->_offlineDownload;

  return offlineDownload;
}

- (void)setOfflineDownload:(id)a3
{
  *(void *)&self->_flags |= 0x400001000000000uLL;
  objc_storeStrong((id *)&self->_offlineDownload, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgState;
  int v4 = [(GEOLogMsgState *)&v8 description];
  uint64_t v5 = [(GEOLogMsgState *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [(id)a1 stateOrigin];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"stateOrigin";
      }
      else {
        objc_super v6 = @"state_origin";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 user];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      id v9 = [v7 dictionaryRepresentation];
      }

      [v4 setObject:v9 forKey:@"user"];
    }

    v10 = [(id)a1 account];
    id v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      id v12 = [v10 dictionaryRepresentation];
      }

      [v4 setObject:v12 forKey:@"account"];
    }

    id v13 = [(id)a1 rap];
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      id v15 = [v13 dictionaryRepresentation];
      }

      [v4 setObject:v15 forKey:@"rap"];
    }

    v16 = [(id)a1 placeSummaryLayout];
    id v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        id v19 = @"placeSummaryLayout";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        id v19 = @"place_summary_layout";
      }
      id v20 = v18;

      [v4 setObject:v20 forKey:v19];
    }

    id v21 = [(id)a1 transitStep];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        id v23 = [v21 jsonRepresentation];
        v24 = @"transitStep";
      }
      else
      {
        id v23 = [v21 dictionaryRepresentation];
        v24 = @"transit_step";
      }
      id v25 = v23;

      [v4 setObject:v25 forKey:v24];
    }

    v26 = [(id)a1 nearbyTransit];
    id v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        id v29 = @"nearbyTransit";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        id v29 = @"nearby_transit";
      }
      id v30 = v28;

      [v4 setObject:v30 forKey:v29];
    }

    id v31 = [(id)a1 searchResults];
    v32 = v31;
    if (v31)
    {
      if (a2)
      {
        id v33 = [v31 jsonRepresentation];
        v34 = @"searchResults";
      }
      else
      {
        id v33 = [v31 dictionaryRepresentation];
        v34 = @"search_results";
      }
      id v35 = v33;

      [v4 setObject:v35 forKey:v34];
    }

    v36 = [(id)a1 elementImpression];
    id v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        id v39 = @"elementImpression";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        id v39 = @"element_impression";
      }
      id v40 = v38;

      [v4 setObject:v40 forKey:v39];
    }

    id v41 = [(id)a1 impressionObject];
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        id v43 = [v41 jsonRepresentation];
        v44 = @"impressionObject";
      }
      else
      {
        id v43 = [v41 dictionaryRepresentation];
        v44 = @"impression_object";
      }
      id v45 = v43;

      [v4 setObject:v45 forKey:v44];
    }

    v46 = [(id)a1 tapEvent];
    id v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        id v49 = @"tapEvent";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        id v49 = @"tap_event";
      }
      id v50 = v48;

      [v4 setObject:v50 forKey:v49];
    }

    id v51 = [(id)a1 actionButtonDetails];
    v52 = v51;
    if (v51)
    {
      if (a2) {
        [v51 jsonRepresentation];
      }
      else {
      id v53 = [v51 dictionaryRepresentation];
      }

      [v4 setObject:v53 forKey:@"actionButtonDetails"];
    }

    v54 = [(id)a1 routingWaypoints];
    id v55 = v54;
    if (v54)
    {
      if (a2) {
        [v54 jsonRepresentation];
      }
      else {
      id v56 = [v54 dictionaryRepresentation];
      }

      [v4 setObject:v56 forKey:@"routingWaypoints"];
    }

    if (*(unsigned char *)(a1 + 488))
    {
      int v57 = *(_DWORD *)(a1 + 484);
      if (v57 > 600)
      {
        switch(v57)
        {
          case 702:
            v58 = @"PLACE_CARD";
            break;
          case 703:
            v58 = @"ROUTE";
            break;
          case 704:
            v58 = @"FLYOVER";
            break;
          case 705:
            v58 = @"MAPS_SERVER";
            break;
          case 706:
            v58 = @"TILE_SET";
            break;
          case 707:
            v58 = @"PLACE_REQUEST";
            break;
          case 708:
            v58 = @"NAVIGATION";
            break;
          case 709:
            v58 = @"MAP_RESTORE";
            break;
          case 710:
            v58 = @"SUGGESTIONS";
            break;
          case 711:
            v58 = @"REPORT_AN_ISSUE";
            break;
          case 712:
            v58 = @"REALTIME_TRAFFIC";
            break;
          case 713:
            v58 = @"OFFLINE";
            break;
          case 714:
            v58 = @"SUMMARY_LOOK_AROUND_LOG";
            break;
          case 715:
            v58 = @"DETAIL_LOOK_AROUND_LOG";
            break;
          case 716:
            v58 = @"LOOK_AROUND_VIEW";
            break;
          case 717:
            v58 = @"MUNIN_RESOURCE_LOG";
            break;
          case 718:
            v58 = @"MAPS_LAUNCH";
            break;
          case 719:
            v58 = @"CURATED_COLLECTION";
            break;
          case 720:
            v58 = @"UGC_PHOTO";
            break;
          case 721:
            v58 = @"DIRECTIONS_DETAIL";
            break;
          case 722:
            v58 = @"MARKET";
            break;
          case 723:
            v58 = @"ROUTING_SETTINGS";
            break;
          case 724:
            v58 = @"MAPS_FEATURES";
            break;
          case 725:
            v58 = @"MAPS_USER_SETTINGS";
            break;
          case 726:
            v58 = @"PHOTO_SUBMISSION";
            break;
          case 727:
            v58 = @"RATING_SUBMISSION";
            break;
          case 728:
            v58 = @"RATING_PHOTO_SUBMISSION";
            break;
          case 729:
            v58 = @"MAPS_PLACE_IDS";
            break;
          case 730:
            v58 = @"PLACE_CARD_RAP";
            break;
          case 731:
            v58 = @"OFFLINE_DOWNLOAD";
            break;
          default:
            if (v57 == 601)
            {
              v58 = @"USER_SESSION";
            }
            else if (v57 == 602)
            {
              v58 = @"EXPERIMENTS";
            }
            else
            {
LABEL_99:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 484));
              v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else if (v57 > 300)
      {
        switch(v57)
        {
          case 501:
            v58 = @"MAP_VIEW";
            break;
          case 502:
            v58 = @"MAP_VIEW_LOCATION";
            break;
          case 503:
            v58 = @"TRANSIT";
            break;
          case 504:
            v58 = @"MAP_SETTINGS";
            break;
          case 505:
            v58 = @"MAP_UI";
            break;
          case 506:
            v58 = @"MAP_UI_SHOWN";
            break;
          default:
            if (v57 != 301) {
              goto LABEL_99;
            }
            v58 = @"APPLICATION_IDENTIFIER";
            break;
        }
      }
      else
      {
        v58 = @"LOG_MSG_STATE_TYPE_UNKNOWN";
        switch(v57)
        {
          case 0:
            break;
          case 1:
            goto LABEL_99;
          case 2:
            v58 = @"MAPS_USER";
            break;
          case 3:
            v58 = @"ACCOUNT";
            break;
          case 4:
            v58 = @"RAP";
            break;
          case 5:
            v58 = @"PLACE_SUMMARY_LAYOUT";
            break;
          case 6:
            v58 = @"TRANSIT_STEP";
            break;
          case 7:
            v58 = @"NEARBY_TRANSIT";
            break;
          case 8:
            v58 = @"SEARCH_RESULTS";
            break;
          case 9:
            v58 = @"ELEMENT_IMPRESSION";
            break;
          case 10:
            v58 = @"IMPRESSION_OBJECT";
            break;
          case 11:
            v58 = @"TAP_EVENT";
            break;
          case 12:
            v58 = @"ACTION_BUTTON_DETAILS";
            break;
          case 13:
            v58 = @"ROUTING_WAYPOINTS";
            break;
          default:
            if (v57 != 201) {
              goto LABEL_99;
            }
            v58 = @"DEVICE_IDENTIFIER";
            break;
        }
      }
      if (a2) {
        id v59 = @"stateType";
      }
      else {
        id v59 = @"state_type";
      }
      [v4 setObject:v58 forKey:v59];
    }
    v60 = [(id)a1 deviceIdentifier];
    id v61 = v60;
    if (v60)
    {
      if (a2)
      {
        v62 = [v60 jsonRepresentation];
        id v63 = @"deviceIdentifier";
      }
      else
      {
        v62 = [v60 dictionaryRepresentation];
        id v63 = @"device_identifier";
      }
      id v64 = v62;

      [v4 setObject:v64 forKey:v63];
    }

    id v65 = [(id)a1 applicationIdentifier];
    v66 = v65;
    if (v65)
    {
      if (a2)
      {
        id v67 = [v65 jsonRepresentation];
        v68 = @"applicationIdentifier";
      }
      else
      {
        id v67 = [v65 dictionaryRepresentation];
        v68 = @"application_identifier";
      }
      id v69 = v67;

      [v4 setObject:v69 forKey:v68];
    }

    v70 = [(id)a1 deviceBase];
    id v71 = v70;
    if (v70)
    {
      if (a2)
      {
        v72 = [v70 jsonRepresentation];
        id v73 = @"deviceBase";
      }
      else
      {
        v72 = [v70 dictionaryRepresentation];
        id v73 = @"device_base";
      }
      id v74 = v72;

      [v4 setObject:v74 forKey:v73];
    }

    id v75 = [(id)a1 deviceLocale];
    v76 = v75;
    if (v75)
    {
      if (a2)
      {
        id v77 = [v75 jsonRepresentation];
        v78 = @"deviceLocale";
      }
      else
      {
        id v77 = [v75 dictionaryRepresentation];
        v78 = @"device_locale";
      }
      id v79 = v77;

      [v4 setObject:v79 forKey:v78];
    }

    v80 = [(id)a1 deviceConnection];
    id v81 = v80;
    if (v80)
    {
      if (a2)
      {
        v82 = [v80 jsonRepresentation];
        id v83 = @"deviceConnection";
      }
      else
      {
        v82 = [v80 dictionaryRepresentation];
        id v83 = @"device_connection";
      }
      id v84 = v82;

      [v4 setObject:v84 forKey:v83];
    }

    id v85 = [(id)a1 carPlay];
    v86 = v85;
    if (v85)
    {
      if (a2)
      {
        id v87 = [v85 jsonRepresentation];
        v88 = @"carPlay";
      }
      else
      {
        id v87 = [v85 dictionaryRepresentation];
        v88 = @"car_play";
      }
      id v89 = v87;

      [v4 setObject:v89 forKey:v88];
    }

    v90 = [(id)a1 pairedDevice];
    id v91 = v90;
    if (v90)
    {
      if (a2)
      {
        v92 = [v90 jsonRepresentation];
        id v93 = @"pairedDevice";
      }
      else
      {
        v92 = [v90 dictionaryRepresentation];
        id v93 = @"paired_device";
      }
      id v94 = v92;

      [v4 setObject:v94 forKey:v93];
    }

    id v95 = [(id)a1 extension];
    v96 = v95;
    if (v95)
    {
      if (a2) {
        [v95 jsonRepresentation];
      }
      else {
      id v97 = [v95 dictionaryRepresentation];
      }

      [v4 setObject:v97 forKey:@"extension"];
    }

    v98 = [(id)a1 deviceSettings];
    id v99 = v98;
    if (v98)
    {
      if (a2)
      {
        v100 = [v98 jsonRepresentation];
        id v101 = @"deviceSettings";
      }
      else
      {
        v100 = [v98 dictionaryRepresentation];
        id v101 = @"device_settings";
      }
      id v102 = v100;

      [v4 setObject:v102 forKey:v101];
    }

    id v103 = [(id)a1 mapView];
    v104 = v103;
    if (v103)
    {
      if (a2)
      {
        id v105 = [v103 jsonRepresentation];
        v106 = @"mapView";
      }
      else
      {
        id v105 = [v103 dictionaryRepresentation];
        v106 = @"map_view";
      }
      id v107 = v105;

      [v4 setObject:v107 forKey:v106];
    }

    v108 = [(id)a1 mapViewLocation];
    id v109 = v108;
    if (v108)
    {
      if (a2)
      {
        v110 = [v108 jsonRepresentation];
        id v111 = @"mapViewLocation";
      }
      else
      {
        v110 = [v108 dictionaryRepresentation];
        id v111 = @"map_view_location";
      }
      id v112 = v110;

      [v4 setObject:v112 forKey:v111];
    }

    id v113 = [(id)a1 transit];
    v114 = v113;
    if (v113)
    {
      if (a2) {
        [v113 jsonRepresentation];
      }
      else {
      id v115 = [v113 dictionaryRepresentation];
      }

      [v4 setObject:v115 forKey:@"transit"];
    }

    v116 = [(id)a1 mapSettings];
    id v117 = v116;
    if (v116)
    {
      if (a2)
      {
        v118 = [v116 jsonRepresentation];
        id v119 = @"mapSettings";
      }
      else
      {
        v118 = [v116 dictionaryRepresentation];
        id v119 = @"map_settings";
      }
      id v120 = v118;

      [v4 setObject:v120 forKey:v119];
    }

    id v121 = [(id)a1 mapUi];
    v122 = v121;
    if (v121)
    {
      if (a2)
      {
        v123 = [v121 jsonRepresentation];
        v124 = @"mapUi";
      }
      else
      {
        v123 = [v121 dictionaryRepresentation];
        v124 = @"map_ui";
      }
      id v125 = v123;

      [v4 setObject:v125 forKey:v124];
    }

    v126 = [(id)a1 mapUiShown];
    v127 = v126;
    if (v126)
    {
      if (a2)
      {
        v128 = [v126 jsonRepresentation];
        v129 = @"mapUiShown";
      }
      else
      {
        v128 = [v126 dictionaryRepresentation];
        v129 = @"map_ui_shown";
      }
      id v130 = v128;

      [v4 setObject:v130 forKey:v129];
    }

    v131 = [(id)a1 userSession];
    v132 = v131;
    if (v131)
    {
      if (a2)
      {
        v133 = [v131 jsonRepresentation];
        v134 = @"userSession";
      }
      else
      {
        v133 = [v131 dictionaryRepresentation];
        v134 = @"user_session";
      }
      id v135 = v133;

      [v4 setObject:v135 forKey:v134];
    }

    v136 = [(id)a1 experiments];
    v137 = v136;
    if (v136)
    {
      if (a2) {
        [v136 jsonRepresentation];
      }
      else {
      id v138 = [v136 dictionaryRepresentation];
      }

      [v4 setObject:v138 forKey:@"experiments"];
    }

    v139 = [(id)a1 placeCard];
    v140 = v139;
    if (v139)
    {
      if (a2)
      {
        v141 = [v139 jsonRepresentation];
        v142 = @"placeCard";
      }
      else
      {
        v141 = [v139 dictionaryRepresentation];
        v142 = @"place_card";
      }
      id v143 = v141;

      [v4 setObject:v143 forKey:v142];
    }

    v144 = [(id)a1 route];
    v145 = v144;
    if (v144)
    {
      if (a2) {
        [v144 jsonRepresentation];
      }
      else {
      id v146 = [v144 dictionaryRepresentation];
      }

      [v4 setObject:v146 forKey:@"route"];
    }

    v147 = [(id)a1 mapsServer];
    v148 = v147;
    if (v147)
    {
      if (a2)
      {
        v149 = [v147 jsonRepresentation];
        v150 = @"mapsServer";
      }
      else
      {
        v149 = [v147 dictionaryRepresentation];
        v150 = @"maps_server";
      }
      id v151 = v149;

      [v4 setObject:v151 forKey:v150];
    }

    v152 = [(id)a1 tileSet];
    v153 = v152;
    if (v152)
    {
      if (a2)
      {
        v154 = [v152 jsonRepresentation];
        v155 = @"tileSet";
      }
      else
      {
        v154 = [v152 dictionaryRepresentation];
        v155 = @"tile_set";
      }
      id v156 = v154;

      [v4 setObject:v156 forKey:v155];
    }

    v157 = [(id)a1 placeRequest];
    v158 = v157;
    if (v157)
    {
      if (a2)
      {
        v159 = [v157 jsonRepresentation];
        v160 = @"placeRequest";
      }
      else
      {
        v159 = [v157 dictionaryRepresentation];
        v160 = @"place_request";
      }
      id v161 = v159;

      [v4 setObject:v161 forKey:v160];
    }

    v162 = [(id)a1 navigation];
    v163 = v162;
    if (v162)
    {
      if (a2) {
        [v162 jsonRepresentation];
      }
      else {
      id v164 = [v162 dictionaryRepresentation];
      }

      [v4 setObject:v164 forKey:@"navigation"];
    }

    v165 = [(id)a1 mapRestore];
    v166 = v165;
    if (v165)
    {
      if (a2)
      {
        v167 = [v165 jsonRepresentation];
        v168 = @"mapRestore";
      }
      else
      {
        v167 = [v165 dictionaryRepresentation];
        v168 = @"map_restore";
      }
      id v169 = v167;

      [v4 setObject:v169 forKey:v168];
    }

    v170 = [(id)a1 suggestions];
    v171 = v170;
    if (v170)
    {
      if (a2) {
        [v170 jsonRepresentation];
      }
      else {
      id v172 = [v170 dictionaryRepresentation];
      }

      [v4 setObject:v172 forKey:@"suggestions"];
    }

    v173 = [(id)a1 offline];
    v174 = v173;
    if (v173)
    {
      if (a2) {
        [v173 jsonRepresentation];
      }
      else {
      id v175 = [v173 dictionaryRepresentation];
      }

      [v4 setObject:v175 forKey:@"offline"];
    }

    v176 = [(id)a1 summaryLookAroundLog];
    v177 = v176;
    if (v176)
    {
      if (a2)
      {
        v178 = [v176 jsonRepresentation];
        v179 = @"summaryLookAroundLog";
      }
      else
      {
        v178 = [v176 dictionaryRepresentation];
        v179 = @"summary_look_around_log";
      }
      id v180 = v178;

      [v4 setObject:v180 forKey:v179];
    }

    v181 = [(id)a1 detailLookAroundLog];
    v182 = v181;
    if (v181)
    {
      if (a2)
      {
        v183 = [v181 jsonRepresentation];
        v184 = @"detailLookAroundLog";
      }
      else
      {
        v183 = [v181 dictionaryRepresentation];
        v184 = @"detail_look_around_log";
      }
      id v185 = v183;

      [v4 setObject:v185 forKey:v184];
    }

    v186 = [(id)a1 lookAroundView];
    v187 = v186;
    if (v186)
    {
      if (a2)
      {
        v188 = [v186 jsonRepresentation];
        v189 = @"lookAroundView";
      }
      else
      {
        v188 = [v186 dictionaryRepresentation];
        v189 = @"look_around_view";
      }
      id v190 = v188;

      [v4 setObject:v190 forKey:v189];
    }

    v191 = [(id)a1 muninResource];
    v192 = v191;
    if (v191)
    {
      if (a2)
      {
        v193 = [v191 jsonRepresentation];
        v194 = @"muninResource";
      }
      else
      {
        v193 = [v191 dictionaryRepresentation];
        v194 = @"munin_resource";
      }
      id v195 = v193;

      [v4 setObject:v195 forKey:v194];
    }

    v196 = [(id)a1 mapLaunch];
    v197 = v196;
    if (v196)
    {
      if (a2)
      {
        v198 = [v196 jsonRepresentation];
        v199 = @"mapLaunch";
      }
      else
      {
        v198 = [v196 dictionaryRepresentation];
        v199 = @"map_launch";
      }
      id v200 = v198;

      [v4 setObject:v200 forKey:v199];
    }

    v201 = [(id)a1 curatedCollection];
    v202 = v201;
    if (v201)
    {
      if (a2)
      {
        v203 = [v201 jsonRepresentation];
        v204 = @"curatedCollection";
      }
      else
      {
        v203 = [v201 dictionaryRepresentation];
        v204 = @"curated_collection";
      }
      id v205 = v203;

      [v4 setObject:v205 forKey:v204];
    }

    v206 = [(id)a1 ugcPhoto];
    v207 = v206;
    if (v206)
    {
      if (a2)
      {
        v208 = [v206 jsonRepresentation];
        v209 = @"ugcPhoto";
      }
      else
      {
        v208 = [v206 dictionaryRepresentation];
        v209 = @"ugc_photo";
      }
      id v210 = v208;

      [v4 setObject:v210 forKey:v209];
    }

    v211 = [(id)a1 directionsDetail];
    v212 = v211;
    if (v211)
    {
      if (a2)
      {
        v213 = [v211 jsonRepresentation];
        v214 = @"directionsDetail";
      }
      else
      {
        v213 = [v211 dictionaryRepresentation];
        v214 = @"directions_detail";
      }
      id v215 = v213;

      [v4 setObject:v215 forKey:v214];
    }

    v216 = [(id)a1 market];
    v217 = v216;
    if (v216)
    {
      if (a2) {
        [v216 jsonRepresentation];
      }
      else {
      id v218 = [v216 dictionaryRepresentation];
      }

      [v4 setObject:v218 forKey:@"market"];
    }

    v219 = [(id)a1 routingSettings];
    v220 = v219;
    if (v219)
    {
      if (a2)
      {
        v221 = [v219 jsonRepresentation];
        v222 = @"routingSettings";
      }
      else
      {
        v221 = [v219 dictionaryRepresentation];
        v222 = @"routing_settings";
      }
      id v223 = v221;

      [v4 setObject:v223 forKey:v222];
    }

    v224 = [(id)a1 mapsFeatures];
    v225 = v224;
    if (v224)
    {
      if (a2)
      {
        v226 = [v224 jsonRepresentation];
        v227 = @"mapsFeatures";
      }
      else
      {
        v226 = [v224 dictionaryRepresentation];
        v227 = @"maps_features";
      }
      id v228 = v226;

      [v4 setObject:v228 forKey:v227];
    }

    v229 = [(id)a1 mapsUserSettings];
    v230 = v229;
    if (v229)
    {
      if (a2)
      {
        v231 = [v229 jsonRepresentation];
        v232 = @"mapsUserSettings";
      }
      else
      {
        v231 = [v229 dictionaryRepresentation];
        v232 = @"maps_user_settings";
      }
      id v233 = v231;

      [v4 setObject:v233 forKey:v232];
    }

    v234 = [(id)a1 arpPhotoSubmission];
    v235 = v234;
    if (v234)
    {
      if (a2)
      {
        v236 = [v234 jsonRepresentation];
        v237 = @"arpPhotoSubmission";
      }
      else
      {
        v236 = [v234 dictionaryRepresentation];
        v237 = @"arp_photo_submission";
      }
      id v238 = v236;

      [v4 setObject:v238 forKey:v237];
    }

    v239 = [(id)a1 arpRatingSubmission];
    v240 = v239;
    if (v239)
    {
      if (a2)
      {
        v241 = [v239 jsonRepresentation];
        v242 = @"arpRatingSubmission";
      }
      else
      {
        v241 = [v239 dictionaryRepresentation];
        v242 = @"arp_rating_submission";
      }
      id v243 = v241;

      [v4 setObject:v243 forKey:v242];
    }

    v244 = [(id)a1 arpRatingPhotoSubmission];
    v245 = v244;
    if (v244)
    {
      if (a2)
      {
        v246 = [v244 jsonRepresentation];
        v247 = @"arpRatingPhotoSubmission";
      }
      else
      {
        v246 = [v244 dictionaryRepresentation];
        v247 = @"arp_rating_photo_submission";
      }
      id v248 = v246;

      [v4 setObject:v248 forKey:v247];
    }

    v249 = [(id)a1 mapsPlaceIds];
    v250 = v249;
    if (v249)
    {
      if (a2)
      {
        v251 = [v249 jsonRepresentation];
        v252 = @"mapsPlaceIds";
      }
      else
      {
        v251 = [v249 dictionaryRepresentation];
        v252 = @"maps_place_ids";
      }
      id v253 = v251;

      [v4 setObject:v253 forKey:v252];
    }

    v254 = [(id)a1 placeCardRap];
    v255 = v254;
    if (v254)
    {
      if (a2)
      {
        v256 = [v254 jsonRepresentation];
        v257 = @"placeCardRap";
      }
      else
      {
        v256 = [v254 dictionaryRepresentation];
        v257 = @"place_card_rap";
      }
      id v258 = v256;

      [v4 setObject:v258 forKey:v257];
    }

    v259 = [(id)a1 offlineDownload];
    v260 = v259;
    if (v259)
    {
      if (a2)
      {
        v261 = [v259 jsonRepresentation];
        v262 = @"offlineDownload";
      }
      else
      {
        v261 = [v259 dictionaryRepresentation];
        v262 = @"offline_download";
      }
      id v263 = v261;

      [v4 setObject:v263 forKey:v262];
    }

    id v264 = v4;
  }
  else
  {
    id v264 = 0;
  }

  return v264;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgState)initWithDictionary:(id)a3
{
  return (GEOLogMsgState *)-[GEOLogMsgState _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_547;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_547;
  }
  if (a3) {
    objc_super v6 = @"stateOrigin";
  }
  else {
    objc_super v6 = @"state_origin";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setStateOrigin:v8];
  }
  id v9 = [v5 objectForKeyedSubscript:@"user"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [GEOLogMsgStateUser alloc];
    if (a3) {
      uint64_t v11 = [(GEOLogMsgStateUser *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOLogMsgStateUser *)v10 initWithDictionary:v9];
    }
    id v12 = (void *)v11;
    [a1 setUser:v11];
  }
  id v13 = [v5 objectForKeyedSubscript:@"account"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [GEOLogMsgStateAccount alloc];
    if (a3) {
      uint64_t v15 = [(GEOLogMsgStateAccount *)v14 initWithJSON:v13];
    }
    else {
      uint64_t v15 = [(GEOLogMsgStateAccount *)v14 initWithDictionary:v13];
    }
    v16 = (void *)v15;
    [a1 setAccount:v15];
  }
  id v17 = [v5 objectForKeyedSubscript:@"rap"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [GEOLogMsgStateRAP alloc];
    if (a3) {
      uint64_t v19 = [(GEOLogMsgStateRAP *)v18 initWithJSON:v17];
    }
    else {
      uint64_t v19 = [(GEOLogMsgStateRAP *)v18 initWithDictionary:v17];
    }
    id v20 = (void *)v19;
    [a1 setRap:v19];
  }
  if (a3) {
    id v21 = @"placeSummaryLayout";
  }
  else {
    id v21 = @"place_summary_layout";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = [GEOLogMsgStatePlaceSummaryLayout alloc];
    if (a3) {
      uint64_t v24 = [(GEOLogMsgStatePlaceSummaryLayout *)v23 initWithJSON:v22];
    }
    else {
      uint64_t v24 = [(GEOLogMsgStatePlaceSummaryLayout *)v23 initWithDictionary:v22];
    }
    id v25 = (void *)v24;
    [a1 setPlaceSummaryLayout:v24];
  }
  if (a3) {
    v26 = @"transitStep";
  }
  else {
    v26 = @"transit_step";
  }
  id v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [GEOLogMsgStateTransitStep alloc];
    if (a3) {
      uint64_t v29 = [(GEOLogMsgStateTransitStep *)v28 initWithJSON:v27];
    }
    else {
      uint64_t v29 = [(GEOLogMsgStateTransitStep *)v28 initWithDictionary:v27];
    }
    id v30 = (void *)v29;
    [a1 setTransitStep:v29];
  }
  if (a3) {
    id v31 = @"nearbyTransit";
  }
  else {
    id v31 = @"nearby_transit";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [GEOLogMsgStateNearbyTransit alloc];
    if (a3) {
      uint64_t v34 = [(GEOLogMsgStateNearbyTransit *)v33 initWithJSON:v32];
    }
    else {
      uint64_t v34 = [(GEOLogMsgStateNearbyTransit *)v33 initWithDictionary:v32];
    }
    id v35 = (void *)v34;
    [a1 setNearbyTransit:v34];
  }
  if (a3) {
    v36 = @"searchResults";
  }
  else {
    v36 = @"search_results";
  }
  id v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = [GEOLogMsgStateSearchResults alloc];
    if (a3) {
      uint64_t v39 = [(GEOLogMsgStateSearchResults *)v38 initWithJSON:v37];
    }
    else {
      uint64_t v39 = [(GEOLogMsgStateSearchResults *)v38 initWithDictionary:v37];
    }
    id v40 = (void *)v39;
    [a1 setSearchResults:v39];
  }
  if (a3) {
    id v41 = @"elementImpression";
  }
  else {
    id v41 = @"element_impression";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = [GEOLogMsgStateElementImpression alloc];
    if (a3) {
      uint64_t v44 = [(GEOLogMsgStateElementImpression *)v43 initWithJSON:v42];
    }
    else {
      uint64_t v44 = [(GEOLogMsgStateElementImpression *)v43 initWithDictionary:v42];
    }
    id v45 = (void *)v44;
    [a1 setElementImpression:v44];
  }
  if (a3) {
    v46 = @"impressionObject";
  }
  else {
    v46 = @"impression_object";
  }
  id v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [GEOLogMsgStateImpressionObject alloc];
    if (a3) {
      uint64_t v49 = [(GEOLogMsgStateImpressionObject *)v48 initWithJSON:v47];
    }
    else {
      uint64_t v49 = [(GEOLogMsgStateImpressionObject *)v48 initWithDictionary:v47];
    }
    id v50 = (void *)v49;
    [a1 setImpressionObject:v49];
  }
  if (a3) {
    id v51 = @"tapEvent";
  }
  else {
    id v51 = @"tap_event";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = [GEOLogMsgStateTapEvent alloc];
    if (a3) {
      uint64_t v54 = [(GEOLogMsgStateTapEvent *)v53 initWithJSON:v52];
    }
    else {
      uint64_t v54 = [(GEOLogMsgStateTapEvent *)v53 initWithDictionary:v52];
    }
    id v55 = (void *)v54;
    [a1 setTapEvent:v54];
  }
  id v56 = [v5 objectForKeyedSubscript:@"actionButtonDetails"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v57 = [GEOLogMsgStateActionButtonDetails alloc];
    if (a3) {
      uint64_t v58 = [(GEOLogMsgStateActionButtonDetails *)v57 initWithJSON:v56];
    }
    else {
      uint64_t v58 = [(GEOLogMsgStateActionButtonDetails *)v57 initWithDictionary:v56];
    }
    id v59 = (void *)v58;
    [a1 setActionButtonDetails:v58];
  }
  v60 = [v5 objectForKeyedSubscript:@"routingWaypoints"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = [GEOLogMsgStateRoutingWaypoints alloc];
    if (a3) {
      uint64_t v62 = [(GEOLogMsgStateRoutingWaypoints *)v61 initWithJSON:v60];
    }
    else {
      uint64_t v62 = [(GEOLogMsgStateRoutingWaypoints *)v61 initWithDictionary:v60];
    }
    id v63 = (void *)v62;
    [a1 setRoutingWaypoints:v62];
  }
  if (a3) {
    id v64 = @"stateType";
  }
  else {
    id v64 = @"state_type";
  }
  id v65 = [v5 objectForKeyedSubscript:v64];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v66 = v65;
    if ([v66 isEqualToString:@"LOG_MSG_STATE_TYPE_UNKNOWN"])
    {
      uint64_t v67 = 0;
    }
    else if ([v66 isEqualToString:@"MAPS_USER"])
    {
      uint64_t v67 = 2;
    }
    else if ([v66 isEqualToString:@"ACCOUNT"])
    {
      uint64_t v67 = 3;
    }
    else if ([v66 isEqualToString:@"RAP"])
    {
      uint64_t v67 = 4;
    }
    else if ([v66 isEqualToString:@"PLACE_SUMMARY_LAYOUT"])
    {
      uint64_t v67 = 5;
    }
    else if ([v66 isEqualToString:@"TRANSIT_STEP"])
    {
      uint64_t v67 = 6;
    }
    else if ([v66 isEqualToString:@"NEARBY_TRANSIT"])
    {
      uint64_t v67 = 7;
    }
    else if ([v66 isEqualToString:@"SEARCH_RESULTS"])
    {
      uint64_t v67 = 8;
    }
    else if ([v66 isEqualToString:@"ELEMENT_IMPRESSION"])
    {
      uint64_t v67 = 9;
    }
    else if ([v66 isEqualToString:@"IMPRESSION_OBJECT"])
    {
      uint64_t v67 = 10;
    }
    else if ([v66 isEqualToString:@"TAP_EVENT"])
    {
      uint64_t v67 = 11;
    }
    else if ([v66 isEqualToString:@"ACTION_BUTTON_DETAILS"])
    {
      uint64_t v67 = 12;
    }
    else if ([v66 isEqualToString:@"ROUTING_WAYPOINTS"])
    {
      uint64_t v67 = 13;
    }
    else if ([v66 isEqualToString:@"DEVICE_IDENTIFIER"])
    {
      uint64_t v67 = 201;
    }
    else if ([v66 isEqualToString:@"APPLICATION_IDENTIFIER"])
    {
      uint64_t v67 = 301;
    }
    else if ([v66 isEqualToString:@"DEVICE_BASE"])
    {
      uint64_t v67 = 401;
    }
    else if ([v66 isEqualToString:@"DEVICE_LOCALE"])
    {
      uint64_t v67 = 402;
    }
    else if ([v66 isEqualToString:@"DEVICE_CONNECTION"])
    {
      uint64_t v67 = 403;
    }
    else if ([v66 isEqualToString:@"CAR_PLAY"])
    {
      uint64_t v67 = 404;
    }
    else if ([v66 isEqualToString:@"PAIRED_DEVICE"])
    {
      uint64_t v67 = 405;
    }
    else if ([v66 isEqualToString:@"EXTENSION"])
    {
      uint64_t v67 = 406;
    }
    else if ([v66 isEqualToString:@"DEVICE_SETTINGS"])
    {
      uint64_t v67 = 407;
    }
    else if ([v66 isEqualToString:@"MAP_VIEW"])
    {
      uint64_t v67 = 501;
    }
    else if ([v66 isEqualToString:@"MAP_VIEW_LOCATION"])
    {
      uint64_t v67 = 502;
    }
    else if ([v66 isEqualToString:@"TRANSIT"])
    {
      uint64_t v67 = 503;
    }
    else if ([v66 isEqualToString:@"MAP_SETTINGS"])
    {
      uint64_t v67 = 504;
    }
    else if ([v66 isEqualToString:@"MAP_UI"])
    {
      uint64_t v67 = 505;
    }
    else if ([v66 isEqualToString:@"MAP_UI_SHOWN"])
    {
      uint64_t v67 = 506;
    }
    else if ([v66 isEqualToString:@"USER_SESSION"])
    {
      uint64_t v67 = 601;
    }
    else if ([v66 isEqualToString:@"EXPERIMENTS"])
    {
      uint64_t v67 = 602;
    }
    else if ([v66 isEqualToString:@"PLACE_CARD"])
    {
      uint64_t v67 = 702;
    }
    else if ([v66 isEqualToString:@"ROUTE"])
    {
      uint64_t v67 = 703;
    }
    else if ([v66 isEqualToString:@"FLYOVER"])
    {
      uint64_t v67 = 704;
    }
    else if ([v66 isEqualToString:@"MAPS_SERVER"])
    {
      uint64_t v67 = 705;
    }
    else if ([v66 isEqualToString:@"TILE_SET"])
    {
      uint64_t v67 = 706;
    }
    else if ([v66 isEqualToString:@"PLACE_REQUEST"])
    {
      uint64_t v67 = 707;
    }
    else if ([v66 isEqualToString:@"NAVIGATION"])
    {
      uint64_t v67 = 708;
    }
    else if ([v66 isEqualToString:@"MAP_RESTORE"])
    {
      uint64_t v67 = 709;
    }
    else if ([v66 isEqualToString:@"SUGGESTIONS"])
    {
      uint64_t v67 = 710;
    }
    else if ([v66 isEqualToString:@"REPORT_AN_ISSUE"])
    {
      uint64_t v67 = 711;
    }
    else if ([v66 isEqualToString:@"REALTIME_TRAFFIC"])
    {
      uint64_t v67 = 712;
    }
    else if ([v66 isEqualToString:@"OFFLINE"])
    {
      uint64_t v67 = 713;
    }
    else if ([v66 isEqualToString:@"SUMMARY_LOOK_AROUND_LOG"])
    {
      uint64_t v67 = 714;
    }
    else if ([v66 isEqualToString:@"DETAIL_LOOK_AROUND_LOG"])
    {
      uint64_t v67 = 715;
    }
    else if ([v66 isEqualToString:@"LOOK_AROUND_VIEW"])
    {
      uint64_t v67 = 716;
    }
    else if ([v66 isEqualToString:@"MUNIN_RESOURCE_LOG"])
    {
      uint64_t v67 = 717;
    }
    else if ([v66 isEqualToString:@"MAPS_LAUNCH"])
    {
      uint64_t v67 = 718;
    }
    else if ([v66 isEqualToString:@"CURATED_COLLECTION"])
    {
      uint64_t v67 = 719;
    }
    else if ([v66 isEqualToString:@"UGC_PHOTO"])
    {
      uint64_t v67 = 720;
    }
    else if ([v66 isEqualToString:@"DIRECTIONS_DETAIL"])
    {
      uint64_t v67 = 721;
    }
    else if ([v66 isEqualToString:@"MARKET"])
    {
      uint64_t v67 = 722;
    }
    else if ([v66 isEqualToString:@"ROUTING_SETTINGS"])
    {
      uint64_t v67 = 723;
    }
    else if ([v66 isEqualToString:@"MAPS_FEATURES"])
    {
      uint64_t v67 = 724;
    }
    else if ([v66 isEqualToString:@"MAPS_USER_SETTINGS"])
    {
      uint64_t v67 = 725;
    }
    else if ([v66 isEqualToString:@"PHOTO_SUBMISSION"])
    {
      uint64_t v67 = 726;
    }
    else if ([v66 isEqualToString:@"RATING_SUBMISSION"])
    {
      uint64_t v67 = 727;
    }
    else if ([v66 isEqualToString:@"RATING_PHOTO_SUBMISSION"])
    {
      uint64_t v67 = 728;
    }
    else if ([v66 isEqualToString:@"MAPS_PLACE_IDS"])
    {
      uint64_t v67 = 729;
    }
    else if ([v66 isEqualToString:@"PLACE_CARD_RAP"])
    {
      uint64_t v67 = 730;
    }
    else if ([v66 isEqualToString:@"OFFLINE_DOWNLOAD"])
    {
      uint64_t v67 = 731;
    }
    else
    {
      uint64_t v67 = 0;
    }

    goto LABEL_217;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v67 = [v65 intValue];
LABEL_217:
    [a1 setStateType:v67];
  }

  if (a3) {
    v68 = @"deviceIdentifier";
  }
  else {
    v68 = @"device_identifier";
  }
  id v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v70 = [GEOLogMsgStateDeviceIdentifier alloc];
    if (a3) {
      uint64_t v71 = [(GEOLogMsgStateDeviceIdentifier *)v70 initWithJSON:v69];
    }
    else {
      uint64_t v71 = [(GEOLogMsgStateDeviceIdentifier *)v70 initWithDictionary:v69];
    }
    v72 = (void *)v71;
    [a1 setDeviceIdentifier:v71];
  }
  if (a3) {
    id v73 = @"applicationIdentifier";
  }
  else {
    id v73 = @"application_identifier";
  }
  id v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v75 = [GEOLogMsgStateApplicationIdentifier alloc];
    if (a3) {
      uint64_t v76 = [(GEOLogMsgStateApplicationIdentifier *)v75 initWithJSON:v74];
    }
    else {
      uint64_t v76 = [(GEOLogMsgStateApplicationIdentifier *)v75 initWithDictionary:v74];
    }
    id v77 = (void *)v76;
    [a1 setApplicationIdentifier:v76];
  }
  if (a3) {
    v78 = @"deviceBase";
  }
  else {
    v78 = @"device_base";
  }
  id v79 = [v5 objectForKeyedSubscript:v78];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v80 = [GEOLogMsgStateDeviceBase alloc];
    if (a3) {
      uint64_t v81 = [(GEOLogMsgStateDeviceBase *)v80 initWithJSON:v79];
    }
    else {
      uint64_t v81 = [(GEOLogMsgStateDeviceBase *)v80 initWithDictionary:v79];
    }
    v82 = (void *)v81;
    [a1 setDeviceBase:v81];
  }
  if (a3) {
    id v83 = @"deviceLocale";
  }
  else {
    id v83 = @"device_locale";
  }
  id v84 = [v5 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v85 = [GEOLogMsgStateDeviceLocale alloc];
    if (a3) {
      uint64_t v86 = [(GEOLogMsgStateDeviceLocale *)v85 initWithJSON:v84];
    }
    else {
      uint64_t v86 = [(GEOLogMsgStateDeviceLocale *)v85 initWithDictionary:v84];
    }
    id v87 = (void *)v86;
    [a1 setDeviceLocale:v86];
  }
  if (a3) {
    v88 = @"deviceConnection";
  }
  else {
    v88 = @"device_connection";
  }
  id v89 = [v5 objectForKeyedSubscript:v88];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v90 = [GEOLogMsgStateDeviceConnection alloc];
    if (a3) {
      uint64_t v91 = [(GEOLogMsgStateDeviceConnection *)v90 initWithJSON:v89];
    }
    else {
      uint64_t v91 = [(GEOLogMsgStateDeviceConnection *)v90 initWithDictionary:v89];
    }
    v92 = (void *)v91;
    [a1 setDeviceConnection:v91];
  }
  if (a3) {
    id v93 = @"carPlay";
  }
  else {
    id v93 = @"car_play";
  }
  id v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v95 = [GEOLogMsgStateCarPlay alloc];
    if (a3) {
      uint64_t v96 = [(GEOLogMsgStateCarPlay *)v95 initWithJSON:v94];
    }
    else {
      uint64_t v96 = [(GEOLogMsgStateCarPlay *)v95 initWithDictionary:v94];
    }
    id v97 = (void *)v96;
    [a1 setCarPlay:v96];
  }
  if (a3) {
    v98 = @"pairedDevice";
  }
  else {
    v98 = @"paired_device";
  }
  id v99 = [v5 objectForKeyedSubscript:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v100 = [GEOLogMsgStatePairedDevice alloc];
    if (a3) {
      uint64_t v101 = [(GEOLogMsgStatePairedDevice *)v100 initWithJSON:v99];
    }
    else {
      uint64_t v101 = [(GEOLogMsgStatePairedDevice *)v100 initWithDictionary:v99];
    }
    id v102 = (void *)v101;
    [a1 setPairedDevice:v101];
  }
  id v103 = [v5 objectForKeyedSubscript:@"extension"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v104 = [GEOLogMsgStateExtension alloc];
    if (a3) {
      uint64_t v105 = [(GEOLogMsgStateExtension *)v104 initWithJSON:v103];
    }
    else {
      uint64_t v105 = [(GEOLogMsgStateExtension *)v104 initWithDictionary:v103];
    }
    v106 = (void *)v105;
    [a1 setExtension:v105];
  }
  if (a3) {
    id v107 = @"deviceSettings";
  }
  else {
    id v107 = @"device_settings";
  }
  v108 = [v5 objectForKeyedSubscript:v107];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v109 = [GEOLogMsgStateDeviceSettings alloc];
    if (a3) {
      uint64_t v110 = [(GEOLogMsgStateDeviceSettings *)v109 initWithJSON:v108];
    }
    else {
      uint64_t v110 = [(GEOLogMsgStateDeviceSettings *)v109 initWithDictionary:v108];
    }
    id v111 = (void *)v110;
    [a1 setDeviceSettings:v110];
  }
  if (a3) {
    id v112 = @"mapView";
  }
  else {
    id v112 = @"map_view";
  }
  id v113 = [v5 objectForKeyedSubscript:v112];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v114 = [GEOLogMsgStateMapView alloc];
    if (a3) {
      uint64_t v115 = [(GEOLogMsgStateMapView *)v114 initWithJSON:v113];
    }
    else {
      uint64_t v115 = [(GEOLogMsgStateMapView *)v114 initWithDictionary:v113];
    }
    v116 = (void *)v115;
    [a1 setMapView:v115];
  }
  if (a3) {
    id v117 = @"mapViewLocation";
  }
  else {
    id v117 = @"map_view_location";
  }
  v118 = [v5 objectForKeyedSubscript:v117];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v119 = [GEOLogMsgStateMapViewLocation alloc];
    if (a3) {
      uint64_t v120 = [(GEOLogMsgStateMapViewLocation *)v119 initWithJSON:v118];
    }
    else {
      uint64_t v120 = [(GEOLogMsgStateMapViewLocation *)v119 initWithDictionary:v118];
    }
    id v121 = (void *)v120;
    [a1 setMapViewLocation:v120];
  }
  v122 = [v5 objectForKeyedSubscript:@"transit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v123 = [GEOLogMsgStateTransit alloc];
    if (a3) {
      uint64_t v124 = [(GEOLogMsgStateTransit *)v123 initWithJSON:v122];
    }
    else {
      uint64_t v124 = [(GEOLogMsgStateTransit *)v123 initWithDictionary:v122];
    }
    id v125 = (void *)v124;
    [a1 setTransit:v124];
  }
  if (a3) {
    v126 = @"mapSettings";
  }
  else {
    v126 = @"map_settings";
  }
  v127 = [v5 objectForKeyedSubscript:v126];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v128 = [GEOLogMsgStateMapSettings alloc];
    if (a3) {
      uint64_t v129 = [(GEOLogMsgStateMapSettings *)v128 initWithJSON:v127];
    }
    else {
      uint64_t v129 = [(GEOLogMsgStateMapSettings *)v128 initWithDictionary:v127];
    }
    id v130 = (void *)v129;
    [a1 setMapSettings:v129];
  }
  if (a3) {
    v131 = @"mapUi";
  }
  else {
    v131 = @"map_ui";
  }
  v132 = [v5 objectForKeyedSubscript:v131];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v133 = [GEOLogMsgStateMapUI alloc];
    if (a3) {
      uint64_t v134 = [(GEOLogMsgStateMapUI *)v133 initWithJSON:v132];
    }
    else {
      uint64_t v134 = [(GEOLogMsgStateMapUI *)v133 initWithDictionary:v132];
    }
    id v135 = (void *)v134;
    [a1 setMapUi:v134];
  }
  if (a3) {
    v136 = @"mapUiShown";
  }
  else {
    v136 = @"map_ui_shown";
  }
  v137 = [v5 objectForKeyedSubscript:v136];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v138 = [GEOLogMsgStateMapUIShown alloc];
    if (a3) {
      uint64_t v139 = [(GEOLogMsgStateMapUIShown *)v138 initWithJSON:v137];
    }
    else {
      uint64_t v139 = [(GEOLogMsgStateMapUIShown *)v138 initWithDictionary:v137];
    }
    v140 = (void *)v139;
    [a1 setMapUiShown:v139];
  }
  if (a3) {
    v141 = @"userSession";
  }
  else {
    v141 = @"user_session";
  }
  v142 = [v5 objectForKeyedSubscript:v141];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v143 = [GEOLogMsgStateUserSession alloc];
    if (a3) {
      uint64_t v144 = [(GEOLogMsgStateUserSession *)v143 initWithJSON:v142];
    }
    else {
      uint64_t v144 = [(GEOLogMsgStateUserSession *)v143 initWithDictionary:v142];
    }
    v145 = (void *)v144;
    [a1 setUserSession:v144];
  }
  id v146 = [v5 objectForKeyedSubscript:@"experiments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v147 = [GEOLogMsgStateExperiments alloc];
    if (a3) {
      uint64_t v148 = [(GEOLogMsgStateExperiments *)v147 initWithJSON:v146];
    }
    else {
      uint64_t v148 = [(GEOLogMsgStateExperiments *)v147 initWithDictionary:v146];
    }
    v149 = (void *)v148;
    [a1 setExperiments:v148];
  }
  if (a3) {
    v150 = @"placeCard";
  }
  else {
    v150 = @"place_card";
  }
  id v151 = [v5 objectForKeyedSubscript:v150];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v152 = [GEOLogMsgStatePlaceCard alloc];
    if (a3) {
      uint64_t v153 = [(GEOLogMsgStatePlaceCard *)v152 initWithJSON:v151];
    }
    else {
      uint64_t v153 = [(GEOLogMsgStatePlaceCard *)v152 initWithDictionary:v151];
    }
    v154 = (void *)v153;
    [a1 setPlaceCard:v153];
  }
  v155 = [v5 objectForKeyedSubscript:@"route"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v156 = [GEOLogMsgStateRoute alloc];
    if (a3) {
      uint64_t v157 = [(GEOLogMsgStateRoute *)v156 initWithJSON:v155];
    }
    else {
      uint64_t v157 = [(GEOLogMsgStateRoute *)v156 initWithDictionary:v155];
    }
    v158 = (void *)v157;
    [a1 setRoute:v157];
  }
  if (a3) {
    v159 = @"mapsServer";
  }
  else {
    v159 = @"maps_server";
  }
  v160 = [v5 objectForKeyedSubscript:v159];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v161 = [GEOLogMsgStateMapsServer alloc];
    if (a3) {
      uint64_t v162 = [(GEOLogMsgStateMapsServer *)v161 initWithJSON:v160];
    }
    else {
      uint64_t v162 = [(GEOLogMsgStateMapsServer *)v161 initWithDictionary:v160];
    }
    v163 = (void *)v162;
    [a1 setMapsServer:v162];
  }
  if (a3) {
    id v164 = @"tileSet";
  }
  else {
    id v164 = @"tile_set";
  }
  v165 = [v5 objectForKeyedSubscript:v164];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v166 = [GEOLogMsgStateTileSet alloc];
    if (a3) {
      uint64_t v167 = [(GEOLogMsgStateTileSet *)v166 initWithJSON:v165];
    }
    else {
      uint64_t v167 = [(GEOLogMsgStateTileSet *)v166 initWithDictionary:v165];
    }
    v168 = (void *)v167;
    [a1 setTileSet:v167];
  }
  if (a3) {
    id v169 = @"placeRequest";
  }
  else {
    id v169 = @"place_request";
  }
  v170 = [v5 objectForKeyedSubscript:v169];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v171 = [GEOLogMsgStatePlaceRequest alloc];
    if (a3) {
      uint64_t v172 = [(GEOLogMsgStatePlaceRequest *)v171 initWithJSON:v170];
    }
    else {
      uint64_t v172 = [(GEOLogMsgStatePlaceRequest *)v171 initWithDictionary:v170];
    }
    v173 = (void *)v172;
    [a1 setPlaceRequest:v172];
  }
  v174 = [v5 objectForKeyedSubscript:@"navigation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v175 = [GEOLogMsgStateNavigation alloc];
    if (a3) {
      uint64_t v176 = [(GEOLogMsgStateNavigation *)v175 initWithJSON:v174];
    }
    else {
      uint64_t v176 = [(GEOLogMsgStateNavigation *)v175 initWithDictionary:v174];
    }
    v177 = (void *)v176;
    [a1 setNavigation:v176];
  }
  if (a3) {
    v178 = @"mapRestore";
  }
  else {
    v178 = @"map_restore";
  }
  v179 = [v5 objectForKeyedSubscript:v178];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v180 = [GEOLogMsgStateMapRestore alloc];
    if (a3) {
      uint64_t v181 = [(GEOLogMsgStateMapRestore *)v180 initWithJSON:v179];
    }
    else {
      uint64_t v181 = [(GEOLogMsgStateMapRestore *)v180 initWithDictionary:v179];
    }
    v182 = (void *)v181;
    [a1 setMapRestore:v181];
  }
  v183 = [v5 objectForKeyedSubscript:@"suggestions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v184 = [GEOLogMsgStateSuggestions alloc];
    if (a3) {
      uint64_t v185 = [(GEOLogMsgStateSuggestions *)v184 initWithJSON:v183];
    }
    else {
      uint64_t v185 = [(GEOLogMsgStateSuggestions *)v184 initWithDictionary:v183];
    }
    v186 = (void *)v185;
    [a1 setSuggestions:v185];
  }
  v187 = [v5 objectForKeyedSubscript:@"offline"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v188 = [GEOLogMsgStateOffline alloc];
    if (a3) {
      uint64_t v189 = [(GEOLogMsgStateOffline *)v188 initWithJSON:v187];
    }
    else {
      uint64_t v189 = [(GEOLogMsgStateOffline *)v188 initWithDictionary:v187];
    }
    id v190 = (void *)v189;
    [a1 setOffline:v189];
  }
  if (a3) {
    v191 = @"summaryLookAroundLog";
  }
  else {
    v191 = @"summary_look_around_log";
  }
  v192 = [v5 objectForKeyedSubscript:v191];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v193 = [GEOLogMsgStateSummaryLookAroundLog alloc];
    if (a3) {
      uint64_t v194 = [(GEOLogMsgStateSummaryLookAroundLog *)v193 initWithJSON:v192];
    }
    else {
      uint64_t v194 = [(GEOLogMsgStateSummaryLookAroundLog *)v193 initWithDictionary:v192];
    }
    id v195 = (void *)v194;
    [a1 setSummaryLookAroundLog:v194];
  }
  if (a3) {
    v196 = @"detailLookAroundLog";
  }
  else {
    v196 = @"detail_look_around_log";
  }
  v197 = [v5 objectForKeyedSubscript:v196];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v198 = [GEOLogMsgStateDetailLookAroundLog alloc];
    if (a3) {
      uint64_t v199 = [(GEOLogMsgStateDetailLookAroundLog *)v198 initWithJSON:v197];
    }
    else {
      uint64_t v199 = [(GEOLogMsgStateDetailLookAroundLog *)v198 initWithDictionary:v197];
    }
    id v200 = (void *)v199;
    [a1 setDetailLookAroundLog:v199];
  }
  if (a3) {
    v201 = @"lookAroundView";
  }
  else {
    v201 = @"look_around_view";
  }
  v202 = [v5 objectForKeyedSubscript:v201];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v203 = [GEOLogMsgStateLookAroundView alloc];
    if (a3) {
      uint64_t v204 = [(GEOLogMsgStateLookAroundView *)v203 initWithJSON:v202];
    }
    else {
      uint64_t v204 = [(GEOLogMsgStateLookAroundView *)v203 initWithDictionary:v202];
    }
    id v205 = (void *)v204;
    [a1 setLookAroundView:v204];
  }
  if (a3) {
    v206 = @"muninResource";
  }
  else {
    v206 = @"munin_resource";
  }
  v207 = [v5 objectForKeyedSubscript:v206];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v208 = [GEOLogMsgStateMuninResource alloc];
    if (a3) {
      uint64_t v209 = [(GEOLogMsgStateMuninResource *)v208 initWithJSON:v207];
    }
    else {
      uint64_t v209 = [(GEOLogMsgStateMuninResource *)v208 initWithDictionary:v207];
    }
    id v210 = (void *)v209;
    [a1 setMuninResource:v209];
  }
  if (a3) {
    v211 = @"mapLaunch";
  }
  else {
    v211 = @"map_launch";
  }
  v212 = [v5 objectForKeyedSubscript:v211];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v213 = [GEOLogMsgStateMapLaunch alloc];
    if (a3) {
      uint64_t v214 = [(GEOLogMsgStateMapLaunch *)v213 initWithJSON:v212];
    }
    else {
      uint64_t v214 = [(GEOLogMsgStateMapLaunch *)v213 initWithDictionary:v212];
    }
    id v215 = (void *)v214;
    [a1 setMapLaunch:v214];
  }
  if (a3) {
    v216 = @"curatedCollection";
  }
  else {
    v216 = @"curated_collection";
  }
  v217 = [v5 objectForKeyedSubscript:v216];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v218 = [GEOLogMsgStateCuratedCollection alloc];
    if (a3) {
      uint64_t v219 = [(GEOLogMsgStateCuratedCollection *)v218 initWithJSON:v217];
    }
    else {
      uint64_t v219 = [(GEOLogMsgStateCuratedCollection *)v218 initWithDictionary:v217];
    }
    v220 = (void *)v219;
    [a1 setCuratedCollection:v219];
  }
  if (a3) {
    v221 = @"ugcPhoto";
  }
  else {
    v221 = @"ugc_photo";
  }
  v222 = [v5 objectForKeyedSubscript:v221];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v223 = [GEOLogMsgStateUGCPhoto alloc];
    if (a3) {
      uint64_t v224 = [(GEOLogMsgStateUGCPhoto *)v223 initWithJSON:v222];
    }
    else {
      uint64_t v224 = [(GEOLogMsgStateUGCPhoto *)v223 initWithDictionary:v222];
    }
    v225 = (void *)v224;
    [a1 setUgcPhoto:v224];
  }
  if (a3) {
    v226 = @"directionsDetail";
  }
  else {
    v226 = @"directions_detail";
  }
  v227 = [v5 objectForKeyedSubscript:v226];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v228 = [GEOLogMsgStateDirectionsDetail alloc];
    if (a3) {
      uint64_t v229 = [(GEOLogMsgStateDirectionsDetail *)v228 initWithJSON:v227];
    }
    else {
      uint64_t v229 = [(GEOLogMsgStateDirectionsDetail *)v228 initWithDictionary:v227];
    }
    v230 = (void *)v229;
    [a1 setDirectionsDetail:v229];
  }
  v231 = [v5 objectForKeyedSubscript:@"market"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v232 = [GEOLogMsgStateMarket alloc];
    if (a3) {
      uint64_t v233 = [(GEOLogMsgStateMarket *)v232 initWithJSON:v231];
    }
    else {
      uint64_t v233 = [(GEOLogMsgStateMarket *)v232 initWithDictionary:v231];
    }
    v234 = (void *)v233;
    [a1 setMarket:v233];
  }
  if (a3) {
    v235 = @"routingSettings";
  }
  else {
    v235 = @"routing_settings";
  }
  v236 = [v5 objectForKeyedSubscript:v235];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v237 = [GEOLogMsgStateRoutingSettings alloc];
    if (a3) {
      uint64_t v238 = [(GEOLogMsgStateRoutingSettings *)v237 initWithJSON:v236];
    }
    else {
      uint64_t v238 = [(GEOLogMsgStateRoutingSettings *)v237 initWithDictionary:v236];
    }
    v239 = (void *)v238;
    [a1 setRoutingSettings:v238];
  }
  if (a3) {
    v240 = @"mapsFeatures";
  }
  else {
    v240 = @"maps_features";
  }
  v241 = [v5 objectForKeyedSubscript:v240];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v242 = [GEOLogMsgStateMapsFeatures alloc];
    if (a3) {
      uint64_t v243 = [(GEOLogMsgStateMapsFeatures *)v242 initWithJSON:v241];
    }
    else {
      uint64_t v243 = [(GEOLogMsgStateMapsFeatures *)v242 initWithDictionary:v241];
    }
    v244 = (void *)v243;
    [a1 setMapsFeatures:v243];
  }
  if (a3) {
    v245 = @"mapsUserSettings";
  }
  else {
    v245 = @"maps_user_settings";
  }
  v246 = [v5 objectForKeyedSubscript:v245];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v247 = [GEOLogMsgStateMapsUserSettings alloc];
    if (a3) {
      uint64_t v248 = [(GEOLogMsgStateMapsUserSettings *)v247 initWithJSON:v246];
    }
    else {
      uint64_t v248 = [(GEOLogMsgStateMapsUserSettings *)v247 initWithDictionary:v246];
    }
    v249 = (void *)v248;
    [a1 setMapsUserSettings:v248];
  }
  if (a3) {
    v250 = @"arpPhotoSubmission";
  }
  else {
    v250 = @"arp_photo_submission";
  }
  v251 = [v5 objectForKeyedSubscript:v250];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v252 = [GEOLogMsgStateARPPhotoSubmission alloc];
    if (a3) {
      uint64_t v253 = [(GEOLogMsgStateARPPhotoSubmission *)v252 initWithJSON:v251];
    }
    else {
      uint64_t v253 = [(GEOLogMsgStateARPPhotoSubmission *)v252 initWithDictionary:v251];
    }
    v254 = (void *)v253;
    [a1 setArpPhotoSubmission:v253];
  }
  if (a3) {
    v255 = @"arpRatingSubmission";
  }
  else {
    v255 = @"arp_rating_submission";
  }
  v256 = [v5 objectForKeyedSubscript:v255];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v257 = [GEOLogMsgStateARPRatingSubmission alloc];
    if (a3) {
      uint64_t v258 = [(GEOLogMsgStateARPRatingSubmission *)v257 initWithJSON:v256];
    }
    else {
      uint64_t v258 = [(GEOLogMsgStateARPRatingSubmission *)v257 initWithDictionary:v256];
    }
    v259 = (void *)v258;
    [a1 setArpRatingSubmission:v258];
  }
  if (a3) {
    v260 = @"arpRatingPhotoSubmission";
  }
  else {
    v260 = @"arp_rating_photo_submission";
  }
  v261 = [v5 objectForKeyedSubscript:v260];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v262 = [GEOLogMsgStateARPRatingPhotoSubmission alloc];
    if (a3) {
      uint64_t v263 = [(GEOLogMsgStateARPRatingPhotoSubmission *)v262 initWithJSON:v261];
    }
    else {
      uint64_t v263 = [(GEOLogMsgStateARPRatingPhotoSubmission *)v262 initWithDictionary:v261];
    }
    id v264 = (void *)v263;
    [a1 setArpRatingPhotoSubmission:v263];
  }
  if (a3) {
    v265 = @"mapsPlaceIds";
  }
  else {
    v265 = @"maps_place_ids";
  }
  v266 = [v5 objectForKeyedSubscript:v265];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v267 = [GEOLogMsgStateMapsPlaceIds alloc];
    if (a3) {
      uint64_t v268 = [(GEOLogMsgStateMapsPlaceIds *)v267 initWithJSON:v266];
    }
    else {
      uint64_t v268 = [(GEOLogMsgStateMapsPlaceIds *)v267 initWithDictionary:v266];
    }
    v269 = (void *)v268;
    [a1 setMapsPlaceIds:v268];
  }
  if (a3) {
    v270 = @"placeCardRap";
  }
  else {
    v270 = @"place_card_rap";
  }
  v271 = [v5 objectForKeyedSubscript:v270];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v272 = [GEOLogMsgStatePlaceCardRap alloc];
    if (a3) {
      uint64_t v273 = [(GEOLogMsgStatePlaceCardRap *)v272 initWithJSON:v271];
    }
    else {
      uint64_t v273 = [(GEOLogMsgStatePlaceCardRap *)v272 initWithDictionary:v271];
    }
    v274 = (void *)v273;
    [a1 setPlaceCardRap:v273];
  }
  if (a3) {
    v275 = @"offlineDownload";
  }
  else {
    v275 = @"offline_download";
  }
  v276 = [v5 objectForKeyedSubscript:v275];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v277 = [GEOLogMsgStateOfflineDownload alloc];
    if (a3) {
      uint64_t v278 = [(GEOLogMsgStateOfflineDownload *)v277 initWithJSON:v276];
    }
    else {
      uint64_t v278 = [(GEOLogMsgStateOfflineDownload *)v277 initWithDictionary:v276];
    }
    v279 = (void *)v278;
    [a1 setOfflineDownload:v278];
  }
  a1 = a1;

LABEL_547:
  return a1;
}

- (GEOLogMsgState)initWithJSON:(id)a3
{
  return (GEOLogMsgState *)-[GEOLogMsgState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgState _readLookAroundView]((uint64_t)self);
  if ([(GEOLogMsgStateLookAroundView *)self->_lookAroundView hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgState _readMapView]((uint64_t)self);
  if ([(GEOLogMsgStateMapView *)self->_mapView hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgState _readMapsServer]((uint64_t)self);
  if ([(GEOLogMsgStateMapsServer *)self->_mapsServer hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgState _readPlaceRequest]((uint64_t)self);
  placeRequest = self->_placeRequest;

  return [(GEOLogMsgStatePlaceRequest *)placeRequest hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgState *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 118) = self->_readerMarkPos;
  *((_DWORD *)v5 + 119) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_stateOrigin) {
    objc_msgSend(v5, "setStateOrigin:");
  }
  if (self->_user) {
    objc_msgSend(v5, "setUser:");
  }
  int v4 = v5;
  if (self->_account)
  {
    objc_msgSend(v5, "setAccount:");
    int v4 = v5;
  }
  if (self->_rap)
  {
    objc_msgSend(v5, "setRap:");
    int v4 = v5;
  }
  if (self->_placeSummaryLayout)
  {
    objc_msgSend(v5, "setPlaceSummaryLayout:");
    int v4 = v5;
  }
  if (self->_transitStep)
  {
    objc_msgSend(v5, "setTransitStep:");
    int v4 = v5;
  }
  if (self->_nearbyTransit)
  {
    objc_msgSend(v5, "setNearbyTransit:");
    int v4 = v5;
  }
  if (self->_searchResults)
  {
    objc_msgSend(v5, "setSearchResults:");
    int v4 = v5;
  }
  if (self->_elementImpression)
  {
    objc_msgSend(v5, "setElementImpression:");
    int v4 = v5;
  }
  if (self->_impressionObject)
  {
    objc_msgSend(v5, "setImpressionObject:");
    int v4 = v5;
  }
  if (self->_tapEvent)
  {
    objc_msgSend(v5, "setTapEvent:");
    int v4 = v5;
  }
  if (self->_actionButtonDetails)
  {
    objc_msgSend(v5, "setActionButtonDetails:");
    int v4 = v5;
  }
  if (self->_routingWaypoints)
  {
    objc_msgSend(v5, "setRoutingWaypoints:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 121) = self->_stateType;
    v4[61] = (id)((unint64_t)v4[61] | 1);
  }
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v5, "setDeviceIdentifier:");
    int v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    int v4 = v5;
  }
  if (self->_deviceBase)
  {
    objc_msgSend(v5, "setDeviceBase:");
    int v4 = v5;
  }
  if (self->_deviceLocale)
  {
    objc_msgSend(v5, "setDeviceLocale:");
    int v4 = v5;
  }
  if (self->_deviceConnection)
  {
    objc_msgSend(v5, "setDeviceConnection:");
    int v4 = v5;
  }
  if (self->_carPlay)
  {
    objc_msgSend(v5, "setCarPlay:");
    int v4 = v5;
  }
  if (self->_pairedDevice)
  {
    objc_msgSend(v5, "setPairedDevice:");
    int v4 = v5;
  }
  if (self->_extension)
  {
    objc_msgSend(v5, "setExtension:");
    int v4 = v5;
  }
  if (self->_deviceSettings)
  {
    objc_msgSend(v5, "setDeviceSettings:");
    int v4 = v5;
  }
  if (self->_mapView)
  {
    objc_msgSend(v5, "setMapView:");
    int v4 = v5;
  }
  if (self->_mapViewLocation)
  {
    objc_msgSend(v5, "setMapViewLocation:");
    int v4 = v5;
  }
  if (self->_transit)
  {
    objc_msgSend(v5, "setTransit:");
    int v4 = v5;
  }
  if (self->_mapSettings)
  {
    objc_msgSend(v5, "setMapSettings:");
    int v4 = v5;
  }
  if (self->_mapUi)
  {
    objc_msgSend(v5, "setMapUi:");
    int v4 = v5;
  }
  if (self->_mapUiShown)
  {
    objc_msgSend(v5, "setMapUiShown:");
    int v4 = v5;
  }
  if (self->_userSession)
  {
    objc_msgSend(v5, "setUserSession:");
    int v4 = v5;
  }
  if (self->_experiments)
  {
    objc_msgSend(v5, "setExperiments:");
    int v4 = v5;
  }
  if (self->_placeCard)
  {
    objc_msgSend(v5, "setPlaceCard:");
    int v4 = v5;
  }
  if (self->_route)
  {
    objc_msgSend(v5, "setRoute:");
    int v4 = v5;
  }
  if (self->_mapsServer)
  {
    objc_msgSend(v5, "setMapsServer:");
    int v4 = v5;
  }
  if (self->_tileSet)
  {
    objc_msgSend(v5, "setTileSet:");
    int v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
    int v4 = v5;
  }
  if (self->_navigation)
  {
    objc_msgSend(v5, "setNavigation:");
    int v4 = v5;
  }
  if (self->_mapRestore)
  {
    objc_msgSend(v5, "setMapRestore:");
    int v4 = v5;
  }
  if (self->_suggestions)
  {
    objc_msgSend(v5, "setSuggestions:");
    int v4 = v5;
  }
  if (self->_offline)
  {
    objc_msgSend(v5, "setOffline:");
    int v4 = v5;
  }
  if (self->_summaryLookAroundLog)
  {
    objc_msgSend(v5, "setSummaryLookAroundLog:");
    int v4 = v5;
  }
  if (self->_detailLookAroundLog)
  {
    objc_msgSend(v5, "setDetailLookAroundLog:");
    int v4 = v5;
  }
  if (self->_lookAroundView)
  {
    objc_msgSend(v5, "setLookAroundView:");
    int v4 = v5;
  }
  if (self->_muninResource)
  {
    objc_msgSend(v5, "setMuninResource:");
    int v4 = v5;
  }
  if (self->_mapLaunch)
  {
    objc_msgSend(v5, "setMapLaunch:");
    int v4 = v5;
  }
  if (self->_curatedCollection)
  {
    objc_msgSend(v5, "setCuratedCollection:");
    int v4 = v5;
  }
  if (self->_ugcPhoto)
  {
    objc_msgSend(v5, "setUgcPhoto:");
    int v4 = v5;
  }
  if (self->_directionsDetail)
  {
    objc_msgSend(v5, "setDirectionsDetail:");
    int v4 = v5;
  }
  if (self->_market)
  {
    objc_msgSend(v5, "setMarket:");
    int v4 = v5;
  }
  if (self->_routingSettings)
  {
    objc_msgSend(v5, "setRoutingSettings:");
    int v4 = v5;
  }
  if (self->_mapsFeatures)
  {
    objc_msgSend(v5, "setMapsFeatures:");
    int v4 = v5;
  }
  if (self->_mapsUserSettings)
  {
    objc_msgSend(v5, "setMapsUserSettings:");
    int v4 = v5;
  }
  if (self->_arpPhotoSubmission)
  {
    objc_msgSend(v5, "setArpPhotoSubmission:");
    int v4 = v5;
  }
  if (self->_arpRatingSubmission)
  {
    objc_msgSend(v5, "setArpRatingSubmission:");
    int v4 = v5;
  }
  if (self->_arpRatingPhotoSubmission)
  {
    objc_msgSend(v5, "setArpRatingPhotoSubmission:");
    int v4 = v5;
  }
  if (self->_mapsPlaceIds)
  {
    objc_msgSend(v5, "setMapsPlaceIds:");
    int v4 = v5;
  }
  if (self->_placeCardRap)
  {
    objc_msgSend(v5, "setPlaceCardRap:");
    int v4 = v5;
  }
  if (self->_offlineDownload)
  {
    objc_msgSend(v5, "setOfflineDownload:");
    int v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_121;
  }
  [(GEOLogMsgState *)self readAll:1];
  [v4 readAll:1];
  stateOrigin = self->_stateOrigin;
  if ((unint64_t)stateOrigin | *((void *)v4 + 49))
  {
    if (!-[NSString isEqual:](stateOrigin, "isEqual:")) {
      goto LABEL_121;
    }
  }
  user = self->_user;
  if ((unint64_t)user | *((void *)v4 + 58))
  {
    if (!-[GEOLogMsgStateUser isEqual:](user, "isEqual:")) {
      goto LABEL_121;
    }
  }
  account = self->_account;
  if ((unint64_t)account | *((void *)v4 + 2))
  {
    if (!-[GEOLogMsgStateAccount isEqual:](account, "isEqual:")) {
      goto LABEL_121;
    }
  }
  rap = self->_rap;
  if ((unint64_t)rap | *((void *)v4 + 44))
  {
    if (!-[GEOLogMsgStateRAP isEqual:](rap, "isEqual:")) {
      goto LABEL_121;
    }
  }
  placeSummaryLayout = self->_placeSummaryLayout;
  if ((unint64_t)placeSummaryLayout | *((void *)v4 + 43))
  {
    if (!-[GEOLogMsgStatePlaceSummaryLayout isEqual:](placeSummaryLayout, "isEqual:")) {
      goto LABEL_121;
    }
  }
  transitStep = self->_transitStep;
  if ((unint64_t)transitStep | *((void *)v4 + 54))
  {
    if (!-[GEOLogMsgStateTransitStep isEqual:](transitStep, "isEqual:")) {
      goto LABEL_121;
    }
  }
  nearbyTransit = self->_nearbyTransit;
  if ((unint64_t)nearbyTransit | *((void *)v4 + 36))
  {
    if (!-[GEOLogMsgStateNearbyTransit isEqual:](nearbyTransit, "isEqual:")) {
      goto LABEL_121;
    }
  }
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((void *)v4 + 48))
  {
    if (!-[GEOLogMsgStateSearchResults isEqual:](searchResults, "isEqual:")) {
      goto LABEL_121;
    }
  }
  elementImpression = self->_elementImpression;
  if ((unint64_t)elementImpression | *((void *)v4 + 17))
  {
    if (!-[GEOLogMsgStateElementImpression isEqual:](elementImpression, "isEqual:")) {
      goto LABEL_121;
    }
  }
  impressionObject = self->_impressionObject;
  if ((unint64_t)impressionObject | *((void *)v4 + 20))
  {
    if (!-[GEOLogMsgStateImpressionObject isEqual:](impressionObject, "isEqual:")) {
      goto LABEL_121;
    }
  }
  tapEvent = self->_tapEvent;
  if ((unint64_t)tapEvent | *((void *)v4 + 52))
  {
    if (!-[GEOLogMsgStateTapEvent isEqual:](tapEvent, "isEqual:")) {
      goto LABEL_121;
    }
  }
  actionButtonDetails = self->_actionButtonDetails;
  if ((unint64_t)actionButtonDetails | *((void *)v4 + 3))
  {
    if (!-[GEOLogMsgStateActionButtonDetails isEqual:](actionButtonDetails, "isEqual:")) {
      goto LABEL_121;
    }
  }
  routingWaypoints = self->_routingWaypoints;
  if ((unint64_t)routingWaypoints | *((void *)v4 + 46))
  {
    if (!-[GEOLogMsgStateRoutingWaypoints isEqual:](routingWaypoints, "isEqual:")) {
      goto LABEL_121;
    }
  }
  uint64_t v18 = *((void *)v4 + 61);
  if (*(unsigned char *)&self->_flags)
  {
    if ((v18 & 1) == 0 || self->_stateType != *((_DWORD *)v4 + 121)) {
      goto LABEL_121;
    }
  }
  else if (v18)
  {
LABEL_121:
    char v63 = 0;
    goto LABEL_122;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((void *)v4 + 13)
    && !-[GEOLogMsgStateDeviceIdentifier isEqual:](deviceIdentifier, "isEqual:"))
  {
    goto LABEL_121;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((void *)v4 + 4))
  {
    if (!-[GEOLogMsgStateApplicationIdentifier isEqual:](applicationIdentifier, "isEqual:")) {
      goto LABEL_121;
    }
  }
  deviceBase = self->_deviceBase;
  if ((unint64_t)deviceBase | *((void *)v4 + 11))
  {
    if (!-[GEOLogMsgStateDeviceBase isEqual:](deviceBase, "isEqual:")) {
      goto LABEL_121;
    }
  }
  deviceLocale = self->_deviceLocale;
  if ((unint64_t)deviceLocale | *((void *)v4 + 14))
  {
    if (!-[GEOLogMsgStateDeviceLocale isEqual:](deviceLocale, "isEqual:")) {
      goto LABEL_121;
    }
  }
  deviceConnection = self->_deviceConnection;
  if ((unint64_t)deviceConnection | *((void *)v4 + 12))
  {
    if (!-[GEOLogMsgStateDeviceConnection isEqual:](deviceConnection, "isEqual:")) {
      goto LABEL_121;
    }
  }
  carPlay = self->_carPlay;
  if ((unint64_t)carPlay | *((void *)v4 + 8))
  {
    if (!-[GEOLogMsgStateCarPlay isEqual:](carPlay, "isEqual:")) {
      goto LABEL_121;
    }
  }
  pairedDevice = self->_pairedDevice;
  if ((unint64_t)pairedDevice | *((void *)v4 + 39))
  {
    if (!-[GEOLogMsgStatePairedDevice isEqual:](pairedDevice, "isEqual:")) {
      goto LABEL_121;
    }
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((void *)v4 + 19))
  {
    if (!-[GEOLogMsgStateExtension isEqual:](extension, "isEqual:")) {
      goto LABEL_121;
    }
  }
  deviceSettings = self->_deviceSettings;
  if ((unint64_t)deviceSettings | *((void *)v4 + 15))
  {
    if (!-[GEOLogMsgStateDeviceSettings isEqual:](deviceSettings, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapView = self->_mapView;
  if ((unint64_t)mapView | *((void *)v4 + 28))
  {
    if (!-[GEOLogMsgStateMapView isEqual:](mapView, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapViewLocation = self->_mapViewLocation;
  if ((unint64_t)mapViewLocation | *((void *)v4 + 27))
  {
    if (!-[GEOLogMsgStateMapViewLocation isEqual:](mapViewLocation, "isEqual:")) {
      goto LABEL_121;
    }
  }
  transit = self->_transit;
  if ((unint64_t)transit | *((void *)v4 + 55))
  {
    if (!-[GEOLogMsgStateTransit isEqual:](transit, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapSettings = self->_mapSettings;
  if ((unint64_t)mapSettings | *((void *)v4 + 24))
  {
    if (!-[GEOLogMsgStateMapSettings isEqual:](mapSettings, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapUi = self->_mapUi;
  if ((unint64_t)mapUi | *((void *)v4 + 26))
  {
    if (!-[GEOLogMsgStateMapUI isEqual:](mapUi, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapUiShown = self->_mapUiShown;
  if ((unint64_t)mapUiShown | *((void *)v4 + 25))
  {
    if (!-[GEOLogMsgStateMapUIShown isEqual:](mapUiShown, "isEqual:")) {
      goto LABEL_121;
    }
  }
  userSession = self->_userSession;
  if ((unint64_t)userSession | *((void *)v4 + 57))
  {
    if (!-[GEOLogMsgStateUserSession isEqual:](userSession, "isEqual:")) {
      goto LABEL_121;
    }
  }
  experiments = self->_experiments;
  if ((unint64_t)experiments | *((void *)v4 + 18))
  {
    if (!-[GEOLogMsgStateExperiments isEqual:](experiments, "isEqual:")) {
      goto LABEL_121;
    }
  }
  placeCard = self->_placeCard;
  if ((unint64_t)placeCard | *((void *)v4 + 41))
  {
    if (!-[GEOLogMsgStatePlaceCard isEqual:](placeCard, "isEqual:")) {
      goto LABEL_121;
    }
  }
  route = self->_route;
  if ((unint64_t)route | *((void *)v4 + 45))
  {
    if (!-[GEOLogMsgStateRoute isEqual:](route, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapsServer = self->_mapsServer;
  if ((unint64_t)mapsServer | *((void *)v4 + 31))
  {
    if (!-[GEOLogMsgStateMapsServer isEqual:](mapsServer, "isEqual:")) {
      goto LABEL_121;
    }
  }
  tileSet = self->_tileSet;
  if ((unint64_t)tileSet | *((void *)v4 + 53))
  {
    if (!-[GEOLogMsgStateTileSet isEqual:](tileSet, "isEqual:")) {
      goto LABEL_121;
    }
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((void *)v4 + 42))
  {
    if (!-[GEOLogMsgStatePlaceRequest isEqual:](placeRequest, "isEqual:")) {
      goto LABEL_121;
    }
  }
  navigation = self->_navigation;
  if ((unint64_t)navigation | *((void *)v4 + 35))
  {
    if (!-[GEOLogMsgStateNavigation isEqual:](navigation, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapRestore = self->_mapRestore;
  if ((unint64_t)mapRestore | *((void *)v4 + 23))
  {
    if (!-[GEOLogMsgStateMapRestore isEqual:](mapRestore, "isEqual:")) {
      goto LABEL_121;
    }
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((void *)v4 + 50))
  {
    if (!-[GEOLogMsgStateSuggestions isEqual:](suggestions, "isEqual:")) {
      goto LABEL_121;
    }
  }
  offline = self->_offline;
  if ((unint64_t)offline | *((void *)v4 + 38))
  {
    if (!-[GEOLogMsgStateOffline isEqual:](offline, "isEqual:")) {
      goto LABEL_121;
    }
  }
  summaryLookAroundLog = self->_summaryLookAroundLog;
  if ((unint64_t)summaryLookAroundLog | *((void *)v4 + 51))
  {
    if (!-[GEOLogMsgStateSummaryLookAroundLog isEqual:](summaryLookAroundLog, "isEqual:")) {
      goto LABEL_121;
    }
  }
  detailLookAroundLog = self->_detailLookAroundLog;
  if ((unint64_t)detailLookAroundLog | *((void *)v4 + 10))
  {
    if (!-[GEOLogMsgStateDetailLookAroundLog isEqual:](detailLookAroundLog, "isEqual:")) {
      goto LABEL_121;
    }
  }
  lookAroundView = self->_lookAroundView;
  if ((unint64_t)lookAroundView | *((void *)v4 + 21))
  {
    if (!-[GEOLogMsgStateLookAroundView isEqual:](lookAroundView, "isEqual:")) {
      goto LABEL_121;
    }
  }
  muninResource = self->_muninResource;
  if ((unint64_t)muninResource | *((void *)v4 + 34))
  {
    if (!-[GEOLogMsgStateMuninResource isEqual:](muninResource, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapLaunch = self->_mapLaunch;
  if ((unint64_t)mapLaunch | *((void *)v4 + 22))
  {
    if (!-[GEOLogMsgStateMapLaunch isEqual:](mapLaunch, "isEqual:")) {
      goto LABEL_121;
    }
  }
  curatedCollection = self->_curatedCollection;
  if ((unint64_t)curatedCollection | *((void *)v4 + 9))
  {
    if (!-[GEOLogMsgStateCuratedCollection isEqual:](curatedCollection, "isEqual:")) {
      goto LABEL_121;
    }
  }
  ugcPhoto = self->_ugcPhoto;
  if ((unint64_t)ugcPhoto | *((void *)v4 + 56))
  {
    if (!-[GEOLogMsgStateUGCPhoto isEqual:](ugcPhoto, "isEqual:")) {
      goto LABEL_121;
    }
  }
  directionsDetail = self->_directionsDetail;
  if ((unint64_t)directionsDetail | *((void *)v4 + 16))
  {
    if (!-[GEOLogMsgStateDirectionsDetail isEqual:](directionsDetail, "isEqual:")) {
      goto LABEL_121;
    }
  }
  market = self->_market;
  if ((unint64_t)market | *((void *)v4 + 33))
  {
    if (!-[GEOLogMsgStateMarket isEqual:](market, "isEqual:")) {
      goto LABEL_121;
    }
  }
  routingSettings = self->_routingSettings;
  if ((unint64_t)routingSettings | *((void *)v4 + 47))
  {
    if (!-[GEOLogMsgStateRoutingSettings isEqual:](routingSettings, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapsFeatures = self->_mapsFeatures;
  if ((unint64_t)mapsFeatures | *((void *)v4 + 29))
  {
    if (!-[GEOLogMsgStateMapsFeatures isEqual:](mapsFeatures, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapsUserSettings = self->_mapsUserSettings;
  if ((unint64_t)mapsUserSettings | *((void *)v4 + 32))
  {
    if (!-[GEOLogMsgStateMapsUserSettings isEqual:](mapsUserSettings, "isEqual:")) {
      goto LABEL_121;
    }
  }
  arpPhotoSubmission = self->_arpPhotoSubmission;
  if ((unint64_t)arpPhotoSubmission | *((void *)v4 + 5))
  {
    if (!-[GEOLogMsgStateARPPhotoSubmission isEqual:](arpPhotoSubmission, "isEqual:")) {
      goto LABEL_121;
    }
  }
  arpRatingSubmission = self->_arpRatingSubmission;
  if ((unint64_t)arpRatingSubmission | *((void *)v4 + 7))
  {
    if (!-[GEOLogMsgStateARPRatingSubmission isEqual:](arpRatingSubmission, "isEqual:")) {
      goto LABEL_121;
    }
  }
  arpRatingPhotoSubmission = self->_arpRatingPhotoSubmission;
  if ((unint64_t)arpRatingPhotoSubmission | *((void *)v4 + 6))
  {
    if (!-[GEOLogMsgStateARPRatingPhotoSubmission isEqual:](arpRatingPhotoSubmission, "isEqual:")) {
      goto LABEL_121;
    }
  }
  mapsPlaceIds = self->_mapsPlaceIds;
  if ((unint64_t)mapsPlaceIds | *((void *)v4 + 30))
  {
    if (!-[GEOLogMsgStateMapsPlaceIds isEqual:](mapsPlaceIds, "isEqual:")) {
      goto LABEL_121;
    }
  }
  placeCardRap = self->_placeCardRap;
  if ((unint64_t)placeCardRap | *((void *)v4 + 40))
  {
    if (!-[GEOLogMsgStatePlaceCardRap isEqual:](placeCardRap, "isEqual:")) {
      goto LABEL_121;
    }
  }
  offlineDownload = self->_offlineDownload;
  if ((unint64_t)offlineDownload | *((void *)v4 + 37)) {
    char v63 = -[GEOLogMsgStateOfflineDownload isEqual:](offlineDownload, "isEqual:");
  }
  else {
    char v63 = 1;
  }
LABEL_122:

  return v63;
}

- (unint64_t)hash
{
  [(GEOLogMsgState *)self readAll:1];
  NSUInteger v60 = [(NSString *)self->_stateOrigin hash];
  unint64_t v59 = [(GEOLogMsgStateUser *)self->_user hash];
  unint64_t v58 = [(GEOLogMsgStateAccount *)self->_account hash];
  unint64_t v57 = [(GEOLogMsgStateRAP *)self->_rap hash];
  unint64_t v3 = [(GEOLogMsgStatePlaceSummaryLayout *)self->_placeSummaryLayout hash];
  unint64_t v4 = [(GEOLogMsgStateTransitStep *)self->_transitStep hash];
  unint64_t v5 = [(GEOLogMsgStateNearbyTransit *)self->_nearbyTransit hash];
  unint64_t v6 = [(GEOLogMsgStateSearchResults *)self->_searchResults hash];
  unint64_t v7 = [(GEOLogMsgStateElementImpression *)self->_elementImpression hash];
  unint64_t v8 = [(GEOLogMsgStateImpressionObject *)self->_impressionObject hash];
  unint64_t v9 = [(GEOLogMsgStateTapEvent *)self->_tapEvent hash];
  unint64_t v10 = [(GEOLogMsgStateActionButtonDetails *)self->_actionButtonDetails hash];
  unint64_t v11 = [(GEOLogMsgStateRoutingWaypoints *)self->_routingWaypoints hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v12 = 2654435761 * self->_stateType;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = v10 ^ v11 ^ v12 ^ [(GEOLogMsgStateDeviceIdentifier *)self->_deviceIdentifier hash];
  unint64_t v14 = v59 ^ v60 ^ v58 ^ v57 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ [(GEOLogMsgStateApplicationIdentifier *)self->_applicationIdentifier hash];
  unint64_t v15 = [(GEOLogMsgStateDeviceBase *)self->_deviceBase hash];
  unint64_t v16 = v15 ^ [(GEOLogMsgStateDeviceLocale *)self->_deviceLocale hash];
  unint64_t v17 = v16 ^ [(GEOLogMsgStateDeviceConnection *)self->_deviceConnection hash];
  unint64_t v18 = v17 ^ [(GEOLogMsgStateCarPlay *)self->_carPlay hash];
  unint64_t v19 = v18 ^ [(GEOLogMsgStatePairedDevice *)self->_pairedDevice hash];
  unint64_t v20 = v14 ^ v19 ^ [(GEOLogMsgStateExtension *)self->_extension hash];
  unint64_t v21 = [(GEOLogMsgStateDeviceSettings *)self->_deviceSettings hash];
  unint64_t v22 = v21 ^ [(GEOLogMsgStateMapView *)self->_mapView hash];
  unint64_t v23 = v22 ^ [(GEOLogMsgStateMapViewLocation *)self->_mapViewLocation hash];
  unint64_t v24 = v23 ^ [(GEOLogMsgStateTransit *)self->_transit hash];
  unint64_t v25 = v24 ^ [(GEOLogMsgStateMapSettings *)self->_mapSettings hash];
  unint64_t v26 = v25 ^ [(GEOLogMsgStateMapUI *)self->_mapUi hash];
  unint64_t v27 = v20 ^ v26 ^ [(GEOLogMsgStateMapUIShown *)self->_mapUiShown hash];
  unint64_t v28 = [(GEOLogMsgStateUserSession *)self->_userSession hash];
  unint64_t v29 = v28 ^ [(GEOLogMsgStateExperiments *)self->_experiments hash];
  unint64_t v30 = v29 ^ [(GEOLogMsgStatePlaceCard *)self->_placeCard hash];
  unint64_t v31 = v30 ^ [(GEOLogMsgStateRoute *)self->_route hash];
  unint64_t v32 = v31 ^ [(GEOLogMsgStateMapsServer *)self->_mapsServer hash];
  unint64_t v33 = v32 ^ [(GEOLogMsgStateTileSet *)self->_tileSet hash];
  unint64_t v34 = v33 ^ [(GEOLogMsgStatePlaceRequest *)self->_placeRequest hash];
  unint64_t v35 = v27 ^ v34 ^ [(GEOLogMsgStateNavigation *)self->_navigation hash];
  unint64_t v36 = [(GEOLogMsgStateMapRestore *)self->_mapRestore hash];
  unint64_t v37 = v36 ^ [(GEOLogMsgStateSuggestions *)self->_suggestions hash];
  unint64_t v38 = v37 ^ [(GEOLogMsgStateOffline *)self->_offline hash];
  unint64_t v39 = v38 ^ [(GEOLogMsgStateSummaryLookAroundLog *)self->_summaryLookAroundLog hash];
  unint64_t v40 = v39 ^ [(GEOLogMsgStateDetailLookAroundLog *)self->_detailLookAroundLog hash];
  unint64_t v41 = v40 ^ [(GEOLogMsgStateLookAroundView *)self->_lookAroundView hash];
  unint64_t v42 = v41 ^ [(GEOLogMsgStateMuninResource *)self->_muninResource hash];
  unint64_t v43 = v42 ^ [(GEOLogMsgStateMapLaunch *)self->_mapLaunch hash];
  unint64_t v44 = v35 ^ v43 ^ [(GEOLogMsgStateCuratedCollection *)self->_curatedCollection hash];
  unint64_t v45 = [(GEOLogMsgStateUGCPhoto *)self->_ugcPhoto hash];
  unint64_t v46 = v45 ^ [(GEOLogMsgStateDirectionsDetail *)self->_directionsDetail hash];
  unint64_t v47 = v46 ^ [(GEOLogMsgStateMarket *)self->_market hash];
  unint64_t v48 = v47 ^ [(GEOLogMsgStateRoutingSettings *)self->_routingSettings hash];
  unint64_t v49 = v48 ^ [(GEOLogMsgStateMapsFeatures *)self->_mapsFeatures hash];
  unint64_t v50 = v49 ^ [(GEOLogMsgStateMapsUserSettings *)self->_mapsUserSettings hash];
  unint64_t v51 = v50 ^ [(GEOLogMsgStateARPPhotoSubmission *)self->_arpPhotoSubmission hash];
  unint64_t v52 = v51 ^ [(GEOLogMsgStateARPRatingSubmission *)self->_arpRatingSubmission hash];
  unint64_t v53 = v52 ^ [(GEOLogMsgStateARPRatingPhotoSubmission *)self->_arpRatingPhotoSubmission hash];
  unint64_t v54 = v44 ^ v53 ^ [(GEOLogMsgStateMapsPlaceIds *)self->_mapsPlaceIds hash];
  unint64_t v55 = [(GEOLogMsgStatePlaceCardRap *)self->_placeCardRap hash];
  return v54 ^ v55 ^ [(GEOLogMsgStateOfflineDownload *)self->_offlineDownload hash];
}

- (void)mergeFrom:(id)a3
{
  id v117 = a3;
  [v117 readAll:0];
  unint64_t v4 = v117;
  if (v117[49])
  {
    -[GEOLogMsgState setStateOrigin:](self, "setStateOrigin:");
    unint64_t v4 = v117;
  }
  user = self->_user;
  uint64_t v6 = v4[58];
  if (user)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgStateUser mergeFrom:](user, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgState setUser:](self, "setUser:");
  }
  unint64_t v4 = v117;
LABEL_9:
  account = self->_account;
  uint64_t v8 = v4[2];
  if (account)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLogMsgStateAccount mergeFrom:](account, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLogMsgState setAccount:](self, "setAccount:");
  }
  unint64_t v4 = v117;
LABEL_15:
  rap = self->_rap;
  uint64_t v10 = v4[44];
  if (rap)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOLogMsgStateRAP mergeFrom:](rap, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOLogMsgState setRap:](self, "setRap:");
  }
  unint64_t v4 = v117;
LABEL_21:
  placeSummaryLayout = self->_placeSummaryLayout;
  uint64_t v12 = v4[43];
  if (placeSummaryLayout)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOLogMsgStatePlaceSummaryLayout mergeFrom:](placeSummaryLayout, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    [(GEOLogMsgState *)self setPlaceSummaryLayout:"setPlaceSummaryLayout:"];
  }
  unint64_t v4 = v117;
LABEL_27:
  transitStep = self->_transitStep;
  uint64_t v14 = v4[54];
  if (transitStep)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOLogMsgStateTransitStep mergeFrom:](transitStep, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[GEOLogMsgState setTransitStep:](self, "setTransitStep:");
  }
  unint64_t v4 = v117;
LABEL_33:
  nearbyTransit = self->_nearbyTransit;
  uint64_t v16 = v4[36];
  if (nearbyTransit)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOLogMsgStateNearbyTransit mergeFrom:](nearbyTransit, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[GEOLogMsgState setNearbyTransit:](self, "setNearbyTransit:");
  }
  unint64_t v4 = v117;
LABEL_39:
  searchResults = self->_searchResults;
  uint64_t v18 = v4[48];
  if (searchResults)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOLogMsgStateSearchResults mergeFrom:](searchResults, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[GEOLogMsgState setSearchResults:](self, "setSearchResults:");
  }
  unint64_t v4 = v117;
LABEL_45:
  elementImpression = self->_elementImpression;
  uint64_t v20 = v4[17];
  if (elementImpression)
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOLogMsgStateElementImpression mergeFrom:](elementImpression, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[GEOLogMsgState setElementImpression:](self, "setElementImpression:");
  }
  unint64_t v4 = v117;
LABEL_51:
  impressionObject = self->_impressionObject;
  uint64_t v22 = v4[20];
  if (impressionObject)
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOLogMsgStateImpressionObject mergeFrom:](impressionObject, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_57;
    }
    -[GEOLogMsgState setImpressionObject:](self, "setImpressionObject:");
  }
  unint64_t v4 = v117;
LABEL_57:
  tapEvent = self->_tapEvent;
  uint64_t v24 = v4[52];
  if (tapEvent)
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOLogMsgStateTapEvent mergeFrom:](tapEvent, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_63;
    }
    -[GEOLogMsgState setTapEvent:](self, "setTapEvent:");
  }
  unint64_t v4 = v117;
LABEL_63:
  actionButtonDetails = self->_actionButtonDetails;
  uint64_t v26 = v4[3];
  if (actionButtonDetails)
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOLogMsgStateActionButtonDetails mergeFrom:](actionButtonDetails, "mergeFrom:");
  }
  else
  {
    if (!v26) {
      goto LABEL_69;
    }
    -[GEOLogMsgState setActionButtonDetails:](self, "setActionButtonDetails:");
  }
  unint64_t v4 = v117;
LABEL_69:
  routingWaypoints = self->_routingWaypoints;
  uint64_t v28 = v4[46];
  if (routingWaypoints)
  {
    if (!v28) {
      goto LABEL_75;
    }
    -[GEOLogMsgStateRoutingWaypoints mergeFrom:](routingWaypoints, "mergeFrom:");
  }
  else
  {
    if (!v28) {
      goto LABEL_75;
    }
    [(GEOLogMsgState *)self setRoutingWaypoints:"setRoutingWaypoints:"];
  }
  unint64_t v4 = v117;
LABEL_75:
  if (v4[61])
  {
    self->_stateType = *((_DWORD *)v4 + 121);
    *(void *)&self->_flags |= 1uLL;
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v30 = v4[13];
  if (deviceIdentifier)
  {
    if (!v30) {
      goto LABEL_83;
    }
    -[GEOLogMsgStateDeviceIdentifier mergeFrom:](deviceIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v30) {
      goto LABEL_83;
    }
    -[GEOLogMsgState setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
  unint64_t v4 = v117;
LABEL_83:
  applicationIdentifier = self->_applicationIdentifier;
  uint64_t v32 = v4[4];
  if (applicationIdentifier)
  {
    if (!v32) {
      goto LABEL_89;
    }
    -[GEOLogMsgStateApplicationIdentifier mergeFrom:](applicationIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v32) {
      goto LABEL_89;
    }
    -[GEOLogMsgState setApplicationIdentifier:](self, "setApplicationIdentifier:");
  }
  unint64_t v4 = v117;
LABEL_89:
  deviceBase = self->_deviceBase;
  uint64_t v34 = v4[11];
  if (deviceBase)
  {
    if (!v34) {
      goto LABEL_95;
    }
    -[GEOLogMsgStateDeviceBase mergeFrom:](deviceBase, "mergeFrom:");
  }
  else
  {
    if (!v34) {
      goto LABEL_95;
    }
    -[GEOLogMsgState setDeviceBase:](self, "setDeviceBase:");
  }
  unint64_t v4 = v117;
LABEL_95:
  deviceLocale = self->_deviceLocale;
  uint64_t v36 = v4[14];
  if (deviceLocale)
  {
    if (!v36) {
      goto LABEL_101;
    }
    -[GEOLogMsgStateDeviceLocale mergeFrom:](deviceLocale, "mergeFrom:");
  }
  else
  {
    if (!v36) {
      goto LABEL_101;
    }
    -[GEOLogMsgState setDeviceLocale:](self, "setDeviceLocale:");
  }
  unint64_t v4 = v117;
LABEL_101:
  deviceConnection = self->_deviceConnection;
  uint64_t v38 = v4[12];
  if (deviceConnection)
  {
    if (!v38) {
      goto LABEL_107;
    }
    -[GEOLogMsgStateDeviceConnection mergeFrom:](deviceConnection, "mergeFrom:");
  }
  else
  {
    if (!v38) {
      goto LABEL_107;
    }
    -[GEOLogMsgState setDeviceConnection:](self, "setDeviceConnection:");
  }
  unint64_t v4 = v117;
LABEL_107:
  carPlay = self->_carPlay;
  uint64_t v40 = v4[8];
  if (carPlay)
  {
    if (!v40) {
      goto LABEL_113;
    }
    -[GEOLogMsgStateCarPlay mergeFrom:](carPlay, "mergeFrom:");
  }
  else
  {
    if (!v40) {
      goto LABEL_113;
    }
    -[GEOLogMsgState setCarPlay:](self, "setCarPlay:");
  }
  unint64_t v4 = v117;
LABEL_113:
  pairedDevice = self->_pairedDevice;
  uint64_t v42 = v4[39];
  if (pairedDevice)
  {
    if (!v42) {
      goto LABEL_119;
    }
    -[GEOLogMsgStatePairedDevice mergeFrom:](pairedDevice, "mergeFrom:");
  }
  else
  {
    if (!v42) {
      goto LABEL_119;
    }
    -[GEOLogMsgState setPairedDevice:](self, "setPairedDevice:");
  }
  unint64_t v4 = v117;
LABEL_119:
  extension = self->_extension;
  uint64_t v44 = v4[19];
  if (extension)
  {
    if (!v44) {
      goto LABEL_125;
    }
    -[GEOLogMsgStateExtension mergeFrom:](extension, "mergeFrom:");
  }
  else
  {
    if (!v44) {
      goto LABEL_125;
    }
    -[GEOLogMsgState setExtension:](self, "setExtension:");
  }
  unint64_t v4 = v117;
LABEL_125:
  deviceSettings = self->_deviceSettings;
  uint64_t v46 = v4[15];
  if (deviceSettings)
  {
    if (!v46) {
      goto LABEL_131;
    }
    -[GEOLogMsgStateDeviceSettings mergeFrom:](deviceSettings, "mergeFrom:");
  }
  else
  {
    if (!v46) {
      goto LABEL_131;
    }
    -[GEOLogMsgState setDeviceSettings:](self, "setDeviceSettings:");
  }
  unint64_t v4 = v117;
LABEL_131:
  mapView = self->_mapView;
  uint64_t v48 = v4[28];
  if (mapView)
  {
    if (!v48) {
      goto LABEL_137;
    }
    -[GEOLogMsgStateMapView mergeFrom:](mapView, "mergeFrom:");
  }
  else
  {
    if (!v48) {
      goto LABEL_137;
    }
    -[GEOLogMsgState setMapView:](self, "setMapView:");
  }
  unint64_t v4 = v117;
LABEL_137:
  mapViewLocation = self->_mapViewLocation;
  uint64_t v50 = v4[27];
  if (mapViewLocation)
  {
    if (!v50) {
      goto LABEL_143;
    }
    -[GEOLogMsgStateMapViewLocation mergeFrom:](mapViewLocation, "mergeFrom:");
  }
  else
  {
    if (!v50) {
      goto LABEL_143;
    }
    -[GEOLogMsgState setMapViewLocation:](self, "setMapViewLocation:");
  }
  unint64_t v4 = v117;
LABEL_143:
  transit = self->_transit;
  uint64_t v52 = v4[55];
  if (transit)
  {
    if (!v52) {
      goto LABEL_149;
    }
    -[GEOLogMsgStateTransit mergeFrom:](transit, "mergeFrom:");
  }
  else
  {
    if (!v52) {
      goto LABEL_149;
    }
    -[GEOLogMsgState setTransit:](self, "setTransit:");
  }
  unint64_t v4 = v117;
LABEL_149:
  mapSettings = self->_mapSettings;
  uint64_t v54 = v4[24];
  if (mapSettings)
  {
    if (!v54) {
      goto LABEL_155;
    }
    -[GEOLogMsgStateMapSettings mergeFrom:](mapSettings, "mergeFrom:");
  }
  else
  {
    if (!v54) {
      goto LABEL_155;
    }
    -[GEOLogMsgState setMapSettings:](self, "setMapSettings:");
  }
  unint64_t v4 = v117;
LABEL_155:
  mapUi = self->_mapUi;
  uint64_t v56 = v4[26];
  if (mapUi)
  {
    if (!v56) {
      goto LABEL_161;
    }
    -[GEOLogMsgStateMapUI mergeFrom:](mapUi, "mergeFrom:");
  }
  else
  {
    if (!v56) {
      goto LABEL_161;
    }
    -[GEOLogMsgState setMapUi:](self, "setMapUi:");
  }
  unint64_t v4 = v117;
LABEL_161:
  mapUiShown = self->_mapUiShown;
  uint64_t v58 = v4[25];
  if (mapUiShown)
  {
    if (!v58) {
      goto LABEL_167;
    }
    -[GEOLogMsgStateMapUIShown mergeFrom:](mapUiShown, "mergeFrom:");
  }
  else
  {
    if (!v58) {
      goto LABEL_167;
    }
    -[GEOLogMsgState setMapUiShown:](self, "setMapUiShown:");
  }
  unint64_t v4 = v117;
LABEL_167:
  userSession = self->_userSession;
  uint64_t v60 = v4[57];
  if (userSession)
  {
    if (!v60) {
      goto LABEL_173;
    }
    -[GEOLogMsgStateUserSession mergeFrom:](userSession, "mergeFrom:");
  }
  else
  {
    if (!v60) {
      goto LABEL_173;
    }
    -[GEOLogMsgState setUserSession:](self, "setUserSession:");
  }
  unint64_t v4 = v117;
LABEL_173:
  experiments = self->_experiments;
  uint64_t v62 = v4[18];
  if (experiments)
  {
    if (!v62) {
      goto LABEL_179;
    }
    -[GEOLogMsgStateExperiments mergeFrom:](experiments, "mergeFrom:");
  }
  else
  {
    if (!v62) {
      goto LABEL_179;
    }
    -[GEOLogMsgState setExperiments:](self, "setExperiments:");
  }
  unint64_t v4 = v117;
LABEL_179:
  placeCard = self->_placeCard;
  uint64_t v64 = v4[41];
  if (placeCard)
  {
    if (!v64) {
      goto LABEL_185;
    }
    -[GEOLogMsgStatePlaceCard mergeFrom:](placeCard, "mergeFrom:");
  }
  else
  {
    if (!v64) {
      goto LABEL_185;
    }
    -[GEOLogMsgState setPlaceCard:](self, "setPlaceCard:");
  }
  unint64_t v4 = v117;
LABEL_185:
  route = self->_route;
  uint64_t v66 = v4[45];
  if (route)
  {
    if (!v66) {
      goto LABEL_191;
    }
    -[GEOLogMsgStateRoute mergeFrom:](route, "mergeFrom:");
  }
  else
  {
    if (!v66) {
      goto LABEL_191;
    }
    [(GEOLogMsgState *)self setRoute:"setRoute:"];
  }
  unint64_t v4 = v117;
LABEL_191:
  mapsServer = self->_mapsServer;
  uint64_t v68 = v4[31];
  if (mapsServer)
  {
    if (!v68) {
      goto LABEL_197;
    }
    -[GEOLogMsgStateMapsServer mergeFrom:](mapsServer, "mergeFrom:");
  }
  else
  {
    if (!v68) {
      goto LABEL_197;
    }
    -[GEOLogMsgState setMapsServer:](self, "setMapsServer:");
  }
  unint64_t v4 = v117;
LABEL_197:
  tileSet = self->_tileSet;
  uint64_t v70 = v4[53];
  if (tileSet)
  {
    if (!v70) {
      goto LABEL_203;
    }
    -[GEOLogMsgStateTileSet mergeFrom:](tileSet, "mergeFrom:");
  }
  else
  {
    if (!v70) {
      goto LABEL_203;
    }
    -[GEOLogMsgState setTileSet:](self, "setTileSet:");
  }
  unint64_t v4 = v117;
LABEL_203:
  placeRequest = self->_placeRequest;
  uint64_t v72 = v4[42];
  if (placeRequest)
  {
    if (!v72) {
      goto LABEL_209;
    }
    -[GEOLogMsgStatePlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v72) {
      goto LABEL_209;
    }
    -[GEOLogMsgState setPlaceRequest:](self, "setPlaceRequest:");
  }
  unint64_t v4 = v117;
LABEL_209:
  navigation = self->_navigation;
  uint64_t v74 = v4[35];
  if (navigation)
  {
    if (!v74) {
      goto LABEL_215;
    }
    -[GEOLogMsgStateNavigation mergeFrom:](navigation, "mergeFrom:");
  }
  else
  {
    if (!v74) {
      goto LABEL_215;
    }
    -[GEOLogMsgState setNavigation:](self, "setNavigation:");
  }
  unint64_t v4 = v117;
LABEL_215:
  mapRestore = self->_mapRestore;
  uint64_t v76 = v4[23];
  if (mapRestore)
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[GEOLogMsgStateMapRestore mergeFrom:](mapRestore, "mergeFrom:");
  }
  else
  {
    if (!v76) {
      goto LABEL_221;
    }
    -[GEOLogMsgState setMapRestore:](self, "setMapRestore:");
  }
  unint64_t v4 = v117;
LABEL_221:
  suggestions = self->_suggestions;
  uint64_t v78 = v4[50];
  if (suggestions)
  {
    if (!v78) {
      goto LABEL_227;
    }
    -[GEOLogMsgStateSuggestions mergeFrom:](suggestions, "mergeFrom:");
  }
  else
  {
    if (!v78) {
      goto LABEL_227;
    }
    -[GEOLogMsgState setSuggestions:](self, "setSuggestions:");
  }
  unint64_t v4 = v117;
LABEL_227:
  offline = self->_offline;
  uint64_t v80 = v4[38];
  if (offline)
  {
    if (!v80) {
      goto LABEL_233;
    }
    -[GEOLogMsgStateOffline mergeFrom:](offline, "mergeFrom:");
  }
  else
  {
    if (!v80) {
      goto LABEL_233;
    }
    -[GEOLogMsgState setOffline:](self, "setOffline:");
  }
  unint64_t v4 = v117;
LABEL_233:
  summaryLookAroundLog = self->_summaryLookAroundLog;
  uint64_t v82 = v4[51];
  if (summaryLookAroundLog)
  {
    if (!v82) {
      goto LABEL_239;
    }
    -[GEOLogMsgStateSummaryLookAroundLog mergeFrom:](summaryLookAroundLog, "mergeFrom:");
  }
  else
  {
    if (!v82) {
      goto LABEL_239;
    }
    -[GEOLogMsgState setSummaryLookAroundLog:](self, "setSummaryLookAroundLog:");
  }
  unint64_t v4 = v117;
LABEL_239:
  detailLookAroundLog = self->_detailLookAroundLog;
  uint64_t v84 = v4[10];
  if (detailLookAroundLog)
  {
    if (!v84) {
      goto LABEL_245;
    }
    -[GEOLogMsgStateDetailLookAroundLog mergeFrom:](detailLookAroundLog, "mergeFrom:");
  }
  else
  {
    if (!v84) {
      goto LABEL_245;
    }
    -[GEOLogMsgState setDetailLookAroundLog:](self, "setDetailLookAroundLog:");
  }
  unint64_t v4 = v117;
LABEL_245:
  lookAroundView = self->_lookAroundView;
  uint64_t v86 = v4[21];
  if (lookAroundView)
  {
    if (!v86) {
      goto LABEL_251;
    }
    -[GEOLogMsgStateLookAroundView mergeFrom:](lookAroundView, "mergeFrom:");
  }
  else
  {
    if (!v86) {
      goto LABEL_251;
    }
    -[GEOLogMsgState setLookAroundView:](self, "setLookAroundView:");
  }
  unint64_t v4 = v117;
LABEL_251:
  muninResource = self->_muninResource;
  uint64_t v88 = v4[34];
  if (muninResource)
  {
    if (!v88) {
      goto LABEL_257;
    }
    -[GEOLogMsgStateMuninResource mergeFrom:](muninResource, "mergeFrom:");
  }
  else
  {
    if (!v88) {
      goto LABEL_257;
    }
    -[GEOLogMsgState setMuninResource:](self, "setMuninResource:");
  }
  unint64_t v4 = v117;
LABEL_257:
  mapLaunch = self->_mapLaunch;
  uint64_t v90 = v4[22];
  if (mapLaunch)
  {
    if (!v90) {
      goto LABEL_263;
    }
    -[GEOLogMsgStateMapLaunch mergeFrom:](mapLaunch, "mergeFrom:");
  }
  else
  {
    if (!v90) {
      goto LABEL_263;
    }
    -[GEOLogMsgState setMapLaunch:](self, "setMapLaunch:");
  }
  unint64_t v4 = v117;
LABEL_263:
  curatedCollection = self->_curatedCollection;
  uint64_t v92 = v4[9];
  if (curatedCollection)
  {
    if (!v92) {
      goto LABEL_269;
    }
    -[GEOLogMsgStateCuratedCollection mergeFrom:](curatedCollection, "mergeFrom:");
  }
  else
  {
    if (!v92) {
      goto LABEL_269;
    }
    -[GEOLogMsgState setCuratedCollection:](self, "setCuratedCollection:");
  }
  unint64_t v4 = v117;
LABEL_269:
  ugcPhoto = self->_ugcPhoto;
  uint64_t v94 = v4[56];
  if (ugcPhoto)
  {
    if (!v94) {
      goto LABEL_275;
    }
    -[GEOLogMsgStateUGCPhoto mergeFrom:](ugcPhoto, "mergeFrom:");
  }
  else
  {
    if (!v94) {
      goto LABEL_275;
    }
    -[GEOLogMsgState setUgcPhoto:](self, "setUgcPhoto:");
  }
  unint64_t v4 = v117;
LABEL_275:
  directionsDetail = self->_directionsDetail;
  uint64_t v96 = v4[16];
  if (directionsDetail)
  {
    if (!v96) {
      goto LABEL_281;
    }
    -[GEOLogMsgStateDirectionsDetail mergeFrom:](directionsDetail, "mergeFrom:");
  }
  else
  {
    if (!v96) {
      goto LABEL_281;
    }
    -[GEOLogMsgState setDirectionsDetail:](self, "setDirectionsDetail:");
  }
  unint64_t v4 = v117;
LABEL_281:
  market = self->_market;
  uint64_t v98 = v4[33];
  if (market)
  {
    if (!v98) {
      goto LABEL_287;
    }
    -[GEOLogMsgStateMarket mergeFrom:](market, "mergeFrom:");
  }
  else
  {
    if (!v98) {
      goto LABEL_287;
    }
    -[GEOLogMsgState setMarket:](self, "setMarket:");
  }
  unint64_t v4 = v117;
LABEL_287:
  routingSettings = self->_routingSettings;
  uint64_t v100 = v4[47];
  if (routingSettings)
  {
    if (!v100) {
      goto LABEL_293;
    }
    -[GEOLogMsgStateRoutingSettings mergeFrom:](routingSettings, "mergeFrom:");
  }
  else
  {
    if (!v100) {
      goto LABEL_293;
    }
    [(GEOLogMsgState *)self setRoutingSettings:"setRoutingSettings:"];
  }
  unint64_t v4 = v117;
LABEL_293:
  mapsFeatures = self->_mapsFeatures;
  uint64_t v102 = v4[29];
  if (mapsFeatures)
  {
    if (!v102) {
      goto LABEL_299;
    }
    -[GEOLogMsgStateMapsFeatures mergeFrom:](mapsFeatures, "mergeFrom:");
  }
  else
  {
    if (!v102) {
      goto LABEL_299;
    }
    -[GEOLogMsgState setMapsFeatures:](self, "setMapsFeatures:");
  }
  unint64_t v4 = v117;
LABEL_299:
  mapsUserSettings = self->_mapsUserSettings;
  uint64_t v104 = v4[32];
  if (mapsUserSettings)
  {
    if (!v104) {
      goto LABEL_305;
    }
    -[GEOLogMsgStateMapsUserSettings mergeFrom:](mapsUserSettings, "mergeFrom:");
  }
  else
  {
    if (!v104) {
      goto LABEL_305;
    }
    -[GEOLogMsgState setMapsUserSettings:](self, "setMapsUserSettings:");
  }
  unint64_t v4 = v117;
LABEL_305:
  arpPhotoSubmission = self->_arpPhotoSubmission;
  uint64_t v106 = v4[5];
  if (arpPhotoSubmission)
  {
    if (!v106) {
      goto LABEL_311;
    }
    -[GEOLogMsgStateARPPhotoSubmission mergeFrom:](arpPhotoSubmission, "mergeFrom:");
  }
  else
  {
    if (!v106) {
      goto LABEL_311;
    }
    -[GEOLogMsgState setArpPhotoSubmission:](self, "setArpPhotoSubmission:");
  }
  unint64_t v4 = v117;
LABEL_311:
  arpRatingSubmission = self->_arpRatingSubmission;
  uint64_t v108 = v4[7];
  if (arpRatingSubmission)
  {
    if (!v108) {
      goto LABEL_317;
    }
    -[GEOLogMsgStateARPRatingSubmission mergeFrom:](arpRatingSubmission, "mergeFrom:");
  }
  else
  {
    if (!v108) {
      goto LABEL_317;
    }
    -[GEOLogMsgState setArpRatingSubmission:](self, "setArpRatingSubmission:");
  }
  unint64_t v4 = v117;
LABEL_317:
  arpRatingPhotoSubmission = self->_arpRatingPhotoSubmission;
  uint64_t v110 = v4[6];
  if (arpRatingPhotoSubmission)
  {
    if (!v110) {
      goto LABEL_323;
    }
    -[GEOLogMsgStateARPRatingPhotoSubmission mergeFrom:](arpRatingPhotoSubmission, "mergeFrom:");
  }
  else
  {
    if (!v110) {
      goto LABEL_323;
    }
    -[GEOLogMsgState setArpRatingPhotoSubmission:](self, "setArpRatingPhotoSubmission:");
  }
  unint64_t v4 = v117;
LABEL_323:
  mapsPlaceIds = self->_mapsPlaceIds;
  uint64_t v112 = v4[30];
  if (mapsPlaceIds)
  {
    if (!v112) {
      goto LABEL_329;
    }
    -[GEOLogMsgStateMapsPlaceIds mergeFrom:](mapsPlaceIds, "mergeFrom:");
  }
  else
  {
    if (!v112) {
      goto LABEL_329;
    }
    -[GEOLogMsgState setMapsPlaceIds:](self, "setMapsPlaceIds:");
  }
  unint64_t v4 = v117;
LABEL_329:
  placeCardRap = self->_placeCardRap;
  uint64_t v114 = v4[40];
  if (placeCardRap)
  {
    if (!v114) {
      goto LABEL_335;
    }
    -[GEOLogMsgStatePlaceCardRap mergeFrom:](placeCardRap, "mergeFrom:");
  }
  else
  {
    if (!v114) {
      goto LABEL_335;
    }
    -[GEOLogMsgState setPlaceCardRap:](self, "setPlaceCardRap:");
  }
  unint64_t v4 = v117;
LABEL_335:
  offlineDownload = self->_offlineDownload;
  uint64_t v116 = v4[37];
  if (offlineDownload)
  {
    if (!v116) {
      goto LABEL_341;
    }
    -[GEOLogMsgStateOfflineDownload mergeFrom:](offlineDownload, "mergeFrom:");
  }
  else
  {
    if (!v116) {
      goto LABEL_341;
    }
    -[GEOLogMsgState setOfflineDownload:](self, "setOfflineDownload:");
  }
  unint64_t v4 = v117;
LABEL_341:
}

@end