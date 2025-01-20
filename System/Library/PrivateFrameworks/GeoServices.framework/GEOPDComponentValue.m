@interface GEOPDComponentValue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)about;
- (id)accessInfo;
- (id)actionData;
- (id)address;
- (id)addressObject;
- (id)amenities;
- (id)annotatedItemList;
- (id)associatedApp;
- (id)bounds;
- (id)browseCategories;
- (id)businessAssets;
- (id)businessClaim;
- (id)businessHours;
- (id)captionedPhoto;
- (id)categorizedPhotos;
- (id)containedPlace;
- (id)containmentPlace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enhancedPlacement;
- (id)enrichmentData;
- (id)enrichmentInfo;
- (id)entity;
- (id)evCharger;
- (id)exploreGuides;
- (id)factoid;
- (id)flyover;
- (id)forwardInfo;
- (id)groundViewLabel;
- (id)guideGroup;
- (id)hikeAssociatedInfo;
- (id)hikeGeometry;
- (id)hikeSummary;
- (id)hours;
- (id)icon;
- (id)iso3166Code;
- (id)jsonRepresentation;
- (id)labelGeometry;
- (id)linkedService;
- (id)messageLink;
- (id)miniPlaceBrowseCategories;
- (id)offlineArea;
- (id)photo;
- (id)placeCollection;
- (id)placeCollectionItem;
- (id)placeInfo;
- (id)placeQuestionnaire;
- (id)placecardLayoutConfiguration;
- (id)placecardUrl;
- (id)poiClaim;
- (id)poiEvent;
- (id)priceDescription;
- (id)publisher;
- (id)quickLink;
- (id)rap;
- (id)rating;
- (id)relatedPlace;
- (id)restaurantReservationLink;
- (id)resultSnippet;
- (id)review;
- (id)searchResultPlacePhoto;
- (id)spatialLookupResult;
- (id)storefront;
- (id)storefrontPresentation;
- (id)styleAttributes;
- (id)supportsOfflineMaps;
- (id)templatePlace;
- (id)textBlock;
- (id)tip;
- (id)toolTip;
- (id)trailHead;
- (id)transitAssociatedInfo;
- (id)transitAttribution;
- (id)transitIncident;
- (id)transitInfo;
- (id)transitInfoSnippet;
- (id)transitNearbySchedule;
- (id)transitPaymentMethodInfo;
- (id)transitSchedule;
- (id)transitTripGeometry;
- (id)transitTripStop;
- (id)transitTripStopTime;
- (id)transitVehiclePosition;
- (id)venueInfo;
- (id)wifiFingerprint;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)setAddress:(uint64_t)a1;
- (void)setAddressObject:(uint64_t)a1;
- (void)setAmenities:(uint64_t)a1;
- (void)setBounds:(uint64_t)a1;
- (void)setBusinessAssets:(uint64_t)a1;
- (void)setBusinessHours:(uint64_t)a1;
- (void)setCaptionedPhoto:(uint64_t)a1;
- (void)setContainedPlace:(uint64_t)a1;
- (void)setContainmentPlace:(uint64_t)a1;
- (void)setEntity:(uint64_t)a1;
- (void)setFactoid:(uint64_t)a1;
- (void)setFlyover:(uint64_t)a1;
- (void)setHikeAssociatedInfo:(uint64_t)a1;
- (void)setHikeGeometry:(uint64_t)a1;
- (void)setHikeSummary:(uint64_t)a1;
- (void)setHours:(uint64_t)a1;
- (void)setIso3166Code:(uint64_t)a1;
- (void)setMessageLink:(uint64_t)a1;
- (void)setPlaceInfo:(uint64_t)a1;
- (void)setPlacecardUrl:(uint64_t)a1;
- (void)setRating:(uint64_t)a1;
- (void)setRestaurantReservationLink:(uint64_t)a1;
- (void)setResultSnippet:(uint64_t)a1;
- (void)setStyleAttributes:(uint64_t)a1;
- (void)setTextBlock:(uint64_t)a1;
- (void)setTrailHead:(uint64_t)a1;
- (void)setTransitAttribution:(uint64_t)a1;
- (void)setTransitInfo:(uint64_t)a1;
- (void)setVenueInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDComponentValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiFingerprint, 0);
  objc_storeStrong((id *)&self->_venueInfo, 0);
  objc_storeStrong((id *)&self->_vendorAmenities, 0);
  objc_storeStrong((id *)&self->_transitVehiclePosition, 0);
  objc_storeStrong((id *)&self->_transitTripStop, 0);
  objc_storeStrong((id *)&self->_transitTripStopTime, 0);
  objc_storeStrong((id *)&self->_transitTripGeometry, 0);
  objc_storeStrong((id *)&self->_transitSchedule, 0);
  objc_storeStrong((id *)&self->_transitPaymentMethodInfo, 0);
  objc_storeStrong((id *)&self->_transitNearbySchedule, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_transitInfoSnippet, 0);
  objc_storeStrong((id *)&self->_transitIncident, 0);
  objc_storeStrong((id *)&self->_transitAttribution, 0);
  objc_storeStrong((id *)&self->_transitAssociatedInfo, 0);
  objc_storeStrong((id *)&self->_trailHead, 0);
  objc_storeStrong((id *)&self->_toolTip, 0);
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_textBlock, 0);
  objc_storeStrong((id *)&self->_templatePlace, 0);
  objc_storeStrong((id *)&self->_supportsOfflineMaps, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_storefrontPresentation, 0);
  objc_storeStrong((id *)&self->_storefrontFaces, 0);
  objc_storeStrong((id *)&self->_spatialLookupResult, 0);
  objc_storeStrong((id *)&self->_simpleRestaurantMenuText, 0);
  objc_storeStrong((id *)&self->_searchResultPlacePhoto, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_resultSnippet, 0);
  objc_storeStrong((id *)&self->_restaurantReservationLink, 0);
  objc_storeStrong((id *)&self->_relatedPlace, 0);
  objc_storeStrong((id *)&self->_refreshId, 0);
  objc_storeStrong((id *)&self->_rawAttribute, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_rap, 0);
  objc_storeStrong((id *)&self->_quickLink, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_prototypeContainer, 0);
  objc_storeStrong((id *)&self->_priceDescription, 0);
  objc_storeStrong((id *)&self->_poiEvent, 0);
  objc_storeStrong((id *)&self->_poiClaim, 0);
  objc_storeStrong((id *)&self->_placecardUrl, 0);
  objc_storeStrong((id *)&self->_placecardLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaire, 0);
  objc_storeStrong((id *)&self->_placeInfo, 0);
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_placeCollectionItem, 0);
  objc_storeStrong((id *)&self->_placeBrowseCategories, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_offlineArea, 0);
  objc_storeStrong((id *)&self->_miniPlaceBrowseCategories, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
  objc_storeStrong((id *)&self->_locationEvent, 0);
  objc_storeStrong((id *)&self->_linkedService, 0);
  objc_storeStrong((id *)&self->_labelGeometry, 0);
  objc_storeStrong((id *)&self->_iso3166Code, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_hikeSummary, 0);
  objc_storeStrong((id *)&self->_hikeGeometry, 0);
  objc_storeStrong((id *)&self->_hikeAssociatedInfo, 0);
  objc_storeStrong((id *)&self->_guideGroup, 0);
  objc_storeStrong((id *)&self->_groundViewLabel, 0);
  objc_storeStrong((id *)&self->_forwardInfo, 0);
  objc_storeStrong((id *)&self->_flyover, 0);
  objc_storeStrong((id *)&self->_factoid, 0);
  objc_storeStrong((id *)&self->_externalAction, 0);
  objc_storeStrong((id *)&self->_exploreGuides, 0);
  objc_storeStrong((id *)&self->_evCharger, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_enrichmentData, 0);
  objc_storeStrong((id *)&self->_enhancedPlacement, 0);
  objc_storeStrong((id *)&self->_containmentPlace, 0);
  objc_storeStrong((id *)&self->_containedPlace, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_categorizedPhotos, 0);
  objc_storeStrong((id *)&self->_captionedPhoto, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_businessClaim, 0);
  objc_storeStrong((id *)&self->_businessAssets, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_associatedApp, 0);
  objc_storeStrong((id *)&self->_annotatedItemList, 0);
  objc_storeStrong((id *)&self->_amenities, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_addressWithComponents, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_accessInfo, 0);
  objc_storeStrong((id *)&self->_about, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)entity
{
  if (a1)
  {
    a1 = (id *)a1[24];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)placeInfo
{
  if (a1)
  {
    a1 = (id *)a1[50];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)styleAttributes
{
  if (a1)
  {
    a1 = (id *)a1[74];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)captionedPhoto
{
  if (a1)
  {
    a1 = (id *)a1[16];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)addressObject
{
  if (a1)
  {
    a1 = (id *)a1[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)relatedPlace
{
  if (a1)
  {
    a1 = (id *)a1[64];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDEntity *)self->_entity copyWithZone:a3];
  v7 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v6;

  id v8 = [(GEOPDPlaceInfo *)self->_placeInfo copyWithZone:a3];
  v9 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v8;

  id v10 = [(GEOPDRoadAccessInfo *)self->_accessInfo copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  id v12 = [(GEOPDBounds *)self->_bounds copyWithZone:a3];
  v13 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v12;

  id v14 = [(GEOPDAddress *)self->_address copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(GEOPDRating *)self->_rating copyWithZone:a3];
  v17 = *(void **)(v5 + 488);
  *(void *)(v5 + 488) = v16;

  id v18 = [(GEOPDReview *)self->_review copyWithZone:a3];
  v19 = *(void **)(v5 + 536);
  *(void *)(v5 + 536) = v18;

  id v20 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  v21 = *(void **)(v5 + 368);
  *(void *)(v5 + 368) = v20;

  id v22 = [(GEOPDHours *)self->_hours copyWithZone:a3];
  v23 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v22;

  id v24 = [(GEOPDTransitInfo *)self->_transitInfo copyWithZone:a3];
  v25 = *(void **)(v5 + 680);
  *(void *)(v5 + 680) = v24;

  id v26 = [(GEOPDTransitSchedule *)self->_transitSchedule copyWithZone:a3];
  v27 = *(void **)(v5 + 704);
  *(void *)(v5 + 704) = v26;

  id v28 = [(GEOPDETA *)self->_eta copyWithZone:a3];
  v29 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v28;

  id v30 = [(GEOPDFlyover *)self->_flyover copyWithZone:a3];
  v31 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v30;

  id v32 = [(GEOPDRawAttribute *)self->_rawAttribute copyWithZone:a3];
  v33 = *(void **)(v5 + 496);
  *(void *)(v5 + 496) = v32;

  id v34 = [(GEOPDAmenities *)self->_amenities copyWithZone:a3];
  v35 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v34;

  id v36 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  v37 = *(void **)(v5 + 592);
  *(void *)(v5 + 592) = v36;

  id v38 = [(GEOPDTransitIncident *)self->_transitIncident copyWithZone:a3];
  v39 = *(void **)(v5 + 664);
  *(void *)(v5 + 664) = v38;

  id v40 = [(GEOPDTransitAssociatedInfo *)self->_transitAssociatedInfo copyWithZone:a3];
  v41 = *(void **)(v5 + 648);
  *(void *)(v5 + 648) = v40;

  id v42 = [(GEOPDTextBlock *)self->_textBlock copyWithZone:a3];
  v43 = *(void **)(v5 + 616);
  *(void *)(v5 + 616) = v42;

  id v44 = [(GEOPDFactoid *)self->_factoid copyWithZone:a3];
  v45 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v44;

  id v46 = [(GEOPDTransitAttribution *)self->_transitAttribution copyWithZone:a3];
  v47 = *(void **)(v5 + 656);
  *(void *)(v5 + 656) = v46;

  id v48 = [(GEOPDBusinessClaim *)self->_businessClaim copyWithZone:a3];
  v49 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v48;

  id v50 = [(GEOPDCaptionedPhoto *)self->_captionedPhoto copyWithZone:a3];
  v51 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v50;

  id v52 = [(GEOPDTransitInfoSnippet *)self->_transitInfoSnippet copyWithZone:a3];
  v53 = *(void **)(v5 + 672);
  *(void *)(v5 + 672) = v52;

  id v54 = [(GEOPDExternalAction *)self->_externalAction copyWithZone:a3];
  v55 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v54;

  id v56 = [(GEOPDResultSnippet *)self->_resultSnippet copyWithZone:a3];
  v57 = *(void **)(v5 + 528);
  *(void *)(v5 + 528) = v56;

  id v58 = [(GEOPDAddressObject *)self->_addressObject copyWithZone:a3];
  v59 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v58;

  id v60 = [(GEOPDSimpleRestaurantMenuText *)self->_simpleRestaurantMenuText copyWithZone:a3];
  v61 = *(void **)(v5 + 552);
  *(void *)(v5 + 552) = v60;

  id v62 = [(GEOPDRestaurantReservationLink *)self->_restaurantReservationLink copyWithZone:a3];
  v63 = *(void **)(v5 + 520);
  *(void *)(v5 + 520) = v62;

  id v64 = [(GEOPDSpatialLookupResult *)self->_spatialLookupResult copyWithZone:a3];
  v65 = *(void **)(v5 + 560);
  *(void *)(v5 + 560) = v64;

  id v66 = [(GEOPDTip *)self->_tip copyWithZone:a3];
  v67 = *(void **)(v5 + 624);
  *(void *)(v5 + 624) = v66;

  id v68 = [(GEOPDPlacecardURL *)self->_placecardUrl copyWithZone:a3];
  v69 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v68;

  id v70 = [(GEOPDAssociatedApp *)self->_associatedApp copyWithZone:a3];
  v71 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v70;

  id v72 = [(GEOPDMessageLink *)self->_messageLink copyWithZone:a3];
  v73 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v72;

  id v74 = [(GEOPDQuickLink *)self->_quickLink copyWithZone:a3];
  v75 = *(void **)(v5 + 472);
  *(void *)(v5 + 472) = v74;

  id v76 = [(GEOPDRap *)self->_rap copyWithZone:a3];
  v77 = *(void **)(v5 + 480);
  *(void *)(v5 + 480) = v76;

  id v78 = [(GEOPDOfflineArea *)self->_offlineArea copyWithZone:a3];
  v79 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = v78;

  id v80 = [(GEOPDLocationEvent *)self->_locationEvent copyWithZone:a3];
  v81 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v80;

  id v82 = [(GEOPDSupportsOfflineMaps *)self->_supportsOfflineMaps copyWithZone:a3];
  v83 = *(void **)(v5 + 600);
  *(void *)(v5 + 600) = v82;

  id v84 = [(GEOPDVenueInfo *)self->_venueInfo copyWithZone:a3];
  v85 = *(void **)(v5 + 752);
  *(void *)(v5 + 752) = v84;

  id v86 = [(GEOPDContainedPlace *)self->_containedPlace copyWithZone:a3];
  v87 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v86;

  id v88 = [(GEOPDWifiFingerprint *)self->_wifiFingerprint copyWithZone:a3];
  v89 = *(void **)(v5 + 760);
  *(void *)(v5 + 760) = v88;

  id v90 = [(GEOPDIcon *)self->_icon copyWithZone:a3];
  v91 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v90;

  id v92 = [(GEOPDPriceDescription *)self->_priceDescription copyWithZone:a3];
  v93 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v92;

  id v94 = [(GEOPDBrowseCategories *)self->_browseCategories copyWithZone:a3];
  v95 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v94;

  id v96 = [(GEOPDStorefront *)self->_storefront copyWithZone:a3];
  v97 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = v96;

  id v98 = [(GEOPDGroundViewLabel *)self->_groundViewLabel copyWithZone:a3];
  v99 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v98;

  id v100 = [(GEOPDAnnotatedItemList *)self->_annotatedItemList copyWithZone:a3];
  v101 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v100;

  id v102 = [(GEOPDPoiEvent *)self->_poiEvent copyWithZone:a3];
  v103 = *(void **)(v5 + 440);
  *(void *)(v5 + 440) = v102;

  id v104 = [(GEOPDStorefrontPresentation *)self->_storefrontPresentation copyWithZone:a3];
  v105 = *(void **)(v5 + 576);
  *(void *)(v5 + 576) = v104;

  id v106 = [(GEOPDPlacecardLayoutConfiguration *)self->_placecardLayoutConfiguration copyWithZone:a3];
  v107 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v106;

  id v108 = [(GEOPDPrototypeContainer *)self->_prototypeContainer copyWithZone:a3];
  v109 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v108;

  id v110 = [(GEOPBTransitVehiclePosition *)self->_transitVehiclePosition copyWithZone:a3];
  v111 = *(void **)(v5 + 736);
  *(void *)(v5 + 736) = v110;

  id v112 = [(GEOPDLinkedService *)self->_linkedService copyWithZone:a3];
  v113 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v112;

  id v114 = [(GEOPDBusinessHours *)self->_businessHours copyWithZone:a3];
  v115 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v114;

  id v116 = [(GEOPDPlaceCollection *)self->_placeCollection copyWithZone:a3];
  v117 = *(void **)(v5 + 392);
  *(void *)(v5 + 392) = v116;

  id v118 = [(GEOPDRelatedPlace *)self->_relatedPlace copyWithZone:a3];
  v119 = *(void **)(v5 + 512);
  *(void *)(v5 + 512) = v118;

  id v120 = [(GEOPDTransitTripStop *)self->_transitTripStop copyWithZone:a3];
  v121 = *(void **)(v5 + 728);
  *(void *)(v5 + 728) = v120;

  id v122 = [(GEOPDTransitTripStopTime *)self->_transitTripStopTime copyWithZone:a3];
  v123 = *(void **)(v5 + 720);
  *(void *)(v5 + 720) = v122;

  id v124 = [(GEOPDTransitTripGeometry *)self->_transitTripGeometry copyWithZone:a3];
  v125 = *(void **)(v5 + 712);
  *(void *)(v5 + 712) = v124;

  id v126 = [(GEOPDBrowseCategories *)self->_placeBrowseCategories copyWithZone:a3];
  v127 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v126;

  id v128 = [(GEOPDPublisher *)self->_publisher copyWithZone:a3];
  v129 = *(void **)(v5 + 464);
  *(void *)(v5 + 464) = v128;

  id v130 = [(GEOPDMiniBrowseCategories *)self->_miniPlaceBrowseCategories copyWithZone:a3];
  v131 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v130;

  id v132 = [(GEOPDPlaceQuestionnaireResult *)self->_placeQuestionnaire copyWithZone:a3];
  v133 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v132;

  id v134 = [(GEOPDPlaceCollectionItem *)self->_placeCollectionItem copyWithZone:a3];
  v135 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v134;

  id v136 = [(GEOPDCollectionIds *)self->_collectionIds copyWithZone:a3];
  v137 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v136;

  id v138 = [(GEOPDISO3166Code *)self->_iso3166Code copyWithZone:a3];
  v139 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v138;

  id v140 = [(GEOPDAmenities *)self->_vendorAmenities copyWithZone:a3];
  v141 = *(void **)(v5 + 744);
  *(void *)(v5 + 744) = v140;

  id v142 = [(GEOPDTransitNearbySchedule *)self->_transitNearbySchedule copyWithZone:a3];
  v143 = *(void **)(v5 + 688);
  *(void *)(v5 + 688) = v142;

  id v144 = [(GEOPDStorefrontFaces *)self->_storefrontFaces copyWithZone:a3];
  v145 = *(void **)(v5 + 568);
  *(void *)(v5 + 568) = v144;

  id v146 = [(GEOPDGuideGroup *)self->_guideGroup copyWithZone:a3];
  v147 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v146;

  id v148 = [(GEOPDContainmentPlace *)self->_containmentPlace copyWithZone:a3];
  v149 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v148;

  id v150 = [(GEOPDCategorizedPhotos *)self->_categorizedPhotos copyWithZone:a3];
  v151 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v150;

  id v152 = [(GEOPDExploreGuides *)self->_exploreGuides copyWithZone:a3];
  v153 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v152;

  id v154 = [(GEOPDAbout *)self->_about copyWithZone:a3];
  v155 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v154;

  id v156 = [(GEOPDLabelGeometry *)self->_labelGeometry copyWithZone:a3];
  v157 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = v156;

  id v158 = [(GEOPDEnhancedPlacement *)self->_enhancedPlacement copyWithZone:a3];
  v159 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v158;

  id v160 = [(GEOPDTemplatePlace *)self->_templatePlace copyWithZone:a3];
  v161 = *(void **)(v5 + 608);
  *(void *)(v5 + 608) = v160;

  id v162 = [(GEOPDTransitPaymentMethodInfo *)self->_transitPaymentMethodInfo copyWithZone:a3];
  v163 = *(void **)(v5 + 696);
  *(void *)(v5 + 696) = v162;

  id v164 = [(GEOPDBusinessAssets *)self->_businessAssets copyWithZone:a3];
  v165 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v164;

  id v166 = [(GEOPDEnrichmentInfo *)self->_enrichmentInfo copyWithZone:a3];
  v167 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v166;

  id v168 = [(GEOPDActionData *)self->_actionData copyWithZone:a3];
  v169 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v168;

  id v170 = [(GEOPDEnrichmentData *)self->_enrichmentData copyWithZone:a3];
  v171 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v170;

  id v172 = [(GEOPDPOIClaim *)self->_poiClaim copyWithZone:a3];
  v173 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v172;

  id v174 = [(GEOPDEVCharger *)self->_evCharger copyWithZone:a3];
  v175 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v174;

  id v176 = [(GEOPDTrailHead *)self->_trailHead copyWithZone:a3];
  v177 = *(void **)(v5 + 640);
  *(void *)(v5 + 640) = v176;

  id v178 = [(GEOPDTooltip *)self->_toolTip copyWithZone:a3];
  v179 = *(void **)(v5 + 632);
  *(void *)(v5 + 632) = v178;

  id v180 = [(GEOPDRefreshId *)self->_refreshId copyWithZone:a3];
  v181 = *(void **)(v5 + 504);
  *(void *)(v5 + 504) = v180;

  id v182 = [(GEOPDAddressWithComponents *)self->_addressWithComponents copyWithZone:a3];
  v183 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v182;

  id v184 = [(GEOPDSearchResultPlacePhoto *)self->_searchResultPlacePhoto copyWithZone:a3];
  v185 = *(void **)(v5 + 544);
  *(void *)(v5 + 544) = v184;

  id v186 = [(GEOPDForwardInfo *)self->_forwardInfo copyWithZone:a3];
  v187 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v186;

  id v188 = [(GEOPDHikeAssociatedInfo *)self->_hikeAssociatedInfo copyWithZone:a3];
  v189 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v188;

  id v190 = [(GEOPDHikeSummary *)self->_hikeSummary copyWithZone:a3];
  v191 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v190;

  id v192 = [(GEOPDHikeGeometry *)self->_hikeGeometry copyWithZone:a3];
  v193 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v192;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (id)bounds
{
  if (a1)
  {
    a1 = (id *)a1[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_entity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placeInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_accessInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bounds)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rating)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_review)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_hours)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitSchedule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_eta)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_flyover)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rawAttribute)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_amenities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_styleAttributes)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitIncident)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitAssociatedInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_textBlock)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_factoid)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitAttribution)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_businessClaim)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_captionedPhoto)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitInfoSnippet)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_externalAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_resultSnippet)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addressObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_simpleRestaurantMenuText)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_restaurantReservationLink)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_spatialLookupResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tip)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placecardUrl)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_associatedApp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_messageLink)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_quickLink)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rap)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_offlineArea)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_locationEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_supportsOfflineMaps)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_venueInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_containedPlace)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wifiFingerprint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_priceDescription)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_browseCategories)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_storefront)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_groundViewLabel)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_annotatedItemList)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_poiEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_storefrontPresentation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placecardLayoutConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_prototypeContainer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitVehiclePosition)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_linkedService)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_businessHours)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placeCollection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_relatedPlace)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitTripStop)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitTripStopTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitTripGeometry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placeBrowseCategories)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_publisher)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_miniPlaceBrowseCategories)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placeQuestionnaire)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_placeCollectionItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_collectionIds)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_iso3166Code)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_vendorAmenities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitNearbySchedule)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_storefrontFaces)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_guideGroup)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_containmentPlace)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_categorizedPhotos)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_exploreGuides)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_about)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_labelGeometry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_enhancedPlacement)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_templatePlace)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transitPaymentMethodInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_businessAssets)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_enrichmentInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_actionData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_enrichmentData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_poiClaim)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_evCharger)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_trailHead)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_toolTip)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_refreshId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addressWithComponents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchResultPlacePhoto)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_forwardInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_hikeAssociatedInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_hikeSummary)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_hikeGeometry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)iso3166Code
{
  if (a1)
  {
    a1 = (id *)a1[39];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_190;
  }
  entity = self->_entity;
  if ((unint64_t)entity | v4[24])
  {
    if (!-[GEOPDEntity isEqual:](entity, "isEqual:")) {
      goto LABEL_190;
    }
  }
  placeInfo = self->_placeInfo;
  if ((unint64_t)placeInfo | v4[50] && !-[GEOPDPlaceInfo isEqual:](placeInfo, "isEqual:")) {
    goto LABEL_190;
  }
  accessInfo = self->_accessInfo;
  if ((unint64_t)accessInfo | v4[3] && !-[GEOPDRoadAccessInfo isEqual:](accessInfo, "isEqual:")) {
    goto LABEL_190;
  }
  bounds = self->_bounds;
  if ((unint64_t)bounds | v4[11] && !-[GEOPDBounds isEqual:](bounds, "isEqual:")) {
    goto LABEL_190;
  }
  address = self->_address;
  if ((unint64_t)address | v4[7] && !-[GEOPDAddress isEqual:](address, "isEqual:")) {
    goto LABEL_190;
  }
  rating = self->_rating;
  if ((unint64_t)rating | v4[61] && !-[GEOPDRating isEqual:](rating, "isEqual:")) {
    goto LABEL_190;
  }
  review = self->_review;
  if ((unint64_t)review | v4[67] && !-[GEOPDReview isEqual:](review, "isEqual:")) {
    goto LABEL_190;
  }
  photo = self->_photo;
  if ((unint64_t)photo | v4[46] && !-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
    goto LABEL_190;
  }
  hours = self->_hours;
  if ((unint64_t)hours | v4[37] && !-[GEOPDHours isEqual:](hours, "isEqual:")) {
    goto LABEL_190;
  }
  transitInfo = self->_transitInfo;
  if ((unint64_t)transitInfo | v4[85] && !-[GEOPDTransitInfo isEqual:](transitInfo, "isEqual:")) {
    goto LABEL_190;
  }
  transitSchedule = self->_transitSchedule;
  if ((unint64_t)transitSchedule | v4[88] && !-[GEOPDTransitSchedule isEqual:](transitSchedule, "isEqual:")) {
    goto LABEL_190;
  }
  eta = self->_eta;
  if ((unint64_t)eta | v4[25] && !-[GEOPDETA isEqual:](eta, "isEqual:")) {
    goto LABEL_190;
  }
  flyover = self->_flyover;
  if ((unint64_t)flyover | v4[30] && !-[GEOPDFlyover isEqual:](flyover, "isEqual:")) {
    goto LABEL_190;
  }
  rawAttribute = self->_rawAttribute;
  if ((unint64_t)rawAttribute | v4[62] && !-[GEOPDRawAttribute isEqual:](rawAttribute, "isEqual:")) {
    goto LABEL_190;
  }
  amenities = self->_amenities;
  if ((unint64_t)amenities | v4[8] && !-[GEOPDAmenities isEqual:](amenities, "isEqual:")) {
    goto LABEL_190;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | v4[74] && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")) {
    goto LABEL_190;
  }
  transitIncident = self->_transitIncident;
  if ((unint64_t)transitIncident | v4[83] && !-[GEOPDTransitIncident isEqual:](transitIncident, "isEqual:")) {
    goto LABEL_190;
  }
  transitAssociatedInfo = self->_transitAssociatedInfo;
  if ((unint64_t)transitAssociatedInfo | v4[81]
    && !-[GEOPDTransitAssociatedInfo isEqual:](transitAssociatedInfo, "isEqual:"))
  {
    goto LABEL_190;
  }
  textBlock = self->_textBlock;
  if ((unint64_t)textBlock | v4[77] && !-[GEOPDTextBlock isEqual:](textBlock, "isEqual:")) {
    goto LABEL_190;
  }
  factoid = self->_factoid;
  if ((unint64_t)factoid | v4[29] && !-[GEOPDFactoid isEqual:](factoid, "isEqual:")) {
    goto LABEL_190;
  }
  transitAttribution = self->_transitAttribution;
  if ((unint64_t)transitAttribution | v4[82]
    && !-[GEOPDTransitAttribution isEqual:](transitAttribution, "isEqual:"))
  {
    goto LABEL_190;
  }
  businessClaim = self->_businessClaim;
  if ((unint64_t)businessClaim | v4[14] && !-[GEOPDBusinessClaim isEqual:](businessClaim, "isEqual:")) {
    goto LABEL_190;
  }
  captionedPhoto = self->_captionedPhoto;
  if ((unint64_t)captionedPhoto | v4[16] && !-[GEOPDCaptionedPhoto isEqual:](captionedPhoto, "isEqual:")) {
    goto LABEL_190;
  }
  transitInfoSnippet = self->_transitInfoSnippet;
  if ((unint64_t)transitInfoSnippet | v4[84]
    && !-[GEOPDTransitInfoSnippet isEqual:](transitInfoSnippet, "isEqual:"))
  {
    goto LABEL_190;
  }
  externalAction = self->_externalAction;
  if ((unint64_t)externalAction | v4[28] && !-[GEOPDExternalAction isEqual:](externalAction, "isEqual:")) {
    goto LABEL_190;
  }
  resultSnippet = self->_resultSnippet;
  if ((unint64_t)resultSnippet | v4[66] && !-[GEOPDResultSnippet isEqual:](resultSnippet, "isEqual:")) {
    goto LABEL_190;
  }
  addressObject = self->_addressObject;
  if ((unint64_t)addressObject | v4[5] && !-[GEOPDAddressObject isEqual:](addressObject, "isEqual:")) {
    goto LABEL_190;
  }
  simpleRestaurantMenuText = self->_simpleRestaurantMenuText;
  if ((unint64_t)simpleRestaurantMenuText | v4[69]
    && !-[GEOPDSimpleRestaurantMenuText isEqual:](simpleRestaurantMenuText, "isEqual:"))
  {
    goto LABEL_190;
  }
  restaurantReservationLink = self->_restaurantReservationLink;
  if ((unint64_t)restaurantReservationLink | v4[65]
    && !-[GEOPDRestaurantReservationLink isEqual:](restaurantReservationLink, "isEqual:"))
  {
    goto LABEL_190;
  }
  spatialLookupResult = self->_spatialLookupResult;
  if ((unint64_t)spatialLookupResult | v4[70]
    && !-[GEOPDSpatialLookupResult isEqual:](spatialLookupResult, "isEqual:"))
  {
    goto LABEL_190;
  }
  tip = self->_tip;
  if ((unint64_t)tip | v4[78] && !-[GEOPDTip isEqual:](tip, "isEqual:")) {
    goto LABEL_190;
  }
  placecardUrl = self->_placecardUrl;
  if ((unint64_t)placecardUrl | v4[53] && !-[GEOPDPlacecardURL isEqual:](placecardUrl, "isEqual:")) {
    goto LABEL_190;
  }
  associatedApp = self->_associatedApp;
  if ((unint64_t)associatedApp | v4[10] && !-[GEOPDAssociatedApp isEqual:](associatedApp, "isEqual:")) {
    goto LABEL_190;
  }
  messageLink = self->_messageLink;
  if ((unint64_t)messageLink | v4[43] && !-[GEOPDMessageLink isEqual:](messageLink, "isEqual:")) {
    goto LABEL_190;
  }
  quickLink = self->_quickLink;
  if ((unint64_t)quickLink | v4[59] && !-[GEOPDQuickLink isEqual:](quickLink, "isEqual:")) {
    goto LABEL_190;
  }
  rap = self->_rap;
  if ((unint64_t)rap | v4[60] && !-[GEOPDRap isEqual:](rap, "isEqual:")) {
    goto LABEL_190;
  }
  offlineArea = self->_offlineArea;
  if ((unint64_t)offlineArea | v4[45] && !-[GEOPDOfflineArea isEqual:](offlineArea, "isEqual:")) {
    goto LABEL_190;
  }
  locationEvent = self->_locationEvent;
  if ((unint64_t)locationEvent | v4[42] && !-[GEOPDLocationEvent isEqual:](locationEvent, "isEqual:")) {
    goto LABEL_190;
  }
  supportsOfflineMaps = self->_supportsOfflineMaps;
  if ((unint64_t)supportsOfflineMaps | v4[75]
    && !-[GEOPDSupportsOfflineMaps isEqual:](supportsOfflineMaps, "isEqual:"))
  {
    goto LABEL_190;
  }
  venueInfo = self->_venueInfo;
  if ((unint64_t)venueInfo | v4[94] && !-[GEOPDVenueInfo isEqual:](venueInfo, "isEqual:")) {
    goto LABEL_190;
  }
  containedPlace = self->_containedPlace;
  if ((unint64_t)containedPlace | v4[19] && !-[GEOPDContainedPlace isEqual:](containedPlace, "isEqual:")) {
    goto LABEL_190;
  }
  wifiFingerprint = self->_wifiFingerprint;
  if ((unint64_t)wifiFingerprint | v4[95] && !-[GEOPDWifiFingerprint isEqual:](wifiFingerprint, "isEqual:")) {
    goto LABEL_190;
  }
  icon = self->_icon;
  if ((unint64_t)icon | v4[38] && !-[GEOPDIcon isEqual:](icon, "isEqual:")) {
    goto LABEL_190;
  }
  priceDescription = self->_priceDescription;
  if ((unint64_t)priceDescription | v4[56] && !-[GEOPDPriceDescription isEqual:](priceDescription, "isEqual:")) {
    goto LABEL_190;
  }
  browseCategories = self->_browseCategories;
  if ((unint64_t)browseCategories | v4[12] && !-[GEOPDBrowseCategories isEqual:](browseCategories, "isEqual:")) {
    goto LABEL_190;
  }
  storefront = self->_storefront;
  if ((unint64_t)storefront | v4[73] && !-[GEOPDStorefront isEqual:](storefront, "isEqual:")) {
    goto LABEL_190;
  }
  groundViewLabel = self->_groundViewLabel;
  if ((unint64_t)groundViewLabel | v4[32] && !-[GEOPDGroundViewLabel isEqual:](groundViewLabel, "isEqual:")) {
    goto LABEL_190;
  }
  annotatedItemList = self->_annotatedItemList;
  if ((unint64_t)annotatedItemList | v4[9] && !-[GEOPDAnnotatedItemList isEqual:](annotatedItemList, "isEqual:")) {
    goto LABEL_190;
  }
  poiEvent = self->_poiEvent;
  if ((unint64_t)poiEvent | v4[55] && !-[GEOPDPoiEvent isEqual:](poiEvent, "isEqual:")) {
    goto LABEL_190;
  }
  storefrontPresentation = self->_storefrontPresentation;
  if ((unint64_t)storefrontPresentation | v4[72]
    && !-[GEOPDStorefrontPresentation isEqual:](storefrontPresentation, "isEqual:"))
  {
    goto LABEL_190;
  }
  placecardLayoutConfiguration = self->_placecardLayoutConfiguration;
  if ((unint64_t)placecardLayoutConfiguration | v4[52]
    && !-[GEOPDPlacecardLayoutConfiguration isEqual:](placecardLayoutConfiguration, "isEqual:"))
  {
    goto LABEL_190;
  }
  prototypeContainer = self->_prototypeContainer;
  if ((unint64_t)prototypeContainer | v4[57]
    && !-[GEOPDPrototypeContainer isEqual:](prototypeContainer, "isEqual:"))
  {
    goto LABEL_190;
  }
  transitVehiclePosition = self->_transitVehiclePosition;
  if ((unint64_t)transitVehiclePosition | v4[92]
    && !-[GEOPBTransitVehiclePosition isEqual:](transitVehiclePosition, "isEqual:"))
  {
    goto LABEL_190;
  }
  linkedService = self->_linkedService;
  if ((unint64_t)linkedService | v4[41] && !-[GEOPDLinkedService isEqual:](linkedService, "isEqual:")) {
    goto LABEL_190;
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | v4[15] && !-[GEOPDBusinessHours isEqual:](businessHours, "isEqual:")) {
    goto LABEL_190;
  }
  placeCollection = self->_placeCollection;
  if ((unint64_t)placeCollection | v4[49] && !-[GEOPDPlaceCollection isEqual:](placeCollection, "isEqual:")) {
    goto LABEL_190;
  }
  relatedPlace = self->_relatedPlace;
  if ((unint64_t)relatedPlace | v4[64] && !-[GEOPDRelatedPlace isEqual:](relatedPlace, "isEqual:")) {
    goto LABEL_190;
  }
  transitTripStop = self->_transitTripStop;
  if ((unint64_t)transitTripStop | v4[91] && !-[GEOPDTransitTripStop isEqual:](transitTripStop, "isEqual:")) {
    goto LABEL_190;
  }
  transitTripStopTime = self->_transitTripStopTime;
  if ((unint64_t)transitTripStopTime | v4[90]
    && !-[GEOPDTransitTripStopTime isEqual:](transitTripStopTime, "isEqual:"))
  {
    goto LABEL_190;
  }
  transitTripGeometry = self->_transitTripGeometry;
  if ((unint64_t)transitTripGeometry | v4[89]
    && !-[GEOPDTransitTripGeometry isEqual:](transitTripGeometry, "isEqual:"))
  {
    goto LABEL_190;
  }
  placeBrowseCategories = self->_placeBrowseCategories;
  if ((unint64_t)placeBrowseCategories | v4[47]
    && !-[GEOPDBrowseCategories isEqual:](placeBrowseCategories, "isEqual:"))
  {
    goto LABEL_190;
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | v4[58] && !-[GEOPDPublisher isEqual:](publisher, "isEqual:")) {
    goto LABEL_190;
  }
  miniPlaceBrowseCategories = self->_miniPlaceBrowseCategories;
  if ((unint64_t)miniPlaceBrowseCategories | v4[44]
    && !-[GEOPDMiniBrowseCategories isEqual:](miniPlaceBrowseCategories, "isEqual:"))
  {
    goto LABEL_190;
  }
  placeQuestionnaire = self->_placeQuestionnaire;
  if ((unint64_t)placeQuestionnaire | v4[51]
    && !-[GEOPDPlaceQuestionnaireResult isEqual:](placeQuestionnaire, "isEqual:"))
  {
    goto LABEL_190;
  }
  placeCollectionItem = self->_placeCollectionItem;
  if ((unint64_t)placeCollectionItem | v4[48]
    && !-[GEOPDPlaceCollectionItem isEqual:](placeCollectionItem, "isEqual:"))
  {
    goto LABEL_190;
  }
  collectionIds = self->_collectionIds;
  if ((unint64_t)collectionIds | v4[18] && !-[GEOPDCollectionIds isEqual:](collectionIds, "isEqual:")) {
    goto LABEL_190;
  }
  iso3166Code = self->_iso3166Code;
  if ((unint64_t)iso3166Code | v4[39] && !-[GEOPDISO3166Code isEqual:](iso3166Code, "isEqual:")) {
    goto LABEL_190;
  }
  vendorAmenities = self->_vendorAmenities;
  if ((unint64_t)vendorAmenities | v4[93] && !-[GEOPDAmenities isEqual:](vendorAmenities, "isEqual:")) {
    goto LABEL_190;
  }
  transitNearbySchedule = self->_transitNearbySchedule;
  if ((unint64_t)transitNearbySchedule | v4[86]
    && !-[GEOPDTransitNearbySchedule isEqual:](transitNearbySchedule, "isEqual:"))
  {
    goto LABEL_190;
  }
  storefrontFaces = self->_storefrontFaces;
  if ((unint64_t)storefrontFaces | v4[71] && !-[GEOPDStorefrontFaces isEqual:](storefrontFaces, "isEqual:")) {
    goto LABEL_190;
  }
  guideGroup = self->_guideGroup;
  if ((unint64_t)guideGroup | v4[33] && !-[GEOPDGuideGroup isEqual:](guideGroup, "isEqual:")) {
    goto LABEL_190;
  }
  containmentPlace = self->_containmentPlace;
  if ((unint64_t)containmentPlace | v4[20] && !-[GEOPDContainmentPlace isEqual:](containmentPlace, "isEqual:")) {
    goto LABEL_190;
  }
  categorizedPhotos = self->_categorizedPhotos;
  if ((unint64_t)categorizedPhotos | v4[17]
    && !-[GEOPDCategorizedPhotos isEqual:](categorizedPhotos, "isEqual:"))
  {
    goto LABEL_190;
  }
  exploreGuides = self->_exploreGuides;
  if ((unint64_t)exploreGuides | v4[27] && !-[GEOPDExploreGuides isEqual:](exploreGuides, "isEqual:")) {
    goto LABEL_190;
  }
  about = self->_about;
  if ((unint64_t)about | v4[2] && !-[GEOPDAbout isEqual:](about, "isEqual:")) {
    goto LABEL_190;
  }
  labelGeometry = self->_labelGeometry;
  if ((unint64_t)labelGeometry | v4[40] && !-[GEOPDLabelGeometry isEqual:](labelGeometry, "isEqual:")) {
    goto LABEL_190;
  }
  enhancedPlacement = self->_enhancedPlacement;
  if ((unint64_t)enhancedPlacement | v4[21]
    && !-[GEOPDEnhancedPlacement isEqual:](enhancedPlacement, "isEqual:"))
  {
    goto LABEL_190;
  }
  templatePlace = self->_templatePlace;
  if ((unint64_t)templatePlace | v4[76] && !-[GEOPDTemplatePlace isEqual:](templatePlace, "isEqual:")) {
    goto LABEL_190;
  }
  transitPaymentMethodInfo = self->_transitPaymentMethodInfo;
  if ((unint64_t)transitPaymentMethodInfo | v4[87]
    && !-[GEOPDTransitPaymentMethodInfo isEqual:](transitPaymentMethodInfo, "isEqual:"))
  {
    goto LABEL_190;
  }
  businessAssets = self->_businessAssets;
  if ((unint64_t)businessAssets | v4[13] && !-[GEOPDBusinessAssets isEqual:](businessAssets, "isEqual:")) {
    goto LABEL_190;
  }
  enrichmentInfo = self->_enrichmentInfo;
  if ((unint64_t)enrichmentInfo | v4[23] && !-[GEOPDEnrichmentInfo isEqual:](enrichmentInfo, "isEqual:")) {
    goto LABEL_190;
  }
  actionData = self->_actionData;
  if ((unint64_t)actionData | v4[4] && !-[GEOPDActionData isEqual:](actionData, "isEqual:")) {
    goto LABEL_190;
  }
  enrichmentData = self->_enrichmentData;
  if ((unint64_t)enrichmentData | v4[22] && !-[GEOPDEnrichmentData isEqual:](enrichmentData, "isEqual:")) {
    goto LABEL_190;
  }
  poiClaim = self->_poiClaim;
  if ((unint64_t)poiClaim | v4[54] && !-[GEOPDPOIClaim isEqual:](poiClaim, "isEqual:")) {
    goto LABEL_190;
  }
  evCharger = self->_evCharger;
  if ((unint64_t)evCharger | v4[26] && !-[GEOPDEVCharger isEqual:](evCharger, "isEqual:")) {
    goto LABEL_190;
  }
  trailHead = self->_trailHead;
  if ((unint64_t)trailHead | v4[80] && !-[GEOPDTrailHead isEqual:](trailHead, "isEqual:")) {
    goto LABEL_190;
  }
  if (((toolTip = self->_toolTip, !((unint64_t)toolTip | v4[79]))
     || -[GEOPDTooltip isEqual:](toolTip, "isEqual:"))
    && ((refreshId = self->_refreshId, !((unint64_t)refreshId | v4[63]))
     || -[GEOPDRefreshId isEqual:](refreshId, "isEqual:"))
    && ((addressWithComponents = self->_addressWithComponents, !((unint64_t)addressWithComponents | v4[6]))
     || -[GEOPDAddressWithComponents isEqual:](addressWithComponents, "isEqual:"))
    && ((searchResultPlacePhoto = self->_searchResultPlacePhoto, !((unint64_t)searchResultPlacePhoto | v4[68]))
     || -[GEOPDSearchResultPlacePhoto isEqual:](searchResultPlacePhoto, "isEqual:"))
    && ((forwardInfo = self->_forwardInfo, !((unint64_t)forwardInfo | v4[31]))
     || -[GEOPDForwardInfo isEqual:](forwardInfo, "isEqual:"))
    && ((hikeAssociatedInfo = self->_hikeAssociatedInfo, !((unint64_t)hikeAssociatedInfo | v4[34]))
     || -[GEOPDHikeAssociatedInfo isEqual:](hikeAssociatedInfo, "isEqual:"))
    && ((hikeSummary = self->_hikeSummary, !((unint64_t)hikeSummary | v4[36]))
     || -[GEOPDHikeSummary isEqual:](hikeSummary, "isEqual:")))
  {
    hikeGeometry = self->_hikeGeometry;
    if ((unint64_t)hikeGeometry | v4[35]) {
      char v99 = -[GEOPDHikeGeometry isEqual:](hikeGeometry, "isEqual:");
    }
    else {
      char v99 = 1;
    }
  }
  else
  {
LABEL_190:
    char v99 = 0;
  }

  return v99;
}

