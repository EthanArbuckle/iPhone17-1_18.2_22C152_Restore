@interface CPLSuggestionAsset
- (BOOL)hasActionData;
- (BOOL)hasAssetFlag;
- (BOOL)hasAssetIdentifier;
- (BOOL)hasMasterFingerprint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CPLSuggestionAssetFlag)assetFlag;
- (NSData)actionData;
- (NSString)assetIdentifier;
- (NSString)masterFingerprint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionData:(id)a3;
- (void)setAssetFlag:(id)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setMasterFingerprint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLSuggestionAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetFlag, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
}

- (void)setMasterFingerprint:(id)a3
{
}

- (NSString)masterFingerprint
{
  return self->_masterFingerprint;
}

- (void)setActionData:(id)a3
{
}

- (NSData)actionData
{
  return self->_actionData;
}

- (void)setAssetFlag:(id)a3
{
}

- (CPLSuggestionAssetFlag)assetFlag
{
  return self->_assetFlag;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[CPLSuggestionAsset setAssetIdentifier:](self, "setAssetIdentifier:");
    v4 = v7;
  }
  assetFlag = self->_assetFlag;
  uint64_t v6 = v4[2];
  if (assetFlag)
  {
    if (!v6) {
      goto LABEL_9;
    }
    assetFlag = (CPLSuggestionAssetFlag *)-[CPLSuggestionAssetFlag mergeFrom:](assetFlag, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    assetFlag = (CPLSuggestionAssetFlag *)-[CPLSuggestionAsset setAssetFlag:](self, "setAssetFlag:");
  }
  v4 = v7;
LABEL_9:
  if (v4[1])
  {
    assetFlag = (CPLSuggestionAssetFlag *)-[CPLSuggestionAsset setActionData:](self, "setActionData:");
    v4 = v7;
  }
  if (v4[4])
  {
    assetFlag = (CPLSuggestionAssetFlag *)-[CPLSuggestionAsset setMasterFingerprint:](self, "setMasterFingerprint:");
    v4 = v7;
  }
  MEMORY[0x1F41817F8](assetFlag, v4);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetIdentifier hash];
  unint64_t v4 = [(CPLSuggestionAssetFlag *)self->_assetFlag hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_actionData hash];
  return v4 ^ v5 ^ [(NSString *)self->_masterFingerprint hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assetIdentifier = self->_assetIdentifier, !((unint64_t)assetIdentifier | v4[3]))
     || -[NSString isEqual:](assetIdentifier, "isEqual:"))
    && ((assetFlag = self->_assetFlag, !((unint64_t)assetFlag | v4[2]))
     || -[CPLSuggestionAssetFlag isEqual:](assetFlag, "isEqual:"))
    && ((actionData = self->_actionData, !((unint64_t)actionData | v4[1]))
     || -[NSData isEqual:](actionData, "isEqual:")))
  {
    masterFingerprint = self->_masterFingerprint;
    if ((unint64_t)masterFingerprint | v4[4]) {
      char v9 = -[NSString isEqual:](masterFingerprint, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_assetIdentifier copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(CPLSuggestionAssetFlag *)self->_assetFlag copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_actionData copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_masterFingerprint copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_assetIdentifier)
  {
    objc_msgSend(v4, "setAssetIdentifier:");
    id v4 = v5;
  }
  if (self->_assetFlag)
  {
    objc_msgSend(v5, "setAssetFlag:");
    id v4 = v5;
  }
  if (self->_actionData)
  {
    objc_msgSend(v5, "setActionData:");
    id v4 = v5;
  }
  if (self->_masterFingerprint)
  {
    objc_msgSend(v5, "setMasterFingerprint:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_assetIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_assetFlag)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_actionData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_masterFingerprint)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  assetIdentifier = self->_assetIdentifier;
  if (assetIdentifier) {
    [v3 setObject:assetIdentifier forKey:@"assetIdentifier"];
  }
  assetFlag = self->_assetFlag;
  if (assetFlag)
  {
    v7 = [(CPLSuggestionAssetFlag *)assetFlag dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"assetFlag"];
  }
  actionData = self->_actionData;
  if (actionData) {
    [v4 setObject:actionData forKey:@"actionData"];
  }
  masterFingerprint = self->_masterFingerprint;
  if (masterFingerprint) {
    [v4 setObject:masterFingerprint forKey:@"masterFingerprint"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLSuggestionAsset;
  id v4 = [(CPLSuggestionAsset *)&v8 description];
  id v5 = [(CPLSuggestionAsset *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMasterFingerprint
{
  return self->_masterFingerprint != 0;
}

- (BOOL)hasActionData
{
  return self->_actionData != 0;
}

- (BOOL)hasAssetFlag
{
  return self->_assetFlag != 0;
}

- (BOOL)hasAssetIdentifier
{
  return self->_assetIdentifier != 0;
}

@end