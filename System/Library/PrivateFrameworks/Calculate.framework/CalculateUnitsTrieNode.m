@interface CalculateUnitsTrieNode
+ (id)nodeWithTrieNode:(id)a3;
- (BOOL)containsConversionVerb;
- (BOOL)containsCurrency;
- (BOOL)isMatch;
- (CalculateUnitsTrieNode)initWithTrieNode:(id)a3;
- (TrieNode)node;
- (id)objectForKey:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation CalculateUnitsTrieNode

- (void).cxx_destruct
{
}

- (void)setNode:(id)a3
{
}

- (TrieNode)node
{
  return self->_node;
}

- (BOOL)containsCurrency
{
  v2 = -[TrieNode object]((uint64_t)self->_node);
  char v3 = [v2 containsCurrency];

  return v3;
}

- (BOOL)containsConversionVerb
{
  v2 = -[TrieNode object]((uint64_t)self->_node);
  if ([v2 containsFrom]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 containsTo];
  }

  return v3;
}

- (BOOL)isMatch
{
  v2 = -[TrieNode object]((uint64_t)self->_node);
  if ([v2 containsUnit] & 1) != 0 || (objc_msgSend(v2, "containsFrom")) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 containsTo];
  }

  return v3;
}

- (id)objectForKey:(id)a3
{
  char v3 = -[TrieNode objectForKeyedSubscript:]((id *)&self->_node->super.isa, a3);
  if (v3)
  {
    v4 = +[CalculateUnitsTrieNode nodeWithTrieNode:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CalculateUnitsTrieNode)initWithTrieNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalculateUnitsTrieNode;
  v6 = [(CalculateUnitsTrieNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_node, a3);
  }

  return v7;
}

+ (id)nodeWithTrieNode:(id)a3
{
  id v3 = a3;
  v4 = [[CalculateUnitsTrieNode alloc] initWithTrieNode:v3];

  return v4;
}

@end