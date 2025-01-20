@interface _CPActionItemForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPActionItemForFeedback)initWithFacade:(id)a3;
- (_CPPunchoutForFeedback)punchout;
- (unint64_t)hash;
- (void)setPunchout:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPActionItemForFeedback

- (void).cxx_destruct
{
}

- (void)setPunchout:(id)a3
{
}

- (_CPPunchoutForFeedback)punchout
{
  return self->_punchout;
}

- (unint64_t)hash
{
  return [(_CPPunchoutForFeedback *)self->_punchout hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_CPActionItemForFeedback *)self punchout];
    v6 = [v4 punchout];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_CPActionItemForFeedback *)self punchout];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_CPActionItemForFeedback *)self punchout];
      v11 = [v4 punchout];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_CPActionItemForFeedback *)self punchout];

  if (v4)
  {
    v5 = [(_CPActionItemForFeedback *)self punchout];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPActionItemForFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPActionItemForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPActionItemForFeedback;
  v5 = [(_CPActionItemForFeedback *)&v12 init];
  if (v5)
  {
    id v6 = [v4 punchout];

    if (v6)
    {
      v7 = [_CPPunchoutForFeedback alloc];
      uint64_t v8 = [v4 punchout];
      v9 = [(_CPPunchoutForFeedback *)v7 initWithFacade:v8];
      [(_CPActionItemForFeedback *)v5 setPunchout:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end