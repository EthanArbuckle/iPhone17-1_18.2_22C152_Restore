@interface _CPUsageEnvelope
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuidBytes;
- (_CPDeviceContext)context;
- (_CPImagesUsagePropensity)imagesUsagePropensity;
- (_CPNewsUsagePropensity)newsUsagePropensity;
- (_CPSafariUsagePropensity)safariUsagePropensity;
- (_CPSpotlightUsagePropensity)spotlightUsagePropensity;
- (_CPUsageSinceLookback)usageSinceLookback;
- (int)configuredLookbackTimeInDays;
- (int)totalSessions;
- (int64_t)collectionEndTimestamp;
- (int64_t)collectionStartTimestamp;
- (unint64_t)hash;
- (unint64_t)whichKind;
- (void)clearKind;
- (void)setCollectionEndTimestamp:(int64_t)a3;
- (void)setCollectionStartTimestamp:(int64_t)a3;
- (void)setConfiguredLookbackTimeInDays:(int)a3;
- (void)setContext:(id)a3;
- (void)setImagesUsagePropensity:(id)a3;
- (void)setNewsUsagePropensity:(id)a3;
- (void)setSafariUsagePropensity:(id)a3;
- (void)setSpotlightUsagePropensity:(id)a3;
- (void)setTotalSessions:(int)a3;
- (void)setUsageSinceLookback:(id)a3;
- (void)setUuidBytes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPUsageEnvelope

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidBytes, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_newsUsagePropensity, 0);
  objc_storeStrong((id *)&self->_imagesUsagePropensity, 0);
  objc_storeStrong((id *)&self->_spotlightUsagePropensity, 0);
  objc_storeStrong((id *)&self->_safariUsagePropensity, 0);

  objc_storeStrong((id *)&self->_usageSinceLookback, 0);
}

- (unint64_t)whichKind
{
  return self->_whichKind;
}

- (void)setUuidBytes:(id)a3
{
}

- (NSData)uuidBytes
{
  return self->_uuidBytes;
}

- (void)setContext:(id)a3
{
}

- (_CPDeviceContext)context
{
  return self->_context;
}

- (void)setTotalSessions:(int)a3
{
  self->_totalSessions = a3;
}

- (int)totalSessions
{
  return self->_totalSessions;
}

- (void)setConfiguredLookbackTimeInDays:(int)a3
{
  self->_configuredLookbackTimeInDays = a3;
}

- (int)configuredLookbackTimeInDays
{
  return self->_configuredLookbackTimeInDays;
}

- (void)setCollectionEndTimestamp:(int64_t)a3
{
  self->_collectionEndTimestamp = a3;
}

- (int64_t)collectionEndTimestamp
{
  return self->_collectionEndTimestamp;
}

- (void)setCollectionStartTimestamp:(int64_t)a3
{
  self->_collectionStartTimestamp = a3;
}

