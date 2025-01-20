@interface GEOPDExternalAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addExternalActionDetail:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExternalAction

- (void)addExternalActionDetail:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExternalAction;
  v4 = [(GEOPDExternalAction *)&v8 description];
  id v5 = [(GEOPDExternalAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      id v5 = @"COMPONENT_TYPE_UNKNOWN";
      switch(*(_DWORD *)(a1 + 24))
      {
        case 0:
          break;
        case 1:
          id v5 = @"COMPONENT_TYPE_ENTITY";
          break;
        case 2:
          id v5 = @"COMPONENT_TYPE_PLACE_INFO";
          break;
        case 3:
          id v5 = @"COMPONENT_TYPE_ROAD_ACCESS_INFO";
          break;
        case 4:
          id v5 = @"COMPONENT_TYPE_BOUNDS";
          break;
        case 5:
          id v5 = @"COMPONENT_TYPE_ADDRESS";
          break;
        case 6:
          id v5 = @"COMPONENT_TYPE_RATING";
          break;
        case 7:
          id v5 = @"COMPONENT_TYPE_REVIEW";
          break;
        case 8:
          id v5 = @"COMPONENT_TYPE_PHOTO";
          break;
        case 9:
          id v5 = @"COMPONENT_TYPE_HOURS";
          break;
        case 0xA:
          id v5 = @"COMPONENT_TYPE_TRANSIT_INFO";
          break;
        case 0xB:
          id v5 = @"COMPONENT_TYPE_TRANSIT_SCHEDULE";
          break;
        case 0xC:
          id v5 = @"COMPONENT_TYPE_ETA";
          break;
        case 0xD:
          id v5 = @"COMPONENT_TYPE_FLYOVER";
          break;
        case 0xE:
          id v5 = @"COMPONENT_TYPE_RAW_ATTRIBUTE";
          break;
        case 0xF:
          id v5 = @"COMPONENT_TYPE_AMENITIES";
          break;
        case 0x10:
          id v5 = @"COMPONENT_TYPE_STYLE_ATTRIBUTES";
          break;
        case 0x14:
          id v5 = @"COMPONENT_TYPE_TRANSIT_INCIDENT";
          break;
        case 0x15:
          id v5 = @"COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO";
          break;
        case 0x16:
          id v5 = @"COMPONENT_TYPE_TEXT_BLOCK";
          break;
        case 0x17:
          id v5 = @"COMPONENT_TYPE_FACTOID";
          break;
        case 0x18:
          id v5 = @"COMPONENT_TYPE_TRANSIT_ATTRIBUTION";
          break;
        case 0x19:
          id v5 = @"COMPONENT_TYPE_BUSINESS_CLAIM";
          break;
        case 0x1A:
          id v5 = @"COMPONENT_TYPE_CAPTIONED_PHOTO";
          break;
        case 0x1B:
          id v5 = @"COMPONENT_TYPE_TRANSIT_INFO_SNIPPET";
          break;
        case 0x1D:
          id v5 = @"COMPONENT_TYPE_EXTERNAL_ACTION";
          break;
        case 0x1E:
          id v5 = @"COMPONENT_TYPE_RESULT_SNIPPET";
          break;
        case 0x1F:
          id v5 = @"COMPONENT_TYPE_ADDRESS_OBJECT";
          break;
        case 0x20:
          id v5 = @"COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT";
          break;
        case 0x21:
          id v5 = @"COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK";
          break;
        case 0x22:
          id v5 = @"COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT";
          break;
        case 0x24:
          id v5 = @"COMPONENT_TYPE_TIP";
          break;
        case 0x25:
          id v5 = @"COMPONENT_TYPE_PLACECARD_URL";
          break;
        case 0x26:
          id v5 = @"COMPONENT_TYPE_ASSOCIATED_APP";
          break;
        case 0x27:
          id v5 = @"COMPONENT_TYPE_MESSAGE_LINK";
          break;
        case 0x28:
          id v5 = @"COMPONENT_TYPE_QUICK_LINK";
          break;
        case 0x29:
          id v5 = @"COMPONENT_TYPE_RAP";
          break;
        case 0x2A:
          id v5 = @"COMPONENT_TYPE_OFFLINE_AREA";
          break;
        case 0x2B:
          id v5 = @"COMPONENT_TYPE_LOCATION_EVENT";
          break;
        case 0x2C:
          id v5 = @"COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS";
          break;
        case 0x2D:
          id v5 = @"COMPONENT_TYPE_OFFLINE_IDENTIFIER";
          break;
        case 0x2E:
          id v5 = @"COMPONENT_TYPE_OFFLINE_QUAD_NODES";
          break;
        case 0x2F:
          id v5 = @"COMPONENT_TYPE_OFFLINE_SIZE";
          break;
        case 0x30:
          id v5 = @"COMPONENT_TYPE_VENUE_INFO";
          break;
        case 0x31:
          id v5 = @"COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST";
          break;
        case 0x32:
          id v5 = @"COMPONENT_TYPE_CONTAINED_PLACE";
          break;
        case 0x33:
          id v5 = @"COMPONENT_TYPE_WIFI_FINGERPRINT";
          break;
        case 0x34:
          id v5 = @"COMPONENT_TYPE_ICON";
          break;
        case 0x35:
          id v5 = @"COMPONENT_TYPE_PRICE_DESCRIPTION";
          break;
        case 0x36:
          id v5 = @"COMPONENT_TYPE_BROWSE_CATEGORIES";
          break;
        case 0x37:
          id v5 = @"COMPONENT_TYPE_STOREFRONT";
          break;
        case 0x38:
          id v5 = @"COMPONENT_TYPE_GROUND_VIEW_LABEL";
          break;
        case 0x39:
          id v5 = @"COMPONENT_TYPE_ANNOTATED_ITEM_LIST";
          break;
        case 0x3A:
          id v5 = @"COMPONENT_TYPE_POI_EVENT";
          break;
        case 0x3B:
          id v5 = @"COMPONENT_TYPE_STOREFRONT_PRESENTATION";
          break;
        case 0x3C:
          id v5 = @"COMPONENT_TYPE_PLACECARD_LAYOUT";
          break;
        case 0x3D:
          id v5 = @"COMPONENT_TYPE_PROTOTYPE_CONTAINER";
          break;
        case 0x3E:
          id v5 = @"COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION";
          break;
        case 0x3F:
          id v5 = @"COMPONENT_TYPE_LINKED_SERVICE";
          break;
        case 0x40:
          id v5 = @"COMPONENT_TYPE_BUSINESS_HOURS";
          break;
        case 0x41:
          id v5 = @"COMPONENT_TYPE_COLLECTION";
          break;
        case 0x42:
          id v5 = @"COMPONENT_TYPE_RELATED_PLACE";
          break;
        case 0x43:
          id v5 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP";
          break;
        case 0x44:
          id v5 = @"COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME";
          break;
        case 0x45:
          id v5 = @"COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY";
          break;
        case 0x46:
          id v5 = @"COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES";
          break;
        case 0x47:
          id v5 = @"COMPONENT_TYPE_PUBLISHER";
          break;
        case 0x48:
          id v5 = @"COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES";
          break;
        case 0x49:
          id v5 = @"COMPONENT_TYPE_PLACE_QUESTIONNAIRE";
          break;
        case 0x4A:
          id v5 = @"COMPONENT_TYPE_PLACE_COLLECTION_ITEM";
          break;
        case 0x4C:
          id v5 = @"COMPONENT_TYPE_COLLECTION_IDS";
          break;
        case 0x4D:
          id v5 = @"COMPONENT_TYPE_ISO_3166_CODE";
          break;
        case 0x4E:
          id v5 = @"COMPONENT_TYPE_VENDOR_AMENITIES";
          break;
        case 0x4F:
          id v5 = @"COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE";
          break;
        case 0x51:
          id v5 = @"COMPONENT_TYPE_STOREFRONT_FACES";
          break;
        case 0x52:
          id v5 = @"COMPONENT_TYPE_GUIDE_GROUP";
          break;
        case 0x53:
          id v5 = @"COMPONENT_TYPE_CONTAINMENT_PLACE";
          break;
        case 0x54:
          id v5 = @"COMPONENT_TYPE_CATEGORIZED_PHOTOS";
          break;
        case 0x55:
          id v5 = @"COMPONENT_TYPE_EXPLORE_GUIDES";
          break;
        case 0x56:
          id v5 = @"COMPONENT_TYPE_ABOUT";
          break;
        case 0x57:
          id v5 = @"COMPONENT_TYPE_LABEL_GEOMETRY";
          break;
        case 0x58:
          id v5 = @"COMPONENT_TYPE_ENHANCED_PLACEMENT";
          break;
        case 0x59:
          id v5 = @"COMPONENT_TYPE_TEMPLATE_PLACE";
          break;
        case 0x5A:
          id v5 = @"COMPONENT_TYPE_SEARCH_ENRICHMENT";
          break;
        case 0x5B:
          id v5 = @"COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO";
          break;
        case 0x5C:
          id v5 = @"COMPONENT_TYPE_BUSINESS_ASSETS";
          break;
        case 0x5D:
          id v5 = @"COMPONENT_TYPE_ENRICHMENT_INFO";
          break;
        case 0x5E:
          id v5 = @"COMPONENT_TYPE_ACTION_DATA";
          break;
        case 0x5F:
          id v5 = @"COMPONENT_TYPE_ENRICHMENT_DATA";
          break;
        case 0x60:
          id v5 = @"COMPONENT_TYPE_POI_CLAIM";
          break;
        case 0x61:
          id v5 = @"COMPONENT_TYPE_EV_CHARGER";
          break;
        case 0x62:
          id v5 = @"COMPONENT_TYPE_TRAIL_HEAD";
          break;
        case 0x63:
          id v5 = @"COMPONENT_TYPE_TOOL_TIP";
          break;
        case 0x64:
          id v5 = @"COMPONENT_TYPE_REFRESH_ID";
          break;
        case 0x65:
          id v5 = @"COMPONENT_TYPE_ADDRESS_COMPONENTS";
          break;
        case 0x66:
          id v5 = @"COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO";
          break;
        case 0x67:
          id v5 = @"COMPONENT_TYPE_FORWARD_INFO";
          break;
        case 0x68:
          id v5 = @"COMPONENT_TYPE_HIKE_ASSOCIATED_INFO";
          break;
        case 0x69:
          id v5 = @"COMPONENT_TYPE_HIKE_SUMMARY";
          break;
        case 0x6A:
          id v5 = @"COMPONENT_TYPE_HIKE_GEOMETRY";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
          id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2) {
        v6 = @"componentType";
      }
      else {
        v6 = @"component_type";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 16) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v8 = *(id *)(a1 + 16);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"externalActionDetail";
      }
      else {
        v15 = @"external_action_detail";
      }
      [v4 setObject:v7 forKey:v15];
    }
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __49__GEOPDExternalAction__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPDExternalAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDExternalAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDExternalActionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_externalActionDetails;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (id *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_componentType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_externalActionDetails;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        -[GEOPDExternalAction addExternalActionDetail:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_componentType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  externalActionDetails = self->_externalActionDetails;
  if ((unint64_t)externalActionDetails | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](externalActionDetails, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v2 = 2654435761 * self->_componentType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_externalActionDetails hash] ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalActionDetails, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end