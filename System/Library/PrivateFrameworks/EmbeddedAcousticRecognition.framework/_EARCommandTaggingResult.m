@interface _EARCommandTaggingResult
- (NSArray)commandTaggings;
- (id)_initWithCommandTaggings:(id)a3;
@end

@implementation _EARCommandTaggingResult

- (id)_initWithCommandTaggings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EARCommandTaggingResult;
  v5 = [(_EARCommandTaggingResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    commandTaggings = v5->_commandTaggings;
    v5->_commandTaggings = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)commandTaggings
{
  return self->_commandTaggings;
}

- (void).cxx_destruct
{
}

@end