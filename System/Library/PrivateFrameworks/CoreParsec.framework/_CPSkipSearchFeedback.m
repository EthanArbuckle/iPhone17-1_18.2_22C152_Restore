@interface _CPSkipSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentId;
- (NSString)experimentNamespaceId;
- (NSString)input;
- (NSString)treatmentId;
- (_CPSkipSearchFeedback)init;
- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4;
- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4 experimentId:(id)a5 treatmentId:(id)a6;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setExperimentId:(id)a3;
- (void)setExperimentNamespaceId:(id)a3;
- (void)setInput:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSkipSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setExperimentNamespaceId:(id)a3
{
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
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
  NSUInteger v4 = [(NSString *)self->_input hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_triggerEvent;
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_experimentId hash];
  NSUInteger v7 = [(NSString *)self->_treatmentId hash];
  return v6 ^ v7 ^ [(NSString *)self->_experimentNamespaceId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_24;
  }
  NSUInteger v6 = [(_CPSkipSearchFeedback *)self input];
  NSUInteger v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v8 = [(_CPSkipSearchFeedback *)self input];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPSkipSearchFeedback *)self input];
    v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_24;
  }
  NSUInteger v6 = [(_CPSkipSearchFeedback *)self experimentId];
  NSUInteger v7 = [v4 experimentId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v14 = [(_CPSkipSearchFeedback *)self experimentId];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_CPSkipSearchFeedback *)self experimentId];
    v17 = [v4 experimentId];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPSkipSearchFeedback *)self treatmentId];
  NSUInteger v7 = [v4 treatmentId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_23;
  }
  uint64_t v19 = [(_CPSkipSearchFeedback *)self treatmentId];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPSkipSearchFeedback *)self treatmentId];
    v22 = [v4 treatmentId];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_CPSkipSearchFeedback *)self experimentNamespaceId];
  NSUInteger v7 = [v4 experimentNamespaceId];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v24 = [(_CPSkipSearchFeedback *)self experimentNamespaceId];
  if (!v24)
  {

LABEL_27:
    BOOL v29 = 1;
    goto LABEL_25;
  }
  v25 = (void *)v24;
  v26 = [(_CPSkipSearchFeedback *)self experimentNamespaceId];
  v27 = [v4 experimentNamespaceId];
  char v28 = [v26 isEqual:v27];

  if (v28) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_CPSkipSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPSkipSearchFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPSkipSearchFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v5 = [(_CPSkipSearchFeedback *)self experimentId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(_CPSkipSearchFeedback *)self treatmentId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v7 = [(_CPSkipSearchFeedback *)self experimentNamespaceId];

  uint64_t v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    uint64_t v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSkipSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSkipSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSkipSearchFeedback;
  v2 = [(_CPSkipSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSkipSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4 experimentId:(id)a5 treatmentId:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  int v12 = [(_CPSkipSearchFeedback *)self initWithTriggerEvent:v8 input:a4];
  v13 = v12;
  if (v12)
  {
    [(_CPSkipSearchFeedback *)v12 setExperimentId:v10];
    [(_CPSkipSearchFeedback *)v13 setTreatmentId:v11];
    uint64_t v14 = v13;
  }

  return v13;
}

- (_CPSkipSearchFeedback)initWithTriggerEvent:(int)a3 input:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  NSUInteger v7 = [(_CPSkipSearchFeedback *)self init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(_CPSkipSearchFeedback *)v7 setTriggerEvent:v4];
    [(_CPSkipSearchFeedback *)v8 setInput:v6];
    id v9 = v8;
  }

  return v8;
}

@end