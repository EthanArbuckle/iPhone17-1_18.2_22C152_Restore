@interface ATXPBFaceGallerySection
+ (Class)itemsType;
- (BOOL)hasSemanticType;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (id)semanticTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsSemanticType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)semanticType;
- (int)type;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (void)addItems:(id)a3;
- (void)clearItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSemanticType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setSemanticType:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBFaceGallerySection

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D08190[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Full"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Scrollable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Unity"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ScrollableSquares"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearItems
{
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSMutableArray *)items addObject:v4];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

- (int)semanticType
{
  if (*(unsigned char *)&self->_has) {
    return self->_semanticType;
  }
  else {
    return 0;
  }
}

- (void)setSemanticType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_semanticType = a3;
}

- (void)setHasSemanticType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSemanticType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)semanticTypeAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5D081B0[a3];
  }

  return v3;
}

- (int)StringAsSemanticType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FeaturedFaces"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FeaturedPhotos"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Focus"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Hero"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PhotoShuffle"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WeatherAndAstronomy"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Kaleidoscope"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Emoji"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Unity"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Pride"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"OSVersion"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"Collections"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Color"])
  {
    int v4 = 13;
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
  v8.super_class = (Class)ATXPBFaceGallerySection;
  int v4 = [(ATXPBFaceGallerySection *)&v8 description];
  v5 = [(ATXPBFaceGallerySection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5D08190[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_items;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"items"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t semanticType = self->_semanticType;
    if (semanticType >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_semanticType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E5D081B0[semanticType];
    }
    [v3 setObject:v14 forKey:@"semanticType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGallerySectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_items;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_type;
    *((unsigned char *)v4 + 24) |= 2u;
  }
  id v9 = v4;
  if ([(ATXPBFaceGallerySection *)self itemsCount])
  {
    [v9 clearItems];
    unint64_t v5 = [(ATXPBFaceGallerySection *)self itemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBFaceGallerySection *)self itemsAtIndex:i];
        [v9 addItems:v8];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 4) = self->_semanticType;
    *((unsigned char *)v9 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_type;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_items;
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
        [(id)v6 addItems:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_semanticType;
    *(unsigned char *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_type != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_semanticType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_items hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_semanticType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ATXPBFaceGallerySection addItems:](self, "addItems:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[6])
  {
    self->_uint64_t semanticType = v5[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end