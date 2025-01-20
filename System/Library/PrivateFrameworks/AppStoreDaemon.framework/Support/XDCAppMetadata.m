@interface XDCAppMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation XDCAppMetadata

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)XDCAppMetadata;
  v3 = [(XDCAppMetadata *)&v7 description];
  v4 = [(XDCAppMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v4 = +[NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    [v3 setObject:altDSID forKey:@"altDSID"];
  }
  appleID = self->_appleID;
  if (appleID) {
    [v3 setObject:appleID forKey:@"appleID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if (*(_WORD *)&self->_has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_downloaderID];
    [v3 setObject:v8 forKey:@"downloaderID"];
  }
  externalIDString = self->_externalIDString;
  if (externalIDString) {
    [v3 setObject:externalIDString forKey:@"externalIDString"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v33 = +[NSNumber numberWithUnsignedLongLong:self->_externalVersionID];
    [v3 setObject:v33 forKey:@"externalVersionID"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }
  v34 = +[NSNumber numberWithUnsignedLongLong:self->_itemID];
  [v3 setObject:v34 forKey:@"itemID"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_16:
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_purchaserID];
    [v3 setObject:v11 forKey:@"purchaserID"];
  }
LABEL_17:
  redownloadParams = self->_redownloadParams;
  if (redownloadParams) {
    [v3 setObject:redownloadParams forKey:@"redownloadParams"];
  }
  artworkURLString = self->_artworkURLString;
  if (artworkURLString) {
    [v3 setObject:artworkURLString forKey:@"artworkURLString"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v14 = +[NSNumber numberWithBool:self->_containsMessagesExtension];
    [v3 setObject:v14 forKey:@"containsMessagesExtension"];
  }
  itemName = self->_itemName;
  if (itemName) {
    [v3 setObject:itemName forKey:@"itemName"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v16 = +[NSNumber numberWithBool:self->_launchProhibited];
    [v3 setObject:v16 forKey:@"launchProhibited"];
  }
  messagesArtworkURLString = self->_messagesArtworkURLString;
  if (messagesArtworkURLString) {
    [v3 setObject:messagesArtworkURLString forKey:@"messagesArtworkURLString"];
  }
  packageDPInfo = self->_packageDPInfo;
  if (packageDPInfo) {
    [v3 setObject:packageDPInfo forKey:@"packageDPInfo"];
  }
  packageSINF = self->_packageSINF;
  if (packageSINF) {
    [v3 setObject:packageSINF forKey:@"packageSINF"];
  }
  packageURLString = self->_packageURLString;
  if (packageURLString) {
    [v3 setObject:packageURLString forKey:@"packageURLString"];
  }
  storeCohort = self->_storeCohort;
  if (storeCohort) {
    [v3 setObject:storeCohort forKey:@"storeCohort"];
  }
  storeFront = self->_storeFront;
  if (storeFront) {
    [v3 setObject:storeFront forKey:@"storeFront"];
  }
  vendorName = self->_vendorName;
  if (vendorName) {
    [v3 setObject:vendorName forKey:@"vendorName"];
  }
  provisioningProfiles = self->_provisioningProfiles;
  if (provisioningProfiles) {
    [v3 setObject:provisioningProfiles forKey:@"provisioningProfile"];
  }
  variantID = self->_variantID;
  if (variantID) {
    [v3 setObject:variantID forKey:@"variantID"];
  }
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x400) != 0)
  {
    v35 = +[NSNumber numberWithBool:self->_skipIfInstalled];
    [v3 setObject:v35 forKey:@"skipIfInstalled"];

    __int16 v26 = (__int16)self->_has;
    if ((v26 & 0x40) == 0)
    {
LABEL_47:
      if ((v26 & 0x100) == 0) {
        goto LABEL_48;
      }
      goto LABEL_66;
    }
  }
  else if ((v26 & 0x40) == 0)
  {
    goto LABEL_47;
  }
  v36 = +[NSNumber numberWithBool:self->_isBeta];
  [v3 setObject:v36 forKey:@"isBeta"];

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x100) == 0)
  {
LABEL_48:
    if ((v26 & 0x80) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_66:
  v37 = +[NSNumber numberWithBool:self->_isSystemApp];
  [v3 setObject:v37 forKey:@"isSystemApp"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_49:
    v27 = +[NSNumber numberWithBool:self->_isStoreApp];
    [v3 setObject:v27 forKey:@"isStoreApp"];
  }
LABEL_50:
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v3 setObject:bundleVersion forKey:@"bundleVersion"];
  }
  manifestURLString = self->_manifestURLString;
  if (manifestURLString) {
    [v3 setObject:manifestURLString forKey:@"manifestURLString"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v30 = +[NSNumber numberWithBool:self->_suppressDialogs];
    [v3 setObject:v30 forKey:@"suppressDialogs"];
  }
  betaBuildGroupID = self->_betaBuildGroupID;
  if (betaBuildGroupID) {
    [v3 setObject:betaBuildGroupID forKey:@"betaBuildGroupID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100327284((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_altDSID) {
    PBDataWriterWriteStringField();
  }
  if (self->_appleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_externalIDString) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_16:
  }
    PBDataWriterWriteUint64Field();
LABEL_17:
  if (self->_redownloadParams) {
    PBDataWriterWriteStringField();
  }
  if (self->_artworkURLString) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_itemName) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_messagesArtworkURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_packageDPInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_packageSINF) {
    PBDataWriterWriteDataField();
  }
  if (self->_packageURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_storeCohort) {
    PBDataWriterWriteStringField();
  }
  if (self->_storeFront) {
    PBDataWriterWriteStringField();
  }
  if (self->_vendorName) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_provisioningProfiles;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (self->_variantID) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x40) == 0)
    {
LABEL_52:
      if ((v11 & 0x100) == 0) {
        goto LABEL_53;
      }
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x40) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_53:
    if ((v11 & 0x80) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_54:
  }
    PBDataWriterWriteBOOLField();
