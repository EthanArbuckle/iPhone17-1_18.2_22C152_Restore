@interface GEOPDVendorSpecificPlaceRefinementParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVendorSpecificPlaceRefinementParameters)init;
- (GEOPDVendorSpecificPlaceRefinementParameters)initWithData:(id)a3;
- (GEOPDVendorSpecificPlaceRefinementParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4;
- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 contentProvider:(id)a5;
- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMuid:(unint64_t)a3 locationHint:(id)a4 placeNameHint:(id)a5 resultProviderId:(int)a6 contentProvider:(id)a7;
- (GEOPDVendorSpecificPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeNameHint;
- (unint64_t)hash;
- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1;
- (void)_readFormattedAddressLineHints;
- (void)_readLocationHint;
- (void)_readPlaceNameHint;
- (void)addFormattedAddressLineHint:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAddressHint:(uint64_t)a1;
- (void)setAddressObjectHint:(uint64_t)a1;
- (void)setExternalItemId:(uint64_t)a1;
- (void)setFormattedAddressLineHints:(uint64_t)a1;
- (void)setLocationHint:(uint64_t)a1;
- (void)setPlaceNameHint:(uint64_t)a1;
- (void)setVendorId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVendorSpecificPlaceRefinementParameters

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
        v6 = (int *)&readAll__recursiveTag_7441;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_7442;
      }
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 27)) {
      goto LABEL_36;
    }
  }
  else if ((v6 & 8) != 0)
  {
LABEL_36:
    char v16 = 0;
    goto LABEL_37;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_muid != *((void *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if (v6)
  {
    goto LABEL_36;
  }
  vendorId = self->_vendorId;
  if ((unint64_t)vendorId | *((void *)v4 + 10) && !-[NSString isEqual:](vendorId, "isEqual:")) {
    goto LABEL_36;
  }
  externalItemId = self->_externalItemId;
  if ((unint64_t)externalItemId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](externalItemId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  locationHint = self->_locationHint;
  if ((unint64_t)locationHint | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](locationHint, "isEqual:")) {
      goto LABEL_36;
    }
  }
  addressHint = self->_addressHint;
  if ((unint64_t)addressHint | *((void *)v4 + 3))
  {
    if (!-[GEOStructuredAddress isEqual:](addressHint, "isEqual:")) {
      goto LABEL_36;
    }
  }
  placeNameHint = self->_placeNameHint;
  if ((unint64_t)placeNameHint | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](placeNameHint, "isEqual:")) {
      goto LABEL_36;
    }
  }
  formattedAddressLineHints = self->_formattedAddressLineHints;
  if ((unint64_t)formattedAddressLineHints | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLineHints, "isEqual:")) {
      goto LABEL_36;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 56);
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_placeTypeHint != *((_DWORD *)v4 + 26)) {
      goto LABEL_36;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_addressGeocodeAccuracyHint != *((_DWORD *)v4 + 25)) {
      goto LABEL_36;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_36;
  }
  addressObjectHint = self->_addressObjectHint;
  if ((unint64_t)addressObjectHint | *((void *)v4 + 4)) {
    char v16 = -[NSData isEqual:](addressObjectHint, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_37:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_resultProviderId;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_muid;
      goto LABEL_6;
    }
  }
  unint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_vendorId hash];
  NSUInteger v7 = [(NSString *)self->_externalItemId hash];
  unint64_t v8 = [(GEOLatLng *)self->_locationHint hash];
  unint64_t v9 = [(GEOStructuredAddress *)self->_addressHint hash];
  NSUInteger v10 = [(NSString *)self->_placeNameHint hash];
  uint64_t v11 = [(NSMutableArray *)self->_formattedAddressLineHints hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    uint64_t v13 = 2654435761 * self->_placeTypeHint;
    if ((v12 & 2) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ [(NSData *)self->_addressObjectHint hash];
  }
  uint64_t v13 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = 2654435761 * self->_addressGeocodeAccuracyHint;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ [(NSData *)self->_addressObjectHint hash];
}