- (id)placeCollection
{
  if (a1)
  {
    a1 = (id *)a1[49];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 24);
  if (v4)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = *(id *)(v4 + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v43 + 1) + 8 * v9) hasGreenTeaWithValue:a2]) {
          goto LABEL_83;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v7) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  if (-[GEOPDBounds hasGreenTeaWithValue:](*(void *)(v3 + 88), a2)) {
    return 1;
  }
  uint64_t v10 = *(void *)(v3 + 144);
  if (v10)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = *(id *)(v10 + 16);
    uint64_t v11 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
LABEL_16:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v43 + 1) + 8 * v14) hasGreenTeaWithValue:a2]) {
          goto LABEL_83;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v12) {
            goto LABEL_16;
          }
          break;
        }
      }
    }
  }
  uint64_t v15 = *(void *)(v3 + 152);
  if (v15)
  {
    -[GEOPDContainedPlace _readChildPlaces](*(void *)(v3 + 152));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = *(id *)(v15 + 24);
    uint64_t v16 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
LABEL_26:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v5);
        }
        if (-[GEOPDLinkedPlace hasGreenTeaWithValue:](*(void *)(*((void *)&v39 + 1) + 8 * v19), a2)) {
          goto LABEL_83;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v17) {
            goto LABEL_26;
          }
          break;
        }
      }
    }

    -[GEOPDContainedPlace _readParentPlace](v15);
    if (!-[GEOPDLinkedPlace hasGreenTeaWithValue:](*(void *)(v15 + 40), a2))
    {
      -[GEOPDContainedPlace _readSiblingPlaces](v15);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v5 = *(id *)(v15 + 48);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v35 objects:&v43 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
LABEL_35:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v5);
          }
          if (-[GEOPDLinkedPlace hasGreenTeaWithValue:](*(void *)(*((void *)&v35 + 1) + 8 * v23), a2)) {
            goto LABEL_83;
          }
          if (v21 == ++v23)
          {
            uint64_t v21 = [v5 countByEnumeratingWithState:&v35 objects:&v43 count:16];
            if (v21) {
              goto LABEL_35;
            }
            break;
          }
        }
      }

      goto LABEL_42;
    }
    return 1;
  }
