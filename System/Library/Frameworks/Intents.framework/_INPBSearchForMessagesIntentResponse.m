@interface _INPBSearchForMessagesIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)messagesType;
+ (Class)searchResultsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)messages;
- (NSArray)searchResults;
- (_INPBSearchForMessagesIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)messagesAtIndex:(unint64_t)a3;
- (id)searchResultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)messagesCount;
- (unint64_t)searchResultsCount;
- (void)addMessages:(id)a3;
- (void)addSearchResults:(id)a3;
- (void)clearMessages;
- (void)clearSearchResults;
- (void)encodeWithCoder:(id)a3;
- (void)setMessages:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForMessagesIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_storeStrong((id *)&self->_messages, 0);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (NSArray)messages
{
  return self->_messages;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_messages count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_messages;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"messages"];
  }
  if ([(NSArray *)self->_searchResults count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_searchResults;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"searchResults"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_messages hash];
  return [(NSArray *)self->_searchResults hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBSearchForMessagesIntentResponse *)self messages];
  uint64_t v6 = [v4 messages];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBSearchForMessagesIntentResponse *)self messages];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchForMessagesIntentResponse *)self messages];
    v10 = [v4 messages];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBSearchForMessagesIntentResponse *)self searchResults];
  uint64_t v6 = [v4 searchResults];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBSearchForMessagesIntentResponse *)self searchResults];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBSearchForMessagesIntentResponse *)self searchResults];
    uint64_t v15 = [v4 searchResults];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBSearchForMessagesIntentResponse allocWithZone:](_INPBSearchForMessagesIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_messages copyWithZone:a3];
  [(_INPBSearchForMessagesIntentResponse *)v5 setMessages:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_searchResults copyWithZone:a3];
  [(_INPBSearchForMessagesIntentResponse *)v5 setSearchResults:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForMessagesIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForMessagesIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForMessagesIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForMessagesIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForMessagesIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_messages;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_searchResults;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMessagesIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_searchResults objectAtIndexedSubscript:a3];
}

- (unint64_t)searchResultsCount
{
  return [(NSArray *)self->_searchResults count];
}

- (void)addSearchResults:(id)a3
{
  id v4 = a3;
  searchResults = self->_searchResults;
  id v8 = v4;
  if (!searchResults)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_searchResults;
    self->_searchResults = v6;

    id v4 = v8;
    searchResults = self->_searchResults;
  }
  [(NSArray *)searchResults addObject:v4];
}

- (void)clearSearchResults
{
}

- (void)setSearchResults:(id)a3
{
  self->_searchResults = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)messagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_messages objectAtIndexedSubscript:a3];
}

- (unint64_t)messagesCount
{
  return [(NSArray *)self->_messages count];
}

- (void)addMessages:(id)a3
{
  id v4 = a3;
  messages = self->_messages;
  id v8 = v4;
  if (!messages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_messages;
    self->_messages = v6;

    id v4 = v8;
    messages = self->_messages;
  }
  [(NSArray *)messages addObject:v4];
}

- (void)clearMessages
{
}

- (void)setMessages:(id)a3
{
  self->_messages = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
}

+ (Class)messagesType
{
  return (Class)objc_opt_class();
}

@end