@interface GEORPFeedbackDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddMapFeedback;
- (BOOL)hasAddressPointFeedback;
- (BOOL)hasCuratedCollectionFeedback;
- (BOOL)hasDirectionsFeedback;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasGroundViewFeedback;
- (BOOL)hasIncidentFeedback;
- (BOOL)hasLocalityFeedback;
- (BOOL)hasMerchantLookupFeedback;
- (BOOL)hasPhotoAttributionPreferencesUpdate;
- (BOOL)hasPoiActivityFeedback;
- (BOOL)hasPoiEnrichmentUpdate;
- (BOOL)hasPoiFeedback;
- (BOOL)hasPoiImageFeedback;
- (BOOL)hasRapUserResponseFeedback;
- (BOOL)hasRunningTrackFeedback;
- (BOOL)hasSearchFeedback;
- (BOOL)hasStreetFeedback;
- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdate;
- (BOOL)hasTileFeedback;
- (BOOL)hasTransitPoiFeedback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPAddToMapFeedback)addMapFeedback;
- (GEORPAddressFeedback)addressPointFeedback;
- (GEORPCuratedCollectionFeedback)curatedCollectionFeedback;
- (GEORPDirectionsFeedback)directionsFeedback;
- (GEORPFeedbackDetails)init;
- (GEORPFeedbackDetails)initWithData:(id)a3;
- (GEORPFeedbackDetails)initWithDictionary:(id)a3;
- (GEORPFeedbackDetails)initWithJSON:(id)a3;
- (GEORPGroundViewFeedback)groundViewFeedback;
- (GEORPIncidentFeedback)incidentFeedback;
- (GEORPLocalityFeedback)localityFeedback;
- (GEORPMerchantLookupFeedback)merchantLookupFeedback;
- (GEORPPhotoAttributionPreferencesUpdate)photoAttributionPreferencesUpdate;
- (GEORPPoiActivityFeedback)poiActivityFeedback;
- (GEORPPoiEnrichmentUpdate)poiEnrichmentUpdate;
- (GEORPPoiFeedback)poiFeedback;
- (GEORPPoiImageFeedback)poiImageFeedback;
- (GEORPRapUserResponseFeedback)rapUserResponseFeedback;
- (GEORPRunningTrackFeedback)runningTrackFeedback;
- (GEORPSearchFeedback)searchFeedback;
- (GEORPStreetFeedback)streetFeedback;
- (GEORPThirdPartyPhotoSharingPreferenceUpdate)thirdPartyPhotoSharingPreferenceUpdate;
- (GEORPTileFeedback)tileFeedback;
- (GEORPTransitPoiFeedback)transitPoiFeedback;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAddMapFeedback;
- (void)_readAddressPointFeedback;
- (void)_readCuratedCollectionFeedback;
- (void)_readDirectionsFeedback;
- (void)_readGroundViewFeedback;
- (void)_readIncidentFeedback;
- (void)_readLocalityFeedback;
- (void)_readMerchantLookupFeedback;
- (void)_readPhotoAttributionPreferencesUpdate;
- (void)_readPoiActivityFeedback;
- (void)_readPoiEnrichmentUpdate;
- (void)_readPoiFeedback;
- (void)_readPoiImageFeedback;
- (void)_readRapUserResponseFeedback;
- (void)_readRunningTrackFeedback;
- (void)_readSearchFeedback;
- (void)_readStreetFeedback;
- (void)_readThirdPartyPhotoSharingPreferenceUpdate;
- (void)_readTileFeedback;
- (void)_readTransitPoiFeedback;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddMapFeedback:(id)a3;
- (void)setAddressPointFeedback:(id)a3;
- (void)setCuratedCollectionFeedback:(id)a3;
- (void)setDirectionsFeedback:(id)a3;
- (void)setGroundViewFeedback:(id)a3;
- (void)setIncidentFeedback:(id)a3;
- (void)setLocalityFeedback:(id)a3;
- (void)setMerchantLookupFeedback:(id)a3;
- (void)setPhotoAttributionPreferencesUpdate:(id)a3;
- (void)setPoiActivityFeedback:(id)a3;
- (void)setPoiEnrichmentUpdate:(id)a3;
- (void)setPoiFeedback:(id)a3;
- (void)setPoiImageFeedback:(id)a3;
- (void)setRapUserResponseFeedback:(id)a3;
- (void)setRunningTrackFeedback:(id)a3;
- (void)setSearchFeedback:(id)a3;
- (void)setStreetFeedback:(id)a3;
- (void)setThirdPartyPhotoSharingPreferenceUpdate:(id)a3;
- (void)setTileFeedback:(id)a3;
- (void)setTransitPoiFeedback:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPoiFeedback, 0);
  objc_storeStrong((id *)&self->_tileFeedback, 0);
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdate, 0);
  objc_storeStrong((id *)&self->_streetFeedback, 0);
  objc_storeStrong((id *)&self->_searchFeedback, 0);
  objc_storeStrong((id *)&self->_runningTrackFeedback, 0);
  objc_storeStrong((id *)&self->_rapUserResponseFeedback, 0);
  objc_storeStrong((id *)&self->_poiImageFeedback, 0);
  objc_storeStrong((id *)&self->_poiFeedback, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentUpdate, 0);
  objc_storeStrong((id *)&self->_poiActivityFeedback, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdate, 0);
  objc_storeStrong((id *)&self->_merchantLookupFeedback, 0);
  objc_storeStrong((id *)&self->_localityFeedback, 0);
  objc_storeStrong((id *)&self->_incidentFeedback, 0);
  objc_storeStrong((id *)&self->_groundViewFeedback, 0);
  objc_storeStrong((id *)&self->_directionsFeedback, 0);
  objc_storeStrong((id *)&self->_curatedCollectionFeedback, 0);
  objc_storeStrong((id *)&self->_addressPointFeedback, 0);
  objc_storeStrong((id *)&self->_addMapFeedback, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  [(GEORPFeedbackDetails *)self readAll:1];
  [v4 readAll:1];
  poiFeedback = self->_poiFeedback;
  if ((unint64_t)poiFeedback | v4[14])
  {
    if (!-[GEORPPoiFeedback isEqual:](poiFeedback, "isEqual:")) {
      goto LABEL_42;
    }
  }
  transitPoiFeedback = self->_transitPoiFeedback;
  if ((unint64_t)transitPoiFeedback | v4[22]
    && !-[GEORPTransitPoiFeedback isEqual:](transitPoiFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  searchFeedback = self->_searchFeedback;
  if ((unint64_t)searchFeedback | v4[18] && !-[GEORPSearchFeedback isEqual:](searchFeedback, "isEqual:")) {
    goto LABEL_42;
  }
  merchantLookupFeedback = self->_merchantLookupFeedback;
  if ((unint64_t)merchantLookupFeedback | v4[10]
    && !-[GEORPMerchantLookupFeedback isEqual:](merchantLookupFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  directionsFeedback = self->_directionsFeedback;
  if ((unint64_t)directionsFeedback | v4[6]
    && !-[GEORPDirectionsFeedback isEqual:](directionsFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  addressPointFeedback = self->_addressPointFeedback;
  if ((unint64_t)addressPointFeedback | v4[4]
    && !-[GEORPAddressFeedback isEqual:](addressPointFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  tileFeedback = self->_tileFeedback;
  if ((unint64_t)tileFeedback | v4[21] && !-[GEORPTileFeedback isEqual:](tileFeedback, "isEqual:")) {
    goto LABEL_42;
  }
  groundViewFeedback = self->_groundViewFeedback;
  if ((unint64_t)groundViewFeedback | v4[7]
    && !-[GEORPGroundViewFeedback isEqual:](groundViewFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  poiEnrichmentUpdate = self->_poiEnrichmentUpdate;
  if ((unint64_t)poiEnrichmentUpdate | v4[13]
    && !-[GEORPPoiEnrichmentUpdate isEqual:](poiEnrichmentUpdate, "isEqual:"))
  {
    goto LABEL_42;
  }
  incidentFeedback = self->_incidentFeedback;
  if ((unint64_t)incidentFeedback | v4[8] && !-[GEORPIncidentFeedback isEqual:](incidentFeedback, "isEqual:")) {
    goto LABEL_42;
  }
  poiImageFeedback = self->_poiImageFeedback;
  if ((unint64_t)poiImageFeedback | v4[15] && !-[GEORPPoiImageFeedback isEqual:](poiImageFeedback, "isEqual:")) {
    goto LABEL_42;
  }
  curatedCollectionFeedback = self->_curatedCollectionFeedback;
  if ((unint64_t)curatedCollectionFeedback | v4[5]
    && !-[GEORPCuratedCollectionFeedback isEqual:](curatedCollectionFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  if (((poiActivityFeedback = self->_poiActivityFeedback, !((unint64_t)poiActivityFeedback | v4[12]))
     || -[GEORPPoiActivityFeedback isEqual:](poiActivityFeedback, "isEqual:"))
    && ((addMapFeedback = self->_addMapFeedback, !((unint64_t)addMapFeedback | v4[3]))
     || -[GEORPAddToMapFeedback isEqual:](addMapFeedback, "isEqual:"))
    && ((localityFeedback = self->_localityFeedback, !((unint64_t)localityFeedback | v4[9]))
     || -[GEORPLocalityFeedback isEqual:](localityFeedback, "isEqual:"))
    && ((streetFeedback = self->_streetFeedback, !((unint64_t)streetFeedback | v4[19]))
     || -[GEORPStreetFeedback isEqual:](streetFeedback, "isEqual:"))
    && ((thirdPartyPhotoSharingPreferenceUpdate = self->_thirdPartyPhotoSharingPreferenceUpdate,
         !((unint64_t)thirdPartyPhotoSharingPreferenceUpdate | v4[20]))
     || -[GEORPThirdPartyPhotoSharingPreferenceUpdate isEqual:](thirdPartyPhotoSharingPreferenceUpdate, "isEqual:"))
    && ((photoAttributionPreferencesUpdate = self->_photoAttributionPreferencesUpdate,
         !((unint64_t)photoAttributionPreferencesUpdate | v4[11]))
     || -[GEORPPhotoAttributionPreferencesUpdate isEqual:](photoAttributionPreferencesUpdate, "isEqual:"))
    && ((runningTrackFeedback = self->_runningTrackFeedback, !((unint64_t)runningTrackFeedback | v4[17]))
     || -[GEORPRunningTrackFeedback isEqual:](runningTrackFeedback, "isEqual:")))
  {
    rapUserResponseFeedback = self->_rapUserResponseFeedback;
    if ((unint64_t)rapUserResponseFeedback | v4[16]) {
      char v25 = -[GEORPRapUserResponseFeedback isEqual:](rapUserResponseFeedback, "isEqual:");
    }
    else {
      char v25 = 1;
    }
  }
  else
  {
LABEL_42:
    char v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  [(GEORPFeedbackDetails *)self readAll:1];
  unint64_t v3 = [(GEORPPoiFeedback *)self->_poiFeedback hash];
  unint64_t v4 = [(GEORPTransitPoiFeedback *)self->_transitPoiFeedback hash] ^ v3;
  unint64_t v5 = [(GEORPSearchFeedback *)self->_searchFeedback hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEORPMerchantLookupFeedback *)self->_merchantLookupFeedback hash];
  unint64_t v7 = [(GEORPDirectionsFeedback *)self->_directionsFeedback hash];
  unint64_t v8 = v7 ^ [(GEORPAddressFeedback *)self->_addressPointFeedback hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEORPTileFeedback *)self->_tileFeedback hash];
  unint64_t v10 = [(GEORPGroundViewFeedback *)self->_groundViewFeedback hash];
  unint64_t v11 = v10 ^ [(GEORPPoiEnrichmentUpdate *)self->_poiEnrichmentUpdate hash];
  unint64_t v12 = v11 ^ [(GEORPIncidentFeedback *)self->_incidentFeedback hash];
  unint64_t v13 = v9 ^ v12 ^ [(GEORPPoiImageFeedback *)self->_poiImageFeedback hash];
  unint64_t v14 = [(GEORPCuratedCollectionFeedback *)self->_curatedCollectionFeedback hash];
  unint64_t v15 = v14 ^ [(GEORPPoiActivityFeedback *)self->_poiActivityFeedback hash];
  unint64_t v16 = v15 ^ [(GEORPAddToMapFeedback *)self->_addMapFeedback hash];
  unint64_t v17 = v16 ^ [(GEORPLocalityFeedback *)self->_localityFeedback hash];
  unint64_t v18 = v13 ^ v17 ^ [(GEORPStreetFeedback *)self->_streetFeedback hash];
  unint64_t v19 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self->_thirdPartyPhotoSharingPreferenceUpdate hash];
  unint64_t v20 = v19 ^ [(GEORPPhotoAttributionPreferencesUpdate *)self->_photoAttributionPreferencesUpdate hash];
  unint64_t v21 = v20 ^ [(GEORPRunningTrackFeedback *)self->_runningTrackFeedback hash];
  return v18 ^ v21 ^ [(GEORPRapUserResponseFeedback *)self->_rapUserResponseFeedback hash];
}

- (void)mergeFrom:(id)a3
{
  v44 = a3;
  [v44 readAll:0];
  poiFeedback = self->_poiFeedback;
  uint64_t v5 = v44[14];
  if (poiFeedback)
  {
    if (v5) {
      -[GEORPPoiFeedback mergeFrom:](poiFeedback, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackDetails setPoiFeedback:](self, "setPoiFeedback:");
  }
  transitPoiFeedback = self->_transitPoiFeedback;
  uint64_t v7 = v44[22];
  if (transitPoiFeedback)
  {
    if (v7) {
      -[GEORPTransitPoiFeedback mergeFrom:](transitPoiFeedback, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackDetails setTransitPoiFeedback:](self, "setTransitPoiFeedback:");
  }
  searchFeedback = self->_searchFeedback;
  uint64_t v9 = v44[18];
  if (searchFeedback)
  {
    if (v9) {
      -[GEORPSearchFeedback mergeFrom:](searchFeedback, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEORPFeedbackDetails setSearchFeedback:](self, "setSearchFeedback:");
  }
  merchantLookupFeedback = self->_merchantLookupFeedback;
  uint64_t v11 = v44[10];
  if (merchantLookupFeedback)
  {
    if (v11) {
      -[GEORPMerchantLookupFeedback mergeFrom:](merchantLookupFeedback, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEORPFeedbackDetails setMerchantLookupFeedback:](self, "setMerchantLookupFeedback:");
  }
  directionsFeedback = self->_directionsFeedback;
  uint64_t v13 = v44[6];
  if (directionsFeedback)
  {
    if (v13) {
      -[GEORPDirectionsFeedback mergeFrom:](directionsFeedback, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPFeedbackDetails setDirectionsFeedback:](self, "setDirectionsFeedback:");
  }
  addressPointFeedback = self->_addressPointFeedback;
  uint64_t v15 = v44[4];
  if (addressPointFeedback)
  {
    if (v15) {
      -[GEORPAddressFeedback mergeFrom:](addressPointFeedback, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEORPFeedbackDetails setAddressPointFeedback:](self, "setAddressPointFeedback:");
  }
  tileFeedback = self->_tileFeedback;
  uint64_t v17 = v44[21];
  if (tileFeedback)
  {
    if (v17) {
      -[GEORPTileFeedback mergeFrom:](tileFeedback, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEORPFeedbackDetails setTileFeedback:](self, "setTileFeedback:");
  }
  groundViewFeedback = self->_groundViewFeedback;
  uint64_t v19 = v44[7];
  if (groundViewFeedback)
  {
    if (v19) {
      -[GEORPGroundViewFeedback mergeFrom:](groundViewFeedback, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEORPFeedbackDetails setGroundViewFeedback:](self, "setGroundViewFeedback:");
  }
  poiEnrichmentUpdate = self->_poiEnrichmentUpdate;
  uint64_t v21 = v44[13];
  if (poiEnrichmentUpdate)
  {
    if (v21) {
      -[GEORPPoiEnrichmentUpdate mergeFrom:](poiEnrichmentUpdate, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEORPFeedbackDetails setPoiEnrichmentUpdate:](self, "setPoiEnrichmentUpdate:");
  }
  incidentFeedback = self->_incidentFeedback;
  uint64_t v23 = v44[8];
  if (incidentFeedback)
  {
    if (v23) {
      -[GEORPIncidentFeedback mergeFrom:](incidentFeedback, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEORPFeedbackDetails setIncidentFeedback:](self, "setIncidentFeedback:");
  }
  poiImageFeedback = self->_poiImageFeedback;
  uint64_t v25 = v44[15];
  if (poiImageFeedback)
  {
    if (v25) {
      -[GEORPPoiImageFeedback mergeFrom:](poiImageFeedback, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEORPFeedbackDetails setPoiImageFeedback:](self, "setPoiImageFeedback:");
  }
  curatedCollectionFeedback = self->_curatedCollectionFeedback;
  uint64_t v27 = v44[5];
  if (curatedCollectionFeedback)
  {
    if (v27) {
      -[GEORPCuratedCollectionFeedback mergeFrom:](curatedCollectionFeedback, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEORPFeedbackDetails setCuratedCollectionFeedback:](self, "setCuratedCollectionFeedback:");
  }
  poiActivityFeedback = self->_poiActivityFeedback;
  uint64_t v29 = v44[12];
  if (poiActivityFeedback)
  {
    if (v29) {
      -[GEORPPoiActivityFeedback mergeFrom:](poiActivityFeedback, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[GEORPFeedbackDetails setPoiActivityFeedback:](self, "setPoiActivityFeedback:");
  }
  addMapFeedback = self->_addMapFeedback;
  uint64_t v31 = v44[3];
  if (addMapFeedback)
  {
    if (v31) {
      -[GEORPAddToMapFeedback mergeFrom:](addMapFeedback, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEORPFeedbackDetails setAddMapFeedback:](self, "setAddMapFeedback:");
  }
  localityFeedback = self->_localityFeedback;
  uint64_t v33 = v44[9];
  if (localityFeedback)
  {
    if (v33) {
      -[GEORPLocalityFeedback mergeFrom:](localityFeedback, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[GEORPFeedbackDetails setLocalityFeedback:](self, "setLocalityFeedback:");
  }
  streetFeedback = self->_streetFeedback;
  uint64_t v35 = v44[19];
  if (streetFeedback)
  {
    if (v35) {
      -[GEORPStreetFeedback mergeFrom:](streetFeedback, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[GEORPFeedbackDetails setStreetFeedback:](self, "setStreetFeedback:");
  }
  thirdPartyPhotoSharingPreferenceUpdate = self->_thirdPartyPhotoSharingPreferenceUpdate;
  uint64_t v37 = v44[20];
  if (thirdPartyPhotoSharingPreferenceUpdate)
  {
    if (v37) {
      -[GEORPThirdPartyPhotoSharingPreferenceUpdate mergeFrom:](thirdPartyPhotoSharingPreferenceUpdate, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEORPFeedbackDetails setThirdPartyPhotoSharingPreferenceUpdate:](self, "setThirdPartyPhotoSharingPreferenceUpdate:");
  }
  photoAttributionPreferencesUpdate = self->_photoAttributionPreferencesUpdate;
  uint64_t v39 = v44[11];
  if (photoAttributionPreferencesUpdate)
  {
    if (v39) {
      -[GEORPPhotoAttributionPreferencesUpdate mergeFrom:](photoAttributionPreferencesUpdate, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[GEORPFeedbackDetails setPhotoAttributionPreferencesUpdate:](self, "setPhotoAttributionPreferencesUpdate:");
  }
  runningTrackFeedback = self->_runningTrackFeedback;
  uint64_t v41 = v44[17];
  if (runningTrackFeedback)
  {
    if (v41) {
      -[GEORPRunningTrackFeedback mergeFrom:](runningTrackFeedback, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEORPFeedbackDetails setRunningTrackFeedback:](self, "setRunningTrackFeedback:");
  }
  rapUserResponseFeedback = self->_rapUserResponseFeedback;
  uint64_t v43 = v44[16];
  if (rapUserResponseFeedback)
  {
    if (v43) {
      -[GEORPRapUserResponseFeedback mergeFrom:](rapUserResponseFeedback, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEORPFeedbackDetails setRapUserResponseFeedback:](self, "setRapUserResponseFeedback:");
  }
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x200001u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPFeedbackDetails *)self readAll:0];
    [(GEORPPoiFeedback *)self->_poiFeedback clearUnknownFields:1];
    [(GEORPTransitPoiFeedback *)self->_transitPoiFeedback clearUnknownFields:1];
    [(GEORPSearchFeedback *)self->_searchFeedback clearUnknownFields:1];
    [(GEORPMerchantLookupFeedback *)self->_merchantLookupFeedback clearUnknownFields:1];
    [(GEORPDirectionsFeedback *)self->_directionsFeedback clearUnknownFields:1];
    [(GEORPAddressFeedback *)self->_addressPointFeedback clearUnknownFields:1];
    [(GEORPTileFeedback *)self->_tileFeedback clearUnknownFields:1];
    [(GEORPGroundViewFeedback *)self->_groundViewFeedback clearUnknownFields:1];
    [(GEORPPoiImageFeedback *)self->_poiImageFeedback clearUnknownFields:1];
    [(GEORPCuratedCollectionFeedback *)self->_curatedCollectionFeedback clearUnknownFields:1];
    [(GEORPPoiActivityFeedback *)self->_poiActivityFeedback clearUnknownFields:1];
    [(GEORPAddToMapFeedback *)self->_addMapFeedback clearUnknownFields:1];
    [(GEORPLocalityFeedback *)self->_localityFeedback clearUnknownFields:1];
    [(GEORPStreetFeedback *)self->_streetFeedback clearUnknownFields:1];
    [(GEORPRunningTrackFeedback *)self->_runningTrackFeedback clearUnknownFields:1];
    rapUserResponseFeedback = self->_rapUserResponseFeedback;
    [(GEORPRapUserResponseFeedback *)rapUserResponseFeedback clearUnknownFields:1];
  }
}

- (GEORPFeedbackDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackDetails;
  v2 = [(GEORPFeedbackDetails *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackDetails;
  BOOL v3 = [(GEORPFeedbackDetails *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readPoiFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiFeedback
{
  return self->_poiFeedback != 0;
}

- (GEORPPoiFeedback)poiFeedback
{
  -[GEORPFeedbackDetails _readPoiFeedback]((uint64_t)self);
  poiFeedback = self->_poiFeedback;

  return poiFeedback;
}

- (void)setPoiFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  objc_storeStrong((id *)&self->_poiFeedback, a3);
}

- (void)_readTransitPoiFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 198) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitPoiFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTransitPoiFeedback
{
  return self->_transitPoiFeedback != 0;
}

- (GEORPTransitPoiFeedback)transitPoiFeedback
{
  -[GEORPFeedbackDetails _readTransitPoiFeedback]((uint64_t)self);
  transitPoiFeedback = self->_transitPoiFeedback;

  return transitPoiFeedback;
}

- (void)setTransitPoiFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x300000u;
  objc_storeStrong((id *)&self->_transitPoiFeedback, a3);
}

- (void)_readSearchFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 198) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasSearchFeedback
{
  return self->_searchFeedback != 0;
}

- (GEORPSearchFeedback)searchFeedback
{
  -[GEORPFeedbackDetails _readSearchFeedback]((uint64_t)self);
  searchFeedback = self->_searchFeedback;

  return searchFeedback;
}

- (void)setSearchFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_searchFeedback, a3);
}

- (void)_readMerchantLookupFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMerchantLookupFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasMerchantLookupFeedback
{
  return self->_merchantLookupFeedback != 0;
}

- (GEORPMerchantLookupFeedback)merchantLookupFeedback
{
  -[GEORPFeedbackDetails _readMerchantLookupFeedback]((uint64_t)self);
  merchantLookupFeedback = self->_merchantLookupFeedback;

  return merchantLookupFeedback;
}

- (void)setMerchantLookupFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  objc_storeStrong((id *)&self->_merchantLookupFeedback, a3);
}

- (void)_readDirectionsFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDirectionsFeedback
{
  return self->_directionsFeedback != 0;
}

- (GEORPDirectionsFeedback)directionsFeedback
{
  -[GEORPFeedbackDetails _readDirectionsFeedback]((uint64_t)self);
  directionsFeedback = self->_directionsFeedback;

  return directionsFeedback;
}

- (void)setDirectionsFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  objc_storeStrong((id *)&self->_directionsFeedback, a3);
}

- (void)_readAddressPointFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressPointFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAddressPointFeedback
{
  return self->_addressPointFeedback != 0;
}

- (GEORPAddressFeedback)addressPointFeedback
{
  -[GEORPFeedbackDetails _readAddressPointFeedback]((uint64_t)self);
  addressPointFeedback = self->_addressPointFeedback;

  return addressPointFeedback;
}

- (void)setAddressPointFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  objc_storeStrong((id *)&self->_addressPointFeedback, a3);
}

- (void)_readTileFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 198) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTileFeedback
{
  return self->_tileFeedback != 0;
}

- (GEORPTileFeedback)tileFeedback
{
  -[GEORPFeedbackDetails _readTileFeedback]((uint64_t)self);
  tileFeedback = self->_tileFeedback;

  return tileFeedback;
}

- (void)setTileFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_tileFeedback, a3);
}

- (void)_readGroundViewFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroundViewFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasGroundViewFeedback
{
  return self->_groundViewFeedback != 0;
}

- (GEORPGroundViewFeedback)groundViewFeedback
{
  -[GEORPFeedbackDetails _readGroundViewFeedback]((uint64_t)self);
  groundViewFeedback = self->_groundViewFeedback;

  return groundViewFeedback;
}

- (void)setGroundViewFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  objc_storeStrong((id *)&self->_groundViewFeedback, a3);
}

- (void)_readPoiEnrichmentUpdate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiEnrichmentUpdate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiEnrichmentUpdate
{
  return self->_poiEnrichmentUpdate != 0;
}

- (GEORPPoiEnrichmentUpdate)poiEnrichmentUpdate
{
  -[GEORPFeedbackDetails _readPoiEnrichmentUpdate]((uint64_t)self);
  poiEnrichmentUpdate = self->_poiEnrichmentUpdate;

  return poiEnrichmentUpdate;
}

- (void)setPoiEnrichmentUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  objc_storeStrong((id *)&self->_poiEnrichmentUpdate, a3);
}

- (void)_readIncidentFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidentFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasIncidentFeedback
{
  return self->_incidentFeedback != 0;
}

- (GEORPIncidentFeedback)incidentFeedback
{
  -[GEORPFeedbackDetails _readIncidentFeedback]((uint64_t)self);
  incidentFeedback = self->_incidentFeedback;

  return incidentFeedback;
}

- (void)setIncidentFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  objc_storeStrong((id *)&self->_incidentFeedback, a3);
}

- (void)_readPoiImageFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiImageFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiImageFeedback
{
  return self->_poiImageFeedback != 0;
}

- (GEORPPoiImageFeedback)poiImageFeedback
{
  -[GEORPFeedbackDetails _readPoiImageFeedback]((uint64_t)self);
  poiImageFeedback = self->_poiImageFeedback;

  return poiImageFeedback;
}

- (void)setPoiImageFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x202000u;
  objc_storeStrong((id *)&self->_poiImageFeedback, a3);
}

- (void)_readCuratedCollectionFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCuratedCollectionFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasCuratedCollectionFeedback
{
  return self->_curatedCollectionFeedback != 0;
}

- (GEORPCuratedCollectionFeedback)curatedCollectionFeedback
{
  -[GEORPFeedbackDetails _readCuratedCollectionFeedback]((uint64_t)self);
  curatedCollectionFeedback = self->_curatedCollectionFeedback;

  return curatedCollectionFeedback;
}

- (void)setCuratedCollectionFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  objc_storeStrong((id *)&self->_curatedCollectionFeedback, a3);
}

- (void)_readPoiActivityFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiActivityFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiActivityFeedback
{
  return self->_poiActivityFeedback != 0;
}

- (GEORPPoiActivityFeedback)poiActivityFeedback
{
  -[GEORPFeedbackDetails _readPoiActivityFeedback]((uint64_t)self);
  poiActivityFeedback = self->_poiActivityFeedback;

  return poiActivityFeedback;
}

- (void)setPoiActivityFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  objc_storeStrong((id *)&self->_poiActivityFeedback, a3);
}

- (void)_readAddMapFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddMapFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAddMapFeedback
{
  return self->_addMapFeedback != 0;
}

- (GEORPAddToMapFeedback)addMapFeedback
{
  -[GEORPFeedbackDetails _readAddMapFeedback]((uint64_t)self);
  addMapFeedback = self->_addMapFeedback;

  return addMapFeedback;
}

- (void)setAddMapFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  objc_storeStrong((id *)&self->_addMapFeedback, a3);
}

- (void)_readLocalityFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 196) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalityFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLocalityFeedback
{
  return self->_localityFeedback != 0;
}

- (GEORPLocalityFeedback)localityFeedback
{
  -[GEORPFeedbackDetails _readLocalityFeedback]((uint64_t)self);
  localityFeedback = self->_localityFeedback;

  return localityFeedback;
}

- (void)setLocalityFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  objc_storeStrong((id *)&self->_localityFeedback, a3);
}

- (void)_readStreetFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 198) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStreetFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasStreetFeedback
{
  return self->_streetFeedback != 0;
}

- (GEORPStreetFeedback)streetFeedback
{
  -[GEORPFeedbackDetails _readStreetFeedback]((uint64_t)self);
  streetFeedback = self->_streetFeedback;

  return streetFeedback;
}

- (void)setStreetFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_streetFeedback, a3);
}

- (void)_readThirdPartyPhotoSharingPreferenceUpdate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 198) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferenceUpdate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdate
{
  return self->_thirdPartyPhotoSharingPreferenceUpdate != 0;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdate)thirdPartyPhotoSharingPreferenceUpdate
{
  -[GEORPFeedbackDetails _readThirdPartyPhotoSharingPreferenceUpdate]((uint64_t)self);
  thirdPartyPhotoSharingPreferenceUpdate = self->_thirdPartyPhotoSharingPreferenceUpdate;

  return thirdPartyPhotoSharingPreferenceUpdate;
}

- (void)setThirdPartyPhotoSharingPreferenceUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdate, a3);
}

- (void)_readPhotoAttributionPreferencesUpdate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoAttributionPreferencesUpdate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPhotoAttributionPreferencesUpdate
{
  return self->_photoAttributionPreferencesUpdate != 0;
}

- (GEORPPhotoAttributionPreferencesUpdate)photoAttributionPreferencesUpdate
{
  -[GEORPFeedbackDetails _readPhotoAttributionPreferencesUpdate]((uint64_t)self);
  photoAttributionPreferencesUpdate = self->_photoAttributionPreferencesUpdate;

  return photoAttributionPreferencesUpdate;
}

- (void)setPhotoAttributionPreferencesUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200200u;
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdate, a3);
}

- (void)_readRunningTrackFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRunningTrackFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRunningTrackFeedback
{
  return self->_runningTrackFeedback != 0;
}

- (GEORPRunningTrackFeedback)runningTrackFeedback
{
  -[GEORPFeedbackDetails _readRunningTrackFeedback]((uint64_t)self);
  runningTrackFeedback = self->_runningTrackFeedback;

  return runningTrackFeedback;
}

- (void)setRunningTrackFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x208000u;
  objc_storeStrong((id *)&self->_runningTrackFeedback, a3);
}

- (void)_readRapUserResponseFeedback
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(unsigned char *)(a1 + 197) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRapUserResponseFeedback_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRapUserResponseFeedback
{
  return self->_rapUserResponseFeedback != 0;
}

- (GEORPRapUserResponseFeedback)rapUserResponseFeedback
{
  -[GEORPFeedbackDetails _readRapUserResponseFeedback]((uint64_t)self);
  rapUserResponseFeedback = self->_rapUserResponseFeedback;

  return rapUserResponseFeedback;
}

- (void)setRapUserResponseFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_rapUserResponseFeedback, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackDetails;
  unint64_t v4 = [(GEORPFeedbackDetails *)&v8 description];
  uint64_t v5 = [(GEORPFeedbackDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackDetails _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [a1 poiFeedback];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"poiFeedback";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"poi_feedback";
      }
      [v4 setObject:v7 forKey:v8];
    }
    uint64_t v9 = [a1 transitPoiFeedback];
    unint64_t v10 = v9;
    if (v9)
    {
      if (a2)
      {
        uint64_t v11 = [v9 jsonRepresentation];
        unint64_t v12 = @"transitPoiFeedback";
      }
      else
      {
        uint64_t v11 = [v9 dictionaryRepresentation];
        unint64_t v12 = @"transit_poi_feedback";
      }
      [v4 setObject:v11 forKey:v12];
    }
    uint64_t v13 = [a1 searchFeedback];
    unint64_t v14 = v13;
    if (v13)
    {
      if (a2)
      {
        uint64_t v15 = [v13 jsonRepresentation];
        unint64_t v16 = @"searchFeedback";
      }
      else
      {
        uint64_t v15 = [v13 dictionaryRepresentation];
        unint64_t v16 = @"search_feedback";
      }
      [v4 setObject:v15 forKey:v16];
    }
    uint64_t v17 = [a1 merchantLookupFeedback];
    unint64_t v18 = v17;
    if (v17)
    {
      if (a2)
      {
        uint64_t v19 = [v17 jsonRepresentation];
        unint64_t v20 = @"merchantLookupFeedback";
      }
      else
      {
        uint64_t v19 = [v17 dictionaryRepresentation];
        unint64_t v20 = @"merchant_lookup_feedback";
      }
      [v4 setObject:v19 forKey:v20];
    }
    uint64_t v21 = [a1 directionsFeedback];
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        uint64_t v23 = [v21 jsonRepresentation];
        v24 = @"directionsFeedback";
      }
      else
      {
        uint64_t v23 = [v21 dictionaryRepresentation];
        v24 = @"directions_feedback";
      }
      [v4 setObject:v23 forKey:v24];
    }
    uint64_t v25 = [a1 addressPointFeedback];
    v26 = v25;
    if (v25)
    {
      if (a2)
      {
        uint64_t v27 = [v25 jsonRepresentation];
        v28 = @"addressPointFeedback";
      }
      else
      {
        uint64_t v27 = [v25 dictionaryRepresentation];
        v28 = @"address_point_feedback";
      }
      [v4 setObject:v27 forKey:v28];
    }
    uint64_t v29 = [a1 tileFeedback];
    v30 = v29;
    if (v29)
    {
      if (a2)
      {
        uint64_t v31 = [v29 jsonRepresentation];
        v32 = @"tileFeedback";
      }
      else
      {
        uint64_t v31 = [v29 dictionaryRepresentation];
        v32 = @"tile_feedback";
      }
      [v4 setObject:v31 forKey:v32];
    }
    uint64_t v33 = [a1 groundViewFeedback];
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        uint64_t v35 = [v33 jsonRepresentation];
        v36 = @"groundViewFeedback";
      }
      else
      {
        uint64_t v35 = [v33 dictionaryRepresentation];
        v36 = @"ground_view_feedback";
      }
      [v4 setObject:v35 forKey:v36];
    }
    uint64_t v37 = [a1 poiEnrichmentUpdate];
    v38 = v37;
    if (v37)
    {
      if (a2)
      {
        uint64_t v39 = [v37 jsonRepresentation];
        v40 = @"poiEnrichmentUpdate";
      }
      else
      {
        uint64_t v39 = [v37 dictionaryRepresentation];
        v40 = @"poi_enrichment_update";
      }
      [v4 setObject:v39 forKey:v40];
    }
    uint64_t v41 = [a1 incidentFeedback];
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        uint64_t v43 = [v41 jsonRepresentation];
        v44 = @"incidentFeedback";
      }
      else
      {
        uint64_t v43 = [v41 dictionaryRepresentation];
        v44 = @"incident_feedback";
      }
      [v4 setObject:v43 forKey:v44];
    }
    v45 = [a1 poiImageFeedback];
    v46 = v45;
    if (v45)
    {
      if (a2)
      {
        v47 = [v45 jsonRepresentation];
        v48 = @"poiImageFeedback";
      }
      else
      {
        v47 = [v45 dictionaryRepresentation];
        v48 = @"poi_image_feedback";
      }
      [v4 setObject:v47 forKey:v48];
    }
    v49 = [a1 curatedCollectionFeedback];
    v50 = v49;
    if (v49)
    {
      if (a2)
      {
        v51 = [v49 jsonRepresentation];
        v52 = @"curatedCollectionFeedback";
      }
      else
      {
        v51 = [v49 dictionaryRepresentation];
        v52 = @"curated_collection_feedback";
      }
      [v4 setObject:v51 forKey:v52];
    }
    v53 = [a1 poiActivityFeedback];
    v54 = v53;
    if (v53)
    {
      if (a2)
      {
        v55 = [v53 jsonRepresentation];
        v56 = @"poiActivityFeedback";
      }
      else
      {
        v55 = [v53 dictionaryRepresentation];
        v56 = @"poi_activity_feedback";
      }
      [v4 setObject:v55 forKey:v56];
    }
    v57 = [a1 addMapFeedback];
    v58 = v57;
    if (v57)
    {
      if (a2)
      {
        v59 = [v57 jsonRepresentation];
        v60 = @"addMapFeedback";
      }
      else
      {
        v59 = [v57 dictionaryRepresentation];
        v60 = @"add_map_feedback";
      }
      [v4 setObject:v59 forKey:v60];
    }
    v61 = [a1 localityFeedback];
    v62 = v61;
    if (v61)
    {
      if (a2)
      {
        v63 = [v61 jsonRepresentation];
        v64 = @"localityFeedback";
      }
      else
      {
        v63 = [v61 dictionaryRepresentation];
        v64 = @"locality_feedback";
      }
      [v4 setObject:v63 forKey:v64];
    }
    v65 = [a1 streetFeedback];
    v66 = v65;
    if (v65)
    {
      if (a2)
      {
        v67 = [v65 jsonRepresentation];
        v68 = @"streetFeedback";
      }
      else
      {
        v67 = [v65 dictionaryRepresentation];
        v68 = @"street_feedback";
      }
      [v4 setObject:v67 forKey:v68];
    }
    v69 = [a1 thirdPartyPhotoSharingPreferenceUpdate];
    v70 = v69;
    if (v69)
    {
      if (a2)
      {
        v71 = [v69 jsonRepresentation];
        v72 = @"thirdPartyPhotoSharingPreferenceUpdate";
      }
      else
      {
        v71 = [v69 dictionaryRepresentation];
        v72 = @"third_party_photo_sharing_preference_update";
      }
      [v4 setObject:v71 forKey:v72];
    }
    v73 = [a1 photoAttributionPreferencesUpdate];
    v74 = v73;
    if (v73)
    {
      if (a2)
      {
        v75 = [v73 jsonRepresentation];
        v76 = @"photoAttributionPreferencesUpdate";
      }
      else
      {
        v75 = [v73 dictionaryRepresentation];
        v76 = @"photo_attribution_preferences_update";
      }
      [v4 setObject:v75 forKey:v76];
    }
    v77 = [a1 runningTrackFeedback];
    v78 = v77;
    if (v77)
    {
      if (a2)
      {
        v79 = [v77 jsonRepresentation];
        v80 = @"runningTrackFeedback";
      }
      else
      {
        v79 = [v77 dictionaryRepresentation];
        v80 = @"running_track_feedback";
      }
      [v4 setObject:v79 forKey:v80];
    }
    v81 = [a1 rapUserResponseFeedback];
    v82 = v81;
    if (v81)
    {
      if (a2)
      {
        v83 = [v81 jsonRepresentation];
        v84 = @"rapUserResponseFeedback";
      }
      else
      {
        v83 = [v81 dictionaryRepresentation];
        v84 = @"rap_user_response_feedback";
      }
      [v4 setObject:v83 forKey:v84];
    }
    v85 = (void *)a1[2];
    if (v85)
    {
      v86 = [v85 dictionaryRepresentation];
      v87 = v86;
      if (a2)
      {
        v88 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v86, "count"));
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __50__GEORPFeedbackDetails__dictionaryRepresentation___block_invoke;
        v93[3] = &unk_1E53D8860;
        id v89 = v88;
        id v94 = v89;
        [v87 enumerateKeysAndObjectsUsingBlock:v93];
        id v90 = v89;

        v87 = v90;
      }
      [v4 setObject:v87 forKey:@"Unknown Fields"];
    }
    id v91 = v4;
  }
  else
  {
    id v91 = 0;
  }

  return v91;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackDetails _dictionaryRepresentation:](self, 1);
}