- (void)setVendorId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x800u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVendorSpecificPlaceRefinementParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 112);
    if ((v5 & 8) != 0)
    {
      NSUInteger v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
      if (a2) {
        NSUInteger v7 = @"resultProviderId";
      }
      else {
        NSUInteger v7 = @"result_provider_id";
      }
      [v4 setObject:v6 forKey:v7];

      __int16 v5 = *(_WORD *)(a1 + 112);
    }
    if (v5)
    {
      unint64_t v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      [v4 setObject:v8 forKey:@"muid"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      unint64_t v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorId_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v11 = *(id *)(a1 + 80);
    if (v11)
    {
      if (a2) {
        __int16 v12 = @"vendorId";
      }
      else {
        __int16 v12 = @"vendor_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      uint64_t v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExternalItemId_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v15 = *(id *)(a1 + 40);
    if (v15)
    {
      if (a2) {
        char v16 = @"externalItemId";
      }
      else {
        char v16 = @"external_item_id";
      }
      [v4 setObject:v15 forKey:v16];
    }

    -[GEOPDVendorSpecificPlaceRefinementParameters _readLocationHint](a1);
    id v17 = *(id *)(a1 + 56);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"locationHint";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"location_hint";
      }
      [v4 setObject:v19 forKey:v20];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v21 = *(void **)(a1 + 8);
      if (v21)
      {
        id v22 = v21;
        objc_sync_enter(v22);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressHint_tags_7425);
        objc_sync_exit(v22);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v23 = *(id *)(a1 + 24);
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"addressHint";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"address_hint";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDVendorSpecificPlaceRefinementParameters placeNameHint]((id *)a1);
    if (v27)
    {
      if (a2) {
        v28 = @"placeNameHint";
      }
      else {
        v28 = @"place_name_hint";
      }
      [v4 setObject:v27 forKey:v28];
    }

    if (*(void *)(a1 + 48))
    {
      -[GEOPDVendorSpecificPlaceRefinementParameters _readFormattedAddressLineHints](a1);
      id v29 = *(id *)(a1 + 48);
      if (a2) {
        v30 = @"formattedAddressLineHint";
      }
      else {
        v30 = @"formatted_address_line_hint";
      }
      [v4 setObject:v29 forKey:v30];
    }
    __int16 v31 = *(_WORD *)(a1 + 112);
    if ((v31 & 4) != 0)
    {
      int v32 = *(_DWORD *)(a1 + 104);
      switch(v32)
      {
        case '#':
          v33 = @"TIME_ZONE";
          break;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '4':
        case '5':
        case '8':
        case ':':
        case ';':
        case '<':
        case '>':
LABEL_55:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case '+':
          v33 = @"SUB_LOCALITY";
          break;
        case ',':
          v33 = @"OCEAN";
          break;
        case '-':
          v33 = @"AOI";
          break;
        case '.':
          v33 = @"INLAND_WATER";
          break;
        case '/':
          v33 = @"BUSINESS";
          break;
        case '0':
          v33 = @"ISLAND";
          break;
        case '1':
          v33 = @"STREET";
          break;
        case '2':
          v33 = @"ADMIN";
          break;
        case '3':
          v33 = @"POSTAL";
          break;
        case '6':
          v33 = @"INTERSECTION";
          break;
        case '7':
          v33 = @"BUILDING";
          break;
        case '9':
          v33 = @"ADDRESS";
          break;
        case '=':
          v33 = @"CONTINENT";
          break;
        case '?':
          v33 = @"REGION";
          break;
        case '@':
          v33 = @"DIVISION";
          break;
        case 'A':
          v33 = @"PHYSICAL_FEATURE";
          break;
        default:
          v33 = @"UNKNOWN_PLACE_TYPE";
          switch(v32)
          {
            case 0:
              goto LABEL_74;
            case 1:
              v33 = @"COUNTRY";
              break;
            case 2:
              v33 = @"ADMINISTRATIVE_AREA";
              break;
            case 3:
              goto LABEL_55;
            case 4:
              v33 = @"SUB_ADMINISTRATIVE_AREA";
              break;
            default:
              if (v32 != 16) {
                goto LABEL_55;
              }
              v33 = @"LOCALITY";
              break;
          }
          break;
      }
LABEL_74:
      if (a2) {
        v34 = @"placeTypeHint";
      }
      else {
        v34 = @"place_type_hint";
      }
      [v4 setObject:v33 forKey:v34];

      __int16 v31 = *(_WORD *)(a1 + 112);
    }
    if ((v31 & 2) != 0)
    {
      uint64_t v35 = *(int *)(a1 + 100);
      if (v35 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = off_1E53DD210[v35];
      }
      if (a2) {
        v37 = @"addressGeocodeAccuracyHint";
      }
      else {
        v37 = @"address_geocode_accuracy_hint";
      }
      [v4 setObject:v36 forKey:v37];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v38 = *(void **)(a1 + 8);
      if (v38)
      {
        id v39 = v38;
        objc_sync_enter(v39);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressObjectHint_tags_7428);
        objc_sync_exit(v39);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    id v40 = *(id *)(a1 + 32);
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 base64EncodedStringWithOptions:0];
        [v4 setObject:v42 forKey:@"addressObjectHint"];
      }
      else
      {
        [v4 setObject:v40 forKey:@"address_object_hint"];
      }
    }

    v43 = *(void **)(a1 + 16);
    if (v43)
    {
      v44 = [v43 dictionaryRepresentation];
      v45 = v44;
      if (a2)
      {
        v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __74__GEOPDVendorSpecificPlaceRefinementParameters__dictionaryRepresentation___block_invoke;
        v50[3] = &unk_1E53D8860;
        id v47 = v46;
        id v51 = v47;
        [v45 enumerateKeysAndObjectsUsingBlock:v50];
        id v48 = v47;

        v45 = v48;
      }
      [v4 setObject:v45 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v2 = [(GEOPDVendorSpecificPlaceRefinementParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  v3 = [(GEOPDVendorSpecificPlaceRefinementParameters *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    __int16 v5 = v3;
  }

  return v4;
}

- (void)setExternalItemId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x80u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readLocationHint
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationHint_tags_7424);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)setLocationHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x200u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setAddressHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x20u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readPlaceNameHint
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceNameHint_tags_7426);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeNameHint
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDVendorSpecificPlaceRefinementParameters _readPlaceNameHint]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceNameHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x400u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)_readFormattedAddressLineHints
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDVendorSpecificPlaceRefinementParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressLineHints_tags_7427);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)setFormattedAddressLineHints:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)addFormattedAddressLineHint:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDVendorSpecificPlaceRefinementParameters _readFormattedAddressLineHints](a1);
    -[GEOPDVendorSpecificPlaceRefinementParameters _addNoFlagsFormattedAddressLineHint:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
  }
}

