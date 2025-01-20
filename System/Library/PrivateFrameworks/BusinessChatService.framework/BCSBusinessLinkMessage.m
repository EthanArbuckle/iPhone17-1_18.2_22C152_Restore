@interface BCSBusinessLinkMessage
+ (Class)businessLinkContentsType;
+ (Class)categoryStyleAttributesType;
- (BOOL)hasAction;
- (BOOL)hasBundleId;
- (BOOL)hasHeroImage;
- (BOOL)hasIconImage;
- (BOOL)hasIsPoweredBy;
- (BOOL)hasLink;
- (BOOL)hasMuid;
- (BOOL)hasRedirectUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPoweredBy;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)businessLinkContents;
- (NSMutableArray)categoryStyleAttributes;
- (NSString)bundleId;
- (NSString)heroImage;
- (NSString)iconImage;
- (NSString)link;
- (NSString)muid;
- (NSString)redirectUrl;
- (id)actionAsString:(int)a3;
- (id)businessLinkContentsAtIndex:(unint64_t)a3;
- (id)categoryStyleAttributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)businessLinkContentsCount;
- (unint64_t)categoryStyleAttributesCount;
- (unint64_t)hash;
- (void)addBusinessLinkContents:(id)a3;
- (void)addCategoryStyleAttributes:(id)a3;
- (void)clearBusinessLinkContents;
- (void)clearCategoryStyleAttributes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setBundleId:(id)a3;
- (void)setBusinessLinkContents:(id)a3;
- (void)setCategoryStyleAttributes:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasIsPoweredBy:(BOOL)a3;
- (void)setHeroImage:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIsPoweredBy:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setMuid:(id)a3;
- (void)setRedirectUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSBusinessLinkMessage

- (BOOL)hasLink
{
  return self->_link != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasHeroImage
{
  return self->_heroImage != 0;
}

- (BOOL)hasIconImage
{
  return self->_iconImage != 0;
}

- (BOOL)hasRedirectUrl
{
  return self->_redirectUrl != 0;
}

- (void)clearBusinessLinkContents
{
}

- (void)addBusinessLinkContents:(id)a3
{
  id v4 = a3;
  businessLinkContents = self->_businessLinkContents;
  id v8 = v4;
  if (!businessLinkContents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_businessLinkContents;
    self->_businessLinkContents = v6;

    id v4 = v8;
    businessLinkContents = self->_businessLinkContents;
  }
  [(NSMutableArray *)businessLinkContents addObject:v4];
}

- (unint64_t)businessLinkContentsCount
{
  return [(NSMutableArray *)self->_businessLinkContents count];
}

- (id)businessLinkContentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_businessLinkContents objectAtIndex:a3];
}

+ (Class)businessLinkContentsType
{
  return (Class)objc_opt_class();
}

- (int)action
{
  if (*(unsigned char *)&self->_has) {
    return self->_action;
  }
  else {
    return 1;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)actionAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264249CB0[a3 - 1];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OPEN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VIEW"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PLAY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setIsPoweredBy:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isPoweredBy = a3;
}

- (void)setHasIsPoweredBy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPoweredBy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMuid
{
  return self->_muid != 0;
}

- (void)clearCategoryStyleAttributes
{
}

- (void)addCategoryStyleAttributes:(id)a3
{
  id v4 = a3;
  categoryStyleAttributes = self->_categoryStyleAttributes;
  id v8 = v4;
  if (!categoryStyleAttributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_categoryStyleAttributes;
    self->_categoryStyleAttributes = v6;

    id v4 = v8;
    categoryStyleAttributes = self->_categoryStyleAttributes;
  }
  [(NSMutableArray *)categoryStyleAttributes addObject:v4];
}

- (unint64_t)categoryStyleAttributesCount
{
  return [(NSMutableArray *)self->_categoryStyleAttributes count];
}

- (id)categoryStyleAttributesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categoryStyleAttributes objectAtIndex:a3];
}

