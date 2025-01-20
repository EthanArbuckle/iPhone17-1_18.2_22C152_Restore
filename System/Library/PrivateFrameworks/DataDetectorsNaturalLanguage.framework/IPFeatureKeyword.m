@interface IPFeatureKeyword
+ (id)featureKeywordWithType:(unint64_t)a3 string:(id)a4 matchRange:(_NSRange)a5;
- (NSArray)eventTypes;
- (NSMutableDictionary)contextDictionary;
- (NSString)keywordString;
- (id)description;
- (id)humandReadableEventTypes;
- (id)typeDescription;
- (unint64_t)type;
- (void)addEventType:(id)a3;
- (void)setEventTypes:(id)a3;
- (void)setKeywordString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation IPFeatureKeyword

+ (id)featureKeywordWithType:(unint64_t)a3 string:(id)a4 matchRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  v9 = objc_alloc_init(IPFeatureKeyword);
  [(IPFeatureKeyword *)v9 setKeywordString:v8];

  -[IPFeature setMatchRange:](v9, "setMatchRange:", location, length);
  [(IPFeatureKeyword *)v9 setEventTypes:MEMORY[0x263EFFA68]];
  [(IPFeatureKeyword *)v9 setType:a3];
  return v9;
}

- (NSMutableDictionary)contextDictionary
{
  contextDictionary = self->_contextDictionary;
  if (!contextDictionary)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_contextDictionary;
    self->_contextDictionary = v4;

    contextDictionary = self->_contextDictionary;
  }
  return contextDictionary;
}

- (void)addEventType:(id)a3
{
  id v8 = a3;
  v4 = [(IPFeatureKeyword *)self eventTypes];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    v6 = [(IPFeatureKeyword *)self eventTypes];
    v7 = [v6 arrayByAddingObject:v8];
    [(IPFeatureKeyword *)self setEventTypes:v7];
  }
}

- (id)typeDescription
{
  unint64_t v2 = [(IPFeatureKeyword *)self type];
  if (v2 > 3) {
    return @"None";
  }
  else {
    return off_2647232C8[v2];
  }
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureKeyword;
  v4 = [(IPFeature *)&v9 description];
  char v5 = [(IPFeatureKeyword *)self humandReadableEventTypes];
  v6 = [(IPFeatureKeyword *)self typeDescription];
  v7 = [v3 stringWithFormat:@"%@ Type: %@ Event Types: <%@>", v4, v5, v6];

  return v7;
}

- (id)humandReadableEventTypes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(IPFeatureKeyword *)self eventTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @", ");

  return v10;
}

- (NSString)keywordString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeywordString:(id)a3
{
}

- (NSArray)eventTypes
{
  return self->_eventTypes;
}

- (void)setEventTypes:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypes, 0);
  objc_storeStrong((id *)&self->_keywordString, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
}

@end