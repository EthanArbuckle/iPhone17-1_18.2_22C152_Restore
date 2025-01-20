@interface GEOTargetLayout
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLayoutInfo;
- (BOOL)hasLayoutStyle;
- (BOOL)hasUiTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTargetLayout)initWithDictionary:(id)a3;
- (GEOTargetLayout)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layoutInfoAsString:(int)a3;
- (id)layoutStyleAsString:(int)a3;
- (id)uiTargetAsString:(int)a3;
- (int)StringAsLayoutInfo:(id)a3;
- (int)StringAsLayoutStyle:(id)a3;
- (int)StringAsUiTarget:(id)a3;
- (int)layoutInfo;
- (int)layoutStyle;
- (int)uiTarget;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLayoutInfo:(BOOL)a3;
- (void)setHasLayoutStyle:(BOOL)a3;
- (void)setHasUiTarget:(BOOL)a3;
- (void)setLayoutInfo:(int)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setUiTarget:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTargetLayout

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"uiTarget";
      }
      else {
        v6 = @"ui_target";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"UI_TARGET_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_POI"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_SEARCH_RESULT_LIST"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_POPULAR_NEARBY_LIST"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_CALLOUT"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_SEARCH_PIN"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_DROPPED_PIN"])
        {
          uint64_t v9 = 6;
        }
        else if ([v8 isEqualToString:@"UI_TARGET_TRANSIT_LINE"])
        {
          uint64_t v9 = 7;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY"])
        {
          uint64_t v9 = 8;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY_BROWSE"])
        {
          uint64_t v9 = 9;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY_POPULAR_NEARBY"])
        {
          uint64_t v9 = 10;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY_AC"])
        {
          uint64_t v9 = 11;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY_AC_INTERMEDIATE"])
        {
          uint64_t v9 = 12;
        }
        else if ([v8 isEqualToString:@"SEARCH_TRAY_NO_QUERY"])
        {
          uint64_t v9 = 13;
        }
        else if ([v8 isEqualToString:@"AR_WALKING_LEGAL_TRAY"])
        {
          uint64_t v9 = 14;
        }
        else if ([v8 isEqualToString:@"RAISE_TO_START_AR_TRAY"])
        {
          uint64_t v9 = 15;
        }
        else if ([v8 isEqualToString:@"EVENTS_ADVISORY_DETAILS_PAGE"])
        {
          uint64_t v9 = 16;
        }
        else if ([v8 isEqualToString:@"INCIDENT_REPORT_TRAY_CARPLAY"])
        {
          uint64_t v9 = 17;
        }
        else if ([v8 isEqualToString:@"HIGHLIGHTED_AREA"])
        {
          uint64_t v9 = 18;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTIONS_HOME"])
        {
          uint64_t v9 = 19;
        }
        else if ([v8 isEqualToString:@"TRAVEL_PREFERENCES_TRAY"])
        {
          uint64_t v9 = 20;
        }
        else if ([v8 isEqualToString:@"RESULT_TRAY_SEARCH"])
        {
          uint64_t v9 = 21;
        }
        else if ([v8 isEqualToString:@"SINGLE_CARD_FILTER"])
        {
          uint64_t v9 = 22;
        }
        else if ([v8 isEqualToString:@"FULL_CARD_FILTER"])
        {
          uint64_t v9 = 23;
        }
        else if ([v8 isEqualToString:@"ACCOUNT_PRIVACY_TRAY"])
        {
          uint64_t v9 = 24;
        }
        else if ([v8 isEqualToString:@"APPLE_RATINGS_HISTORY_TRAY"])
        {
          uint64_t v9 = 25;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTIONS_HOME_FILTERED"])
        {
          uint64_t v9 = 26;
        }
        else if ([v8 isEqualToString:@"CITY_MENU"])
        {
          uint64_t v9 = 27;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED"])
        {
          uint64_t v9 = 28;
        }
        else if ([v8 isEqualToString:@"ACCOUNT_TRAY"])
        {
          uint64_t v9 = 29;
        }
        else if ([v8 isEqualToString:@"QUICK_ACTION_TRAY"])
        {
          uint64_t v9 = 30;
        }
        else if ([v8 isEqualToString:@"SUBMIT_TRIP_FEEDBACK"])
        {
          uint64_t v9 = 31;
        }
        else if ([v8 isEqualToString:@"RAP_PLACE_ISSUE_DETAILS"])
        {
          uint64_t v9 = 32;
        }
        else if ([v8 isEqualToString:@"RAP_GUIDES_DETAILS"])
        {
          uint64_t v9 = 33;
        }
        else if ([v8 isEqualToString:@"RAP_BAD_DIRECTIONS_DETAILS"])
        {
          uint64_t v9 = 34;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_MAP_DETAILS"])
        {
          uint64_t v9 = 35;
        }
        else if ([v8 isEqualToString:@"WATCH_COMPLICATION"])
        {
          uint64_t v9 = 36;
        }
        else if ([v8 isEqualToString:@"RAP_NAV_MENU"])
        {
          uint64_t v9 = 37;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_ALIGHT_BANNER_TRANSIT"])
        {
          uint64_t v9 = 38;
        }
        else if ([v8 isEqualToString:@"RAP_REPORT_MENU"])
        {
          uint64_t v9 = 39;
        }
        else if ([v8 isEqualToString:@"RAP_CURATED_COLLECTION_MENU"])
        {
          uint64_t v9 = 40;
        }
        else if ([v8 isEqualToString:@"RAP_REPORT_CARD_DETAILS"])
        {
          uint64_t v9 = 41;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_NO_LOCATION_TRANSIT"])
        {
          uint64_t v9 = 42;
        }
        else if ([v8 isEqualToString:@"RAP_STREET_ISSUE_DETAILS"])
        {
          uint64_t v9 = 43;
        }
        else if ([v8 isEqualToString:@"NEARBY_TRANSIT_CARD"])
        {
          uint64_t v9 = 44;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_MENU"])
        {
          uint64_t v9 = 45;
        }
        else if ([v8 isEqualToString:@"GENERIC_ADVISORY_PAGE"])
        {
          uint64_t v9 = 46;
        }
        else if ([v8 isEqualToString:@"USER_PROFILE_TRAY"])
        {
          uint64_t v9 = 47;
        }
        else if ([v8 isEqualToString:@"MEDIA_APP_MENU"])
        {
          uint64_t v9 = 48;
        }
        else if ([v8 isEqualToString:@"TEMPLATE_PLACE_TRAY"])
        {
          uint64_t v9 = 49;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_RAP"])
        {
          uint64_t v9 = 50;
        }
        else if ([v8 isEqualToString:@"ALLOW_NOTIFICATION_DIALOG"])
        {
          uint64_t v9 = 51;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_DRIVING"])
        {
          uint64_t v9 = 52;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_ARP"])
        {
          uint64_t v9 = 53;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED"])
        {
          uint64_t v9 = 54;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CONSENT_PROMPT"])
        {
          uint64_t v9 = 55;
        }
        else if ([v8 isEqualToString:@"QUICK_ACTION_TRAY_VENDORS_MENU"])
        {
          uint64_t v9 = 56;
        }
        else if ([v8 isEqualToString:@"PLACECARD_TRAY_VENDORS_MENU"])
        {
          uint64_t v9 = 57;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_SEARCH_ROUTE_PLANNING"])
        {
          uint64_t v9 = 58;
        }
        else if ([v8 isEqualToString:@"SEARCH_ALONG_ROUTE_TRAY"])
        {
          uint64_t v9 = 59;
        }
        else if ([v8 isEqualToString:@"MAP_RESULTS_SEARCH_ROUTE_PLANNING"])
        {
          uint64_t v9 = 60;
        }
        else if ([v8 isEqualToString:@"PLACECARD_SHOWCASE_MENU"])
        {
          uint64_t v9 = 61;
        }
        else if ([v8 isEqualToString:@"RAP_INLINE_ADD_DETAILS"])
        {
          uint64_t v9 = 62;
        }
        else if ([v8 isEqualToString:@"RAP_EDIT_MENU_DETAILS"])
        {
          uint64_t v9 = 63;
        }
        else if ([v8 isEqualToString:@"RAP_SUBMISSION_PROMPT"])
        {
          uint64_t v9 = 64;
        }
        else if ([v8 isEqualToString:@"RAP_PLACECARD_EDIT_MENU"])
        {
          uint64_t v9 = 65;
        }
        else if ([v8 isEqualToString:@"ARP_SUBMISSION_CONFIRMATION_PAGE"])
        {
          uint64_t v9 = 66;
        }
        else if ([v8 isEqualToString:@"INCIDENT_REPORT_MENU"])
        {
          uint64_t v9 = 67;
        }
        else if ([v8 isEqualToString:@"RAP_SELECT_BAD_ROUTES_STEPS"])
        {
          uint64_t v9 = 68;
        }
        else if ([v8 isEqualToString:@"RAP_SELECT_BAD_ROUTES"])
        {
          uint64_t v9 = 69;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_RESUME_ROUTE"])
        {
          uint64_t v9 = 70;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
        {
          uint64_t v9 = 71;
        }
        else if ([v8 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY_LIST"])
        {
          uint64_t v9 = 72;
        }
        else if ([v8 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY"])
        {
          uint64_t v9 = 73;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_ARP"])
        {
          uint64_t v9 = 74;
        }
        else if ([v8 isEqualToString:@"IMPROVE_LOCATION_ACCURACY_PROMPT"])
        {
          uint64_t v9 = 75;
        }
        else if ([v8 isEqualToString:@"YOUR_PHOTOS_ALBUM"])
        {
          uint64_t v9 = 76;
        }
        else if ([v8 isEqualToString:@"ARP_PHOTO_CREDIT"])
        {
          uint64_t v9 = 77;
        }
        else if ([v8 isEqualToString:@"RAP_OUTREACH_REVIEWED_REPORT"])
        {
          uint64_t v9 = 78;
        }
        else if ([v8 isEqualToString:@"RAP_REPORT_MENU_MORE"])
        {
          uint64_t v9 = 79;
        }
        else if ([v8 isEqualToString:@"WATCH_MAPS_SETTINGS"])
        {
          uint64_t v9 = 80;
        }
        else if ([v8 isEqualToString:@"OFFLINE_FEATURE_PROMPT"])
        {
          uint64_t v9 = 81;
        }
        else if ([v8 isEqualToString:@"EXPIRED_MAPS_DETAILS"])
        {
          uint64_t v9 = 82;
        }
        else if ([v8 isEqualToString:@"MAPS_VIEW"])
        {
          uint64_t v9 = 83;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_OFFLINE"])
        {
          uint64_t v9 = 84;
        }
        else if ([v8 isEqualToString:@"EXPIRED_MAPS_MANAGEMENT"])
        {
          uint64_t v9 = 85;
        }
        else if ([v8 isEqualToString:@"OFFLINE_NEW_MAPS_MANAGEMENT"])
        {
          uint64_t v9 = 86;
        }
        else if ([v8 isEqualToString:@"EDIT_EXPIRED_MAPS_MANAGEMENT"])
        {
          uint64_t v9 = 87;
        }
        else if ([v8 isEqualToString:@"OFFLINE_MAPS_MANAGEMENT"])
        {
          uint64_t v9 = 88;
        }
        else if ([v8 isEqualToString:@"REGION_SELECTOR"])
        {
          uint64_t v9 = 89;
        }
        else if ([v8 isEqualToString:@"OFFLINE_SUGGESTED_MAPS_MANAGEMENT"])
        {
          uint64_t v9 = 90;
        }
        else if ([v8 isEqualToString:@"FIND_MY_ETA_SHARING_TRAY"])
        {
          uint64_t v9 = 91;
        }
        else if ([v8 isEqualToString:@"WATCH_PLACE"])
        {
          uint64_t v9 = 92;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL"])
        {
          uint64_t v9 = 93;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_MAP"])
        {
          uint64_t v9 = 94;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_CONTROLS"])
        {
          uint64_t v9 = 95;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_CONTROLS"])
        {
          uint64_t v9 = 96;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL"])
        {
          uint64_t v9 = 97;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TRANSIT_CONTROLS"])
        {
          uint64_t v9 = 98;
        }
        else if ([v8 isEqualToString:@"WATCH_SEARCH_RESULTS_CAROUSEL"])
        {
          uint64_t v9 = 99;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_DRIVING_CONTROLS"])
        {
          uint64_t v9 = 100;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_SEARCH"])
        {
          uint64_t v9 = 101;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_BROWSE"])
        {
          uint64_t v9 = 102;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_FAVORITES"])
        {
          uint64_t v9 = 103;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_SEARCH_ALONG_ROUTE"])
        {
          uint64_t v9 = 104;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_CLUSTER"])
        {
          uint64_t v9 = 105;
        }
        else if ([v8 isEqualToString:@"RESULTS_TRAY_VENUE_BROWSE"])
        {
          uint64_t v9 = 106;
        }
        else if ([v8 isEqualToString:@"WATCH_MAP_RESULTS"])
        {
          uint64_t v9 = 107;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_ELEVATION_VIEW"])
        {
          uint64_t v9 = 108;
        }
        else if ([v8 isEqualToString:@"WATCH_PLACES"])
        {
          uint64_t v9 = 109;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_ELEVATION_VIEW"])
        {
          uint64_t v9 = 110;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL"])
        {
          uint64_t v9 = 111;
        }
        else if ([v8 isEqualToString:@"DOWNLOADED_MAPS_DETAILS"])
        {
          uint64_t v9 = 112;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL"])
        {
          uint64_t v9 = 113;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TRANSIT_OVERVIEW_MAP"])
        {
          uint64_t v9 = 114;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_OVERVIEW_MAP"])
        {
          uint64_t v9 = 115;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_OVERVIEW_MAP"])
        {
          uint64_t v9 = 116;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_OPTIONS"])
        {
          uint64_t v9 = 117;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_DRIVING_OVERVIEW_MAP"])
        {
          uint64_t v9 = 118;
        }
        else if ([v8 isEqualToString:@"WATCH_MORE_GUIDES"])
        {
          uint64_t v9 = 119;
        }
        else if ([v8 isEqualToString:@"WATCH_RECENTLY_VIEWED"])
        {
          uint64_t v9 = 120;
        }
        else if ([v8 isEqualToString:@"EV_SUCCESS_TRAY"])
        {
          uint64_t v9 = 121;
        }
        else if ([v8 isEqualToString:@"PREFERRED_NETWORK_SELECTION_TRAY"])
        {
          uint64_t v9 = 122;
        }
        else if ([v8 isEqualToString:@"PREFERRED_NETWORK_TRAY"])
        {
          uint64_t v9 = 123;
        }
        else if ([v8 isEqualToString:@"WALKING_TRANSITION_SUGGESTION_TRAY"])
        {
          uint64_t v9 = 124;
        }
        else if ([v8 isEqualToString:@"FINDMY_TRANSITION_SUGGESTION_TRAY"])
        {
          uint64_t v9 = 125;
        }
        else if ([v8 isEqualToString:@"CARPLAY_FIND_MY_ETA_SHARING_TRAY"])
        {
          uint64_t v9 = 126;
        }
        else if ([v8 isEqualToString:@"AC_KEYBOARD_TRAY"])
        {
          uint64_t v9 = 127;
        }
        else if ([v8 isEqualToString:@"MORE_RELATED_TRAILS"])
        {
          uint64_t v9 = 128;
        }
        else if ([v8 isEqualToString:@"MORE_RELATED_TRAILHEADS"])
        {
          uint64_t v9 = 129;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_CUSTOM_ROUTE"])
        {
          uint64_t v9 = 130;
        }
        else if ([v8 isEqualToString:@"CUSTOM_ROUTE_CREATION_TRAY"])
        {
          uint64_t v9 = 131;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE"])
        {
          uint64_t v9 = 132;
        }
        else if ([v8 isEqualToString:@"MORE_CURATED_HIKES"])
        {
          uint64_t v9 = 133;
        }
        else if ([v8 isEqualToString:@"CUSTOM_ROUTE_ONBOARDING"])
        {
          uint64_t v9 = 134;
        }
        else if ([v8 isEqualToString:@"LIBRARY_ROUTES"])
        {
          uint64_t v9 = 135;
        }
        else if ([v8 isEqualToString:@"HIKING_TRANSITION_SUGGESTION_TRAY"])
        {
          uint64_t v9 = 136;
        }
        else if ([v8 isEqualToString:@"MY_LIBRARY"])
        {
          uint64_t v9 = 137;
        }
        else if ([v8 isEqualToString:@"EDIT_NOTE_TRAY"])
        {
          uint64_t v9 = 138;
        }
        else if ([v8 isEqualToString:@"CREATE_NOTE_TRAY"])
        {
          uint64_t v9 = 139;
        }
        else if ([v8 isEqualToString:@"LIBRARY_PLACES"])
        {
          uint64_t v9 = 140;
        }
        else if ([v8 isEqualToString:@"WATCH_ACCOUNT"])
        {
          uint64_t v9 = 141;
        }
        else if ([v8 isEqualToString:@"WATCH_DOWNLOADED_MAPS"])
        {
          uint64_t v9 = 142;
        }
        else if ([v8 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION_LIST"])
        {
          uint64_t v9 = 143;
        }
        else if ([v8 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION"])
        {
          uint64_t v9 = 144;
        }
        else if ([v8 isEqualToString:@"VISUAL_INTELLIGENCE_SNIPPET"])
        {
          uint64_t v9 = 145;
        }
        else if ([v8 isEqualToString:@"PLACECARD_TRAY"])
        {
          uint64_t v9 = 201;
        }
        else if ([v8 isEqualToString:@"WEB_MODULE"])
        {
          uint64_t v9 = 202;
        }
        else if ([v8 isEqualToString:@"ADD_FAVORITE_TRAY"])
        {
          uint64_t v9 = 250;
        }
        else if ([v8 isEqualToString:@"COLLECTION_LIST"])
        {
          uint64_t v9 = 251;
        }
        else if ([v8 isEqualToString:@"COLLECTION_VIEW"])
        {
          uint64_t v9 = 252;
        }
        else if ([v8 isEqualToString:@"FAVORITE_DETAILS"])
        {
          uint64_t v9 = 253;
        }
        else if ([v8 isEqualToString:@"FAVORITES_TRAY"])
        {
          uint64_t v9 = 254;
        }
        else if ([v8 isEqualToString:@"SHARED_COLLECTION"])
        {
          uint64_t v9 = 255;
        }
        else if ([v8 isEqualToString:@"SHARED_COLLECTION_VIEW"])
        {
          uint64_t v9 = 256;
        }
        else if ([v8 isEqualToString:@"RECENTLY_VIEWED"])
        {
          uint64_t v9 = 257;
        }
        else if ([v8 isEqualToString:@"SHARED_WEB_COLLECTION"])
        {
          uint64_t v9 = 258;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTION_VIEW"])
        {
          uint64_t v9 = 259;
        }
        else if ([v8 isEqualToString:@"FEATURED_COLLECTIONS"])
        {
          uint64_t v9 = 260;
        }
        else if ([v8 isEqualToString:@"PUBLISHER_TRAY"])
        {
          uint64_t v9 = 261;
        }
        else if ([v8 isEqualToString:@"SHARED_CURATED_COLLECTION_VIEW"])
        {
          uint64_t v9 = 262;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTION_NOTIFICATION"])
        {
          uint64_t v9 = 263;
        }
        else if ([v8 isEqualToString:@"CURATED_COLLECTION_LIST"])
        {
          uint64_t v9 = 264;
        }
        else if ([v8 isEqualToString:@"PUBLISHER_LIST"])
        {
          uint64_t v9 = 265;
        }
        else if ([v8 isEqualToString:@"WATCH_CURATED_COLLECTION_VIEW"])
        {
          uint64_t v9 = 266;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_SUBLIST"])
        {
          uint64_t v9 = 267;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST"])
        {
          uint64_t v9 = 268;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_DRIVING"])
        {
          uint64_t v9 = 301;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_WALKING"])
        {
          uint64_t v9 = 302;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_TRANSIT"])
        {
          uint64_t v9 = 303;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE"])
        {
          uint64_t v9 = 304;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_CYCLING"])
        {
          uint64_t v9 = 305;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW"])
        {
          uint64_t v9 = 306;
        }
        else if ([v8 isEqualToString:@"NAV_TRAY_DRIVING"])
        {
          uint64_t v9 = 401;
        }
        else if ([v8 isEqualToString:@"NAV_TRAY_WALKING"])
        {
          uint64_t v9 = 402;
        }
        else if ([v8 isEqualToString:@"NAV_TRAY_TRANSIT"])
        {
          uint64_t v9 = 403;
        }
        else if ([v8 isEqualToString:@"NAV_TRAY_CYCLING"])
        {
          uint64_t v9 = 404;
        }
        else if ([v8 isEqualToString:@"MAP_PLACECARD"])
        {
          uint64_t v9 = 501;
        }
        else if ([v8 isEqualToString:@"MAP_SEARCH"])
        {
          uint64_t v9 = 502;
        }
        else if ([v8 isEqualToString:@"MAP_RESULTS"])
        {
          uint64_t v9 = 503;
        }
        else if ([v8 isEqualToString:@"MAP_ROUTING"])
        {
          uint64_t v9 = 504;
        }
        else if ([v8 isEqualToString:@"MAP_NAV"])
        {
          uint64_t v9 = 505;
        }
        else if ([v8 isEqualToString:@"MAP_RESULTS_SEARCH_ALONG_ROUTE"])
        {
          uint64_t v9 = 506;
        }
        else if ([v8 isEqualToString:@"MAP_TRAFFIC_INCIDENT"])
        {
          uint64_t v9 = 507;
        }
        else if ([v8 isEqualToString:@"MAP_FULL_SCREEN"])
        {
          uint64_t v9 = 508;
        }
        else if ([v8 isEqualToString:@"MAP_DRIVE"])
        {
          uint64_t v9 = 509;
        }
        else if ([v8 isEqualToString:@"MAP_LAUNCH_AND_GO"])
        {
          uint64_t v9 = 510;
        }
        else if ([v8 isEqualToString:@"MAP_VIEW"])
        {
          uint64_t v9 = 511;
        }
        else if ([v8 isEqualToString:@"MAPS_SETTINGS"])
        {
          uint64_t v9 = 601;
        }
        else if ([v8 isEqualToString:@"MAPS_PREFERENCES"])
        {
          uint64_t v9 = 602;
        }
        else if ([v8 isEqualToString:@"RAP"])
        {
          uint64_t v9 = 603;
        }
        else if ([v8 isEqualToString:@"ROUTING_DRIVING_DETAILS"])
        {
          uint64_t v9 = 604;
        }
        else if ([v8 isEqualToString:@"ROUTING_WALKING_DETAILS"])
        {
          uint64_t v9 = 605;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRANSIT_DETAILS"])
        {
          uint64_t v9 = 606;
        }
        else if ([v8 isEqualToString:@"ROUTING_EDITOR"])
        {
          uint64_t v9 = 607;
        }
        else if ([v8 isEqualToString:@"NAV_DRIVING_DETAILS"])
        {
          uint64_t v9 = 608;
        }
        else if ([v8 isEqualToString:@"NAV_WALKING_DETAILS"])
        {
          uint64_t v9 = 609;
        }
        else if ([v8 isEqualToString:@"NAV_TRANSIT_DETAILS"])
        {
          uint64_t v9 = 610;
        }
        else if ([v8 isEqualToString:@"NAV_AUDIO_SETTINGS"])
        {
          uint64_t v9 = 611;
        }
        else if ([v8 isEqualToString:@"PHOTO_VIEWER_ALL"])
        {
          uint64_t v9 = 612;
        }
        else if ([v8 isEqualToString:@"PHOTO_VIEWER_SINGLE"])
        {
          uint64_t v9 = 613;
        }
        else if ([v8 isEqualToString:@"ROUTE_OPTIONS_TRANSIT"])
        {
          uint64_t v9 = 614;
        }
        else if ([v8 isEqualToString:@"TRAFFIC_INCIDENT_TRAY"])
        {
          uint64_t v9 = 615;
        }
        else if ([v8 isEqualToString:@"NAV_DIRECTIONS_BANNER_DRIVING"])
        {
          uint64_t v9 = 616;
        }
        else if ([v8 isEqualToString:@"NAV_DIRECTIONS_BANNER_WALKING"])
        {
          uint64_t v9 = 617;
        }
        else if ([v8 isEqualToString:@"NAV_DIRECTIONS_BANNER_TRANSIT"])
        {
          uint64_t v9 = 618;
        }
        else if ([v8 isEqualToString:@"REFINE_SEARCH_SUGGESTION_AREA"])
        {
          uint64_t v9 = 619;
        }
        else if ([v8 isEqualToString:@"ADD_PHOTO_SHEET"])
        {
          uint64_t v9 = 620;
        }
        else if ([v8 isEqualToString:@"ADD_PLACE_SHEET"])
        {
          uint64_t v9 = 621;
        }
        else if ([v8 isEqualToString:@"SHARE_SHEET"])
        {
          uint64_t v9 = 622;
        }
        else if ([v8 isEqualToString:@"EDIT_LOCATION_SHEET"])
        {
          uint64_t v9 = 623;
        }
        else if ([v8 isEqualToString:@"ADD_CONTACT_SHEET"])
        {
          uint64_t v9 = 624;
        }
        else if ([v8 isEqualToString:@"EDIT_NAME_SHEET"])
        {
          uint64_t v9 = 625;
        }
        else if ([v8 isEqualToString:@"DRIVING_NAV_SETTINGS"])
        {
          uint64_t v9 = 626;
        }
        else if ([v8 isEqualToString:@"TRANSIT_SETTINGS"])
        {
          uint64_t v9 = 627;
        }
        else if ([v8 isEqualToString:@"TRANSIT_ADVISORY_SHEET"])
        {
          uint64_t v9 = 628;
        }
        else if ([v8 isEqualToString:@"REMOVE_CAR_SHEET"])
        {
          uint64_t v9 = 629;
        }
        else if ([v8 isEqualToString:@"ROUTE_OPTIONS_DRIVING"])
        {
          uint64_t v9 = 630;
        }
        else if ([v8 isEqualToString:@"ROUTE_OPTIONS_DATETIME"])
        {
          uint64_t v9 = 631;
        }
        else if ([v8 isEqualToString:@"TRANSIT_ADVISORY_BANNER"])
        {
          uint64_t v9 = 632;
        }
        else if ([v8 isEqualToString:@"BOOK_TABLE_SELECT_TIME"])
        {
          uint64_t v9 = 633;
        }
        else if ([v8 isEqualToString:@"BOOK_TABLE_MORE_OPTIONS"])
        {
          uint64_t v9 = 634;
        }
        else if ([v8 isEqualToString:@"BOOK_TABLE_READY"])
        {
          uint64_t v9 = 635;
        }
        else if ([v8 isEqualToString:@"BOOK_TABLE_BOOKED"])
        {
          uint64_t v9 = 636;
        }
        else if ([v8 isEqualToString:@"TRANSIT_LINE_CLUSTER_SHEET"])
        {
          uint64_t v9 = 637;
        }
        else if ([v8 isEqualToString:@"TRANSIT_LINE_LIST_SHEET"])
        {
          uint64_t v9 = 638;
        }
        else if ([v8 isEqualToString:@"TRANSIT_BALANCE_BANNER"])
        {
          uint64_t v9 = 639;
        }
        else if ([v8 isEqualToString:@"WEATHER_ICON"])
        {
          uint64_t v9 = 640;
        }
        else if ([v8 isEqualToString:@"HELP_IMPROVE_MAPS_DIALOG"])
        {
          uint64_t v9 = 641;
        }
        else if ([v8 isEqualToString:@"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG"])
        {
          uint64_t v9 = 642;
        }
        else if ([v8 isEqualToString:@"COMMUTE_PREDICTION_ACCURACY_DIALOG"])
        {
          uint64_t v9 = 643;
        }
        else if ([v8 isEqualToString:@"FLOOR_PICKER"])
        {
          uint64_t v9 = 644;
        }
        else if ([v8 isEqualToString:@"VENUE_LIST"])
        {
          uint64_t v9 = 645;
        }
        else if ([v8 isEqualToString:@"AR_MODE"])
        {
          uint64_t v9 = 646;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRANSIT_TICKETS_SHEET"])
        {
          uint64_t v9 = 647;
        }
        else if ([v8 isEqualToString:@"LINKED_SERVICE_HOURS"])
        {
          uint64_t v9 = 648;
        }
        else if ([v8 isEqualToString:@"SHARE_ETA_TRAY"])
        {
          uint64_t v9 = 649;
        }
        else if ([v8 isEqualToString:@"ETA_UPDATE_TRAY"])
        {
          uint64_t v9 = 650;
        }
        else if ([v8 isEqualToString:@"SCHEDULECARD_TRAY"])
        {
          uint64_t v9 = 651;
        }
        else if ([v8 isEqualToString:@"AR_NAV"])
        {
          uint64_t v9 = 652;
        }
        else if ([v8 isEqualToString:@"TAP_TRANSIT_ACCESS_POINT"])
        {
          uint64_t v9 = 653;
        }
        else if ([v8 isEqualToString:@"LOCATIONS_INSIDE"])
        {
          uint64_t v9 = 654;
        }
        else if ([v8 isEqualToString:@"SIMILAR_LOCATIONS"])
        {
          uint64_t v9 = 655;
        }
        else if ([v8 isEqualToString:@"LOCATIONS_AT_ADDRESS"])
        {
          uint64_t v9 = 656;
        }
        else if ([v8 isEqualToString:@"NAV_DIRECTIONS_BANNER_CYCLING"])
        {
          uint64_t v9 = 657;
        }
        else if ([v8 isEqualToString:@"ROUTE_OPTIONS_CYCLING"])
        {
          uint64_t v9 = 658;
        }
        else if ([v8 isEqualToString:@"EV_CONNECTION_TRAY"])
        {
          uint64_t v9 = 659;
        }
        else if ([v8 isEqualToString:@"VIRTUAL_GARAGE"])
        {
          uint64_t v9 = 660;
        }
        else if ([v8 isEqualToString:@"VIRTUAL_GARAGE_BANNER"])
        {
          uint64_t v9 = 661;
        }
        else if ([v8 isEqualToString:@"VIRTUAL_GARAGE_VEHICLE_VIEW"])
        {
          uint64_t v9 = 662;
        }
        else if ([v8 isEqualToString:@"ADVISORY_DETAILS_PAGE"])
        {
          uint64_t v9 = 663;
        }
        else if ([v8 isEqualToString:@"APP_CLIP_NOTIFICATION"])
        {
          uint64_t v9 = 664;
        }
        else if ([v8 isEqualToString:@"PHOTO_VIEWER_GALLERY"])
        {
          uint64_t v9 = 665;
        }
        else if ([v8 isEqualToString:@"RECOMMENDATION_CARD"])
        {
          uint64_t v9 = 666;
        }
        else if ([v8 isEqualToString:@"INCIDENT_REPORT_TRAY"])
        {
          uint64_t v9 = 667;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_DISPLAY"])
        {
          uint64_t v9 = 668;
        }
        else if ([v8 isEqualToString:@"VISUAL_LOCATION_FRAMEWORK"])
        {
          uint64_t v9 = 669;
        }
        else if ([v8 isEqualToString:@"APP_CLIP_TRAY"])
        {
          uint64_t v9 = 670;
        }
        else if ([v8 isEqualToString:@"LICENSE_PLATE_SUGGESTION_PAGE"])
        {
          uint64_t v9 = 671;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_ADD_PLATE"])
        {
          uint64_t v9 = 672;
        }
        else if ([v8 isEqualToString:@"MAPS_RESULTS"])
        {
          uint64_t v9 = 673;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_APP_CONNECTION"])
        {
          uint64_t v9 = 674;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_CURRENT_LOCATION"])
        {
          uint64_t v9 = 675;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_CURRENT_NAV"])
        {
          uint64_t v9 = 676;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_ETA"])
        {
          uint64_t v9 = 677;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_TRANSIT"])
        {
          uint64_t v9 = 678;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_UPC_DESTINATION"])
        {
          uint64_t v9 = 679;
        }
        else if ([v8 isEqualToString:@"WIDGET_CREATION_TRAY"])
        {
          uint64_t v9 = 680;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_HOME"])
        {
          uint64_t v9 = 681;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_PARKED_CAR"])
        {
          uint64_t v9 = 682;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_POI"])
        {
          uint64_t v9 = 683;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_SCHOOL"])
        {
          uint64_t v9 = 684;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_WORK"])
        {
          uint64_t v9 = 685;
        }
        else if ([v8 isEqualToString:@"AIRPORT_NOTIFICATION"])
        {
          uint64_t v9 = 686;
        }
        else if ([v8 isEqualToString:@"MAPS_WIDGET_EMPTY"])
        {
          uint64_t v9 = 687;
        }
        else if ([v8 isEqualToString:@"COARSE_LOCATION_OPTIONS_PROMPT"])
        {
          uint64_t v9 = 688;
        }
        else if ([v8 isEqualToString:@"ALLOW_PRECISE_LOCATION_PROMPT"])
        {
          uint64_t v9 = 689;
        }
        else if ([v8 isEqualToString:@"SHARE_MY_LOCATION"])
        {
          uint64_t v9 = 690;
        }
        else if ([v8 isEqualToString:@"MARK_MY_LOCATION"])
        {
          uint64_t v9 = 691;
        }
        else if ([v8 isEqualToString:@"AIRPORT_NOTIFICATION_WATCH"])
        {
          uint64_t v9 = 692;
        }
        else if ([v8 isEqualToString:@"EDIT_FAVORITE"])
        {
          uint64_t v9 = 693;
        }
        else if ([v8 isEqualToString:@"ROUTING_CYCLING_DETAILS"])
        {
          uint64_t v9 = 694;
        }
        else if ([v8 isEqualToString:@"NAV_CYCLING_DETAILS"])
        {
          uint64_t v9 = 695;
        }
        else if ([v8 isEqualToString:@"MAPS_SUGGESTION_WIDGET"])
        {
          uint64_t v9 = 696;
        }
        else if ([v8 isEqualToString:@"ARP_TIPKIT"])
        {
          uint64_t v9 = 697;
        }
        else if ([v8 isEqualToString:@"ARP_PRIVACY"])
        {
          uint64_t v9 = 698;
        }
        else if ([v8 isEqualToString:@"ROUTE_OPTIONS_WALKING"])
        {
          uint64_t v9 = 699;
        }
        else if ([v8 isEqualToString:@"SAFARI_SEARCH"])
        {
          uint64_t v9 = 701;
        }
        else if ([v8 isEqualToString:@"SPOTLIGHT_SEARCH"])
        {
          uint64_t v9 = 702;
        }
        else if ([v8 isEqualToString:@"SAFARI_MAPS_SEARCH_RESULTS"])
        {
          uint64_t v9 = 703;
        }
        else if ([v8 isEqualToString:@"SPOTLIGHT_MAPS_SEARCH_RESULTS"])
        {
          uint64_t v9 = 704;
        }
        else if ([v8 isEqualToString:@"WIDGET_MAPS_DESTINATIONS"])
        {
          uint64_t v9 = 705;
        }
        else if ([v8 isEqualToString:@"WIDGET_MAPS_TRANSIT"])
        {
          uint64_t v9 = 706;
        }
        else if ([v8 isEqualToString:@"WIDGET_MAPS_NEARBY"])
        {
          uint64_t v9 = 707;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_FIND_MY_CAR"])
        {
          uint64_t v9 = 708;
        }
        else if ([v8 isEqualToString:@"CONTROL_CENTER"])
        {
          uint64_t v9 = 709;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_CENTER"])
        {
          uint64_t v9 = 710;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_DOOM"])
        {
          uint64_t v9 = 711;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_VENUES"])
        {
          uint64_t v9 = 712;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_RAP_UPDATE"])
        {
          uint64_t v9 = 713;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_TRIP_CANCELLED"])
        {
          uint64_t v9 = 714;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_STOP_SKIPPED"])
        {
          uint64_t v9 = 715;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_TRIP_DELAYED"])
        {
          uint64_t v9 = 716;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_RAP"])
        {
          uint64_t v9 = 717;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_PROXY_AUTH"])
        {
          uint64_t v9 = 718;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_PUSH_TO_DEVICE"])
        {
          uint64_t v9 = 719;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_LOW_FUEL"])
        {
          uint64_t v9 = 720;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_FIND_MY_CAR_RESET"])
        {
          uint64_t v9 = 721;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_TRAFFIC_CONDITIONS"])
        {
          uint64_t v9 = 722;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_SHARED_ETA"])
        {
          uint64_t v9 = 723;
        }
        else if ([v8 isEqualToString:@"NOTIFICATION_SHARED_ETA_UPDATE"])
        {
          uint64_t v9 = 724;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
        {
          uint64_t v9 = 725;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
        {
          uint64_t v9 = 726;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
        {
          uint64_t v9 = 727;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
        {
          uint64_t v9 = 728;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
        {
          uint64_t v9 = 729;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
        {
          uint64_t v9 = 730;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
        {
          uint64_t v9 = 731;
        }
        else if ([v8 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
        {
          uint64_t v9 = 732;
        }
        else if ([v8 isEqualToString:@"APP_SHEET"])
        {
          uint64_t v9 = 733;
        }
        else if ([v8 isEqualToString:@"CZ_ADVISORY_DETAILS_PAGE"])
        {
          uint64_t v9 = 734;
        }
        else if ([v8 isEqualToString:@"SHARE_ETA_CONTACT_TRAY"])
        {
          uint64_t v9 = 735;
        }
        else if ([v8 isEqualToString:@"SIRI_SHARE_ETA"])
        {
          uint64_t v9 = 736;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA"])
        {
          uint64_t v9 = 737;
        }
        else if ([v8 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY"])
        {
          uint64_t v9 = 738;
        }
        else if ([v8 isEqualToString:@"INCIDENT_ALERT_TRAY"])
        {
          uint64_t v9 = 739;
        }
        else if ([v8 isEqualToString:@"INCIDENT_REPORT_CONFIRMATION_TRAY"])
        {
          uint64_t v9 = 740;
        }
        else if ([v8 isEqualToString:@"RAP_INCIDENT_REPORT_VIEW"])
        {
          uint64_t v9 = 741;
        }
        else if ([v8 isEqualToString:@"SEARCH_ALONG_ROUTE_CATEGORY_TRAY"])
        {
          uint64_t v9 = 742;
        }
        else if ([v8 isEqualToString:@"TRAFFIC_ADVISORY_SHEET"])
        {
          uint64_t v9 = 743;
        }
        else if ([v8 isEqualToString:@"SIRI_PLUGIN_SNIPPET"])
        {
          uint64_t v9 = 801;
        }
        else if ([v8 isEqualToString:@"SIRI_PLUGIN_COMMAND"])
        {
          uint64_t v9 = 802;
        }
        else if ([v8 isEqualToString:@"SIRI_SEARCH_RESULT_LIST"])
        {
          uint64_t v9 = 803;
        }
        else if ([v8 isEqualToString:@"SIRI_DISAMBIGUATION_LIST"])
        {
          uint64_t v9 = 804;
        }
        else if ([v8 isEqualToString:@"SIRI_PLACE_SNIPPET"])
        {
          uint64_t v9 = 805;
        }
        else if ([v8 isEqualToString:@"CHROME"])
        {
          uint64_t v9 = 901;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NAV"])
        {
          uint64_t v9 = 1001;
        }
        else if ([v8 isEqualToString:@"CARPLAY_EXPLORE"])
        {
          uint64_t v9 = 1002;
        }
        else if ([v8 isEqualToString:@"CARPLAY_DESTINATIONS"])
        {
          uint64_t v9 = 1003;
        }
        else if ([v8 isEqualToString:@"CARPLAY_TRAFFIC_INCIDENT"])
        {
          uint64_t v9 = 1004;
        }
        else if ([v8 isEqualToString:@"CARPLAY_CONTROL"])
        {
          uint64_t v9 = 1005;
        }
        else if ([v8 isEqualToString:@"CARPLAY_PROACTIVE"])
        {
          uint64_t v9 = 1006;
        }
        else if ([v8 isEqualToString:@"CARPLAY_ROUTING"])
        {
          uint64_t v9 = 1007;
        }
        else if ([v8 isEqualToString:@"CARPLAY_MORE_ROUTES"])
        {
          uint64_t v9 = 1008;
        }
        else if ([v8 isEqualToString:@"CARPLAY_SEARCH_ALONG_ROUTE"])
        {
          uint64_t v9 = 1009;
        }
        else if ([v8 isEqualToString:@"CARPLAY_SEARCH"])
        {
          uint64_t v9 = 1010;
        }
        else if ([v8 isEqualToString:@"CARPLAY_SEARCH_RESULTS"])
        {
          uint64_t v9 = 1011;
        }
        else if ([v8 isEqualToString:@"CARPLAY_FAVORITES"])
        {
          uint64_t v9 = 1012;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NAV_CONFIRMATION"])
        {
          uint64_t v9 = 1013;
        }
        else if ([v8 isEqualToString:@"CARPLAY_DESTINATION_SHARING"])
        {
          uint64_t v9 = 1014;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NOTIFICATION_BATTERY"])
        {
          uint64_t v9 = 1015;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NOTIFICATION_DOOM"])
        {
          uint64_t v9 = 1016;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NOTIFICATION_FUEL"])
        {
          uint64_t v9 = 1017;
        }
        else if ([v8 isEqualToString:@"CARPLAY_NOTIFICATION_HYBRID"])
        {
          uint64_t v9 = 1018;
        }
        else if ([v8 isEqualToString:@"CARPLAY_SHARE_ETA_TRAY"])
        {
          uint64_t v9 = 1019;
        }
        else if ([v8 isEqualToString:@"CARPLAY_ETA_UPDATE_TRAY"])
        {
          uint64_t v9 = 1020;
        }
        else if ([v8 isEqualToString:@"CARPLAY_ACTION_TRAY"])
        {
          uint64_t v9 = 1021;
        }
        else if ([v8 isEqualToString:@"CARPLAY_PLACECARD"])
        {
          uint64_t v9 = 1022;
        }
        else if ([v8 isEqualToString:@"CARPLAY_KEYBOARD"])
        {
          uint64_t v9 = 1023;
        }
        else if ([v8 isEqualToString:@"CARPLAY_UI_TARGET_UNKNOWN"])
        {
          uint64_t v9 = 1024;
        }
        else if ([v8 isEqualToString:@"CARPLAY_EDIT_STOPS"])
        {
          uint64_t v9 = 1025;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_MENU"])
        {
          uint64_t v9 = 1100;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST"])
        {
          uint64_t v9 = 1101;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM"])
        {
          uint64_t v9 = 1102;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM"])
        {
          uint64_t v9 = 1103;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM"])
        {
          uint64_t v9 = 1104;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM"])
        {
          uint64_t v9 = 1105;
        }
        else if ([v8 isEqualToString:@"RAP_TRANSIT_MENU"])
        {
          uint64_t v9 = 1106;
        }
        else if ([v8 isEqualToString:@"RAP_STATION_MAP"])
        {
          uint64_t v9 = 1107;
        }
        else if ([v8 isEqualToString:@"RAP_STATION_MENU"])
        {
          uint64_t v9 = 1108;
        }
        else if ([v8 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP"])
        {
          uint64_t v9 = 1109;
        }
        else if ([v8 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM"])
        {
          uint64_t v9 = 1110;
        }
        else if ([v8 isEqualToString:@"RAP_STATION_CLOSED_FORM"])
        {
          uint64_t v9 = 1111;
        }
        else if ([v8 isEqualToString:@"RAP_LINE_MAP"])
        {
          uint64_t v9 = 1112;
        }
        else if ([v8 isEqualToString:@"RAP_LINE_MENU"])
        {
          uint64_t v9 = 1113;
        }
        else if ([v8 isEqualToString:@"RAP_LINE_NAME_FORM"])
        {
          uint64_t v9 = 1114;
        }
        else if ([v8 isEqualToString:@"RAP_LINE_SHAPE_FORM"])
        {
          uint64_t v9 = 1115;
        }
        else if ([v8 isEqualToString:@"RAP_LINE_SCHEDULE_INCORRECT_FORM"])
        {
          uint64_t v9 = 1116;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_PLACE_MENU"])
        {
          uint64_t v9 = 1117;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_POI_MAP"])
        {
          uint64_t v9 = 1118;
        }
        else if ([v8 isEqualToString:@"RAP_CATEGORY_LIST"])
        {
          uint64_t v9 = 1119;
        }
        else if ([v8 isEqualToString:@"RAP_POI_DETAILS_FORM"])
        {
          uint64_t v9 = 1120;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_STREET_MAP"])
        {
          uint64_t v9 = 1121;
        }
        else if ([v8 isEqualToString:@"RAP_STREET_DETAILS_FORM"])
        {
          uint64_t v9 = 1122;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_OTHER_MAP"])
        {
          uint64_t v9 = 1123;
        }
        else if ([v8 isEqualToString:@"RAP_OTHER_DETAILS_FORM"])
        {
          uint64_t v9 = 1124;
        }
        else if ([v8 isEqualToString:@"RAP_CAMERA"])
        {
          uint64_t v9 = 1125;
        }
        else if ([v8 isEqualToString:@"RAP_LABEL_MAP"])
        {
          uint64_t v9 = 1126;
        }
        else if ([v8 isEqualToString:@"RAP_LABEL_DETAILS_FORM"])
        {
          uint64_t v9 = 1127;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_MENU"])
        {
          uint64_t v9 = 1128;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_UNEXPECTED_RESULT_FORM"])
        {
          uint64_t v9 = 1129;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_ADDRESS_INCORRECT_FORM"])
        {
          uint64_t v9 = 1130;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_MAP"])
        {
          uint64_t v9 = 1131;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM"])
        {
          uint64_t v9 = 1132;
        }
        else if ([v8 isEqualToString:@"RAP_SATELLITE_IMAGE_MAP"])
        {
          uint64_t v9 = 1133;
        }
        else if ([v8 isEqualToString:@"RAP_SATELLITE_IMAGE_DETAILS_FORM"])
        {
          uint64_t v9 = 1134;
        }
        else if ([v8 isEqualToString:@"RAP_OTHER_FORM"])
        {
          uint64_t v9 = 1135;
        }
        else if ([v8 isEqualToString:@"RAP_PRIVACY"])
        {
          uint64_t v9 = 1136;
        }
        else if ([v8 isEqualToString:@"RAP_CONFIRMATION"])
        {
          uint64_t v9 = 1137;
        }
        else if ([v8 isEqualToString:@"RAP_POI_MENU"])
        {
          uint64_t v9 = 1138;
        }
        else if ([v8 isEqualToString:@"RAP_SEARCH_AUTOCOMPLETE_MENU"])
        {
          uint64_t v9 = 1139;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_A_PLACE_MAP"])
        {
          uint64_t v9 = 1140;
        }
        else if ([v8 isEqualToString:@"RAP_POI_LOCATION_MAP"])
        {
          uint64_t v9 = 1141;
        }
        else if ([v8 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP"])
        {
          uint64_t v9 = 1142;
        }
        else if ([v8 isEqualToString:@"RAP_POI_CLOSED_FORM"])
        {
          uint64_t v9 = 1143;
        }
        else if ([v8 isEqualToString:@"RAP_CLAIM_BUSINESS_DIALOG"])
        {
          uint64_t v9 = 1144;
        }
        else if ([v8 isEqualToString:@"RAP_BRAND_MENU"])
        {
          uint64_t v9 = 1145;
        }
        else if ([v8 isEqualToString:@"RAP_BRAND_DETAILS_FORM"])
        {
          uint64_t v9 = 1146;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM"])
        {
          uint64_t v9 = 1147;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STREET_FORM"])
        {
          uint64_t v9 = 1148;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_BLURRING_FORM"])
        {
          uint64_t v9 = 1149;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_REMOVE_HOME_FORM"])
        {
          uint64_t v9 = 1150;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_MENU"])
        {
          uint64_t v9 = 1151;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STORE_FORM"])
        {
          uint64_t v9 = 1152;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND_PRIVACY_MENU"])
        {
          uint64_t v9 = 1153;
        }
        else if ([v8 isEqualToString:@"RAP_LIGHTWEIGHT"])
        {
          uint64_t v9 = 1154;
        }
        else if ([v8 isEqualToString:@"RAP_EDIT_PLACE_DETAILS"])
        {
          uint64_t v9 = 1155;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_CATEGORY"])
        {
          uint64_t v9 = 1156;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_HOURS"])
        {
          uint64_t v9 = 1157;
        }
        else if ([v8 isEqualToString:@"RAP_EDIT_LOCATION"])
        {
          uint64_t v9 = 1158;
        }
        else if ([v8 isEqualToString:@"RAP_EDIT_ENTRY_POINT"])
        {
          uint64_t v9 = 1159;
        }
        else if ([v8 isEqualToString:@"RAP_LOOK_AROUND"])
        {
          uint64_t v9 = 1160;
        }
        else if ([v8 isEqualToString:@"RAP_ADD_ENTRY_POINT"])
        {
          uint64_t v9 = 1161;
        }
        else if ([v8 isEqualToString:@"WATCH_MAIN_MENU"])
        {
          uint64_t v9 = 1201;
        }
        else if ([v8 isEqualToString:@"WATCH_MAIN_PRESS_MENU"])
        {
          uint64_t v9 = 1202;
        }
        else if ([v8 isEqualToString:@"WATCH_SEARCH"])
        {
          uint64_t v9 = 1203;
        }
        else if ([v8 isEqualToString:@"WATCH_DICTATION"])
        {
          uint64_t v9 = 1204;
        }
        else if ([v8 isEqualToString:@"WATCH_FAVORITES"])
        {
          uint64_t v9 = 1205;
        }
        else if ([v8 isEqualToString:@"WATCH_SUB_CATEGORY_LIST"])
        {
          uint64_t v9 = 1206;
        }
        else if ([v8 isEqualToString:@"WATCH_SEARCH_RESULTS_LIST"])
        {
          uint64_t v9 = 1207;
        }
        else if ([v8 isEqualToString:@"WATCH_MAP_VIEW"])
        {
          uint64_t v9 = 1208;
        }
        else if ([v8 isEqualToString:@"WATCH_PLACECARD"])
        {
          uint64_t v9 = 1209;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING"])
        {
          uint64_t v9 = 1210;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_DETAILS"])
        {
          uint64_t v9 = 1211;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TBT"])
        {
          uint64_t v9 = 1212;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_MAP"])
        {
          uint64_t v9 = 1213;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_PRESS_MENU"])
        {
          uint64_t v9 = 1214;
        }
        else if ([v8 isEqualToString:@"WATCH_MAP_PRESS_MENU"])
        {
          uint64_t v9 = 1215;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTING_PRESS_MENU"])
        {
          uint64_t v9 = 1216;
        }
        else if ([v8 isEqualToString:@"WATCH_TRANSIT_MAP_VIEW"])
        {
          uint64_t v9 = 1217;
        }
        else if ([v8 isEqualToString:@"WATCH_SCRIBBLE"])
        {
          uint64_t v9 = 1218;
        }
        else if ([v8 isEqualToString:@"WATCH_COLLECTION_VIEW"])
        {
          uint64_t v9 = 1219;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING"])
        {
          uint64_t v9 = 1220;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING"])
        {
          uint64_t v9 = 1221;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT"])
        {
          uint64_t v9 = 1222;
        }
        else if ([v8 isEqualToString:@"WATCH_PAIRED_DEVICE"])
        {
          uint64_t v9 = 1223;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_DRIVING_SPLIT"])
        {
          uint64_t v9 = 1224;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_DRIVING_PLATTER"])
        {
          uint64_t v9 = 1225;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_DRIVING_MAP"])
        {
          uint64_t v9 = 1226;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_SPLIT"])
        {
          uint64_t v9 = 1227;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_PLATTER"])
        {
          uint64_t v9 = 1228;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_WALKING_MAP"])
        {
          uint64_t v9 = 1229;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TRANSIT_SPLIT"])
        {
          uint64_t v9 = 1230;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TRANSIT_PLATTER"])
        {
          uint64_t v9 = 1231;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_TRANSIT_MAP"])
        {
          uint64_t v9 = 1232;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_INFO"])
        {
          uint64_t v9 = 1233;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_MAP"])
        {
          uint64_t v9 = 1234;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_PLATTER"])
        {
          uint64_t v9 = 1235;
        }
        else if ([v8 isEqualToString:@"WATCH_NAV_CYCLING_SPLIT"])
        {
          uint64_t v9 = 1236;
        }
        else if ([v8 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING"])
        {
          uint64_t v9 = 1237;
        }
        else if ([v8 isEqualToString:@"WATCH_SEARCH_INPUT"])
        {
          uint64_t v9 = 1238;
        }
        else if ([v8 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
        {
          uint64_t v9 = 1239;
        }
        else if ([v8 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_ROUTE"])
        {
          uint64_t v9 = 1240;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_LIST"])
        {
          uint64_t v9 = 1301;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_FORM"])
        {
          uint64_t v9 = 1302;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_LABEL_FORM"])
        {
          uint64_t v9 = 1303;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_EDIT_MAP"])
        {
          uint64_t v9 = 1304;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_CONFIRMATION"])
        {
          uint64_t v9 = 1305;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_DELETE_DIALOG"])
        {
          uint64_t v9 = 1306;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_INFO"])
        {
          uint64_t v9 = 1307;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH"])
        {
          uint64_t v9 = 1308;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH_RESULTS"])
        {
          uint64_t v9 = 1309;
        }
        else if ([v8 isEqualToString:@"FAVORITE_SEARCH"])
        {
          uint64_t v9 = 1310;
        }
        else if ([v8 isEqualToString:@"FAVORITE_LIST"])
        {
          uint64_t v9 = 1311;
        }
        else if ([v8 isEqualToString:@"FAVORITE_INFO"])
        {
          uint64_t v9 = 1312;
        }
        else if ([v8 isEqualToString:@"PERSONALIZED_CONFIRMATION_WITH_PRIVACY"])
        {
          uint64_t v9 = 1313;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS"])
        {
          uint64_t v9 = 1401;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING"])
        {
          uint64_t v9 = 1402;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING"])
        {
          uint64_t v9 = 1403;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED"])
        {
          uint64_t v9 = 1404;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG"])
        {
          uint64_t v9 = 1405;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_FEEDBACK"])
        {
          uint64_t v9 = 1406;
        }
        else if ([v8 isEqualToString:@"ROUTING_TRAY_RIDESHARE_ENABLE_ALL"])
        {
          uint64_t v9 = 1407;
        }
        else if ([v8 isEqualToString:@"PLACECARD_HEADER"])
        {
          uint64_t v9 = 1501;
        }
        else if ([v8 isEqualToString:@"PLACECARD_ADDRESS"])
        {
          uint64_t v9 = 1502;
        }
        else if ([v8 isEqualToString:@"PLACECARD_PHONE"])
        {
          uint64_t v9 = 1503;
        }
        else if ([v8 isEqualToString:@"PLACECARD_URL"])
        {
          uint64_t v9 = 1504;
        }
        else if ([v8 isEqualToString:@"MENU_ITEM_DARK_MAP"])
        {
          uint64_t v9 = 1601;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_PIP"])
        {
          uint64_t v9 = 1700;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_ACTION_SHEET"])
        {
          uint64_t v9 = 1701;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_VIEW"])
        {
          uint64_t v9 = 1702;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_PLATTER"])
        {
          uint64_t v9 = 1703;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM"])
        {
          uint64_t v9 = 1704;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_REGION"])
        {
          uint64_t v9 = 1705;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_VIEW_PLACECARD"])
        {
          uint64_t v9 = 1706;
        }
        else if ([v8 isEqualToString:@"LOOK_AROUND_PIP_PLACECARD"])
        {
          uint64_t v9 = 1707;
        }
        else if ([v8 isEqualToString:@"OFFLINE_BROWSE_ONLY_SEARCH_TRAY"])
        {
          uint64_t v9 = 1708;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_PLACE"])
        {
          uint64_t v9 = 1801;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_SEARCH"])
        {
          uint64_t v9 = 1802;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_SEARCH_RESULTS"])
        {
          uint64_t v9 = 1803;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_PUBLISHER"])
        {
          uint64_t v9 = 1804;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_GUIDE"])
        {
          uint64_t v9 = 1805;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_GUIDES_HOME"])
        {
          uint64_t v9 = 1806;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_RELATED_PLACES_LIST"])
        {
          uint64_t v9 = 1807;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_COLLECTION_LIST"])
        {
          uint64_t v9 = 1808;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_DIRECTIONS"])
        {
          uint64_t v9 = 1809;
        }
        else if ([v8 isEqualToString:@"MAPS_WEB_SIDEBAR"])
        {
          uint64_t v9 = 1810;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_1026;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setUiTarget:v9];
LABEL_1026:

      if (a3) {
        v10 = @"layoutInfo";
      }
      else {
        v10 = @"layout_info";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"UNKNOWN_LAYOUT"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"MINI_LAYOUT"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"PARTIAL_LAYOUT"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"FULL_LAYOUT"])
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_1043;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setLayoutInfo:v13];
LABEL_1043:

      if (a3) {
        v14 = @"layoutStyle";
      }
      else {
        v14 = @"layout_style";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"UNKNOWN_STYLE"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"STANDARD_STYLE"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"COMPACT_STYLE"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"SIDE_BAR_STYLE"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"FLOATING_STYLE"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"STANDARD_SIDE_STYLE"])
        {
          uint64_t v17 = 5;
        }
        else
        {
          uint64_t v17 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_1064:

          goto LABEL_1065;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setLayoutStyle:v17];
      goto LABEL_1064;
    }
  }
LABEL_1065:

  return a1;
}

- (int)uiTarget
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_uiTarget;
  }
  else {
    return 0;
  }
}

- (void)setUiTarget:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_uiTarget = a3;
}

- (void)setHasUiTarget:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUiTarget
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)uiTargetAsString:(int)a3
{
  if (a3 > 1000)
  {
    if (a3 > 1600)
    {
      switch(a3)
      {
        case 1700:
          v4 = @"LOOK_AROUND_PIP";
          break;
        case 1701:
          v4 = @"LOOK_AROUND_ACTION_SHEET";
          break;
        case 1702:
          v4 = @"LOOK_AROUND_VIEW";
          break;
        case 1703:
          v4 = @"LOOK_AROUND_PLATTER";
          break;
        case 1704:
          v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
          break;
        case 1705:
          v4 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
          break;
        case 1706:
          v4 = @"LOOK_AROUND_VIEW_PLACECARD";
          break;
        case 1707:
          v4 = @"LOOK_AROUND_PIP_PLACECARD";
          break;
        case 1708:
          v4 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
          break;
        default:
          if (a3 == 1601)
          {
            v4 = @"MENU_ITEM_DARK_MAP";
          }
          else
          {
LABEL_55:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
            v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_56:
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          v4 = @"CARPLAY_NAV";
          break;
        case 1002:
          v4 = @"CARPLAY_EXPLORE";
          break;
        case 1003:
          v4 = @"CARPLAY_DESTINATIONS";
          break;
        case 1004:
          v4 = @"CARPLAY_TRAFFIC_INCIDENT";
          break;
        case 1005:
          v4 = @"CARPLAY_CONTROL";
          break;
        case 1006:
          v4 = @"CARPLAY_PROACTIVE";
          break;
        case 1007:
          v4 = @"CARPLAY_ROUTING";
          break;
        case 1008:
          v4 = @"CARPLAY_MORE_ROUTES";
          break;
        case 1009:
          v4 = @"CARPLAY_SEARCH_ALONG_ROUTE";
          break;
        case 1010:
          v4 = @"CARPLAY_SEARCH";
          break;
        case 1011:
          v4 = @"CARPLAY_SEARCH_RESULTS";
          break;
        case 1012:
          v4 = @"CARPLAY_FAVORITES";
          break;
        case 1013:
          v4 = @"CARPLAY_NAV_CONFIRMATION";
          break;
        case 1014:
          v4 = @"CARPLAY_DESTINATION_SHARING";
          break;
        case 1015:
          v4 = @"CARPLAY_NOTIFICATION_BATTERY";
          break;
        case 1016:
          v4 = @"CARPLAY_NOTIFICATION_DOOM";
          break;
        case 1017:
          v4 = @"CARPLAY_NOTIFICATION_FUEL";
          break;
        case 1018:
          v4 = @"CARPLAY_NOTIFICATION_HYBRID";
          break;
        case 1019:
          v4 = @"CARPLAY_SHARE_ETA_TRAY";
          break;
        case 1020:
          v4 = @"CARPLAY_ETA_UPDATE_TRAY";
          break;
        case 1021:
          v4 = @"CARPLAY_ACTION_TRAY";
          break;
        case 1022:
          v4 = @"CARPLAY_PLACECARD";
          break;
        case 1023:
          v4 = @"CARPLAY_KEYBOARD";
          break;
        case 1024:
          v4 = @"CARPLAY_UI_TARGET_UNKNOWN";
          break;
        case 1025:
          v4 = @"CARPLAY_EDIT_STOPS";
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_55;
        case 1100:
          v4 = @"RAP_DIRECTIONS_MENU";
          break;
        case 1101:
          v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
          break;
        case 1102:
          v4 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
          break;
        case 1103:
          v4 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
          break;
        case 1104:
          v4 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
          break;
        case 1105:
          v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
          break;
        case 1106:
          v4 = @"RAP_TRANSIT_MENU";
          break;
        case 1107:
          v4 = @"RAP_STATION_MAP";
          break;
        case 1108:
          v4 = @"RAP_STATION_MENU";
          break;
        case 1109:
          v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
          break;
        case 1110:
          v4 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
          break;
        case 1111:
          v4 = @"RAP_STATION_CLOSED_FORM";
          break;
        case 1112:
          v4 = @"RAP_LINE_MAP";
          break;
        case 1113:
          v4 = @"RAP_LINE_MENU";
          break;
        case 1114:
          v4 = @"RAP_LINE_NAME_FORM";
          break;
        case 1115:
          v4 = @"RAP_LINE_SHAPE_FORM";
          break;
        case 1116:
          v4 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
          break;
        case 1117:
          v4 = @"RAP_ADD_PLACE_MENU";
          break;
        case 1118:
          v4 = @"RAP_ADD_POI_MAP";
          break;
        case 1119:
          v4 = @"RAP_CATEGORY_LIST";
          break;
        case 1120:
          v4 = @"RAP_POI_DETAILS_FORM";
          break;
        case 1121:
          v4 = @"RAP_ADD_STREET_MAP";
          break;
        case 1122:
          v4 = @"RAP_STREET_DETAILS_FORM";
          break;
        case 1123:
          v4 = @"RAP_ADD_OTHER_MAP";
          break;
        case 1124:
          v4 = @"RAP_OTHER_DETAILS_FORM";
          break;
        case 1125:
          v4 = @"RAP_CAMERA";
          break;
        case 1126:
          v4 = @"RAP_LABEL_MAP";
          break;
        case 1127:
          v4 = @"RAP_LABEL_DETAILS_FORM";
          break;
        case 1128:
          v4 = @"RAP_SEARCH_MENU";
          break;
        case 1129:
          v4 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
          break;
        case 1130:
          v4 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
          break;
        case 1131:
          v4 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
          break;
        case 1132:
          v4 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
          break;
        case 1133:
          v4 = @"RAP_SATELLITE_IMAGE_MAP";
          break;
        case 1134:
          v4 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
          break;
        case 1135:
          v4 = @"RAP_OTHER_FORM";
          break;
        case 1136:
          v4 = @"RAP_PRIVACY";
          break;
        case 1137:
          v4 = @"RAP_CONFIRMATION";
          break;
        case 1138:
          v4 = @"RAP_POI_MENU";
          break;
        case 1139:
          v4 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
          break;
        case 1140:
          v4 = @"RAP_ADD_A_PLACE_MAP";
          break;
        case 1141:
          v4 = @"RAP_POI_LOCATION_MAP";
          break;
        case 1142:
          v4 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
          break;
        case 1143:
          v4 = @"RAP_POI_CLOSED_FORM";
          break;
        case 1144:
          v4 = @"RAP_CLAIM_BUSINESS_DIALOG";
          break;
        case 1145:
          v4 = @"RAP_BRAND_MENU";
          break;
        case 1146:
          v4 = @"RAP_BRAND_DETAILS_FORM";
          break;
        case 1147:
          v4 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
          break;
        case 1148:
          v4 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
          break;
        case 1149:
          v4 = @"RAP_LOOK_AROUND_BLURRING_FORM";
          break;
        case 1150:
          v4 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
          break;
        case 1151:
          v4 = @"RAP_LOOK_AROUND_MENU";
          break;
        case 1152:
          v4 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
          break;
        case 1153:
          v4 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
          break;
        case 1154:
          v4 = @"RAP_LIGHTWEIGHT";
          break;
        case 1155:
          v4 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 1156:
          v4 = @"RAP_ADD_CATEGORY";
          break;
        case 1157:
          v4 = @"RAP_ADD_HOURS";
          break;
        case 1158:
          v4 = @"RAP_EDIT_LOCATION";
          break;
        case 1159:
          v4 = @"RAP_EDIT_ENTRY_POINT";
          break;
        case 1160:
          v4 = @"RAP_LOOK_AROUND";
          break;
        case 1161:
          v4 = @"RAP_ADD_ENTRY_POINT";
          break;
        case 1201:
          v4 = @"WATCH_MAIN_MENU";
          break;
        case 1202:
          v4 = @"WATCH_MAIN_PRESS_MENU";
          break;
        case 1203:
          v4 = @"WATCH_SEARCH";
          break;
        case 1204:
          v4 = @"WATCH_DICTATION";
          break;
        case 1205:
          v4 = @"WATCH_FAVORITES";
          break;
        case 1206:
          v4 = @"WATCH_SUB_CATEGORY_LIST";
          break;
        case 1207:
          v4 = @"WATCH_SEARCH_RESULTS_LIST";
          break;
        case 1208:
          v4 = @"WATCH_MAP_VIEW";
          break;
        case 1209:
          v4 = @"WATCH_PLACECARD";
          break;
        case 1210:
          v4 = @"WATCH_ROUTE_PLANNING";
          break;
        case 1211:
          v4 = @"WATCH_ROUTE_DETAILS";
          break;
        case 1212:
          v4 = @"WATCH_NAV_TBT";
          break;
        case 1213:
          v4 = @"WATCH_NAV_MAP";
          break;
        case 1214:
          v4 = @"WATCH_NAV_PRESS_MENU";
          break;
        case 1215:
          v4 = @"WATCH_MAP_PRESS_MENU";
          break;
        case 1216:
          v4 = @"WATCH_ROUTING_PRESS_MENU";
          break;
        case 1217:
          v4 = @"WATCH_TRANSIT_MAP_VIEW";
          break;
        case 1218:
          v4 = @"WATCH_SCRIBBLE";
          break;
        case 1219:
          v4 = @"WATCH_COLLECTION_VIEW";
          break;
        case 1220:
          v4 = @"WATCH_ROUTE_PLANNING_WALKING";
          break;
        case 1221:
          v4 = @"WATCH_ROUTE_PLANNING_DRIVING";
          break;
        case 1222:
          v4 = @"WATCH_ROUTE_PLANNING_TRANSIT";
          break;
        case 1223:
          v4 = @"WATCH_PAIRED_DEVICE";
          break;
        case 1224:
          v4 = @"WATCH_NAV_DRIVING_SPLIT";
          break;
        case 1225:
          v4 = @"WATCH_NAV_DRIVING_PLATTER";
          break;
        case 1226:
          v4 = @"WATCH_NAV_DRIVING_MAP";
          break;
        case 1227:
          v4 = @"WATCH_NAV_WALKING_SPLIT";
          break;
        case 1228:
          v4 = @"WATCH_NAV_WALKING_PLATTER";
          break;
        case 1229:
          v4 = @"WATCH_NAV_WALKING_MAP";
          break;
        case 1230:
          v4 = @"WATCH_NAV_TRANSIT_SPLIT";
          break;
        case 1231:
          v4 = @"WATCH_NAV_TRANSIT_PLATTER";
          break;
        case 1232:
          v4 = @"WATCH_NAV_TRANSIT_MAP";
          break;
        case 1233:
          v4 = @"WATCH_ROUTE_INFO";
          break;
        case 1234:
          v4 = @"WATCH_NAV_CYCLING_MAP";
          break;
        case 1235:
          v4 = @"WATCH_NAV_CYCLING_PLATTER";
          break;
        case 1236:
          v4 = @"WATCH_NAV_CYCLING_SPLIT";
          break;
        case 1237:
          v4 = @"WATCH_ROUTE_PLANNING_CYCLING";
          break;
        case 1238:
          v4 = @"WATCH_SEARCH_INPUT";
          break;
        case 1239:
          v4 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 1240:
          v4 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 1301:
          v4 = @"PERSONALIZED_ADDRESS_LIST";
          break;
        case 1302:
          v4 = @"PERSONALIZED_ADDRESS_FORM";
          break;
        case 1303:
          v4 = @"PERSONALIZED_LABEL_FORM";
          break;
        case 1304:
          v4 = @"PERSONALIZED_EDIT_MAP";
          break;
        case 1305:
          v4 = @"PERSONALIZED_CONFIRMATION";
          break;
        case 1306:
          v4 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
          break;
        case 1307:
          v4 = @"PERSONALIZED_ADDRESS_INFO";
          break;
        case 1308:
          v4 = @"PERSONALIZED_ADDRESS_SEARCH";
          break;
        case 1309:
          v4 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
          break;
        case 1310:
          v4 = @"FAVORITE_SEARCH";
          break;
        case 1311:
          v4 = @"FAVORITE_LIST";
          break;
        case 1312:
          v4 = @"FAVORITE_INFO";
          break;
        case 1313:
          v4 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
          break;
        default:
          switch(a3)
          {
            case 1401:
              v4 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
              break;
            case 1402:
              v4 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
              break;
            case 1403:
              v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
              break;
            case 1404:
              v4 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
              break;
            case 1405:
              v4 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
              break;
            case 1406:
              v4 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
              break;
            case 1407:
              v4 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
              break;
            default:
              switch(a3)
              {
                case 1501:
                  v4 = @"PLACECARD_HEADER";
                  break;
                case 1502:
                  v4 = @"PLACECARD_ADDRESS";
                  break;
                case 1503:
                  v4 = @"PLACECARD_PHONE";
                  break;
                case 1504:
                  v4 = @"PLACECARD_URL";
                  break;
                default:
                  goto LABEL_55;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v4 = @"UI_TARGET_UNKNOWN";
    switch(a3)
    {
      case 0:
        goto LABEL_56;
      case 1:
        v4 = @"UI_TARGET_POI";
        break;
      case 2:
        v4 = @"UI_TARGET_SEARCH_RESULT_LIST";
        break;
      case 3:
        v4 = @"UI_TARGET_POPULAR_NEARBY_LIST";
        break;
      case 4:
        v4 = @"UI_TARGET_CALLOUT";
        break;
      case 5:
        v4 = @"UI_TARGET_SEARCH_PIN";
        break;
      case 6:
        v4 = @"UI_TARGET_DROPPED_PIN";
        break;
      case 7:
        v4 = @"UI_TARGET_TRANSIT_LINE";
        break;
      case 8:
        v4 = @"SEARCH_TRAY";
        break;
      case 9:
        v4 = @"SEARCH_TRAY_BROWSE";
        break;
      case 10:
        v4 = @"SEARCH_TRAY_POPULAR_NEARBY";
        break;
      case 11:
        v4 = @"SEARCH_TRAY_AC";
        break;
      case 12:
        v4 = @"SEARCH_TRAY_AC_INTERMEDIATE";
        break;
      case 13:
        v4 = @"SEARCH_TRAY_NO_QUERY";
        break;
      case 14:
        v4 = @"AR_WALKING_LEGAL_TRAY";
        break;
      case 15:
        v4 = @"RAISE_TO_START_AR_TRAY";
        break;
      case 16:
        v4 = @"EVENTS_ADVISORY_DETAILS_PAGE";
        break;
      case 17:
        v4 = @"INCIDENT_REPORT_TRAY_CARPLAY";
        break;
      case 18:
        v4 = @"HIGHLIGHTED_AREA";
        break;
      case 19:
        v4 = @"CURATED_COLLECTIONS_HOME";
        break;
      case 20:
        v4 = @"TRAVEL_PREFERENCES_TRAY";
        break;
      case 21:
        v4 = @"RESULT_TRAY_SEARCH";
        break;
      case 22:
        v4 = @"SINGLE_CARD_FILTER";
        break;
      case 23:
        v4 = @"FULL_CARD_FILTER";
        break;
      case 24:
        v4 = @"ACCOUNT_PRIVACY_TRAY";
        break;
      case 25:
        v4 = @"APPLE_RATINGS_HISTORY_TRAY";
        break;
      case 26:
        v4 = @"CURATED_COLLECTIONS_HOME_FILTERED";
        break;
      case 27:
        v4 = @"CITY_MENU";
        break;
      case 28:
        v4 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
        break;
      case 29:
        v4 = @"ACCOUNT_TRAY";
        break;
      case 30:
        v4 = @"QUICK_ACTION_TRAY";
        break;
      case 31:
        v4 = @"SUBMIT_TRIP_FEEDBACK";
        break;
      case 32:
        v4 = @"RAP_PLACE_ISSUE_DETAILS";
        break;
      case 33:
        v4 = @"RAP_GUIDES_DETAILS";
        break;
      case 34:
        v4 = @"RAP_BAD_DIRECTIONS_DETAILS";
        break;
      case 35:
        v4 = @"RAP_ADD_MAP_DETAILS";
        break;
      case 36:
        v4 = @"WATCH_COMPLICATION";
        break;
      case 37:
        v4 = @"RAP_NAV_MENU";
        break;
      case 38:
        v4 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
        break;
      case 39:
        v4 = @"RAP_REPORT_MENU";
        break;
      case 40:
        v4 = @"RAP_CURATED_COLLECTION_MENU";
        break;
      case 41:
        v4 = @"RAP_REPORT_CARD_DETAILS";
        break;
      case 42:
        v4 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
        break;
      case 43:
        v4 = @"RAP_STREET_ISSUE_DETAILS";
        break;
      case 44:
        v4 = @"NEARBY_TRANSIT_CARD";
        break;
      case 45:
        v4 = @"WATCH_NAV_MENU";
        break;
      case 46:
        v4 = @"GENERIC_ADVISORY_PAGE";
        break;
      case 47:
        v4 = @"USER_PROFILE_TRAY";
        break;
      case 48:
        v4 = @"MEDIA_APP_MENU";
        break;
      case 49:
        v4 = @"TEMPLATE_PLACE_TRAY";
        break;
      case 50:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
        break;
      case 51:
        v4 = @"ALLOW_NOTIFICATION_DIALOG";
        break;
      case 52:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
        break;
      case 53:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
        break;
      case 54:
        v4 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
        break;
      case 55:
        v4 = @"NOTIFICATION_CONSENT_PROMPT";
        break;
      case 56:
        v4 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
        break;
      case 57:
        v4 = @"PLACECARD_TRAY_VENDORS_MENU";
        break;
      case 58:
        v4 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
        break;
      case 59:
        v4 = @"SEARCH_ALONG_ROUTE_TRAY";
        break;
      case 60:
        v4 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
        break;
      case 61:
        v4 = @"PLACECARD_SHOWCASE_MENU";
        break;
      case 62:
        v4 = @"RAP_INLINE_ADD_DETAILS";
        break;
      case 63:
        v4 = @"RAP_EDIT_MENU_DETAILS";
        break;
      case 64:
        v4 = @"RAP_SUBMISSION_PROMPT";
        break;
      case 65:
        v4 = @"RAP_PLACECARD_EDIT_MENU";
        break;
      case 66:
        v4 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
        break;
      case 67:
        v4 = @"INCIDENT_REPORT_MENU";
        break;
      case 68:
        v4 = @"RAP_SELECT_BAD_ROUTES_STEPS";
        break;
      case 69:
        v4 = @"RAP_SELECT_BAD_ROUTES";
        break;
      case 70:
        v4 = @"SIRI_SUGGESTION_RESUME_ROUTE";
        break;
      case 71:
        v4 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
        break;
      case 72:
        v4 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
        break;
      case 73:
        v4 = @"SPOTLIGHT_BUSINESS_ENTITY";
        break;
      case 74:
        v4 = @"NOTIFICATION_ARP";
        break;
      case 75:
        v4 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
        break;
      case 76:
        v4 = @"YOUR_PHOTOS_ALBUM";
        break;
      case 77:
        v4 = @"ARP_PHOTO_CREDIT";
        break;
      case 78:
        v4 = @"RAP_OUTREACH_REVIEWED_REPORT";
        break;
      case 79:
        v4 = @"RAP_REPORT_MENU_MORE";
        break;
      case 80:
        v4 = @"WATCH_MAPS_SETTINGS";
        break;
      case 81:
        v4 = @"OFFLINE_FEATURE_PROMPT";
        break;
      case 82:
        v4 = @"EXPIRED_MAPS_DETAILS";
        break;
      case 83:
        v4 = @"MAPS_VIEW";
        break;
      case 84:
        v4 = @"NOTIFICATION_OFFLINE";
        break;
      case 85:
        v4 = @"EXPIRED_MAPS_MANAGEMENT";
        break;
      case 86:
        v4 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
        break;
      case 87:
        v4 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
        break;
      case 88:
        v4 = @"OFFLINE_MAPS_MANAGEMENT";
        break;
      case 89:
        v4 = @"REGION_SELECTOR";
        break;
      case 90:
        v4 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
        break;
      case 91:
        v4 = @"FIND_MY_ETA_SHARING_TRAY";
        break;
      case 92:
        v4 = @"WATCH_PLACE";
        break;
      case 93:
        v4 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
        break;
      case 94:
        v4 = @"WATCH_ROUTE_PLANNING_MAP";
        break;
      case 95:
        v4 = @"WATCH_NAV_WALKING_CONTROLS";
        break;
      case 96:
        v4 = @"WATCH_NAV_CYCLING_CONTROLS";
        break;
      case 97:
        v4 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
        break;
      case 98:
        v4 = @"WATCH_NAV_TRANSIT_CONTROLS";
        break;
      case 99:
        v4 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
        break;
      case 100:
        v4 = @"WATCH_NAV_DRIVING_CONTROLS";
        break;
      case 101:
        v4 = @"RESULTS_TRAY_SEARCH";
        break;
      case 102:
        v4 = @"RESULTS_TRAY_BROWSE";
        break;
      case 103:
        v4 = @"RESULTS_TRAY_FAVORITES";
        break;
      case 104:
        v4 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
        break;
      case 105:
        v4 = @"RESULTS_TRAY_CLUSTER";
        break;
      case 106:
        v4 = @"RESULTS_TRAY_VENUE_BROWSE";
        break;
      case 107:
        v4 = @"WATCH_MAP_RESULTS";
        break;
      case 108:
        v4 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
        break;
      case 109:
        v4 = @"WATCH_PLACES";
        break;
      case 110:
        v4 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
        break;
      case 111:
        v4 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
        break;
      case 112:
        v4 = @"DOWNLOADED_MAPS_DETAILS";
        break;
      case 113:
        v4 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
        break;
      case 114:
        v4 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
        break;
      case 115:
        v4 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
        break;
      case 116:
        v4 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
        break;
      case 117:
        v4 = @"WATCH_ROUTE_OPTIONS";
        break;
      case 118:
        v4 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
        break;
      case 119:
        v4 = @"WATCH_MORE_GUIDES";
        break;
      case 120:
        v4 = @"WATCH_RECENTLY_VIEWED";
        break;
      case 121:
        v4 = @"EV_SUCCESS_TRAY";
        break;
      case 122:
        v4 = @"PREFERRED_NETWORK_SELECTION_TRAY";
        break;
      case 123:
        v4 = @"PREFERRED_NETWORK_TRAY";
        break;
      case 124:
        v4 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 125:
        v4 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
        break;
      case 126:
        v4 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
        break;
      case 127:
        v4 = @"AC_KEYBOARD_TRAY";
        break;
      case 128:
        v4 = @"MORE_RELATED_TRAILS";
        break;
      case 129:
        v4 = @"MORE_RELATED_TRAILHEADS";
        break;
      case 130:
        v4 = @"ROUTING_TRAY_CUSTOM_ROUTE";
        break;
      case 131:
        v4 = @"CUSTOM_ROUTE_CREATION_TRAY";
        break;
      case 132:
        v4 = @"ROUTING_TRAY_CURATED_HIKE";
        break;
      case 133:
        v4 = @"MORE_CURATED_HIKES";
        break;
      case 134:
        v4 = @"CUSTOM_ROUTE_ONBOARDING";
        break;
      case 135:
        v4 = @"LIBRARY_ROUTES";
        break;
      case 136:
        v4 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 137:
        v4 = @"MY_LIBRARY";
        break;
      case 138:
        v4 = @"EDIT_NOTE_TRAY";
        break;
      case 139:
        v4 = @"CREATE_NOTE_TRAY";
        break;
      case 140:
        v4 = @"LIBRARY_PLACES";
        break;
      case 141:
        v4 = @"WATCH_ACCOUNT";
        break;
      case 142:
        v4 = @"WATCH_DOWNLOADED_MAPS";
        break;
      case 143:
        v4 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
        break;
      case 144:
        v4 = @"VISUAL_INTELLIGENCE_DETECTION";
        break;
      case 145:
        v4 = @"VISUAL_INTELLIGENCE_SNIPPET";
        break;
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_55;
      case 201:
        v4 = @"PLACECARD_TRAY";
        break;
      case 202:
        v4 = @"WEB_MODULE";
        break;
      case 250:
        v4 = @"ADD_FAVORITE_TRAY";
        break;
      case 251:
        v4 = @"COLLECTION_LIST";
        break;
      case 252:
        v4 = @"COLLECTION_VIEW";
        break;
      case 253:
        v4 = @"FAVORITE_DETAILS";
        break;
      case 254:
        v4 = @"FAVORITES_TRAY";
        break;
      case 255:
        v4 = @"SHARED_COLLECTION";
        break;
      case 256:
        v4 = @"SHARED_COLLECTION_VIEW";
        break;
      case 257:
        v4 = @"RECENTLY_VIEWED";
        break;
      case 258:
        v4 = @"SHARED_WEB_COLLECTION";
        break;
      case 259:
        v4 = @"CURATED_COLLECTION_VIEW";
        break;
      case 260:
        v4 = @"FEATURED_COLLECTIONS";
        break;
      case 261:
        v4 = @"PUBLISHER_TRAY";
        break;
      case 262:
        v4 = @"SHARED_CURATED_COLLECTION_VIEW";
        break;
      case 263:
        v4 = @"CURATED_COLLECTION_NOTIFICATION";
        break;
      case 264:
        v4 = @"CURATED_COLLECTION_LIST";
        break;
      case 265:
        v4 = @"PUBLISHER_LIST";
        break;
      case 266:
        v4 = @"WATCH_CURATED_COLLECTION_VIEW";
        break;
      case 267:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
        break;
      case 268:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
        break;
      case 301:
        v4 = @"ROUTING_TRAY_DRIVING";
        break;
      case 302:
        v4 = @"ROUTING_TRAY_WALKING";
        break;
      case 303:
        v4 = @"ROUTING_TRAY_TRANSIT";
        break;
      case 304:
        v4 = @"ROUTING_TRAY_RIDESHARE";
        break;
      case 305:
        v4 = @"ROUTING_TRAY_CYCLING";
        break;
      case 306:
        v4 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
        break;
      case 401:
        v4 = @"NAV_TRAY_DRIVING";
        break;
      case 402:
        v4 = @"NAV_TRAY_WALKING";
        break;
      case 403:
        v4 = @"NAV_TRAY_TRANSIT";
        break;
      case 404:
        v4 = @"NAV_TRAY_CYCLING";
        break;
      case 501:
        v4 = @"MAP_PLACECARD";
        break;
      case 502:
        v4 = @"MAP_SEARCH";
        break;
      case 503:
        v4 = @"MAP_RESULTS";
        break;
      case 504:
        v4 = @"MAP_ROUTING";
        break;
      case 505:
        v4 = @"MAP_NAV";
        break;
      case 506:
        v4 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
        break;
      case 507:
        v4 = @"MAP_TRAFFIC_INCIDENT";
        break;
      case 508:
        v4 = @"MAP_FULL_SCREEN";
        break;
      case 509:
        v4 = @"MAP_DRIVE";
        break;
      case 510:
        v4 = @"MAP_LAUNCH_AND_GO";
        break;
      case 511:
        v4 = @"MAP_VIEW";
        break;
      case 601:
        v4 = @"MAPS_SETTINGS";
        break;
      case 602:
        v4 = @"MAPS_PREFERENCES";
        break;
      case 603:
        v4 = @"RAP";
        break;
      case 604:
        v4 = @"ROUTING_DRIVING_DETAILS";
        break;
      case 605:
        v4 = @"ROUTING_WALKING_DETAILS";
        break;
      case 606:
        v4 = @"ROUTING_TRANSIT_DETAILS";
        break;
      case 607:
        v4 = @"ROUTING_EDITOR";
        break;
      case 608:
        v4 = @"NAV_DRIVING_DETAILS";
        break;
      case 609:
        v4 = @"NAV_WALKING_DETAILS";
        break;
      case 610:
        v4 = @"NAV_TRANSIT_DETAILS";
        break;
      case 611:
        v4 = @"NAV_AUDIO_SETTINGS";
        break;
      case 612:
        v4 = @"PHOTO_VIEWER_ALL";
        break;
      case 613:
        v4 = @"PHOTO_VIEWER_SINGLE";
        break;
      case 614:
        v4 = @"ROUTE_OPTIONS_TRANSIT";
        break;
      case 615:
        v4 = @"TRAFFIC_INCIDENT_TRAY";
        break;
      case 616:
        v4 = @"NAV_DIRECTIONS_BANNER_DRIVING";
        break;
      case 617:
        v4 = @"NAV_DIRECTIONS_BANNER_WALKING";
        break;
      case 618:
        v4 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
        break;
      case 619:
        v4 = @"REFINE_SEARCH_SUGGESTION_AREA";
        break;
      case 620:
        v4 = @"ADD_PHOTO_SHEET";
        break;
      case 621:
        v4 = @"ADD_PLACE_SHEET";
        break;
      case 622:
        v4 = @"SHARE_SHEET";
        break;
      case 623:
        v4 = @"EDIT_LOCATION_SHEET";
        break;
      case 624:
        v4 = @"ADD_CONTACT_SHEET";
        break;
      case 625:
        v4 = @"EDIT_NAME_SHEET";
        break;
      case 626:
        v4 = @"DRIVING_NAV_SETTINGS";
        break;
      case 627:
        v4 = @"TRANSIT_SETTINGS";
        break;
      case 628:
        v4 = @"TRANSIT_ADVISORY_SHEET";
        break;
      case 629:
        v4 = @"REMOVE_CAR_SHEET";
        break;
      case 630:
        v4 = @"ROUTE_OPTIONS_DRIVING";
        break;
      case 631:
        v4 = @"ROUTE_OPTIONS_DATETIME";
        break;
      case 632:
        v4 = @"TRANSIT_ADVISORY_BANNER";
        break;
      case 633:
        v4 = @"BOOK_TABLE_SELECT_TIME";
        break;
      case 634:
        v4 = @"BOOK_TABLE_MORE_OPTIONS";
        break;
      case 635:
        v4 = @"BOOK_TABLE_READY";
        break;
      case 636:
        v4 = @"BOOK_TABLE_BOOKED";
        break;
      case 637:
        v4 = @"TRANSIT_LINE_CLUSTER_SHEET";
        break;
      case 638:
        v4 = @"TRANSIT_LINE_LIST_SHEET";
        break;
      case 639:
        v4 = @"TRANSIT_BALANCE_BANNER";
        break;
      case 640:
        v4 = @"WEATHER_ICON";
        break;
      case 641:
        v4 = @"HELP_IMPROVE_MAPS_DIALOG";
        break;
      case 642:
        v4 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 643:
        v4 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 644:
        v4 = @"FLOOR_PICKER";
        break;
      case 645:
        v4 = @"VENUE_LIST";
        break;
      case 646:
        v4 = @"AR_MODE";
        break;
      case 647:
        v4 = @"ROUTING_TRANSIT_TICKETS_SHEET";
        break;
      case 648:
        v4 = @"LINKED_SERVICE_HOURS";
        break;
      case 649:
        v4 = @"SHARE_ETA_TRAY";
        break;
      case 650:
        v4 = @"ETA_UPDATE_TRAY";
        break;
      case 651:
        v4 = @"SCHEDULECARD_TRAY";
        break;
      case 652:
        v4 = @"AR_NAV";
        break;
      case 653:
        v4 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 654:
        v4 = @"LOCATIONS_INSIDE";
        break;
      case 655:
        v4 = @"SIMILAR_LOCATIONS";
        break;
      case 656:
        v4 = @"LOCATIONS_AT_ADDRESS";
        break;
      case 657:
        v4 = @"NAV_DIRECTIONS_BANNER_CYCLING";
        break;
      case 658:
        v4 = @"ROUTE_OPTIONS_CYCLING";
        break;
      case 659:
        v4 = @"EV_CONNECTION_TRAY";
        break;
      case 660:
        v4 = @"VIRTUAL_GARAGE";
        break;
      case 661:
        v4 = @"VIRTUAL_GARAGE_BANNER";
        break;
      case 662:
        v4 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
        break;
      case 663:
        v4 = @"ADVISORY_DETAILS_PAGE";
        break;
      case 664:
        v4 = @"APP_CLIP_NOTIFICATION";
        break;
      case 665:
        v4 = @"PHOTO_VIEWER_GALLERY";
        break;
      case 666:
        v4 = @"RECOMMENDATION_CARD";
        break;
      case 667:
        v4 = @"INCIDENT_REPORT_TRAY";
        break;
      case 668:
        v4 = @"MAPS_WIDGET_DISPLAY";
        break;
      case 669:
        v4 = @"VISUAL_LOCATION_FRAMEWORK";
        break;
      case 670:
        v4 = @"APP_CLIP_TRAY";
        break;
      case 671:
        v4 = @"LICENSE_PLATE_SUGGESTION_PAGE";
        break;
      case 672:
        v4 = @"NOTIFICATION_ADD_PLATE";
        break;
      case 673:
        v4 = @"MAPS_RESULTS";
        break;
      case 674:
        v4 = @"MAPS_WIDGET_APP_CONNECTION";
        break;
      case 675:
        v4 = @"MAPS_WIDGET_CURRENT_LOCATION";
        break;
      case 676:
        v4 = @"MAPS_WIDGET_CURRENT_NAV";
        break;
      case 677:
        v4 = @"MAPS_WIDGET_ETA";
        break;
      case 678:
        v4 = @"MAPS_WIDGET_TRANSIT";
        break;
      case 679:
        v4 = @"MAPS_WIDGET_UPC_DESTINATION";
        break;
      case 680:
        v4 = @"WIDGET_CREATION_TRAY";
        break;
      case 681:
        v4 = @"MAPS_WIDGET_HOME";
        break;
      case 682:
        v4 = @"MAPS_WIDGET_PARKED_CAR";
        break;
      case 683:
        v4 = @"MAPS_WIDGET_POI";
        break;
      case 684:
        v4 = @"MAPS_WIDGET_SCHOOL";
        break;
      case 685:
        v4 = @"MAPS_WIDGET_WORK";
        break;
      case 686:
        v4 = @"AIRPORT_NOTIFICATION";
        break;
      case 687:
        v4 = @"MAPS_WIDGET_EMPTY";
        break;
      case 688:
        v4 = @"COARSE_LOCATION_OPTIONS_PROMPT";
        break;
      case 689:
        v4 = @"ALLOW_PRECISE_LOCATION_PROMPT";
        break;
      case 690:
        v4 = @"SHARE_MY_LOCATION";
        break;
      case 691:
        v4 = @"MARK_MY_LOCATION";
        break;
      case 692:
        v4 = @"AIRPORT_NOTIFICATION_WATCH";
        break;
      case 693:
        v4 = @"EDIT_FAVORITE";
        break;
      case 694:
        v4 = @"ROUTING_CYCLING_DETAILS";
        break;
      case 695:
        v4 = @"NAV_CYCLING_DETAILS";
        break;
      case 696:
        v4 = @"MAPS_SUGGESTION_WIDGET";
        break;
      case 697:
        v4 = @"ARP_TIPKIT";
        break;
      case 698:
        v4 = @"ARP_PRIVACY";
        break;
      case 699:
        v4 = @"ROUTE_OPTIONS_WALKING";
        break;
      case 701:
        v4 = @"SAFARI_SEARCH";
        break;
      case 702:
        v4 = @"SPOTLIGHT_SEARCH";
        break;
      case 703:
        v4 = @"SAFARI_MAPS_SEARCH_RESULTS";
        break;
      case 704:
        v4 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
        break;
      case 705:
        v4 = @"WIDGET_MAPS_DESTINATIONS";
        break;
      case 706:
        v4 = @"WIDGET_MAPS_TRANSIT";
        break;
      case 707:
        v4 = @"WIDGET_MAPS_NEARBY";
        break;
      case 708:
        v4 = @"NOTIFICATION_FIND_MY_CAR";
        break;
      case 709:
        v4 = @"CONTROL_CENTER";
        break;
      case 710:
        v4 = @"NOTIFICATION_CENTER";
        break;
      case 711:
        v4 = @"NOTIFICATION_DOOM";
        break;
      case 712:
        v4 = @"NOTIFICATION_VENUES";
        break;
      case 713:
        v4 = @"NOTIFICATION_RAP_UPDATE";
        break;
      case 714:
        v4 = @"NOTIFICATION_TRIP_CANCELLED";
        break;
      case 715:
        v4 = @"NOTIFICATION_STOP_SKIPPED";
        break;
      case 716:
        v4 = @"NOTIFICATION_TRIP_DELAYED";
        break;
      case 717:
        v4 = @"NOTIFICATION_RAP";
        break;
      case 718:
        v4 = @"NOTIFICATION_PROXY_AUTH";
        break;
      case 719:
        v4 = @"NOTIFICATION_PUSH_TO_DEVICE";
        break;
      case 720:
        v4 = @"NOTIFICATION_LOW_FUEL";
        break;
      case 721:
        v4 = @"NOTIFICATION_FIND_MY_CAR_RESET";
        break;
      case 722:
        v4 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
        break;
      case 723:
        v4 = @"NOTIFICATION_SHARED_ETA";
        break;
      case 724:
        v4 = @"NOTIFICATION_SHARED_ETA_UPDATE";
        break;
      case 725:
        v4 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
        break;
      case 726:
        v4 = @"ANNOUNCEMENT_TYPE_GENERAL";
        break;
      case 727:
        v4 = @"ANNOUNCEMENT_TYPE_FLYOVER";
        break;
      case 728:
        v4 = @"ANNOUNCEMENT_TYPE_TRANSIT";
        break;
      case 729:
        v4 = @"ANNOUNCEMENT_TYPE_VENUES";
        break;
      case 730:
        v4 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
        break;
      case 731:
        v4 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
        break;
      case 732:
        v4 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
        break;
      case 733:
        v4 = @"APP_SHEET";
        break;
      case 734:
        v4 = @"CZ_ADVISORY_DETAILS_PAGE";
        break;
      case 735:
        v4 = @"SHARE_ETA_CONTACT_TRAY";
        break;
      case 736:
        v4 = @"SIRI_SHARE_ETA";
        break;
      case 737:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA";
        break;
      case 738:
        v4 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
        break;
      case 739:
        v4 = @"INCIDENT_ALERT_TRAY";
        break;
      case 740:
        v4 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
        break;
      case 741:
        v4 = @"RAP_INCIDENT_REPORT_VIEW";
        break;
      case 742:
        v4 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
        break;
      case 743:
        v4 = @"TRAFFIC_ADVISORY_SHEET";
        break;
      case 801:
        v4 = @"SIRI_PLUGIN_SNIPPET";
        break;
      case 802:
        v4 = @"SIRI_PLUGIN_COMMAND";
        break;
      case 803:
        v4 = @"SIRI_SEARCH_RESULT_LIST";
        break;
      case 804:
        v4 = @"SIRI_DISAMBIGUATION_LIST";
        break;
      case 805:
        v4 = @"SIRI_PLACE_SNIPPET";
        break;
      default:
        if (a3 != 901) {
          goto LABEL_55;
        }
        v4 = @"CHROME";
        break;
    }
  }
  return v4;
}

- (int)StringAsUiTarget:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UI_TARGET_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_POI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_SEARCH_RESULT_LIST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_POPULAR_NEARBY_LIST"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_CALLOUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_SEARCH_PIN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_DROPPED_PIN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UI_TARGET_TRANSIT_LINE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_BROWSE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_POPULAR_NEARBY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_AC"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_AC_INTERMEDIATE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRAY_NO_QUERY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AR_WALKING_LEGAL_TRAY"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RAISE_TO_START_AR_TRAY"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"EVENTS_ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_TRAY_CARPLAY"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHTED_AREA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TRAVEL_PREFERENCES_TRAY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RESULT_TRAY_SEARCH"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SINGLE_CARD_FILTER"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FULL_CARD_FILTER"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_PRIVACY_TRAY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"APPLE_RATINGS_HISTORY_TRAY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_FILTERED"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"CITY_MENU"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTIONS_HOME_CONDENSED"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ACCOUNT_TRAY"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"QUICK_ACTION_TRAY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SUBMIT_TRIP_FEEDBACK"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"RAP_PLACE_ISSUE_DETAILS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RAP_GUIDES_DETAILS"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"RAP_BAD_DIRECTIONS_DETAILS"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_MAP_DETAILS"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"WATCH_COMPLICATION"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"RAP_NAV_MENU"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ALIGHT_BANNER_TRANSIT"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_MENU"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"RAP_CURATED_COLLECTION_MENU"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_CARD_DETAILS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_NO_LOCATION_TRANSIT"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"RAP_STREET_ISSUE_DETAILS"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"NEARBY_TRANSIT_CARD"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_MENU"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"GENERIC_ADVISORY_PAGE"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"USER_PROFILE_TRAY"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"MEDIA_APP_MENU"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"TEMPLATE_PLACE_TRAY"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_RAP"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ALLOW_NOTIFICATION_DIALOG"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_DRIVING"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_ARP"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CONSENT_PROMPT"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"QUICK_ACTION_TRAY_VENDORS_MENU"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"PLACECARD_TRAY_VENDORS_MENU"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH_ROUTE_PLANNING"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE_TRAY"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS_SEARCH_ROUTE_PLANNING"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"PLACECARD_SHOWCASE_MENU"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"RAP_INLINE_ADD_DETAILS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_MENU_DETAILS"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"RAP_SUBMISSION_PROMPT"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"RAP_PLACECARD_EDIT_MENU"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"ARP_SUBMISSION_CONFIRMATION_PAGE"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_MENU"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"RAP_SELECT_BAD_ROUTES_STEPS"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"RAP_SELECT_BAD_ROUTES"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_RESUME_ROUTE"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY_LIST"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_BUSINESS_ENTITY"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ARP"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"IMPROVE_LOCATION_ACCURACY_PROMPT"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"YOUR_PHOTOS_ALBUM"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"ARP_PHOTO_CREDIT"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"RAP_OUTREACH_REVIEWED_REPORT"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"RAP_REPORT_MENU_MORE"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"WATCH_MAPS_SETTINGS"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"OFFLINE_FEATURE_PROMPT"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"EXPIRED_MAPS_DETAILS"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"MAPS_VIEW"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_OFFLINE"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"EXPIRED_MAPS_MANAGEMENT"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"OFFLINE_NEW_MAPS_MANAGEMENT"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"EDIT_EXPIRED_MAPS_MANAGEMENT"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"OFFLINE_MAPS_MANAGEMENT"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"REGION_SELECTOR"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"OFFLINE_SUGGESTED_MAPS_MANAGEMENT"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"FIND_MY_ETA_SHARING_TRAY"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACE"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_MAP"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_CONTROLS"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_CONTROLS"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_CONTROLS"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_RESULTS_CAROUSEL"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_CONTROLS"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_BROWSE"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_FAVORITES"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_CLUSTER"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"RESULTS_TRAY_VENUE_BROWSE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_RESULTS"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_ELEVATION_VIEW"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACES"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_ELEVATION_VIEW"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"DOWNLOADED_MAPS_DETAILS"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_OVERVIEW_MAP"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_OVERVIEW_MAP"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_OVERVIEW_MAP"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_OPTIONS"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_OVERVIEW_MAP"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"WATCH_MORE_GUIDES"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"WATCH_RECENTLY_VIEWED"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"EV_SUCCESS_TRAY"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"PREFERRED_NETWORK_SELECTION_TRAY"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"PREFERRED_NETWORK_TRAY"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"WALKING_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"FINDMY_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"CARPLAY_FIND_MY_ETA_SHARING_TRAY"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"AC_KEYBOARD_TRAY"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"MORE_RELATED_TRAILS"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"MORE_RELATED_TRAILHEADS"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CUSTOM_ROUTE"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"CUSTOM_ROUTE_CREATION_TRAY"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CURATED_HIKE"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"MORE_CURATED_HIKES"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"CUSTOM_ROUTE_ONBOARDING"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"LIBRARY_ROUTES"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"HIKING_TRANSITION_SUGGESTION_TRAY"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"MY_LIBRARY"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"EDIT_NOTE_TRAY"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"CREATE_NOTE_TRAY"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"LIBRARY_PLACES"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"WATCH_ACCOUNT"])
  {
    int v4 = 141;
  }
  else if ([v3 isEqualToString:@"WATCH_DOWNLOADED_MAPS"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION_LIST"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_DETECTION"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"VISUAL_INTELLIGENCE_SNIPPET"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"PLACECARD_TRAY"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"WEB_MODULE"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"ADD_FAVORITE_TRAY"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"COLLECTION_LIST"])
  {
    int v4 = 251;
  }
  else if ([v3 isEqualToString:@"COLLECTION_VIEW"])
  {
    int v4 = 252;
  }
  else if ([v3 isEqualToString:@"FAVORITE_DETAILS"])
  {
    int v4 = 253;
  }
  else if ([v3 isEqualToString:@"FAVORITES_TRAY"])
  {
    int v4 = 254;
  }
  else if ([v3 isEqualToString:@"SHARED_COLLECTION"])
  {
    int v4 = 255;
  }
  else if ([v3 isEqualToString:@"SHARED_COLLECTION_VIEW"])
  {
    int v4 = 256;
  }
  else if ([v3 isEqualToString:@"RECENTLY_VIEWED"])
  {
    int v4 = 257;
  }
  else if ([v3 isEqualToString:@"SHARED_WEB_COLLECTION"])
  {
    int v4 = 258;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_VIEW"])
  {
    int v4 = 259;
  }
  else if ([v3 isEqualToString:@"FEATURED_COLLECTIONS"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_TRAY"])
  {
    int v4 = 261;
  }
  else if ([v3 isEqualToString:@"SHARED_CURATED_COLLECTION_VIEW"])
  {
    int v4 = 262;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_NOTIFICATION"])
  {
    int v4 = 263;
  }
  else if ([v3 isEqualToString:@"CURATED_COLLECTION_LIST"])
  {
    int v4 = 264;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_LIST"])
  {
    int v4 = 265;
  }
  else if ([v3 isEqualToString:@"WATCH_CURATED_COLLECTION_VIEW"])
  {
    int v4 = 266;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_SUBLIST"])
  {
    int v4 = 267;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST"])
  {
    int v4 = 268;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_DRIVING"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_WALKING"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_TRANSIT"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_CYCLING"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_DRIVING"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_WALKING"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_TRANSIT"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"NAV_TRAY_CYCLING"])
  {
    int v4 = 404;
  }
  else if ([v3 isEqualToString:@"MAP_PLACECARD"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"MAP_SEARCH"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"MAP_ROUTING"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"MAP_NAV"])
  {
    int v4 = 505;
  }
  else if ([v3 isEqualToString:@"MAP_RESULTS_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 506;
  }
  else if ([v3 isEqualToString:@"MAP_TRAFFIC_INCIDENT"])
  {
    int v4 = 507;
  }
  else if ([v3 isEqualToString:@"MAP_FULL_SCREEN"])
  {
    int v4 = 508;
  }
  else if ([v3 isEqualToString:@"MAP_DRIVE"])
  {
    int v4 = 509;
  }
  else if ([v3 isEqualToString:@"MAP_LAUNCH_AND_GO"])
  {
    int v4 = 510;
  }
  else if ([v3 isEqualToString:@"MAP_VIEW"])
  {
    int v4 = 511;
  }
  else if ([v3 isEqualToString:@"MAPS_SETTINGS"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"MAPS_PREFERENCES"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"RAP"])
  {
    int v4 = 603;
  }
  else if ([v3 isEqualToString:@"ROUTING_DRIVING_DETAILS"])
  {
    int v4 = 604;
  }
  else if ([v3 isEqualToString:@"ROUTING_WALKING_DETAILS"])
  {
    int v4 = 605;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRANSIT_DETAILS"])
  {
    int v4 = 606;
  }
  else if ([v3 isEqualToString:@"ROUTING_EDITOR"])
  {
    int v4 = 607;
  }
  else if ([v3 isEqualToString:@"NAV_DRIVING_DETAILS"])
  {
    int v4 = 608;
  }
  else if ([v3 isEqualToString:@"NAV_WALKING_DETAILS"])
  {
    int v4 = 609;
  }
  else if ([v3 isEqualToString:@"NAV_TRANSIT_DETAILS"])
  {
    int v4 = 610;
  }
  else if ([v3 isEqualToString:@"NAV_AUDIO_SETTINGS"])
  {
    int v4 = 611;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_ALL"])
  {
    int v4 = 612;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_SINGLE"])
  {
    int v4 = 613;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_TRANSIT"])
  {
    int v4 = 614;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT_TRAY"])
  {
    int v4 = 615;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_DRIVING"])
  {
    int v4 = 616;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_WALKING"])
  {
    int v4 = 617;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_TRANSIT"])
  {
    int v4 = 618;
  }
  else if ([v3 isEqualToString:@"REFINE_SEARCH_SUGGESTION_AREA"])
  {
    int v4 = 619;
  }
  else if ([v3 isEqualToString:@"ADD_PHOTO_SHEET"])
  {
    int v4 = 620;
  }
  else if ([v3 isEqualToString:@"ADD_PLACE_SHEET"])
  {
    int v4 = 621;
  }
  else if ([v3 isEqualToString:@"SHARE_SHEET"])
  {
    int v4 = 622;
  }
  else if ([v3 isEqualToString:@"EDIT_LOCATION_SHEET"])
  {
    int v4 = 623;
  }
  else if ([v3 isEqualToString:@"ADD_CONTACT_SHEET"])
  {
    int v4 = 624;
  }
  else if ([v3 isEqualToString:@"EDIT_NAME_SHEET"])
  {
    int v4 = 625;
  }
  else if ([v3 isEqualToString:@"DRIVING_NAV_SETTINGS"])
  {
    int v4 = 626;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SETTINGS"])
  {
    int v4 = 627;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ADVISORY_SHEET"])
  {
    int v4 = 628;
  }
  else if ([v3 isEqualToString:@"REMOVE_CAR_SHEET"])
  {
    int v4 = 629;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_DRIVING"])
  {
    int v4 = 630;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_DATETIME"])
  {
    int v4 = 631;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ADVISORY_BANNER"])
  {
    int v4 = 632;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_SELECT_TIME"])
  {
    int v4 = 633;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_MORE_OPTIONS"])
  {
    int v4 = 634;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_READY"])
  {
    int v4 = 635;
  }
  else if ([v3 isEqualToString:@"BOOK_TABLE_BOOKED"])
  {
    int v4 = 636;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_CLUSTER_SHEET"])
  {
    int v4 = 637;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE_LIST_SHEET"])
  {
    int v4 = 638;
  }
  else if ([v3 isEqualToString:@"TRANSIT_BALANCE_BANNER"])
  {
    int v4 = 639;
  }
  else if ([v3 isEqualToString:@"WEATHER_ICON"])
  {
    int v4 = 640;
  }
  else if ([v3 isEqualToString:@"HELP_IMPROVE_MAPS_DIALOG"])
  {
    int v4 = 641;
  }
  else if ([v3 isEqualToString:@"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG"])
  {
    int v4 = 642;
  }
  else if ([v3 isEqualToString:@"COMMUTE_PREDICTION_ACCURACY_DIALOG"])
  {
    int v4 = 643;
  }
  else if ([v3 isEqualToString:@"FLOOR_PICKER"])
  {
    int v4 = 644;
  }
  else if ([v3 isEqualToString:@"VENUE_LIST"])
  {
    int v4 = 645;
  }
  else if ([v3 isEqualToString:@"AR_MODE"])
  {
    int v4 = 646;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRANSIT_TICKETS_SHEET"])
  {
    int v4 = 647;
  }
  else if ([v3 isEqualToString:@"LINKED_SERVICE_HOURS"])
  {
    int v4 = 648;
  }
  else if ([v3 isEqualToString:@"SHARE_ETA_TRAY"])
  {
    int v4 = 649;
  }
  else if ([v3 isEqualToString:@"ETA_UPDATE_TRAY"])
  {
    int v4 = 650;
  }
  else if ([v3 isEqualToString:@"SCHEDULECARD_TRAY"])
  {
    int v4 = 651;
  }
  else if ([v3 isEqualToString:@"AR_NAV"])
  {
    int v4 = 652;
  }
  else if ([v3 isEqualToString:@"TAP_TRANSIT_ACCESS_POINT"])
  {
    int v4 = 653;
  }
  else if ([v3 isEqualToString:@"LOCATIONS_INSIDE"])
  {
    int v4 = 654;
  }
  else if ([v3 isEqualToString:@"SIMILAR_LOCATIONS"])
  {
    int v4 = 655;
  }
  else if ([v3 isEqualToString:@"LOCATIONS_AT_ADDRESS"])
  {
    int v4 = 656;
  }
  else if ([v3 isEqualToString:@"NAV_DIRECTIONS_BANNER_CYCLING"])
  {
    int v4 = 657;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_CYCLING"])
  {
    int v4 = 658;
  }
  else if ([v3 isEqualToString:@"EV_CONNECTION_TRAY"])
  {
    int v4 = 659;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE"])
  {
    int v4 = 660;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE_BANNER"])
  {
    int v4 = 661;
  }
  else if ([v3 isEqualToString:@"VIRTUAL_GARAGE_VEHICLE_VIEW"])
  {
    int v4 = 662;
  }
  else if ([v3 isEqualToString:@"ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 663;
  }
  else if ([v3 isEqualToString:@"APP_CLIP_NOTIFICATION"])
  {
    int v4 = 664;
  }
  else if ([v3 isEqualToString:@"PHOTO_VIEWER_GALLERY"])
  {
    int v4 = 665;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION_CARD"])
  {
    int v4 = 666;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_TRAY"])
  {
    int v4 = 667;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_DISPLAY"])
  {
    int v4 = 668;
  }
  else if ([v3 isEqualToString:@"VISUAL_LOCATION_FRAMEWORK"])
  {
    int v4 = 669;
  }
  else if ([v3 isEqualToString:@"APP_CLIP_TRAY"])
  {
    int v4 = 670;
  }
  else if ([v3 isEqualToString:@"LICENSE_PLATE_SUGGESTION_PAGE"])
  {
    int v4 = 671;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_ADD_PLATE"])
  {
    int v4 = 672;
  }
  else if ([v3 isEqualToString:@"MAPS_RESULTS"])
  {
    int v4 = 673;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_APP_CONNECTION"])
  {
    int v4 = 674;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_CURRENT_LOCATION"])
  {
    int v4 = 675;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_CURRENT_NAV"])
  {
    int v4 = 676;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_ETA"])
  {
    int v4 = 677;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_TRANSIT"])
  {
    int v4 = 678;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_UPC_DESTINATION"])
  {
    int v4 = 679;
  }
  else if ([v3 isEqualToString:@"WIDGET_CREATION_TRAY"])
  {
    int v4 = 680;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_HOME"])
  {
    int v4 = 681;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_PARKED_CAR"])
  {
    int v4 = 682;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_POI"])
  {
    int v4 = 683;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_SCHOOL"])
  {
    int v4 = 684;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_WORK"])
  {
    int v4 = 685;
  }
  else if ([v3 isEqualToString:@"AIRPORT_NOTIFICATION"])
  {
    int v4 = 686;
  }
  else if ([v3 isEqualToString:@"MAPS_WIDGET_EMPTY"])
  {
    int v4 = 687;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_OPTIONS_PROMPT"])
  {
    int v4 = 688;
  }
  else if ([v3 isEqualToString:@"ALLOW_PRECISE_LOCATION_PROMPT"])
  {
    int v4 = 689;
  }
  else if ([v3 isEqualToString:@"SHARE_MY_LOCATION"])
  {
    int v4 = 690;
  }
  else if ([v3 isEqualToString:@"MARK_MY_LOCATION"])
  {
    int v4 = 691;
  }
  else if ([v3 isEqualToString:@"AIRPORT_NOTIFICATION_WATCH"])
  {
    int v4 = 692;
  }
  else if ([v3 isEqualToString:@"EDIT_FAVORITE"])
  {
    int v4 = 693;
  }
  else if ([v3 isEqualToString:@"ROUTING_CYCLING_DETAILS"])
  {
    int v4 = 694;
  }
  else if ([v3 isEqualToString:@"NAV_CYCLING_DETAILS"])
  {
    int v4 = 695;
  }
  else if ([v3 isEqualToString:@"MAPS_SUGGESTION_WIDGET"])
  {
    int v4 = 696;
  }
  else if ([v3 isEqualToString:@"ARP_TIPKIT"])
  {
    int v4 = 697;
  }
  else if ([v3 isEqualToString:@"ARP_PRIVACY"])
  {
    int v4 = 698;
  }
  else if ([v3 isEqualToString:@"ROUTE_OPTIONS_WALKING"])
  {
    int v4 = 699;
  }
  else if ([v3 isEqualToString:@"SAFARI_SEARCH"])
  {
    int v4 = 701;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_SEARCH"])
  {
    int v4 = 702;
  }
  else if ([v3 isEqualToString:@"SAFARI_MAPS_SEARCH_RESULTS"])
  {
    int v4 = 703;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_MAPS_SEARCH_RESULTS"])
  {
    int v4 = 704;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_DESTINATIONS"])
  {
    int v4 = 705;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_TRANSIT"])
  {
    int v4 = 706;
  }
  else if ([v3 isEqualToString:@"WIDGET_MAPS_NEARBY"])
  {
    int v4 = 707;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_FIND_MY_CAR"])
  {
    int v4 = 708;
  }
  else if ([v3 isEqualToString:@"CONTROL_CENTER"])
  {
    int v4 = 709;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_CENTER"])
  {
    int v4 = 710;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_DOOM"])
  {
    int v4 = 711;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_VENUES"])
  {
    int v4 = 712;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_RAP_UPDATE"])
  {
    int v4 = 713;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRIP_CANCELLED"])
  {
    int v4 = 714;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_STOP_SKIPPED"])
  {
    int v4 = 715;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRIP_DELAYED"])
  {
    int v4 = 716;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_RAP"])
  {
    int v4 = 717;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_PROXY_AUTH"])
  {
    int v4 = 718;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_PUSH_TO_DEVICE"])
  {
    int v4 = 719;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_LOW_FUEL"])
  {
    int v4 = 720;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_FIND_MY_CAR_RESET"])
  {
    int v4 = 721;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_TRAFFIC_CONDITIONS"])
  {
    int v4 = 722;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_SHARED_ETA"])
  {
    int v4 = 723;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_SHARED_ETA_UPDATE"])
  {
    int v4 = 724;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_UNKNOWN"])
  {
    int v4 = 725;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_GENERAL"])
  {
    int v4 = 726;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_FLYOVER"])
  {
    int v4 = 727;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_TRANSIT"])
  {
    int v4 = 728;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_VENUES"])
  {
    int v4 = 729;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL"])
  {
    int v4 = 730;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LANE_GUIDANCE"])
  {
    int v4 = 731;
  }
  else if ([v3 isEqualToString:@"ANNOUNCEMENT_TYPE_LOOK_AROUND"])
  {
    int v4 = 732;
  }
  else if ([v3 isEqualToString:@"APP_SHEET"])
  {
    int v4 = 733;
  }
  else if ([v3 isEqualToString:@"CZ_ADVISORY_DETAILS_PAGE"])
  {
    int v4 = 734;
  }
  else if ([v3 isEqualToString:@"SHARE_ETA_CONTACT_TRAY"])
  {
    int v4 = 735;
  }
  else if ([v3 isEqualToString:@"SIRI_SHARE_ETA"])
  {
    int v4 = 736;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA"])
  {
    int v4 = 737;
  }
  else if ([v3 isEqualToString:@"SIRI_SUGGESTION_SHARED_ETA_CARPLAY"])
  {
    int v4 = 738;
  }
  else if ([v3 isEqualToString:@"INCIDENT_ALERT_TRAY"])
  {
    int v4 = 739;
  }
  else if ([v3 isEqualToString:@"INCIDENT_REPORT_CONFIRMATION_TRAY"])
  {
    int v4 = 740;
  }
  else if ([v3 isEqualToString:@"RAP_INCIDENT_REPORT_VIEW"])
  {
    int v4 = 741;
  }
  else if ([v3 isEqualToString:@"SEARCH_ALONG_ROUTE_CATEGORY_TRAY"])
  {
    int v4 = 742;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_ADVISORY_SHEET"])
  {
    int v4 = 743;
  }
  else if ([v3 isEqualToString:@"SIRI_PLUGIN_SNIPPET"])
  {
    int v4 = 801;
  }
  else if ([v3 isEqualToString:@"SIRI_PLUGIN_COMMAND"])
  {
    int v4 = 802;
  }
  else if ([v3 isEqualToString:@"SIRI_SEARCH_RESULT_LIST"])
  {
    int v4 = 803;
  }
  else if ([v3 isEqualToString:@"SIRI_DISAMBIGUATION_LIST"])
  {
    int v4 = 804;
  }
  else if ([v3 isEqualToString:@"SIRI_PLACE_SNIPPET"])
  {
    int v4 = 805;
  }
  else if ([v3 isEqualToString:@"CHROME"])
  {
    int v4 = 901;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NAV"])
  {
    int v4 = 1001;
  }
  else if ([v3 isEqualToString:@"CARPLAY_EXPLORE"])
  {
    int v4 = 1002;
  }
  else if ([v3 isEqualToString:@"CARPLAY_DESTINATIONS"])
  {
    int v4 = 1003;
  }
  else if ([v3 isEqualToString:@"CARPLAY_TRAFFIC_INCIDENT"])
  {
    int v4 = 1004;
  }
  else if ([v3 isEqualToString:@"CARPLAY_CONTROL"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"CARPLAY_PROACTIVE"])
  {
    int v4 = 1006;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ROUTING"])
  {
    int v4 = 1007;
  }
  else if ([v3 isEqualToString:@"CARPLAY_MORE_ROUTES"])
  {
    int v4 = 1008;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 1009;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH"])
  {
    int v4 = 1010;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SEARCH_RESULTS"])
  {
    int v4 = 1011;
  }
  else if ([v3 isEqualToString:@"CARPLAY_FAVORITES"])
  {
    int v4 = 1012;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NAV_CONFIRMATION"])
  {
    int v4 = 1013;
  }
  else if ([v3 isEqualToString:@"CARPLAY_DESTINATION_SHARING"])
  {
    int v4 = 1014;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_BATTERY"])
  {
    int v4 = 1015;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_DOOM"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_FUEL"])
  {
    int v4 = 1017;
  }
  else if ([v3 isEqualToString:@"CARPLAY_NOTIFICATION_HYBRID"])
  {
    int v4 = 1018;
  }
  else if ([v3 isEqualToString:@"CARPLAY_SHARE_ETA_TRAY"])
  {
    int v4 = 1019;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ETA_UPDATE_TRAY"])
  {
    int v4 = 1020;
  }
  else if ([v3 isEqualToString:@"CARPLAY_ACTION_TRAY"])
  {
    int v4 = 1021;
  }
  else if ([v3 isEqualToString:@"CARPLAY_PLACECARD"])
  {
    int v4 = 1022;
  }
  else if ([v3 isEqualToString:@"CARPLAY_KEYBOARD"])
  {
    int v4 = 1023;
  }
  else if ([v3 isEqualToString:@"CARPLAY_UI_TARGET_UNKNOWN"])
  {
    int v4 = 1024;
  }
  else if ([v3 isEqualToString:@"CARPLAY_EDIT_STOPS"])
  {
    int v4 = 1025;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_MENU"])
  {
    int v4 = 1100;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST"])
  {
    int v4 = 1101;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM"])
  {
    int v4 = 1102;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM"])
  {
    int v4 = 1103;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM"])
  {
    int v4 = 1104;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM"])
  {
    int v4 = 1105;
  }
  else if ([v3 isEqualToString:@"RAP_TRANSIT_MENU"])
  {
    int v4 = 1106;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_MAP"])
  {
    int v4 = 1107;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_MENU"])
  {
    int v4 = 1108;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP"])
  {
    int v4 = 1109;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM"])
  {
    int v4 = 1110;
  }
  else if ([v3 isEqualToString:@"RAP_STATION_CLOSED_FORM"])
  {
    int v4 = 1111;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_MAP"])
  {
    int v4 = 1112;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_MENU"])
  {
    int v4 = 1113;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_NAME_FORM"])
  {
    int v4 = 1114;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_SHAPE_FORM"])
  {
    int v4 = 1115;
  }
  else if ([v3 isEqualToString:@"RAP_LINE_SCHEDULE_INCORRECT_FORM"])
  {
    int v4 = 1116;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_PLACE_MENU"])
  {
    int v4 = 1117;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_POI_MAP"])
  {
    int v4 = 1118;
  }
  else if ([v3 isEqualToString:@"RAP_CATEGORY_LIST"])
  {
    int v4 = 1119;
  }
  else if ([v3 isEqualToString:@"RAP_POI_DETAILS_FORM"])
  {
    int v4 = 1120;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_STREET_MAP"])
  {
    int v4 = 1121;
  }
  else if ([v3 isEqualToString:@"RAP_STREET_DETAILS_FORM"])
  {
    int v4 = 1122;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_OTHER_MAP"])
  {
    int v4 = 1123;
  }
  else if ([v3 isEqualToString:@"RAP_OTHER_DETAILS_FORM"])
  {
    int v4 = 1124;
  }
  else if ([v3 isEqualToString:@"RAP_CAMERA"])
  {
    int v4 = 1125;
  }
  else if ([v3 isEqualToString:@"RAP_LABEL_MAP"])
  {
    int v4 = 1126;
  }
  else if ([v3 isEqualToString:@"RAP_LABEL_DETAILS_FORM"])
  {
    int v4 = 1127;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_MENU"])
  {
    int v4 = 1128;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_UNEXPECTED_RESULT_FORM"])
  {
    int v4 = 1129;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_ADDRESS_INCORRECT_FORM"])
  {
    int v4 = 1130;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_MAP"])
  {
    int v4 = 1131;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM"])
  {
    int v4 = 1132;
  }
  else if ([v3 isEqualToString:@"RAP_SATELLITE_IMAGE_MAP"])
  {
    int v4 = 1133;
  }
  else if ([v3 isEqualToString:@"RAP_SATELLITE_IMAGE_DETAILS_FORM"])
  {
    int v4 = 1134;
  }
  else if ([v3 isEqualToString:@"RAP_OTHER_FORM"])
  {
    int v4 = 1135;
  }
  else if ([v3 isEqualToString:@"RAP_PRIVACY"])
  {
    int v4 = 1136;
  }
  else if ([v3 isEqualToString:@"RAP_CONFIRMATION"])
  {
    int v4 = 1137;
  }
  else if ([v3 isEqualToString:@"RAP_POI_MENU"])
  {
    int v4 = 1138;
  }
  else if ([v3 isEqualToString:@"RAP_SEARCH_AUTOCOMPLETE_MENU"])
  {
    int v4 = 1139;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_A_PLACE_MAP"])
  {
    int v4 = 1140;
  }
  else if ([v3 isEqualToString:@"RAP_POI_LOCATION_MAP"])
  {
    int v4 = 1141;
  }
  else if ([v3 isEqualToString:@"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP"])
  {
    int v4 = 1142;
  }
  else if ([v3 isEqualToString:@"RAP_POI_CLOSED_FORM"])
  {
    int v4 = 1143;
  }
  else if ([v3 isEqualToString:@"RAP_CLAIM_BUSINESS_DIALOG"])
  {
    int v4 = 1144;
  }
  else if ([v3 isEqualToString:@"RAP_BRAND_MENU"])
  {
    int v4 = 1145;
  }
  else if ([v3 isEqualToString:@"RAP_BRAND_DETAILS_FORM"])
  {
    int v4 = 1146;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM"])
  {
    int v4 = 1147;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STREET_FORM"])
  {
    int v4 = 1148;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_BLURRING_FORM"])
  {
    int v4 = 1149;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_REMOVE_HOME_FORM"])
  {
    int v4 = 1150;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_MENU"])
  {
    int v4 = 1151;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_LABELS_STORE_FORM"])
  {
    int v4 = 1152;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND_PRIVACY_MENU"])
  {
    int v4 = 1153;
  }
  else if ([v3 isEqualToString:@"RAP_LIGHTWEIGHT"])
  {
    int v4 = 1154;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_PLACE_DETAILS"])
  {
    int v4 = 1155;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_CATEGORY"])
  {
    int v4 = 1156;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_HOURS"])
  {
    int v4 = 1157;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_LOCATION"])
  {
    int v4 = 1158;
  }
  else if ([v3 isEqualToString:@"RAP_EDIT_ENTRY_POINT"])
  {
    int v4 = 1159;
  }
  else if ([v3 isEqualToString:@"RAP_LOOK_AROUND"])
  {
    int v4 = 1160;
  }
  else if ([v3 isEqualToString:@"RAP_ADD_ENTRY_POINT"])
  {
    int v4 = 1161;
  }
  else if ([v3 isEqualToString:@"WATCH_MAIN_MENU"])
  {
    int v4 = 1201;
  }
  else if ([v3 isEqualToString:@"WATCH_MAIN_PRESS_MENU"])
  {
    int v4 = 1202;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH"])
  {
    int v4 = 1203;
  }
  else if ([v3 isEqualToString:@"WATCH_DICTATION"])
  {
    int v4 = 1204;
  }
  else if ([v3 isEqualToString:@"WATCH_FAVORITES"])
  {
    int v4 = 1205;
  }
  else if ([v3 isEqualToString:@"WATCH_SUB_CATEGORY_LIST"])
  {
    int v4 = 1206;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_RESULTS_LIST"])
  {
    int v4 = 1207;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_VIEW"])
  {
    int v4 = 1208;
  }
  else if ([v3 isEqualToString:@"WATCH_PLACECARD"])
  {
    int v4 = 1209;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING"])
  {
    int v4 = 1210;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_DETAILS"])
  {
    int v4 = 1211;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TBT"])
  {
    int v4 = 1212;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_MAP"])
  {
    int v4 = 1213;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_PRESS_MENU"])
  {
    int v4 = 1214;
  }
  else if ([v3 isEqualToString:@"WATCH_MAP_PRESS_MENU"])
  {
    int v4 = 1215;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTING_PRESS_MENU"])
  {
    int v4 = 1216;
  }
  else if ([v3 isEqualToString:@"WATCH_TRANSIT_MAP_VIEW"])
  {
    int v4 = 1217;
  }
  else if ([v3 isEqualToString:@"WATCH_SCRIBBLE"])
  {
    int v4 = 1218;
  }
  else if ([v3 isEqualToString:@"WATCH_COLLECTION_VIEW"])
  {
    int v4 = 1219;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_WALKING"])
  {
    int v4 = 1220;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_DRIVING"])
  {
    int v4 = 1221;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_TRANSIT"])
  {
    int v4 = 1222;
  }
  else if ([v3 isEqualToString:@"WATCH_PAIRED_DEVICE"])
  {
    int v4 = 1223;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_SPLIT"])
  {
    int v4 = 1224;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_PLATTER"])
  {
    int v4 = 1225;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_DRIVING_MAP"])
  {
    int v4 = 1226;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_SPLIT"])
  {
    int v4 = 1227;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_PLATTER"])
  {
    int v4 = 1228;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_WALKING_MAP"])
  {
    int v4 = 1229;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_SPLIT"])
  {
    int v4 = 1230;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_PLATTER"])
  {
    int v4 = 1231;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_TRANSIT_MAP"])
  {
    int v4 = 1232;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_INFO"])
  {
    int v4 = 1233;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_MAP"])
  {
    int v4 = 1234;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_PLATTER"])
  {
    int v4 = 1235;
  }
  else if ([v3 isEqualToString:@"WATCH_NAV_CYCLING_SPLIT"])
  {
    int v4 = 1236;
  }
  else if ([v3 isEqualToString:@"WATCH_ROUTE_PLANNING_CYCLING"])
  {
    int v4 = 1237;
  }
  else if ([v3 isEqualToString:@"WATCH_SEARCH_INPUT"])
  {
    int v4 = 1238;
  }
  else if ([v3 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE"])
  {
    int v4 = 1239;
  }
  else if ([v3 isEqualToString:@"WATCH_SIRI_SUGGESTION_RESUME_ROUTE"])
  {
    int v4 = 1240;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_LIST"])
  {
    int v4 = 1301;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_FORM"])
  {
    int v4 = 1302;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_LABEL_FORM"])
  {
    int v4 = 1303;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_EDIT_MAP"])
  {
    int v4 = 1304;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_CONFIRMATION"])
  {
    int v4 = 1305;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_DELETE_DIALOG"])
  {
    int v4 = 1306;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_INFO"])
  {
    int v4 = 1307;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH"])
  {
    int v4 = 1308;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_ADDRESS_SEARCH_RESULTS"])
  {
    int v4 = 1309;
  }
  else if ([v3 isEqualToString:@"FAVORITE_SEARCH"])
  {
    int v4 = 1310;
  }
  else if ([v3 isEqualToString:@"FAVORITE_LIST"])
  {
    int v4 = 1311;
  }
  else if ([v3 isEqualToString:@"FAVORITE_INFO"])
  {
    int v4 = 1312;
  }
  else if ([v3 isEqualToString:@"PERSONALIZED_CONFIRMATION_WITH_PRIVACY"])
  {
    int v4 = 1313;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS"])
  {
    int v4 = 1401;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING"])
  {
    int v4 = 1402;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING"])
  {
    int v4 = 1403;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED"])
  {
    int v4 = 1404;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG"])
  {
    int v4 = 1405;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_FEEDBACK"])
  {
    int v4 = 1406;
  }
  else if ([v3 isEqualToString:@"ROUTING_TRAY_RIDESHARE_ENABLE_ALL"])
  {
    int v4 = 1407;
  }
  else if ([v3 isEqualToString:@"PLACECARD_HEADER"])
  {
    int v4 = 1501;
  }
  else if ([v3 isEqualToString:@"PLACECARD_ADDRESS"])
  {
    int v4 = 1502;
  }
  else if ([v3 isEqualToString:@"PLACECARD_PHONE"])
  {
    int v4 = 1503;
  }
  else if ([v3 isEqualToString:@"PLACECARD_URL"])
  {
    int v4 = 1504;
  }
  else if ([v3 isEqualToString:@"MENU_ITEM_DARK_MAP"])
  {
    int v4 = 1601;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP"])
  {
    int v4 = 1700;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_ACTION_SHEET"])
  {
    int v4 = 1701;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_VIEW"])
  {
    int v4 = 1702;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PLATTER"])
  {
    int v4 = 1703;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM"])
  {
    int v4 = 1704;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_UNAVAILABLE_REGION"])
  {
    int v4 = 1705;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_VIEW_PLACECARD"])
  {
    int v4 = 1706;
  }
  else if ([v3 isEqualToString:@"LOOK_AROUND_PIP_PLACECARD"])
  {
    int v4 = 1707;
  }
  else if ([v3 isEqualToString:@"OFFLINE_BROWSE_ONLY_SEARCH_TRAY"])
  {
    int v4 = 1708;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_PLACE"])
  {
    int v4 = 1801;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SEARCH"])
  {
    int v4 = 1802;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SEARCH_RESULTS"])
  {
    int v4 = 1803;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_PUBLISHER"])
  {
    int v4 = 1804;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_GUIDE"])
  {
    int v4 = 1805;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_GUIDES_HOME"])
  {
    int v4 = 1806;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_RELATED_PLACES_LIST"])
  {
    int v4 = 1807;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_COLLECTION_LIST"])
  {
    int v4 = 1808;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_DIRECTIONS"])
  {
    int v4 = 1809;
  }
  else if ([v3 isEqualToString:@"MAPS_WEB_SIDEBAR"])
  {
    int v4 = 1810;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)layoutInfo
{
  if (*(unsigned char *)&self->_flags) {
    return self->_layoutInfo;
  }
  else {
    return 0;
  }
}

- (void)setLayoutInfo:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_layoutInfo = a3;
}

- (void)setHasLayoutInfo:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLayoutInfo
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)layoutInfoAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8BF8[a3];
  }

  return v3;
}

- (int)StringAsLayoutInfo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LAYOUT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MINI_LAYOUT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTIAL_LAYOUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FULL_LAYOUT"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)layoutStyle
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_layoutStyle;
  }
  else {
    return 0;
  }
}

- (void)setLayoutStyle:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_layoutStyle = a3;
}

- (void)setHasLayoutStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLayoutStyle
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)layoutStyleAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8C18[a3];
  }

  return v3;
}

- (int)StringAsLayoutStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STYLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STANDARD_STYLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPACT_STYLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SIDE_BAR_STYLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FLOATING_STYLE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"STANDARD_SIDE_STYLE"])
  {
    int v4 = 5;
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
  v8.super_class = (Class)GEOTargetLayout;
  int v4 = [(GEOTargetLayout *)&v8 description];
  id v5 = [(GEOTargetLayout *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTargetLayout _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_530;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
      goto LABEL_4;
    }
LABEL_516:
    uint64_t v9 = *(int *)(a1 + 8);
    if (v9 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53F8BF8[v9];
    }
    if (a2) {
      v11 = @"layoutInfo";
    }
    else {
      v11 = @"layout_info";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_530;
    }
    goto LABEL_523;
  }
  int v6 = *(_DWORD *)(a1 + 16);
  if (v6 > 1000)
  {
    if (v6 > 1600)
    {
      switch(v6)
      {
        case 1700:
          v7 = @"LOOK_AROUND_PIP";
          break;
        case 1701:
          v7 = @"LOOK_AROUND_ACTION_SHEET";
          break;
        case 1702:
          v7 = @"LOOK_AROUND_VIEW";
          break;
        case 1703:
          v7 = @"LOOK_AROUND_PLATTER";
          break;
        case 1704:
          v7 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
          break;
        case 1705:
          v7 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
          break;
        case 1706:
          v7 = @"LOOK_AROUND_VIEW_PLACECARD";
          break;
        case 1707:
          v7 = @"LOOK_AROUND_PIP_PLACECARD";
          break;
        case 1708:
          v7 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
          break;
        default:
          if (v6 == 1601)
          {
            v7 = @"MENU_ITEM_DARK_MAP";
          }
          else
          {
LABEL_30:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          break;
      }
    }
    else
    {
      switch(v6)
      {
        case 1001:
          v7 = @"CARPLAY_NAV";
          break;
        case 1002:
          v7 = @"CARPLAY_EXPLORE";
          break;
        case 1003:
          v7 = @"CARPLAY_DESTINATIONS";
          break;
        case 1004:
          v7 = @"CARPLAY_TRAFFIC_INCIDENT";
          break;
        case 1005:
          v7 = @"CARPLAY_CONTROL";
          break;
        case 1006:
          v7 = @"CARPLAY_PROACTIVE";
          break;
        case 1007:
          v7 = @"CARPLAY_ROUTING";
          break;
        case 1008:
          v7 = @"CARPLAY_MORE_ROUTES";
          break;
        case 1009:
          v7 = @"CARPLAY_SEARCH_ALONG_ROUTE";
          break;
        case 1010:
          v7 = @"CARPLAY_SEARCH";
          break;
        case 1011:
          v7 = @"CARPLAY_SEARCH_RESULTS";
          break;
        case 1012:
          v7 = @"CARPLAY_FAVORITES";
          break;
        case 1013:
          v7 = @"CARPLAY_NAV_CONFIRMATION";
          break;
        case 1014:
          v7 = @"CARPLAY_DESTINATION_SHARING";
          break;
        case 1015:
          v7 = @"CARPLAY_NOTIFICATION_BATTERY";
          break;
        case 1016:
          v7 = @"CARPLAY_NOTIFICATION_DOOM";
          break;
        case 1017:
          v7 = @"CARPLAY_NOTIFICATION_FUEL";
          break;
        case 1018:
          v7 = @"CARPLAY_NOTIFICATION_HYBRID";
          break;
        case 1019:
          v7 = @"CARPLAY_SHARE_ETA_TRAY";
          break;
        case 1020:
          v7 = @"CARPLAY_ETA_UPDATE_TRAY";
          break;
        case 1021:
          v7 = @"CARPLAY_ACTION_TRAY";
          break;
        case 1022:
          v7 = @"CARPLAY_PLACECARD";
          break;
        case 1023:
          v7 = @"CARPLAY_KEYBOARD";
          break;
        case 1024:
          v7 = @"CARPLAY_UI_TARGET_UNKNOWN";
          break;
        case 1025:
          v7 = @"CARPLAY_EDIT_STOPS";
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_30;
        case 1100:
          v7 = @"RAP_DIRECTIONS_MENU";
          break;
        case 1101:
          v7 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
          break;
        case 1102:
          v7 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
          break;
        case 1103:
          v7 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
          break;
        case 1104:
          v7 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
          break;
        case 1105:
          v7 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
          break;
        case 1106:
          v7 = @"RAP_TRANSIT_MENU";
          break;
        case 1107:
          v7 = @"RAP_STATION_MAP";
          break;
        case 1108:
          v7 = @"RAP_STATION_MENU";
          break;
        case 1109:
          v7 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
          break;
        case 1110:
          v7 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
          break;
        case 1111:
          v7 = @"RAP_STATION_CLOSED_FORM";
          break;
        case 1112:
          v7 = @"RAP_LINE_MAP";
          break;
        case 1113:
          v7 = @"RAP_LINE_MENU";
          break;
        case 1114:
          v7 = @"RAP_LINE_NAME_FORM";
          break;
        case 1115:
          v7 = @"RAP_LINE_SHAPE_FORM";
          break;
        case 1116:
          v7 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
          break;
        case 1117:
          v7 = @"RAP_ADD_PLACE_MENU";
          break;
        case 1118:
          v7 = @"RAP_ADD_POI_MAP";
          break;
        case 1119:
          v7 = @"RAP_CATEGORY_LIST";
          break;
        case 1120:
          v7 = @"RAP_POI_DETAILS_FORM";
          break;
        case 1121:
          v7 = @"RAP_ADD_STREET_MAP";
          break;
        case 1122:
          v7 = @"RAP_STREET_DETAILS_FORM";
          break;
        case 1123:
          v7 = @"RAP_ADD_OTHER_MAP";
          break;
        case 1124:
          v7 = @"RAP_OTHER_DETAILS_FORM";
          break;
        case 1125:
          v7 = @"RAP_CAMERA";
          break;
        case 1126:
          v7 = @"RAP_LABEL_MAP";
          break;
        case 1127:
          v7 = @"RAP_LABEL_DETAILS_FORM";
          break;
        case 1128:
          v7 = @"RAP_SEARCH_MENU";
          break;
        case 1129:
          v7 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
          break;
        case 1130:
          v7 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
          break;
        case 1131:
          v7 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
          break;
        case 1132:
          v7 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
          break;
        case 1133:
          v7 = @"RAP_SATELLITE_IMAGE_MAP";
          break;
        case 1134:
          v7 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
          break;
        case 1135:
          v7 = @"RAP_OTHER_FORM";
          break;
        case 1136:
          v7 = @"RAP_PRIVACY";
          break;
        case 1137:
          v7 = @"RAP_CONFIRMATION";
          break;
        case 1138:
          v7 = @"RAP_POI_MENU";
          break;
        case 1139:
          v7 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
          break;
        case 1140:
          v7 = @"RAP_ADD_A_PLACE_MAP";
          break;
        case 1141:
          v7 = @"RAP_POI_LOCATION_MAP";
          break;
        case 1142:
          v7 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
          break;
        case 1143:
          v7 = @"RAP_POI_CLOSED_FORM";
          break;
        case 1144:
          v7 = @"RAP_CLAIM_BUSINESS_DIALOG";
          break;
        case 1145:
          v7 = @"RAP_BRAND_MENU";
          break;
        case 1146:
          v7 = @"RAP_BRAND_DETAILS_FORM";
          break;
        case 1147:
          v7 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
          break;
        case 1148:
          v7 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
          break;
        case 1149:
          v7 = @"RAP_LOOK_AROUND_BLURRING_FORM";
          break;
        case 1150:
          v7 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
          break;
        case 1151:
          v7 = @"RAP_LOOK_AROUND_MENU";
          break;
        case 1152:
          v7 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
          break;
        case 1153:
          v7 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
          break;
        case 1154:
          v7 = @"RAP_LIGHTWEIGHT";
          break;
        case 1155:
          v7 = @"RAP_EDIT_PLACE_DETAILS";
          break;
        case 1156:
          v7 = @"RAP_ADD_CATEGORY";
          break;
        case 1157:
          v7 = @"RAP_ADD_HOURS";
          break;
        case 1158:
          v7 = @"RAP_EDIT_LOCATION";
          break;
        case 1159:
          v7 = @"RAP_EDIT_ENTRY_POINT";
          break;
        case 1160:
          v7 = @"RAP_LOOK_AROUND";
          break;
        case 1161:
          v7 = @"RAP_ADD_ENTRY_POINT";
          break;
        case 1201:
          v7 = @"WATCH_MAIN_MENU";
          break;
        case 1202:
          v7 = @"WATCH_MAIN_PRESS_MENU";
          break;
        case 1203:
          v7 = @"WATCH_SEARCH";
          break;
        case 1204:
          v7 = @"WATCH_DICTATION";
          break;
        case 1205:
          v7 = @"WATCH_FAVORITES";
          break;
        case 1206:
          v7 = @"WATCH_SUB_CATEGORY_LIST";
          break;
        case 1207:
          v7 = @"WATCH_SEARCH_RESULTS_LIST";
          break;
        case 1208:
          v7 = @"WATCH_MAP_VIEW";
          break;
        case 1209:
          v7 = @"WATCH_PLACECARD";
          break;
        case 1210:
          v7 = @"WATCH_ROUTE_PLANNING";
          break;
        case 1211:
          v7 = @"WATCH_ROUTE_DETAILS";
          break;
        case 1212:
          v7 = @"WATCH_NAV_TBT";
          break;
        case 1213:
          v7 = @"WATCH_NAV_MAP";
          break;
        case 1214:
          v7 = @"WATCH_NAV_PRESS_MENU";
          break;
        case 1215:
          v7 = @"WATCH_MAP_PRESS_MENU";
          break;
        case 1216:
          v7 = @"WATCH_ROUTING_PRESS_MENU";
          break;
        case 1217:
          v7 = @"WATCH_TRANSIT_MAP_VIEW";
          break;
        case 1218:
          v7 = @"WATCH_SCRIBBLE";
          break;
        case 1219:
          v7 = @"WATCH_COLLECTION_VIEW";
          break;
        case 1220:
          v7 = @"WATCH_ROUTE_PLANNING_WALKING";
          break;
        case 1221:
          v7 = @"WATCH_ROUTE_PLANNING_DRIVING";
          break;
        case 1222:
          v7 = @"WATCH_ROUTE_PLANNING_TRANSIT";
          break;
        case 1223:
          v7 = @"WATCH_PAIRED_DEVICE";
          break;
        case 1224:
          v7 = @"WATCH_NAV_DRIVING_SPLIT";
          break;
        case 1225:
          v7 = @"WATCH_NAV_DRIVING_PLATTER";
          break;
        case 1226:
          v7 = @"WATCH_NAV_DRIVING_MAP";
          break;
        case 1227:
          v7 = @"WATCH_NAV_WALKING_SPLIT";
          break;
        case 1228:
          v7 = @"WATCH_NAV_WALKING_PLATTER";
          break;
        case 1229:
          v7 = @"WATCH_NAV_WALKING_MAP";
          break;
        case 1230:
          v7 = @"WATCH_NAV_TRANSIT_SPLIT";
          break;
        case 1231:
          v7 = @"WATCH_NAV_TRANSIT_PLATTER";
          break;
        case 1232:
          v7 = @"WATCH_NAV_TRANSIT_MAP";
          break;
        case 1233:
          v7 = @"WATCH_ROUTE_INFO";
          break;
        case 1234:
          v7 = @"WATCH_NAV_CYCLING_MAP";
          break;
        case 1235:
          v7 = @"WATCH_NAV_CYCLING_PLATTER";
          break;
        case 1236:
          v7 = @"WATCH_NAV_CYCLING_SPLIT";
          break;
        case 1237:
          v7 = @"WATCH_ROUTE_PLANNING_CYCLING";
          break;
        case 1238:
          v7 = @"WATCH_SEARCH_INPUT";
          break;
        case 1239:
          v7 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 1240:
          v7 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 1301:
          v7 = @"PERSONALIZED_ADDRESS_LIST";
          break;
        case 1302:
          v7 = @"PERSONALIZED_ADDRESS_FORM";
          break;
        case 1303:
          v7 = @"PERSONALIZED_LABEL_FORM";
          break;
        case 1304:
          v7 = @"PERSONALIZED_EDIT_MAP";
          break;
        case 1305:
          v7 = @"PERSONALIZED_CONFIRMATION";
          break;
        case 1306:
          v7 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
          break;
        case 1307:
          v7 = @"PERSONALIZED_ADDRESS_INFO";
          break;
        case 1308:
          v7 = @"PERSONALIZED_ADDRESS_SEARCH";
          break;
        case 1309:
          v7 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
          break;
        case 1310:
          v7 = @"FAVORITE_SEARCH";
          break;
        case 1311:
          v7 = @"FAVORITE_LIST";
          break;
        case 1312:
          v7 = @"FAVORITE_INFO";
          break;
        case 1313:
          v7 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
          break;
        default:
          switch(v6)
          {
            case 1401:
              v7 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
              break;
            case 1402:
              v7 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
              break;
            case 1403:
              v7 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
              break;
            case 1404:
              v7 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
              break;
            case 1405:
              v7 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
              break;
            case 1406:
              v7 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
              break;
            case 1407:
              v7 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
              break;
            default:
              switch(v6)
              {
                case 1501:
                  v7 = @"PLACECARD_HEADER";
                  break;
                case 1502:
                  v7 = @"PLACECARD_ADDRESS";
                  break;
                case 1503:
                  v7 = @"PLACECARD_PHONE";
                  break;
                case 1504:
                  v7 = @"PLACECARD_URL";
                  break;
                default:
                  goto LABEL_30;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v7 = @"UI_TARGET_UNKNOWN";
    switch(v6)
    {
      case 0:
        break;
      case 1:
        v7 = @"UI_TARGET_POI";
        break;
      case 2:
        v7 = @"UI_TARGET_SEARCH_RESULT_LIST";
        break;
      case 3:
        v7 = @"UI_TARGET_POPULAR_NEARBY_LIST";
        break;
      case 4:
        v7 = @"UI_TARGET_CALLOUT";
        break;
      case 5:
        v7 = @"UI_TARGET_SEARCH_PIN";
        break;
      case 6:
        v7 = @"UI_TARGET_DROPPED_PIN";
        break;
      case 7:
        v7 = @"UI_TARGET_TRANSIT_LINE";
        break;
      case 8:
        v7 = @"SEARCH_TRAY";
        break;
      case 9:
        v7 = @"SEARCH_TRAY_BROWSE";
        break;
      case 10:
        v7 = @"SEARCH_TRAY_POPULAR_NEARBY";
        break;
      case 11:
        v7 = @"SEARCH_TRAY_AC";
        break;
      case 12:
        v7 = @"SEARCH_TRAY_AC_INTERMEDIATE";
        break;
      case 13:
        v7 = @"SEARCH_TRAY_NO_QUERY";
        break;
      case 14:
        v7 = @"AR_WALKING_LEGAL_TRAY";
        break;
      case 15:
        v7 = @"RAISE_TO_START_AR_TRAY";
        break;
      case 16:
        v7 = @"EVENTS_ADVISORY_DETAILS_PAGE";
        break;
      case 17:
        v7 = @"INCIDENT_REPORT_TRAY_CARPLAY";
        break;
      case 18:
        v7 = @"HIGHLIGHTED_AREA";
        break;
      case 19:
        v7 = @"CURATED_COLLECTIONS_HOME";
        break;
      case 20:
        v7 = @"TRAVEL_PREFERENCES_TRAY";
        break;
      case 21:
        v7 = @"RESULT_TRAY_SEARCH";
        break;
      case 22:
        v7 = @"SINGLE_CARD_FILTER";
        break;
      case 23:
        v7 = @"FULL_CARD_FILTER";
        break;
      case 24:
        v7 = @"ACCOUNT_PRIVACY_TRAY";
        break;
      case 25:
        v7 = @"APPLE_RATINGS_HISTORY_TRAY";
        break;
      case 26:
        v7 = @"CURATED_COLLECTIONS_HOME_FILTERED";
        break;
      case 27:
        v7 = @"CITY_MENU";
        break;
      case 28:
        v7 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
        break;
      case 29:
        v7 = @"ACCOUNT_TRAY";
        break;
      case 30:
        v7 = @"QUICK_ACTION_TRAY";
        break;
      case 31:
        v7 = @"SUBMIT_TRIP_FEEDBACK";
        break;
      case 32:
        v7 = @"RAP_PLACE_ISSUE_DETAILS";
        break;
      case 33:
        v7 = @"RAP_GUIDES_DETAILS";
        break;
      case 34:
        v7 = @"RAP_BAD_DIRECTIONS_DETAILS";
        break;
      case 35:
        v7 = @"RAP_ADD_MAP_DETAILS";
        break;
      case 36:
        v7 = @"WATCH_COMPLICATION";
        break;
      case 37:
        v7 = @"RAP_NAV_MENU";
        break;
      case 38:
        v7 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
        break;
      case 39:
        v7 = @"RAP_REPORT_MENU";
        break;
      case 40:
        v7 = @"RAP_CURATED_COLLECTION_MENU";
        break;
      case 41:
        v7 = @"RAP_REPORT_CARD_DETAILS";
        break;
      case 42:
        v7 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
        break;
      case 43:
        v7 = @"RAP_STREET_ISSUE_DETAILS";
        break;
      case 44:
        v7 = @"NEARBY_TRANSIT_CARD";
        break;
      case 45:
        v7 = @"WATCH_NAV_MENU";
        break;
      case 46:
        v7 = @"GENERIC_ADVISORY_PAGE";
        break;
      case 47:
        v7 = @"USER_PROFILE_TRAY";
        break;
      case 48:
        v7 = @"MEDIA_APP_MENU";
        break;
      case 49:
        v7 = @"TEMPLATE_PLACE_TRAY";
        break;
      case 50:
        v7 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
        break;
      case 51:
        v7 = @"ALLOW_NOTIFICATION_DIALOG";
        break;
      case 52:
        v7 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
        break;
      case 53:
        v7 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
        break;
      case 54:
        v7 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
        break;
      case 55:
        v7 = @"NOTIFICATION_CONSENT_PROMPT";
        break;
      case 56:
        v7 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
        break;
      case 57:
        v7 = @"PLACECARD_TRAY_VENDORS_MENU";
        break;
      case 58:
        v7 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
        break;
      case 59:
        v7 = @"SEARCH_ALONG_ROUTE_TRAY";
        break;
      case 60:
        v7 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
        break;
      case 61:
        v7 = @"PLACECARD_SHOWCASE_MENU";
        break;
      case 62:
        v7 = @"RAP_INLINE_ADD_DETAILS";
        break;
      case 63:
        v7 = @"RAP_EDIT_MENU_DETAILS";
        break;
      case 64:
        v7 = @"RAP_SUBMISSION_PROMPT";
        break;
      case 65:
        v7 = @"RAP_PLACECARD_EDIT_MENU";
        break;
      case 66:
        v7 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
        break;
      case 67:
        v7 = @"INCIDENT_REPORT_MENU";
        break;
      case 68:
        v7 = @"RAP_SELECT_BAD_ROUTES_STEPS";
        break;
      case 69:
        v7 = @"RAP_SELECT_BAD_ROUTES";
        break;
      case 70:
        v7 = @"SIRI_SUGGESTION_RESUME_ROUTE";
        break;
      case 71:
        v7 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
        break;
      case 72:
        v7 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
        break;
      case 73:
        v7 = @"SPOTLIGHT_BUSINESS_ENTITY";
        break;
      case 74:
        v7 = @"NOTIFICATION_ARP";
        break;
      case 75:
        v7 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
        break;
      case 76:
        v7 = @"YOUR_PHOTOS_ALBUM";
        break;
      case 77:
        v7 = @"ARP_PHOTO_CREDIT";
        break;
      case 78:
        v7 = @"RAP_OUTREACH_REVIEWED_REPORT";
        break;
      case 79:
        v7 = @"RAP_REPORT_MENU_MORE";
        break;
      case 80:
        v7 = @"WATCH_MAPS_SETTINGS";
        break;
      case 81:
        v7 = @"OFFLINE_FEATURE_PROMPT";
        break;
      case 82:
        v7 = @"EXPIRED_MAPS_DETAILS";
        break;
      case 83:
        v7 = @"MAPS_VIEW";
        break;
      case 84:
        v7 = @"NOTIFICATION_OFFLINE";
        break;
      case 85:
        v7 = @"EXPIRED_MAPS_MANAGEMENT";
        break;
      case 86:
        v7 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
        break;
      case 87:
        v7 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
        break;
      case 88:
        v7 = @"OFFLINE_MAPS_MANAGEMENT";
        break;
      case 89:
        v7 = @"REGION_SELECTOR";
        break;
      case 90:
        v7 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
        break;
      case 91:
        v7 = @"FIND_MY_ETA_SHARING_TRAY";
        break;
      case 92:
        v7 = @"WATCH_PLACE";
        break;
      case 93:
        v7 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
        break;
      case 94:
        v7 = @"WATCH_ROUTE_PLANNING_MAP";
        break;
      case 95:
        v7 = @"WATCH_NAV_WALKING_CONTROLS";
        break;
      case 96:
        v7 = @"WATCH_NAV_CYCLING_CONTROLS";
        break;
      case 97:
        v7 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
        break;
      case 98:
        v7 = @"WATCH_NAV_TRANSIT_CONTROLS";
        break;
      case 99:
        v7 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
        break;
      case 100:
        v7 = @"WATCH_NAV_DRIVING_CONTROLS";
        break;
      case 101:
        v7 = @"RESULTS_TRAY_SEARCH";
        break;
      case 102:
        v7 = @"RESULTS_TRAY_BROWSE";
        break;
      case 103:
        v7 = @"RESULTS_TRAY_FAVORITES";
        break;
      case 104:
        v7 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
        break;
      case 105:
        v7 = @"RESULTS_TRAY_CLUSTER";
        break;
      case 106:
        v7 = @"RESULTS_TRAY_VENUE_BROWSE";
        break;
      case 107:
        v7 = @"WATCH_MAP_RESULTS";
        break;
      case 108:
        v7 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
        break;
      case 109:
        v7 = @"WATCH_PLACES";
        break;
      case 110:
        v7 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
        break;
      case 111:
        v7 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
        break;
      case 112:
        v7 = @"DOWNLOADED_MAPS_DETAILS";
        break;
      case 113:
        v7 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
        break;
      case 114:
        v7 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
        break;
      case 115:
        v7 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
        break;
      case 116:
        v7 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
        break;
      case 117:
        v7 = @"WATCH_ROUTE_OPTIONS";
        break;
      case 118:
        v7 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
        break;
      case 119:
        v7 = @"WATCH_MORE_GUIDES";
        break;
      case 120:
        v7 = @"WATCH_RECENTLY_VIEWED";
        break;
      case 121:
        v7 = @"EV_SUCCESS_TRAY";
        break;
      case 122:
        v7 = @"PREFERRED_NETWORK_SELECTION_TRAY";
        break;
      case 123:
        v7 = @"PREFERRED_NETWORK_TRAY";
        break;
      case 124:
        v7 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 125:
        v7 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
        break;
      case 126:
        v7 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
        break;
      case 127:
        v7 = @"AC_KEYBOARD_TRAY";
        break;
      case 128:
        v7 = @"MORE_RELATED_TRAILS";
        break;
      case 129:
        v7 = @"MORE_RELATED_TRAILHEADS";
        break;
      case 130:
        v7 = @"ROUTING_TRAY_CUSTOM_ROUTE";
        break;
      case 131:
        v7 = @"CUSTOM_ROUTE_CREATION_TRAY";
        break;
      case 132:
        v7 = @"ROUTING_TRAY_CURATED_HIKE";
        break;
      case 133:
        v7 = @"MORE_CURATED_HIKES";
        break;
      case 134:
        v7 = @"CUSTOM_ROUTE_ONBOARDING";
        break;
      case 135:
        v7 = @"LIBRARY_ROUTES";
        break;
      case 136:
        v7 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
        break;
      case 137:
        v7 = @"MY_LIBRARY";
        break;
      case 138:
        v7 = @"EDIT_NOTE_TRAY";
        break;
      case 139:
        v7 = @"CREATE_NOTE_TRAY";
        break;
      case 140:
        v7 = @"LIBRARY_PLACES";
        break;
      case 141:
        v7 = @"WATCH_ACCOUNT";
        break;
      case 142:
        v7 = @"WATCH_DOWNLOADED_MAPS";
        break;
      case 143:
        v7 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
        break;
      case 144:
        v7 = @"VISUAL_INTELLIGENCE_DETECTION";
        break;
      case 145:
        v7 = @"VISUAL_INTELLIGENCE_SNIPPET";
        break;
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_30;
      case 201:
        v7 = @"PLACECARD_TRAY";
        break;
      case 202:
        v7 = @"WEB_MODULE";
        break;
      case 250:
        v7 = @"ADD_FAVORITE_TRAY";
        break;
      case 251:
        v7 = @"COLLECTION_LIST";
        break;
      case 252:
        v7 = @"COLLECTION_VIEW";
        break;
      case 253:
        v7 = @"FAVORITE_DETAILS";
        break;
      case 254:
        v7 = @"FAVORITES_TRAY";
        break;
      case 255:
        v7 = @"SHARED_COLLECTION";
        break;
      case 256:
        v7 = @"SHARED_COLLECTION_VIEW";
        break;
      case 257:
        v7 = @"RECENTLY_VIEWED";
        break;
      case 258:
        v7 = @"SHARED_WEB_COLLECTION";
        break;
      case 259:
        v7 = @"CURATED_COLLECTION_VIEW";
        break;
      case 260:
        v7 = @"FEATURED_COLLECTIONS";
        break;
      case 261:
        v7 = @"PUBLISHER_TRAY";
        break;
      case 262:
        v7 = @"SHARED_CURATED_COLLECTION_VIEW";
        break;
      case 263:
        v7 = @"CURATED_COLLECTION_NOTIFICATION";
        break;
      case 264:
        v7 = @"CURATED_COLLECTION_LIST";
        break;
      case 265:
        v7 = @"PUBLISHER_LIST";
        break;
      case 266:
        v7 = @"WATCH_CURATED_COLLECTION_VIEW";
        break;
      case 267:
        v7 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
        break;
      case 268:
        v7 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
        break;
      case 301:
        v7 = @"ROUTING_TRAY_DRIVING";
        break;
      case 302:
        v7 = @"ROUTING_TRAY_WALKING";
        break;
      case 303:
        v7 = @"ROUTING_TRAY_TRANSIT";
        break;
      case 304:
        v7 = @"ROUTING_TRAY_RIDESHARE";
        break;
      case 305:
        v7 = @"ROUTING_TRAY_CYCLING";
        break;
      case 306:
        v7 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
        break;
      case 401:
        v7 = @"NAV_TRAY_DRIVING";
        break;
      case 402:
        v7 = @"NAV_TRAY_WALKING";
        break;
      case 403:
        v7 = @"NAV_TRAY_TRANSIT";
        break;
      case 404:
        v7 = @"NAV_TRAY_CYCLING";
        break;
      case 501:
        v7 = @"MAP_PLACECARD";
        break;
      case 502:
        v7 = @"MAP_SEARCH";
        break;
      case 503:
        v7 = @"MAP_RESULTS";
        break;
      case 504:
        v7 = @"MAP_ROUTING";
        break;
      case 505:
        v7 = @"MAP_NAV";
        break;
      case 506:
        v7 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
        break;
      case 507:
        v7 = @"MAP_TRAFFIC_INCIDENT";
        break;
      case 508:
        v7 = @"MAP_FULL_SCREEN";
        break;
      case 509:
        v7 = @"MAP_DRIVE";
        break;
      case 510:
        v7 = @"MAP_LAUNCH_AND_GO";
        break;
      case 511:
        v7 = @"MAP_VIEW";
        break;
      case 601:
        v7 = @"MAPS_SETTINGS";
        break;
      case 602:
        v7 = @"MAPS_PREFERENCES";
        break;
      case 603:
        v7 = @"RAP";
        break;
      case 604:
        v7 = @"ROUTING_DRIVING_DETAILS";
        break;
      case 605:
        v7 = @"ROUTING_WALKING_DETAILS";
        break;
      case 606:
        v7 = @"ROUTING_TRANSIT_DETAILS";
        break;
      case 607:
        v7 = @"ROUTING_EDITOR";
        break;
      case 608:
        v7 = @"NAV_DRIVING_DETAILS";
        break;
      case 609:
        v7 = @"NAV_WALKING_DETAILS";
        break;
      case 610:
        v7 = @"NAV_TRANSIT_DETAILS";
        break;
      case 611:
        v7 = @"NAV_AUDIO_SETTINGS";
        break;
      case 612:
        v7 = @"PHOTO_VIEWER_ALL";
        break;
      case 613:
        v7 = @"PHOTO_VIEWER_SINGLE";
        break;
      case 614:
        v7 = @"ROUTE_OPTIONS_TRANSIT";
        break;
      case 615:
        v7 = @"TRAFFIC_INCIDENT_TRAY";
        break;
      case 616:
        v7 = @"NAV_DIRECTIONS_BANNER_DRIVING";
        break;
      case 617:
        v7 = @"NAV_DIRECTIONS_BANNER_WALKING";
        break;
      case 618:
        v7 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
        break;
      case 619:
        v7 = @"REFINE_SEARCH_SUGGESTION_AREA";
        break;
      case 620:
        v7 = @"ADD_PHOTO_SHEET";
        break;
      case 621:
        v7 = @"ADD_PLACE_SHEET";
        break;
      case 622:
        v7 = @"SHARE_SHEET";
        break;
      case 623:
        v7 = @"EDIT_LOCATION_SHEET";
        break;
      case 624:
        v7 = @"ADD_CONTACT_SHEET";
        break;
      case 625:
        v7 = @"EDIT_NAME_SHEET";
        break;
      case 626:
        v7 = @"DRIVING_NAV_SETTINGS";
        break;
      case 627:
        v7 = @"TRANSIT_SETTINGS";
        break;
      case 628:
        v7 = @"TRANSIT_ADVISORY_SHEET";
        break;
      case 629:
        v7 = @"REMOVE_CAR_SHEET";
        break;
      case 630:
        v7 = @"ROUTE_OPTIONS_DRIVING";
        break;
      case 631:
        v7 = @"ROUTE_OPTIONS_DATETIME";
        break;
      case 632:
        v7 = @"TRANSIT_ADVISORY_BANNER";
        break;
      case 633:
        v7 = @"BOOK_TABLE_SELECT_TIME";
        break;
      case 634:
        v7 = @"BOOK_TABLE_MORE_OPTIONS";
        break;
      case 635:
        v7 = @"BOOK_TABLE_READY";
        break;
      case 636:
        v7 = @"BOOK_TABLE_BOOKED";
        break;
      case 637:
        v7 = @"TRANSIT_LINE_CLUSTER_SHEET";
        break;
      case 638:
        v7 = @"TRANSIT_LINE_LIST_SHEET";
        break;
      case 639:
        v7 = @"TRANSIT_BALANCE_BANNER";
        break;
      case 640:
        v7 = @"WEATHER_ICON";
        break;
      case 641:
        v7 = @"HELP_IMPROVE_MAPS_DIALOG";
        break;
      case 642:
        v7 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 643:
        v7 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
        break;
      case 644:
        v7 = @"FLOOR_PICKER";
        break;
      case 645:
        v7 = @"VENUE_LIST";
        break;
      case 646:
        v7 = @"AR_MODE";
        break;
      case 647:
        v7 = @"ROUTING_TRANSIT_TICKETS_SHEET";
        break;
      case 648:
        v7 = @"LINKED_SERVICE_HOURS";
        break;
      case 649:
        v7 = @"SHARE_ETA_TRAY";
        break;
      case 650:
        v7 = @"ETA_UPDATE_TRAY";
        break;
      case 651:
        v7 = @"SCHEDULECARD_TRAY";
        break;
      case 652:
        v7 = @"AR_NAV";
        break;
      case 653:
        v7 = @"TAP_TRANSIT_ACCESS_POINT";
        break;
      case 654:
        v7 = @"LOCATIONS_INSIDE";
        break;
      case 655:
        v7 = @"SIMILAR_LOCATIONS";
        break;
      case 656:
        v7 = @"LOCATIONS_AT_ADDRESS";
        break;
      case 657:
        v7 = @"NAV_DIRECTIONS_BANNER_CYCLING";
        break;
      case 658:
        v7 = @"ROUTE_OPTIONS_CYCLING";
        break;
      case 659:
        v7 = @"EV_CONNECTION_TRAY";
        break;
      case 660:
        v7 = @"VIRTUAL_GARAGE";
        break;
      case 661:
        v7 = @"VIRTUAL_GARAGE_BANNER";
        break;
      case 662:
        v7 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
        break;
      case 663:
        v7 = @"ADVISORY_DETAILS_PAGE";
        break;
      case 664:
        v7 = @"APP_CLIP_NOTIFICATION";
        break;
      case 665:
        v7 = @"PHOTO_VIEWER_GALLERY";
        break;
      case 666:
        v7 = @"RECOMMENDATION_CARD";
        break;
      case 667:
        v7 = @"INCIDENT_REPORT_TRAY";
        break;
      case 668:
        v7 = @"MAPS_WIDGET_DISPLAY";
        break;
      case 669:
        v7 = @"VISUAL_LOCATION_FRAMEWORK";
        break;
      case 670:
        v7 = @"APP_CLIP_TRAY";
        break;
      case 671:
        v7 = @"LICENSE_PLATE_SUGGESTION_PAGE";
        break;
      case 672:
        v7 = @"NOTIFICATION_ADD_PLATE";
        break;
      case 673:
        v7 = @"MAPS_RESULTS";
        break;
      case 674:
        v7 = @"MAPS_WIDGET_APP_CONNECTION";
        break;
      case 675:
        v7 = @"MAPS_WIDGET_CURRENT_LOCATION";
        break;
      case 676:
        v7 = @"MAPS_WIDGET_CURRENT_NAV";
        break;
      case 677:
        v7 = @"MAPS_WIDGET_ETA";
        break;
      case 678:
        v7 = @"MAPS_WIDGET_TRANSIT";
        break;
      case 679:
        v7 = @"MAPS_WIDGET_UPC_DESTINATION";
        break;
      case 680:
        v7 = @"WIDGET_CREATION_TRAY";
        break;
      case 681:
        v7 = @"MAPS_WIDGET_HOME";
        break;
      case 682:
        v7 = @"MAPS_WIDGET_PARKED_CAR";
        break;
      case 683:
        v7 = @"MAPS_WIDGET_POI";
        break;
      case 684:
        v7 = @"MAPS_WIDGET_SCHOOL";
        break;
      case 685:
        v7 = @"MAPS_WIDGET_WORK";
        break;
      case 686:
        v7 = @"AIRPORT_NOTIFICATION";
        break;
      case 687:
        v7 = @"MAPS_WIDGET_EMPTY";
        break;
      case 688:
        v7 = @"COARSE_LOCATION_OPTIONS_PROMPT";
        break;
      case 689:
        v7 = @"ALLOW_PRECISE_LOCATION_PROMPT";
        break;
      case 690:
        v7 = @"SHARE_MY_LOCATION";
        break;
      case 691:
        v7 = @"MARK_MY_LOCATION";
        break;
      case 692:
        v7 = @"AIRPORT_NOTIFICATION_WATCH";
        break;
      case 693:
        v7 = @"EDIT_FAVORITE";
        break;
      case 694:
        v7 = @"ROUTING_CYCLING_DETAILS";
        break;
      case 695:
        v7 = @"NAV_CYCLING_DETAILS";
        break;
      case 696:
        v7 = @"MAPS_SUGGESTION_WIDGET";
        break;
      case 697:
        v7 = @"ARP_TIPKIT";
        break;
      case 698:
        v7 = @"ARP_PRIVACY";
        break;
      case 699:
        v7 = @"ROUTE_OPTIONS_WALKING";
        break;
      case 701:
        v7 = @"SAFARI_SEARCH";
        break;
      case 702:
        v7 = @"SPOTLIGHT_SEARCH";
        break;
      case 703:
        v7 = @"SAFARI_MAPS_SEARCH_RESULTS";
        break;
      case 704:
        v7 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
        break;
      case 705:
        v7 = @"WIDGET_MAPS_DESTINATIONS";
        break;
      case 706:
        v7 = @"WIDGET_MAPS_TRANSIT";
        break;
      case 707:
        v7 = @"WIDGET_MAPS_NEARBY";
        break;
      case 708:
        v7 = @"NOTIFICATION_FIND_MY_CAR";
        break;
      case 709:
        v7 = @"CONTROL_CENTER";
        break;
      case 710:
        v7 = @"NOTIFICATION_CENTER";
        break;
      case 711:
        v7 = @"NOTIFICATION_DOOM";
        break;
      case 712:
        v7 = @"NOTIFICATION_VENUES";
        break;
      case 713:
        v7 = @"NOTIFICATION_RAP_UPDATE";
        break;
      case 714:
        v7 = @"NOTIFICATION_TRIP_CANCELLED";
        break;
      case 715:
        v7 = @"NOTIFICATION_STOP_SKIPPED";
        break;
      case 716:
        v7 = @"NOTIFICATION_TRIP_DELAYED";
        break;
      case 717:
        v7 = @"NOTIFICATION_RAP";
        break;
      case 718:
        v7 = @"NOTIFICATION_PROXY_AUTH";
        break;
      case 719:
        v7 = @"NOTIFICATION_PUSH_TO_DEVICE";
        break;
      case 720:
        v7 = @"NOTIFICATION_LOW_FUEL";
        break;
      case 721:
        v7 = @"NOTIFICATION_FIND_MY_CAR_RESET";
        break;
      case 722:
        v7 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
        break;
      case 723:
        v7 = @"NOTIFICATION_SHARED_ETA";
        break;
      case 724:
        v7 = @"NOTIFICATION_SHARED_ETA_UPDATE";
        break;
      case 725:
        v7 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
        break;
      case 726:
        v7 = @"ANNOUNCEMENT_TYPE_GENERAL";
        break;
      case 727:
        v7 = @"ANNOUNCEMENT_TYPE_FLYOVER";
        break;
      case 728:
        v7 = @"ANNOUNCEMENT_TYPE_TRANSIT";
        break;
      case 729:
        v7 = @"ANNOUNCEMENT_TYPE_VENUES";
        break;
      case 730:
        v7 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
        break;
      case 731:
        v7 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
        break;
      case 732:
        v7 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
        break;
      case 733:
        v7 = @"APP_SHEET";
        break;
      case 734:
        v7 = @"CZ_ADVISORY_DETAILS_PAGE";
        break;
      case 735:
        v7 = @"SHARE_ETA_CONTACT_TRAY";
        break;
      case 736:
        v7 = @"SIRI_SHARE_ETA";
        break;
      case 737:
        v7 = @"SIRI_SUGGESTION_SHARED_ETA";
        break;
      case 738:
        v7 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
        break;
      case 739:
        v7 = @"INCIDENT_ALERT_TRAY";
        break;
      case 740:
        v7 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
        break;
      case 741:
        v7 = @"RAP_INCIDENT_REPORT_VIEW";
        break;
      case 742:
        v7 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
        break;
      case 743:
        v7 = @"TRAFFIC_ADVISORY_SHEET";
        break;
      case 801:
        v7 = @"SIRI_PLUGIN_SNIPPET";
        break;
      case 802:
        v7 = @"SIRI_PLUGIN_COMMAND";
        break;
      case 803:
        v7 = @"SIRI_SEARCH_RESULT_LIST";
        break;
      case 804:
        v7 = @"SIRI_DISAMBIGUATION_LIST";
        break;
      case 805:
        v7 = @"SIRI_PLACE_SNIPPET";
        break;
      default:
        if (v6 != 901) {
          goto LABEL_30;
        }
        v7 = @"CHROME";
        break;
    }
  }
  if (a2) {
    objc_super v8 = @"uiTarget";
  }
  else {
    objc_super v8 = @"ui_target";
  }
  [v4 setObject:v7 forKey:v8];

  char v5 = *(unsigned char *)(a1 + 20);
  if (v5) {
    goto LABEL_516;
  }
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_523:
    uint64_t v12 = *(int *)(a1 + 12);
    if (v12 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = off_1E53F8C18[v12];
    }
    if (a2) {
      v14 = @"layoutStyle";
    }
    else {
      v14 = @"layout_style";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_530:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTargetLayout _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTargetLayout)initWithDictionary:(id)a3
{
  return (GEOTargetLayout *)-[GEOTargetLayout _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOTargetLayout)initWithJSON:(id)a3
{
  return (GEOTargetLayout *)-[GEOTargetLayout _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTargetLayoutIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTargetLayoutReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  char v5 = a3;
  [(GEOTargetLayout *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_uiTarget;
    *((unsigned char *)v5 + 20) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_layoutInfo;
  *((unsigned char *)v5 + 20) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[3] = self->_layoutStyle;
    *((unsigned char *)v5 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_uiTarget;
    *((unsigned char *)result + 20) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_layoutInfo;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_layoutStyle;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOTargetLayout *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_uiTarget != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_layoutInfo != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_layoutStyle != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTargetLayout *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_uiTarget;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_layoutInfo;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_layoutStyle;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 20);
  if ((v4 & 4) != 0)
  {
    self->_uiTarget = v5[4];
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 20);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5[5] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_layoutInfo = v5[2];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v5[5] & 2) != 0)
  {
LABEL_4:
    self->_layoutStyle = v5[3];
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
}

@end