@interface _EARPeopleSuggesterConfig
- (_EARPeopleSuggesterConfig)initWithContactsCount:(unsigned int)a3 bestContactsCount:(unsigned int)a4 bestContactsBonus:(unsigned int)a5;
- (unsigned)bestContactsBonus;
- (unsigned)bestContactsCount;
- (unsigned)contactsCount;
@end

@implementation _EARPeopleSuggesterConfig

- (_EARPeopleSuggesterConfig)initWithContactsCount:(unsigned int)a3 bestContactsCount:(unsigned int)a4 bestContactsBonus:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_EARPeopleSuggesterConfig;
  result = [(_EARPeopleSuggesterConfig *)&v9 init];
  result->_contactsCount = a3;
  result->_bestContactsCount = a4;
  result->_bestContactsBonus = a5;
  return result;
}

- (unsigned)contactsCount
{
  return self->_contactsCount;
}

- (unsigned)bestContactsCount
{
  return self->_bestContactsCount;
}

- (unsigned)bestContactsBonus
{
  return self->_bestContactsBonus;
}

@end