- (int64_t)collectionStartTimestamp
{
  return self->_collectionStartTimestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_CPUsageSinceLookback *)self->_usageSinceLookback hash];
  unint64_t v4 = [(_CPSafariUsagePropensity *)self->_safariUsagePropensity hash] ^ v3;
  unint64_t v5 = [(_CPSpotlightUsagePropensity *)self->_spotlightUsagePropensity hash];
  unint64_t v6 = v4 ^ v5 ^ [(_CPImagesUsagePropensity *)self->_imagesUsagePropensity hash];
  unint64_t v7 = v6 ^ [(_CPNewsUsagePropensity *)self->_newsUsagePropensity hash] ^ (2654435761
                                                                                * self->_collectionStartTimestamp) ^ (2654435761 * self->_collectionEndTimestamp) ^ (2654435761 * self->_configuredLookbackTimeInDays);
  uint64_t v8 = 2654435761 * self->_totalSessions;
  unint64_t v9 = v8 ^ [(_CPDeviceContext *)self->_context hash];
  return v7 ^ v9 ^ [(NSData *)self->_uuidBytes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self usageSinceLookback];
  unint64_t v6 = [v4 usageSinceLookback];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(_CPUsageEnvelope *)self usageSinceLookback];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_CPUsageEnvelope *)self usageSinceLookback];
    v10 = [v4 usageSinceLookback];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self safariUsagePropensity];
  unint64_t v6 = [v4 safariUsagePropensity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v12 = [(_CPUsageEnvelope *)self safariUsagePropensity];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPUsageEnvelope *)self safariUsagePropensity];
    v15 = [v4 safariUsagePropensity];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self spotlightUsagePropensity];
  unint64_t v6 = [v4 spotlightUsagePropensity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v17 = [(_CPUsageEnvelope *)self spotlightUsagePropensity];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_CPUsageEnvelope *)self spotlightUsagePropensity];
    v20 = [v4 spotlightUsagePropensity];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self imagesUsagePropensity];
  unint64_t v6 = [v4 imagesUsagePropensity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v22 = [(_CPUsageEnvelope *)self imagesUsagePropensity];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_CPUsageEnvelope *)self imagesUsagePropensity];
    v25 = [v4 imagesUsagePropensity];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self newsUsagePropensity];
  unint64_t v6 = [v4 newsUsagePropensity];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v27 = [(_CPUsageEnvelope *)self newsUsagePropensity];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_CPUsageEnvelope *)self newsUsagePropensity];
    v30 = [v4 newsUsagePropensity];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int64_t collectionStartTimestamp = self->_collectionStartTimestamp;
  if (collectionStartTimestamp != [v4 collectionStartTimestamp]) {
    goto LABEL_41;
  }
  int64_t collectionEndTimestamp = self->_collectionEndTimestamp;
  if (collectionEndTimestamp != [v4 collectionEndTimestamp]) {
    goto LABEL_41;
  }
  int configuredLookbackTimeInDays = self->_configuredLookbackTimeInDays;
  if (configuredLookbackTimeInDays != [v4 configuredLookbackTimeInDays]) {
    goto LABEL_41;
  }
  int totalSessions = self->_totalSessions;
  if (totalSessions != [v4 totalSessions]) {
    goto LABEL_41;
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self context];
  unint64_t v6 = [v4 context];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v36 = [(_CPUsageEnvelope *)self context];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_CPUsageEnvelope *)self context];
    v39 = [v4 context];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_CPUsageEnvelope *)self uuidBytes];
  unint64_t v6 = [v4 uuidBytes];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v41 = [(_CPUsageEnvelope *)self uuidBytes];
    if (!v41)
    {

LABEL_44:
      BOOL v46 = 1;
      goto LABEL_42;
    }
    v42 = (void *)v41;
    v43 = [(_CPUsageEnvelope *)self uuidBytes];
    v44 = [v4 uuidBytes];
    char v45 = [v43 isEqual:v44];

    if (v45) {
      goto LABEL_44;
    }
  }
  else
  {
LABEL_40:
  }
LABEL_41:
  BOOL v46 = 0;
LABEL_42:

  return v46;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(_CPUsageEnvelope *)self usageSinceLookback];

  if (v4)
  {
    unint64_t v5 = [(_CPUsageEnvelope *)self usageSinceLookback];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(_CPUsageEnvelope *)self safariUsagePropensity];

  if (v6)
  {
    uint64_t v7 = [(_CPUsageEnvelope *)self safariUsagePropensity];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(_CPUsageEnvelope *)self spotlightUsagePropensity];

  if (v8)
  {
    unint64_t v9 = [(_CPUsageEnvelope *)self spotlightUsagePropensity];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_CPUsageEnvelope *)self imagesUsagePropensity];

  if (v10)
  {
    int v11 = [(_CPUsageEnvelope *)self imagesUsagePropensity];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_CPUsageEnvelope *)self newsUsagePropensity];

  if (v12)
  {
    v13 = [(_CPUsageEnvelope *)self newsUsagePropensity];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPUsageEnvelope *)self collectionStartTimestamp]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_CPUsageEnvelope *)self collectionEndTimestamp]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_CPUsageEnvelope *)self configuredLookbackTimeInDays]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPUsageEnvelope *)self totalSessions]) {
    PBDataWriterWriteInt32Field();
  }
  v14 = [(_CPUsageEnvelope *)self context];

  if (v14)
  {
    v15 = [(_CPUsageEnvelope *)self context];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_CPUsageEnvelope *)self uuidBytes];

  uint64_t v17 = v18;
  if (v16)
  {
    PBDataWriterWriteDataField();
    uint64_t v17 = v18;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPUsageEnvelopeReadFrom(self, (uint64_t)a3);
}