- (void)_addNoFlagsFormattedAddressLineHint:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setAddressObjectHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 112) |= 0x40u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  id v4 = [(GEOPDVendorSpecificPlaceRefinementParameters *)&v8 description];
  id v5 = [(GEOPDVendorSpecificPlaceRefinementParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __74__GEOPDVendorSpecificPlaceRefinementParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVendorSpecificPlaceRefinementParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FE0) == 0))
  {
    __int16 v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 0);
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_vendorId) {
      PBDataWriterWriteStringField();
    }
    if (self->_externalItemId) {
      PBDataWriterWriteStringField();
    }
    if (self->_locationHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressHint) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_placeNameHint) {
      PBDataWriterWriteStringField();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = self->_formattedAddressLineHints;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_addressObjectHint) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVendorSpecificPlaceRefinementParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVendorSpecificPlaceRefinementParameters readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_resultProviderId;
    *(_WORD *)(v5 + 112) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 64) = self->_muid;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_vendorId copyWithZone:a3];
  __int16 v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_externalItemId copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(GEOLatLng *)self->_locationHint copyWithZone:a3];
  long long v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(GEOStructuredAddress *)self->_addressHint copyWithZone:a3];
  long long v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_placeNameHint copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v20 = self->_formattedAddressLineHints;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        -[GEOPDVendorSpecificPlaceRefinementParameters addFormattedAddressLineHint:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v21);
  }

  __int16 v25 = (__int16)self->_flags;
  if ((v25 & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_placeTypeHint;
    *(_WORD *)(v5 + 112) |= 4u;
    __int16 v25 = (__int16)self->_flags;
  }
  if ((v25 & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_addressGeocodeAccuracyHint;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  uint64_t v26 = -[NSData copyWithZone:](self->_addressObjectHint, "copyWithZone:", a3, (void)v30);
  v27 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v26;

  v28 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v28;
LABEL_21:

  return (id)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_placeNameHint, 0);
  objc_storeStrong((id *)&self->_locationHint, 0);
  objc_storeStrong((id *)&self->_formattedAddressLineHints, 0);
  objc_storeStrong((id *)&self->_externalItemId, 0);
  objc_storeStrong((id *)&self->_addressObjectHint, 0);
  objc_storeStrong((id *)&self->_addressHint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMuid:(unint64_t)a3 locationHint:(id)a4 placeNameHint:(id)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  id v16 = [(GEOPDVendorSpecificPlaceRefinementParameters *)&v23 init];
  if (!v16)
  {
LABEL_19:
    uint64_t v19 = 0;
    goto LABEL_20;
  }
  if (!v15 || ![v15 length])
  {
    v20 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v21;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "%{public}@ requires a contentProvider", buf, 0xCu);
    }
    goto LABEL_19;
  }
  -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:]((uint64_t)v16, v15);
  if (a3)
  {
    *(_WORD *)&v16->_flags |= 0x1000u;
    *(_WORD *)&v16->_flags |= 1u;
    v16->_muid = a3;
    if (!a6)
    {
      long long v17 = +[GEOMapService sharedService];
      a6 = [v17 localSearchProviderID];
    }
    *(_WORD *)&v16->_flags |= 0x1000u;
    *(_WORD *)&v16->_flags |= 8u;
    v16->_resultProviderId = a6;
  }
  if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
  {
    uint64_t v18 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
    -[GEOPDVendorSpecificPlaceRefinementParameters setLocationHint:]((uint64_t)v16, v18);
  }
  if ([v14 length]) {
    -[GEOPDVendorSpecificPlaceRefinementParameters setPlaceNameHint:]((uint64_t)v16, v14);
  }
  uint64_t v19 = v16;
