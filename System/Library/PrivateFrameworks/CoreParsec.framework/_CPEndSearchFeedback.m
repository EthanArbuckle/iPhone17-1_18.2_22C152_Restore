@interface _CPEndSearchFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uuid;
- (_CPEndSearchFeedback)init;
- (_CPEndSearchFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPEndSearchFeedback

- (void).cxx_destruct
{
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
  unint64_t v2 = 2654435761u * self->_timestamp;
  return [(NSString *)self->_uuid hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPEndSearchFeedback *)self uuid];
      v7 = [v4 uuid];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPEndSearchFeedback *)self uuid];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPEndSearchFeedback *)self uuid];
        v12 = [v4 uuid];
        char v13 = [v11 isEqual:v12];

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
  id v5 = a3;
  if ([(_CPEndSearchFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPEndSearchFeedback *)self uuid];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPEndSearchFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPEndSearchFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPEndSearchFeedback;
  unint64_t v2 = [(_CPEndSearchFeedback *)&v5 init];
  if (v2)
  {
    [(_CPEndSearchFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPEndSearchFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CPEndSearchFeedback;
  objc_super v5 = [(_CPEndSearchFeedback *)&v10 init];
  if (v5)
  {
    -[_CPEndSearchFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 uuid];

    if (v6)
    {
      v7 = [v4 uuid];
      [(_CPEndSearchFeedback *)v5 setUuid:v7];
    }
    v8 = v5;
  }

  return v5;
}

@end