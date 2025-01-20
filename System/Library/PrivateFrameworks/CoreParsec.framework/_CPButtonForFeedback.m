@interface _CPButtonForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)commandDetail;
- (_CPButtonForFeedback)initWithFacade:(id)a3;
- (int)commandType;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)setCommandDetail:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPButtonForFeedback

- (void).cxx_destruct
{
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
  return [(NSString *)self->_commandDetail hash] ^ v2 ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int commandType = self->_commandType;
    if (commandType == [v4 commandType])
    {
      v6 = [(_CPButtonForFeedback *)self commandDetail];
      v7 = [v4 commandDetail];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPButtonForFeedback *)self commandDetail];
        if (!v9)
        {

LABEL_11:
          unint64_t uniqueId = self->_uniqueId;
          BOOL v14 = uniqueId == [v4 uniqueId];
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPButtonForFeedback *)self commandDetail];
        v12 = [v4 commandDetail];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPButtonForFeedback *)self commandType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPButtonForFeedback *)self commandDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPButtonForFeedback *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPButtonForFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPButtonForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPButtonForFeedback *)self init];
  if (v5)
  {
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      id v6 = v4;
      v7 = [v6 command];
      -[_CPButtonForFeedback setCommandType:](v5, "setCommandType:", [v7 _cpCommandType]);

      v8 = [v6 command];

      uint64_t v9 = [v8 commandDetail];
      [(_CPButtonForFeedback *)v5 setCommandDetail:v9];
    }
    -[_CPButtonForFeedback setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    v10 = v5;
  }

  return v5;
}

@end