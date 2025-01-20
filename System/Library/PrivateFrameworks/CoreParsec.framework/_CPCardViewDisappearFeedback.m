@interface _CPCardViewDisappearFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPCardForFeedback)card;
- (_CPCardViewDisappearFeedback)init;
- (_CPCardViewDisappearFeedback)initWithFacade:(id)a3;
- (int)cardDisappearEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setCard:(id)a3;
- (void)setCardDisappearEvent:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCardViewDisappearFeedback

- (void).cxx_destruct
{
}

- (void)setCard:(id)a3
{
}

- (_CPCardForFeedback)card
{
  return self->_card;
}

- (void)setCardDisappearEvent:(int)a3
{
  self->_cardDisappearEvent = a3;
}

- (int)cardDisappearEvent
{
  return self->_cardDisappearEvent;
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
  unint64_t v2 = (2654435761 * self->_cardDisappearEvent) ^ (2654435761u * self->_timestamp);
  return v2 ^ [(_CPCardForFeedback *)self->_card hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      int cardDisappearEvent = self->_cardDisappearEvent;
      if (cardDisappearEvent == [v4 cardDisappearEvent])
      {
        v7 = [(_CPCardViewDisappearFeedback *)self card];
        v8 = [v4 card];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_CPCardViewDisappearFeedback *)self card];
          if (!v10)
          {

LABEL_12:
            BOOL v15 = 1;
            goto LABEL_10;
          }
          v11 = (void *)v10;
          v12 = [(_CPCardViewDisappearFeedback *)self card];
          v13 = [v4 card];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_CPCardViewDisappearFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPCardViewDisappearFeedback *)self cardDisappearEvent]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_CPCardViewDisappearFeedback *)self card];

  if (v4)
  {
    v5 = [(_CPCardViewDisappearFeedback *)self card];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPCardViewDisappearFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPCardViewDisappearFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPCardViewDisappearFeedback;
  unint64_t v2 = [(_CPCardViewDisappearFeedback *)&v5 init];
  if (v2)
  {
    [(_CPCardViewDisappearFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPCardViewDisappearFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPCardViewDisappearFeedback;
  objc_super v5 = [(_CPCardViewDisappearFeedback *)&v12 init];
  if (v5)
  {
    -[_CPCardViewDisappearFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    -[_CPCardViewDisappearFeedback setCardDisappearEvent:](v5, "setCardDisappearEvent:", [v4 cardDisappearEvent]);
    id v6 = [v4 card];

    if (v6)
    {
      v7 = [_CPCardForFeedback alloc];
      v8 = [v4 card];
      v9 = [(_CPCardForFeedback *)v7 initWithFacade:v8];
      [(_CPCardViewDisappearFeedback *)v5 setCard:v9];
    }
    uint64_t v10 = v5;
  }

  return v5;
}

@end