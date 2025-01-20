@interface _CPEndLocalSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uuid;
- (_CPEndLocalSearchFeedback)init;
- (_CPEndLocalSearchFeedback)initWithFacade:(id)a3;
- (_CPPhotosRankingInfo)photosRankingInfo;
- (_CPQueryUnderstandingParse)quParse;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)coreSpotlightIndexCount;
- (unsigned)l1ToL2ResultCount;
- (void)setCoreSpotlightIndexCount:(unsigned int)a3;
- (void)setL1ToL2ResultCount:(unsigned int)a3;
- (void)setPhotosRankingInfo:(id)a3;
- (void)setQuParse:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPEndLocalSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosRankingInfo, 0);
  objc_storeStrong((id *)&self->_quParse, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setPhotosRankingInfo:(id)a3
{
}

- (_CPPhotosRankingInfo)photosRankingInfo
{
  return self->_photosRankingInfo;
}

- (void)setCoreSpotlightIndexCount:(unsigned int)a3
{
  self->_coreSpotlightIndexCount = a3;
}

- (unsigned)coreSpotlightIndexCount
{
  return self->_coreSpotlightIndexCount;
}

- (void)setL1ToL2ResultCount:(unsigned int)a3
{
  self->_l1ToL2ResultCount = a3;
}

- (unsigned)l1ToL2ResultCount
{
  return self->_l1ToL2ResultCount;
}

- (void)setQuParse:(id)a3
{
}

- (_CPQueryUnderstandingParse)quParse
{
  return self->_quParse;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_timestamp;
  NSUInteger v4 = [(NSString *)self->_uuid hash];
  unint64_t v5 = v4 ^ [(_CPQueryUnderstandingParse *)self->_quParse hash] ^ (2654435761 * self->_l1ToL2ResultCount) ^ v3;
  uint64_t v6 = 2654435761 * self->_coreSpotlightIndexCount;
  return v5 ^ v6 ^ [(_CPPhotosRankingInfo *)self->_photosRankingInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_20;
  }
  uint64_t v6 = [(_CPEndLocalSearchFeedback *)self uuid];
  v7 = [v4 uuid];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(_CPEndLocalSearchFeedback *)self uuid];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPEndLocalSearchFeedback *)self uuid];
    v11 = [v4 uuid];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPEndLocalSearchFeedback *)self quParse];
  v7 = [v4 quParse];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(_CPEndLocalSearchFeedback *)self quParse];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPEndLocalSearchFeedback *)self quParse];
    v16 = [v4 quParse];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unsigned int l1ToL2ResultCount = self->_l1ToL2ResultCount;
  if (l1ToL2ResultCount != [v4 l1ToL2ResultCount]) {
    goto LABEL_20;
  }
  unsigned int coreSpotlightIndexCount = self->_coreSpotlightIndexCount;
  if (coreSpotlightIndexCount != [v4 coreSpotlightIndexCount]) {
    goto LABEL_20;
  }
  uint64_t v6 = [(_CPEndLocalSearchFeedback *)self photosRankingInfo];
  v7 = [v4 photosRankingInfo];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v20 = [(_CPEndLocalSearchFeedback *)self photosRankingInfo];
    if (!v20)
    {

LABEL_23:
      BOOL v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    v22 = [(_CPEndLocalSearchFeedback *)self photosRankingInfo];
    v23 = [v4 photosRankingInfo];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v25 = 0;
LABEL_21:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_CPEndLocalSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPEndLocalSearchFeedback *)self uuid];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  unint64_t v5 = [(_CPEndLocalSearchFeedback *)self quParse];

  if (v5)
  {
    uint64_t v6 = [(_CPEndLocalSearchFeedback *)self quParse];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPEndLocalSearchFeedback *)self l1ToL2ResultCount]) {
    PBDataWriterWriteUint32Field();
  }
  if ([(_CPEndLocalSearchFeedback *)self coreSpotlightIndexCount]) {
    PBDataWriterWriteUint32Field();
  }
  v7 = [(_CPEndLocalSearchFeedback *)self photosRankingInfo];

  if (v7)
  {
    uint64_t v8 = [(_CPEndLocalSearchFeedback *)self photosRankingInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPEndLocalSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPEndLocalSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPEndLocalSearchFeedback;
  v2 = [(_CPEndLocalSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPEndLocalSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPEndLocalSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPEndLocalSearchFeedback;
  objc_super v5 = [(_CPEndLocalSearchFeedback *)&v18 init];
  if (v5)
  {
    -[_CPEndLocalSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    uint64_t v6 = [v4 uuid];

    if (v6)
    {
      v7 = [v4 uuid];
      [(_CPEndLocalSearchFeedback *)v5 setUuid:v7];
    }
    uint64_t v8 = [v4 quParse];

    if (v8)
    {
      id v9 = [_CPQueryUnderstandingParse alloc];
      v10 = [v4 quParse];
      v11 = [(_CPQueryUnderstandingParse *)v9 initWithFacade:v10];
      [(_CPEndLocalSearchFeedback *)v5 setQuParse:v11];
    }
    -[_CPEndLocalSearchFeedback setL1ToL2ResultCount:](v5, "setL1ToL2ResultCount:", [v4 l1ToL2ResultCount]);
    -[_CPEndLocalSearchFeedback setCoreSpotlightIndexCount:](v5, "setCoreSpotlightIndexCount:", [v4 coreSpotlightIndexCount]);
    int v12 = [v4 photosRankingInfo];

    if (v12)
    {
      uint64_t v13 = [_CPPhotosRankingInfo alloc];
      v14 = [v4 photosRankingInfo];
      v15 = [(_CPPhotosRankingInfo *)v13 initWithFacade:v14];
      [(_CPEndLocalSearchFeedback *)v5 setPhotosRankingInfo:v15];
    }
    v16 = v5;
  }

  return v5;
}

@end