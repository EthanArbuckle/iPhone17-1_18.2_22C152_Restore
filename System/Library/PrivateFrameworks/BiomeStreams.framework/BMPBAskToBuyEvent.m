@interface BMPBAskToBuyEvent
- (BOOL)hasActionUserID;
- (BOOL)hasAgeRating;
- (BOOL)hasEventTime;
- (BOOL)hasIsActionUserDevice;
- (BOOL)hasItemDescription;
- (BOOL)hasItemLocalizedPrice;
- (BOOL)hasItemTitle;
- (BOOL)hasProductType;
- (BOOL)hasRequestID;
- (BOOL)hasStarRating;
- (BOOL)hasStatus;
- (BOOL)hasStoreLink;
- (BOOL)hasThumbnailPath;
- (BOOL)hasUserID;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionUserID;
- (NSString)ageRating;
- (NSString)itemDescription;
- (NSString)itemLocalizedPrice;
- (NSString)itemTitle;
- (NSString)productType;
- (NSString)requestID;
- (NSString)storeLink;
- (NSString)thumbnailPath;
- (NSString)userID;
- (double)eventTime;
- (float)starRating;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionUserID:(id)a3;
- (void)setAgeRating:(id)a3;
- (void)setEventTime:(double)a3;
- (void)setHasEventTime:(BOOL)a3;
- (void)setHasIsActionUserDevice:(BOOL)a3;
- (void)setHasStarRating:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsActionUserDevice:(BOOL)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemLocalizedPrice:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStarRating:(float)a3;
- (void)setStatus:(int)a3;
- (void)setStoreLink:(id)a3;
- (void)setThumbnailPath:(id)a3;
- (void)setUserID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBAskToBuyEvent

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)setEventTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventTime = a3;
}

- (void)setHasEventTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserID
{
  return self->_userID != 0;
}

- (BOOL)hasActionUserID
{
  return self->_actionUserID != 0;
}

- (int)status
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D70A8[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"pending"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"declined"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"approved"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasItemTitle
{
  return self->_itemTitle != 0;
}

- (BOOL)hasItemDescription
{
  return self->_itemDescription != 0;
}

- (BOOL)hasItemLocalizedPrice
{
  return self->_itemLocalizedPrice != 0;
}

- (BOOL)hasThumbnailPath
{
  return self->_thumbnailPath != 0;
}

- (BOOL)hasAgeRating
{
  return self->_ageRating != 0;
}

- (void)setStarRating:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_starRating = a3;
}

- (void)setHasStarRating:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStarRating
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isActionUserDevice = a3;
}

