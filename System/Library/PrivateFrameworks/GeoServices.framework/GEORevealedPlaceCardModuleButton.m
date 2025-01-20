@interface GEORevealedPlaceCardModuleButton
+ (BOOL)isValid:(id)a3;
+ (id)moduleButtonForType:(int)a3;
- (BOOL)hasIsGroup;
- (BOOL)hasLinkType;
- (BOOL)hasMetadata;
- (BOOL)hasType;
- (BOOL)hasVendor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)readFrom:(id)a3;
- (GEORevealedPlaceCardModuleButton)init;
- (GEORevealedPlaceCardModuleButton)initWithData:(id)a3;
- (GEORevealedPlaceCardModuleButton)initWithDictionary:(id)a3;
- (GEORevealedPlaceCardModuleButton)initWithJSON:(id)a3;
- (NSString)metadata;
- (NSString)vendor;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)linkTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsLinkType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)linkType;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMetadata;
- (void)_readVendor;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsGroup:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setLinkType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setType:(int)a3;
- (void)setVendor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORevealedPlaceCardModuleButton

+ (id)moduleButtonForType:(int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    v4 = objc_alloc_init(GEORevealedPlaceCardModuleButton);
    [(GEORevealedPlaceCardModuleButton *)v4 setType:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEORevealedPlaceCardModuleButton)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORevealedPlaceCardModuleButton;
  v2 = [(GEORevealedPlaceCardModuleButton *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORevealedPlaceCardModuleButton)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORevealedPlaceCardModuleButton;
  uint64_t v3 = [(GEORevealedPlaceCardModuleButton *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  v4 = @"MODULE_BUTTON_TYPE_UNKNOWN";
  switch(a3)
  {
    case 0:
LABEL_37:
      break;
    case 1:
      v4 = @"MODULE_BUTTON_TYPE_ADD_TO_GUIDES";
      break;
    case 2:
      v4 = @"MODULE_BUTTON_TYPE_REPORT_AN_ISSUE";
      break;
    case 3:
      v4 = @"MODULE_BUTTON_TYPE_SHARE";
      break;
    case 4:
      v4 = @"MODULE_BUTTON_TYPE_CALL";
      break;
    case 5:
      v4 = @"MODULE_BUTTON_TYPE_MESSAGE";
      break;
    case 6:
      v4 = @"MODULE_BUTTON_TYPE_WEBSITE";
      break;
    case 7:
      v4 = @"MODULE_BUTTON_TYPE_QUICK_LINK";
      break;
    case 8:
      v4 = @"MODULE_BUTTON_TYPE_GROUP";
      break;
    case 9:
      v4 = @"MODULE_BUTTON_TYPE_DIRECTIONS";
      break;
    case 10:
      v4 = @"MODULE_BUTTON_TYPE_FLYOVER";
      break;
    default:
      switch(a3)
      {
        case '2':
          v4 = @"MODULE_BUTTON_TYPE_CLAIM_PLACE";
          break;
        case '3':
          v4 = @"MODULE_BUTTON_TYPE_ADD_PHOTOS";
          break;
        case '4':
          v4 = @"MODULE_BUTTON_TYPE_ADD_FAVORITES";
          break;
        case '5':
          v4 = @"MODULE_BUTTON_TYPE_ADD_HOURS";
          break;
        case '6':
          v4 = @"MODULE_BUTTON_TYPE_ADD_DETAILS";
          break;
        case '7':
          v4 = @"MODULE_BUTTON_TYPE_ADD_PHONE";
          break;
        case '8':
          v4 = @"MODULE_BUTTON_TYPE_ADD_WEBSITE";
          break;
        case '9':
          v4 = @"MODULE_BUTTON_TYPE_FINDMY";
          break;
        case ':':
          v4 = @"MODULE_BUTTON_TYPE_LOCATION";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
      }
      break;
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_TO_GUIDES"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_REPORT_AN_ISSUE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_SHARE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_WEBSITE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_QUICK_LINK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_GROUP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_DIRECTIONS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_FLYOVER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_CLAIM_PLACE"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_PHOTOS"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_FAVORITES"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_HOURS"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_DETAILS"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_PHONE"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_WEBSITE"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_FINDMY"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"MODULE_BUTTON_TYPE_LOCATION"])
  {
    int v4 = 58;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_isGroup = a3;
}

- (void)setHasIsGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsGroup
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleButtonReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_10837);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (NSString)metadata
{
  -[GEORevealedPlaceCardModuleButton _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)_readVendor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 56) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORevealedPlaceCardModuleButtonReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (NSString)vendor
{
  -[GEORevealedPlaceCardModuleButton _readVendor]((uint64_t)self);
  vendor = self->_vendor;

  return vendor;
}

- (void)setVendor:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (int)linkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_linkType;
  }
  else {
    return 0;
  }
}

- (void)setLinkType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLinkType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)linkTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F8B80[a3];
  }

  return v3;
}