LABEL_20:

  return v19;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithExternalBusinessID:(id)a3 contentProvider:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPDVendorSpecificPlaceRefinementParameters;
  uint64_t v9 = [(GEOPDVendorSpecificPlaceRefinementParameters *)&v15 init];
  if (!v9) {
    goto LABEL_10;
  }
  if (!v8 || ![v8 length])
  {
    __int16 v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_10:
      uint64_t v10 = 0;
      goto LABEL_11;
    }
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    long long v17 = v12;
    uint64_t v13 = "%{public}@ requires business IDs";
LABEL_8:
    _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);

    goto LABEL_9;
  }
  if (![v8 length])
  {
    __int16 v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPDVendorSpecificPlaceRefinementParameters");
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    long long v17 = v12;
    uint64_t v13 = "%{public}@ requires a contentProvider";
    goto LABEL_8;
  }
  -[GEOPDVendorSpecificPlaceRefinementParameters setExternalItemId:]((uint64_t)v9, v7);
  -[GEOPDVendorSpecificPlaceRefinementParameters setVendorId:]((uint64_t)v9, v8);
  uint64_t v10 = v9;
LABEL_11:

  return v10;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithMapItemToRefine:(id)a3 coordinate:(id)a4 contentProvider:(id)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  id v10 = a5;
  if ([v9 _hasMUID]) {
    uint64_t v11 = [v9 _muid];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [v9 name];
  uint64_t v13 = -[GEOPDVendorSpecificPlaceRefinementParameters initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:](self, "initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:", v11, v12, [v9 _resultProviderID], v10, var0, var1);

  if (!v13) {
    goto LABEL_18;
  }
  id v14 = [v9 geoAddress];
  if ([v14 hasStructuredAddress])
  {
    objc_super v15 = [v14 structuredAddress];
    -[GEOPDVendorSpecificPlaceRefinementParameters setAddressHint:]((uint64_t)v13, v15);
  }
  if ([v14 formattedAddressLinesCount])
  {
    id v16 = [v14 formattedAddressLines];
    -[GEOPDVendorSpecificPlaceRefinementParameters setFormattedAddressLineHints:]((uint64_t)v13, v16);
  }
  long long v17 = [v9 addressObject];
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 rawBytes];
    if ([v19 length]) {
      -[GEOPDVendorSpecificPlaceRefinementParameters setAddressObjectHint:]((uint64_t)v13, v19);
    }
  }
  unsigned int v20 = [v9 _addressGeocodeAccuracy];
  if (v20 >= 6)
  {
    if (v20 == -1) {
      goto LABEL_15;
    }
    unsigned int v20 = -1;
  }
  *(_WORD *)&v13->_flags |= 0x1000u;
  *(_WORD *)&v13->_flags |= 2u;
  v13->_addressGeocodeAccuracyHint = v20;
LABEL_15:
  int v21 = [v9 _placeType];
  if (v21)
  {
    int v22 = _PDPlaceTypeForMapItemPlaceType(v21);
    *(_WORD *)&v13->_flags |= 0x1000u;
    *(_WORD *)&v13->_flags |= 4u;
    v13->_placeTypeHint = v22;
  }
  objc_super v23 = v13;

LABEL_18:
  return v13;
}

- (GEOPDVendorSpecificPlaceRefinementParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  return -[GEOPDVendorSpecificPlaceRefinementParameters initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:](self, "initWithMuid:locationHint:placeNameHint:resultProviderId:contentProvider:", a5, a3, *(void *)&a6, a7, a4.var0, a4.var1);
}

@end