- (void)setHasIsActionUserDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActionUserDevice
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasStoreLink
{
  return self->_storeLink != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBAskToBuyEvent;
  int v4 = [(BMPBAskToBuyEvent *)&v8 description];
  v5 = [(BMPBAskToBuyEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_eventTime];
    [v5 setObject:v7 forKey:@"eventTime"];
  }
  userID = self->_userID;
  if (userID) {
    [v5 setObject:userID forKey:@"userID"];
  }
  actionUserID = self->_actionUserID;
  if (actionUserID) {
    [v5 setObject:actionUserID forKey:@"actionUserID"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t status = self->_status;
    if (status >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E55D70A8[status];
    }
    [v5 setObject:v11 forKey:@"status"];
  }
  itemTitle = self->_itemTitle;
  if (itemTitle) {
    [v5 setObject:itemTitle forKey:@"itemTitle"];
  }
  itemDescription = self->_itemDescription;
  if (itemDescription) {
    [v5 setObject:itemDescription forKey:@"itemDescription"];
  }
  itemLocalizedPrice = self->_itemLocalizedPrice;
  if (itemLocalizedPrice) {
    [v5 setObject:itemLocalizedPrice forKey:@"itemLocalizedPrice"];
  }
  thumbnailPath = self->_thumbnailPath;
  if (thumbnailPath) {
    [v5 setObject:thumbnailPath forKey:@"thumbnailPath"];
  }
  ageRating = self->_ageRating;
  if (ageRating) {
    [v5 setObject:ageRating forKey:@"ageRating"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)&double v4 = self->_starRating;
    v17 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v17 forKey:@"starRating"];
  }
  productType = self->_productType;
  if (productType) {
    [v5 setObject:productType forKey:@"productType"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_isActionUserDevice];
    [v5 setObject:v19 forKey:@"isActionUserDevice"];
  }
  storeLink = self->_storeLink;
  if (storeLink) {
    [v5 setObject:storeLink forKey:@"storeLink"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAskToBuyEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_userID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionUserID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_itemTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemLocalizedPrice)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ageRating)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_storeLink)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestID)
  {
    objc_msgSend(v4, "setRequestID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_eventTime;
    *((unsigned char *)v4 + 108) |= 1u;
  }
  if (self->_userID)
  {
    objc_msgSend(v5, "setUserID:");
    id v4 = v5;
  }
  if (self->_actionUserID)
  {
    objc_msgSend(v5, "setActionUserID:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_status;
    *((unsigned char *)v4 + 108) |= 4u;
  }
  if (self->_itemTitle)
  {
    objc_msgSend(v5, "setItemTitle:");
    id v4 = v5;
  }
  if (self->_itemDescription)
  {
    objc_msgSend(v5, "setItemDescription:");
    id v4 = v5;
  }
  if (self->_itemLocalizedPrice)
  {
    objc_msgSend(v5, "setItemLocalizedPrice:");
    id v4 = v5;
  }
  if (self->_thumbnailPath)
  {
    objc_msgSend(v5, "setThumbnailPath:");
    id v4 = v5;
  }
  if (self->_ageRating)
  {
    objc_msgSend(v5, "setAgeRating:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = LODWORD(self->_starRating);
    *((unsigned char *)v4 + 108) |= 2u;
  }
  if (self->_productType)
  {
    objc_msgSend(v5, "setProductType:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 104) = self->_isActionUserDevice;
    *((unsigned char *)v4 + 108) |= 8u;
  }
  if (self->_storeLink)
  {
    objc_msgSend(v5, "setStoreLink:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestID copyWithZone:a3];
  v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_eventTime;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_userID copyWithZone:a3];
  v9 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v8;

  uint64_t v10 = [(NSString *)self->_actionUserID copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_status;
    *(unsigned char *)(v5 + 108) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_itemTitle copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_itemDescription copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSString *)self->_itemLocalizedPrice copyWithZone:a3];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_thumbnailPath copyWithZone:a3];
  v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  uint64_t v20 = [(NSString *)self->_ageRating copyWithZone:a3];
  v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)(v5 + 72) = self->_starRating;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  uint64_t v22 = [(NSString *)self->_productType copyWithZone:a3];
  v23 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v22;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_isActionUserDevice;
    *(unsigned char *)(v5 + 108) |= 8u;
  }
  uint64_t v24 = [(NSString *)self->_storeLink copyWithZone:a3];
  v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_eventTime != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_40;
  }
  userID = self->_userID;
  if ((unint64_t)userID | *((void *)v4 + 12) && !-[NSString isEqual:](userID, "isEqual:")) {
    goto LABEL_40;
  }
  actionUserID = self->_actionUserID;
  if ((unint64_t)actionUserID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionUserID, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_status != *((_DWORD *)v4 + 19)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    goto LABEL_40;
  }
  itemTitle = self->_itemTitle;
  if ((unint64_t)itemTitle | *((void *)v4 + 6) && !-[NSString isEqual:](itemTitle, "isEqual:")) {
    goto LABEL_40;
  }
  itemDescription = self->_itemDescription;
  if ((unint64_t)itemDescription | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemDescription, "isEqual:")) {
      goto LABEL_40;
    }
  }
  itemLocalizedPrice = self->_itemLocalizedPrice;
  if ((unint64_t)itemLocalizedPrice | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](itemLocalizedPrice, "isEqual:")) {
      goto LABEL_40;
    }
  }
  thumbnailPath = self->_thumbnailPath;
  if ((unint64_t)thumbnailPath | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](thumbnailPath, "isEqual:")) {
      goto LABEL_40;
    }
  }
  ageRating = self->_ageRating;
  if ((unint64_t)ageRating | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](ageRating, "isEqual:")) {
      goto LABEL_40;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_starRating != *((float *)v4 + 18)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_40;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_40;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 108) & 8) == 0) {
      goto LABEL_46;
    }
