@interface MapsSuggestionsBaseCondition
- (BOOL)isTrue;
- (MapsSuggestionsBaseCondition)initWithName:(id)a3;
- (NSString)description;
- (NSString)uniqueName;
- (id)objectForJSON;
@end

@implementation MapsSuggestionsBaseCondition

- (NSString)uniqueName
{
  return self->_name;
}

- (id)objectForJSON
{
  v2 = (MSg *)[(MapsSuggestionsBaseCondition *)self isTrue];
  return MSg::jsonFor(v2);
}

- (MapsSuggestionsBaseCondition)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBaseCondition;
  v5 = [(MapsSuggestionsBaseCondition *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)NSStringFromMapsSuggestionsJSON(self, 0);
}

- (BOOL)isTrue
{
  BOOL result = [(MapsSuggestionsBaseCondition *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end