@interface GEOTelemetricEntity
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEventDetail;
- (BOOL)hasEventKey;
- (BOOL)hasEventValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTelemetricEntity)initWithDictionary:(id)a3;
- (GEOTelemetricEntity)initWithJSON:(id)a3;
- (NSString)eventDetail;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventKeyAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsEventKey:(id)a3;
- (int)eventKey;
- (unint64_t)eventValue;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventDetail:(id)a3;
- (void)setEventKey:(int)a3;
- (void)setEventValue:(unint64_t)a3;
- (void)setHasEventKey:(BOOL)a3;
- (void)setHasEventValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTelemetricEntity

- (int)eventKey
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_eventKey;
  }
  else {
    return 0;
  }
}

- (void)setEventKey:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_eventKey = a3;
}

- (void)setHasEventKey:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEventKey
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)eventKeyAsString:(int)a3
{
  if (a3 <= 60099)
  {
    if (a3 <= 3000)
    {
      if (a3 <= 1199)
      {
        if (a3 > 1099)
        {
          switch(a3)
          {
            case 1100:
              v4 = @"MM_AOF_FROMCONTACT_FAILED";
              break;
            case 1101:
              v4 = @"MM_AOF_FROMLEGACY_FAILED";
              break;
            case 1102:
              v4 = @"MM_AOF_FROMBYTES_FAILED";
              break;
            default:
LABEL_572:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
              v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
        }
        else
        {
          switch(a3)
          {
            case 1000:
              v4 = @"MM_GS_STRUCTURED_ADDRESS_MISSING";
              break;
            case 1001:
              v4 = @"MM_GS_GEO_ADDRESS_DICTIONARY_MISSING";
              break;
            case 1002:
              v4 = @"MM_GS_GEOPDADDRESS_MISSING";
              break;
            case 1003:
              v4 = @"MM_GS_LANGUAGE_MISSING";
              break;
            case 1004:
              v4 = @"MM_GS_COUNTRY_MISSING";
              break;
            case 1005:
              v4 = @"MM_GS_PHONETIC_LOCALE_MISSING";
              break;
            case 1006:
              v4 = @"MM_GS_GEOPDADDRESSOBJECT_MISSING";
              break;
            case 1007:
              v4 = @"MM_GS_KNOWNACCURACY_MISSING";
              break;
            case 1008:
              v4 = @"MM_GS_ADDROBJPTR_MISSING";
              break;
            case 1009:
              v4 = @"MM_GS_CN_POSTAL_ADDRESS_MISSING";
              break;
            case 1010:
              v4 = @"MM_GS_CN_POSTAL_ADDRESS_FAILED";
              break;
            default:
              if (a3) {
                goto LABEL_572;
              }
              v4 = @"TELEMETRIC_EVENT_KEY_UNKNOWN";
              break;
          }
        }
      }
      else if (a3 > 2001)
      {
        switch(a3)
        {
          case 2200:
            v4 = @"REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT";
            break;
          case 2201:
            v4 = @"REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT";
            break;
          case 2202:
            v4 = @"BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT";
            break;
          case 2203:
            v4 = @"BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT";
            break;
          default:
            if (a3 == 2002)
            {
              v4 = @"MapsAC_ContactRankDuration";
            }
            else
            {
              if (a3 != 2003) {
                goto LABEL_572;
              }
              v4 = @"MapsAC_ContactRankCount";
            }
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 1200:
            v4 = @"MM_AO_GETNAME_FAILED";
            break;
          case 1201:
            v4 = @"MM_AO_GETADDRESS_FAILED";
            break;
          case 1202:
            v4 = @"MM_AO_GETSPOKENNAME_FAILED";
            break;
          case 1203:
            v4 = @"MM_AO_GETSPOKENADDRESS_FAILED";
            break;
          case 1204:
            v4 = @"MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED";
            break;
          case 1205:
            v4 = @"MM_AO_GETPHONETICNAME_FAILED";
            break;
          case 1206:
            v4 = @"MM_AO_GETPHONETICADDRES_FAILED";
            break;
          case 1207:
            v4 = @"MM_AO_GETFULLADDRES_FAILED";
            break;
          case 1208:
            v4 = @"MM_AO_GETSHORTADDRES_FAILED";
            break;
          case 1209:
            v4 = @"MM_AO_GETDISPLAYLOCALITY_FAILED";
            break;
          case 1210:
            v4 = @"MM_AO_GETWEATHERNAME_FAILED";
            break;
          case 1211:
            v4 = @"MM_AO_GETPARKINGNAME_FAILED";
            break;
          case 1212:
            v4 = @"MM_AO_HASH_FAILED";
            break;
          case 1213:
            v4 = @"MM_AO_TOBYTES_FAILED";
            break;
          case 1214:
            v4 = @"MM_GS_CONTACT_KEYSET_INIT_FAILED";
            break;
          case 1215:
            v4 = @"MM_AO_GETVENUELABEL_FAILED";
            break;
          case 1216:
            v4 = @"MM_AO_GETVENUELEVEL_FAILED";
            break;
          case 1217:
            v4 = @"MM_AO_GETVENUESHORTADDRESS_FAILED";
            break;
          case 1218:
            v4 = @"MM_AO_GETLOCATIONADDRESS_FAILED";
            break;
          default:
            if (a3 != 2001) {
              goto LABEL_572;
            }
            v4 = @"MapsAC_ContactMatchDuration";
            break;
        }
      }
    }
    else if (a3 <= 51000)
    {
      if (a3 > 4000)
      {
        switch(a3)
        {
          case 4001:
            v4 = @"Flyover_TrackingStateChange";
            return v4;
          case 4002:
            v4 = @"Flyover_TrackingStateReasonChange";
            return v4;
          case 4003:
          case 4004:
          case 4005:
          case 4006:
          case 4007:
          case 4008:
          case 4009:
          case 4010:
          case 4014:
          case 4015:
          case 4016:
          case 4017:
          case 4018:
          case 4019:
          case 4020:
            goto LABEL_572;
          case 4011:
            v4 = @"Flyover_TrackingStateNotAvailableDuration";
            return v4;
          case 4012:
            v4 = @"Flyover_TrackingStateLimitedDuration";
            return v4;
          case 4013:
            v4 = @"Flyover_TrackingStateNormalDuration";
            return v4;
          case 4021:
            v4 = @"Flyover_TrackingStateReasonNoneDuration";
            return v4;
          case 4022:
            v4 = @"Flyover_TrackingStateReasonInitializingDuration";
            return v4;
          case 4023:
            v4 = @"Flyover_TrackingStateReasonExcessiveMotionDuration";
            return v4;
          case 4024:
            v4 = @"Flyover_TrackingStateReasonInsufficientFeaturesDuration";
            return v4;
          case 4025:
            v4 = @"Flyover_TrackingStateReasonSessionInterruptedDuration";
            return v4;
          default:
            if (a3 == 50001)
            {
              v4 = @"MSL_VECTOR_REQUEST_EXCEPTIONS";
            }
            else
            {
              if (a3 != 50002) {
                goto LABEL_572;
              }
              v4 = @"MSL_VECTOR_REQUEST_TIME_TO_PERFORM";
            }
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 3001:
            v4 = @"MSPSync_ClientCount";
            break;
          case 3002:
            v4 = @"MSPSync_HistoryAdd";
            break;
          case 3003:
            v4 = @"MSPSync_HistoryRemove";
            break;
          case 3004:
            v4 = @"MSPSync_HistoryCount";
            break;
          case 3005:
            v4 = @"MSPSync_FavoriteAdd";
            break;
          case 3006:
            v4 = @"MSPSync_FavoriteEdit";
            break;
          case 3007:
            v4 = @"MSPSync_FavoriteRemove";
            break;
          case 3008:
            v4 = @"MSPSync_FavoriteCount";
            break;
          case 3009:
            v4 = @"MSPSync_Merged";
            break;
          case 3010:
            v4 = @"MSPSync_MergeDuration";
            break;
          case 3011:
            v4 = @"MSPSync_NotificationDelay";
            break;
          case 3012:
            v4 = @"MSPSync_CKOperationFinished";
            break;
          default:
            goto LABEL_572;
        }
      }
    }
    else
    {
      switch(a3)
      {
        case 51001:
          v4 = @"MSL_ETA_REQUEST_UNPARSEABLE_COUNT";
          break;
        case 51002:
          v4 = @"MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT";
          break;
        case 51003:
          v4 = @"MSL_DIRECTIONS_INVALID_REQUEST_COUNT";
          break;
        case 51004:
          v4 = @"MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT";
          break;
        case 51005:
          v4 = @"MSL_DIRECTIONS_WALKING_REQUEST_COUNT";
          break;
        case 51006:
          v4 = @"MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT";
          break;
        case 51007:
          v4 = @"MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT";
          break;
        case 51008:
          v4 = @"MSL_ETA_REQUEST_COUNT";
          break;
        case 51009:
          v4 = @"MSL_ETA_TOTAL_RUNTIME_MS";
          break;
        case 51010:
          v4 = @"MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS";
          break;
        case 51011:
          v4 = @"MSL_ETA_SNAPPING_RUNTIME_MS";
          break;
        case 51012:
          v4 = @"MSL_ETA_COMPUTATION_RUNTIME_MS";
          break;
        case 51013:
          v4 = @"MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS";
          break;
        case 51014:
          v4 = @"MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS";
          break;
        case 51015:
          v4 = @"MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS";
          break;
        case 51016:
          v4 = @"MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS";
          break;
        case 51017:
          v4 = @"MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS";
          break;
        case 51018:
          v4 = @"MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS";
          break;
        case 51019:
          v4 = @"MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS";
          break;
        case 51020:
          v4 = @"MSL_ETA_INVALID_REQUEST_COUNT";
          break;
        default:
          switch(a3)
          {
            case 60000:
              v4 = @"MSL_SEARCH_CANCELLATION_COUNT";
              break;
            case 60001:
              v4 = @"MSL_AC_RANKING_LATENCY_MS";
              break;
            case 60002:
              v4 = @"MSL_GEOCODING_RANKING_LATENCY_MS";
              break;
            case 60003:
              v4 = @"MSL_SEARCH_RANKING_LATENCY_MS";
              break;
            default:
              goto LABEL_572;
          }
          break;
      }
    }
  }
  else if (a3 <= 60599)
  {
    if (a3 <= 60299)
    {
      switch(a3)
      {
        case 60100:
          v4 = @"MSL_ADDRESS_SEARCH_REQUEST_COUNT";
          break;
        case 60101:
          v4 = @"MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT";
          break;
        case 60102:
          v4 = @"MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT";
          break;
        case 60103:
          v4 = @"MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS";
          break;
        case 60104:
          v4 = @"MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS";
          break;
        case 60105:
          v4 = @"MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS";
          break;
        case 60106:
          v4 = @"MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS";
          break;
        case 60107:
          v4 = @"MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS";
          break;
        case 60108:
          v4 = @"MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS";
          break;
        default:
          switch(a3)
          {
            case 60200:
              v4 = @"MSL_BUSINESS_SEARCH_REQUEST_COUNT";
              break;
            case 60201:
              v4 = @"MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT";
              break;
            case 60202:
              v4 = @"MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT";
              break;
            case 60203:
              v4 = @"MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS";
              break;
            case 60204:
              v4 = @"MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS";
              break;
            case 60205:
              v4 = @"MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS";
              break;
            default:
              goto LABEL_572;
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 60300:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT";
          break;
        case 60301:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT";
          break;
        case 60302:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT";
          break;
        case 60303:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS";
          break;
        case 60304:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS";
          break;
        case 60305:
          v4 = @"MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS";
          break;
        default:
          switch(a3)
          {
            case 60400:
              v4 = @"MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT";
              break;
            case 60401:
              v4 = @"MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT";
              break;
            case 60402:
              v4 = @"MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT";
              break;
            case 60403:
              v4 = @"MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS";
              break;
            default:
              goto LABEL_572;
          }
          break;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 60600:
        v4 = @"MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60601:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT";
        break;
      case 60602:
      case 60603:
      case 60604:
      case 60605:
      case 60606:
      case 60607:
      case 60608:
      case 60609:
      case 60617:
      case 60618:
      case 60619:
      case 60627:
      case 60628:
      case 60629:
      case 60637:
      case 60638:
      case 60639:
      case 60647:
      case 60648:
      case 60649:
      case 60656:
      case 60657:
      case 60658:
      case 60659:
      case 60667:
      case 60668:
      case 60669:
      case 60676:
      case 60677:
      case 60678:
      case 60679:
        goto LABEL_572;
      case 60610:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60611:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS";
        break;
      case 60612:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60613:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60614:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT";
        break;
      case 60615:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60616:
        v4 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60620:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60621:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS";
        break;
      case 60622:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60623:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60624:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT";
        break;
      case 60625:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60626:
        v4 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60630:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60631:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS";
        break;
      case 60632:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60633:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60634:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT";
        break;
      case 60635:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60636:
        v4 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60640:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60641:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS";
        break;
      case 60642:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60643:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60644:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT";
        break;
      case 60645:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60646:
        v4 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60650:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60651:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60652:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60653:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT";
        break;
      case 60654:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60655:
        v4 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60660:
        v4 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60661:
        v4 = @"MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS";
        break;
      case 60662:
        v4 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60663:
        v4 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60664:
        v4 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT";
        break;
      case 60665:
        v4 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60666:
        v4 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60670:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60671:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60672:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60673:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT";
        break;
      case 60674:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60675:
        v4 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      case 60680:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS";
        break;
      case 60681:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS";
        break;
      case 60682:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS";
        break;
      case 60683:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT";
        break;
      case 60684:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT";
        break;
      case 60685:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT";
        break;
      case 60686:
        v4 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
        break;
      default:
        switch(a3)
        {
          case 70001:
            v4 = @"MSL_PLACES_SERVER_ERROR_COUNT";
            break;
          case 70002:
            v4 = @"MSL_PLACES_INVALID_REQUEST_COUNT";
            break;
          case 70003:
            v4 = @"MSL_PLACES_CANCELLED_REQUEST_COUNT";
            break;
          case 70004:
            v4 = @"MSL_PLACES_REQUEST_COMPLETE_TIME_MS";
            break;
          case 70005:
            v4 = @"MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS";
            break;
          case 70006:
            v4 = @"MSL_PLACES_POI_COMPONENTS_TIME_MS";
            break;
          case 70007:
            v4 = @"MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS";
            break;
          case 70008:
            v4 = @"MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS";
            break;
          case 70009:
            v4 = @"MSL_PLACES_POI_DATA_ACCESS_TIME_MS";
            break;
          case 70010:
            v4 = @"MSL_PLACES_POI_LOCALIZATION_TIME_MS";
            break;
          default:
            goto LABEL_572;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsEventKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TELEMETRIC_EVENT_KEY_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MM_GS_STRUCTURED_ADDRESS_MISSING"])
  {
    int v4 = 1000;
  }
  else if ([v3 isEqualToString:@"MM_GS_GEO_ADDRESS_DICTIONARY_MISSING"])
  {
    int v4 = 1001;
  }
  else if ([v3 isEqualToString:@"MM_GS_GEOPDADDRESS_MISSING"])
  {
    int v4 = 1002;
  }
  else if ([v3 isEqualToString:@"MM_GS_LANGUAGE_MISSING"])
  {
    int v4 = 1003;
  }
  else if ([v3 isEqualToString:@"MM_GS_COUNTRY_MISSING"])
  {
    int v4 = 1004;
  }
  else if ([v3 isEqualToString:@"MM_GS_PHONETIC_LOCALE_MISSING"])
  {
    int v4 = 1005;
  }
  else if ([v3 isEqualToString:@"MM_GS_GEOPDADDRESSOBJECT_MISSING"])
  {
    int v4 = 1006;
  }
  else if ([v3 isEqualToString:@"MM_GS_KNOWNACCURACY_MISSING"])
  {
    int v4 = 1007;
  }
  else if ([v3 isEqualToString:@"MM_GS_ADDROBJPTR_MISSING"])
  {
    int v4 = 1008;
  }
  else if ([v3 isEqualToString:@"MM_GS_CN_POSTAL_ADDRESS_MISSING"])
  {
    int v4 = 1009;
  }
  else if ([v3 isEqualToString:@"MM_GS_CN_POSTAL_ADDRESS_FAILED"])
  {
    int v4 = 1010;
  }
  else if ([v3 isEqualToString:@"MM_AOF_FROMCONTACT_FAILED"])
  {
    int v4 = 1100;
  }
  else if ([v3 isEqualToString:@"MM_AOF_FROMLEGACY_FAILED"])
  {
    int v4 = 1101;
  }
  else if ([v3 isEqualToString:@"MM_AOF_FROMBYTES_FAILED"])
  {
    int v4 = 1102;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETNAME_FAILED"])
  {
    int v4 = 1200;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETADDRESS_FAILED"])
  {
    int v4 = 1201;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETSPOKENNAME_FAILED"])
  {
    int v4 = 1202;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETSPOKENADDRESS_FAILED"])
  {
    int v4 = 1203;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED"])
  {
    int v4 = 1204;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETPHONETICNAME_FAILED"])
  {
    int v4 = 1205;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETPHONETICADDRES_FAILED"])
  {
    int v4 = 1206;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETFULLADDRES_FAILED"])
  {
    int v4 = 1207;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETSHORTADDRES_FAILED"])
  {
    int v4 = 1208;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETDISPLAYLOCALITY_FAILED"])
  {
    int v4 = 1209;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETWEATHERNAME_FAILED"])
  {
    int v4 = 1210;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETPARKINGNAME_FAILED"])
  {
    int v4 = 1211;
  }
  else if ([v3 isEqualToString:@"MM_AO_HASH_FAILED"])
  {
    int v4 = 1212;
  }
  else if ([v3 isEqualToString:@"MM_AO_TOBYTES_FAILED"])
  {
    int v4 = 1213;
  }
  else if ([v3 isEqualToString:@"MM_GS_CONTACT_KEYSET_INIT_FAILED"])
  {
    int v4 = 1214;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETVENUELABEL_FAILED"])
  {
    int v4 = 1215;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETVENUELEVEL_FAILED"])
  {
    int v4 = 1216;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETVENUESHORTADDRESS_FAILED"])
  {
    int v4 = 1217;
  }
  else if ([v3 isEqualToString:@"MM_AO_GETLOCATIONADDRESS_FAILED"])
  {
    int v4 = 1218;
  }
  else if ([v3 isEqualToString:@"MapsAC_ContactMatchDuration"])
  {
    int v4 = 2001;
  }
  else if ([v3 isEqualToString:@"MapsAC_ContactRankDuration"])
  {
    int v4 = 2002;
  }
  else if ([v3 isEqualToString:@"MapsAC_ContactRankCount"])
  {
    int v4 = 2003;
  }
  else if ([v3 isEqualToString:@"REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT"])
  {
    int v4 = 2200;
  }
  else if ([v3 isEqualToString:@"REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT"])
  {
    int v4 = 2201;
  }
  else if ([v3 isEqualToString:@"BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT"])
  {
    int v4 = 2202;
  }
  else if ([v3 isEqualToString:@"BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT"])
  {
    int v4 = 2203;
  }
  else if ([v3 isEqualToString:@"MSPSync_ClientCount"])
  {
    int v4 = 3001;
  }
  else if ([v3 isEqualToString:@"MSPSync_HistoryAdd"])
  {
    int v4 = 3002;
  }
  else if ([v3 isEqualToString:@"MSPSync_HistoryRemove"])
  {
    int v4 = 3003;
  }
  else if ([v3 isEqualToString:@"MSPSync_HistoryCount"])
  {
    int v4 = 3004;
  }
  else if ([v3 isEqualToString:@"MSPSync_FavoriteAdd"])
  {
    int v4 = 3005;
  }
  else if ([v3 isEqualToString:@"MSPSync_FavoriteEdit"])
  {
    int v4 = 3006;
  }
  else if ([v3 isEqualToString:@"MSPSync_FavoriteRemove"])
  {
    int v4 = 3007;
  }
  else if ([v3 isEqualToString:@"MSPSync_FavoriteCount"])
  {
    int v4 = 3008;
  }
  else if ([v3 isEqualToString:@"MSPSync_Merged"])
  {
    int v4 = 3009;
  }
  else if ([v3 isEqualToString:@"MSPSync_MergeDuration"])
  {
    int v4 = 3010;
  }
  else if ([v3 isEqualToString:@"MSPSync_NotificationDelay"])
  {
    int v4 = 3011;
  }
  else if ([v3 isEqualToString:@"MSPSync_CKOperationFinished"])
  {
    int v4 = 3012;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateChange"])
  {
    int v4 = 4001;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonChange"])
  {
    int v4 = 4002;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateNotAvailableDuration"])
  {
    int v4 = 4011;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateLimitedDuration"])
  {
    int v4 = 4012;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateNormalDuration"])
  {
    int v4 = 4013;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonNoneDuration"])
  {
    int v4 = 4021;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonInitializingDuration"])
  {
    int v4 = 4022;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonExcessiveMotionDuration"])
  {
    int v4 = 4023;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonInsufficientFeaturesDuration"])
  {
    int v4 = 4024;
  }
  else if ([v3 isEqualToString:@"Flyover_TrackingStateReasonSessionInterruptedDuration"])
  {
    int v4 = 4025;
  }
  else if ([v3 isEqualToString:@"MSL_VECTOR_REQUEST_EXCEPTIONS"])
  {
    int v4 = 50001;
  }
  else if ([v3 isEqualToString:@"MSL_VECTOR_REQUEST_TIME_TO_PERFORM"])
  {
    int v4 = 50002;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_REQUEST_UNPARSEABLE_COUNT"])
  {
    int v4 = 51001;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT"])
  {
    int v4 = 51002;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_INVALID_REQUEST_COUNT"])
  {
    int v4 = 51003;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT"])
  {
    int v4 = 51004;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_WALKING_REQUEST_COUNT"])
  {
    int v4 = 51005;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT"])
  {
    int v4 = 51006;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT"])
  {
    int v4 = 51007;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_REQUEST_COUNT"])
  {
    int v4 = 51008;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_TOTAL_RUNTIME_MS"])
  {
    int v4 = 51009;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS"])
  {
    int v4 = 51010;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_SNAPPING_RUNTIME_MS"])
  {
    int v4 = 51011;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_COMPUTATION_RUNTIME_MS"])
  {
    int v4 = 51012;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS"])
  {
    int v4 = 51013;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS"])
  {
    int v4 = 51014;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS"])
  {
    int v4 = 51015;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS"])
  {
    int v4 = 51016;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS"])
  {
    int v4 = 51017;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS"])
  {
    int v4 = 51018;
  }
  else if ([v3 isEqualToString:@"MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS"])
  {
    int v4 = 51019;
  }
  else if ([v3 isEqualToString:@"MSL_ETA_INVALID_REQUEST_COUNT"])
  {
    int v4 = 51020;
  }
  else if ([v3 isEqualToString:@"MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS"])
  {
    int v4 = 52020;
  }
  else if ([v3 isEqualToString:@"MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS"])
  {
    int v4 = 52021;
  }
  else if ([v3 isEqualToString:@"MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS"])
  {
    int v4 = 52022;
  }
  else if ([v3 isEqualToString:@"MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS"])
  {
    int v4 = 52023;
  }
  else if ([v3 isEqualToString:@"MSL_SEARCH_CANCELLATION_COUNT"])
  {
    int v4 = 60000;
  }
  else if ([v3 isEqualToString:@"MSL_AC_RANKING_LATENCY_MS"])
  {
    int v4 = 60001;
  }
  else if ([v3 isEqualToString:@"MSL_GEOCODING_RANKING_LATENCY_MS"])
  {
    int v4 = 60002;
  }
  else if ([v3 isEqualToString:@"MSL_SEARCH_RANKING_LATENCY_MS"])
  {
    int v4 = 60003;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_REQUEST_COUNT"])
  {
    int v4 = 60100;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT"])
  {
    int v4 = 60101;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60102;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60103;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS"])
  {
    int v4 = 60104;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS"])
  {
    int v4 = 60105;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS"])
  {
    int v4 = 60106;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS"])
  {
    int v4 = 60107;
  }
  else if ([v3 isEqualToString:@"MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS"])
  {
    int v4 = 60108;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_REQUEST_COUNT"])
  {
    int v4 = 60200;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT"])
  {
    int v4 = 60201;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60202;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60203;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS"])
  {
    int v4 = 60204;
  }
  else if ([v3 isEqualToString:@"MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS"])
  {
    int v4 = 60205;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT"])
  {
    int v4 = 60300;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT"])
  {
    int v4 = 60301;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60302;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS"])
  {
    int v4 = 60303;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS"])
  {
    int v4 = 60304;
  }
  else if ([v3 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS"])
  {
    int v4 = 60305;
  }
  else if ([v3 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT"])
  {
    int v4 = 60400;
  }
  else if ([v3 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT"])
  {
    int v4 = 60401;
  }
  else if ([v3 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT"])
  {
    int v4 = 60402;
  }
  else if ([v3 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS"])
  {
    int v4 = 60403;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT"])
  {
    int v4 = 60500;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT"])
  {
    int v4 = 60501;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60502;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60503;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60504;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS"])
  {
    int v4 = 60505;
  }
  else if ([v3 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS"])
  {
    int v4 = 60506;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60600;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT"])
  {
    int v4 = 60601;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60610;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60611;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60612;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60613;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT"])
  {
    int v4 = 60614;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60615;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60616;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60620;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60621;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60622;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60623;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT"])
  {
    int v4 = 60624;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60625;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60626;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60630;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60631;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60632;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60633;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT"])
  {
    int v4 = 60634;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60635;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60636;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60640;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60641;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60642;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60643;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT"])
  {
    int v4 = 60644;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60645;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60646;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60650;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60651;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60652;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT"])
  {
    int v4 = 60653;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60654;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60655;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60660;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60661;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60662;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60663;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT"])
  {
    int v4 = 60664;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60665;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60666;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60670;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60671;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60672;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT"])
  {
    int v4 = 60673;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60674;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60675;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS"])
  {
    int v4 = 60680;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS"])
  {
    int v4 = 60681;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
  {
    int v4 = 60682;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT"])
  {
    int v4 = 60683;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT"])
  {
    int v4 = 60684;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT"])
  {
    int v4 = 60685;
  }
  else if ([v3 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
  {
    int v4 = 60686;
  }
  else
  {
    int v4 = 70001;
    if (([v3 isEqualToString:@"MSL_PLACES_SERVER_ERROR_COUNT"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"MSL_PLACES_INVALID_REQUEST_COUNT"])
      {
        int v4 = 70002;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_CANCELLED_REQUEST_COUNT"])
      {
        int v4 = 70003;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_REQUEST_COMPLETE_TIME_MS"])
      {
        int v4 = 70004;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS"])
      {
        int v4 = 70005;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_POI_COMPONENTS_TIME_MS"])
      {
        int v4 = 70006;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS"])
      {
        int v4 = 70007;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS"])
      {
        int v4 = 70008;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_POI_DATA_ACCESS_TIME_MS"])
      {
        int v4 = 70009;
      }
      else if ([v3 isEqualToString:@"MSL_PLACES_POI_LOCALIZATION_TIME_MS"])
      {
        int v4 = 70010;
      }
      else
      {
        int v4 = 0;
      }
    }
  }

  return v4;
}

- (unint64_t)eventValue
{
  return self->_eventValue;
}

- (void)setEventValue:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_eventValue = a3;
}

- (void)setHasEventValue:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEventValue
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasEventDetail
{
  return self->_eventDetail != 0;
}

- (NSString)eventDetail
{
  return self->_eventDetail;
}

- (void)setEventDetail:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTelemetricEntity;
  int v4 = [(GEOTelemetricEntity *)&v8 description];
  v5 = [(GEOTelemetricEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTelemetricEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      int v6 = *(_DWORD *)(a1 + 24);
      if (v6 <= 60099)
      {
        if (v6 <= 3000)
        {
          if (v6 <= 1199)
          {
            if (v6 > 1099)
            {
              switch(v6)
              {
                case 1100:
                  v7 = @"MM_AOF_FROMCONTACT_FAILED";
                  break;
                case 1101:
                  v7 = @"MM_AOF_FROMLEGACY_FAILED";
                  break;
                case 1102:
                  v7 = @"MM_AOF_FROMBYTES_FAILED";
                  break;
                default:
LABEL_56:
                  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
                  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  break;
              }
            }
            else
            {
              switch(v6)
              {
                case 1000:
                  v7 = @"MM_GS_STRUCTURED_ADDRESS_MISSING";
                  break;
                case 1001:
                  v7 = @"MM_GS_GEO_ADDRESS_DICTIONARY_MISSING";
                  break;
                case 1002:
                  v7 = @"MM_GS_GEOPDADDRESS_MISSING";
                  break;
                case 1003:
                  v7 = @"MM_GS_LANGUAGE_MISSING";
                  break;
                case 1004:
                  v7 = @"MM_GS_COUNTRY_MISSING";
                  break;
                case 1005:
                  v7 = @"MM_GS_PHONETIC_LOCALE_MISSING";
                  break;
                case 1006:
                  v7 = @"MM_GS_GEOPDADDRESSOBJECT_MISSING";
                  break;
                case 1007:
                  v7 = @"MM_GS_KNOWNACCURACY_MISSING";
                  break;
                case 1008:
                  v7 = @"MM_GS_ADDROBJPTR_MISSING";
                  break;
                case 1009:
                  v7 = @"MM_GS_CN_POSTAL_ADDRESS_MISSING";
                  break;
                case 1010:
                  v7 = @"MM_GS_CN_POSTAL_ADDRESS_FAILED";
                  break;
                default:
                  if (v6) {
                    goto LABEL_56;
                  }
                  v7 = @"TELEMETRIC_EVENT_KEY_UNKNOWN";
                  break;
              }
            }
          }
          else if (v6 > 2001)
          {
            switch(v6)
            {
              case 2200:
                v7 = @"REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT";
                break;
              case 2201:
                v7 = @"REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT";
                break;
              case 2202:
                v7 = @"BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT";
                break;
              case 2203:
                v7 = @"BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT";
                break;
              default:
                if (v6 == 2002)
                {
                  v7 = @"MapsAC_ContactRankDuration";
                }
                else
                {
                  if (v6 != 2003) {
                    goto LABEL_56;
                  }
                  v7 = @"MapsAC_ContactRankCount";
                }
                break;
            }
          }
          else
          {
            switch(v6)
            {
              case 1200:
                v7 = @"MM_AO_GETNAME_FAILED";
                break;
              case 1201:
                v7 = @"MM_AO_GETADDRESS_FAILED";
                break;
              case 1202:
                v7 = @"MM_AO_GETSPOKENNAME_FAILED";
                break;
              case 1203:
                v7 = @"MM_AO_GETSPOKENADDRESS_FAILED";
                break;
              case 1204:
                v7 = @"MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED";
                break;
              case 1205:
                v7 = @"MM_AO_GETPHONETICNAME_FAILED";
                break;
              case 1206:
                v7 = @"MM_AO_GETPHONETICADDRES_FAILED";
                break;
              case 1207:
                v7 = @"MM_AO_GETFULLADDRES_FAILED";
                break;
              case 1208:
                v7 = @"MM_AO_GETSHORTADDRES_FAILED";
                break;
              case 1209:
                v7 = @"MM_AO_GETDISPLAYLOCALITY_FAILED";
                break;
              case 1210:
                v7 = @"MM_AO_GETWEATHERNAME_FAILED";
                break;
              case 1211:
                v7 = @"MM_AO_GETPARKINGNAME_FAILED";
                break;
              case 1212:
                v7 = @"MM_AO_HASH_FAILED";
                break;
              case 1213:
                v7 = @"MM_AO_TOBYTES_FAILED";
                break;
              case 1214:
                v7 = @"MM_GS_CONTACT_KEYSET_INIT_FAILED";
                break;
              case 1215:
                v7 = @"MM_AO_GETVENUELABEL_FAILED";
                break;
              case 1216:
                v7 = @"MM_AO_GETVENUELEVEL_FAILED";
                break;
              case 1217:
                v7 = @"MM_AO_GETVENUESHORTADDRESS_FAILED";
                break;
              case 1218:
                v7 = @"MM_AO_GETLOCATIONADDRESS_FAILED";
                break;
              default:
                if (v6 != 2001) {
                  goto LABEL_56;
                }
                v7 = @"MapsAC_ContactMatchDuration";
                break;
            }
          }
        }
        else if (v6 <= 51000)
        {
          if (v6 > 4000)
          {
            switch(v6)
            {
              case 4001:
                v7 = @"Flyover_TrackingStateChange";
                break;
              case 4002:
                v7 = @"Flyover_TrackingStateReasonChange";
                break;
              case 4003:
              case 4004:
              case 4005:
              case 4006:
              case 4007:
              case 4008:
              case 4009:
              case 4010:
              case 4014:
              case 4015:
              case 4016:
              case 4017:
              case 4018:
              case 4019:
              case 4020:
                goto LABEL_56;
              case 4011:
                v7 = @"Flyover_TrackingStateNotAvailableDuration";
                break;
              case 4012:
                v7 = @"Flyover_TrackingStateLimitedDuration";
                break;
              case 4013:
                v7 = @"Flyover_TrackingStateNormalDuration";
                break;
              case 4021:
                v7 = @"Flyover_TrackingStateReasonNoneDuration";
                break;
              case 4022:
                v7 = @"Flyover_TrackingStateReasonInitializingDuration";
                break;
              case 4023:
                v7 = @"Flyover_TrackingStateReasonExcessiveMotionDuration";
                break;
              case 4024:
                v7 = @"Flyover_TrackingStateReasonInsufficientFeaturesDuration";
                break;
              case 4025:
                v7 = @"Flyover_TrackingStateReasonSessionInterruptedDuration";
                break;
              default:
                if (v6 == 50001)
                {
                  v7 = @"MSL_VECTOR_REQUEST_EXCEPTIONS";
                }
                else
                {
                  if (v6 != 50002) {
                    goto LABEL_56;
                  }
                  v7 = @"MSL_VECTOR_REQUEST_TIME_TO_PERFORM";
                }
                break;
            }
          }
          else
          {
            switch(v6)
            {
              case 3001:
                v7 = @"MSPSync_ClientCount";
                break;
              case 3002:
                v7 = @"MSPSync_HistoryAdd";
                break;
              case 3003:
                v7 = @"MSPSync_HistoryRemove";
                break;
              case 3004:
                v7 = @"MSPSync_HistoryCount";
                break;
              case 3005:
                v7 = @"MSPSync_FavoriteAdd";
                break;
              case 3006:
                v7 = @"MSPSync_FavoriteEdit";
                break;
              case 3007:
                v7 = @"MSPSync_FavoriteRemove";
                break;
              case 3008:
                v7 = @"MSPSync_FavoriteCount";
                break;
              case 3009:
                v7 = @"MSPSync_Merged";
                break;
              case 3010:
                v7 = @"MSPSync_MergeDuration";
                break;
              case 3011:
                v7 = @"MSPSync_NotificationDelay";
                break;
              case 3012:
                v7 = @"MSPSync_CKOperationFinished";
                break;
              default:
                goto LABEL_56;
            }
          }
        }
        else
        {
          switch(v6)
          {
            case 51001:
              v7 = @"MSL_ETA_REQUEST_UNPARSEABLE_COUNT";
              break;
            case 51002:
              v7 = @"MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT";
              break;
            case 51003:
              v7 = @"MSL_DIRECTIONS_INVALID_REQUEST_COUNT";
              break;
            case 51004:
              v7 = @"MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT";
              break;
            case 51005:
              v7 = @"MSL_DIRECTIONS_WALKING_REQUEST_COUNT";
              break;
            case 51006:
              v7 = @"MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT";
              break;
            case 51007:
              v7 = @"MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT";
              break;
            case 51008:
              v7 = @"MSL_ETA_REQUEST_COUNT";
              break;
            case 51009:
              v7 = @"MSL_ETA_TOTAL_RUNTIME_MS";
              break;
            case 51010:
              v7 = @"MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS";
              break;
            case 51011:
              v7 = @"MSL_ETA_SNAPPING_RUNTIME_MS";
              break;
            case 51012:
              v7 = @"MSL_ETA_COMPUTATION_RUNTIME_MS";
              break;
            case 51013:
              v7 = @"MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS";
              break;
            case 51014:
              v7 = @"MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS";
              break;
            case 51015:
              v7 = @"MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS";
              break;
            case 51016:
              v7 = @"MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS";
              break;
            case 51017:
              v7 = @"MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS";
              break;
            case 51018:
              v7 = @"MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS";
              break;
            case 51019:
              v7 = @"MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS";
              break;
            case 51020:
              v7 = @"MSL_ETA_INVALID_REQUEST_COUNT";
              break;
            default:
              switch(v6)
              {
                case 60000:
                  v7 = @"MSL_SEARCH_CANCELLATION_COUNT";
                  break;
                case 60001:
                  v7 = @"MSL_AC_RANKING_LATENCY_MS";
                  break;
                case 60002:
                  v7 = @"MSL_GEOCODING_RANKING_LATENCY_MS";
                  break;
                case 60003:
                  v7 = @"MSL_SEARCH_RANKING_LATENCY_MS";
                  break;
                default:
                  goto LABEL_56;
              }
              break;
          }
        }
      }
      else if (v6 <= 60599)
      {
        if (v6 <= 60299)
        {
          switch(v6)
          {
            case 60100:
              v7 = @"MSL_ADDRESS_SEARCH_REQUEST_COUNT";
              break;
            case 60101:
              v7 = @"MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT";
              break;
            case 60102:
              v7 = @"MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT";
              break;
            case 60103:
              v7 = @"MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS";
              break;
            case 60104:
              v7 = @"MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS";
              break;
            case 60105:
              v7 = @"MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS";
              break;
            case 60106:
              v7 = @"MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS";
              break;
            case 60107:
              v7 = @"MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS";
              break;
            case 60108:
              v7 = @"MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS";
              break;
            default:
              switch(v6)
              {
                case 60200:
                  v7 = @"MSL_BUSINESS_SEARCH_REQUEST_COUNT";
                  break;
                case 60201:
                  v7 = @"MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT";
                  break;
                case 60202:
                  v7 = @"MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT";
                  break;
                case 60203:
                  v7 = @"MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS";
                  break;
                case 60204:
                  v7 = @"MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS";
                  break;
                case 60205:
                  v7 = @"MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS";
                  break;
                default:
                  goto LABEL_56;
              }
              break;
          }
        }
        else
        {
          switch(v6)
          {
            case 60300:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT";
              break;
            case 60301:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT";
              break;
            case 60302:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT";
              break;
            case 60303:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS";
              break;
            case 60304:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS";
              break;
            case 60305:
              v7 = @"MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS";
              break;
            default:
              switch(v6)
              {
                case 60400:
                  v7 = @"MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT";
                  break;
                case 60401:
                  v7 = @"MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT";
                  break;
                case 60402:
                  v7 = @"MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT";
                  break;
                case 60403:
                  v7 = @"MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS";
                  break;
                default:
                  goto LABEL_56;
              }
              break;
          }
        }
      }
      else
      {
        switch(v6)
        {
          case 60600:
            v7 = @"MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60601:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT";
            break;
          case 60602:
          case 60603:
          case 60604:
          case 60605:
          case 60606:
          case 60607:
          case 60608:
          case 60609:
          case 60617:
          case 60618:
          case 60619:
          case 60627:
          case 60628:
          case 60629:
          case 60637:
          case 60638:
          case 60639:
          case 60647:
          case 60648:
          case 60649:
          case 60656:
          case 60657:
          case 60658:
          case 60659:
          case 60667:
          case 60668:
          case 60669:
          case 60676:
          case 60677:
          case 60678:
          case 60679:
            goto LABEL_56;
          case 60610:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60611:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS";
            break;
          case 60612:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60613:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60614:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT";
            break;
          case 60615:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60616:
            v7 = @"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60620:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60621:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS";
            break;
          case 60622:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60623:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60624:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT";
            break;
          case 60625:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60626:
            v7 = @"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60630:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60631:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS";
            break;
          case 60632:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60633:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60634:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT";
            break;
          case 60635:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60636:
            v7 = @"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60640:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60641:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS";
            break;
          case 60642:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60643:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60644:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT";
            break;
          case 60645:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60646:
            v7 = @"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60650:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60651:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60652:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60653:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT";
            break;
          case 60654:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60655:
            v7 = @"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60660:
            v7 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60661:
            v7 = @"MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS";
            break;
          case 60662:
            v7 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60663:
            v7 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60664:
            v7 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT";
            break;
          case 60665:
            v7 = @"MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60666:
            v7 = @"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60670:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60671:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60672:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60673:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT";
            break;
          case 60674:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60675:
            v7 = @"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          case 60680:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS";
            break;
          case 60681:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS";
            break;
          case 60682:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS";
            break;
          case 60683:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT";
            break;
          case 60684:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT";
            break;
          case 60685:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT";
            break;
          case 60686:
            v7 = @"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT";
            break;
          default:
            switch(v6)
            {
              case 70001:
                v7 = @"MSL_PLACES_SERVER_ERROR_COUNT";
                break;
              case 70002:
                v7 = @"MSL_PLACES_INVALID_REQUEST_COUNT";
                break;
              case 70003:
                v7 = @"MSL_PLACES_CANCELLED_REQUEST_COUNT";
                break;
              case 70004:
                v7 = @"MSL_PLACES_REQUEST_COMPLETE_TIME_MS";
                break;
              case 70005:
                v7 = @"MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS";
                break;
              case 70006:
                v7 = @"MSL_PLACES_POI_COMPONENTS_TIME_MS";
                break;
              case 70007:
                v7 = @"MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS";
                break;
              case 70008:
                v7 = @"MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS";
                break;
              case 70009:
                v7 = @"MSL_PLACES_POI_DATA_ACCESS_TIME_MS";
                break;
              case 70010:
                v7 = @"MSL_PLACES_POI_LOCALIZATION_TIME_MS";
                break;
              default:
                goto LABEL_56;
            }
            break;
        }
      }
      if (a2) {
        objc_super v8 = @"eventKey";
      }
      else {
        objc_super v8 = @"event_key";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v10 = @"eventValue";
      }
      else {
        v10 = @"event_value";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 eventDetail];
    if (v11)
    {
      if (a2) {
        v12 = @"eventDetail";
      }
      else {
        v12 = @"event_detail";
      }
      [v4 setObject:v11 forKey:v12];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTelemetricEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTelemetricEntity)initWithDictionary:(id)a3
{
  return (GEOTelemetricEntity *)-[GEOTelemetricEntity _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_404;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_404;
  }
  if (a3) {
    int v6 = @"eventKey";
  }
  else {
    int v6 = @"event_key";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"TELEMETRIC_EVENT_KEY_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"MM_GS_STRUCTURED_ADDRESS_MISSING"])
    {
      uint64_t v9 = 1000;
    }
    else if ([v8 isEqualToString:@"MM_GS_GEO_ADDRESS_DICTIONARY_MISSING"])
    {
      uint64_t v9 = 1001;
    }
    else if ([v8 isEqualToString:@"MM_GS_GEOPDADDRESS_MISSING"])
    {
      uint64_t v9 = 1002;
    }
    else if ([v8 isEqualToString:@"MM_GS_LANGUAGE_MISSING"])
    {
      uint64_t v9 = 1003;
    }
    else if ([v8 isEqualToString:@"MM_GS_COUNTRY_MISSING"])
    {
      uint64_t v9 = 1004;
    }
    else if ([v8 isEqualToString:@"MM_GS_PHONETIC_LOCALE_MISSING"])
    {
      uint64_t v9 = 1005;
    }
    else if ([v8 isEqualToString:@"MM_GS_GEOPDADDRESSOBJECT_MISSING"])
    {
      uint64_t v9 = 1006;
    }
    else if ([v8 isEqualToString:@"MM_GS_KNOWNACCURACY_MISSING"])
    {
      uint64_t v9 = 1007;
    }
    else if ([v8 isEqualToString:@"MM_GS_ADDROBJPTR_MISSING"])
    {
      uint64_t v9 = 1008;
    }
    else if ([v8 isEqualToString:@"MM_GS_CN_POSTAL_ADDRESS_MISSING"])
    {
      uint64_t v9 = 1009;
    }
    else if ([v8 isEqualToString:@"MM_GS_CN_POSTAL_ADDRESS_FAILED"])
    {
      uint64_t v9 = 1010;
    }
    else if ([v8 isEqualToString:@"MM_AOF_FROMCONTACT_FAILED"])
    {
      uint64_t v9 = 1100;
    }
    else if ([v8 isEqualToString:@"MM_AOF_FROMLEGACY_FAILED"])
    {
      uint64_t v9 = 1101;
    }
    else if ([v8 isEqualToString:@"MM_AOF_FROMBYTES_FAILED"])
    {
      uint64_t v9 = 1102;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETNAME_FAILED"])
    {
      uint64_t v9 = 1200;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETADDRESS_FAILED"])
    {
      uint64_t v9 = 1201;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETSPOKENNAME_FAILED"])
    {
      uint64_t v9 = 1202;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETSPOKENADDRESS_FAILED"])
    {
      uint64_t v9 = 1203;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETSPOKENSTRUCTUREDADDRESS_FAILED"])
    {
      uint64_t v9 = 1204;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETPHONETICNAME_FAILED"])
    {
      uint64_t v9 = 1205;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETPHONETICADDRES_FAILED"])
    {
      uint64_t v9 = 1206;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETFULLADDRES_FAILED"])
    {
      uint64_t v9 = 1207;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETSHORTADDRES_FAILED"])
    {
      uint64_t v9 = 1208;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETDISPLAYLOCALITY_FAILED"])
    {
      uint64_t v9 = 1209;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETWEATHERNAME_FAILED"])
    {
      uint64_t v9 = 1210;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETPARKINGNAME_FAILED"])
    {
      uint64_t v9 = 1211;
    }
    else if ([v8 isEqualToString:@"MM_AO_HASH_FAILED"])
    {
      uint64_t v9 = 1212;
    }
    else if ([v8 isEqualToString:@"MM_AO_TOBYTES_FAILED"])
    {
      uint64_t v9 = 1213;
    }
    else if ([v8 isEqualToString:@"MM_GS_CONTACT_KEYSET_INIT_FAILED"])
    {
      uint64_t v9 = 1214;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETVENUELABEL_FAILED"])
    {
      uint64_t v9 = 1215;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETVENUELEVEL_FAILED"])
    {
      uint64_t v9 = 1216;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETVENUESHORTADDRESS_FAILED"])
    {
      uint64_t v9 = 1217;
    }
    else if ([v8 isEqualToString:@"MM_AO_GETLOCATIONADDRESS_FAILED"])
    {
      uint64_t v9 = 1218;
    }
    else if ([v8 isEqualToString:@"MapsAC_ContactMatchDuration"])
    {
      uint64_t v9 = 2001;
    }
    else if ([v8 isEqualToString:@"MapsAC_ContactRankDuration"])
    {
      uint64_t v9 = 2002;
    }
    else if ([v8 isEqualToString:@"MapsAC_ContactRankCount"])
    {
      uint64_t v9 = 2003;
    }
    else if ([v8 isEqualToString:@"REALTIME_PROBE_COLLECTION_RECEIVED_PROBE_COUNT"])
    {
      uint64_t v9 = 2200;
    }
    else if ([v8 isEqualToString:@"REALTIME_PROBE_COLLECTION_SENT_PROBE_COUNT"])
    {
      uint64_t v9 = 2201;
    }
    else if ([v8 isEqualToString:@"BATCH_PROBE_COLLECTION_RECEIVED_PROBE_COUNT"])
    {
      uint64_t v9 = 2202;
    }
    else if ([v8 isEqualToString:@"BATCH_PROBE_COLLECTION_SENT_PROBE_COUNT"])
    {
      uint64_t v9 = 2203;
    }
    else if ([v8 isEqualToString:@"MSPSync_ClientCount"])
    {
      uint64_t v9 = 3001;
    }
    else if ([v8 isEqualToString:@"MSPSync_HistoryAdd"])
    {
      uint64_t v9 = 3002;
    }
    else if ([v8 isEqualToString:@"MSPSync_HistoryRemove"])
    {
      uint64_t v9 = 3003;
    }
    else if ([v8 isEqualToString:@"MSPSync_HistoryCount"])
    {
      uint64_t v9 = 3004;
    }
    else if ([v8 isEqualToString:@"MSPSync_FavoriteAdd"])
    {
      uint64_t v9 = 3005;
    }
    else if ([v8 isEqualToString:@"MSPSync_FavoriteEdit"])
    {
      uint64_t v9 = 3006;
    }
    else if ([v8 isEqualToString:@"MSPSync_FavoriteRemove"])
    {
      uint64_t v9 = 3007;
    }
    else if ([v8 isEqualToString:@"MSPSync_FavoriteCount"])
    {
      uint64_t v9 = 3008;
    }
    else if ([v8 isEqualToString:@"MSPSync_Merged"])
    {
      uint64_t v9 = 3009;
    }
    else if ([v8 isEqualToString:@"MSPSync_MergeDuration"])
    {
      uint64_t v9 = 3010;
    }
    else if ([v8 isEqualToString:@"MSPSync_NotificationDelay"])
    {
      uint64_t v9 = 3011;
    }
    else if ([v8 isEqualToString:@"MSPSync_CKOperationFinished"])
    {
      uint64_t v9 = 3012;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateChange"])
    {
      uint64_t v9 = 4001;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonChange"])
    {
      uint64_t v9 = 4002;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateNotAvailableDuration"])
    {
      uint64_t v9 = 4011;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateLimitedDuration"])
    {
      uint64_t v9 = 4012;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateNormalDuration"])
    {
      uint64_t v9 = 4013;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonNoneDuration"])
    {
      uint64_t v9 = 4021;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonInitializingDuration"])
    {
      uint64_t v9 = 4022;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonExcessiveMotionDuration"])
    {
      uint64_t v9 = 4023;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonInsufficientFeaturesDuration"])
    {
      uint64_t v9 = 4024;
    }
    else if ([v8 isEqualToString:@"Flyover_TrackingStateReasonSessionInterruptedDuration"])
    {
      uint64_t v9 = 4025;
    }
    else if ([v8 isEqualToString:@"MSL_VECTOR_REQUEST_EXCEPTIONS"])
    {
      uint64_t v9 = 50001;
    }
    else if ([v8 isEqualToString:@"MSL_VECTOR_REQUEST_TIME_TO_PERFORM"])
    {
      uint64_t v9 = 50002;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_REQUEST_UNPARSEABLE_COUNT"])
    {
      uint64_t v9 = 51001;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_REQUEST_UNPARSEABLE_COUNT"])
    {
      uint64_t v9 = 51002;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_INVALID_REQUEST_COUNT"])
    {
      uint64_t v9 = 51003;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_AUTOMOBILE_REQUEST_COUNT"])
    {
      uint64_t v9 = 51004;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_WALKING_REQUEST_COUNT"])
    {
      uint64_t v9 = 51005;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_TRANSIT_REQUEST_COUNT"])
    {
      uint64_t v9 = 51006;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_UNSUPPORTED_REQUEST_COUNT"])
    {
      uint64_t v9 = 51007;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_REQUEST_COUNT"])
    {
      uint64_t v9 = 51008;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_TOTAL_RUNTIME_MS"])
    {
      uint64_t v9 = 51009;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_DRIVING_TOTAL_RUNTIME_MS"])
    {
      uint64_t v9 = 51010;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_SNAPPING_RUNTIME_MS"])
    {
      uint64_t v9 = 51011;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_COMPUTATION_RUNTIME_MS"])
    {
      uint64_t v9 = 51012;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_DRIVING_SNAPPING_RUNTIME_MS"])
    {
      uint64_t v9 = 51013;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_DRIVING_PATH_COMPUTATION_RUNTIME_MS"])
    {
      uint64_t v9 = 51014;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_DRIVING_SELECTION_RUNTIME_MS"])
    {
      uint64_t v9 = 51015;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_DRIVING_GUIDANCE_RUNTIME_MS"])
    {
      uint64_t v9 = 51016;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_WALKING_SNAPPING_RUNTIME_MS"])
    {
      uint64_t v9 = 51017;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_WALKING_PATH_COMPUTATION_RUNTIME_MS"])
    {
      uint64_t v9 = 51018;
    }
    else if ([v8 isEqualToString:@"MSL_DIRECTIONS_WALKING_GUIDANCE_RUNTIME_MS"])
    {
      uint64_t v9 = 51019;
    }
    else if ([v8 isEqualToString:@"MSL_ETA_INVALID_REQUEST_COUNT"])
    {
      uint64_t v9 = 51020;
    }
    else if ([v8 isEqualToString:@"MSL_ROUTING_TRAFFIC_SNAPSHOT_PROCESSING_RUNTIME_MS"])
    {
      uint64_t v9 = 52020;
    }
    else if ([v8 isEqualToString:@"MSL_ROUTING_TRAFFIC_ROAD_SPEED_UPDATE_RUNTIME_MS"])
    {
      uint64_t v9 = 52021;
    }
    else if ([v8 isEqualToString:@"MSL_ROUTING_TRAFFIC_CELL_MARKING_RUNTIME_MS"])
    {
      uint64_t v9 = 52022;
    }
    else if ([v8 isEqualToString:@"MSL_ROUTING_TRAFFIC_CELL_COMPUTATION_RUNTIME_MS"])
    {
      uint64_t v9 = 52023;
    }
    else if ([v8 isEqualToString:@"MSL_SEARCH_CANCELLATION_COUNT"])
    {
      uint64_t v9 = 60000;
    }
    else if ([v8 isEqualToString:@"MSL_AC_RANKING_LATENCY_MS"])
    {
      uint64_t v9 = 60001;
    }
    else if ([v8 isEqualToString:@"MSL_GEOCODING_RANKING_LATENCY_MS"])
    {
      uint64_t v9 = 60002;
    }
    else if ([v8 isEqualToString:@"MSL_SEARCH_RANKING_LATENCY_MS"])
    {
      uint64_t v9 = 60003;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_REQUEST_COUNT"])
    {
      uint64_t v9 = 60100;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_REQUEST_FAILED_COUNT"])
    {
      uint64_t v9 = 60101;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60102;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60103;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_RECALL_LATENCY_MS"])
    {
      uint64_t v9 = 60104;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_FEATURIZING_LATENCY_MS"])
    {
      uint64_t v9 = 60105;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_DOOR_NUM_REFINEMENT_LATENCY_MS"])
    {
      uint64_t v9 = 60106;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_PRELOAD_LATENCY_MS"])
    {
      uint64_t v9 = 60107;
    }
    else if ([v8 isEqualToString:@"MSL_ADDRESS_SEARCH_INTERPOLATION_LATENCY_MS"])
    {
      uint64_t v9 = 60108;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_REQUEST_COUNT"])
    {
      uint64_t v9 = 60200;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_REQUEST_FAILED_COUNT"])
    {
      uint64_t v9 = 60201;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60202;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60203;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_RECALL_LATENCY_MS"])
    {
      uint64_t v9 = 60204;
    }
    else if ([v8 isEqualToString:@"MSL_BUSINESS_SEARCH_FEATURIZING_LATENCY_MS"])
    {
      uint64_t v9 = 60205;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_COUNT"])
    {
      uint64_t v9 = 60300;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_REQUEST_FAILED_COUNT"])
    {
      uint64_t v9 = 60301;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60302;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60303;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_RECALL_LATENCY_MS"])
    {
      uint64_t v9 = 60304;
    }
    else if ([v8 isEqualToString:@"MSL_BIZ_SEARCH_CAT_NAME_FEATURIZING_LATENCY_MS"])
    {
      uint64_t v9 = 60305;
    }
    else if ([v8 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_REQUEST_COUNT"])
    {
      uint64_t v9 = 60400;
    }
    else if ([v8 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_FAILED_COUNT"])
    {
      uint64_t v9 = 60401;
    }
    else if ([v8 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_SIZE_COUNT"])
    {
      uint64_t v9 = 60402;
    }
    else if ([v8 isEqualToString:@"MSL_CATEGORY_TRIGGER_PHRASE_LATENCY_MS"])
    {
      uint64_t v9 = 60403;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_REQUEST_COUNT"])
    {
      uint64_t v9 = 60500;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_REQUEST_COUNT"])
    {
      uint64_t v9 = 60501;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60502;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60503;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60504;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_TRIGGER_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60505;
    }
    else if ([v8 isEqualToString:@"MSL_EX_CATEGORY_SEARCH_FEATURIZING_LATENCY_MS"])
    {
      uint64_t v9 = 60506;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60600;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_ADDRESS_SEARCH_COUNT"])
    {
      uint64_t v9 = 60601;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60610;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60611;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60612;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60613;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_COUNT"])
    {
      uint64_t v9 = 60614;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60615;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60616;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60620;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60621;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60622;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60623;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_COUNT"])
    {
      uint64_t v9 = 60624;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60625;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_BIZMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60626;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60630;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60631;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60632;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60633;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60634;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60635;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60636;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60640;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60641;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60642;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60643;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60644;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60645;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOIBIZ_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60646;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60650;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60651;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60652;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_COUNT"])
    {
      uint64_t v9 = 60653;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60654;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_GEOCAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60655;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60660;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60661;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60662;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60663;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_COUNT"])
    {
      uint64_t v9 = 60664;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60665;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATGEO_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60666;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60670;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60671;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60672;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_COUNT"])
    {
      uint64_t v9 = 60673;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60674;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_MARKERPOICAT_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60675;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_TOTAL_LATENCY_MS"])
    {
      uint64_t v9 = 60680;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_PREFETCH_LATENCY_MS"])
    {
      uint64_t v9 = 60681;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_LATENCY_MS"])
    {
      uint64_t v9 = 60682;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_COUNT"])
    {
      uint64_t v9 = 60683;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_COUNT"])
    {
      uint64_t v9 = 60684;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_SEARCH_RESPONSE_SIZE_COUNT"])
    {
      uint64_t v9 = 60685;
    }
    else if ([v8 isEqualToString:@"MSL_MIXEDINTENT_CATMARKERPOI_BOUNDED_BIZ_SEARCH_ERROR_COUNT"])
    {
      uint64_t v9 = 60686;
    }
    else
    {
      uint64_t v9 = 70001;
      if (([v8 isEqualToString:@"MSL_PLACES_SERVER_ERROR_COUNT"] & 1) == 0)
      {
        if ([v8 isEqualToString:@"MSL_PLACES_INVALID_REQUEST_COUNT"])
        {
          uint64_t v9 = 70002;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_CANCELLED_REQUEST_COUNT"])
        {
          uint64_t v9 = 70003;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_REQUEST_COMPLETE_TIME_MS"])
        {
          uint64_t v9 = 70004;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_TRANSIT_COMPONENTS_TIME_MS"])
        {
          uint64_t v9 = 70005;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_POI_COMPONENTS_TIME_MS"])
        {
          uint64_t v9 = 70006;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_TRANSIT_DATA_ACCESS_TIME_MS"])
        {
          uint64_t v9 = 70007;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_TRANSIT_LOCALIZATION_TIME_MS"])
        {
          uint64_t v9 = 70008;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_POI_DATA_ACCESS_TIME_MS"])
        {
          uint64_t v9 = 70009;
        }
        else if ([v8 isEqualToString:@"MSL_PLACES_POI_LOCALIZATION_TIME_MS"])
        {
          uint64_t v9 = 70010;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
    }

    goto LABEL_392;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_392:
    [a1 setEventKey:v9];
  }

  if (a3) {
    v10 = @"eventValue";
  }
  else {
    v10 = @"event_value";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEventValue:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  if (a3) {
    v12 = @"eventDetail";
  }
  else {
    v12 = @"event_detail";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v13 copy];
    [a1 setEventDetail:v14];
  }
LABEL_404:

  return a1;
}

- (GEOTelemetricEntity)initWithJSON:(id)a3
{
  return (GEOTelemetricEntity *)-[GEOTelemetricEntity _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTelemetricEntityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTelemetricEntityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_eventDetail)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOTelemetricEntity *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_eventKey;
    *((unsigned char *)v6 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v6 + 2) = self->_eventValue;
    *((unsigned char *)v6 + 28) |= 1u;
  }
  if (self->_eventDetail)
  {
    objc_msgSend(v6, "setEventDetail:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventKey;
    *(unsigned char *)(v5 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 16) = self->_eventValue;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_eventDetail copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOTelemetricEntity *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_eventKey != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_eventValue != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  eventDetail = self->_eventDetail;
  if ((unint64_t)eventDetail | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](eventDetail, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTelemetricEntity *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_eventKey;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSString *)self->_eventDetail hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_eventValue;
  return v4 ^ v3 ^ [(NSString *)self->_eventDetail hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  unint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 28);
  if ((v5 & 2) != 0)
  {
    self->_eventKey = *((_DWORD *)v6 + 6);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v6 + 28);
  }
  if (v5)
  {
    self->_eventValue = *((void *)v6 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v6 + 1))
  {
    -[GEOTelemetricEntity setEventDetail:](self, "setEventDetail:");
    unint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end