@interface CalSpotlightQueryResult
- (BOOL)isNaturalLanguageSuggestedEvent;
- (NSString)identifier;
- (NSString)title;
- (void)setIdentifier:(id)a3;
- (void)setNaturalLanguageSuggestedEvent:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation CalSpotlightQueryResult

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isNaturalLanguageSuggestedEvent
{
  return self->_naturalLanguageSuggestedEvent;
}

- (void)setNaturalLanguageSuggestedEvent:(BOOL)a3
{
  self->_naturalLanguageSuggestedEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end