LABEL_42:
  uint64_t v24 = *(void *)(v3 + 160);
  if (v24)
  {
    -[GEOPDContainmentPlace _readContainerId](*(void *)(v3 + 160));
    if ([*(id *)(v24 + 24) hasGreenTeaWithValue:a2]) {
      return 1;
    }
  }
  uint64_t v25 = *(void *)(v3 + 200);
  if (v25)
  {
    -[GEOPDETA _readEtaRouteIncidents](*(void *)(v3 + 200));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = *(id *)(v25 + 24);
    uint64_t v26 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
LABEL_47:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v29), "hasGreenTeaWithValue:", a2, (void)v35)) {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v27) {
            goto LABEL_47;
          }
          goto LABEL_53;
        }
      }
LABEL_83:

      return 1;
    }
LABEL_53:
  }
  if (-[GEOPDExploreGuides hasGreenTeaWithValue:](*(void *)(v3 + 216), a2)) {
    return 1;
  }
  uint64_t v30 = *(void *)(v3 + 232);
  if (v30)
  {
    -[GEOPDFactoid _readPlaceId](*(void *)(v3 + 232));
    if ([*(id *)(v30 + 48) hasGreenTeaWithValue:a2]) {
      return 1;
    }
  }
  if (-[GEOPDForwardInfo hasGreenTeaWithValue:](*(void *)(v3 + 248), a2)) {
    return 1;
  }
  if ([*(id *)(v3 + 272) hasGreenTeaWithValue:a2]) {
    return 1;
  }
  if (-[GEOPDLabelGeometry hasGreenTeaWithValue:](*(void *)(v3 + 320), a2)) {
    return 1;
  }
  if (-[GEOPDLinkedService hasGreenTeaWithValue:](*(void *)(v3 + 328), a2)) {
    return 1;
  }
  if (-[GEOPDOfflineArea hasGreenTeaWithValue:](*(void *)(v3 + 360), a2)) {
    return 1;
  }
  if (-[GEOPDPlaceCollection hasGreenTeaWithValue:](*(void *)(v3 + 392), a2)) {
    return 1;
  }
  uint64_t v31 = *(void *)(v3 + 384);
  if (v31)
  {
    -[GEOPDPlaceCollectionItem _readItemId](*(void *)(v3 + 384));
    if ([*(id *)(v31 + 56) hasGreenTeaWithValue:a2]) {
      return 1;
    }
  }
  if (-[GEOPDPlaceInfo hasGreenTeaWithValue:](*(void *)(v3 + 400), a2)) {
    return 1;
  }
  if (-[GEOPDPlaceQuestionnaireResult hasGreenTeaWithValue:](*(void *)(v3 + 408), a2)) {
    return 1;
  }
  if (-[GEOPDPoiEvent hasGreenTeaWithValue:](*(void *)(v3 + 440), a2)) {
    return 1;
  }
  if (-[GEOPDPublisher hasGreenTeaWithValue:](*(void *)(v3 + 464), a2)) {
    return 1;
  }
  uint64_t v32 = *(void *)(v3 + 504);
  if (v32)
  {
    if ([*(id *)(v32 + 16) hasGreenTeaWithValue:a2]) {
      return 1;
    }
  }
  if (-[GEOPDRelatedPlace hasGreenTeaWithValue:](*(void *)(v3 + 512), a2)) {
    return 1;
  }
  if (-[GEOPDResultSnippet hasGreenTeaWithValue:](*(void *)(v3 + 528), a2)) {
    return 1;
  }
  if (-[GEOPDSpatialLookupResult hasGreenTeaWithValue:](*(void *)(v3 + 560), a2)) {
    return 1;
  }
  if (-[GEOPDTemplatePlace hasGreenTeaWithValue:](*(void *)(v3 + 608), a2)) {
    return 1;
  }
  if (-[GEOPDTrailHead hasGreenTeaWithValue:](*(void *)(v3 + 640), a2)) {
    return 1;
  }
  if (-[GEOPDTransitInfo hasGreenTeaWithValue:](*(void *)(v3 + 680), a2)) {
    return 1;
  }
  uint64_t v33 = *(void *)(v3 + 672);
  if (v33)
  {
    -[GEOPDTransitInfoSnippet _readStopLocationForTrip](*(void *)(v3 + 672));
    if ([*(id *)(v33 + 48) hasGreenTeaWithValue:a2]) {
      return 1;
    }
  }
  if (-[GEOPDTransitTripStop hasGreenTeaWithValue:](*(void *)(v3 + 728), a2)) {
    return 1;
  }
  id v34 = *(void **)(v3 + 736);

  return [v34 hasGreenTeaWithValue:a2];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v621 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      [*(id *)(a1 + 192) clearUnknownFields:1];
      -[GEOPDPlaceInfo clearUnknownFields:](*(void *)(a1 + 400));
      uint64_t v567 = a1;
      uint64_t v5 = *(void *)(a1 + 24);
      if (v5)
      {
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v7 = *(id *)(v5 + 16);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v617;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v617 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_msgSend(*(id *)(*((void *)&v616 + 1) + 8 * i), "clearUnknownFields:", 1, v567);
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v9);
        }
      }
      -[GEOPDBounds clearUnknownFields:](*(void *)(v567 + 88));
      uint64_t v12 = *(void *)(v567 + 56);
      if (v12)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v12 + 64) |= 2u;
        *(unsigned char *)(v12 + 64) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
        uint64_t v13 = *(void **)(v12 + 16);
        *(void *)(v12 + 16) = 0;

        -[GEOPDAddress readAll:](v12, 0);
        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v14 = *(id *)(v12 + 24);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v608 objects:v620 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v609;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v609 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v608 + 1) + 8 * j);
              if (v19)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v19 + 52) |= 1u;
                *(unsigned char *)(v19 + 52) |= 8u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 48));
                uint64_t v20 = *(void **)(v19 + 16);
                *(void *)(v19 + 16) = 0;

                -[GEOPDLocalizedAddress readAll:](v19, 0);
                [*(id *)(v19 + 24) clearUnknownFields:1];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v608 objects:v620 count:16];
          }
          while (v16);
        }

        long long v606 = 0u;
        long long v607 = 0u;
        long long v604 = 0u;
        long long v605 = 0u;
        id v21 = *(id *)(v12 + 32);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v604 objects:&v616 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v605;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v605 != v24) {
                objc_enumerationMutation(v21);
              }
              objc_msgSend(*(id *)(*((void *)&v604 + 1) + 8 * k), "clearUnknownFields:", 1, v567);
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v604 objects:&v616 count:16];
          }
          while (v23);
        }

        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        id v26 = *(id *)(v12 + 40);
        uint64_t v27 = [v26 countByEnumeratingWithState:&v600 objects:&v612 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v601;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v601 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v600 + 1) + 8 * m);
              if (v31)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v31 + 52) |= 1u;
                *(unsigned char *)(v31 + 52) |= 8u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v31 + 48));
                uint64_t v32 = *(void **)(v31 + 16);
                *(void *)(v31 + 16) = 0;

                -[GEOPDLocalizedSpokenStructuredAddress readAll:](v31, 0);
                [*(id *)(v31 + 32) clearUnknownFields:1];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v600 objects:&v612 count:16];
          }
          while (v28);
        }
      }
      uint64_t v33 = v567;
      -[GEOPDRating clearUnknownFields:](*(void *)(v567 + 488));
      uint64_t v34 = *(void *)(v567 + 536);
      if (v34)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v34 + 76) |= 2u;
        *(unsigned char *)(v34 + 76) |= 0x40u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 72));
        long long v35 = *(void **)(v34 + 16);
        *(void *)(v34 + 16) = 0;

        -[GEOPDReview readAll:](v34, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v36 = *(id *)(v34 + 56);
        uint64_t v37 = [v36 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v617;
          do
          {
            for (uint64_t n = 0; n != v38; ++n)
            {
              if (*(void *)v617 != v39) {
                objc_enumerationMutation(v36);
              }
              objc_msgSend(*(id *)(*((void *)&v616 + 1) + 8 * n), "clearUnknownFields:", 1, v567);
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v38);
        }

        uint64_t v41 = *(void *)(v34 + 48);
        if (v41)
        {
          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v41 + 52) |= 1u;
          *(unsigned char *)(v41 + 52) |= 8u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v41 + 48));
          long long v42 = *(void **)(v41 + 16);
          *(void *)(v41 + 16) = 0;

          -[GEOPDUser readAll:](v41, 0);
          -[GEOPDPhoto clearUnknownFields:](*(void *)(v41 + 24));
        }
        -[GEOPDRating clearUnknownFields:](*(void *)(v34 + 24));
        uint64_t v33 = v567;
      }
      -[GEOPDPhoto clearUnknownFields:](*(void *)(v33 + 368));
      [*(id *)(v33 + 296) clearUnknownFields:1];
      uint64_t v43 = *(void *)(v33 + 680);
      if (v43)
      {
        os_unfair_lock_lock_with_options();
        *(_WORD *)(v43 + 116) |= 2u;
        *(_WORD *)(v43 + 116) |= 0x800u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v43 + 112));
        long long v44 = *(void **)(v43 + 16);
        *(void *)(v43 + 16) = 0;

        -[GEOPDTransitInfo readAll:](v43, 0);
        long long v598 = 0u;
        long long v599 = 0u;
        long long v596 = 0u;
        long long v597 = 0u;
        id v45 = *(id *)(v43 + 32);
        uint64_t v46 = [v45 countByEnumeratingWithState:&v596 objects:&v616 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v597;
          do
          {
            for (iuint64_t i = 0; ii != v47; ++ii)
            {
              if (*(void *)v597 != v48) {
                objc_enumerationMutation(v45);
              }
              objc_msgSend(*(id *)(*((void *)&v596 + 1) + 8 * ii), "clearUnknownFields:", 1, v567);
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v596 objects:&v616 count:16];
          }
          while (v47);
        }

        long long v594 = 0u;
        long long v595 = 0u;
        long long v592 = 0u;
        long long v593 = 0u;
        id v50 = *(id *)(v43 + 64);
        uint64_t v51 = [v50 countByEnumeratingWithState:&v592 objects:&v612 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v593;
          do
          {
            for (juint64_t j = 0; jj != v52; ++jj)
            {
              if (*(void *)v593 != v53) {
                objc_enumerationMutation(v50);
              }
              objc_msgSend(*(id *)(*((void *)&v592 + 1) + 8 * jj), "clearUnknownFields:", 1, v567);
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v592 objects:&v612 count:16];
          }
          while (v52);
        }

        long long v590 = 0u;
        long long v591 = 0u;
        long long v588 = 0u;
        long long v589 = 0u;
        id v55 = *(id *)(v43 + 24);
        uint64_t v56 = [v55 countByEnumeratingWithState:&v588 objects:&v608 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v589;
          do
          {
            for (kuint64_t k = 0; kk != v57; ++kk)
            {
              if (*(void *)v589 != v58) {
                objc_enumerationMutation(v55);
              }
              objc_msgSend(*(id *)(*((void *)&v588 + 1) + 8 * kk), "clearUnknownFields:", 1, v567);
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v588 objects:&v608 count:16];
          }
          while (v57);
        }

        long long v586 = 0u;
        long long v587 = 0u;
        long long v584 = 0u;
        long long v585 = 0u;
        uint64_t v572 = v43;
        obuint64_t j = *(id *)(v43 + 80);
        uint64_t v60 = [obj countByEnumeratingWithState:&v584 objects:&v604 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v585;
          do
          {
            for (muint64_t m = 0; mm != v61; ++mm)
            {
              if (*(void *)v585 != v62) {
                objc_enumerationMutation(obj);
              }
              uint64_t v64 = *(void *)(*((void *)&v584 + 1) + 8 * mm);
              if (v64)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v64 + 68) |= 2u;
                *(unsigned char *)(v64 + 68) |= 0x20u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v64 + 64));
                v65 = *(void **)(v64 + 16);
                *(void *)(v64 + 16) = 0;

                -[GEOPDTransitConnection readAll:](v64, 0);
                long long v602 = 0u;
                long long v603 = 0u;
                long long v600 = 0u;
                long long v601 = 0u;
                id v66 = *(id *)(v64 + 48);
                uint64_t v67 = [v66 countByEnumeratingWithState:&v600 objects:v620 count:16];
                if (v67)
                {
                  uint64_t v68 = v67;
                  uint64_t v69 = *(void *)v601;
                  do
                  {
                    for (nuint64_t n = 0; nn != v68; ++nn)
                    {
                      if (*(void *)v601 != v69) {
                        objc_enumerationMutation(v66);
                      }
                      objc_msgSend(*(id *)(*((void *)&v600 + 1) + 8 * nn), "clearUnknownFields:", 1, v567);
                    }
                    uint64_t v68 = [v66 countByEnumeratingWithState:&v600 objects:v620 count:16];
                  }
                  while (v68);
                }

                [*(id *)(v64 + 32) clearUnknownFields:1];
              }
            }
            uint64_t v61 = [obj countByEnumeratingWithState:&v584 objects:&v604 count:16];
          }
          while (v61);
        }

        [*(id *)(v572 + 96) clearUnknownFields:1];
        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        id v71 = *(id *)(v572 + 48);
        uint64_t v72 = [v71 countByEnumeratingWithState:&v600 objects:v620 count:16];
        if (v72)
        {
          uint64_t v73 = v72;
          uint64_t v74 = *(void *)v601;
          do
          {
            for (uint64_t i1 = 0; i1 != v73; ++i1)
            {
              if (*(void *)v601 != v74) {
                objc_enumerationMutation(v71);
              }
              uint64_t v76 = *(void *)(*((void *)&v600 + 1) + 8 * i1);
              if (v76)
              {
                v77 = *(void **)(v76 + 8);
                *(void *)(v76 + 8) = 0;

                uint64_t v78 = *(void *)(v76 + 24);
                if (v78)
                {
                  v79 = *(void **)(v78 + 8);
                  *(void *)(v78 + 8) = 0;
                }
              }
            }
            uint64_t v73 = [v71 countByEnumeratingWithState:&v600 objects:v620 count:16];
          }
          while (v73);
        }
      }
      uint64_t v80 = *(void *)(v567 + 704);
      if (v80)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v80 + 92) |= 4u;
        *(unsigned char *)(v80 + 92) |= 0x80u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v80 + 88));
        v81 = *(void **)(v80 + 16);
        *(void *)(v80 + 16) = 0;

        -[GEOPDTransitSchedule readAll:](v80, 0);
        long long v606 = 0u;
        long long v607 = 0u;
        long long v604 = 0u;
        long long v605 = 0u;
        id v82 = *(id *)(v80 + 48);
        uint64_t v83 = [v82 countByEnumeratingWithState:&v604 objects:&v616 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          uint64_t v85 = *(void *)v605;
          do
          {
            for (uint64_t i2 = 0; i2 != v84; ++i2)
            {
              if (*(void *)v605 != v85) {
                objc_enumerationMutation(v82);
              }
              -[GEOPDDepartureSequence clearUnknownFields:](*(void *)(*((void *)&v604 + 1) + 8 * i2));
            }
            uint64_t v84 = [v82 countByEnumeratingWithState:&v604 objects:&v616 count:16];
          }
          while (v84);
        }

        uint64_t v87 = *(void *)(v80 + 24);
        if (v87)
        {
          id v88 = *(void **)(v87 + 8);
          *(void *)(v87 + 8) = 0;
        }
        uint64_t v89 = *(void *)(v80 + 32);
        if (v89)
        {
          id v90 = *(void **)(v89 + 8);
          *(void *)(v89 + 8) = 0;
        }
        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        id obja = *(id *)(v80 + 40);
        uint64_t v91 = [obja countByEnumeratingWithState:&v600 objects:&v612 count:16];
        if (v91)
        {
          uint64_t v92 = v91;
          uint64_t v93 = *(void *)v601;
          do
          {
            for (uint64_t i3 = 0; i3 != v92; ++i3)
            {
              if (*(void *)v601 != v93) {
                objc_enumerationMutation(obja);
              }
              uint64_t v95 = *(void *)(*((void *)&v600 + 1) + 8 * i3);
              if (v95)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v95 + 80) |= 2u;
                *(unsigned char *)(v95 + 80) |= 0x20u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v95 + 72));
                id v96 = *(void **)(v95 + 16);
                *(void *)(v95 + 16) = 0;

                -[GEOPDDepartureSequenceContainer readAll:](v95, 0);
                long long v610 = 0u;
                long long v611 = 0u;
                long long v608 = 0u;
                long long v609 = 0u;
                id v97 = *(id *)(v95 + 56);
                uint64_t v98 = [v97 countByEnumeratingWithState:&v608 objects:v620 count:16];
                if (v98)
                {
                  uint64_t v99 = v98;
                  uint64_t v100 = *(void *)v609;
                  do
                  {
                    for (uint64_t i4 = 0; i4 != v99; ++i4)
                    {
                      if (*(void *)v609 != v100) {
                        objc_enumerationMutation(v97);
                      }
                      objc_msgSend(*(id *)(*((void *)&v608 + 1) + 8 * i4), "clearUnknownFields:", 1, v567);
                    }
                    uint64_t v99 = [v97 countByEnumeratingWithState:&v608 objects:v620 count:16];
                  }
                  while (v99);
                }
              }
            }
            uint64_t v92 = [obja countByEnumeratingWithState:&v600 objects:&v612 count:16];
          }
          while (v92);
        }
      }
      uint64_t v102 = *(void *)(v567 + 200);
      if (v102)
      {
        os_unfair_lock_lock_with_options();
        *(_WORD *)(v102 + 72) |= 0x20u;
        *(_WORD *)(v102 + 72) |= 0x100u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v102 + 48));
        v103 = *(void **)(v102 + 16);
        *(void *)(v102 + 16) = 0;

        -[GEOPDETA readAll:](v102, 0);
        [*(id *)(v102 + 32) clearUnknownFields:1];
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v104 = *(id *)(v102 + 24);
        uint64_t v105 = [v104 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v105)
        {
          uint64_t v106 = v105;
          uint64_t v107 = *(void *)v617;
          do
          {
            for (uint64_t i5 = 0; i5 != v106; ++i5)
            {
              if (*(void *)v617 != v107) {
                objc_enumerationMutation(v104);
              }
              objc_msgSend(*(id *)(*((void *)&v616 + 1) + 8 * i5), "clearUnknownFields:", 1, v567);
            }
            uint64_t v106 = [v104 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v106);
        }
      }
      uint64_t v109 = v567;
      uint64_t v110 = *(void *)(v567 + 496);
      if (v110)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v110 + 52) |= 1u;
        *(unsigned char *)(v110 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v110 + 48));
        v111 = *(void **)(v110 + 16);
        *(void *)(v110 + 16) = 0;

        -[GEOPDRawAttribute readAll:](v110, 0);
      }
      objc_msgSend(*(id *)(v567 + 64), "clearUnknownFields:", 1, v567);
      [*(id *)(v109 + 592) clearUnknownFields:1];
      uint64_t v112 = *(void *)(v109 + 664);
      if (v112)
      {
        v113 = *(void **)(v112 + 8);
        *(void *)(v112 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v114 = *(id *)(v112 + 16);
        uint64_t v115 = [v114 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v115)
        {
          uint64_t v116 = v115;
          uint64_t v117 = *(void *)v617;
          do
          {
            for (uint64_t i6 = 0; i6 != v116; ++i6)
            {
              if (*(void *)v617 != v117) {
                objc_enumerationMutation(v114);
              }
              -[GEOPBTransitIncident clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i6), 1);
            }
            uint64_t v116 = [v114 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v116);
        }
      }
      uint64_t v119 = *(void *)(v568 + 648);
      if (v119)
      {
        id v120 = *(void **)(v119 + 8);
        *(void *)(v119 + 8) = 0;
      }
      uint64_t v121 = *(void *)(v568 + 616);
      if (v121)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v121 + 60) |= 1u;
        *(unsigned char *)(v121 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v121 + 56));
        id v122 = *(void **)(v121 + 16);
        *(void *)(v121 + 16) = 0;

        -[GEOPDTextBlock readAll:](v121, 0);
      }
      -[GEOPDFactoid clearUnknownFields:](*(void *)(v568 + 232));
      uint64_t v123 = *(void *)(v568 + 656);
      if (v123)
      {
        id v124 = *(void **)(v123 + 8);
        *(void *)(v123 + 8) = 0;
      }
      [*(id *)(v568 + 112) clearUnknownFields:1];
      -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(v568 + 128));
      -[GEOPDTransitInfoSnippet clearUnknownFields:](*(void *)(v568 + 672));
      uint64_t v125 = *(void *)(v568 + 224);
      if (v125)
      {
        id v126 = *(void **)(v125 + 8);
        *(void *)(v125 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v127 = *(id *)(v125 + 16);
        uint64_t v128 = [v127 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v128)
        {
          uint64_t v129 = v128;
          uint64_t v130 = *(void *)v617;
          do
          {
            for (uint64_t i7 = 0; i7 != v129; ++i7)
            {
              if (*(void *)v617 != v130) {
                objc_enumerationMutation(v127);
              }
              uint64_t v132 = *(void *)(*((void *)&v616 + 1) + 8 * i7);
              if (v132)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v132 + 68) |= 1u;
                *(unsigned char *)(v132 + 68) |= 0x20u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v132 + 64));
                v133 = *(void **)(v132 + 16);
                *(void *)(v132 + 16) = 0;

                -[GEOPDExternalActionDetail readAll:](v132, 0);
              }
            }
            uint64_t v129 = [v127 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v129);
        }
      }
      uint64_t v134 = *(void *)(v568 + 528);
      if (v134)
      {
        os_unfair_lock_lock_with_options();
        *(_WORD *)(v134 + 96) |= 2u;
        *(_WORD *)(v134 + 96) |= 0x200u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v134 + 88));
        v135 = *(void **)(v134 + 16);
        *(void *)(v134 + 16) = 0;

        -[GEOPDResultSnippet readAll:](v134, 0);
        -[GEOPDRating clearUnknownFields:](*(void *)(v134 + 72));
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v136 = *(id *)(v134 + 40);
        uint64_t v137 = [v136 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v137)
        {
          uint64_t v138 = v137;
          uint64_t v139 = *(void *)v613;
          do
          {
            for (uint64_t i8 = 0; i8 != v138; ++i8)
            {
              if (*(void *)v613 != v139) {
                objc_enumerationMutation(v136);
              }
              -[GEOPDChildPlace clearUnknownFields:](*(void *)(*((void *)&v612 + 1) + 8 * i8));
            }
            uint64_t v138 = [v136 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v138);
        }

        uint64_t v141 = *(void *)(v134 + 64);
        if (v141)
        {
          id v142 = *(void **)(v141 + 8);
          *(void *)(v141 + 8) = 0;
        }
        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id objb = *(id *)(v134 + 32);
        uint64_t v143 = [objb countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v143)
        {
          uint64_t v144 = v143;
          uint64_t v145 = *(void *)v609;
          do
          {
            for (uint64_t i9 = 0; i9 != v144; ++i9)
            {
              if (*(void *)v609 != v145) {
                objc_enumerationMutation(objb);
              }
              uint64_t v147 = *(void *)(*((void *)&v608 + 1) + 8 * i9);
              if (v147)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v147 + 56) |= 2u;
                *(unsigned char *)(v147 + 56) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v147 + 48));
                id v148 = *(void **)(v147 + 16);
                *(void *)(v147 + 16) = 0;

                -[GEOPDChildItem readAll:](v147, 0);
                -[GEOPDChildPlace clearUnknownFields:](*(void *)(v147 + 32));
                uint64_t v149 = *(void *)(v147 + 24);
                if (v149)
                {
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v149 + 80) |= 2u;
                  *(unsigned char *)(v149 + 80) |= 0x80u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v149 + 72));
                  id v150 = *(void **)(v149 + 16);
                  *(void *)(v149 + 16) = 0;

                  -[GEOPDChildAction readAll:](v149, 0);
                  uint64_t v151 = *(void *)(v149 + 24);
                  if (v151)
                  {
                    id v152 = *(void **)(v151 + 8);
                    *(void *)(v151 + 8) = 0;
                  }
                  uint64_t v153 = *(void *)(v149 + 40);
                  if (v153)
                  {
                    id v154 = *(void **)(v153 + 8);
                    *(void *)(v153 + 8) = 0;
                  }
                  uint64_t v155 = *(void *)(v149 + 56);
                  if (v155)
                  {
                    id v156 = *(void **)(v155 + 8);
                    *(void *)(v155 + 8) = 0;

                    -[GEOPDRelatedSearchSuggestion clearUnknownFields:](*(void *)(v155 + 16), 1);
                  }
                  uint64_t v157 = *(void *)(v149 + 48);
                  if (v157)
                  {
                    id v158 = *(void **)(v157 + 8);
                    *(void *)(v157 + 8) = 0;

                    -[GEOPDGuidesLocationEntry clearUnknownFields:](*(void *)(v157 + 16), 1);
                  }
                  uint64_t v159 = *(void *)(v149 + 32);
                  if (v159)
                  {
                    id v160 = *(void **)(v159 + 8);
                    *(void *)(v159 + 8) = 0;
                  }
                }
              }
            }
            uint64_t v144 = [objb countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v144);
        }
      }
      uint64_t v161 = *(void *)(v568 + 40);
      if (v161)
      {
        id v162 = *(void **)(v161 + 8);
        *(void *)(v161 + 8) = 0;
      }
      uint64_t v163 = *(void *)(v568 + 552);
      if (v163)
      {
        id v164 = *(void **)(v163 + 8);
        *(void *)(v163 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v165 = *(id *)(v163 + 16);
        uint64_t v166 = [v165 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v166)
        {
          uint64_t v167 = v166;
          uint64_t v168 = *(void *)v617;
          do
          {
            for (uint64_t i10 = 0; i10 != v167; ++i10)
            {
              if (*(void *)v617 != v168) {
                objc_enumerationMutation(v165);
              }
              uint64_t v170 = *(void *)(*((void *)&v616 + 1) + 8 * i10);
              if (v170)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v170 + 52) |= 1u;
                *(unsigned char *)(v170 + 52) |= 8u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v170 + 48));
                v171 = *(void **)(v170 + 16);
                *(void *)(v170 + 16) = 0;

                -[GEOPDSimpleRestaurantMenuTextGroup readAll:](v170, 0);
              }
            }
            uint64_t v167 = [v165 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v167);
        }
      }
      uint64_t v172 = *(void *)(v568 + 520);
      if (v172)
      {
        v173 = *(void **)(v172 + 8);
        *(void *)(v172 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v174 = *(id *)(v172 + 16);
        uint64_t v175 = [v174 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v175)
        {
          uint64_t v176 = v175;
          uint64_t v177 = *(void *)v617;
          do
          {
            for (uint64_t i11 = 0; i11 != v176; ++i11)
            {
              if (*(void *)v617 != v177) {
                objc_enumerationMutation(v174);
              }
              uint64_t v179 = *(void *)(*((void *)&v616 + 1) + 8 * i11);
              if (v179)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v179 + 76) |= 1u;
                *(unsigned char *)(v179 + 76) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v179 + 72));
                id v180 = *(void **)(v179 + 16);
                *(void *)(v179 + 16) = 0;

                -[GEOPDVendorIDLink readAll:](v179, 0);
              }
            }
            uint64_t v176 = [v174 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v176);
        }
      }
      uint64_t v181 = *(void *)(v568 + 560);
      if (v181)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v181 + 76) |= 1u;
        *(unsigned char *)(v181 + 76) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v181 + 72));
        id v182 = *(void **)(v181 + 16);
        *(void *)(v181 + 16) = 0;

        -[GEOPDSpatialLookupResult readAll:](v181, 0);
        [*(id *)(v181 + 56) clearUnknownFields:1];
        -[GEOPDBounds clearUnknownFields:](*(void *)(v181 + 48));
      }
      uint64_t v183 = *(void *)(v568 + 624);
      if (v183)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v183 + 68) |= 2u;
        *(unsigned char *)(v183 + 68) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v183 + 64));
        id v184 = *(void **)(v183 + 16);
        *(void *)(v183 + 16) = 0;

        -[GEOPDTip readAll:](v183, 0);
        uint64_t v185 = *(void *)(v183 + 48);
        if (v185)
        {
          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v185 + 52) |= 1u;
          *(unsigned char *)(v185 + 52) |= 8u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v185 + 48));
          id v186 = *(void **)(v185 + 16);
          *(void *)(v185 + 16) = 0;

          -[GEOPDTipUser readAll:](v185, 0);
          -[GEOPDPhoto clearUnknownFields:](*(void *)(v185 + 24));
        }
      }
      uint64_t v187 = *(void *)(v568 + 424);
      if (v187)
      {
        id v188 = *(void **)(v187 + 8);
        *(void *)(v187 + 8) = 0;
      }
      uint64_t v189 = *(void *)(v568 + 80);
      if (v189)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v189 + 52) |= 1u;
        *(unsigned char *)(v189 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v189 + 48));
        id v190 = *(void **)(v189 + 16);
        *(void *)(v189 + 16) = 0;

        -[GEOPDAssociatedApp readAll:](v189, 0);
      }
      uint64_t v191 = *(void *)(v568 + 344);
      if (v191)
      {
        os_unfair_lock_lock_with_options();
        *(_WORD *)(v191 + 92) |= 4u;
        *(_WORD *)(v191 + 92) |= 0x200u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v191 + 80));
        id v192 = *(void **)(v191 + 16);
        *(void *)(v191 + 16) = 0;

        -[GEOPDMessageLink readAll:](v191, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v193 = *(id *)(v191 + 24);
        uint64_t v194 = [v193 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v194)
        {
          uint64_t v195 = v194;
          uint64_t v196 = *(void *)v617;
          do
          {
            for (uint64_t i12 = 0; i12 != v195; ++i12)
            {
              if (*(void *)v617 != v196) {
                objc_enumerationMutation(v193);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i12) clearUnknownFields:1];
            }
            uint64_t v195 = [v193 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v195);
        }

        uint64_t v198 = *(void *)(v191 + 64);
        if (v198)
        {
          v199 = *(void **)(v198 + 8);
          *(void *)(v198 + 8) = 0;
        }
      }
      uint64_t v200 = *(void *)(v568 + 472);
      if (v200)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v200 + 52) |= 1u;
        *(unsigned char *)(v200 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v200 + 48));
        v201 = *(void **)(v200 + 16);
        *(void *)(v200 + 16) = 0;

        -[GEOPDQuickLink readAll:](v200, 0);
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v202 = *(id *)(v200 + 24);
        uint64_t v203 = [v202 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v203)
        {
          uint64_t v204 = v203;
          uint64_t v205 = *(void *)v613;
          do
          {
            for (uint64_t i13 = 0; i13 != v204; ++i13)
            {
              if (*(void *)v613 != v205) {
                objc_enumerationMutation(v202);
              }
              -[GEOPDQuickLinkItem clearUnknownFields:](*(void *)(*((void *)&v612 + 1) + 8 * i13));
            }
            uint64_t v204 = [v202 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v204);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v207 = *(id *)(v200 + 32);
        uint64_t v208 = [v207 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v208)
        {
          uint64_t v209 = v208;
          uint64_t v210 = *(void *)v609;
          do
          {
            for (uint64_t i14 = 0; i14 != v209; ++i14)
            {
              if (*(void *)v609 != v210) {
                objc_enumerationMutation(v207);
              }
              -[GEOPDQuickLinkItem clearUnknownFields:](*(void *)(*((void *)&v608 + 1) + 8 * i14));
            }
            uint64_t v209 = [v207 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v209);
        }
      }
      uint64_t v212 = *(void *)(v568 + 480);
      if (v212)
      {
        v213 = *(void **)(v212 + 8);
        *(void *)(v212 + 8) = 0;
      }
      uint64_t v214 = *(void *)(v568 + 360);
      if (v214)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v214 + 60) |= 1u;
        *(unsigned char *)(v214 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v214 + 56));
        v215 = *(void **)(v214 + 16);
        *(void *)(v214 + 16) = 0;

        -[GEOPDOfflineArea readAll:](v214, 0);
        [*(id *)(v214 + 32) clearUnknownFields:1];
        [*(id *)(v214 + 40) clearUnknownFields:1];
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v216 = *(id *)(v214 + 24);
        uint64_t v217 = [v216 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v217)
        {
          uint64_t v218 = v217;
          uint64_t v219 = *(void *)v617;
          do
          {
            for (uint64_t i15 = 0; i15 != v218; ++i15)
            {
              if (*(void *)v617 != v219) {
                objc_enumerationMutation(v216);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i15) clearUnknownFields:1];
            }
            uint64_t v218 = [v216 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v218);
        }
      }
      uint64_t v221 = *(void *)(v568 + 336);
      if (v221)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v221 + 68) |= 4u;
        *(unsigned char *)(v221 + 68) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v221 + 64));
        v222 = *(void **)(v221 + 16);
        *(void *)(v221 + 16) = 0;

        -[GEOPDLocationEvent readAll:](v221, 0);
      }
      uint64_t v223 = *(void *)(v568 + 600);
      if (v223)
      {
        v224 = *(void **)(v223 + 8);
        *(void *)(v223 + 8) = 0;
      }
      -[GEOPDVenueInfo clearUnknownFields:](*(void *)(v568 + 752), 1);
      uint64_t v225 = *(void *)(v568 + 152);
      if (v225)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v225 + 68) |= 2u;
        *(unsigned char *)(v225 + 68) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v225 + 64));
        v226 = *(void **)(v225 + 16);
        *(void *)(v225 + 16) = 0;

        -[GEOPDContainedPlace readAll:](v225, 0);
        -[GEOPDLinkedPlace clearUnknownFields:](*(void *)(v225 + 40));
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v227 = *(id *)(v225 + 24);
        uint64_t v228 = [v227 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v228)
        {
          uint64_t v229 = v228;
          uint64_t v230 = *(void *)v613;
          do
          {
            for (uint64_t i16 = 0; i16 != v229; ++i16)
            {
              if (*(void *)v613 != v230) {
                objc_enumerationMutation(v227);
              }
              -[GEOPDLinkedPlace clearUnknownFields:](*(void *)(*((void *)&v612 + 1) + 8 * i16));
            }
            uint64_t v229 = [v227 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v229);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v232 = *(id *)(v225 + 48);
        uint64_t v233 = [v232 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v233)
        {
          uint64_t v234 = v233;
          uint64_t v235 = *(void *)v609;
          do
          {
            for (uint64_t i17 = 0; i17 != v234; ++i17)
            {
              if (*(void *)v609 != v235) {
                objc_enumerationMutation(v232);
              }
              -[GEOPDLinkedPlace clearUnknownFields:](*(void *)(*((void *)&v608 + 1) + 8 * i17));
            }
            uint64_t v234 = [v232 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v234);
        }
      }
      uint64_t v237 = *(void *)(v568 + 760);
      if (v237)
      {
        v238 = *(void **)(v237 + 8);
        *(void *)(v237 + 8) = 0;
      }
      -[GEOPDIcon clearUnknownFields:](*(void *)(v568 + 304));
      uint64_t v239 = *(void *)(v568 + 448);
      if (v239)
      {
        v240 = *(void **)(v239 + 8);
        *(void *)(v239 + 8) = 0;
      }
      -[GEOPDBrowseCategories clearUnknownFields:](*(void *)(v568 + 96), 1);
      uint64_t v241 = *(void *)(v568 + 256);
      if (v241)
      {
        v242 = *(void **)(v241 + 8);
        *(void *)(v241 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v243 = *(id *)(v241 + 16);
        uint64_t v244 = [v243 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v244)
        {
          uint64_t v245 = v244;
          uint64_t v246 = *(void *)v617;
          do
          {
            for (uint64_t i18 = 0; i18 != v245; ++i18)
            {
              if (*(void *)v617 != v246) {
                objc_enumerationMutation(v243);
              }
              uint64_t v248 = *(void *)(*((void *)&v616 + 1) + 8 * i18);
              if (v248)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v248 + 76) |= 4u;
                *(unsigned char *)(v248 + 76) |= 0x40u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v248 + 72));
                v249 = *(void **)(v248 + 16);
                *(void *)(v248 + 16) = 0;

                -[GEOPDGroundViewLabelInfo readAll:](v248, 0);
              }
            }
            uint64_t v245 = [v243 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v245);
        }
      }
      uint64_t v250 = *(void *)(v568 + 72);
      if (v250)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v250 + 64) |= 2u;
        *(unsigned char *)(v250 + 64) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v250 + 56));
        v251 = *(void **)(v250 + 16);
        *(void *)(v250 + 16) = 0;

        -[GEOPDAnnotatedItemList readAll:](v250, 0);
        uint64_t v252 = *(void *)(v250 + 24);
        if (v252)
        {
          v253 = *(void **)(v252 + 8);
          *(void *)(v252 + 8) = 0;

          long long v618 = 0u;
          long long v619 = 0u;
          long long v616 = 0u;
          long long v617 = 0u;
          id v254 = *(id *)(v252 + 16);
          uint64_t v255 = [v254 countByEnumeratingWithState:&v616 objects:v620 count:16];
          if (v255)
          {
            uint64_t v256 = v255;
            uint64_t v257 = *(void *)v617;
            do
            {
              for (uint64_t i19 = 0; i19 != v256; ++i19)
              {
                if (*(void *)v617 != v257) {
                  objc_enumerationMutation(v254);
                }
                uint64_t v259 = *(void *)(*((void *)&v616 + 1) + 8 * i19);
                if (v259)
                {
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v259 + 64) |= 2u;
                  *(unsigned char *)(v259 + 64) |= 0x20u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v259 + 56));
                  v260 = *(void **)(v259 + 16);
                  *(void *)(v259 + 16) = 0;

                  -[GEOPDPictureItem readAll:](v259, 0);
                  -[GEOPDPhoto clearUnknownFields:](*(void *)(v259 + 24));
                }
              }
              uint64_t v256 = [v254 countByEnumeratingWithState:&v616 objects:v620 count:16];
            }
            while (v256);
          }
        }
        uint64_t v261 = *(void *)(v250 + 32);
        if (v261)
        {
          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v261 + 52) |= 1u;
          *(unsigned char *)(v261 + 52) |= 8u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v261 + 48));
          v262 = *(void **)(v261 + 16);
          *(void *)(v261 + 16) = 0;

          -[GEOPDTextItemContainer readAll:](v261, 0);
          long long v618 = 0u;
          long long v619 = 0u;
          long long v616 = 0u;
          long long v617 = 0u;
          id v263 = *(id *)(v261 + 32);
          uint64_t v264 = [v263 countByEnumeratingWithState:&v616 objects:v620 count:16];
          if (v264)
          {
            uint64_t v265 = v264;
            uint64_t v266 = *(void *)v617;
            do
            {
              for (uint64_t i20 = 0; i20 != v265; ++i20)
              {
                if (*(void *)v617 != v266) {
                  objc_enumerationMutation(v263);
                }
                uint64_t v268 = *(void *)(*((void *)&v616 + 1) + 8 * i20);
                if (v268)
                {
                  v269 = *(void **)(v268 + 8);
                  *(void *)(v268 + 8) = 0;
                }
              }
              uint64_t v265 = [v263 countByEnumeratingWithState:&v616 objects:v620 count:16];
            }
            while (v265);
          }

          uint64_t v270 = *(void *)(v261 + 24);
          if (v270)
          {
            v271 = *(void **)(v270 + 8);
            *(void *)(v270 + 8) = 0;
          }
        }
      }
      uint64_t v272 = *(void *)(v568 + 440);
      if (v272)
      {
        os_unfair_lock_lock_with_options();
        *(_WORD *)(v272 + 96) |= 2u;
        *(_WORD *)(v272 + 96) |= 0x200u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v272 + 88));
        v273 = *(void **)(v272 + 16);
        *(void *)(v272 + 16) = 0;

        -[GEOPDPoiEvent readAll:](v272, 0);
        [*(id *)(v272 + 40) clearUnknownFields:1];
        [*(id *)(v272 + 48) clearUnknownFields:1];
        long long v606 = 0u;
        long long v607 = 0u;
        long long v604 = 0u;
        long long v605 = 0u;
        objc = (id *)v272;
        id v274 = *(id *)(v272 + 24);
        uint64_t v275 = [v274 countByEnumeratingWithState:&v604 objects:&v616 count:16];
        if (v275)
        {
          uint64_t v276 = v275;
          uint64_t v277 = *(void *)v605;
          do
          {
            for (uint64_t i21 = 0; i21 != v276; ++i21)
            {
              if (*(void *)v605 != v277) {
                objc_enumerationMutation(v274);
              }
              uint64_t v279 = *(void *)(*((void *)&v604 + 1) + 8 * i21);
              if (v279)
              {
                v280 = *(void **)(v279 + 8);
                *(void *)(v279 + 8) = 0;

                long long v614 = 0u;
                long long v615 = 0u;
                long long v612 = 0u;
                long long v613 = 0u;
                id v281 = *(id *)(v279 + 16);
                uint64_t v282 = [v281 countByEnumeratingWithState:&v612 objects:v620 count:16];
                if (v282)
                {
                  uint64_t v283 = v282;
                  uint64_t v284 = *(void *)v613;
                  do
                  {
                    for (uint64_t i22 = 0; i22 != v283; ++i22)
                    {
                      if (*(void *)v613 != v284) {
                        objc_enumerationMutation(v281);
                      }
                      [*(id *)(*((void *)&v612 + 1) + 8 * i22) clearUnknownFields:1];
                    }
                    uint64_t v283 = [v281 countByEnumeratingWithState:&v612 objects:v620 count:16];
                  }
                  while (v283);
                }
              }
            }
            uint64_t v276 = [v274 countByEnumeratingWithState:&v604 objects:&v616 count:16];
          }
          while (v276);
        }

        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        id v286 = objc[8];
        uint64_t v287 = [v286 countByEnumeratingWithState:&v600 objects:v620 count:16];
        if (v287)
        {
          uint64_t v288 = v287;
          uint64_t v289 = *(void *)v601;
          do
          {
            for (uint64_t i23 = 0; i23 != v288; ++i23)
            {
              if (*(void *)v601 != v289) {
                objc_enumerationMutation(v286);
              }
              [*(id *)(*((void *)&v600 + 1) + 8 * i23) clearUnknownFields:1];
            }
            uint64_t v288 = [v286 countByEnumeratingWithState:&v600 objects:v620 count:16];
          }
          while (v288);
        }

        long long v598 = 0u;
        long long v599 = 0u;
        long long v596 = 0u;
        long long v597 = 0u;
        id v291 = objc[4];
        uint64_t v292 = [v291 countByEnumeratingWithState:&v596 objects:&v612 count:16];
        if (v292)
        {
          uint64_t v293 = v292;
          uint64_t v294 = *(void *)v597;
          do
          {
            for (uint64_t i24 = 0; i24 != v293; ++i24)
            {
              if (*(void *)v597 != v294) {
                objc_enumerationMutation(v291);
              }
              uint64_t v296 = *(void *)(*((void *)&v596 + 1) + 8 * i24);
              if (v296)
              {
                v297 = *(void **)(v296 + 8);
                *(void *)(v296 + 8) = 0;
              }
            }
            uint64_t v293 = [v291 countByEnumeratingWithState:&v596 objects:&v612 count:16];
          }
          while (v293);
        }

        v298 = objc[9];
        if (v298)
        {
          v299 = (void *)v298[1];
          v298[1] = 0;
        }
        long long v594 = 0u;
        long long v595 = 0u;
        long long v592 = 0u;
        long long v593 = 0u;
        id v300 = objc[7];
        uint64_t v301 = [v300 countByEnumeratingWithState:&v592 objects:&v608 count:16];
        if (v301)
        {
          uint64_t v302 = v301;
          uint64_t v303 = *(void *)v593;
          do
          {
            for (uint64_t i25 = 0; i25 != v302; ++i25)
            {
              if (*(void *)v593 != v303) {
                objc_enumerationMutation(v300);
              }
              uint64_t v305 = *(void *)(*((void *)&v592 + 1) + 8 * i25);
              if (v305)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v305 + 68) |= 1u;
                *(unsigned char *)(v305 + 68) |= 0x20u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v305 + 64));
                v306 = *(void **)(v305 + 16);
                *(void *)(v305 + 16) = 0;

                -[GEOPDPerformer readAll:](v305, 0);
                [*(id *)(v305 + 40) clearUnknownFields:1];
              }
            }
            uint64_t v302 = [v300 countByEnumeratingWithState:&v592 objects:&v608 count:16];
          }
          while (v302);
        }
      }
      [*(id *)(v568 + 416) clearUnknownFields:1];
      uint64_t v307 = *(void *)(v568 + 456);
      if (v307)
      {
        v308 = *(void **)(v307 + 8);
        *(void *)(v307 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v309 = *(id *)(v307 + 16);
        uint64_t v310 = [v309 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v310)
        {
          uint64_t v311 = v310;
          uint64_t v312 = *(void *)v617;
          do
          {
            for (uint64_t i26 = 0; i26 != v311; ++i26)
            {
              if (*(void *)v617 != v312) {
                objc_enumerationMutation(v309);
              }
              uint64_t v314 = *(void *)(*((void *)&v616 + 1) + 8 * i26);
              if (v314)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v314 + 60) |= 1u;
                *(unsigned char *)(v314 + 60) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v314 + 56));
                v315 = *(void **)(v314 + 16);
                *(void *)(v314 + 16) = 0;

                -[GEOPDPrototype readAll:](v314, 0);
              }
            }
            uint64_t v311 = [v309 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v311);
        }
      }
      [*(id *)(v568 + 736) clearUnknownFields:1];
      uint64_t v316 = *(void *)(v568 + 328);
      if (v316)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v316 + 60) |= 1u;
        *(unsigned char *)(v316 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v316 + 56));
        v317 = *(void **)(v316 + 16);
        *(void *)(v316 + 16) = 0;

        -[GEOPDLinkedService readAll:](v316, 0);
        [*(id *)(v316 + 24) clearUnknownFields:1];
        -[GEOPDPlaceInfo clearUnknownFields:](*(void *)(v316 + 40));
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v318 = *(id *)(v316 + 32);
        uint64_t v319 = [v318 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v319)
        {
          uint64_t v320 = v319;
          uint64_t v321 = *(void *)v617;
          do
          {
            for (uint64_t i27 = 0; i27 != v320; ++i27)
            {
              if (*(void *)v617 != v321) {
                objc_enumerationMutation(v318);
              }
              -[GEOPDBusinessHours clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i27));
            }
            uint64_t v320 = [v318 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v320);
        }
      }
      -[GEOPDBusinessHours clearUnknownFields:](*(void *)(v568 + 120));
      -[GEOPDPlaceCollection clearUnknownFields:](*(void *)(v568 + 392), 1);
      uint64_t v323 = *(void *)(v568 + 512);
      if (v323)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v323 + 72) |= 2u;
        *(unsigned char *)(v323 + 72) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v323 + 64));
        v324 = *(void **)(v323 + 16);
        *(void *)(v323 + 16) = 0;

        -[GEOPDRelatedPlace readAll:](v323, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v325 = *(id *)(v323 + 48);
        uint64_t v326 = [v325 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v326)
        {
          uint64_t v327 = v326;
          uint64_t v328 = *(void *)v617;
          do
          {
            for (uint64_t i28 = 0; i28 != v327; ++i28)
            {
              if (*(void *)v617 != v328) {
                objc_enumerationMutation(v325);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i28) clearUnknownFields:1];
            }
            uint64_t v327 = [v325 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v327);
        }
      }
      uint64_t v330 = *(void *)(v568 + 728);
      if (v330)
      {
        v331 = *(void **)(v330 + 8);
        *(void *)(v330 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v332 = *(id *)(v330 + 16);
        uint64_t v333 = [v332 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v333)
        {
          uint64_t v334 = v333;
          uint64_t v335 = *(void *)v617;
          do
          {
            for (uint64_t i29 = 0; i29 != v334; ++i29)
            {
              if (*(void *)v617 != v335) {
                objc_enumerationMutation(v332);
              }
              -[GEOPDTransitInfoSnippet clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i29));
            }
            uint64_t v334 = [v332 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v334);
        }
      }
      uint64_t v337 = *(void *)(v568 + 720);
      if (v337)
      {
        v338 = *(void **)(v337 + 8);
        *(void *)(v337 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v339 = *(id *)(v337 + 16);
        uint64_t v340 = [v339 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v340)
        {
          uint64_t v341 = v340;
          uint64_t v342 = *(void *)v617;
          do
          {
            for (uint64_t i30 = 0; i30 != v341; ++i30)
            {
              if (*(void *)v617 != v342) {
                objc_enumerationMutation(v339);
              }
              -[GEOPDDepartureSequence clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i30));
            }
            uint64_t v341 = [v339 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v341);
        }
      }
      uint64_t v344 = *(void *)(v568 + 712);
      if (v344)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v344 + 68) |= 1u;
        *(unsigned char *)(v344 + 68) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v344 + 64));
        v345 = *(void **)(v344 + 16);
        *(void *)(v344 + 16) = 0;

        -[GEOPDTransitTripGeometry readAll:](v344, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v346 = *(id *)(v344 + 48);
        uint64_t v347 = [v346 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v347)
        {
          uint64_t v348 = v347;
          uint64_t v349 = *(void *)v617;
          do
          {
            for (uint64_t i31 = 0; i31 != v348; ++i31)
            {
              if (*(void *)v617 != v349) {
                objc_enumerationMutation(v346);
              }
              uint64_t v351 = *(void *)(*((void *)&v616 + 1) + 8 * i31);
              if (v351)
              {
                v352 = *(void **)(v351 + 8);
                *(void *)(v351 + 8) = 0;
              }
            }
            uint64_t v348 = [v346 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v348);
        }
      }
      -[GEOPDBrowseCategories clearUnknownFields:](*(void *)(v568 + 376), 1);
      -[GEOPDPublisher clearUnknownFields:](*(void *)(v568 + 464));
      uint64_t v353 = *(void *)(v568 + 352);
      if (v353)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v353 + 52) |= 1u;
        *(unsigned char *)(v353 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v353 + 48));
        v354 = *(void **)(v353 + 16);
        *(void *)(v353 + 16) = 0;

        -[GEOPDMiniBrowseCategories readAll:](v353, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v355 = *(id *)(v353 + 24);
        uint64_t v356 = [v355 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v356)
        {
          uint64_t v357 = v356;
          uint64_t v358 = *(void *)v617;
          do
          {
            for (uint64_t i32 = 0; i32 != v357; ++i32)
            {
              if (*(void *)v617 != v358) {
                objc_enumerationMutation(v355);
              }
              uint64_t v360 = *(void *)(*((void *)&v616 + 1) + 8 * i32);
              if (v360)
              {
                v361 = *(void **)(v360 + 8);
                *(void *)(v360 + 8) = 0;

                [*(id *)(v360 + 16) clearUnknownFields:1];
              }
            }
            uint64_t v357 = [v355 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v357);
        }
      }
      -[GEOPDPlaceCollectionItem clearUnknownFields:](*(void *)(v568 + 384));
      uint64_t v362 = *(void *)(v568 + 144);
      if (v362)
      {
        v363 = *(void **)(v362 + 8);
        *(void *)(v362 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v364 = *(id *)(v362 + 16);
        uint64_t v365 = [v364 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v365)
        {
          uint64_t v366 = v365;
          uint64_t v367 = *(void *)v617;
          do
          {
            for (uint64_t i33 = 0; i33 != v366; ++i33)
            {
              if (*(void *)v617 != v367) {
                objc_enumerationMutation(v364);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i33) clearUnknownFields:1];
            }
            uint64_t v366 = [v364 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v366);
        }
      }
      uint64_t v369 = *(void *)(v568 + 312);
      if (v369)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v369 + 64) |= 2u;
        *(unsigned char *)(v369 + 64) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v369 + 56));
        v370 = *(void **)(v369 + 16);
        *(void *)(v369 + 16) = 0;

        -[GEOPDISO3166Code readAll:](v369, 0);
        [*(id *)(v369 + 32) clearUnknownFields:1];
      }
      [*(id *)(v568 + 744) clearUnknownFields:1];
      uint64_t v371 = *(void *)(v568 + 688);
      if (v371)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v371 + 52) |= 1u;
        *(unsigned char *)(v371 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v371 + 48));
        v372 = *(void **)(v371 + 16);
        *(void *)(v371 + 16) = 0;

        -[GEOPDTransitNearbySchedule readAll:](v371, 0);
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v373 = *(id *)(v371 + 24);
        uint64_t v374 = [v373 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v374)
        {
          uint64_t v375 = v374;
          uint64_t v376 = *(void *)v613;
          do
          {
            for (uint64_t i34 = 0; i34 != v375; ++i34)
            {
              if (*(void *)v613 != v376) {
                objc_enumerationMutation(v373);
              }
              uint64_t v378 = *(void *)(*((void *)&v612 + 1) + 8 * i34);
              if (v378)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v378 + 76) |= 1u;
                *(unsigned char *)(v378 + 76) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v378 + 72));
                v379 = *(void **)(v378 + 16);
                *(void *)(v378 + 16) = 0;

                -[GEOPDTransitScheduleCategory readAll:](v378, 0);
                [*(id *)(v378 + 48) clearUnknownFields:1];
              }
            }
            uint64_t v375 = [v373 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v375);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v380 = *(id *)(v371 + 32);
        uint64_t v381 = [v380 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v381)
        {
          uint64_t v382 = v381;
          uint64_t v383 = *(void *)v609;
          do
          {
            for (uint64_t i35 = 0; i35 != v382; ++i35)
            {
              if (*(void *)v609 != v383) {
                objc_enumerationMutation(v380);
              }
              uint64_t v385 = *(void *)(*((void *)&v608 + 1) + 8 * i35);
              if (v385)
              {
                os_unfair_lock_lock_with_options();
                *(_WORD *)(v385 + 144) |= 0x20u;
                *(_WORD *)(v385 + 144) |= 0x800u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v385 + 120));
                v386 = *(void **)(v385 + 16);
                *(void *)(v385 + 16) = 0;

                -[GEOPDTransitScheduleGroup readAll:](v385, 0);
              }
            }
            uint64_t v382 = [v380 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v382);
        }
      }
      uint64_t v387 = *(void *)(v568 + 568);
      if (v387)
      {
        v388 = *(void **)(v387 + 8);
        *(void *)(v387 + 8) = 0;
      }
      uint64_t v389 = *(void *)(v568 + 264);
      if (v389)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v389 + 56) |= 2u;
        *(unsigned char *)(v389 + 56) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v389 + 48));
        v390 = *(void **)(v389 + 16);
        *(void *)(v389 + 16) = 0;

        -[GEOPDGuideGroup readAll:](v389, 0);
        -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(v389 + 32));
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v391 = *(id *)(v389 + 24);
        uint64_t v392 = [v391 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v392)
        {
          uint64_t v393 = v392;
          uint64_t v394 = *(void *)v617;
          do
          {
            for (uint64_t i36 = 0; i36 != v393; ++i36)
            {
              if (*(void *)v617 != v394) {
                objc_enumerationMutation(v391);
              }
              -[GEOPDGuideLocationImage clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i36));
            }
            uint64_t v393 = [v391 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v393);
        }
      }
      uint64_t v396 = *(void *)(v568 + 160);
      if (v396)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v396 + 52) |= 1u;
        *(unsigned char *)(v396 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v396 + 48));
        v397 = *(void **)(v396 + 16);
        *(void *)(v396 + 16) = 0;

        -[GEOPDContainmentPlace readAll:](v396, 0);
        [*(id *)(v396 + 24) clearUnknownFields:1];
        [*(id *)(v396 + 32) clearUnknownFields:1];
      }
      uint64_t v398 = *(void *)(v568 + 136);
      if (v398)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v398 + 64) |= 2u;
        *(unsigned char *)(v398 + 64) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v398 + 56));
        v399 = *(void **)(v398 + 16);
        *(void *)(v398 + 16) = 0;

        -[GEOPDCategorizedPhotos readAll:](v398, 0);
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v400 = *(id *)(v398 + 32);
        uint64_t v401 = [v400 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v401)
        {
          uint64_t v402 = v401;
          uint64_t v403 = *(void *)v613;
          do
          {
            for (uint64_t i37 = 0; i37 != v402; ++i37)
            {
              if (*(void *)v613 != v403) {
                objc_enumerationMutation(v400);
              }
              [*(id *)(*((void *)&v612 + 1) + 8 * i37) clearUnknownFields:1];
            }
            uint64_t v402 = [v400 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v402);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v405 = *(id *)(v398 + 40);
        uint64_t v406 = [v405 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v406)
        {
          uint64_t v407 = v406;
          uint64_t v408 = *(void *)v609;
          do
          {
            for (uint64_t i38 = 0; i38 != v407; ++i38)
            {
              if (*(void *)v609 != v408) {
                objc_enumerationMutation(v405);
              }
              -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v608 + 1) + 8 * i38));
            }
            uint64_t v407 = [v405 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v407);
        }
      }
      -[GEOPDExploreGuides clearUnknownFields:](*(void *)(v568 + 216), 1);
      uint64_t v410 = *(void *)(v568 + 16);
      if (v410)
      {
        v411 = *(void **)(v410 + 8);
        *(void *)(v410 + 8) = 0;

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v412 = *(id *)(v410 + 16);
        uint64_t v413 = [v412 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v413)
        {
          uint64_t v414 = v413;
          uint64_t v415 = *(void *)v617;
          do
          {
            for (uint64_t i39 = 0; i39 != v414; ++i39)
            {
              if (*(void *)v617 != v415) {
                objc_enumerationMutation(v412);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i39) clearUnknownFields:1];
            }
            uint64_t v414 = [v412 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v414);
        }
      }
      uint64_t v417 = *(void *)(v568 + 320);
      if (v417)
      {
        v418 = *(void **)(v417 + 8);
        *(void *)(v417 + 8) = 0;

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v419 = *(id *)(v417 + 16);
        uint64_t v420 = [v419 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v420)
        {
          uint64_t v421 = v420;
          uint64_t v422 = *(void *)v609;
          do
          {
            for (uint64_t i40 = 0; i40 != v421; ++i40)
            {
              if (*(void *)v609 != v422) {
                objc_enumerationMutation(v419);
              }
              uint64_t v424 = *(void *)(*((void *)&v608 + 1) + 8 * i40);
              if (v424)
              {
                v425 = *(void **)(v424 + 8);
                *(void *)(v424 + 8) = 0;

                long long v614 = 0u;
                long long v615 = 0u;
                long long v612 = 0u;
                long long v613 = 0u;
                id v426 = *(id *)(v424 + 16);
                uint64_t v427 = [v426 countByEnumeratingWithState:&v612 objects:v620 count:16];
                if (v427)
                {
                  uint64_t v428 = v427;
                  uint64_t v429 = *(void *)v613;
                  do
                  {
                    for (uint64_t i41 = 0; i41 != v428; ++i41)
                    {
                      if (*(void *)v613 != v429) {
                        objc_enumerationMutation(v426);
                      }
                      [*(id *)(*((void *)&v612 + 1) + 8 * i41) clearUnknownFields:1];
                    }
                    uint64_t v428 = [v426 countByEnumeratingWithState:&v612 objects:v620 count:16];
                  }
                  while (v428);
                }
              }
            }
            uint64_t v421 = [v419 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v421);
        }
      }
      uint64_t v431 = *(void *)(v568 + 168);
      if (v431)
      {
        v432 = *(void **)(v431 + 8);
        *(void *)(v431 + 8) = 0;
      }
      uint64_t v433 = *(void *)(v568 + 608);
      if (v433)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v433 + 56) |= 2u;
        *(unsigned char *)(v433 + 56) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v433 + 48));
        v434 = *(void **)(v433 + 16);
        *(void *)(v433 + 16) = 0;

        -[GEOPDTemplatePlace readAll:](v433, 0);
        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        uint64_t v573 = v433;
        id objd = *(id *)(v433 + 32);
        uint64_t v435 = [objd countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v435)
        {
          uint64_t v436 = v435;
          uint64_t v437 = *(void *)v609;
          do
          {
            for (uint64_t i42 = 0; i42 != v436; ++i42)
            {
              if (*(void *)v609 != v437) {
                objc_enumerationMutation(objd);
              }
              uint64_t v439 = *(void *)(*((void *)&v608 + 1) + 8 * i42);
              if (v439)
              {
                os_unfair_lock_lock_with_options();
                *(_WORD *)(v439 + 96) |= 2u;
                *(_WORD *)(v439 + 96) |= 0x200u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v439 + 88));
                v440 = *(void **)(v439 + 16);
                *(void *)(v439 + 16) = 0;

                -[GEOPDTemplateData readAll:](v439, 0);
                [*(id *)(v439 + 32) clearUnknownFields:1];
                long long v614 = 0u;
                long long v615 = 0u;
                long long v612 = 0u;
                long long v613 = 0u;
                id v441 = *(id *)(v439 + 72);
                uint64_t v442 = [v441 countByEnumeratingWithState:&v612 objects:v620 count:16];
                if (v442)
                {
                  uint64_t v443 = v442;
                  uint64_t v444 = *(void *)v613;
                  do
                  {
                    for (uint64_t i43 = 0; i43 != v443; ++i43)
                    {
                      if (*(void *)v613 != v444) {
                        objc_enumerationMutation(v441);
                      }
                      [*(id *)(*((void *)&v612 + 1) + 8 * i43) clearUnknownFields:1];
                    }
                    uint64_t v443 = [v441 countByEnumeratingWithState:&v612 objects:v620 count:16];
                  }
                  while (v443);
                }

                -[GEOPDDataItem clearUnknownFields:](*(void *)(v439 + 56));
                [*(id *)(v439 + 48) clearUnknownFields:1];
                -[GEOPDPhoto clearUnknownFields:](*(void *)(v439 + 40));
                -[GEOPDDataItem clearUnknownFields:](*(void *)(v439 + 24));
                uint64_t v446 = *(void *)(v439 + 64);
                if (v446)
                {
                  v447 = *(void **)(v446 + 8);
                  *(void *)(v446 + 8) = 0;
                }
              }
            }
            uint64_t v436 = [objd countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v436);
        }

        uint64_t v448 = *(void *)(v573 + 24);
        if (v448)
        {
          v449 = *(void **)(v448 + 8);
          *(void *)(v448 + 8) = 0;
        }
      }
      uint64_t v450 = *(void *)(v568 + 696);
      if (v450)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v450 + 60) |= 2u;
        *(unsigned char *)(v450 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v450 + 56));
        v451 = *(void **)(v450 + 16);
        *(void *)(v450 + 16) = 0;

        -[GEOPDTransitPaymentMethodInfo readAll:](v450, 0);
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v452 = *(id *)(v450 + 32);
        uint64_t v453 = [v452 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v453)
        {
          uint64_t v454 = v453;
          uint64_t v455 = *(void *)v613;
          do
          {
            for (uint64_t i44 = 0; i44 != v454; ++i44)
            {
              if (*(void *)v613 != v455) {
                objc_enumerationMutation(v452);
              }
              [*(id *)(*((void *)&v612 + 1) + 8 * i44) clearUnknownFields:1];
            }
            uint64_t v454 = [v452 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v454);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v457 = *(id *)(v450 + 40);
        uint64_t v458 = [v457 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v458)
        {
          uint64_t v459 = v458;
          uint64_t v460 = *(void *)v609;
          do
          {
            for (uint64_t i45 = 0; i45 != v459; ++i45)
            {
              if (*(void *)v609 != v460) {
                objc_enumerationMutation(v457);
              }
              [*(id *)(*((void *)&v608 + 1) + 8 * i45) clearUnknownFields:1];
            }
            uint64_t v459 = [v457 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v459);
        }
      }
      uint64_t v462 = *(void *)(v568 + 104);
      if (v462)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v462 + 52) |= 1u;
        *(unsigned char *)(v462 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v462 + 48));
        v463 = *(void **)(v462 + 16);
        *(void *)(v462 + 16) = 0;

        -[GEOPDBusinessAssets readAll:](v462, 0);
        long long v614 = 0u;
        long long v615 = 0u;
        long long v612 = 0u;
        long long v613 = 0u;
        id v464 = *(id *)(v462 + 24);
        uint64_t v465 = [v464 countByEnumeratingWithState:&v612 objects:v620 count:16];
        if (v465)
        {
          uint64_t v466 = v465;
          uint64_t v467 = *(void *)v613;
          do
          {
            for (uint64_t i46 = 0; i46 != v466; ++i46)
            {
              if (*(void *)v613 != v467) {
                objc_enumerationMutation(v464);
              }
              -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v612 + 1) + 8 * i46));
            }
            uint64_t v466 = [v464 countByEnumeratingWithState:&v612 objects:v620 count:16];
          }
          while (v466);
        }

        long long v610 = 0u;
        long long v611 = 0u;
        long long v608 = 0u;
        long long v609 = 0u;
        id v469 = *(id *)(v462 + 32);
        uint64_t v470 = [v469 countByEnumeratingWithState:&v608 objects:&v616 count:16];
        if (v470)
        {
          uint64_t v471 = v470;
          uint64_t v472 = *(void *)v609;
          do
          {
            for (uint64_t i47 = 0; i47 != v471; ++i47)
            {
              if (*(void *)v609 != v472) {
                objc_enumerationMutation(v469);
              }
              -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(*((void *)&v608 + 1) + 8 * i47));
            }
            uint64_t v471 = [v469 countByEnumeratingWithState:&v608 objects:&v616 count:16];
          }
          while (v471);
        }
      }
      -[GEOPDEnrichmentInfo clearUnknownFields:](*(void *)(v568 + 184), 1);
      uint64_t v474 = *(void *)(v568 + 32);
      if (v474)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v474 + 84) |= 1u;
        *(unsigned char *)(v474 + 84) |= 0x80u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v474 + 80));
        v475 = *(void **)(v474 + 16);
        *(void *)(v474 + 16) = 0;

        -[GEOPDActionData readAll:](v474, 0);
        long long v606 = 0u;
        long long v607 = 0u;
        long long v604 = 0u;
        long long v605 = 0u;
        id v476 = *(id *)(v474 + 40);
        uint64_t v477 = [v476 countByEnumeratingWithState:&v604 objects:&v616 count:16];
        if (v477)
        {
          uint64_t v478 = v477;
          uint64_t v479 = *(void *)v605;
          do
          {
            for (uint64_t i48 = 0; i48 != v478; ++i48)
            {
              if (*(void *)v605 != v479) {
                objc_enumerationMutation(v476);
              }
              [*(id *)(*((void *)&v604 + 1) + 8 * i48) clearUnknownFields:1];
            }
            uint64_t v478 = [v476 countByEnumeratingWithState:&v604 objects:&v616 count:16];
          }
          while (v478);
        }

        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        id v569 = *(id *)(v474 + 24);
        uint64_t v571 = [v569 countByEnumeratingWithState:&v600 objects:&v612 count:16];
        if (v571)
        {
          uint64_t v570 = *(void *)v601;
          do
          {
            for (uint64_t i49 = 0; i49 != v571; ++i49)
            {
              if (*(void *)v601 != v570) {
                objc_enumerationMutation(v569);
              }
              uint64_t v482 = *(void *)(*((void *)&v600 + 1) + 8 * i49);
              if (v482)
              {
                uint64_t v574 = i49;
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v482 + 52) |= 1u;
                *(unsigned char *)(v482 + 52) |= 8u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v482 + 48));
                v483 = *(void **)(v482 + 16);
                *(void *)(v482 + 16) = 0;

                -[GEOPDActionLink readAll:](v482, 0);
                long long v610 = 0u;
                long long v611 = 0u;
                long long v608 = 0u;
                long long v609 = 0u;
                id obje = *(id *)(v482 + 32);
                uint64_t v484 = [obje countByEnumeratingWithState:&v608 objects:v620 count:16];
                if (v484)
                {
                  uint64_t v485 = v484;
                  uint64_t v486 = *(void *)v609;
                  do
                  {
                    for (uint64_t i50 = 0; i50 != v485; ++i50)
                    {
                      if (*(void *)v609 != v486) {
                        objc_enumerationMutation(obje);
                      }
                      uint64_t v488 = *(void *)(*((void *)&v608 + 1) + 8 * i50);
                      if (v488)
                      {
                        os_unfair_lock_lock_with_options();
                        *(unsigned char *)(v488 + 76) |= 4u;
                        *(unsigned char *)(v488 + 76) |= 0x80u;
                        os_unfair_lock_unlock((os_unfair_lock_t)(v488 + 64));
                        v489 = *(void **)(v488 + 16);
                        *(void *)(v488 + 16) = 0;

                        -[GEOPDLink readAll:](v488, 0);
                        uint64_t v490 = *(void *)(v488 + 40);
                        if (v490)
                        {
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v490 + 68) |= 1u;
                          *(unsigned char *)(v490 + 68) |= 0x20u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v490 + 64));
                          v491 = *(void **)(v490 + 16);
                          *(void *)(v490 + 16) = 0;

                          -[GEOPDQuickLinkActionDataParams readAll:](v490, 0);
                        }
                        uint64_t v492 = *(void *)(v488 + 24);
                        if (v492)
                        {
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v492 + 76) |= 1u;
                          *(unsigned char *)(v492 + 76) |= 0x40u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v492 + 72));
                          v493 = *(void **)(v492 + 16);
                          *(void *)(v492 + 16) = 0;

                          -[GEOPDAppClipParams readAll:](v492, 0);
                        }
                        uint64_t v494 = *(void *)(v488 + 32);
                        if (v494)
                        {
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v494 + 84) |= 1u;
                          *(unsigned char *)(v494 + 84) |= 0x20u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v494 + 80));
                          v495 = *(void **)(v494 + 16);
                          *(void *)(v494 + 16) = 0;

                          -[GEOPDExtensionParams readAll:](v494, 0);
                        }
                        uint64_t v496 = *(void *)(v488 + 48);
                        if (v496)
                        {
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v496 + 64) |= 2u;
                          *(unsigned char *)(v496 + 64) |= 0x20u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v496 + 56));
                          v497 = *(void **)(v496 + 16);
                          *(void *)(v496 + 16) = 0;

                          -[GEOPDWebLinkParams readAll:](v496, 0);
                          -[GEOPDIcon clearUnknownFields:](*(void *)(v496 + 24));
                        }
                      }
                    }
                    uint64_t v485 = [obje countByEnumeratingWithState:&v608 objects:v620 count:16];
                  }
                  while (v485);
                }

                uint64_t i49 = v574;
              }
            }
            uint64_t v571 = [v569 countByEnumeratingWithState:&v600 objects:&v612 count:16];
          }
          while (v571);
        }
      }
      uint64_t v498 = *(void *)(v568 + 176);
      if (v498)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v498 + 52) |= 1u;
        *(unsigned char *)(v498 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v498 + 48));
        v499 = *(void **)(v498 + 16);
        *(void *)(v498 + 16) = 0;

        -[GEOPDEnrichmentData readAll:](v498, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v500 = *(id *)(v498 + 24);
        uint64_t v501 = [v500 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v501)
        {
          uint64_t v502 = v501;
          uint64_t v503 = *(void *)v617;
          do
          {
            for (uint64_t i51 = 0; i51 != v502; ++i51)
            {
              if (*(void *)v617 != v503) {
                objc_enumerationMutation(v500);
              }
              uint64_t v505 = *(void *)(*((void *)&v616 + 1) + 8 * i51);
              if (v505)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v505 + 72) |= 2u;
                *(unsigned char *)(v505 + 72) |= 0x40u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v505 + 64));
                v506 = *(void **)(v505 + 16);
                *(void *)(v505 + 16) = 0;

                -[GEOPDEnrichmentDataEntity readAll:](v505, 0);
                -[GEOPDEnrichmentInfo clearUnknownFields:](*(void *)(v505 + 32), 1);
              }
            }
            uint64_t v502 = [v500 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v502);
        }
      }
      uint64_t v507 = *(void *)(v568 + 432);
      if (v507)
      {
        v508 = *(void **)(v507 + 8);
        *(void *)(v507 + 8) = 0;
      }
      uint64_t v509 = *(void *)(v568 + 208);
      if (v509)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v509 + 60) |= 2u;
        *(unsigned char *)(v509 + 60) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v509 + 56));
        v510 = *(void **)(v509 + 16);
        *(void *)(v509 + 16) = 0;

        -[GEOPDEVCharger readAll:](v509, 0);
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id objf = *(id *)(v509 + 32);
        uint64_t v511 = [objf countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v511)
        {
          uint64_t v512 = v511;
          uint64_t v513 = *(void *)v617;
          do
          {
            for (uint64_t i52 = 0; i52 != v512; ++i52)
            {
              if (*(void *)v617 != v513) {
                objc_enumerationMutation(objf);
              }
              uint64_t v515 = *(void *)(*((void *)&v616 + 1) + 8 * i52);
              if (v515)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v515 + 76) |= 4u;
                *(unsigned char *)(v515 + 76) |= 0x80u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v515 + 64));
                v516 = *(void **)(v515 + 16);
                *(void *)(v515 + 16) = 0;

                -[GEOPDPlug readAll:](v515, 0);
                uint64_t v517 = *(void *)(v515 + 24);
                if (v517)
                {
                  v518 = *(void **)(v517 + 8);
                  *(void *)(v517 + 8) = 0;
                }
                uint64_t v519 = *(void *)(v515 + 32);
                if (v519)
                {
                  os_unfair_lock_lock_with_options();
                  *(unsigned char *)(v519 + 52) |= 1u;
                  *(unsigned char *)(v519 + 52) |= 8u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v519 + 48));
                  v520 = *(void **)(v519 + 16);
                  *(void *)(v519 + 16) = 0;

                  -[GEOPDChargerInfo readAll:](v519, 0);
                }
              }
            }
            uint64_t v512 = [objf countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v512);
        }

        uint64_t v521 = *(void *)(v509 + 24);
        if (v521)
        {
          v522 = *(void **)(v521 + 8);
          *(void *)(v521 + 8) = 0;
        }
      }
      uint64_t v523 = *(void *)(v568 + 640);
      if (v523)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v523 + 60) |= 4u;
        *(unsigned char *)(v523 + 60) |= 0x20u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v523 + 48));
        v524 = *(void **)(v523 + 16);
        *(void *)(v523 + 16) = 0;

        -[GEOPDTrailHead readAll:](v523, 0);
        long long v602 = 0u;
        long long v603 = 0u;
        long long v600 = 0u;
        long long v601 = 0u;
        uint64_t v575 = v523;
        id objg = *(id *)(v523 + 32);
        uint64_t v525 = [objg countByEnumeratingWithState:&v600 objects:&v612 count:16];
        if (v525)
        {
          uint64_t v526 = v525;
          uint64_t v527 = *(void *)v601;
          do
          {
            for (uint64_t i53 = 0; i53 != v526; ++i53)
            {
              if (*(void *)v601 != v527) {
                objc_enumerationMutation(objg);
              }
              uint64_t v529 = *(void *)(*((void *)&v600 + 1) + 8 * i53);
              if (v529)
              {
                os_unfair_lock_lock_with_options();
                *(_WORD *)(v529 + 88) |= 2u;
                *(_WORD *)(v529 + 88) |= 0x100u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v529 + 80));
                v530 = *(void **)(v529 + 16);
                *(void *)(v529 + 16) = 0;

                -[GEOPDTrail readAll:](v529, 0);
                [*(id *)(v529 + 32) clearUnknownFields:1];
                uint64_t v531 = *(void *)(v529 + 40);
                if (v531)
                {
                  v532 = *(void **)(v531 + 8);
                  *(void *)(v531 + 8) = 0;

                  long long v618 = 0u;
                  long long v619 = 0u;
                  long long v616 = 0u;
                  long long v617 = 0u;
                  id v533 = *(id *)(v531 + 16);
                  uint64_t v534 = [v533 countByEnumeratingWithState:&v616 objects:v620 count:16];
                  if (v534)
                  {
                    uint64_t v535 = v534;
                    uint64_t v536 = *(void *)v617;
                    do
                    {
                      for (uint64_t i54 = 0; i54 != v535; ++i54)
                      {
                        if (*(void *)v617 != v536) {
                          objc_enumerationMutation(v533);
                        }
                        -[GEOPDFactoid clearUnknownFields:](*(void *)(*((void *)&v616 + 1) + 8 * i54));
                      }
                      uint64_t v535 = [v533 countByEnumeratingWithState:&v616 objects:v620 count:16];
                    }
                    while (v535);
                  }
                }
                long long v608 = 0u;
                long long v609 = 0u;
                long long v610 = 0u;
                long long v611 = 0u;
                id v538 = *(id *)(v529 + 56);
                uint64_t v539 = [v538 countByEnumeratingWithState:&v608 objects:v620 count:16];
                if (v539)
                {
                  uint64_t v540 = v539;
                  uint64_t v541 = *(void *)v609;
                  do
                  {
                    for (uint64_t i55 = 0; i55 != v540; ++i55)
                    {
                      if (*(void *)v609 != v541) {
                        objc_enumerationMutation(v538);
                      }
                      [*(id *)(*((void *)&v608 + 1) + 8 * i55) clearUnknownFields:1];
                    }
                    uint64_t v540 = [v538 countByEnumeratingWithState:&v608 objects:v620 count:16];
                  }
                  while (v540);
                }

                -[GEOPDPhoto clearUnknownFields:](*(void *)(v529 + 64));
                long long v606 = 0u;
                long long v607 = 0u;
                long long v604 = 0u;
                long long v605 = 0u;
                id v543 = *(id *)(v529 + 48);
                uint64_t v544 = [v543 countByEnumeratingWithState:&v604 objects:&v616 count:16];
                if (v544)
                {
                  uint64_t v545 = v544;
                  uint64_t v546 = *(void *)v605;
                  do
                  {
                    for (uint64_t i56 = 0; i56 != v545; ++i56)
                    {
                      if (*(void *)v605 != v546) {
                        objc_enumerationMutation(v543);
                      }
                      [*(id *)(*((void *)&v604 + 1) + 8 * i56) clearUnknownFields:1];
                    }
                    uint64_t v545 = [v543 countByEnumeratingWithState:&v604 objects:&v616 count:16];
                  }
                  while (v545);
                }

                -[GEOPDBusinessHours clearUnknownFields:](*(void *)(v529 + 24));
              }
            }
            uint64_t v526 = [objg countByEnumeratingWithState:&v600 objects:&v612 count:16];
          }
          while (v526);
        }

        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v548 = *(id *)(v575 + 24);
        uint64_t v549 = [v548 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v549)
        {
          uint64_t v550 = v549;
          uint64_t v551 = *(void *)v617;
          do
          {
            for (uint64_t i57 = 0; i57 != v550; ++i57)
            {
              if (*(void *)v617 != v551) {
                objc_enumerationMutation(v548);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i57) clearUnknownFields:1];
            }
            uint64_t v550 = [v548 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v550);
        }
      }
      uint64_t v553 = *(void *)(v568 + 632);
      if (v553)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v553 + 72) |= 2u;
        *(unsigned char *)(v553 + 72) |= 0x40u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v553 + 64));
        v554 = *(void **)(v553 + 16);
        *(void *)(v553 + 16) = 0;

        -[GEOPDTooltip readAll:](v553, 0);
        [*(id *)(v553 + 48) clearUnknownFields:1];
        [*(id *)(v553 + 40) clearUnknownFields:1];
        [*(id *)(v553 + 24) clearUnknownFields:1];
        -[GEOPDPhoto clearUnknownFields:](*(void *)(v553 + 32));
      }
      uint64_t v555 = *(void *)(v568 + 504);
      if (v555)
      {
        v556 = *(void **)(v555 + 8);
        *(void *)(v555 + 8) = 0;

        [*(id *)(v555 + 16) clearUnknownFields:1];
      }
      -[GEOPDAddressWithComponents clearUnknownFields:](*(void *)(v568 + 48), 1);
      uint64_t v557 = *(void *)(v568 + 544);
      if (v557)
      {
        v558 = *(void **)(v557 + 8);
        *(void *)(v557 + 8) = 0;

        -[GEOPDCaptionedPhoto clearUnknownFields:](*(void *)(v557 + 16));
      }
      uint64_t v559 = *(void *)(v568 + 248);
      if (v559)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v559 + 52) |= 1u;
        *(unsigned char *)(v559 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v559 + 48));
        v560 = *(void **)(v559 + 16);
        *(void *)(v559 + 16) = 0;

        -[GEOPDForwardInfo readAll:](v559, 0);
        [*(id *)(v559 + 24) clearUnknownFields:1];
        long long v618 = 0u;
        long long v619 = 0u;
        long long v616 = 0u;
        long long v617 = 0u;
        id v561 = *(id *)(v559 + 32);
        uint64_t v562 = [v561 countByEnumeratingWithState:&v616 objects:v620 count:16];
        if (v562)
        {
          uint64_t v563 = v562;
          uint64_t v564 = *(void *)v617;
          do
          {
            for (uint64_t i58 = 0; i58 != v563; ++i58)
            {
              if (*(void *)v617 != v564) {
                objc_enumerationMutation(v561);
              }
              [*(id *)(*((void *)&v616 + 1) + 8 * i58) clearUnknownFields:1];
            }
            uint64_t v563 = [v561 countByEnumeratingWithState:&v616 objects:v620 count:16];
          }
          while (v563);
        }
      }
      [*(id *)(v568 + 272) clearUnknownFields:1];
      [*(id *)(v568 + 288) clearUnknownFields:1];
      v566 = *(void **)(v568 + 280);
      [v566 clearUnknownFields:1];
    }
  }
}

