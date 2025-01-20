@interface _CPCardViewAppearFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)fbr;
- (_CPCardForFeedback)card;
- (_CPCardViewAppearFeedback)init;
- (_CPCardViewAppearFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)level;
- (void)setCard:(id)a3;
- (void)setFbr:(id)a3;
- (void)setLevel:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardViewAppearFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);

  objc_storeStrong((id *)&self->_card, 0);
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setCard:(id)a3
{
}

- (_CPCardForFeedback)card
{
  return self->_card;
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
  unint64_t v4 = [(_CPCardForFeedback *)self->_card hash] ^ (2654435761 * self->_level) ^ v3;
  return v4 ^ [(NSString *)self->_fbr hash];
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
  v6 = [(_CPCardViewAppearFeedback *)self card];
  v7 = [v4 card];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_13;
  }
  uint64_t v8 = [(_CPCardViewAppearFeedback *)self card];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_CPCardViewAppearFeedback *)self card];
    v11 = [v4 card];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  unsigned int level = self->_level;
  if (level != [v4 level]) {
    goto LABEL_14;
  }
  v6 = [(_CPCardViewAppearFeedback *)self fbr];
  v7 = [v4 fbr];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = [(_CPCardViewAppearFeedback *)self fbr];
  if (!v14)
  {

LABEL_17:
    BOOL v19 = 1;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  v16 = [(_CPCardViewAppearFeedback *)self fbr];
  v17 = [v4 fbr];
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
  if ([(_CPCardViewAppearFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPCardViewAppearFeedback *)self card];

  if (v4)
  {
    v5 = [(_CPCardViewAppearFeedback *)self card];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPCardViewAppearFeedback *)self level]) {
    PBDataWriterWriteUint32Field();
  }
  v6 = [(_CPCardViewAppearFeedback *)self fbr];

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardViewAppearFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCardViewAppearFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCardViewAppearFeedback;
  v2 = [(_CPCardViewAppearFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCardViewAppearFeedback *)v2 setTimestamp:mach_absolute_time()];
    unint64_t v3 = v2;
  }

  return v2;
}

- (_CPCardViewAppearFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CPCardViewAppearFeedback;
  objc_super v5 = [(_CPCardViewAppearFeedback *)&v14 init];
  if (v5)
  {
    -[_CPCardViewAppearFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 card];

    if (v6)
    {
      v7 = [_CPCardForFeedback alloc];
      id v8 = [v4 card];
      v9 = [(_CPCardForFeedback *)v7 initWithFacade:v8];
      [(_CPCardViewAppearFeedback *)v5 setCard:v9];
    }
    -[_CPCardViewAppearFeedback setLevel:](v5, "setLevel:", [v4 level]);
    v10 = [v4 fbr];

    if (v10)
    {
      v11 = [v4 fbr];
      [(_CPCardViewAppearFeedback *)v5 setFbr:v11];
    }
    int v12 = v5;
  }

  return v5;
}

@end