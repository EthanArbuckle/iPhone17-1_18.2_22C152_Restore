@interface _CPLookupHintRelevancyFeedback
- (BOOL)discarded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)context;
- (NSString)domain;
- (_CPLookupHintRelevancyFeedback)init;
- (_CPLookupHintRelevancyFeedback)initWithFacade:(id)a3;
- (_CPRange)hintRange;
- (int)grade;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setContext:(id)a3;
- (void)setDiscarded:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setGrade:(int)a3;
- (void)setHintRange:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPLookupHintRelevancyFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_hintRange, 0);
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setGrade:(int)a3
{
  self->_grade = a3;
}

- (int)grade
{
  return self->_grade;
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setHintRange:(id)a3
{
}

- (_CPRange)hintRange
{
  return self->_hintRange;
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
  unint64_t v4 = [(_CPRange *)self->_hintRange hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_domain hash] ^ (2654435761 * self->_discarded) ^ v3;
  uint64_t v6 = 2654435761 * self->_grade;
  return v5 ^ v6 ^ [(NSString *)self->_context hash];
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
  uint64_t v6 = [(_CPLookupHintRelevancyFeedback *)self hintRange];
  v7 = [v4 hintRange];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v8 = [(_CPLookupHintRelevancyFeedback *)self hintRange];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPLookupHintRelevancyFeedback *)self hintRange];
    v11 = [v4 hintRange];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v6 = [(_CPLookupHintRelevancyFeedback *)self domain];
  v7 = [v4 domain];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_19;
  }
  uint64_t v13 = [(_CPLookupHintRelevancyFeedback *)self domain];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(_CPLookupHintRelevancyFeedback *)self domain];
    v16 = [v4 domain];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int discarded = self->_discarded;
  if (discarded != [v4 discarded]) {
    goto LABEL_20;
  }
  int grade = self->_grade;
  if (grade != [v4 grade]) {
    goto LABEL_20;
  }
  uint64_t v6 = [(_CPLookupHintRelevancyFeedback *)self context];
  v7 = [v4 context];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v20 = [(_CPLookupHintRelevancyFeedback *)self context];
    if (!v20)
    {

LABEL_23:
      BOOL v25 = 1;
      goto LABEL_21;
    }
    v21 = (void *)v20;
    v22 = [(_CPLookupHintRelevancyFeedback *)self context];
    v23 = [v4 context];
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
  if ([(_CPLookupHintRelevancyFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPLookupHintRelevancyFeedback *)self hintRange];

  if (v4)
  {
    NSUInteger v5 = [(_CPLookupHintRelevancyFeedback *)self hintRange];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(_CPLookupHintRelevancyFeedback *)self domain];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPLookupHintRelevancyFeedback *)self discarded]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPLookupHintRelevancyFeedback *)self grade]) {
    PBDataWriterWriteInt32Field();
  }
  v7 = [(_CPLookupHintRelevancyFeedback *)self context];

  uint64_t v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    uint64_t v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPLookupHintRelevancyFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPLookupHintRelevancyFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPLookupHintRelevancyFeedback;
  v2 = [(_CPLookupHintRelevancyFeedback *)&v5 init];
  if (v2)
  {
    [(_CPLookupHintRelevancyFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPLookupHintRelevancyFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPLookupHintRelevancyFeedback;
  objc_super v5 = [(_CPLookupHintRelevancyFeedback *)&v18 init];
  if (v5)
  {
    -[_CPLookupHintRelevancyFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    uint64_t v6 = objc_alloc_init(_CPRange);
    [(_CPLookupHintRelevancyFeedback *)v5 setHintRange:v6];

    uint64_t v7 = [v4 hintRange];
    uint64_t v8 = [(_CPLookupHintRelevancyFeedback *)v5 hintRange];
    [v8 setLocation:v7];

    [v4 hintRange];
    uint64_t v10 = v9;
    v11 = [(_CPLookupHintRelevancyFeedback *)v5 hintRange];
    [v11 setLength:v10];

    int v12 = [v4 domain];

    if (v12)
    {
      uint64_t v13 = [v4 domain];
      [(_CPLookupHintRelevancyFeedback *)v5 setDomain:v13];
    }
    -[_CPLookupHintRelevancyFeedback setDiscarded:](v5, "setDiscarded:", [v4 discarded]);
    -[_CPLookupHintRelevancyFeedback setGrade:](v5, "setGrade:", [v4 grade]);
    v14 = [v4 context];

    if (v14)
    {
      v15 = [v4 context];
      [(_CPLookupHintRelevancyFeedback *)v5 setContext:v15];
    }
    v16 = v5;
  }

  return v5;
}

@end