LABEL_55:
  if (self->_bundleVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_manifestURLString) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_betaBuildGroupID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (uint64_t)v5;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[44] = self->_type;
    *((_WORD *)v5 + 104) |= 0x10u;
  }
  id v7 = [(NSString *)self->_altDSID copyWithZone:a3];
  v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  id v9 = [(NSString *)self->_appleID copyWithZone:a3];
  v10 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v9;

  id v11 = [(NSString *)self->_bundleID copyWithZone:a3];
  long long v12 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v11;

  if (*(_WORD *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_downloaderID;
    *(_WORD *)(v6 + 208) |= 1u;
  }
  id v13 = [(NSString *)self->_externalIDString copyWithZone:a3];
  long long v14 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v13;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_externalVersionID;
    *(_WORD *)(v6 + 208) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 24) = self->_itemID;
  *(_WORD *)(v6 + 208) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(void *)(v6 + 32) = self->_purchaserID;
    *(_WORD *)(v6 + 208) |= 8u;
  }
LABEL_9:
  id v16 = [(NSString *)self->_redownloadParams copyWithZone:a3];
  v17 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v16;

  id v18 = [(NSString *)self->_artworkURLString copyWithZone:a3];
  v19 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v18;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 200) = self->_containsMessagesExtension;
    *(_WORD *)(v6 + 208) |= 0x20u;
  }
  id v20 = [(NSString *)self->_itemName copyWithZone:a3];
  v21 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v20;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 204) = self->_launchProhibited;
    *(_WORD *)(v6 + 208) |= 0x200u;
  }
  id v22 = [(NSString *)self->_messagesArtworkURLString copyWithZone:a3];
  v23 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v22;

  id v24 = [(NSData *)self->_packageDPInfo copyWithZone:a3];
  v25 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v24;

  id v26 = [(NSData *)self->_packageSINF copyWithZone:a3];
  v27 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v26;

  id v28 = [(NSString *)self->_packageURLString copyWithZone:a3];
  v29 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v28;

  id v30 = [(NSString *)self->_storeCohort copyWithZone:a3];
  v31 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v30;

  id v32 = [(NSString *)self->_storeFront copyWithZone:a3];
  v33 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v32;

  id v34 = [(NSString *)self->_vendorName copyWithZone:a3];
  v35 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v34;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v36 = self->_provisioningProfiles;
  id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v53;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "copyWithZone:", a3, (void)v52);
        sub_100326BA8(v6, v41);
      }
      id v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v38);
  }

  id v42 = [(NSString *)self->_variantID copyWithZone:a3];
  v43 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v42;

  __int16 v44 = (__int16)self->_has;
  if ((v44 & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 205) = self->_skipIfInstalled;
    *(_WORD *)(v6 + 208) |= 0x400u;
    __int16 v44 = (__int16)self->_has;
    if ((v44 & 0x40) == 0)
    {
LABEL_22:
      if ((v44 & 0x100) == 0) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }
  else if ((v44 & 0x40) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v6 + 201) = self->_isBeta;
  *(_WORD *)(v6 + 208) |= 0x40u;
  __int16 v44 = (__int16)self->_has;
  if ((v44 & 0x100) == 0)
  {
LABEL_23:
    if ((v44 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  *(unsigned char *)(v6 + 203) = self->_isSystemApp;
  *(_WORD *)(v6 + 208) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_24:
    *(unsigned char *)(v6 + 202) = self->_isStoreApp;
    *(_WORD *)(v6 + 208) |= 0x80u;
  }
LABEL_25:
  id v45 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3, (void)v52);
  v46 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v45;

  id v47 = [(NSString *)self->_manifestURLString copyWithZone:a3];
  v48 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v47;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 206) = self->_suppressDialogs;
    *(_WORD *)(v6 + 208) |= 0x800u;
  }
  id v49 = [(NSString *)self->_betaBuildGroupID copyWithZone:a3];
  v50 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v49;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_117;
  }
  __int16 v5 = *((_WORD *)v4 + 104);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v5 & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 44)) {
      goto LABEL_117;
    }
  }
  else if ((v5 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 5) && !-[NSString isEqual:](altDSID, "isEqual:")) {
    goto LABEL_117;
  }
  appleID = self->_appleID;
  if ((unint64_t)appleID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](appleID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 104);
  if (has)
  {
    if ((v10 & 1) == 0 || self->_downloaderID != *((void *)v4 + 1)) {
      goto LABEL_117;
    }
  }
  else if (v10)
  {
    goto LABEL_117;
  }
  externalIDString = self->_externalIDString;
  if ((unint64_t)externalIDString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](externalIDString, "isEqual:")) {
      goto LABEL_117;
    }
    __int16 has = (__int16)self->_has;
    __int16 v10 = *((_WORD *)v4 + 104);
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_externalVersionID != *((void *)v4 + 2)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_itemID != *((void *)v4 + 3)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_purchaserID != *((void *)v4 + 4)) {
      goto LABEL_117;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_117;
  }
  redownloadParams = self->_redownloadParams;
  if ((unint64_t)redownloadParams | *((void *)v4 + 19)
    && !-[NSString isEqual:](redownloadParams, "isEqual:"))
  {
    goto LABEL_117;
  }
  artworkURLString = self->_artworkURLString;
  if ((unint64_t)artworkURLString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](artworkURLString, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 104);
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0) {
      goto LABEL_117;
    }
    if (self->_containsMessagesExtension)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_117;
  }
  itemName = self->_itemName;
  if ((unint64_t)itemName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](itemName, "isEqual:")) {
      goto LABEL_117;
    }
    __int16 v14 = (__int16)self->_has;
    __int16 v15 = *((_WORD *)v4 + 104);
  }
  if ((v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0) {
      goto LABEL_117;
    }
    if (self->_launchProhibited)
    {
      if (!*((unsigned char *)v4 + 204)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 204))
    {
      goto LABEL_117;
    }
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_117;
  }
  messagesArtworkURLString = self->_messagesArtworkURLString;
  if ((unint64_t)messagesArtworkURLString | *((void *)v4 + 14)
    && !-[NSString isEqual:](messagesArtworkURLString, "isEqual:"))
  {
    goto LABEL_117;
  }
  packageDPInfo = self->_packageDPInfo;
  if ((unint64_t)packageDPInfo | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](packageDPInfo, "isEqual:")) {
      goto LABEL_117;
    }
  }
  packageSINF = self->_packageSINF;
  if ((unint64_t)packageSINF | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](packageSINF, "isEqual:")) {
      goto LABEL_117;
    }
  }
  packageURLString = self->_packageURLString;
  if ((unint64_t)packageURLString | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](packageURLString, "isEqual:")) {
      goto LABEL_117;
    }
  }
  storeCohort = self->_storeCohort;
  if ((unint64_t)storeCohort | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](storeCohort, "isEqual:")) {
      goto LABEL_117;
    }
  }
  storeFront = self->_storeFront;
  if ((unint64_t)storeFront | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](storeFront, "isEqual:")) {
      goto LABEL_117;
    }
  }
  vendorName = self->_vendorName;
  if ((unint64_t)vendorName | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](vendorName, "isEqual:")) {
      goto LABEL_117;
    }
  }
  provisioningProfiles = self->_provisioningProfiles;
  if ((unint64_t)provisioningProfiles | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](provisioningProfiles, "isEqual:")) {
      goto LABEL_117;
    }
  }
  variantID = self->_variantID;
  if ((unint64_t)variantID | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](variantID, "isEqual:")) {
      goto LABEL_117;
    }
  }
  __int16 v26 = (__int16)self->_has;
  __int16 v27 = *((_WORD *)v4 + 104);
  if ((v26 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x400) == 0) {
      goto LABEL_117;
    }
    if (self->_skipIfInstalled)
    {
      if (!*((unsigned char *)v4 + 205)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 205))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 104) & 0x400) != 0)
  {
    goto LABEL_117;
  }
  if ((v26 & 0x40) != 0)
  {
    if ((v27 & 0x40) == 0) {
      goto LABEL_117;
    }
    if (self->_isBeta)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_117;
    }
  }
  else if ((v27 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x100) == 0) {
      goto LABEL_117;
    }
    if (self->_isSystemApp)
    {
      if (!*((unsigned char *)v4 + 203)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 203))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 104) & 0x100) != 0)
  {
    goto LABEL_117;
  }
  if ((v26 & 0x80) != 0)
  {
    if ((v27 & 0x80) == 0) {
      goto LABEL_117;
    }
    if (self->_isStoreApp)
    {
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_117;
      }
    }
    else if (*((unsigned char *)v4 + 202))
    {
      goto LABEL_117;
    }
  }
  else if ((v27 & 0x80) != 0)
  {
    goto LABEL_117;
  }
  bundleVersion = self->_bundleVersion;
  if ((unint64_t)bundleVersion | *((void *)v4 + 10)
    && !-[NSString isEqual:](bundleVersion, "isEqual:"))
  {
    goto LABEL_117;
  }
  manifestURLString = self->_manifestURLString;
  if ((unint64_t)manifestURLString | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](manifestURLString, "isEqual:")) {
      goto LABEL_117;
    }
  }
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 104) & 0x800) == 0) {
      goto LABEL_123;
    }
