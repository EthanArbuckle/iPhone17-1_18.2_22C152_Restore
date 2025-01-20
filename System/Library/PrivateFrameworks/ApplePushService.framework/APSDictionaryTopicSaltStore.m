@interface APSDictionaryTopicSaltStore
- (APSDictionaryTopicSaltStore)initWithDictionary:(id)a3;
- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5;
- (NSMutableDictionary)identifierToSalt;
- (id)loadIdentifiersToSaltsForUser:(id)a3;
- (id)loadSaltForIdentifier:(id)a3 user:(id)a4;
- (void)setIdentifierToSalt:(id)a3;
@end

@implementation APSDictionaryTopicSaltStore

- (APSDictionaryTopicSaltStore)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APSDictionaryTopicSaltStore;
  v5 = [(APSDictionaryTopicSaltStore *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)[v4 mutableCopy];
    identifierToSalt = v5->_identifierToSalt;
    v5->_identifierToSalt = v6;
  }
  return v5;
}

- (id)loadSaltForIdentifier:(id)a3 user:(id)a4
{
  id v5 = a3;
  v6 = [(APSDictionaryTopicSaltStore *)self identifierToSalt];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (BOOL)saveSalt:(id)a3 forIdentifier:(id)a4 user:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [(APSDictionaryTopicSaltStore *)self identifierToSalt];
  v10 = v9;
  if (v7)
  {

    if (!v10)
    {
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      [(APSDictionaryTopicSaltStore *)self setIdentifierToSalt:v11];
    }
    v12 = [(APSDictionaryTopicSaltStore *)self identifierToSalt];
    [v12 setObject:v7 forKeyedSubscript:v8];
  }
  else
  {
    [v9 setObject:0 forKeyedSubscript:v8];

    v13 = [(APSDictionaryTopicSaltStore *)self identifierToSalt];
    id v14 = [v13 count];

    if (!v14) {
      [(APSDictionaryTopicSaltStore *)self setIdentifierToSalt:0];
    }
  }

  return 1;
}

- (id)loadIdentifiersToSaltsForUser:(id)a3
{
  v3 = [(APSDictionaryTopicSaltStore *)self identifierToSalt];
  id v4 = [v3 copy];

  return v4;
}

- (NSMutableDictionary)identifierToSalt
{
  return self->_identifierToSalt;
}

- (void)setIdentifierToSalt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end