@interface _EDDisplayNameGroupingTrieNode
- (BOOL)isEndOfName;
- (NSArray)addressIDs;
- (NSDictionary)children;
- (NSString)value;
- (_EDDisplayNameGroupingTrieNode)initWithValue:(id)a3;
- (void)addAddressID:(id)a3;
- (void)addChild:(id)a3;
- (void)setIsEndOfName:(BOOL)a3;
@end

@implementation _EDDisplayNameGroupingTrieNode

- (_EDDisplayNameGroupingTrieNode)initWithValue:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_EDDisplayNameGroupingTrieNode;
  v5 = [(_EDDisplayNameGroupingTrieNode *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    value = v5->_value;
    v5->_value = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    children = v5->_children;
    v5->_children = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addressIDs = v5->_addressIDs;
    v5->_addressIDs = v10;
  }
  return v5;
}

- (NSDictionary)children
{
  v2 = (void *)[(NSMutableDictionary *)self->_children copy];

  return (NSDictionary *)v2;
}

- (NSArray)addressIDs
{
  v2 = (void *)[(NSMutableArray *)self->_addressIDs copy];

  return (NSArray *)v2;
}

- (void)addChild:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_children, "objectForKeyedSubscript:");

  if (!v4)
  {
    v5 = [[_EDDisplayNameGroupingTrieNode alloc] initWithValue:v6];
    [(NSMutableDictionary *)self->_children setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)addAddressID:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEndOfName
{
  return self->_isEndOfName;
}

- (void)setIsEndOfName:(BOOL)a3
{
  self->_isEndOfName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_addressIDs, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end