- (_CPNewsUsagePropensity)newsUsagePropensity
{
  if (self->_whichKind == 5) {
    v2 = self->_newsUsagePropensity;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setNewsUsagePropensity:(id)a3
{
  id v4 = (_CPNewsUsagePropensity *)a3;
  [(_CPUsageEnvelope *)self clearKind];
  unint64_t v5 = 5;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichKind = v5;
  newsUsagePropensity = self->_newsUsagePropensity;
  self->_newsUsagePropensity = v4;
}

- (_CPImagesUsagePropensity)imagesUsagePropensity
{
  if (self->_whichKind == 4) {
    v2 = self->_imagesUsagePropensity;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setImagesUsagePropensity:(id)a3
{
  id v4 = (_CPImagesUsagePropensity *)a3;
  [(_CPUsageEnvelope *)self clearKind];
  self->_whichKind = 4 * (v4 != 0);
  imagesUsagePropensity = self->_imagesUsagePropensity;
  self->_imagesUsagePropensity = v4;
}

- (_CPSpotlightUsagePropensity)spotlightUsagePropensity
{
  if (self->_whichKind == 3) {
    v2 = self->_spotlightUsagePropensity;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setSpotlightUsagePropensity:(id)a3
{
  id v4 = (_CPSpotlightUsagePropensity *)a3;
  [(_CPUsageEnvelope *)self clearKind];
  unint64_t v5 = 3;
  if (!v4) {
    unint64_t v5 = 0;
  }
  self->_whichKind = v5;
  spotlightUsagePropensity = self->_spotlightUsagePropensity;
  self->_spotlightUsagePropensity = v4;
}

- (_CPSafariUsagePropensity)safariUsagePropensity
{
  if (self->_whichKind == 2) {
    v2 = self->_safariUsagePropensity;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setSafariUsagePropensity:(id)a3
{
  id v4 = (_CPSafariUsagePropensity *)a3;
  [(_CPUsageEnvelope *)self clearKind];
  self->_whichKind = 2 * (v4 != 0);
  safariUsagePropensity = self->_safariUsagePropensity;
  self->_safariUsagePropensity = v4;
}

- (_CPUsageSinceLookback)usageSinceLookback
{
  if (self->_whichKind == 1) {
    v2 = self->_usageSinceLookback;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setUsageSinceLookback:(id)a3
{
  id v4 = (_CPUsageSinceLookback *)a3;
  [(_CPUsageEnvelope *)self clearKind];
  self->_whichKind = v4 != 0;
  usageSinceLookback = self->_usageSinceLookback;
  self->_usageSinceLookback = v4;
}

- (void)clearKind
{
  self->_whichKind = 0;
  usageSinceLookback = self->_usageSinceLookback;
  self->_usageSinceLookback = 0;

  safariUsagePropensity = self->_safariUsagePropensity;
  self->_safariUsagePropensity = 0;

  spotlightUsagePropensity = self->_spotlightUsagePropensity;
  self->_spotlightUsagePropensity = 0;

  imagesUsagePropensity = self->_imagesUsagePropensity;
  self->_imagesUsagePropensity = 0;

  newsUsagePropensity = self->_newsUsagePropensity;
  self->_newsUsagePropensity = 0;
}

@end