+ (Class)categoryStyleAttributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSBusinessLinkMessage;
  id v4 = [(BCSBusinessLinkMessage *)&v8 description];
  v5 = [(BCSBusinessLinkMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  link = self->_link;
  if (link) {
    [v3 setObject:link forKey:@"link"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v4 setObject:bundleId forKey:@"bundle_id"];
  }
  heroImage = self->_heroImage;
  if (heroImage) {
    [v4 setObject:heroImage forKey:@"hero_image"];
  }
  iconImage = self->_iconImage;
  if (iconImage) {
    [v4 setObject:iconImage forKey:@"icon_image"];
  }
  redirectUrl = self->_redirectUrl;
  if (redirectUrl) {
    [v4 setObject:redirectUrl forKey:@"redirect_url"];
  }
  if ([(NSMutableArray *)self->_businessLinkContents count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_businessLinkContents, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v11 = self->_businessLinkContents;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"business_link_contents"];
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v18 = self->_action - 1;
    if (v18 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_action);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_264249CB0[v18];
    }
    [v4 setObject:v19 forKey:@"action"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_isPoweredBy];
    [v4 setObject:v20 forKey:@"is_powered_by"];
  }
  muid = self->_muid;
  if (muid) {
    [v4 setObject:muid forKey:@"muid"];
  }
  if ([(NSMutableArray *)self->_categoryStyleAttributes count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_categoryStyleAttributes, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = self->_categoryStyleAttributes;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"category_style_attributes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCSBusinessLinkMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_link) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_heroImage) {
    PBDataWriterWriteStringField();
  }
  if (self->_iconImage) {
    PBDataWriterWriteStringField();
  }
  if (self->_redirectUrl) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_businessLinkContents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_muid) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_categoryStyleAttributes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_link) {
    objc_msgSend(v13, "setLink:");
  }
  if (self->_bundleId) {
    objc_msgSend(v13, "setBundleId:");
  }
  if (self->_heroImage) {
    objc_msgSend(v13, "setHeroImage:");
  }
  if (self->_iconImage) {
    objc_msgSend(v13, "setIconImage:");
  }
  if (self->_redirectUrl) {
    objc_msgSend(v13, "setRedirectUrl:");
  }
  if ([(BCSBusinessLinkMessage *)self businessLinkContentsCount])
  {
    [v13 clearBusinessLinkContents];
    unint64_t v4 = [(BCSBusinessLinkMessage *)self businessLinkContentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BCSBusinessLinkMessage *)self businessLinkContentsAtIndex:i];
        [v13 addBusinessLinkContents:v7];
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v13 + 2) = self->_action;
    *((unsigned char *)v13 + 84) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v13 + 80) = self->_isPoweredBy;
    *((unsigned char *)v13 + 84) |= 2u;
  }
  if (self->_muid) {
    objc_msgSend(v13, "setMuid:");
  }
  if ([(BCSBusinessLinkMessage *)self categoryStyleAttributesCount])
  {
    [v13 clearCategoryStyleAttributes];
    unint64_t v9 = [(BCSBusinessLinkMessage *)self categoryStyleAttributesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BCSBusinessLinkMessage *)self categoryStyleAttributesAtIndex:j];
        [v13 addCategoryStyleAttributes:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_link copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_heroImage copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_iconImage copyWithZone:a3];
  id v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_redirectUrl copyWithZone:a3];
  v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v16 = self->_businessLinkContents;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addBusinessLinkContents:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v18);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_action;
    *(unsigned char *)(v5 + 84) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_isPoweredBy;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
  uint64_t v23 = [(NSString *)self->_muid copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v23;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v25 = self->_categoryStyleAttributes;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "copyWithZone:", a3, (void)v32);
        [(id)v5 addCategoryStyleAttributes:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v27);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  link = self->_link;
  if ((unint64_t)link | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](link, "isEqual:")) {
      goto LABEL_31;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_31;
    }
  }
  heroImage = self->_heroImage;
  if ((unint64_t)heroImage | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](heroImage, "isEqual:")) {
      goto LABEL_31;
    }
  }
  iconImage = self->_iconImage;
  if ((unint64_t)iconImage | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](iconImage, "isEqual:")) {
      goto LABEL_31;
    }
  }
  redirectUrl = self->_redirectUrl;
  if ((unint64_t)redirectUrl | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](redirectUrl, "isEqual:")) {
      goto LABEL_31;
    }
  }
  businessLinkContents = self->_businessLinkContents;
  if ((unint64_t)businessLinkContents | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](businessLinkContents, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_action != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) != 0)
    {
      if (self->_isPoweredBy)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_31;
        }
        goto LABEL_27;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_27;
      }
    }
