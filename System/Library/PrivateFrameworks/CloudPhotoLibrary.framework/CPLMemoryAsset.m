@interface CPLMemoryAsset
- (BOOL)hasAssetFlag;
- (BOOL)hasAssetIdentifier;
- (BOOL)hasAssetMovieData;
- (BOOL)hasMasterFingerprint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CPLMemoryAssetFlag)assetFlag;
- (NSData)assetMovieData;
- (NSString)assetIdentifier;
- (NSString)masterFingerprint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetFlag:(id)a3;
- (void)setAssetIdentifier:(id)a3;
- (void)setAssetMovieData:(id)a3;
- (void)setMasterFingerprint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLMemoryAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterFingerprint, 0);
  objc_storeStrong((id *)&self->_assetMovieData, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetFlag, 0);
}

- (void)setMasterFingerprint:(id)a3
{
}

- (NSString)masterFingerprint
{
  return self->_masterFingerprint;
}

- (void)setAssetMovieData:(id)a3
{
}

- (NSData)assetMovieData
{
  return self->_assetMovieData;
}

- (void)setAssetFlag:(id)a3
{
}

- (CPLMemoryAssetFlag)assetFlag
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
  if (v4[2])
  {
    -[CPLMemoryAsset setAssetIdentifier:](self, "setAssetIdentifier:");
    v4 = v7;
  }
  assetFlag = self->_assetFlag;
  uint64_t v6 = v4[1];
  if (assetFlag)
  {
    if (!v6) {
      goto LABEL_9;
    }
    assetFlag = (CPLMemoryAssetFlag *)-[CPLMemoryAssetFlag mergeFrom:](assetFlag, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    assetFlag = (CPLMemoryAssetFlag *)-[CPLMemoryAsset setAssetFlag:](self, "setAssetFlag:");
  }
  v4 = v7;
LABEL_9:
  if (v4[3])
  {
    assetFlag = (CPLMemoryAssetFlag *)-[CPLMemoryAsset setAssetMovieData:](self, "setAssetMovieData:");
    v4 = v7;
  }
  if (v4[4])
  {
    assetFlag = (CPLMemoryAssetFlag *)-[CPLMemoryAsset setMasterFingerprint:](self, "setMasterFingerprint:");
    v4 = v7;
  }
  MEMORY[0x1F41817F8](assetFlag, v4);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetIdentifier hash];
  unint64_t v4 = [(CPLMemoryAssetFlag *)self->_assetFlag hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_assetMovieData hash];
  return v4 ^ v5 ^ [(NSString *)self->_masterFingerprint hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assetIdentifier = self->_assetIdentifier, !((unint64_t)assetIdentifier | v4[2]))
     || -[NSString isEqual:](assetIdentifier, "isEqual:"))
    && ((assetFlag = self->_assetFlag, !((unint64_t)assetFlag | v4[1]))
     || -[CPLMemoryAssetFlag isEqual:](assetFlag, "isEqual:"))
    && ((assetMovieData = self->_assetMovieData, !((unint64_t)assetMovieData | v4[3]))
     || -[NSData isEqual:](assetMovieData, "isEqual:")))
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
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(CPLMemoryAssetFlag *)self->_assetFlag copyWithZone:a3];
  char v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_assetMovieData copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

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
  if (self->_assetMovieData)
  {
    objc_msgSend(v5, "setAssetMovieData:");
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
  if (self->_assetMovieData)
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
  return CPLMemoryAssetReadFrom((uint64_t)self, (uint64_t)a3);
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
    v7 = [(CPLMemoryAssetFlag *)assetFlag dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"assetFlag"];
  }
  assetMovieData = self->_assetMovieData;
  if (assetMovieData) {
    [v4 setObject:assetMovieData forKey:@"assetMovieData"];
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
  v8.super_class = (Class)CPLMemoryAsset;
  id v4 = [(CPLMemoryAsset *)&v8 description];
  id v5 = [(CPLMemoryAsset *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMasterFingerprint
{
  return self->_masterFingerprint != 0;
}

- (BOOL)hasAssetMovieData
{
  return self->_assetMovieData != 0;
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