@interface IRTTRPrompt
- (IRTTRURLQuery)query;
- (NSArray)popups;
- (void)setPopups:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation IRTTRPrompt

- (NSArray)popups
{
  return self->_popups;
}

- (void)setPopups:(id)a3
{
}

- (IRTTRURLQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_popups, 0);
}

@end