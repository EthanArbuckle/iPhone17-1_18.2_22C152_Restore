@interface _CPSuggestionEngagementFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPSearchSuggestionForFeedback)suggestion;
- (_CPSuggestionEngagementFeedback)init;
- (_CPSuggestionEngagementFeedback)initWithFacade:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setSuggestion:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPSuggestionEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setSuggestion:(id)a3
{
}

- (_CPSearchSuggestionForFeedback)suggestion
{
  return self->_suggestion;
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
  return [(_CPSearchSuggestionForFeedback *)self->_suggestion hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPSuggestionEngagementFeedback *)self suggestion];
      v7 = [v4 suggestion];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPSuggestionEngagementFeedback *)self suggestion];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPSuggestionEngagementFeedback *)self suggestion];
        v12 = [v4 suggestion];
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
  if ([(_CPSuggestionEngagementFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_CPSuggestionEngagementFeedback *)self suggestion];

  if (v4)
  {
    v5 = [(_CPSuggestionEngagementFeedback *)self suggestion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPSuggestionEngagementFeedbackReadFrom(self, (uint64_t)a3);
}

- (_CPSuggestionEngagementFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPSuggestionEngagementFeedback;
  unint64_t v2 = [(_CPSuggestionEngagementFeedback *)&v5 init];
  if (v2)
  {
    [(_CPSuggestionEngagementFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPSuggestionEngagementFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPSuggestionEngagementFeedback;
  objc_super v5 = [(_CPSuggestionEngagementFeedback *)&v12 init];
  if (v5)
  {
    -[_CPSuggestionEngagementFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    id v6 = [v4 suggestion];

    if (v6)
    {
      v7 = [_CPSearchSuggestionForFeedback alloc];
      v8 = [v4 suggestion];
      uint64_t v9 = [(_CPSearchSuggestionForFeedback *)v7 initWithFacade:v8];
      [(_CPSuggestionEngagementFeedback *)v5 setSuggestion:v9];
    }
    v10 = v5;
  }

  return v5;
}

@end