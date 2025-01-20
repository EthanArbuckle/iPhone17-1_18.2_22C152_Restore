@interface BCSCallerIdMessage
- (BCSCallerIdLocalizedString)intent;
- (BCSCallerIdLocalizedString)name;
- (BOOL)hasBusinessId;
- (BOOL)hasCompanyId;
- (BOOL)hasConflatedMuid;
- (BOOL)hasIntent;
- (BOOL)hasIsVerified;
- (BOOL)hasLocationId;
- (BOOL)hasLogoUrl;
- (BOOL)hasName;
- (BOOL)hasPhoneHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerified;
- (BOOL)readFrom:(id)a3;
- (NSString)businessId;
- (NSString)companyId;
- (NSString)conflatedMuid;
- (NSString)locationId;
- (NSString)logoUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)phoneHash;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBusinessId:(id)a3;
- (void)setCompanyId:(id)a3;
- (void)setConflatedMuid:(id)a3;
- (void)setHasIsVerified:(BOOL)a3;
- (void)setHasPhoneHash:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setLocationId:(id)a3;
- (void)setLogoUrl:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneHash:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallerIdMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCompanyId
{
  return self->_companyId != 0;
}

- (BOOL)hasBusinessId
{
  return self->_businessId != 0;
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLogoUrl
{
  return self->_logoUrl != 0;
}

- (void)setIsVerified:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (BOOL)hasConflatedMuid
{
  return self->_conflatedMuid != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallerIdMessage;
  v4 = [(BCSCallerIdMessage *)&v8 description];
  v5 = [(BCSCallerIdMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_phoneHash];
    [v3 setObject:v4 forKey:@"phone_hash"];
  }
  companyId = self->_companyId;
  if (companyId) {
    [v3 setObject:companyId forKey:@"company_id"];
  }
  businessId = self->_businessId;
  if (businessId) {
    [v3 setObject:businessId forKey:@"business_id"];
  }
  locationId = self->_locationId;
  if (locationId) {
    [v3 setObject:locationId forKey:@"location_id"];
  }
  name = self->_name;
  if (name)
  {
    v9 = [(BCSCallerIdLocalizedString *)name dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"name"];
  }
  logoUrl = self->_logoUrl;
  if (logoUrl) {
    [v3 setObject:logoUrl forKey:@"logo_url"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isVerified];
    [v3 setObject:v11 forKey:@"is_verified"];
  }
  intent = self->_intent;
  if (intent)
  {
    v13 = [(BCSCallerIdLocalizedString *)intent dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"intent"];
  }
  conflatedMuid = self->_conflatedMuid;
  if (conflatedMuid) {
    [v3 setObject:conflatedMuid forKey:@"conflated_muid"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BCSCallerIdMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_companyId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_businessId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_logoUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_intent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_conflatedMuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_phoneHash;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  id v5 = v4;
  if (self->_companyId)
  {
    objc_msgSend(v4, "setCompanyId:");
    id v4 = v5;
  }
  if (self->_businessId)
  {
    objc_msgSend(v5, "setBusinessId:");
    id v4 = v5;
  }
  if (self->_locationId)
  {
    objc_msgSend(v5, "setLocationId:");
    id v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
  if (self->_logoUrl)
  {
    objc_msgSend(v5, "setLogoUrl:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_isVerified;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_intent)
  {
    objc_msgSend(v5, "setIntent:");
    id v4 = v5;
  }
  if (self->_conflatedMuid)
  {
    objc_msgSend(v5, "setConflatedMuid:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_phoneHash;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_companyId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_businessId copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_locationId copyWithZone:a3];
  v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  id v13 = [(BCSCallerIdLocalizedString *)self->_name copyWithZone:a3];
  v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_logoUrl copyWithZone:a3];
  v16 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 72) = self->_isVerified;
    *(unsigned char *)(v6 + 76) |= 2u;
  }
  id v17 = [(BCSCallerIdLocalizedString *)self->_intent copyWithZone:a3];
  v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  uint64_t v19 = [(NSString *)self->_conflatedMuid copyWithZone:a3];
  v20 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v19;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_phoneHash != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_29;
  }
  companyId = self->_companyId;
  if ((unint64_t)companyId | *((void *)v4 + 3) && !-[NSString isEqual:](companyId, "isEqual:")) {
    goto LABEL_29;
  }
  businessId = self->_businessId;
  if ((unint64_t)businessId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](businessId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  locationId = self->_locationId;
  if ((unint64_t)locationId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](locationId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8))
  {
    if (!-[BCSCallerIdLocalizedString isEqual:](name, "isEqual:")) {
      goto LABEL_29;
    }
  }
  logoUrl = self->_logoUrl;
  if ((unint64_t)logoUrl | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](logoUrl, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_25;
      }
    }
LABEL_29:
    char v12 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0) {
    goto LABEL_29;
  }
LABEL_25:
  intent = self->_intent;
  if ((unint64_t)intent | *((void *)v4 + 5) && !-[BCSCallerIdLocalizedString isEqual:](intent, "isEqual:")) {
    goto LABEL_29;
  }
  conflatedMuid = self->_conflatedMuid;
  if ((unint64_t)conflatedMuid | *((void *)v4 + 4)) {
    char v12 = -[NSString isEqual:](conflatedMuid, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_30:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_phoneHash;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_companyId hash];
  NSUInteger v5 = [(NSString *)self->_businessId hash];
  NSUInteger v6 = [(NSString *)self->_locationId hash];
  unint64_t v7 = [(BCSCallerIdLocalizedString *)self->_name hash];
  NSUInteger v8 = [(NSString *)self->_logoUrl hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_isVerified;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v11 = [(BCSCallerIdLocalizedString *)self->_intent hash];
  return v10 ^ v11 ^ [(NSString *)self->_conflatedMuid hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  NSUInteger v5 = v4;
  if (*((unsigned char *)v4 + 76))
  {
    self->_phoneHash = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v10 = v4;
  if (v4[3])
  {
    -[BCSCallerIdMessage setCompanyId:](self, "setCompanyId:");
    NSUInteger v5 = v10;
  }
  if (v5[2])
  {
    -[BCSCallerIdMessage setBusinessId:](self, "setBusinessId:");
    NSUInteger v5 = v10;
  }
  if (v5[6])
  {
    -[BCSCallerIdMessage setLocationId:](self, "setLocationId:");
    NSUInteger v5 = v10;
  }
  name = self->_name;
  uint64_t v7 = v5[8];
  if (name)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[BCSCallerIdLocalizedString mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[BCSCallerIdMessage setName:](self, "setName:");
  }
  NSUInteger v5 = v10;
LABEL_15:
  if (v5[7])
  {
    -[BCSCallerIdMessage setLogoUrl:](self, "setLogoUrl:");
    NSUInteger v5 = v10;
  }
  if ((*((unsigned char *)v5 + 76) & 2) != 0)
  {
    self->_isVerified = *((unsigned char *)v5 + 72);
    *(unsigned char *)&self->_has |= 2u;
  }
  intent = self->_intent;
  uint64_t v9 = v5[5];
  if (intent)
  {
    if (!v9) {
      goto LABEL_25;
    }
    -[BCSCallerIdLocalizedString mergeFrom:](intent, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_25;
    }
    -[BCSCallerIdMessage setIntent:](self, "setIntent:");
  }
  NSUInteger v5 = v10;
LABEL_25:
  if (v5[4]) {
    -[BCSCallerIdMessage setConflatedMuid:](self, "setConflatedMuid:");
  }

  MEMORY[0x270F9A758]();
}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)companyId
{
  return self->_companyId;
}

- (void)setCompanyId:(id)a3
{
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (BCSCallerIdLocalizedString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)logoUrl
{
  return self->_logoUrl;
}

- (void)setLogoUrl:(id)a3
{
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BCSCallerIdLocalizedString)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
}

- (NSString)conflatedMuid
{
  return self->_conflatedMuid;
}

- (void)setConflatedMuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoUrl, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_conflatedMuid, 0);
  objc_storeStrong((id *)&self->_companyId, 0);

  objc_storeStrong((id *)&self->_businessId, 0);
}

@end