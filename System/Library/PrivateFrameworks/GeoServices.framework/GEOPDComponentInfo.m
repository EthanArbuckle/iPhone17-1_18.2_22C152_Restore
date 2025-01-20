@interface GEOPDComponentInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDComponentInfo)initWithType:(int)a3 count:(unsigned int)a4;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filter;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)setFilter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDComponentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_startIndex != *((_DWORD *)v4 + 7)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_count != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_32;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((void *)v4 + 2))
  {
    if (!-[GEOPDComponentFilter isEqual:](filter, "isEqual:")) {
      goto LABEL_32;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_includeSource)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_28;
      }
    }
LABEL_32:
    BOOL v8 = 0;
    goto LABEL_33;
  }
  if ((v6 & 0x10) != 0) {
    goto LABEL_32;
  }
LABEL_28:
  BOOL v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_urgency != *((_DWORD *)v4 + 9)) {
      goto LABEL_32;
    }
    BOOL v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_startIndex;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_count;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(GEOPDComponentFilter *)self->_filter hash];
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v7 = 2654435761 * self->_includeSource;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v8 = 2654435761 * self->_urgency;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
}

- (GEOPDComponentInfo)initWithType:(int)a3 count:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GEOPDComponentInfo;
  unint64_t v6 = [(GEOPDComponentInfo *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    *(unsigned char *)&v6->_flags |= 4u;
    v6->_type = a3;
    if (a4)
    {
      *(unsigned char *)&v6->_flags |= 1u;
      v6->_count = a4;
    }
    uint64_t v8 = v6;
  }

  return v7;
}