LABEL_40:
    char v15 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 108) & 8) == 0) {
    goto LABEL_40;
  }
  if (!self->_isActionUserDevice)
  {
    if (!*((unsigned char *)v4 + 104)) {
      goto LABEL_46;
    }
    goto LABEL_40;
  }
  if (!*((unsigned char *)v4 + 104)) {
    goto LABEL_40;
  }
LABEL_46:
  storeLink = self->_storeLink;
  if ((unint64_t)storeLink | *((void *)v4 + 10)) {
    char v15 = -[NSString isEqual:](storeLink, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_41:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v25 = [(NSString *)self->_requestID hash];
  if (*(unsigned char *)&self->_has)
  {
    double eventTime = self->_eventTime;
    double v5 = -eventTime;
    if (eventTime >= 0.0) {
      double v5 = self->_eventTime;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_userID hash];
  NSUInteger v23 = [(NSString *)self->_actionUserID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    NSUInteger v8 = [(NSString *)self->_itemTitle hash];
  }
  else {
    NSUInteger v8 = [(NSString *)self->_itemTitle hash];
  }
  NSUInteger v9 = v8;
  NSUInteger v10 = [(NSString *)self->_itemDescription hash];
  NSUInteger v11 = [(NSString *)self->_itemLocalizedPrice hash];
  NSUInteger v12 = [(NSString *)self->_thumbnailPath hash];
  NSUInteger v13 = [(NSString *)self->_ageRating hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float starRating = self->_starRating;
    float v16 = -starRating;
    if (starRating >= 0.0) {
      float v16 = self->_starRating;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_productType hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v20 = 2654435761 * self->_isActionUserDevice;
  }
  else {
    uint64_t v20 = 0;
  }
  return v3 ^ v25 ^ v24 ^ v23 ^ v22 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ [(NSString *)self->_storeLink hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 8))
  {
    -[BMPBAskToBuyEvent setRequestID:](self, "setRequestID:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 108))
  {
    self->_double eventTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 12))
  {
    -[BMPBAskToBuyEvent setUserID:](self, "setUserID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBAskToBuyEvent setActionUserID:](self, "setActionUserID:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 108) & 4) != 0)
  {
    self->_uint64_t status = *((_DWORD *)v4 + 19);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBAskToBuyEvent setItemTitle:](self, "setItemTitle:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBAskToBuyEvent setItemDescription:](self, "setItemDescription:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBAskToBuyEvent setItemLocalizedPrice:](self, "setItemLocalizedPrice:");
    id v4 = v5;
  }
  if (*((void *)v4 + 11))
  {
    -[BMPBAskToBuyEvent setThumbnailPath:](self, "setThumbnailPath:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBAskToBuyEvent setAgeRating:](self, "setAgeRating:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    self->_float starRating = *((float *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBAskToBuyEvent setProductType:](self, "setProductType:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 108) & 8) != 0)
  {
    self->_isActionUserDevice = *((unsigned char *)v4 + 104);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 10))
  {
    -[BMPBAskToBuyEvent setStoreLink:](self, "setStoreLink:");
    id v4 = v5;
  }
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (double)eventTime
{
  return self->_eventTime;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (void)setActionUserID:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (void)setItemLocalizedPrice:(id)a3
{
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (void)setThumbnailPath:(id)a3
{
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
}

- (float)starRating
{
  return self->_starRating;
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void)setStoreLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);

  objc_storeStrong((id *)&self->_actionUserID, 0);
}

@end