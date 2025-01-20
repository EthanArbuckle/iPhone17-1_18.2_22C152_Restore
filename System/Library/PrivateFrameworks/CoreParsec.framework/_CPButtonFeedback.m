@interface _CPButtonFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)commandDetail;
- (_CPButtonFeedback)init;
- (int)commandType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)uniqueId;
- (void)setCommandDetail:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPButtonFeedback

- (void).cxx_destruct
{
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_uniqueId = a3;
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void)setCommandDetail:(id)a3
{
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (int)commandType
{
  return self->_commandType;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_commandType;
  return [(NSString *)self->_commandDetail hash] ^ v2 ^ (2654435761u * self->_uniqueId) ^ (2654435761u
                                                                                                * self->_timestamp);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  int commandType = self->_commandType;
  if (commandType != [v4 commandType]) {
    goto LABEL_11;
  }
  v6 = [(_CPButtonFeedback *)self commandDetail];
  v7 = [v4 commandDetail];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_11;
  }
  uint64_t v9 = [(_CPButtonFeedback *)self commandDetail];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_CPButtonFeedback *)self commandDetail];
    v12 = [v4 commandDetail];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  unint64_t uniqueId = self->_uniqueId;
  if (uniqueId != [v4 uniqueId])
  {
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  unint64_t timestamp = self->_timestamp;
  BOOL v16 = timestamp == [v4 timestamp];
LABEL_12:

  return v16;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPButtonFeedback *)self commandType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPButtonFeedback *)self commandDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPButtonFeedback *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPButtonFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPButtonFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPButtonFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPButtonFeedback;
  uint64_t v2 = [(_CPButtonFeedback *)&v5 init];
  if (v2)
  {
    [(_CPButtonFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

@end