LABEL_31:
    char v13 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 84) & 2) != 0) {
    goto LABEL_31;
  }
LABEL_27:
  muid = self->_muid;
  if ((unint64_t)muid | *((void *)v4 + 8) && !-[NSString isEqual:](muid, "isEqual:")) {
    goto LABEL_31;
  }
  categoryStyleAttributes = self->_categoryStyleAttributes;
  if ((unint64_t)categoryStyleAttributes | *((void *)v4 + 4)) {
    char v13 = -[NSMutableArray isEqual:](categoryStyleAttributes, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_32:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_link hash];
  NSUInteger v4 = [(NSString *)self->_bundleId hash];
  NSUInteger v5 = [(NSString *)self->_heroImage hash];
  NSUInteger v6 = [(NSString *)self->_iconImage hash];
  NSUInteger v7 = [(NSString *)self->_redirectUrl hash];
  uint64_t v8 = [(NSMutableArray *)self->_businessLinkContents hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = 2654435761 * self->_action;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_isPoweredBy;
LABEL_6:
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v12 = v10 ^ [(NSString *)self->_muid hash];
  return v11 ^ v12 ^ [(NSMutableArray *)self->_categoryStyleAttributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[BCSBusinessLinkMessage setLink:](self, "setLink:");
  }
  if (*((void *)v4 + 2)) {
    -[BCSBusinessLinkMessage setBundleId:](self, "setBundleId:");
  }
  if (*((void *)v4 + 5)) {
    -[BCSBusinessLinkMessage setHeroImage:](self, "setHeroImage:");
  }
  if (*((void *)v4 + 6)) {
    -[BCSBusinessLinkMessage setIconImage:](self, "setIconImage:");
  }
  if (*((void *)v4 + 9)) {
    -[BCSBusinessLinkMessage setRedirectUrl:](self, "setRedirectUrl:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BCSBusinessLinkMessage *)self addBusinessLinkContents:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 84);
  if (v10)
  {
    self->_action = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)v4 + 84);
  }
  if ((v10 & 2) != 0)
  {
    self->_isPoweredBy = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 8)) {
    -[BCSBusinessLinkMessage setMuid:](self, "setMuid:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BCSBusinessLinkMessage addCategoryStyleAttributes:](self, "addCategoryStyleAttributes:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (NSString)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)heroImage
{
  return self->_heroImage;
}

- (void)setHeroImage:(id)a3
{
}

- (NSString)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSString)redirectUrl
{
  return self->_redirectUrl;
}

- (void)setRedirectUrl:(id)a3
{
}

- (NSMutableArray)businessLinkContents
{
  return self->_businessLinkContents;
}

- (void)setBusinessLinkContents:(id)a3
{
}

- (BOOL)isPoweredBy
{
  return self->_isPoweredBy;
}

- (NSString)muid
{
  return self->_muid;
}

- (void)setMuid:(id)a3
{
}

- (NSMutableArray)categoryStyleAttributes
{
  return self->_categoryStyleAttributes;
}

- (void)setCategoryStyleAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectUrl, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_categoryStyleAttributes, 0);
  objc_storeStrong((id *)&self->_businessLinkContents, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end