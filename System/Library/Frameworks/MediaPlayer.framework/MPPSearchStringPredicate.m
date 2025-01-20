@interface MPPSearchStringPredicate
- (BOOL)hasSearchString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)properties;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertiesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)propertiesCount;
- (void)addProperties:(id)a3;
- (void)clearProperties;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setProperties:(id)a3;
- (void)setSearchString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPSearchStringPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  return [(NSMutableArray *)self->_properties hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((searchString = self->_searchString, !((unint64_t)searchString | v4[2]))
     || -[NSString isEqual:](searchString, "isEqual:")))
  {
    properties = self->_properties;
    if ((unint64_t)properties | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](properties, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_searchString copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_properties;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addProperties:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(MPPSearchStringPredicate *)self hasSearchString])
  {
    v4 = [(MPPSearchStringPredicate *)self searchString];
    [v9 setSearchString:v4];
  }
  if ([(MPPSearchStringPredicate *)self propertiesCount])
  {
    [v9 clearProperties];
    unint64_t v5 = [(MPPSearchStringPredicate *)self propertiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        v8 = [(MPPSearchStringPredicate *)self propertiesAtIndex:i];
        [v9 addProperties:v8];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = v4;
  searchString = self->_searchString;
  if (searchString) {
    [v4 writeString:searchString forTag:1];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v7 = self->_properties;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v5, "writeString:forTag:", *(void *)(*((void *)&v12 + 1) + 8 * i), 2, (void)v12);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPSearchStringPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"searchString"];
  }
  properties = self->_properties;
  if (properties) {
    [v4 setObject:properties forKey:@"properties"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPSearchStringPredicate;
  id v4 = [(MPPSearchStringPredicate *)&v8 description];
  unint64_t v5 = [(MPPSearchStringPredicate *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_properties objectAtIndex:a3];
}

- (unint64_t)propertiesCount
{
  return [(NSMutableArray *)self->_properties count];
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSMutableArray *)properties addObject:v4];
}

- (void)clearProperties
{
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (void)dealloc
{
  [(MPPSearchStringPredicate *)self setSearchString:0];
  [(MPPSearchStringPredicate *)self setProperties:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPSearchStringPredicate;
  [(MPPSearchStringPredicate *)&v3 dealloc];
}

@end