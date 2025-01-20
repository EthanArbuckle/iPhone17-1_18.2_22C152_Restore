@interface ATXPBSpotlightEventMetadata
- (BOOL)didSearchDuringSession;
- (BOOL)hasEngagedAppString;
- (BOOL)hasQueryAtEngagement;
- (BOOL)hasSearchEngagedBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)engagedAppString;
- (uint64_t)hasDidSearchDuringSession;
- (uint64_t)hasSearchEngagedActionType;
- (uint64_t)queryAtEngagement;
- (uint64_t)searchEngagedActionType;
- (uint64_t)searchEngagedBundleId;
- (uint64_t)setDidSearchDuringSession:(uint64_t)result;
- (uint64_t)setHasDidSearchDuringSession:(uint64_t)result;
- (uint64_t)setHasSearchEngagedActionType:(uint64_t)result;
- (uint64_t)setSearchEngagedActionType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setEngagedAppString:(uint64_t)a1;
- (void)setQueryAtEngagement:(uint64_t)a1;
- (void)setSearchEngagedBundleId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSpotlightEventMetadata

- (BOOL)hasQueryAtEngagement
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (uint64_t)setDidSearchDuringSession:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 44) |= 2u;
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasDidSearchDuringSession:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasDidSearchDuringSession
{
  if (result) {
    return (*(unsigned __int8 *)(result + 44) >> 1) & 1;
  }
  return result;
}

- (BOOL)hasSearchEngagedBundleId
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)setSearchEngagedActionType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 44) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchEngagedActionType:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasSearchEngagedActionType
{
  if (result) {
    return *(unsigned char *)(result + 44) & 1;
  }
  return result;
}

- (BOOL)hasEngagedAppString
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSpotlightEventMetadata;
  v4 = [(ATXPBSpotlightEventMetadata *)&v8 description];
  v5 = [(ATXPBSpotlightEventMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  queryAtEngagement = self->_queryAtEngagement;
  if (queryAtEngagement) {
    [v3 setObject:queryAtEngagement forKey:@"queryAtEngagement"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_didSearchDuringSession];
    [v4 setObject:v6 forKey:@"didSearchDuringSession"];
  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  if (searchEngagedBundleId) {
    [v4 setObject:searchEngagedBundleId forKey:@"searchEngagedBundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_searchEngagedActionType];
    [v4 setObject:v8 forKey:@"searchEngagedActionType"];
  }
  engagedAppString = self->_engagedAppString;
  if (engagedAppString) {
    [v4 setObject:engagedAppString forKey:@"engagedAppString"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_queryAtEngagement)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_searchEngagedBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_engagedAppString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (v4)
    {
      -[ATXPBSpotlightEventMetadata setQueryAtEngagement:]((uint64_t)v3, v4);
      id v3 = v7;
    }
    if ((*(unsigned char *)(a1 + 44) & 2) != 0)
    {
      *((unsigned char *)v3 + 40) = *(unsigned char *)(a1 + 40);
      *((unsigned char *)v3 + 44) |= 2u;
    }
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      -[ATXPBSpotlightEventMetadata setSearchEngagedBundleId:]((uint64_t)v7, v5);
      id v3 = v7;
    }
    if (*(unsigned char *)(a1 + 44))
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 44) |= 1u;
    }
    v6 = *(void **)(a1 + 16);
    if (v6)
    {
      -[ATXPBSpotlightEventMetadata setEngagedAppString:]((uint64_t)v7, v6);
      id v3 = v7;
    }
  }
}

- (void)setQueryAtEngagement:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setSearchEngagedBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setEngagedAppString:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_queryAtEngagement copyWithZone:a3];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_didSearchDuringSession;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_searchEngagedBundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_searchEngagedActionType;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_engagedAppString copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  queryAtEngagement = self->_queryAtEngagement;
  if ((unint64_t)queryAtEngagement | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](queryAtEngagement, "isEqual:")) {
      goto LABEL_22;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_didSearchDuringSession)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  if (!((unint64_t)searchEngagedBundleId | *((void *)v4 + 4))) {
    goto LABEL_15;
  }
  if (!-[NSString isEqual:](searchEngagedBundleId, "isEqual:"))
  {
LABEL_22:
    char v9 = 0;
    goto LABEL_23;
  }
  char has = (char)self->_has;
LABEL_15:
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_searchEngagedActionType != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_22;
  }
  engagedAppString = self->_engagedAppString;
  if ((unint64_t)engagedAppString | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](engagedAppString, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_queryAtEngagement hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_didSearchDuringSession;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_searchEngagedBundleId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_searchEngagedActionType;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_engagedAppString hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    uint64_t v4 = (void *)v3[3];
    id v7 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 24), v4);
      NSUInteger v3 = v7;
    }
    if ((*((unsigned char *)v3 + 44) & 2) != 0)
    {
      *(unsigned char *)(a1 + 40) = *((unsigned char *)v3 + 40);
      *(unsigned char *)(a1 + 44) |= 2u;
    }
    NSUInteger v5 = (void *)v3[4];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 32), v5);
      NSUInteger v3 = v7;
    }
    if (*((unsigned char *)v3 + 44))
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 44) |= 1u;
    }
    unint64_t v6 = (void *)v3[2];
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 16), v6);
      NSUInteger v3 = v7;
    }
  }
}

- (uint64_t)queryAtEngagement
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)didSearchDuringSession
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)searchEngagedBundleId
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)searchEngagedActionType
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)engagedAppString
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEngagedBundleId, 0);
  objc_storeStrong((id *)&self->_queryAtEngagement, 0);

  objc_storeStrong((id *)&self->_engagedAppString, 0);
}

@end