void __50__GEORPFeedbackDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackDetails)initWithDictionary:(id)a3
{
  return (GEORPFeedbackDetails *)-[GEORPFeedbackDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"poiFeedback";
      }
      else {
        objc_super v6 = @"poi_feedback";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEORPPoiFeedback alloc];
        if (a3) {
          uint64_t v9 = [(GEORPPoiFeedback *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEORPPoiFeedback *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setPoiFeedback:v9];
      }
      if (a3) {
        uint64_t v11 = @"transitPoiFeedback";
      }
      else {
        uint64_t v11 = @"transit_poi_feedback";
      }
      unint64_t v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [GEORPTransitPoiFeedback alloc];
        if (a3) {
          uint64_t v14 = [(GEORPTransitPoiFeedback *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEORPTransitPoiFeedback *)v13 initWithDictionary:v12];
        }
        uint64_t v15 = (void *)v14;
        [a1 setTransitPoiFeedback:v14];
      }
      if (a3) {
        unint64_t v16 = @"searchFeedback";
      }
      else {
        unint64_t v16 = @"search_feedback";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v18 = [GEORPSearchFeedback alloc];
        if (a3) {
          uint64_t v19 = [(GEORPSearchFeedback *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORPSearchFeedback *)v18 initWithDictionary:v17];
        }
        unint64_t v20 = (void *)v19;
        [a1 setSearchFeedback:v19];
      }
      if (a3) {
        uint64_t v21 = @"merchantLookupFeedback";
      }
      else {
        uint64_t v21 = @"merchant_lookup_feedback";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [GEORPMerchantLookupFeedback alloc];
        if (a3) {
          uint64_t v24 = [(GEORPMerchantLookupFeedback *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEORPMerchantLookupFeedback *)v23 initWithDictionary:v22];
        }
        uint64_t v25 = (void *)v24;
        [a1 setMerchantLookupFeedback:v24];
      }
      if (a3) {
        v26 = @"directionsFeedback";
      }
      else {
        v26 = @"directions_feedback";
      }
      uint64_t v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEORPDirectionsFeedback alloc];
        if (a3) {
          uint64_t v29 = [(GEORPDirectionsFeedback *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEORPDirectionsFeedback *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setDirectionsFeedback:v29];
      }
      if (a3) {
        uint64_t v31 = @"addressPointFeedback";
      }
      else {
        uint64_t v31 = @"address_point_feedback";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = [GEORPAddressFeedback alloc];
        if (a3) {
          uint64_t v34 = [(GEORPAddressFeedback *)v33 initWithJSON:v32];
        }
        else {
          uint64_t v34 = [(GEORPAddressFeedback *)v33 initWithDictionary:v32];
        }
        uint64_t v35 = (void *)v34;
        [a1 setAddressPointFeedback:v34];
      }
      if (a3) {
        v36 = @"tileFeedback";
      }
      else {
        v36 = @"tile_feedback";
      }
      uint64_t v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = [GEORPTileFeedback alloc];
        if (a3) {
          uint64_t v39 = [(GEORPTileFeedback *)v38 initWithJSON:v37];
        }
        else {
          uint64_t v39 = [(GEORPTileFeedback *)v38 initWithDictionary:v37];
        }
        v40 = (void *)v39;
        [a1 setTileFeedback:v39];
      }
      if (a3) {
        uint64_t v41 = @"groundViewFeedback";
      }
      else {
        uint64_t v41 = @"ground_view_feedback";
      }
      v42 = [v5 objectForKeyedSubscript:v41];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v43 = [GEORPGroundViewFeedback alloc];
        if (a3) {
          uint64_t v44 = [(GEORPGroundViewFeedback *)v43 initWithJSON:v42];
        }
        else {
          uint64_t v44 = [(GEORPGroundViewFeedback *)v43 initWithDictionary:v42];
        }
        v45 = (void *)v44;
        [a1 setGroundViewFeedback:v44];
      }
      if (a3) {
        v46 = @"poiEnrichmentUpdate";
      }
      else {
        v46 = @"poi_enrichment_update";
      }
      v47 = [v5 objectForKeyedSubscript:v46];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v48 = [GEORPPoiEnrichmentUpdate alloc];
        if (a3) {
          uint64_t v49 = [(GEORPPoiEnrichmentUpdate *)v48 initWithJSON:v47];
        }
        else {
          uint64_t v49 = [(GEORPPoiEnrichmentUpdate *)v48 initWithDictionary:v47];
        }
        v50 = (void *)v49;
        [a1 setPoiEnrichmentUpdate:v49];
      }
      if (a3) {
        v51 = @"incidentFeedback";
      }
      else {
        v51 = @"incident_feedback";
      }
      v52 = [v5 objectForKeyedSubscript:v51];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53 = [GEORPIncidentFeedback alloc];
        if (a3) {
          uint64_t v54 = [(GEORPIncidentFeedback *)v53 initWithJSON:v52];
        }
        else {
          uint64_t v54 = [(GEORPIncidentFeedback *)v53 initWithDictionary:v52];
        }
        v55 = (void *)v54;
        [a1 setIncidentFeedback:v54];
      }
      if (a3) {
        v56 = @"poiImageFeedback";
      }
      else {
        v56 = @"poi_image_feedback";
      }
      v57 = [v5 objectForKeyedSubscript:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v58 = [GEORPPoiImageFeedback alloc];
        if (a3) {
          uint64_t v59 = [(GEORPPoiImageFeedback *)v58 initWithJSON:v57];
        }
        else {
          uint64_t v59 = [(GEORPPoiImageFeedback *)v58 initWithDictionary:v57];
        }
        v60 = (void *)v59;
        [a1 setPoiImageFeedback:v59];
      }
      if (a3) {
        v61 = @"curatedCollectionFeedback";
      }
      else {
        v61 = @"curated_collection_feedback";
      }
      v62 = [v5 objectForKeyedSubscript:v61];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v63 = [GEORPCuratedCollectionFeedback alloc];
        if (a3) {
          uint64_t v64 = [(GEORPCuratedCollectionFeedback *)v63 initWithJSON:v62];
        }
        else {
          uint64_t v64 = [(GEORPCuratedCollectionFeedback *)v63 initWithDictionary:v62];
        }
        v65 = (void *)v64;
        [a1 setCuratedCollectionFeedback:v64];
      }
      if (a3) {
        v66 = @"poiActivityFeedback";
      }
      else {
        v66 = @"poi_activity_feedback";
      }
      v67 = [v5 objectForKeyedSubscript:v66];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v68 = [GEORPPoiActivityFeedback alloc];
        if (a3) {
          uint64_t v69 = [(GEORPPoiActivityFeedback *)v68 initWithJSON:v67];
        }
        else {
          uint64_t v69 = [(GEORPPoiActivityFeedback *)v68 initWithDictionary:v67];
        }
        v70 = (void *)v69;
        [a1 setPoiActivityFeedback:v69];
      }
      if (a3) {
        v71 = @"addMapFeedback";
      }
      else {
        v71 = @"add_map_feedback";
      }
      v72 = [v5 objectForKeyedSubscript:v71];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v73 = [GEORPAddToMapFeedback alloc];
        if (a3) {
          uint64_t v74 = [(GEORPAddToMapFeedback *)v73 initWithJSON:v72];
        }
        else {
          uint64_t v74 = [(GEORPAddToMapFeedback *)v73 initWithDictionary:v72];
        }
        v75 = (void *)v74;
        [a1 setAddMapFeedback:v74];
      }
      if (a3) {
        v76 = @"localityFeedback";
      }
      else {
        v76 = @"locality_feedback";
      }
      v77 = [v5 objectForKeyedSubscript:v76];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v78 = [GEORPLocalityFeedback alloc];
        if (a3) {
          uint64_t v79 = [(GEORPLocalityFeedback *)v78 initWithJSON:v77];
        }
        else {
          uint64_t v79 = [(GEORPLocalityFeedback *)v78 initWithDictionary:v77];
        }
        v80 = (void *)v79;
        [a1 setLocalityFeedback:v79];
      }
      if (a3) {
        v81 = @"streetFeedback";
      }
      else {
        v81 = @"street_feedback";
      }
      v82 = [v5 objectForKeyedSubscript:v81];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v83 = [GEORPStreetFeedback alloc];
        if (a3) {
          uint64_t v84 = [(GEORPStreetFeedback *)v83 initWithJSON:v82];
        }
        else {
          uint64_t v84 = [(GEORPStreetFeedback *)v83 initWithDictionary:v82];
        }
        v85 = (void *)v84;
        [a1 setStreetFeedback:v84];
      }
      if (a3) {
        v86 = @"thirdPartyPhotoSharingPreferenceUpdate";
      }
      else {
        v86 = @"third_party_photo_sharing_preference_update";
      }
      v87 = [v5 objectForKeyedSubscript:v86];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v88 = [GEORPThirdPartyPhotoSharingPreferenceUpdate alloc];
        if (a3) {
          uint64_t v89 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)v88 initWithJSON:v87];
        }
        else {
          uint64_t v89 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)v88 initWithDictionary:v87];
        }
        id v90 = (void *)v89;
        [a1 setThirdPartyPhotoSharingPreferenceUpdate:v89];
      }
      if (a3) {
        id v91 = @"photoAttributionPreferencesUpdate";
      }
      else {
        id v91 = @"photo_attribution_preferences_update";
      }
      v92 = [v5 objectForKeyedSubscript:v91];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v93 = [GEORPPhotoAttributionPreferencesUpdate alloc];
        if (a3) {
          uint64_t v94 = [(GEORPPhotoAttributionPreferencesUpdate *)v93 initWithJSON:v92];
        }
        else {
          uint64_t v94 = [(GEORPPhotoAttributionPreferencesUpdate *)v93 initWithDictionary:v92];
        }
        v95 = (void *)v94;
        [a1 setPhotoAttributionPreferencesUpdate:v94];
      }
      if (a3) {
        v96 = @"runningTrackFeedback";
      }
      else {
        v96 = @"running_track_feedback";
      }
      v97 = [v5 objectForKeyedSubscript:v96];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v98 = [GEORPRunningTrackFeedback alloc];
        if (a3) {
          uint64_t v99 = [(GEORPRunningTrackFeedback *)v98 initWithJSON:v97];
        }
        else {
          uint64_t v99 = [(GEORPRunningTrackFeedback *)v98 initWithDictionary:v97];
        }
        v100 = (void *)v99;
        [a1 setRunningTrackFeedback:v99];
      }
      if (a3) {
        v101 = @"rapUserResponseFeedback";
      }
      else {
        v101 = @"rap_user_response_feedback";
      }
      v102 = [v5 objectForKeyedSubscript:v101];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v103 = [GEORPRapUserResponseFeedback alloc];
        if (a3) {
          uint64_t v104 = [(GEORPRapUserResponseFeedback *)v103 initWithJSON:v102];
        }
        else {
          uint64_t v104 = [(GEORPRapUserResponseFeedback *)v103 initWithDictionary:v102];
        }
        v105 = (void *)v104;
        [a1 setRapUserResponseFeedback:v104];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackDetails)initWithJSON:(id)a3
{
  return (GEORPFeedbackDetails *)-[GEORPFeedbackDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1386;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1387;
    }
    GEORPFeedbackDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPFeedbackDetailsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPFeedbackDetails *)self readAll:0];
    if (self->_poiFeedback) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_transitPoiFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_searchFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_merchantLookupFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_directionsFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addressPointFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_tileFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_groundViewFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiEnrichmentUpdate)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_incidentFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiImageFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_curatedCollectionFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_poiActivityFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_addMapFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_localityFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_streetFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_thirdPartyPhotoSharingPreferenceUpdate)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_photoAttributionPreferencesUpdate)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_runningTrackFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_rapUserResponseFeedback)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPFeedbackDetails _readAddressPointFeedback]((uint64_t)self);
  if ([(GEORPAddressFeedback *)self->_addressPointFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readDirectionsFeedback]((uint64_t)self);
  if ([(GEORPDirectionsFeedback *)self->_directionsFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readIncidentFeedback]((uint64_t)self);
  if ([(GEORPIncidentFeedback *)self->_incidentFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readLocalityFeedback]((uint64_t)self);
  if ([(GEORPLocalityFeedback *)self->_localityFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readMerchantLookupFeedback]((uint64_t)self);
  if ([(GEORPMerchantLookupFeedback *)self->_merchantLookupFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readPoiActivityFeedback]((uint64_t)self);
  if ([(GEORPPoiActivityFeedback *)self->_poiActivityFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readPoiEnrichmentUpdate]((uint64_t)self);
  if ([(GEORPPoiEnrichmentUpdate *)self->_poiEnrichmentUpdate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readPoiFeedback]((uint64_t)self);
  if ([(GEORPPoiFeedback *)self->_poiFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readPoiImageFeedback]((uint64_t)self);
  if ([(GEORPPoiImageFeedback *)self->_poiImageFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readSearchFeedback]((uint64_t)self);
  if ([(GEORPSearchFeedback *)self->_searchFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readTileFeedback]((uint64_t)self);
  if ([(GEORPTileFeedback *)self->_tileFeedback hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPFeedbackDetails _readTransitPoiFeedback]((uint64_t)self);
  transitPoiFeedback = self->_transitPoiFeedback;

  return [(GEORPTransitPoiFeedback *)transitPoiFeedback hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 46) = self->_readerMarkPos;
  *((_DWORD *)v5 + 47) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_poiFeedback) {
    objc_msgSend(v5, "setPoiFeedback:");
  }
  if (self->_transitPoiFeedback) {
    objc_msgSend(v5, "setTransitPoiFeedback:");
  }
  unint64_t v4 = v5;
  if (self->_searchFeedback)
  {
    objc_msgSend(v5, "setSearchFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_merchantLookupFeedback)
  {
    objc_msgSend(v5, "setMerchantLookupFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_directionsFeedback)
  {
    objc_msgSend(v5, "setDirectionsFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_addressPointFeedback)
  {
    objc_msgSend(v5, "setAddressPointFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_tileFeedback)
  {
    objc_msgSend(v5, "setTileFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_groundViewFeedback)
  {
    objc_msgSend(v5, "setGroundViewFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_poiEnrichmentUpdate)
  {
    objc_msgSend(v5, "setPoiEnrichmentUpdate:");
    unint64_t v4 = v5;
  }
  if (self->_incidentFeedback)
  {
    objc_msgSend(v5, "setIncidentFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_poiImageFeedback)
  {
    objc_msgSend(v5, "setPoiImageFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_curatedCollectionFeedback)
  {
    objc_msgSend(v5, "setCuratedCollectionFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_poiActivityFeedback)
  {
    objc_msgSend(v5, "setPoiActivityFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_addMapFeedback)
  {
    objc_msgSend(v5, "setAddMapFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_localityFeedback)
  {
    objc_msgSend(v5, "setLocalityFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_streetFeedback)
  {
    objc_msgSend(v5, "setStreetFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_thirdPartyPhotoSharingPreferenceUpdate)
  {
    objc_msgSend(v5, "setThirdPartyPhotoSharingPreferenceUpdate:");
    unint64_t v4 = v5;
  }
  if (self->_photoAttributionPreferencesUpdate)
  {
    objc_msgSend(v5, "setPhotoAttributionPreferencesUpdate:");
    unint64_t v4 = v5;
  }
  if (self->_runningTrackFeedback)
  {
    objc_msgSend(v5, "setRunningTrackFeedback:");
    unint64_t v4 = v5;
  }
  if (self->_rapUserResponseFeedback)
  {
    objc_msgSend(v5, "setRapUserResponseFeedback:");
    unint64_t v4 = v5;
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
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackDetails *)self readAll:0];
    id v8 = [(GEORPPoiFeedback *)self->_poiFeedback copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v8;

    id v10 = [(GEORPTransitPoiFeedback *)self->_transitPoiFeedback copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 176);
    *(void *)(v5 + 176) = v10;

    id v12 = [(GEORPSearchFeedback *)self->_searchFeedback copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 144);
    *(void *)(v5 + 144) = v12;

    id v14 = [(GEORPMerchantLookupFeedback *)self->_merchantLookupFeedback copyWithZone:a3];
    uint64_t v15 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v14;

    id v16 = [(GEORPDirectionsFeedback *)self->_directionsFeedback copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v16;

    id v18 = [(GEORPAddressFeedback *)self->_addressPointFeedback copyWithZone:a3];
    uint64_t v19 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v18;

    id v20 = [(GEORPTileFeedback *)self->_tileFeedback copyWithZone:a3];
    uint64_t v21 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v20;

    id v22 = [(GEORPGroundViewFeedback *)self->_groundViewFeedback copyWithZone:a3];
    uint64_t v23 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v22;

    id v24 = [(GEORPPoiEnrichmentUpdate *)self->_poiEnrichmentUpdate copyWithZone:a3];
    uint64_t v25 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v24;

    id v26 = [(GEORPIncidentFeedback *)self->_incidentFeedback copyWithZone:a3];
    uint64_t v27 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v26;

    id v28 = [(GEORPPoiImageFeedback *)self->_poiImageFeedback copyWithZone:a3];
    uint64_t v29 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v28;

    id v30 = [(GEORPCuratedCollectionFeedback *)self->_curatedCollectionFeedback copyWithZone:a3];
    uint64_t v31 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v30;

    id v32 = [(GEORPPoiActivityFeedback *)self->_poiActivityFeedback copyWithZone:a3];
    uint64_t v33 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v32;

    id v34 = [(GEORPAddToMapFeedback *)self->_addMapFeedback copyWithZone:a3];
    uint64_t v35 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v34;

    id v36 = [(GEORPLocalityFeedback *)self->_localityFeedback copyWithZone:a3];
    uint64_t v37 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v36;

    id v38 = [(GEORPStreetFeedback *)self->_streetFeedback copyWithZone:a3];
    uint64_t v39 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v38;

    id v40 = [(GEORPThirdPartyPhotoSharingPreferenceUpdate *)self->_thirdPartyPhotoSharingPreferenceUpdate copyWithZone:a3];
    uint64_t v41 = *(void **)(v5 + 160);
    *(void *)(v5 + 160) = v40;

    id v42 = [(GEORPPhotoAttributionPreferencesUpdate *)self->_photoAttributionPreferencesUpdate copyWithZone:a3];
    uint64_t v43 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v42;

    id v44 = [(GEORPRunningTrackFeedback *)self->_runningTrackFeedback copyWithZone:a3];
    v45 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v44;

    id v46 = [(GEORPRapUserResponseFeedback *)self->_rapUserResponseFeedback copyWithZone:a3];
    v47 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v46;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1391);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

@end