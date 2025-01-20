@interface _CPCardSectionFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cardSectionId;
- (NSString)resultId;
- (_CPCardSectionFeedback)init;
- (_CPCardSectionFeedback)initWithFacade:(id)a3;
- (_CPCardSectionForFeedback)cardSection;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setCardSection:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setResultId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardSectionFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);

  objc_storeStrong((id *)&self->_cardSection, 0);
}

- (void)setResultId:(id)a3
{
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSection:(id)a3
{
}

- (_CPCardSectionForFeedback)cardSection
{
  return self->_cardSection;
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
  unint64_t v4 = [(_CPCardSectionForFeedback *)self->_cardSection hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_cardSectionId hash];
  return v5 ^ [(NSString *)self->_resultId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_18;
  }
  v6 = [(_CPCardSectionFeedback *)self cardSection];
  v7 = [v4 cardSection];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(_CPCardSectionFeedback *)self cardSection];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPCardSectionFeedback *)self cardSection];
    v11 = [v4 cardSection];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_CPCardSectionFeedback *)self cardSectionId];
  v7 = [v4 cardSectionId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(_CPCardSectionFeedback *)self cardSectionId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPCardSectionFeedback *)self cardSectionId];
    v16 = [v4 cardSectionId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v6 = [(_CPCardSectionFeedback *)self resultId];
  v7 = [v4 resultId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v18 = [(_CPCardSectionFeedback *)self resultId];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(_CPCardSectionFeedback *)self resultId];
    v21 = [v4 resultId];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_CPCardSectionFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPCardSectionFeedback *)self cardSection];

  if (v4)
  {
    NSUInteger v5 = [(_CPCardSectionFeedback *)self cardSection];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(_CPCardSectionFeedback *)self cardSectionId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  v7 = [(_CPCardSectionFeedback *)self resultId];

  uint64_t v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    uint64_t v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardSectionFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCardSectionFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCardSectionFeedback;
  v2 = [(_CPCardSectionFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCardSectionFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPCardSectionFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CPCardSectionFeedback;
  objc_super v5 = [(_CPCardSectionFeedback *)&v16 init];
  if (v5)
  {
    -[_CPCardSectionFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 cardSection];

    if (v6)
    {
      v7 = [_CPCardSectionForFeedback alloc];
      uint64_t v8 = [v4 cardSection];
      id v9 = [(_CPCardSectionForFeedback *)v7 initWithFacade:v8];
      [(_CPCardSectionFeedback *)v5 setCardSection:v9];
    }
    v10 = [v4 cardSectionId];

    if (v10)
    {
      v11 = [v4 cardSectionId];
      [(_CPCardSectionFeedback *)v5 setCardSectionId:v11];
    }
    int v12 = [v4 resultId];

    if (v12)
    {
      uint64_t v13 = [v4 resultId];
      [(_CPCardSectionFeedback *)v5 setResultId:v13];
    }
    v14 = v5;
  }

  return v5;
}

@end