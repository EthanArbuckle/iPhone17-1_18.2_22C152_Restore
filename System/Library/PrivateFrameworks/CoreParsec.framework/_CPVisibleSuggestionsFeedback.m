@interface _CPVisibleSuggestionsFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)suggestions;
- (_CPVisibleSuggestionsFeedback)init;
- (_CPVisibleSuggestionsFeedback)initWithFacade:(id)a3;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (unint64_t)timestamp;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)setSuggestions:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPVisibleSuggestionsFeedback

- (void).cxx_destruct
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
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
  return [(NSArray *)self->_suggestions hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    if (timestamp == [v4 timestamp])
    {
      v6 = [(_CPVisibleSuggestionsFeedback *)self suggestions];
      v7 = [v4 suggestions];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_CPVisibleSuggestionsFeedback *)self suggestions];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        v11 = [(_CPVisibleSuggestionsFeedback *)self suggestions];
        v12 = [v4 suggestions];
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_CPVisibleSuggestionsFeedback *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPVisibleSuggestionsFeedbackReadFrom(self, (uint64_t)a3);
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_suggestions objectAtIndexedSubscript:a3];
}

- (unint64_t)suggestionsCount
{
  return [(NSArray *)self->_suggestions count];
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSArray *)suggestions addObject:v4];
}

- (void)clearSuggestions
{
}

- (void)setSuggestions:(id)a3
{
  self->_suggestions = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (_CPVisibleSuggestionsFeedback)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CPVisibleSuggestionsFeedback;
  unint64_t v2 = [(_CPVisibleSuggestionsFeedback *)&v5 init];
  if (v2)
  {
    [(_CPVisibleSuggestionsFeedback *)v2 setTimestamp:mach_absolute_time()];
    v3 = v2;
  }

  return v2;
}

- (_CPVisibleSuggestionsFeedback)initWithFacade:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CPVisibleSuggestionsFeedback;
  objc_super v5 = [(_CPVisibleSuggestionsFeedback *)&v20 init];
  if (v5)
  {
    -[_CPVisibleSuggestionsFeedback setTimestamp:](v5, "setTimestamp:", [v4 timestamp]);
    uint64_t v6 = [v4 suggestions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = objc_msgSend(v4, "suggestions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [[_CPSearchSuggestionForFeedback alloc] initWithFacade:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(_CPVisibleSuggestionsFeedback *)v5 setSuggestions:v7];
    BOOL v14 = v5;
  }
  return v5;
}

@end