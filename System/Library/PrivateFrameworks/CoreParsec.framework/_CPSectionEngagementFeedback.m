@interface _CPSectionEngagementFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPResultSectionForFeedback)section;
- (_CPSectionEngagementFeedback)init;
- (_CPSectionEngagementFeedback)initWithFacade:(id)a3;
- (int)triggerEvent;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setSection:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSectionEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setTriggerEvent:(int)a3
{
  self->_triggerEvent = a3;
}

- (int)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setSection:(id)a3
{
}

- (_CPResultSectionForFeedback)section
{
  return self->_section;
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
  return [(_CPResultSectionForFeedback *)self->_section hash] ^ v2 ^ (2654435761 * self->_triggerEvent);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPSectionEngagementFeedback *)self section];
      v7 = [v4 section];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPSectionEngagementFeedback *)self section];
        if (!v9)
        {

LABEL_11:
          int triggerEvent = self->_triggerEvent;
          BOOL v14 = triggerEvent == [v4 triggerEvent];
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPSectionEngagementFeedback *)self section];
        v12 = [v4 section];
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
  if ([(_CPSectionEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPSectionEngagementFeedback *)self section];

  if (v4)
  {
    v5 = [(_CPSectionEngagementFeedback *)self section];
    PBDataWriterWriteSubmessage();
  }
  if ([(_CPSectionEngagementFeedback *)self triggerEvent]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPSectionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSectionEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSectionEngagementFeedback;
  unint64_t v2 = [(_CPSectionEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSectionEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPSectionEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSectionEngagementFeedback;
  objc_super v5 = [(_CPSectionEngagementFeedback *)&v12 init];
  if (v5)
  {
    -[_CPSectionEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    v6 = [v4 section];

    if (v6)
    {
      v7 = [_CPResultSectionForFeedback alloc];
      v8 = [v4 section];
      uint64_t v9 = [(_CPResultSectionForFeedback *)v7 initWithFacade:v8];
      [(_CPSectionEngagementFeedback *)v5 setSection:v9];
    }
    -[_CPSectionEngagementFeedback setTriggerEvent:](v5, "setTriggerEvent:", [v4 triggerEvent]);
    v10 = v5;
  }

  return v5;
}

@end