- (void)setFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)filter
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_filter) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_flags;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_flags;
  }
  if ((v5 & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDComponentInfo;
  id v4 = [(GEOPDComponentInfo *)&v8 description];
  char v5 = [(GEOPDComponentInfo *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponentInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 44);
    if ((v5 & 4) != 0)
    {
      id v6 = @"COMPONENT_TYPE_UNKNOWN";
      switch(*(_DWORD *)(a1 + 32))
      {
        case 0:
          break;
        case 1:
          id v6 = @"COMPONENT_TYPE_ENTITY";
          break;
        case 2:
          id v6 = @"COMPONENT_TYPE_PLACE_INFO";
          break;
        case 3:
          id v6 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
          break;
        case 4:
          id v6 = @"COMPONENT_TYPE_BOUNDS";
          break;
        case 5:
          id v6 = @"COMPONENT_TYPE_ADDRESS";
          break;
        case 6:
          id v6 = @"COMPONENT_TYPE_RATING";
          break;
        case 7:
          id v6 = @"COMPONENT_TYPE_REVIEW";
          break;
        case 8:
          id v6 = @"COMPONENT_TYPE_PHOTO";
          break;
        case 9:
          id v6 = @"COMPONENT_TYPE_HOURS";
          break;
        case 0xA:
          id v6 = @"COMPONENT_TYPE_TRANSIT_INFO";
          break;
        case 0xB:
          id v6 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
          break;
        case 0xC:
          id v6 = @"COMPONENT_TYPE_ETA";
          break;
        case 0xD:
          id v6 = @"COMPONENT_TYPE_FLYOVER";
          break;
        case 0xE:
          id v6 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
          break;
        case 0xF:
          id v6 = @"COMPONENT_TYPE_AMENITIES";
          break;
        case 0x10:
          id v6 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
          break;
        case 0x14:
          id v6 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
          break;
        case 0x15:
          id v6 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
          break;
        case 0x16:
          id v6 = @"COMPONENT_TYPE_TEXT_BLOCK";
          break;
        case 0x17:
          id v6 = @"COMPONENT_TYPE_FACTOID";
          break;
        case 0x18:
          id v6 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
          break;
        case 0x19:
          id v6 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
          break;
        case 0x1A:
          id v6 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
          break;
        case 0x1B:
          id v6 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
          break;
        case 0x1D:
          id v6 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
          break;
        case 0x1E:
          id v6 = @"COMPONENT_TYPE_RESULT_SNIPPET";
          break;
        case 0x1F:
          id v6 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
          break;
        case 0x20:
          id v6 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
          break;
        case 0x21:
          id v6 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
          break;
        case 0x22:
          id v6 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
          break;
        case 0x24:
          id v6 = @"COMPONENT_TYPE_TIP";
          break;
        case 0x25:
          id v6 = @"COMPONENT_TYPE_PLACECARD_URL";
          break;
        case 0x26:
          id v6 = @"COMPONENT_TYPE_ASSOCIATED_APP";
          break;
        case 0x27:
          id v6 = @"COMPONENT_TYPE_MESSAGE_LINK";
          break;
        case 0x28:
          id v6 = @"COMPONENT_TYPE_QUICK_LINK";
          break;
        case 0x29:
          id v6 = @"COMPONENT_TYPE_RAP";
          break;
        case 0x2A:
          id v6 = @"COMPONENT_TYPE_OFFLINE_AREA";
          break;
        case 0x2B:
          id v6 = @"COMPONENT_TYPE_LOCATION_EVENT";
          break;
        case 0x2C:
          id v6 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
          break;
        case 0x2D:
          id v6 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
          break;
        case 0x2E:
          id v6 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
          break;
        case 0x2F:
          id v6 = @"COMPONENT_TYPE_OFFLINE_SIZE";
          break;
        case 0x30:
          id v6 = @"COMPONENT_TYPE_VENUE_INFO";
          break;
        case 0x31:
          id v6 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
          break;
        case 0x32:
          id v6 = @"COMPONENT_TYPE_CONTAINED_PLACE";
          break;
        case 0x33:
          id v6 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
          break;
        case 0x34:
          id v6 = @"COMPONENT_TYPE_ICON";
          break;
        case 0x35:
          id v6 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
          break;
        case 0x36:
          id v6 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
          break;
        case 0x37:
          id v6 = @"COMPONENT_TYPE_STOREFRONT";
          break;
        case 0x38:
          id v6 = @"COMPONENT_TYPE_GROUND_VIEW_LABEL";
          break;
        case 0x39:
          id v6 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
          break;
        case 0x3A:
          id v6 = @"COMPONENT_TYPE_POI_EVENT";
          break;
        case 0x3B:
          id v6 = @"COMPONENT_TYPE_STOREFRONT_PRESENTATION";
          break;
        case 0x3C:
          id v6 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
          break;
        case 0x3D:
          id v6 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
          break;
        case 0x3E:
          id v6 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
          break;
        case 0x3F:
          id v6 = @"COMPONENT_TYPE_LINKED_SERVICE";
          break;
        case 0x40:
          id v6 = @"COMPONENT_TYPE_BUSINESS_HOURS";
          break;
        case 0x41:
          id v6 = @"COMPONENT_TYPE_COLLECTION";
          break;
        case 0x42:
          id v6 = @"COMPONENT_TYPE_RELATED_PLACE";
          break;
        case 0x43:
          id v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
          break;
        case 0x44:
          id v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
          break;
        case 0x45:
          id v6 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
          break;
        case 0x46:
          id v6 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
          break;
        case 0x47:
          id v6 = @"COMPONENT_TYPE_PUBLISHER";
          break;
        case 0x48:
          id v6 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
          break;
        case 0x49:
          id v6 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
          break;
        case 0x4A:
          id v6 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
          break;
        case 0x4C:
          id v6 = @"COMPONENT_TYPE_COLLECTION_IDS";
          break;
        case 0x4D:
          id v6 = @"COMPONENT_TYPE_ISO_3166_CODE";
          break;
        case 0x4E:
          id v6 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
          break;
        case 0x4F:
          id v6 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
          break;
        case 0x51:
          id v6 = @"COMPONENT_TYPE_STOREFRONT_FACES";
          break;
        case 0x52:
          id v6 = @"COMPONENT_TYPE_GUIDE_GROUP";
          break;
        case 0x53:
          id v6 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
          break;
        case 0x54:
          id v6 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
          break;
        case 0x55:
          id v6 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
          break;
        case 0x56:
          id v6 = @"COMPONENT_TYPE_ABOUT";
          break;
        case 0x57:
          id v6 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
          break;
        case 0x58:
          id v6 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
          break;
        case 0x59:
          id v6 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
          break;
        case 0x5A:
          id v6 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
          break;
        case 0x5B:
          id v6 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
          break;
        case 0x5C:
          id v6 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
          break;
        case 0x5D:
          id v6 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
          break;
        case 0x5E:
          id v6 = @"COMPONENT_TYPE_ACTION_DATA";
          break;
        case 0x5F:
          id v6 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
          break;
        case 0x60:
          id v6 = @"COMPONENT_TYPE_POI_CLAIM";
          break;
        case 0x61:
          id v6 = @"COMPONENT_TYPE_EV_CHARGER";
          break;
        case 0x62:
          id v6 = @"COMPONENT_TYPE_TRAIL_HEAD";
          break;
        case 0x63:
          id v6 = @"COMPONENT_TYPE_TOOL_TIP";
          break;
        case 0x64:
          id v6 = @"COMPONENT_TYPE_REFRESH_ID";
          break;
        case 0x65:
          id v6 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
          break;
        case 0x66:
          id v6 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
          break;
        case 0x67:
          id v6 = @"COMPONENT_TYPE_FORWARD_INFO";
          break;
        case 0x68:
          id v6 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
          break;
        case 0x69:
          id v6 = @"COMPONENT_TYPE_HIKE_SUMMARY";
          break;
        case 0x6A:
          id v6 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 32));
          id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v6 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 44);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      if (a2) {
        objc_super v8 = @"startIndex";
      }
      else {
        objc_super v8 = @"start_index";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 44);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v9 forKey:@"count"];
    }
    id v10 = *(id *)(a1 + 16);
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"filter"];
    }
    char v13 = *(unsigned char *)(a1 + 44);
    if ((v13 & 0x10) != 0)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      if (a2) {
        v15 = @"includeSource";
      }
      else {
        v15 = @"include_source";
      }
      [v4 setObject:v14 forKey:v15];

      char v13 = *(unsigned char *)(a1 + 44);
    }
    if ((v13 & 8) != 0)
    {
      int v16 = *(_DWORD *)(a1 + 36);
      if (v16)
      {
        if (v16 == 1)
        {
          v17 = @"DYNAMIC";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 36));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v17 = @"CACHED";
      }
      [v4 setObject:v17 forKey:@"urgency"];
    }
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48__GEOPDComponentInfo__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDComponentInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDComponentInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        if ([v7 isEqualToString:@"COMPONENT_TYPE_UNKNOWN"])
        {
          int v8 = 0;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ENTITY"])
        {
          int v8 = 1;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACE_INFO"])
        {
          int v8 = 2;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ROAD_ACCESS_INFO"])
        {
          int v8 = 3;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_BOUNDS"])
        {
          int v8 = 4;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ADDRESS"])
        {
          int v8 = 5;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RATING"])
        {
          int v8 = 6;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_REVIEW"])
        {
          int v8 = 7;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PHOTO"])
        {
          int v8 = 8;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_HOURS"])
        {
          int v8 = 9;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO"])
        {
          int v8 = 10;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_SCHEDULE"])
        {
          int v8 = 11;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ETA"])
        {
          int v8 = 12;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_FLYOVER"])
        {
          int v8 = 13;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RAW_ATTRIBUTE"])
        {
          int v8 = 14;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_AMENITIES"])
        {
          int v8 = 15;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_STYLE_ATTRIBUTES"])
        {
          int v8 = 16;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INCIDENT"])
        {
          int v8 = 20;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO"])
        {
          int v8 = 21;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TEXT_BLOCK"])
        {
          int v8 = 22;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_FACTOID"])
        {
          int v8 = 23;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_ATTRIBUTION"])
        {
          int v8 = 24;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_BUSINESS_CLAIM"])
        {
          int v8 = 25;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_CAPTIONED_PHOTO"])
        {
          int v8 = 26;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET"])
        {
          int v8 = 27;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_EXTERNAL_ACTION"])
        {
          int v8 = 29;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RESULT_SNIPPET"])
        {
          int v8 = 30;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ADDRESS_OBJECT"])
        {
          int v8 = 31;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT"])
        {
          int v8 = 32;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK"])
        {
          int v8 = 33;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT"])
        {
          int v8 = 34;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TIP"])
        {
          int v8 = 36;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACECARD_URL"])
        {
          int v8 = 37;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ASSOCIATED_APP"])
        {
          int v8 = 38;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_MESSAGE_LINK"])
        {
          int v8 = 39;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_QUICK_LINK"])
        {
          int v8 = 40;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RAP"])
        {
          int v8 = 41;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_OFFLINE_AREA"])
        {
          int v8 = 42;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_LOCATION_EVENT"])
        {
          int v8 = 43;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS"])
        {
          int v8 = 44;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_OFFLINE_IDENTIFIER"])
        {
          int v8 = 45;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_OFFLINE_QUAD_NODES"])
        {
          int v8 = 46;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_OFFLINE_SIZE"])
        {
          int v8 = 47;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_VENUE_INFO"])
        {
          int v8 = 48;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST"])
        {
          int v8 = 49;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_CONTAINED_PLACE"])
        {
          int v8 = 50;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_WIFI_FINGERPRINT"])
        {
          int v8 = 51;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ICON"])
        {
          int v8 = 52;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PRICE_DESCRIPTION"])
        {
          int v8 = 53;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_BROWSE_CATEGORIES"])
        {
          int v8 = 54;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_STOREFRONT"])
        {
          int v8 = 55;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_GROUND_VIEW_LABEL"])
        {
          int v8 = 56;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ANNOTATED_ITEM_LIST"])
        {
          int v8 = 57;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_POI_EVENT"])
        {
          int v8 = 58;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_PRESENTATION"])
        {
          int v8 = 59;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACECARD_LAYOUT"])
        {
          int v8 = 60;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PROTOTYPE_CONTAINER"])
        {
          int v8 = 61;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION"])
        {
          int v8 = 62;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_LINKED_SERVICE"])
        {
          int v8 = 63;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_BUSINESS_HOURS"])
        {
          int v8 = 64;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_COLLECTION"])
        {
          int v8 = 65;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_RELATED_PLACE"])
        {
          int v8 = 66;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP"])
        {
          int v8 = 67;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME"])
        {
          int v8 = 68;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY"])
        {
          int v8 = 69;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES"])
        {
          int v8 = 70;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PUBLISHER"])
        {
          int v8 = 71;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES"])
        {
          int v8 = 72;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACE_QUESTIONNAIRE"])
        {
          int v8 = 73;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_PLACE_COLLECTION_ITEM"])
        {
          int v8 = 74;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_COLLECTION_IDS"])
        {
          int v8 = 76;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ISO_3166_CODE"])
        {
          int v8 = 77;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_VENDOR_AMENITIES"])
        {
          int v8 = 78;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE"])
        {
          int v8 = 79;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_STOREFRONT_FACES"])
        {
          int v8 = 81;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_GUIDE_GROUP"])
        {
          int v8 = 82;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_CONTAINMENT_PLACE"])
        {
          int v8 = 83;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_CATEGORIZED_PHOTOS"])
        {
          int v8 = 84;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_EXPLORE_GUIDES"])
        {
          int v8 = 85;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ABOUT"])
        {
          int v8 = 86;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_LABEL_GEOMETRY"])
        {
          int v8 = 87;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ENHANCED_PLACEMENT"])
        {
          int v8 = 88;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TEMPLATE_PLACE"])
        {
          int v8 = 89;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_SEARCH_ENRICHMENT"])
        {
          int v8 = 90;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO"])
        {
          int v8 = 91;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_BUSINESS_ASSETS"])
        {
          int v8 = 92;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_INFO"])
        {
          int v8 = 93;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ACTION_DATA"])
        {
          int v8 = 94;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ENRICHMENT_DATA"])
        {
          int v8 = 95;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_POI_CLAIM"])
        {
          int v8 = 96;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_EV_CHARGER"])
        {
          int v8 = 97;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TRAIL_HEAD"])
        {
          int v8 = 98;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_TOOL_TIP"])
        {
          int v8 = 99;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_REFRESH_ID"])
        {
          int v8 = 100;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_ADDRESS_COMPONENTS"])
        {
          int v8 = 101;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO"])
        {
          int v8 = 102;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_FORWARD_INFO"])
        {
          int v8 = 103;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO"])
        {
          int v8 = 104;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_HIKE_SUMMARY"])
        {
          int v8 = 105;
        }
        else if ([v7 isEqualToString:@"COMPONENT_TYPE_HIKE_GEOMETRY"])
        {
          int v8 = 106;
        }
        else
        {
          int v8 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_209;
        }
        int v8 = [v6 intValue];
      }
      *(unsigned char *)(a1 + 44) |= 4u;
      *(_DWORD *)(a1 + 32) = v8;
LABEL_209:

      if (a3) {
        v9 = @"startIndex";
      }
      else {
        v9 = @"start_index";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = [v10 unsignedIntValue];
        *(unsigned char *)(a1 + 44) |= 2u;
        *(_DWORD *)(a1 + 28) = v11;
      }

      v12 = [v5 objectForKeyedSubscript:@"count"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v13 = [v12 unsignedIntValue];
        *(unsigned char *)(a1 + 44) |= 1u;
        *(_DWORD *)(a1 + 24) = v13;
      }

      v14 = [v5 objectForKeyedSubscript:@"filter"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOPDComponentFilter alloc];
        if (v15) {
          int v16 = (void *)-[GEOPDComponentFilter _initWithDictionary:isJSON:](v15, v14, a3);
        }
        else {
          int v16 = 0;
        }
        -[GEOPDComponentInfo setFilter:](a1, v16);
      }
      if (a3) {
        v17 = @"includeSource";
      }
      else {
        v17 = @"include_source";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v19 = [v18 BOOLValue];
        *(unsigned char *)(a1 + 44) |= 0x10u;
        *(unsigned char *)(a1 + 40) = v19;
      }

      v20 = [v5 objectForKeyedSubscript:@"urgency"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        if ([v21 isEqualToString:@"CACHED"]) {
          int v22 = 0;
        }
        else {
          int v22 = [v21 isEqualToString:@"DYNAMIC"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_233:

          goto LABEL_234;
        }
        int v22 = [v20 intValue];
      }
      *(unsigned char *)(a1 + 44) |= 8u;
      *(_DWORD *)(a1 + 36) = v22;
      goto LABEL_233;
    }
  }
LABEL_234:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 44) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_startIndex;
  *(unsigned char *)(v5 + 44) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_count;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
LABEL_5:
  id v8 = [(GEOPDComponentFilter *)self->_filter copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  char v10 = (char)self->_flags;
  if ((v10 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_includeSource;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char v10 = (char)self->_flags;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_urgency;
    *(unsigned char *)(v6 + 44) |= 8u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      -[GEOPDComponentFilter clearUnknownFields:](v5, 1);
    }
  }
}

@end