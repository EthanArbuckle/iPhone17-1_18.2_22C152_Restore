@interface CKMentionEntityNode
- (NSMutableDictionary)children;
- (NSMutableSet)entities;
- (NSMutableSet)possibleEntities;
- (NSString)key;
- (id)childWithKey:(id)a3;
- (void)addChild:(id)a3;
- (void)addEntity:(id)a3;
- (void)addPossibleEntity:(id)a3;
- (void)setChildren:(id)a3;
- (void)setEntities:(id)a3;
- (void)setKey:(id)a3;
- (void)setPossibleEntities:(id)a3;
@end

@implementation CKMentionEntityNode

- (void)addEntity:(id)a3
{
  id v4 = a3;
  entities = self->_entities;
  id v8 = v4;
  if (!entities)
  {
    v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v7 = self->_entities;
    self->_entities = v6;

    id v4 = v8;
    entities = self->_entities;
  }
  [(NSMutableSet *)entities addObject:v4];
  [(CKMentionEntityNode *)self addPossibleEntity:v8];
}

- (void)addPossibleEntity:(id)a3
{
  id v4 = a3;
  possibleEntities = self->_possibleEntities;
  id v8 = v4;
  if (!possibleEntities)
  {
    v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v7 = self->_possibleEntities;
    self->_possibleEntities = v6;

    id v4 = v8;
    possibleEntities = self->_possibleEntities;
  }
  [(NSMutableSet *)possibleEntities addObject:v4];
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v9 = v4;
  if (!children)
  {
    v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v7 = self->_children;
    self->_children = v6;

    id v4 = v9;
    children = self->_children;
  }
  id v8 = [v4 key];
  [(NSMutableDictionary *)children setObject:v9 forKey:v8];
}

- (id)childWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKMentionEntityNode *)self children];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableSet)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (NSMutableSet)possibleEntities
{
  return self->_possibleEntities;
}

- (void)setPossibleEntities:(id)a3
{
}

- (NSMutableDictionary)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_possibleEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end