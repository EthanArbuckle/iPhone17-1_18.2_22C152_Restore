@interface _CPResultFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPResultFeedback)init;
- (_CPResultFeedback)initWithFacade:(id)a3;
- (_CPSearchResultForFeedback)result;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setResult:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPResultFeedback

- (void).cxx_destruct
{
}

- (void)setResult:(id)a3
{
}

- (_CPSearchResultForFeedback)result
{
  return self->_result;
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
  return [(_CPSearchResultForFeedback *)self->_result hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPResultFeedback *)self result];
      v7 = [v4 result];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPResultFeedback *)self result];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPResultFeedback *)self result];
        v12 = [v4 result];
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
  id v6 = a3;
  if ([(_CPResultFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPResultFeedback *)self result];

  if (v4)
  {
    v5 = [(_CPResultFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPResultFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPResultFeedback;
  unint64_t v2 = [(_CPResultFeedback *)&v5 init];
  if (v2)
  {
    [(_CPResultFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPResultFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPResultFeedback;
  objc_super v5 = [(_CPResultFeedback *)&v12 init];
  if (v5)
  {
    -[_CPResultFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    id v6 = [v4 result];

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      v8 = [v4 result];
      uint64_t v9 = [(_CPSearchResultForFeedback *)v7 initWithFacade:v8];
      [(_CPResultFeedback *)v5 setResult:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end