- (void)setEntity:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (void)setPlaceInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 400), a2);
  }
}

- (id)accessInfo
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBounds:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)address
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAddress:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (id)rating
{
  if (a1)
  {
    a1 = (id *)a1[61];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRating:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 488), a2);
  }
}

- (id)review
{
  if (a1)
  {
    a1 = (id *)a1[67];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)photo
{
  if (a1)
  {
    a1 = (id *)a1[46];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)hours
{
  if (a1)
  {
    a1 = (id *)a1[37];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setHours:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 296), a2);
  }
}

- (id)transitInfo
{
  if (a1)
  {
    a1 = (id *)a1[85];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTransitInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 680), a2);
  }
}

- (id)transitSchedule
{
  if (a1)
  {
    a1 = (id *)a1[88];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)flyover
{
  if (a1)
  {
    a1 = (id *)a1[30];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFlyover:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (id)amenities
{
  if (a1)
  {
    a1 = (id *)a1[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAmenities:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setStyleAttributes:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 592), a2);
  }
}

- (id)transitIncident
{
  if (a1)
  {
    a1 = (id *)a1[83];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)transitAssociatedInfo
{
  if (a1)
  {
    a1 = (id *)a1[81];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)textBlock
{
  if (a1)
  {
    a1 = (id *)a1[77];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTextBlock:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 616), a2);
  }
}

- (id)factoid
{
  if (a1)
  {
    a1 = (id *)a1[29];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFactoid:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (id)transitAttribution
{
  if (a1)
  {
    a1 = (id *)a1[82];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTransitAttribution:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 656), a2);
  }
}

- (id)businessClaim
{
  if (a1)
  {
    a1 = (id *)a1[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCaptionedPhoto:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (id)transitInfoSnippet
{
  if (a1)
  {
    a1 = (id *)a1[84];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)resultSnippet
{
  if (a1)
  {
    a1 = (id *)a1[66];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setResultSnippet:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 528), a2);
  }
}

- (void)setAddressObject:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)restaurantReservationLink
{
  if (a1)
  {
    a1 = (id *)a1[65];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRestaurantReservationLink:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 520), a2);
  }
}

- (id)spatialLookupResult
{
  if (a1)
  {
    a1 = (id *)a1[70];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)tip
{
  if (a1)
  {
    a1 = (id *)a1[78];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)placecardUrl
{
  if (a1)
  {
    a1 = (id *)a1[53];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlacecardUrl:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 424), a2);
  }
}

- (id)associatedApp
{
  if (a1)
  {
    a1 = (id *)a1[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)messageLink
{
  if (a1)
  {
    a1 = (id *)a1[43];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMessageLink:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 344), a2);
  }
}

- (id)quickLink
{
  if (a1)
  {
    a1 = (id *)a1[59];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)rap
{
  if (a1)
  {
    a1 = (id *)a1[60];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)offlineArea
{
  if (a1)
  {
    a1 = (id *)a1[45];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)supportsOfflineMaps
{
  if (a1)
  {
    a1 = (id *)a1[75];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)venueInfo
{
  if (a1)
  {
    a1 = (id *)a1[94];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setVenueInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 752), a2);
  }
}

- (id)containedPlace
{
  if (a1)
  {
    a1 = (id *)a1[19];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setContainedPlace:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (id)wifiFingerprint
{
  if (a1)
  {
    a1 = (id *)a1[95];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)icon
{
  if (a1)
  {
    a1 = (id *)a1[38];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)priceDescription
{
  if (a1)
  {
    a1 = (id *)a1[56];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)browseCategories
{
  if (a1)
  {
    a1 = (id *)a1[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)storefront
{
  if (a1)
  {
    a1 = (id *)a1[73];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)groundViewLabel
{
  if (a1)
  {
    a1 = (id *)a1[32];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)annotatedItemList
{
  if (a1)
  {
    a1 = (id *)a1[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)poiEvent
{
  if (a1)
  {
    a1 = (id *)a1[55];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)storefrontPresentation
{
  if (a1)
  {
    a1 = (id *)a1[72];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)placecardLayoutConfiguration
{
  if (a1)
  {
    a1 = (id *)a1[52];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)transitVehiclePosition
{
  if (a1)
  {
    a1 = (id *)a1[92];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)linkedService
{
  if (a1)
  {
    a1 = (id *)a1[41];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)businessHours
{
  if (a1)
  {
    a1 = (id *)a1[15];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBusinessHours:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (id)transitTripStop
{
  if (a1)
  {
    a1 = (id *)a1[91];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)transitTripStopTime
{
  if (a1)
  {
    a1 = (id *)a1[90];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)transitTripGeometry
{
  if (a1)
  {
    a1 = (id *)a1[89];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)publisher
{
  if (a1)
  {
    a1 = (id *)a1[58];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)miniPlaceBrowseCategories
{
  if (a1)
  {
    a1 = (id *)a1[44];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)placeQuestionnaire
{
  if (a1)
  {
    a1 = (id *)a1[51];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)placeCollectionItem
{
  if (a1)
  {
    a1 = (id *)a1[48];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setIso3166Code:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 312), a2);
  }
}

- (id)transitNearbySchedule
{
  if (a1)
  {
    a1 = (id *)a1[86];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)guideGroup
{
  if (a1)
  {
    a1 = (id *)a1[33];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)containmentPlace
{
  if (a1)
  {
    a1 = (id *)a1[20];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setContainmentPlace:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (id)categorizedPhotos
{
  if (a1)
  {
    a1 = (id *)a1[17];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)exploreGuides
{
  if (a1)
  {
    a1 = (id *)a1[27];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)about
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)labelGeometry
{
  if (a1)
  {
    a1 = (id *)a1[40];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)enhancedPlacement
{
  if (a1)
  {
    a1 = (id *)a1[21];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)templatePlace
{
  if (a1)
  {
    a1 = (id *)a1[76];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)transitPaymentMethodInfo
{
  if (a1)
  {
    a1 = (id *)a1[87];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)businessAssets
{
  if (a1)
  {
    a1 = (id *)a1[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBusinessAssets:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (id)enrichmentInfo
{
  if (a1)
  {
    a1 = (id *)a1[23];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)actionData
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)enrichmentData
{
  if (a1)
  {
    a1 = (id *)a1[22];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)poiClaim
{
  if (a1)
  {
    a1 = (id *)a1[54];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)evCharger
{
  if (a1)
  {
    a1 = (id *)a1[26];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)trailHead
{
  if (a1)
  {
    a1 = (id *)a1[80];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTrailHead:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 640), a2);
  }
}

- (id)toolTip
{
  if (a1)
  {
    a1 = (id *)a1[79];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)searchResultPlacePhoto
{
  if (a1)
  {
    a1 = (id *)a1[68];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)forwardInfo
{
  if (a1)
  {
    a1 = (id *)a1[31];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)hikeAssociatedInfo
{
  if (a1)
  {
    a1 = (id *)a1[34];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setHikeAssociatedInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 272), a2);
  }
}

- (id)hikeSummary
{
  if (a1)
  {
    a1 = (id *)a1[36];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setHikeSummary:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 288), a2);
  }
}

- (id)hikeGeometry
{
  if (a1)
  {
    a1 = (id *)a1[35];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setHikeGeometry:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 280), a2);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDComponentValue;
  id v4 = [(GEOPDComponentValue *)&v8 description];
  uint64_t v5 = [(GEOPDComponentValue *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponentValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 192);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }

      [v4 setObject:v7 forKey:@"entity"];
    }

    id v8 = *(id *)(a1 + 400);
    uint64_t v9 = v8;
    if (v8)
    {
      if (a2)
      {
        uint64_t v10 = [v8 jsonRepresentation];
        uint64_t v11 = @"placeInfo";
      }
      else
      {
        uint64_t v10 = [v8 dictionaryRepresentation];
        uint64_t v11 = @"place_info";
      }
      id v12 = v10;

      [v4 setObject:v12 forKey:v11];
    }

    id v13 = *(id *)(a1 + 24);
    id v14 = v13;
    if (v13)
    {
      if (a2)
      {
        uint64_t v15 = [v13 jsonRepresentation];
        uint64_t v16 = @"accessInfo";
      }
      else
      {
        uint64_t v15 = [v13 dictionaryRepresentation];
        uint64_t v16 = @"access_info";
      }
      id v17 = v15;

      [v4 setObject:v17 forKey:v16];
    }

    id v18 = *(id *)(a1 + 88);
    uint64_t v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      id v20 = [v18 dictionaryRepresentation];
      }

      [v4 setObject:v20 forKey:@"bounds"];
    }

    id v21 = *(id *)(a1 + 56);
    uint64_t v22 = v21;
    if (v21)
    {
      if (a2) {
        [v21 jsonRepresentation];
      }
      else {
      id v23 = [v21 dictionaryRepresentation];
      }

      [v4 setObject:v23 forKey:@"address"];
    }

    id v24 = *(id *)(a1 + 488);
    uint64_t v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      id v26 = [v24 dictionaryRepresentation];
      }

      [v4 setObject:v26 forKey:@"rating"];
    }

    id v27 = *(id *)(a1 + 536);
    uint64_t v28 = v27;
    if (v27)
    {
      if (a2) {
        [v27 jsonRepresentation];
      }
      else {
      id v29 = [v27 dictionaryRepresentation];
      }

      [v4 setObject:v29 forKey:@"review"];
    }

    id v30 = *(id *)(a1 + 368);
    uint64_t v31 = v30;
    if (v30)
    {
      if (a2) {
        [v30 jsonRepresentation];
      }
      else {
      id v32 = [v30 dictionaryRepresentation];
      }

      [v4 setObject:v32 forKey:@"photo"];
    }

    id v33 = *(id *)(a1 + 296);
    uint64_t v34 = v33;
    if (v33)
    {
      if (a2) {
        [v33 jsonRepresentation];
      }
      else {
      id v35 = [v33 dictionaryRepresentation];
      }

      [v4 setObject:v35 forKey:@"hours"];
    }

    id v36 = *(id *)(a1 + 680);
    uint64_t v37 = v36;
    if (v36)
    {
      if (a2)
      {
        uint64_t v38 = [v36 jsonRepresentation];
        uint64_t v39 = @"transitInfo";
      }
      else
      {
        uint64_t v38 = [v36 dictionaryRepresentation];
        uint64_t v39 = @"transit_info";
      }
      id v40 = v38;

      [v4 setObject:v40 forKey:v39];
    }

    id v41 = *(id *)(a1 + 704);
    long long v42 = v41;
    if (v41)
    {
      if (a2)
      {
        uint64_t v43 = [v41 jsonRepresentation];
        long long v44 = @"transitSchedule";
      }
      else
      {
        uint64_t v43 = [v41 dictionaryRepresentation];
        long long v44 = @"transit_schedule";
      }
      id v45 = v43;

      [v4 setObject:v45 forKey:v44];
    }

    id v46 = *(id *)(a1 + 200);
    uint64_t v47 = v46;
    if (v46)
    {
      if (a2) {
        [v46 jsonRepresentation];
      }
      else {
      id v48 = [v46 dictionaryRepresentation];
      }

      [v4 setObject:v48 forKey:@"eta"];
    }

    id v49 = *(id *)(a1 + 240);
    id v50 = v49;
    if (v49)
    {
      if (a2) {
        [v49 jsonRepresentation];
      }
      else {
      id v51 = [v49 dictionaryRepresentation];
      }

      [v4 setObject:v51 forKey:@"flyover"];
    }

    id v52 = *(id *)(a1 + 496);
    uint64_t v53 = v52;
    if (v52)
    {
      if (a2)
      {
        id v54 = [v52 jsonRepresentation];
        id v55 = @"rawAttribute";
      }
      else
      {
        id v54 = [v52 dictionaryRepresentation];
        id v55 = @"raw_attribute";
      }
      id v56 = v54;

      [v4 setObject:v56 forKey:v55];
    }

    id v57 = *(id *)(a1 + 64);
    uint64_t v58 = v57;
    if (v57)
    {
      if (a2) {
        [v57 jsonRepresentation];
      }
      else {
      id v59 = [v57 dictionaryRepresentation];
      }

      [v4 setObject:v59 forKey:@"amenities"];
    }

    id v60 = *(id *)(a1 + 592);
    uint64_t v61 = v60;
    if (v60)
    {
      if (a2)
      {
        uint64_t v62 = [v60 jsonRepresentation];
        v63 = @"styleAttributes";
      }
      else
      {
        uint64_t v62 = [v60 dictionaryRepresentation];
        v63 = @"style_attributes";
      }
      id v64 = v62;

      [v4 setObject:v64 forKey:v63];
    }

    id v65 = *(id *)(a1 + 664);
    id v66 = v65;
    if (v65)
    {
      if (a2)
      {
        uint64_t v67 = [v65 jsonRepresentation];
        uint64_t v68 = @"transitIncident";
      }
      else
      {
        uint64_t v67 = [v65 dictionaryRepresentation];
        uint64_t v68 = @"transit_incident";
      }
      id v69 = v67;

      [v4 setObject:v69 forKey:v68];
    }

    id v70 = *(id *)(a1 + 648);
    id v71 = v70;
    if (v70)
    {
      if (a2)
      {
        uint64_t v72 = [v70 jsonRepresentation];
        uint64_t v73 = @"transitAssociatedInfo";
      }
      else
      {
        uint64_t v72 = [v70 dictionaryRepresentation];
        uint64_t v73 = @"transit_associated_info";
      }
      id v74 = v72;

      [v4 setObject:v74 forKey:v73];
    }

    id v75 = *(id *)(a1 + 616);
    uint64_t v76 = v75;
    if (v75)
    {
      if (a2)
      {
        v77 = [v75 jsonRepresentation];
        uint64_t v78 = @"textBlock";
      }
      else
      {
        v77 = [v75 dictionaryRepresentation];
        uint64_t v78 = @"text_block";
      }
      id v79 = v77;

      [v4 setObject:v79 forKey:v78];
    }

    id v80 = *(id *)(a1 + 232);
    v81 = v80;
    if (v80)
    {
      if (a2) {
        [v80 jsonRepresentation];
      }
      else {
      id v82 = [v80 dictionaryRepresentation];
      }

      [v4 setObject:v82 forKey:@"factoid"];
    }

    id v83 = *(id *)(a1 + 656);
    uint64_t v84 = v83;
    if (v83)
    {
      if (a2)
      {
        uint64_t v85 = [v83 jsonRepresentation];
        id v86 = @"transitAttribution";
      }
      else
      {
        uint64_t v85 = [v83 dictionaryRepresentation];
        id v86 = @"transit_attribution";
      }
      id v87 = v85;

      [v4 setObject:v87 forKey:v86];
    }

    id v88 = *(id *)(a1 + 112);
    uint64_t v89 = v88;
    if (v88)
    {
      if (a2)
      {
        id v90 = [v88 jsonRepresentation];
        uint64_t v91 = @"businessClaim";
      }
      else
      {
        id v90 = [v88 dictionaryRepresentation];
        uint64_t v91 = @"business_claim";
      }
      id v92 = v90;

      [v4 setObject:v92 forKey:v91];
    }

    id v93 = *(id *)(a1 + 128);
    id v94 = v93;
    if (v93)
    {
      if (a2)
      {
        uint64_t v95 = [v93 jsonRepresentation];
        id v96 = @"captionedPhoto";
      }
      else
      {
        uint64_t v95 = [v93 dictionaryRepresentation];
        id v96 = @"captioned_photo";
      }
      id v97 = v95;

      [v4 setObject:v97 forKey:v96];
    }

    id v98 = *(id *)(a1 + 672);
    uint64_t v99 = v98;
    if (v98)
    {
      if (a2)
      {
        uint64_t v100 = [v98 jsonRepresentation];
        v101 = @"transitInfoSnippet";
      }
      else
      {
        uint64_t v100 = [v98 dictionaryRepresentation];
        v101 = @"transit_info_snippet";
      }
      id v102 = v100;

      [v4 setObject:v102 forKey:v101];
    }

    id v103 = *(id *)(a1 + 224);
    id v104 = v103;
    if (v103)
    {
      if (a2)
      {
        uint64_t v105 = [v103 jsonRepresentation];
        uint64_t v106 = @"externalAction";
      }
      else
      {
        uint64_t v105 = [v103 dictionaryRepresentation];
        uint64_t v106 = @"external_action";
      }
      id v107 = v105;

      [v4 setObject:v107 forKey:v106];
    }

    id v108 = *(id *)(a1 + 528);
    uint64_t v109 = v108;
    if (v108)
    {
      if (a2)
      {
        uint64_t v110 = [v108 jsonRepresentation];
        v111 = @"resultSnippet";
      }
      else
      {
        uint64_t v110 = [v108 dictionaryRepresentation];
        v111 = @"result_snippet";
      }
      id v112 = v110;

      [v4 setObject:v112 forKey:v111];
    }

    id v113 = *(id *)(a1 + 40);
    id v114 = v113;
    if (v113)
    {
      if (a2)
      {
        uint64_t v115 = [v113 jsonRepresentation];
        uint64_t v116 = @"addressObject";
      }
      else
      {
        uint64_t v115 = [v113 dictionaryRepresentation];
        uint64_t v116 = @"address_object";
      }
      id v117 = v115;

      [v4 setObject:v117 forKey:v116];
    }

    id v118 = *(id *)(a1 + 552);
    uint64_t v119 = v118;
    if (v118)
    {
      if (a2)
      {
        id v120 = [v118 jsonRepresentation];
        uint64_t v121 = @"simpleRestaurantMenuText";
      }
      else
      {
        id v120 = [v118 dictionaryRepresentation];
        uint64_t v121 = @"simple_restaurant_menu_text";
      }
      id v122 = v120;

      [v4 setObject:v122 forKey:v121];
    }

    id v123 = *(id *)(a1 + 520);
    id v124 = v123;
    if (v123)
    {
      if (a2)
      {
        uint64_t v125 = [v123 jsonRepresentation];
        id v126 = @"restaurantReservationLink";
      }
      else
      {
        uint64_t v125 = [v123 dictionaryRepresentation];
        id v126 = @"restaurant_reservation_link";
      }
      id v127 = v125;

      [v4 setObject:v127 forKey:v126];
    }

    id v128 = *(id *)(a1 + 560);
    uint64_t v129 = v128;
    if (v128)
    {
      if (a2)
      {
        uint64_t v130 = [v128 jsonRepresentation];
        v131 = @"spatialLookupResult";
      }
      else
      {
        uint64_t v130 = [v128 dictionaryRepresentation];
        v131 = @"spatial_lookup_result";
      }
      id v132 = v130;

      [v4 setObject:v132 forKey:v131];
    }

    id v133 = *(id *)(a1 + 624);
    uint64_t v134 = v133;
    if (v133)
    {
      if (a2) {
        [v133 jsonRepresentation];
      }
      else {
      id v135 = [v133 dictionaryRepresentation];
      }

      [v4 setObject:v135 forKey:@"tip"];
    }

    id v136 = *(id *)(a1 + 424);
    uint64_t v137 = v136;
    if (v136)
    {
      if (a2)
      {
        uint64_t v138 = [v136 jsonRepresentation];
        uint64_t v139 = @"placecardUrl";
      }
      else
      {
        uint64_t v138 = [v136 dictionaryRepresentation];
        uint64_t v139 = @"placecard_url";
      }
      id v140 = v138;

      [v4 setObject:v140 forKey:v139];
    }

    id v141 = *(id *)(a1 + 80);
    id v142 = v141;
    if (v141)
    {
      if (a2)
      {
        uint64_t v143 = [v141 jsonRepresentation];
        uint64_t v144 = @"associatedApp";
      }
      else
      {
        uint64_t v143 = [v141 dictionaryRepresentation];
        uint64_t v144 = @"associated_app";
      }
      id v145 = v143;

      [v4 setObject:v145 forKey:v144];
    }

    id v146 = *(id *)(a1 + 344);
    uint64_t v147 = v146;
    if (v146)
    {
      if (a2)
      {
        id v148 = [v146 jsonRepresentation];
        uint64_t v149 = @"messageLink";
      }
      else
      {
        id v148 = [v146 dictionaryRepresentation];
        uint64_t v149 = @"message_link";
      }
      id v150 = v148;

      [v4 setObject:v150 forKey:v149];
    }

    id v151 = *(id *)(a1 + 472);
    id v152 = v151;
    if (v151)
    {
      if (a2)
      {
        uint64_t v153 = [v151 jsonRepresentation];
        id v154 = @"quickLink";
      }
      else
      {
        uint64_t v153 = [v151 dictionaryRepresentation];
        id v154 = @"quick_link";
      }
      id v155 = v153;

      [v4 setObject:v155 forKey:v154];
    }

    id v156 = *(id *)(a1 + 480);
    uint64_t v157 = v156;
    if (v156)
    {
      if (a2) {
        [v156 jsonRepresentation];
      }
      else {
      id v158 = [v156 dictionaryRepresentation];
      }

      [v4 setObject:v158 forKey:@"rap"];
    }

    id v159 = *(id *)(a1 + 360);
    id v160 = v159;
    if (v159)
    {
      if (a2)
      {
        uint64_t v161 = [v159 jsonRepresentation];
        id v162 = @"offlineArea";
      }
      else
      {
        uint64_t v161 = [v159 dictionaryRepresentation];
        id v162 = @"offline_area";
      }
      id v163 = v161;

      [v4 setObject:v163 forKey:v162];
    }

    id v164 = *(id *)(a1 + 336);
    id v165 = v164;
    if (v164)
    {
      if (a2)
      {
        uint64_t v166 = [v164 jsonRepresentation];
        uint64_t v167 = @"locationEvent";
      }
      else
      {
        uint64_t v166 = [v164 dictionaryRepresentation];
        uint64_t v167 = @"location_event";
      }
      id v168 = v166;

      [v4 setObject:v168 forKey:v167];
    }

    id v169 = *(id *)(a1 + 600);
    uint64_t v170 = v169;
    if (v169)
    {
      if (a2)
      {
        v171 = [v169 jsonRepresentation];
        uint64_t v172 = @"supportsOfflineMaps";
      }
      else
      {
        v171 = [v169 dictionaryRepresentation];
        uint64_t v172 = @"supports_offline_maps";
      }
      id v173 = v171;

      [v4 setObject:v173 forKey:v172];
    }

    id v174 = *(id *)(a1 + 752);
    uint64_t v175 = v174;
    if (v174)
    {
      if (a2)
      {
        uint64_t v176 = [v174 jsonRepresentation];
        uint64_t v177 = @"venueInfo";
      }
      else
      {
        uint64_t v176 = [v174 dictionaryRepresentation];
        uint64_t v177 = @"venue_info";
      }
      id v178 = v176;

      [v4 setObject:v178 forKey:v177];
    }

    id v179 = *(id *)(a1 + 152);
    id v180 = v179;
    if (v179)
    {
      if (a2)
      {
        uint64_t v181 = [v179 jsonRepresentation];
        id v182 = @"containedPlace";
      }
      else
      {
        uint64_t v181 = [v179 dictionaryRepresentation];
        id v182 = @"contained_place";
      }
      id v183 = v181;

      [v4 setObject:v183 forKey:v182];
    }

    id v184 = *(id *)(a1 + 760);
    uint64_t v185 = v184;
    if (v184)
    {
      if (a2)
      {
        id v186 = [v184 jsonRepresentation];
        uint64_t v187 = @"wifiFingerprint";
      }
      else
      {
        id v186 = [v184 dictionaryRepresentation];
        uint64_t v187 = @"wifi_fingerprint";
      }
      id v188 = v186;

      [v4 setObject:v188 forKey:v187];
    }

    id v189 = *(id *)(a1 + 304);
    id v190 = v189;
    if (v189)
    {
      if (a2) {
        [v189 jsonRepresentation];
      }
      else {
      id v191 = [v189 dictionaryRepresentation];
      }

      [v4 setObject:v191 forKey:@"icon"];
    }

    id v192 = *(id *)(a1 + 448);
    id v193 = v192;
    if (v192)
    {
      if (a2)
      {
        uint64_t v194 = [v192 jsonRepresentation];
        uint64_t v195 = @"priceDescription";
      }
      else
      {
        uint64_t v194 = [v192 dictionaryRepresentation];
        uint64_t v195 = @"price_description";
      }
      id v196 = v194;

      [v4 setObject:v196 forKey:v195];
    }

    id v197 = *(id *)(a1 + 96);
    uint64_t v198 = v197;
    if (v197)
    {
      if (a2)
      {
        v199 = [v197 jsonRepresentation];
        uint64_t v200 = @"browseCategories";
      }
      else
      {
        v199 = [v197 dictionaryRepresentation];
        uint64_t v200 = @"browse_categories";
      }
      id v201 = v199;

      [v4 setObject:v201 forKey:v200];
    }

    id v202 = *(id *)(a1 + 584);
    uint64_t v203 = v202;
    if (v202)
    {
      if (a2) {
        [v202 jsonRepresentation];
      }
      else {
      id v204 = [v202 dictionaryRepresentation];
      }

      [v4 setObject:v204 forKey:@"storefront"];
    }

    id v205 = *(id *)(a1 + 256);
    v206 = v205;
    if (v205)
    {
      if (a2)
      {
        id v207 = [v205 jsonRepresentation];
        uint64_t v208 = @"groundViewLabel";
      }
      else
      {
        id v207 = [v205 dictionaryRepresentation];
        uint64_t v208 = @"ground_view_label";
      }
      id v209 = v207;

      [v4 setObject:v209 forKey:v208];
    }

    id v210 = *(id *)(a1 + 72);
    v211 = v210;
    if (v210)
    {
      if (a2)
      {
        uint64_t v212 = [v210 jsonRepresentation];
        v213 = @"annotatedItemList";
      }
      else
      {
        uint64_t v212 = [v210 dictionaryRepresentation];
        v213 = @"annotated_item_list";
      }
      id v214 = v212;

      [v4 setObject:v214 forKey:v213];
    }

    id v215 = *(id *)(a1 + 440);
    id v216 = v215;
    if (v215)
    {
      if (a2)
      {
        uint64_t v217 = [v215 jsonRepresentation];
        uint64_t v218 = @"poiEvent";
      }
      else
      {
        uint64_t v217 = [v215 dictionaryRepresentation];
        uint64_t v218 = @"poi_event";
      }
      id v219 = v217;

      [v4 setObject:v219 forKey:v218];
    }

    id v220 = *(id *)(a1 + 576);
    uint64_t v221 = v220;
    if (v220)
    {
      if (a2)
      {
        v222 = [v220 jsonRepresentation];
        uint64_t v223 = @"storefrontPresentation";
      }
      else
      {
        v222 = [v220 dictionaryRepresentation];
        uint64_t v223 = @"storefront_presentation";
      }
      id v224 = v222;

      [v4 setObject:v224 forKey:v223];
    }

    id v225 = *(id *)(a1 + 416);
    v226 = v225;
    if (v225)
    {
      if (a2)
      {
        id v227 = [v225 jsonRepresentation];
        uint64_t v228 = @"placecardLayoutConfiguration";
      }
      else
      {
        id v227 = [v225 dictionaryRepresentation];
        uint64_t v228 = @"placecard_layout_configuration";
      }
      id v229 = v227;

      [v4 setObject:v229 forKey:v228];
    }

    id v230 = *(id *)(a1 + 456);
    v231 = v230;
    if (v230)
    {
      if (a2)
      {
        id v232 = [v230 jsonRepresentation];
        uint64_t v233 = @"prototypeContainer";
      }
      else
      {
        id v232 = [v230 dictionaryRepresentation];
        uint64_t v233 = @"prototype_container";
      }
      id v234 = v232;

      [v4 setObject:v234 forKey:v233];
    }

    id v235 = *(id *)(a1 + 736);
    v236 = v235;
    if (v235)
    {
      if (a2)
      {
        uint64_t v237 = [v235 jsonRepresentation];
        v238 = @"transitVehiclePosition";
      }
      else
      {
        uint64_t v237 = [v235 dictionaryRepresentation];
        v238 = @"transit_vehicle_position";
      }
      id v239 = v237;

      [v4 setObject:v239 forKey:v238];
    }

    id v240 = *(id *)(a1 + 328);
    uint64_t v241 = v240;
    if (v240)
    {
      if (a2)
      {
        v242 = [v240 jsonRepresentation];
        id v243 = @"linkedService";
      }
      else
      {
        v242 = [v240 dictionaryRepresentation];
        id v243 = @"linked_service";
      }
      id v244 = v242;

      [v4 setObject:v244 forKey:v243];
    }

    id v245 = *(id *)(a1 + 120);
    uint64_t v246 = v245;
    if (v245)
    {
      if (a2)
      {
        v247 = [v245 jsonRepresentation];
        uint64_t v248 = @"businessHours";
      }
      else
      {
        v247 = [v245 dictionaryRepresentation];
        uint64_t v248 = @"business_hours";
      }
      id v249 = v247;

      [v4 setObject:v249 forKey:v248];
    }

    id v250 = *(id *)(a1 + 392);
    v251 = v250;
    if (v250)
    {
      if (a2)
      {
        uint64_t v252 = [v250 jsonRepresentation];
        v253 = @"placeCollection";
      }
      else
      {
        uint64_t v252 = [v250 dictionaryRepresentation];
        v253 = @"place_collection";
      }
      id v254 = v252;

      [v4 setObject:v254 forKey:v253];
    }

    id v255 = *(id *)(a1 + 512);
    uint64_t v256 = v255;
    if (v255)
    {
      if (a2)
      {
        uint64_t v257 = [v255 jsonRepresentation];
        v258 = @"relatedPlace";
      }
      else
      {
        uint64_t v257 = [v255 dictionaryRepresentation];
        v258 = @"related_place";
      }
      id v259 = v257;

      [v4 setObject:v259 forKey:v258];
    }

    id v260 = *(id *)(a1 + 728);
    uint64_t v261 = v260;
    if (v260)
    {
      if (a2)
      {
        v262 = [v260 jsonRepresentation];
        id v263 = @"transitTripStop";
      }
      else
      {
        v262 = [v260 dictionaryRepresentation];
        id v263 = @"transit_trip_stop";
      }
      id v264 = v262;

      [v4 setObject:v264 forKey:v263];
    }

    id v265 = *(id *)(a1 + 720);
    uint64_t v266 = v265;
    if (v265)
    {
      if (a2)
      {
        v267 = [v265 jsonRepresentation];
        uint64_t v268 = @"transitTripStopTime";
      }
      else
      {
        v267 = [v265 dictionaryRepresentation];
        uint64_t v268 = @"transit_trip_stop_time";
      }
      id v269 = v267;

      [v4 setObject:v269 forKey:v268];
    }

    id v270 = *(id *)(a1 + 712);
    v271 = v270;
    if (v270)
    {
      if (a2)
      {
        uint64_t v272 = [v270 jsonRepresentation];
        v273 = @"transitTripGeometry";
      }
      else
      {
        uint64_t v272 = [v270 dictionaryRepresentation];
        v273 = @"transit_trip_geometry";
      }
      id v274 = v272;

      [v4 setObject:v274 forKey:v273];
    }

    id v275 = *(id *)(a1 + 376);
    uint64_t v276 = v275;
    if (v275)
    {
      if (a2)
      {
        uint64_t v277 = [v275 jsonRepresentation];
        v278 = @"placeBrowseCategories";
      }
      else
      {
        uint64_t v277 = [v275 dictionaryRepresentation];
        v278 = @"place_browse_categories";
      }
      id v279 = v277;

      [v4 setObject:v279 forKey:v278];
    }

    id v280 = *(id *)(a1 + 464);
    id v281 = v280;
    if (v280)
    {
      if (a2) {
        [v280 jsonRepresentation];
      }
      else {
      id v282 = [v280 dictionaryRepresentation];
      }

      [v4 setObject:v282 forKey:@"publisher"];
    }

    id v283 = *(id *)(a1 + 352);
    uint64_t v284 = v283;
    if (v283)
    {
      if (a2)
      {
        v285 = [v283 jsonRepresentation];
        id v286 = @"miniPlaceBrowseCategories";
      }
      else
      {
        v285 = [v283 dictionaryRepresentation];
        id v286 = @"mini_place_browse_categories";
      }
      id v287 = v285;

      [v4 setObject:v287 forKey:v286];
    }

    id v288 = *(id *)(a1 + 408);
    uint64_t v289 = v288;
    if (v288)
    {
      if (a2)
      {
        v290 = [v288 jsonRepresentation];
        id v291 = @"placeQuestionnaire";
      }
      else
      {
        v290 = [v288 dictionaryRepresentation];
        id v291 = @"place_questionnaire";
      }
      id v292 = v290;

      [v4 setObject:v292 forKey:v291];
    }

    id v293 = *(id *)(a1 + 384);
    uint64_t v294 = v293;
    if (v293)
    {
      if (a2)
      {
        v295 = [v293 jsonRepresentation];
        uint64_t v296 = @"placeCollectionItem";
      }
      else
      {
        v295 = [v293 dictionaryRepresentation];
        uint64_t v296 = @"place_collection_item";
      }
      id v297 = v295;

      [v4 setObject:v297 forKey:v296];
    }

    id v298 = *(id *)(a1 + 144);
    v299 = v298;
    if (v298)
    {
      if (a2)
      {
        id v300 = [v298 jsonRepresentation];
        uint64_t v301 = @"collectionIds";
      }
      else
      {
        id v300 = [v298 dictionaryRepresentation];
        uint64_t v301 = @"collection_ids";
      }
      id v302 = v300;

      [v4 setObject:v302 forKey:v301];
    }

    id v303 = *(id *)(a1 + 312);
    v304 = v303;
    if (v303)
    {
      if (a2)
      {
        uint64_t v305 = [v303 jsonRepresentation];
        v306 = @"iso3166Code";
      }
      else
      {
        uint64_t v305 = [v303 dictionaryRepresentation];
        v306 = @"iso_3166_code";
      }
      id v307 = v305;

      [v4 setObject:v307 forKey:v306];
    }

    id v308 = *(id *)(a1 + 744);
    id v309 = v308;
    if (v308)
    {
      if (a2)
      {
        uint64_t v310 = [v308 jsonRepresentation];
        uint64_t v311 = @"vendorAmenities";
      }
      else
      {
        uint64_t v310 = [v308 dictionaryRepresentation];
        uint64_t v311 = @"vendor_amenities";
      }
      id v312 = v310;

      [v4 setObject:v312 forKey:v311];
    }

    id v313 = *(id *)(a1 + 688);
    uint64_t v314 = v313;
    if (v313)
    {
      if (a2)
      {
        v315 = [v313 jsonRepresentation];
        uint64_t v316 = @"transitNearbySchedule";
      }
      else
      {
        v315 = [v313 dictionaryRepresentation];
        uint64_t v316 = @"transit_nearby_schedule";
      }
      id v317 = v315;

      [v4 setObject:v317 forKey:v316];
    }

    id v318 = *(id *)(a1 + 568);
    uint64_t v319 = v318;
    if (v318)
    {
      if (a2)
      {
        uint64_t v320 = [v318 jsonRepresentation];
        uint64_t v321 = @"storefrontFaces";
      }
      else
      {
        uint64_t v320 = [v318 dictionaryRepresentation];
        uint64_t v321 = @"storefront_faces";
      }
      id v322 = v320;

      [v4 setObject:v322 forKey:v321];
    }

    id v323 = *(id *)(a1 + 264);
    v324 = v323;
    if (v323)
    {
      if (a2)
      {
        id v325 = [v323 jsonRepresentation];
        uint64_t v326 = @"guideGroup";
      }
      else
      {
        id v325 = [v323 dictionaryRepresentation];
        uint64_t v326 = @"guide_group";
      }
      id v327 = v325;

      [v4 setObject:v327 forKey:v326];
    }

    id v328 = *(id *)(a1 + 160);
    v329 = v328;
    if (v328)
    {
      if (a2)
      {
        uint64_t v330 = [v328 jsonRepresentation];
        v331 = @"containmentPlace";
      }
      else
      {
        uint64_t v330 = [v328 dictionaryRepresentation];
        v331 = @"containment_place";
      }
      id v332 = v330;

      [v4 setObject:v332 forKey:v331];
    }

    id v333 = *(id *)(a1 + 136);
    uint64_t v334 = v333;
    if (v333)
    {
      if (a2)
      {
        uint64_t v335 = [v333 jsonRepresentation];
        v336 = @"categorizedPhotos";
      }
      else
      {
        uint64_t v335 = [v333 dictionaryRepresentation];
        v336 = @"categorized_photos";
      }
      id v337 = v335;

      [v4 setObject:v337 forKey:v336];
    }

    id v338 = *(id *)(a1 + 216);
    id v339 = v338;
    if (v338)
    {
      if (a2)
      {
        uint64_t v340 = [v338 jsonRepresentation];
        uint64_t v341 = @"exploreGuides";
      }
      else
      {
        uint64_t v340 = [v338 dictionaryRepresentation];
        uint64_t v341 = @"explore_guides";
      }
      id v342 = v340;

      [v4 setObject:v342 forKey:v341];
    }

    id v343 = *(id *)(a1 + 16);
    uint64_t v344 = v343;
    if (v343)
    {
      if (a2) {
        [v343 jsonRepresentation];
      }
      else {
      id v345 = [v343 dictionaryRepresentation];
      }

      [v4 setObject:v345 forKey:@"about"];
    }

    id v346 = *(id *)(a1 + 320);
    uint64_t v347 = v346;
    if (v346)
    {
      if (a2)
      {
        uint64_t v348 = [v346 jsonRepresentation];
        uint64_t v349 = @"labelGeometry";
      }
      else
      {
        uint64_t v348 = [v346 dictionaryRepresentation];
        uint64_t v349 = @"label_geometry";
      }
      id v350 = v348;

      [v4 setObject:v350 forKey:v349];
    }

    id v351 = *(id *)(a1 + 168);
    v352 = v351;
    if (v351)
    {
      if (a2)
      {
        uint64_t v353 = [v351 jsonRepresentation];
        v354 = @"enhancedPlacement";
      }
      else
      {
        uint64_t v353 = [v351 dictionaryRepresentation];
        v354 = @"enhanced_placement";
      }
      id v355 = v353;

      [v4 setObject:v355 forKey:v354];
    }

    id v356 = *(id *)(a1 + 608);
    uint64_t v357 = v356;
    if (v356)
    {
      if (a2)
      {
        uint64_t v358 = [v356 jsonRepresentation];
        v359 = @"templatePlace";
      }
      else
      {
        uint64_t v358 = [v356 dictionaryRepresentation];
        v359 = @"template_place";
      }
      id v360 = v358;

      [v4 setObject:v360 forKey:v359];
    }

    id v361 = *(id *)(a1 + 696);
    uint64_t v362 = v361;
    if (v361)
    {
      if (a2)
      {
        v363 = [v361 jsonRepresentation];
        id v364 = @"transitPaymentMethodInfo";
      }
      else
      {
        v363 = [v361 dictionaryRepresentation];
        id v364 = @"transit_payment_method_info";
      }
      id v365 = v363;

      [v4 setObject:v365 forKey:v364];
    }

    id v366 = *(id *)(a1 + 104);
    uint64_t v367 = v366;
    if (v366)
    {
      if (a2)
      {
        v368 = [v366 jsonRepresentation];
        uint64_t v369 = @"businessAssets";
      }
      else
      {
        v368 = [v366 dictionaryRepresentation];
        uint64_t v369 = @"business_assets";
      }
      id v370 = v368;

      [v4 setObject:v370 forKey:v369];
    }

    id v371 = *(id *)(a1 + 184);
    v372 = v371;
    if (v371)
    {
      if (a2)
      {
        id v373 = [v371 jsonRepresentation];
        uint64_t v374 = @"enrichmentInfo";
      }
      else
      {
        id v373 = [v371 dictionaryRepresentation];
        uint64_t v374 = @"enrichment_info";
      }
      id v375 = v373;

      [v4 setObject:v375 forKey:v374];
    }

    id v376 = *(id *)(a1 + 32);
    v377 = v376;
    if (v376)
    {
      if (a2)
      {
        uint64_t v378 = [v376 jsonRepresentation];
        v379 = @"actionData";
      }
      else
      {
        uint64_t v378 = [v376 dictionaryRepresentation];
        v379 = @"action_data";
      }
      id v380 = v378;

      [v4 setObject:v380 forKey:v379];
    }

    id v381 = *(id *)(a1 + 176);
    uint64_t v382 = v381;
    if (v381)
    {
      if (a2)
      {
        uint64_t v383 = [v381 jsonRepresentation];
        v384 = @"enrichmentData";
      }
      else
      {
        uint64_t v383 = [v381 dictionaryRepresentation];
        v384 = @"enrichment_data";
      }
      id v385 = v383;

      [v4 setObject:v385 forKey:v384];
    }

    id v386 = *(id *)(a1 + 432);
    uint64_t v387 = v386;
    if (v386)
    {
      if (a2)
      {
        v388 = [v386 jsonRepresentation];
        uint64_t v389 = @"poiClaim";
      }
      else
      {
        v388 = [v386 dictionaryRepresentation];
        uint64_t v389 = @"poi_claim";
      }
      id v390 = v388;

      [v4 setObject:v390 forKey:v389];
    }

    id v391 = *(id *)(a1 + 208);
    uint64_t v392 = v391;
    if (v391)
    {
      if (a2)
      {
        uint64_t v393 = [v391 jsonRepresentation];
        uint64_t v394 = @"evCharger";
      }
      else
      {
        uint64_t v393 = [v391 dictionaryRepresentation];
        uint64_t v394 = @"ev_charger";
      }
      id v395 = v393;

      [v4 setObject:v395 forKey:v394];
    }

    id v396 = *(id *)(a1 + 640);
    v397 = v396;
    if (v396)
    {
      if (a2)
      {
        uint64_t v398 = [v396 jsonRepresentation];
        v399 = @"trailHead";
      }
      else
      {
        uint64_t v398 = [v396 dictionaryRepresentation];
        v399 = @"trail_head";
      }
      id v400 = v398;

      [v4 setObject:v400 forKey:v399];
    }

    id v401 = *(id *)(a1 + 632);
    uint64_t v402 = v401;
    if (v401)
    {
      if (a2)
      {
        uint64_t v403 = [v401 jsonRepresentation];
        v404 = @"toolTip";
      }
      else
      {
        uint64_t v403 = [v401 dictionaryRepresentation];
        v404 = @"tool_tip";
      }
      id v405 = v403;

      [v4 setObject:v405 forKey:v404];
    }

    id v406 = *(id *)(a1 + 504);
    uint64_t v407 = v406;
    if (v406)
    {
      if (a2)
      {
        uint64_t v408 = [v406 jsonRepresentation];
        v409 = @"refreshId";
      }
      else
      {
        uint64_t v408 = [v406 dictionaryRepresentation];
        v409 = @"refresh_id";
      }
      id v410 = v408;

      [v4 setObject:v410 forKey:v409];
    }

    id v411 = *(id *)(a1 + 48);
    id v412 = v411;
    if (v411)
    {
      if (a2)
      {
        uint64_t v413 = [v411 jsonRepresentation];
        uint64_t v414 = @"addressWithComponents";
      }
      else
      {
        uint64_t v413 = [v411 dictionaryRepresentation];
        uint64_t v414 = @"address_with_components";
      }
      id v415 = v413;

      [v4 setObject:v415 forKey:v414];
    }

    id v416 = *(id *)(a1 + 544);
    uint64_t v417 = v416;
    if (v416)
    {
      if (a2)
      {
        v418 = [v416 jsonRepresentation];
        id v419 = @"searchResultPlacePhoto";
      }
      else
      {
        v418 = [v416 dictionaryRepresentation];
        id v419 = @"search_result_place_photo";
      }
      id v420 = v418;

      [v4 setObject:v420 forKey:v419];
    }

    id v421 = *(id *)(a1 + 248);
    uint64_t v422 = v421;
    if (v421)
    {
      if (a2)
      {
        v423 = [v421 jsonRepresentation];
        uint64_t v424 = @"forwardInfo";
      }
      else
      {
        v423 = [v421 dictionaryRepresentation];
        uint64_t v424 = @"forward_info";
      }
      id v425 = v423;

      [v4 setObject:v425 forKey:v424];
    }

    id v426 = *(id *)(a1 + 272);
    uint64_t v427 = v426;
    if (v426)
    {
      if (a2)
      {
        uint64_t v428 = [v426 jsonRepresentation];
        uint64_t v429 = @"hikeAssociatedInfo";
      }
      else
      {
        uint64_t v428 = [v426 dictionaryRepresentation];
        uint64_t v429 = @"hike_associated_info";
      }
      id v430 = v428;

      [v4 setObject:v430 forKey:v429];
    }

    id v431 = *(id *)(a1 + 288);
    v432 = v431;
    if (v431)
    {
      if (a2)
      {
        uint64_t v433 = [v431 jsonRepresentation];
        v434 = @"hikeSummary";
      }
      else
      {
        uint64_t v433 = [v431 dictionaryRepresentation];
        v434 = @"hike_summary";
      }
      id v435 = v433;

      [v4 setObject:v435 forKey:v434];
    }

    id v436 = *(id *)(a1 + 280);
    uint64_t v437 = v436;
    if (v436)
    {
      if (a2)
      {
        v438 = [v436 jsonRepresentation];
        uint64_t v439 = @"hikeGeometry";
      }
      else
      {
        v438 = [v436 dictionaryRepresentation];
        uint64_t v439 = @"hike_geometry";
      }
      id v440 = v438;

      [v4 setObject:v440 forKey:v439];
    }

    id v441 = *(void **)(a1 + 8);
    if (v441)
    {
      uint64_t v442 = [v441 dictionaryRepresentation];
      uint64_t v443 = v442;
      if (a2)
      {
        uint64_t v444 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v442, "count"));
        v449[0] = MEMORY[0x1E4F143A8];
        v449[1] = 3221225472;
        v449[2] = __49__GEOPDComponentValue__dictionaryRepresentation___block_invoke;
        v449[3] = &unk_1E53D8860;
        id v445 = v444;
        id v450 = v445;
        [v443 enumerateKeysAndObjectsUsingBlock:v449];
        id v446 = v445;

        uint64_t v443 = v446;
      }
      [v4 setObject:v443 forKey:@"Unknown Fields"];
    }
    id v447 = v4;
  }
  else
  {
    id v447 = 0;
  }

  return v447;
}

- (id)jsonRepresentation
{
  return -[GEOPDComponentValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDComponentValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentValueReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOPDEntity *)self->_entity hash];
  unint64_t v4 = [(GEOPDPlaceInfo *)self->_placeInfo hash] ^ v3;
  unint64_t v5 = [(GEOPDRoadAccessInfo *)self->_accessInfo hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPDBounds *)self->_bounds hash];
  unint64_t v7 = [(GEOPDAddress *)self->_address hash];
  unint64_t v8 = v7 ^ [(GEOPDRating *)self->_rating hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOPDReview *)self->_review hash];
  unint64_t v10 = [(GEOPDPhoto *)self->_photo hash];
  unint64_t v11 = v10 ^ [(GEOPDHours *)self->_hours hash];
  unint64_t v12 = v11 ^ [(GEOPDTransitInfo *)self->_transitInfo hash];
  unint64_t v13 = v9 ^ v12 ^ [(GEOPDTransitSchedule *)self->_transitSchedule hash];
  unint64_t v14 = [(GEOPDETA *)self->_eta hash];
  unint64_t v15 = v14 ^ [(GEOPDFlyover *)self->_flyover hash];
  unint64_t v16 = v15 ^ [(GEOPDRawAttribute *)self->_rawAttribute hash];
  unint64_t v17 = v13 ^ v16 ^ [(GEOPDAmenities *)self->_amenities hash];
  unint64_t v18 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  unint64_t v19 = v18 ^ [(GEOPDTransitIncident *)self->_transitIncident hash];
  unint64_t v20 = v19 ^ [(GEOPDTransitAssociatedInfo *)self->_transitAssociatedInfo hash];
  unint64_t v21 = v20 ^ [(GEOPDTextBlock *)self->_textBlock hash];
  unint64_t v22 = v21 ^ [(GEOPDFactoid *)self->_factoid hash];
  unint64_t v23 = v17 ^ v22 ^ [(GEOPDTransitAttribution *)self->_transitAttribution hash];
  unint64_t v24 = [(GEOPDBusinessClaim *)self->_businessClaim hash];
  unint64_t v25 = v24 ^ [(GEOPDCaptionedPhoto *)self->_captionedPhoto hash];
  unint64_t v26 = v25 ^ [(GEOPDTransitInfoSnippet *)self->_transitInfoSnippet hash];
  unint64_t v27 = v26 ^ [(GEOPDExternalAction *)self->_externalAction hash];
  unint64_t v28 = v27 ^ [(GEOPDResultSnippet *)self->_resultSnippet hash];
  unint64_t v29 = v28 ^ [(GEOPDAddressObject *)self->_addressObject hash];
  unint64_t v30 = v23 ^ v29 ^ [(GEOPDSimpleRestaurantMenuText *)self->_simpleRestaurantMenuText hash];
  unint64_t v31 = [(GEOPDRestaurantReservationLink *)self->_restaurantReservationLink hash];
  unint64_t v32 = v31 ^ [(GEOPDSpatialLookupResult *)self->_spatialLookupResult hash];
  unint64_t v33 = v32 ^ [(GEOPDTip *)self->_tip hash];
  unint64_t v34 = v33 ^ [(GEOPDPlacecardURL *)self->_placecardUrl hash];
  unint64_t v35 = v34 ^ [(GEOPDAssociatedApp *)self->_associatedApp hash];
  unint64_t v36 = v35 ^ [(GEOPDMessageLink *)self->_messageLink hash];
  unint64_t v37 = v36 ^ [(GEOPDQuickLink *)self->_quickLink hash];
  unint64_t v38 = v30 ^ v37 ^ [(GEOPDRap *)self->_rap hash];
  unint64_t v39 = [(GEOPDOfflineArea *)self->_offlineArea hash];
  unint64_t v40 = v39 ^ [(GEOPDLocationEvent *)self->_locationEvent hash];
  unint64_t v41 = v40 ^ [(GEOPDSupportsOfflineMaps *)self->_supportsOfflineMaps hash];
  unint64_t v42 = v41 ^ [(GEOPDVenueInfo *)self->_venueInfo hash];
  unint64_t v43 = v42 ^ [(GEOPDContainedPlace *)self->_containedPlace hash];
  unint64_t v44 = v43 ^ [(GEOPDWifiFingerprint *)self->_wifiFingerprint hash];
  unint64_t v45 = v44 ^ [(GEOPDIcon *)self->_icon hash];
  unint64_t v46 = v38 ^ v45 ^ [(GEOPDPriceDescription *)self->_priceDescription hash];
  unint64_t v47 = [(GEOPDBrowseCategories *)self->_browseCategories hash];
  unint64_t v48 = v47 ^ [(GEOPDStorefront *)self->_storefront hash];
  unint64_t v49 = v48 ^ [(GEOPDGroundViewLabel *)self->_groundViewLabel hash];
  unint64_t v50 = v49 ^ [(GEOPDAnnotatedItemList *)self->_annotatedItemList hash];
  unint64_t v51 = v50 ^ [(GEOPDPoiEvent *)self->_poiEvent hash];
  unint64_t v52 = v51 ^ [(GEOPDStorefrontPresentation *)self->_storefrontPresentation hash];
  unint64_t v53 = v52 ^ [(GEOPDPlacecardLayoutConfiguration *)self->_placecardLayoutConfiguration hash];
  unint64_t v54 = v53 ^ [(GEOPDPrototypeContainer *)self->_prototypeContainer hash];
  unint64_t v55 = v54 ^ [(GEOPBTransitVehiclePosition *)self->_transitVehiclePosition hash];
  unint64_t v56 = v46 ^ v55 ^ [(GEOPDLinkedService *)self->_linkedService hash];
  unint64_t v57 = [(GEOPDBusinessHours *)self->_businessHours hash];
  unint64_t v58 = v57 ^ [(GEOPDPlaceCollection *)self->_placeCollection hash];
  unint64_t v59 = v58 ^ [(GEOPDRelatedPlace *)self->_relatedPlace hash];
  unint64_t v60 = v59 ^ [(GEOPDTransitTripStop *)self->_transitTripStop hash];
  unint64_t v61 = v60 ^ [(GEOPDTransitTripStopTime *)self->_transitTripStopTime hash];
  unint64_t v62 = v61 ^ [(GEOPDTransitTripGeometry *)self->_transitTripGeometry hash];
  unint64_t v63 = v62 ^ [(GEOPDBrowseCategories *)self->_placeBrowseCategories hash];
  unint64_t v64 = v63 ^ [(GEOPDPublisher *)self->_publisher hash];
  unint64_t v65 = v64 ^ [(GEOPDMiniBrowseCategories *)self->_miniPlaceBrowseCategories hash];
  unint64_t v66 = v65 ^ [(GEOPDPlaceQuestionnaireResult *)self->_placeQuestionnaire hash];
  unint64_t v67 = v56 ^ v66 ^ [(GEOPDPlaceCollectionItem *)self->_placeCollectionItem hash];
  unint64_t v68 = [(GEOPDCollectionIds *)self->_collectionIds hash];
  unint64_t v69 = v68 ^ [(GEOPDISO3166Code *)self->_iso3166Code hash];
  unint64_t v70 = v69 ^ [(GEOPDAmenities *)self->_vendorAmenities hash];
  unint64_t v71 = v70 ^ [(GEOPDTransitNearbySchedule *)self->_transitNearbySchedule hash];
  unint64_t v72 = v71 ^ [(GEOPDStorefrontFaces *)self->_storefrontFaces hash];
  unint64_t v73 = v72 ^ [(GEOPDGuideGroup *)self->_guideGroup hash];
  unint64_t v74 = v73 ^ [(GEOPDContainmentPlace *)self->_containmentPlace hash];
  unint64_t v75 = v74 ^ [(GEOPDCategorizedPhotos *)self->_categorizedPhotos hash];
  unint64_t v76 = v75 ^ [(GEOPDExploreGuides *)self->_exploreGuides hash];
  unint64_t v77 = v76 ^ [(GEOPDAbout *)self->_about hash];
  unint64_t v78 = v77 ^ [(GEOPDLabelGeometry *)self->_labelGeometry hash];
  unint64_t v79 = v67 ^ v78 ^ [(GEOPDEnhancedPlacement *)self->_enhancedPlacement hash];
  unint64_t v80 = [(GEOPDTemplatePlace *)self->_templatePlace hash];
  unint64_t v81 = v80 ^ [(GEOPDTransitPaymentMethodInfo *)self->_transitPaymentMethodInfo hash];
  unint64_t v82 = v81 ^ [(GEOPDBusinessAssets *)self->_businessAssets hash];
  unint64_t v83 = v82 ^ [(GEOPDEnrichmentInfo *)self->_enrichmentInfo hash];
  unint64_t v84 = v83 ^ [(GEOPDActionData *)self->_actionData hash];
  unint64_t v85 = v84 ^ [(GEOPDEnrichmentData *)self->_enrichmentData hash];
  unint64_t v86 = v85 ^ [(GEOPDPOIClaim *)self->_poiClaim hash];
  unint64_t v87 = v86 ^ [(GEOPDEVCharger *)self->_evCharger hash];
  unint64_t v88 = v87 ^ [(GEOPDTrailHead *)self->_trailHead hash];
  unint64_t v89 = v88 ^ [(GEOPDTooltip *)self->_toolTip hash];
  unint64_t v90 = v89 ^ [(GEOPDRefreshId *)self->_refreshId hash];
  unint64_t v91 = v90 ^ [(GEOPDAddressWithComponents *)self->_addressWithComponents hash];
  unint64_t v92 = v79 ^ v91 ^ [(GEOPDSearchResultPlacePhoto *)self->_searchResultPlacePhoto hash];
  unint64_t v93 = [(GEOPDForwardInfo *)self->_forwardInfo hash];
  unint64_t v94 = v93 ^ [(GEOPDHikeAssociatedInfo *)self->_hikeAssociatedInfo hash];
  unint64_t v95 = v94 ^ [(GEOPDHikeSummary *)self->_hikeSummary hash];
  return v92 ^ v95 ^ [(GEOPDHikeGeometry *)self->_hikeGeometry hash];
}

@end