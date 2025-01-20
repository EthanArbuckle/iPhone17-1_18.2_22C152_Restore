@interface INFSentenceToken
- (NSString)identifier;
- (id)dictionaryRepresentation;
- (id)stringForContext:(id)a3;
@end

@implementation INFSentenceToken

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];

  return 0;
}

- (id)stringForContext:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"You must override %@ in a subclass", v5 format];

  return 0;
}

@end