@interface Trie
+ (void)enumerateCharactersInKey:(uint64_t)a3 range:(uint64_t)a4 usingBlock:(void *)a5;
- ($953B5E98BDB001443454E6BAFD1349F5)nodes;
- (BOOL)compressed;
- (NSMutableArray)objects;
- (Trie)init;
- (char)characters;
- (id)objectForKeyedSubscript:(uint64_t)a1;
- (int)characterCount;
- (int)characterSize;
- (int)firstByteCache;
- (int)nodeCount;
- (int)nodeSize;
- (void)compress;
- (void)dealloc;
- (void)setCharacterCount:(int)a3;
- (void)setCharacterSize:(int)a3;
- (void)setCharacters:(char *)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setFirstByteCache:(int *)a3;
- (void)setNodeCount:(int)a3;
- (void)setNodeSize:(int)a3;
- (void)setNodes:(id *)a3;
- (void)setObject:(void *)a3 forKeyedSubscript:;
- (void)setObjects:(id)a3;
- (void)setRoot:(id)a3;
- (void)writeCharacter:(unsigned __int8)a3;
- (void)writeNode:(id)a3;
@end

@implementation Trie

uint64_t __50__Trie_enumerateCharactersInKey_range_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (Trie)init
{
  v11.receiver = self;
  v11.super_class = (Class)Trie;
  v2 = [(Trie *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_characterSize = 100;
    v2->_characters = (char *)malloc_type_calloc(0x64uLL, 1uLL, 0x100004077774924uLL);
    v3->_nodeSize = 100;
    v3->_nodes = ($953B5E98BDB001443454E6BAFD1349F5 *)malloc_type_calloc(0x64uLL, 0xCuLL, 0x10000403E1C8BA9uLL);
    v3->_nodeCount = 1;
    uint64_t v4 = +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, v3, 0, 0);
    root = v3->_root;
    v3->_root = (TrieNode *)v4;

    v3->_firstByteCache = (int *)malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
    v3->_autocompress = 0;
    v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = objc_opt_new();
    uint64_t v8 = [v6 arrayWithObject:v7];
    objects = v3->_objects;
    v3->_objects = (NSMutableArray *)v8;
  }
  return v3;
}

- (char)characters
{
  return self->_characters;
}

- ($953B5E98BDB001443454E6BAFD1349F5)nodes
{
  return self->_nodes;
}

- (int)firstByteCache
{
  return self->_firstByteCache;
}

- (void)writeCharacter:(unsigned __int8)a3
{
  int characterCount = self->_characterCount;
  int characterSize = self->_characterSize;
  if (characterCount >= characterSize)
  {
    if (characterSize >= 0) {
      int v8 = self->_characterSize;
    }
    else {
      int v8 = characterSize + 1;
    }
    int v9 = characterSize + (v8 >> 1);
    if (v9 <= 100) {
      size_t v10 = 100;
    }
    else {
      size_t v10 = v9;
    }
    self->_int characterSize = v10;
    characters = (char *)malloc_type_realloc(self->_characters, v10, 0x100004077774924uLL);
    self->_characters = characters;
    self->_compressed = 0;
    int characterCount = self->_characterCount;
  }
  else
  {
    characters = self->_characters;
  }
  self->_int characterCount = characterCount + 1;
  characters[characterCount] = a3;
}

- (int)characterCount
{
  return self->_characterCount;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (void)writeNode:(id)a3
{
  unsigned int var3 = a3.var3;
  uint64_t v4 = (uint64_t)a3;
  int nodeCount = self->_nodeCount;
  int nodeSize = self->_nodeSize;
  if (nodeCount >= nodeSize)
  {
    if (nodeSize >= 0) {
      int v9 = self->_nodeSize;
    }
    else {
      int v9 = nodeSize + 1;
    }
    int v10 = nodeSize + (v9 >> 1);
    if (v10 <= 100) {
      int v10 = 100;
    }
    self->_int nodeSize = v10;
    nodes = ($953B5E98BDB001443454E6BAFD1349F5 *)malloc_type_realloc(self->_nodes, 12 * v10, 0x10000403E1C8BA9uLL);
    self->_nodes = nodes;
    self->_compressed = 0;
    int nodeCount = self->_nodeCount;
  }
  else
  {
    nodes = self->_nodes;
  }
  self->_int nodeCount = nodeCount + 1;
  objc_super v11 = &nodes[nodeCount];
  *(void *)objc_super v11 = v4;
  v11->unsigned int var3 = var3;
}

- (int)nodeCount
{
  return self->_nodeCount;
}

- (id)objectForKeyedSubscript:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = -[TrieNode objectForKeyedSubscript:](*(id **)(a1 + 32), a2);
    v3 = (void *)v2;
    if (v2)
    {
      uint64_t v4 = -[TrieNode object](v2);
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setObject:(void *)a3 forKeyedSubscript:
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = a2;
    -[TrieNode objectForKey:create:](v4, a3, 1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TrieNode setObject:]((uint64_t)v6, v5);
  }
}

+ (void)enumerateCharactersInKey:(uint64_t)a3 range:(uint64_t)a4 usingBlock:(void *)a5
{
  id v8 = a5;
  id v9 = a2;
  self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__Trie_enumerateCharactersInKey_range_usingBlock___block_invoke;
  v11[3] = &unk_1E63656D8;
  id v12 = v8;
  id v10 = v8;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", a3, a4, 2, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (void)setFirstByteCache:(int *)a3
{
  self->_firstByteCache = a3;
}

- (void)setObjects:(id)a3
{
}

- (void)setNodeSize:(int)a3
{
  self->_int nodeSize = a3;
}

- (int)nodeSize
{
  return self->_nodeSize;
}

- (void)setNodeCount:(int)a3
{
  self->_int nodeCount = a3;
}

- (void)setNodes:(id *)a3
{
  self->_nodes = a3;
}

- (void)setCharacterSize:(int)a3
{
  self->_int characterSize = a3;
}

- (int)characterSize
{
  return self->_characterSize;
}

- (void)setCharacterCount:(int)a3
{
  self->_int characterCount = a3;
}

- (void)setCharacters:(char *)a3
{
  self->_characters = a3;
}

- (void)setRoot:(id)a3
{
}

- (void)dealloc
{
  characters = self->_characters;
  if (characters) {
    free(characters);
  }
  nodes = self->_nodes;
  if (nodes) {
    free(nodes);
  }
  firstByteCache = self->_firstByteCache;
  if (firstByteCache) {
    free(firstByteCache);
  }
  v6.receiver = self;
  v6.super_class = (Class)Trie;
  [(Trie *)&v6 dealloc];
}

- (void)compress
{
  if (result)
  {
    v1 = result;
    if (!*((unsigned char *)result + 9))
    {
      size_t v2 = *((int *)result + 3);
      *((_DWORD *)result + 4) = v2;
      result[5] = malloc_type_realloc(result[5], v2, 0x100004077774924uLL);
      uint64_t v3 = *((int *)v1 + 5);
      *((_DWORD *)v1 + 6) = v3;
      result = (void **)malloc_type_realloc(v1[6], 12 * v3, 0x10000403E1C8BA9uLL);
      v1[6] = result;
      *((unsigned char *)v1 + 9) = 1;
    }
  }
  return result;
}

@end