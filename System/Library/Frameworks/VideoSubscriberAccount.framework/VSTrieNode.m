@interface VSTrieNode
- (NSMutableArray)objects;
- (NSMutableDictionary)next;
- (VSTrieNode)init;
- (void)setNext:(id)a3;
- (void)setObjects:(id)a3;
@end

@implementation VSTrieNode

- (VSTrieNode)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSTrieNode;
  v2 = [(VSTrieNode *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objects = v2->_objects;
    v2->_objects = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    next = v2->_next;
    v2->_next = v5;
  }
  return v2;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (NSMutableDictionary)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);

  objc_storeStrong((id *)&self->_objects, 0);
}

@end