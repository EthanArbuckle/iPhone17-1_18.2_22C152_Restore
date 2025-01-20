@interface _CPResultGradingFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)textFeedback;
- (_CPResultGradingFeedback)init;
- (_CPResultGradingFeedback)initWithFacade:(id)a3;
- (_CPSearchResultForFeedback)result;
- (int)grade;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setGrade:(int)a3;
- (void)setResult:(id)a3;
- (void)setTextFeedback:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPResultGradingFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeedback, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setTextFeedback:(id)a3
{
}

- (NSString)textFeedback
{
  return self->_textFeedback;
}

- (void)setGrade:(int)a3
{
  self->_grade = a3;
}

- (int)grade
{
  return self->_grade;
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
  unint64_t v3 = 2654435761u * self->_timestamp;
  unint64_t v4 = [(_CPSearchResultForFeedback *)self->_result hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_grade;
  return v4 ^ v5 ^ [(NSString *)self->_textFeedback hash];
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
  v6 = [(_CPResultGradingFeedback *)self result];
  v7 = [v4 result];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_13;
  }
  uint64_t v8 = [(_CPResultGradingFeedback *)self result];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPResultGradingFeedback *)self result];
    v11 = [v4 result];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  int grade = self->_grade;
  if (grade != [v4 grade]) {
    goto LABEL_14;
  }
  v6 = [(_CPResultGradingFeedback *)self textFeedback];
  v7 = [v4 textFeedback];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = [(_CPResultGradingFeedback *)self textFeedback];
  if (!v14)
  {

LABEL_17:
    BOOL v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  v16 = [(_CPResultGradingFeedback *)self textFeedback];
  v17 = [v4 textFeedback];
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
  id v8 = a3;
  if ([(_CPResultGradingFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPResultGradingFeedback *)self result];

  if (v4)
  {
    uint64_t v5 = [(_CPResultGradingFeedback *)self result];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPResultGradingFeedback *)self grade]) {
    PBDataWriterWriteInt32Field();
  }
  v6 = [(_CPResultGradingFeedback *)self textFeedback];

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultGradingFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPResultGradingFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPResultGradingFeedback;
  v2 = [(_CPResultGradingFeedback *)&v5 init];
  if (v2)
  {
    [(_CPResultGradingFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPResultGradingFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CPResultGradingFeedback;
  objc_super v5 = [(_CPResultGradingFeedback *)&v14 init];
  if (v5)
  {
    -[_CPResultGradingFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 result];

    if (v6)
    {
      v7 = [_CPSearchResultForFeedback alloc];
      id v8 = [v4 result];
      v9 = [(_CPSearchResultForFeedback *)v7 initWithFacade:v8];
      [(_CPResultGradingFeedback *)v5 setResult:v9];
    }
    -[_CPResultGradingFeedback setGrade:](v5, "setGrade:", [v4 grade]);
    v10 = [v4 textFeedback];

    if (v10)
    {
      v11 = [v4 textFeedback];
      [(_CPResultGradingFeedback *)v5 setTextFeedback:v11];
    }
    int v12 = v5;
  }

  return v5;
}

@end