- (int)StringAsLinkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LINK_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_APP_CLIP_LINK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LINK_TYPE_APP_EXTENSION"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEORevealedPlaceCardModuleButton;
  int v4 = [(GEORevealedPlaceCardModuleButton *)&v8 description];
  v5 = [(GEORevealedPlaceCardModuleButton *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModuleButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 56);
    if ((v5 & 2) != 0)
    {
      int v6 = *(_DWORD *)(a1 + 48);
      objc_super v7 = @"MODULE_BUTTON_TYPE_UNKNOWN";
      switch(v6)
      {
        case 0:
          break;
        case 1:
          objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_TO_GUIDES";
          break;
        case 2:
          objc_super v7 = @"MODULE_BUTTON_TYPE_REPORT_AN_ISSUE";
          break;
        case 3:
          objc_super v7 = @"MODULE_BUTTON_TYPE_SHARE";
          break;
        case 4:
          objc_super v7 = @"MODULE_BUTTON_TYPE_CALL";
          break;
        case 5:
          objc_super v7 = @"MODULE_BUTTON_TYPE_MESSAGE";
          break;
        case 6:
          objc_super v7 = @"MODULE_BUTTON_TYPE_WEBSITE";
          break;
        case 7:
          objc_super v7 = @"MODULE_BUTTON_TYPE_QUICK_LINK";
          break;
        case 8:
          objc_super v7 = @"MODULE_BUTTON_TYPE_GROUP";
          break;
        case 9:
          objc_super v7 = @"MODULE_BUTTON_TYPE_DIRECTIONS";
          break;
        case 10:
          objc_super v7 = @"MODULE_BUTTON_TYPE_FLYOVER";
          break;
        default:
          int v8 = v6 - 50;
          uint64_t v9 = (v6 - 50);
          switch(v8)
          {
            case 0:
              objc_super v7 = @"MODULE_BUTTON_TYPE_CLAIM_PLACE";
              break;
            case 1:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_PHOTOS";
              break;
            case 2:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_FAVORITES";
              break;
            case 3:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_HOURS";
              break;
            case 4:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_DETAILS";
              break;
            case 5:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_PHONE";
              break;
            case 6:
              objc_super v7 = @"MODULE_BUTTON_TYPE_ADD_WEBSITE";
              break;
            case 7:
              objc_super v7 = @"MODULE_BUTTON_TYPE_FINDMY";
              break;
            case 8:
              objc_super v7 = @"MODULE_BUTTON_TYPE_LOCATION";
              break;
            default:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
              objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
          break;
      }
      [v4 setObject:v7 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 56);
    }
    if ((v5 & 4) != 0)
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
      if (a2) {
        v11 = @"isGroup";
      }
      else {
        v11 = @"is_group";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 metadata];
    if (v12) {
      [v4 setObject:v12 forKey:@"metadata"];
    }

    v13 = [(id)a1 vendor];
    if (v13) {
      [v4 setObject:v13 forKey:@"vendor"];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v14 = *(int *)(a1 + 44);
      if (v14 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E53F8B80[v14];
      }
      if (a2) {
        v16 = @"linkType";
      }
      else {
        v16 = @"link_type";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEORevealedPlaceCardModuleButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORevealedPlaceCardModuleButton)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModuleButton *)-[GEORevealedPlaceCardModuleButton _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v6 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_UNKNOWN"])
        {
          uint64_t v8 = 0;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_TO_GUIDES"])
        {
          uint64_t v8 = 1;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_REPORT_AN_ISSUE"])
        {
          uint64_t v8 = 2;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_SHARE"])
        {
          uint64_t v8 = 3;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_CALL"])
        {
          uint64_t v8 = 4;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_MESSAGE"])
        {
          uint64_t v8 = 5;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_WEBSITE"])
        {
          uint64_t v8 = 6;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_QUICK_LINK"])
        {
          uint64_t v8 = 7;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_GROUP"])
        {
          uint64_t v8 = 8;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_DIRECTIONS"])
        {
          uint64_t v8 = 9;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_FLYOVER"])
        {
          uint64_t v8 = 10;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_CLAIM_PLACE"])
        {
          uint64_t v8 = 50;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_PHOTOS"])
        {
          uint64_t v8 = 51;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_FAVORITES"])
        {
          uint64_t v8 = 52;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_HOURS"])
        {
          uint64_t v8 = 53;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_DETAILS"])
        {
          uint64_t v8 = 54;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_PHONE"])
        {
          uint64_t v8 = 55;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_ADD_WEBSITE"])
        {
          uint64_t v8 = 56;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_FINDMY"])
        {
          uint64_t v8 = 57;
        }
        else if ([v7 isEqualToString:@"MODULE_BUTTON_TYPE_LOCATION"])
        {
          uint64_t v8 = 58;
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_49;
        }
        uint64_t v8 = [v6 intValue];
      }
      [a1 setType:v8];
LABEL_49:

      if (a3) {
        uint64_t v9 = @"isGroup";
      }
      else {
        uint64_t v9 = @"is_group";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsGroup:", objc_msgSend(v10, "BOOLValue"));
      }

      v11 = [v5 objectForKeyedSubscript:@"metadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setMetadata:v12];
      }
      v13 = [v5 objectForKeyedSubscript:@"vendor"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (void *)[v13 copy];
        [a1 setVendor:v14];
      }
      if (a3) {
        v15 = @"linkType";
      }
      else {
        v15 = @"link_type";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if ([v17 isEqualToString:@"LINK_TYPE_UNKNOWN"])
        {
          uint64_t v18 = 0;
        }
        else if ([v17 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:@"LINK_TYPE_APP_CLIP_LINK"])
        {
          uint64_t v18 = 2;
        }
        else if ([v17 isEqualToString:@"LINK_TYPE_APP_EXTENSION"])
        {
          uint64_t v18 = 3;
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_75:

          goto LABEL_76;
        }
        uint64_t v18 = [v16 intValue];
      }
      [a1 setLinkType:v18];
      goto LABEL_75;
    }
  }
LABEL_76:

  return a1;
}

- (GEORevealedPlaceCardModuleButton)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModuleButton *)-[GEORevealedPlaceCardModuleButton _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_10847;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_10848;
    }
    GEORevealedPlaceCardModuleButtonReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleButtonReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    int v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORevealedPlaceCardModuleButton *)self readAll:0];
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_metadata) {
      PBDataWriterWriteStringField();
    }
    if (self->_vendor) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  int v6 = (id *)a3;
  [(GEORevealedPlaceCardModuleButton *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 8) = self->_readerMarkPos;
  *((_DWORD *)v6 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_type;
    *((unsigned char *)v6 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v6 + 52) = self->_isGroup;
    *((unsigned char *)v6 + 56) |= 4u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    int v4 = v6;
  }
  if (self->_vendor)
  {
    objc_msgSend(v6, "setVendor:");
    int v4 = v6;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 11) = self->_linkType;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORevealedPlaceCardModuleButtonReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORevealedPlaceCardModuleButton *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 56) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 52) = self->_isGroup;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_metadata copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_vendor copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_linkType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEORevealedPlaceCardModuleButton *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) != 0)
    {
      if (self->_isGroup)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_23;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_15;
      }
    }
LABEL_23:
    BOOL v7 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 56) & 4) != 0) {
    goto LABEL_23;
  }
LABEL_15:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 2) && !-[NSString isEqual:](metadata, "isEqual:")) {
    goto LABEL_23;
  }
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](vendor, "isEqual:")) {
      goto LABEL_23;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 11)) {
      goto LABEL_23;
    }
    BOOL v7 = 1;
  }
LABEL_24:

  return v7;
}

- (unint64_t)hash
{
  [(GEORevealedPlaceCardModuleButton *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isGroup;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_metadata hash];
  NSUInteger v6 = [(NSString *)self->_vendor hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_linkType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  id v4 = v6;
  char v5 = *((unsigned char *)v6 + 56);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v6 + 12);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v6 + 56);
  }
  if ((v5 & 4) != 0)
  {
    self->_isGroup = *((unsigned char *)v6 + 52);
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (*((void *)v6 + 2))
  {
    -[GEORevealedPlaceCardModuleButton setMetadata:](self, "setMetadata:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[GEORevealedPlaceCardModuleButton setVendor:](self, "setVendor:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_linkType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end