LABEL_117:
    unsigned __int8 v30 = 0;
    goto LABEL_118;
  }
  if ((*((_WORD *)v4 + 104) & 0x800) == 0) {
    goto LABEL_117;
  }
  if (!self->_suppressDialogs)
  {
    if (!*((unsigned char *)v4 + 206)) {
      goto LABEL_123;
    }
    goto LABEL_117;
  }
  if (!*((unsigned char *)v4 + 206)) {
    goto LABEL_117;
  }
LABEL_123:
  betaBuildGroupID = self->_betaBuildGroupID;
  if ((unint64_t)betaBuildGroupID | *((void *)v4 + 8)) {
    unsigned __int8 v30 = -[NSString isEqual:](betaBuildGroupID, "isEqual:");
  }
  else {
    unsigned __int8 v30 = 1;
  }
LABEL_118:

  return v30;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v35 = 2654435761 * self->_type;
  }
  else {
    uint64_t v35 = 0;
  }
  NSUInteger v34 = [(NSString *)self->_altDSID hash];
  NSUInteger v33 = [(NSString *)self->_appleID hash];
  NSUInteger v32 = [(NSString *)self->_bundleID hash];
  if (*(_WORD *)&self->_has) {
    unint64_t v31 = 2654435761u * self->_downloaderID;
  }
  else {
    unint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_externalIDString hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    unint64_t v29 = 0;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    unint64_t v28 = 0;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  unint64_t v29 = 2654435761u * self->_externalVersionID;
  if ((has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v28 = 2654435761u * self->_itemID;
  if ((has & 8) != 0)
  {
LABEL_10:
    unint64_t v27 = 2654435761u * self->_purchaserID;
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v27 = 0;
LABEL_14:
  NSUInteger v26 = [(NSString *)self->_redownloadParams hash];
  NSUInteger v25 = [(NSString *)self->_artworkURLString hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v24 = 2654435761 * self->_containsMessagesExtension;
  }
  else {
    uint64_t v24 = 0;
  }
  NSUInteger v23 = [(NSString *)self->_itemName hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v22 = 2654435761 * self->_launchProhibited;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_messagesArtworkURLString hash];
  unint64_t v20 = (unint64_t)[(NSData *)self->_packageDPInfo hash];
  unint64_t v19 = (unint64_t)[(NSData *)self->_packageSINF hash];
  NSUInteger v18 = [(NSString *)self->_packageURLString hash];
  NSUInteger v17 = [(NSString *)self->_storeCohort hash];
  NSUInteger v16 = [(NSString *)self->_storeFront hash];
  NSUInteger v15 = [(NSString *)self->_vendorName hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_provisioningProfiles hash];
  NSUInteger v5 = [(NSString *)self->_variantID hash];
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    uint64_t v7 = 2654435761 * self->_skipIfInstalled;
    if ((v6 & 0x40) != 0)
    {
LABEL_22:
      uint64_t v8 = 2654435761 * self->_isBeta;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v9 = 0;
      if ((v6 & 0x80) != 0) {
        goto LABEL_24;
      }
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((v6 & 0x40) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v9 = 2654435761 * self->_isSystemApp;
  if ((v6 & 0x80) != 0)
  {
LABEL_24:
    uint64_t v10 = 2654435761 * self->_isStoreApp;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
LABEL_29:
  NSUInteger v11 = [(NSString *)self->_bundleVersion hash];
  NSUInteger v12 = [(NSString *)self->_manifestURLString hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v13 = 2654435761 * self->_suppressDialogs;
  }
  else {
    uint64_t v13 = 0;
  }
  return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_betaBuildGroupID hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_redownloadParams, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_packageURLString, 0);
  objc_storeStrong((id *)&self->_packageSINF, 0);
  objc_storeStrong((id *)&self->_packageDPInfo, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURLString, 0);
  objc_storeStrong((id *)&self->_manifestURLString, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_externalIDString, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_betaBuildGroupID, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end