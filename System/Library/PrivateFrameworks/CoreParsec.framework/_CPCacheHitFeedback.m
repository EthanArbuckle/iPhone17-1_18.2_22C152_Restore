@interface _CPCacheHitFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)input;
- (NSString)uuid;
- (_CPCacheHitFeedback)init;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setInput:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCacheHitFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
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
  return v4 ^ v5 ^ [(NSString *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  unint64_t timestamp = self->_timestamp;
  if (timestamp != [v4 timestamp]) {
    goto LABEL_14;
  }
  v6 = [(_CPCacheHitFeedback *)self input];
  v7 = [v4 input];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_13;
  }
  uint64_t v8 = [(_CPCacheHitFeedback *)self input];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPCacheHitFeedback *)self input];
    v11 = [v4 input];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  int triggerEvent = self->_triggerEvent;
  if (triggerEvent != [v4 triggerEvent]) {
    goto LABEL_14;
  }
  v6 = [(_CPCacheHitFeedback *)self uuid];
  v7 = [v4 uuid];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = [(_CPCacheHitFeedback *)self uuid];
  if (!v14)
  {

LABEL_17:
    BOOL v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  v16 = [(_CPCacheHitFeedback *)self uuid];
  v17 = [v4 uuid];
  char v18 = [v16 isEqual:v17];

  if (v18) {
    goto LABEL_17;
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_CPCacheHitFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPCacheHitFeedback *)self input];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPCacheHitFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v5 = [(_CPCacheHitFeedback *)self uuid];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCacheHitFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCacheHitFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCacheHitFeedback;
  v2 = [(_CPCacheHitFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCacheHitFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

@end