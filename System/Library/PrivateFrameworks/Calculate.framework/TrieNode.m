@interface TrieNode
+ (id)nodeWithTrie:(uint64_t)a3 node:(uint64_t)a4 offset:;
- (Trie)trie;
- object;
- (id)copy;
- (id)objectForByte:(uint64_t)a1 leaf:(int)a2 create:;
- (id)objectForKey:(int)a3 create:;
- (id)objectForKeyedSubscript:(id *)a1;
- (int)node;
- (int)offset;
- (uint64_t)updateForByte:(uint64_t)a3 leaf:(int)a4 create:;
- (uint64_t)visit:(int)a3 create:;
- (void)setNode:(int)a3;
- (void)setObject:(uint64_t)a1;
- (void)setOffset:(int)a3;
- (void)setTrie:(id)a3;
@end

@implementation TrieNode

- (void).cxx_destruct
{
}

- (void)setObject:(uint64_t)a1
{
  id v10 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    uint64_t v4 = [WeakRetained nodes];
    int v5 = *(_DWORD *)(a1 + 8);
    if (v5 < 1 || (uint64_t v6 = v4, *(unsigned char *)(v4 + 12 * v5 + 3)))
    {
      v9 = -[TrieNode objectForByte:leaf:create:](a1, 1);
      -[TrieNode setObject:](v9, v10);
    }
    else
    {
      uint64_t v7 = *(int *)(v4 + 12 * v5 + 4);
      v8 = [WeakRetained objects];
      v9 = v8;
      if (v7)
      {
        [v8 setObject:v10 atIndexedSubscript:v7];
      }
      else
      {
        *(_DWORD *)(v6 + 12 * *(int *)(a1 + 8) + 4) = [v8 count];

        v9 = [WeakRetained objects];
        [v9 addObject:v10];
      }
    }
  }
}

- (uint64_t)visit:(int)a3 create:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1
    && (id v7 = v5,
        v8 = (unsigned __int8 *)[v7 UTF8String],
        unint64_t v9 = [v7 lengthOfBytesUsingEncoding:4],
        v9 <= 0x200))
  {
    if (v9)
    {
      unint64_t v11 = v9 - 1;
      do
      {
        unsigned int v12 = *v8++;
        uint64_t v13 = -[TrieNode updateForByte:leaf:create:](a1, v12, 0, a3);
        uint64_t v10 = v13;
        BOOL v15 = v11-- != 0;
      }
      while (v13 && v15);
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)updateForByte:(uint64_t)a3 leaf:(int)a4 create:
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  uint64_t v8 = [WeakRetained nodes];
  uint64_t v9 = *(int *)(a1 + 8);
  uint64_t v10 = *(int *)(a1 + 12);
  uint64_t v11 = v8 + 12 * (int)v9;
  int v12 = *(unsigned __int8 *)(v11 + 3);
  int v13 = (*(_DWORD *)(a1 + 8) == 0) & ~a3;
  if (*(_DWORD *)(a1 + 12)) {
    int v13 = 0;
  }
  int v37 = v13;
  if (v13 == 1 && *(int *)([WeakRetained firstByteCache] + 4 * a2) >= 1)
  {
    uint64_t v14 = 1;
    *(_DWORD *)(a1 + 8) = *(_DWORD *)([WeakRetained firstByteCache] + 4 * a2);
    *(_DWORD *)(a1 + 12) = 1;
    goto LABEL_39;
  }
  if ((int)v10 < v12)
  {
    if ((a3 & 1) == 0
      && *(unsigned __int8 *)([WeakRetained characters] + (*(_DWORD *)v11 & 0xFFFFFF) + v10) == a2)
    {
      int v15 = v10 + 1;
      *(_DWORD *)(a1 + 8) = v9;
      goto LABEL_38;
    }
    if (a4)
    {
      int v20 = *(_DWORD *)v11;
      *(unsigned char *)(v11 + 3) = v10;
      int v21 = [WeakRetained nodeCount];
      uint64_t v22 = v9;
      int v23 = v21;
      uint64_t v24 = (v20 - (v10 << 24)) & 0xFF000000 | (*(_DWORD *)v11 + v10) & 0xFFFFFF;
      uint64_t v25 = 3 * v22;
      objc_msgSend(WeakRetained, "writeNode:", v24 | ((unint64_t)*(unsigned int *)(v8 + 12 * v22 + 4) << 32), 0);
      *(_DWORD *)([WeakRetained nodes] + 4 * v25 + 4) = v23;
      uint64_t v14 = -[TrieNode updateForByte:leaf:create:](a1, a2, a3, 1);
      goto LABEL_39;
    }
LABEL_25:
    uint64_t v14 = 0;
    goto LABEL_39;
  }
  uint64_t v16 = v8 + 12 * (int)v9;
  uint64_t v17 = *(unsigned int *)(v16 + 4);
  v35 = (_DWORD *)(v16 + 4);
  int v36 = v9;
  if (*(int *)(v16 + 4) >= 1)
  {
    while (1)
    {
      uint64_t v18 = v17;
      int v19 = *(_DWORD *)(v8 + 12 * v17);
      if (a3)
      {
        if (!HIBYTE(v19)) {
          goto LABEL_26;
        }
      }
      else if (HIBYTE(v19) {
             && *(unsigned __int8 *)([WeakRetained characters] + (*(void *)&v19 & 0xFFFFFFLL)) == a2)
      }
      {
LABEL_26:
        uint64_t v14 = 1;
        *(_DWORD *)(a1 + 8) = v18;
        *(_DWORD *)(a1 + 12) = 1;
        goto LABEL_39;
      }
      uint64_t v17 = *(unsigned int *)(v8 + 12 * v18 + 8);
      if ((int)v17 <= 0) {
        goto LABEL_22;
      }
    }
  }
  uint64_t v18 = 0;
LABEL_22:
  if (!a4) {
    goto LABEL_25;
  }
  if (a3)
  {
    int v26 = [WeakRetained nodeCount];
    objc_msgSend(WeakRetained, "writeNode:", 0, 0);
  }
  else
  {
    if (!*v35)
    {
      int v28 = HIBYTE(*(_DWORD *)v11);
      if (v28)
      {
        if (v28 != 255)
        {
          int v27 = *(_DWORD *)v11;
          if ((v27 & 0xFFFFFF) + v28 == [WeakRetained characterCount])
          {
            [WeakRetained writeCharacter:a2];
            *(unsigned char *)(v11 + 3) = ((*(unsigned __int8 *)(v11 + 3) << 24) + 0x1000000) >> 24;
            *(_DWORD *)(a1 + 8) = v36;
            int v15 = v10 + 1;
            goto LABEL_38;
          }
        }
      }
    }
    int v26 = [WeakRetained nodeCount];
    objc_msgSend(WeakRetained, "writeNode:", objc_msgSend(WeakRetained, "characterCount") & 0xFFFFFF | 0x1000000, 0);
    [WeakRetained writeCharacter:a2];
  }
  uint64_t v29 = [WeakRetained nodes];
  uint64_t v30 = v29 + 12 * v36;
  int v32 = *(_DWORD *)(v30 + 4);
  v31 = (_DWORD *)(v30 + 4);
  v33 = (_DWORD *)(v29 + 12 * v18 + 8);
  if (!v32) {
    v33 = v31;
  }
  _DWORD *v33 = v26;
  if (v37) {
    *(_DWORD *)([WeakRetained firstByteCache] + 4 * a2) = v26;
  }
  *(_DWORD *)(a1 + 8) = v26;
  int v15 = 1;
LABEL_38:
  *(_DWORD *)(a1 + 12) = v15;
  uint64_t v14 = 1;
LABEL_39:

  return v14;
}

- (id)objectForByte:(uint64_t)a1 leaf:(int)a2 create:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  id v5 = +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12));

  if (-[TrieNode updateForByte:leaf:create:]((uint64_t)v5, 0, 1, a2)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- object
{
  _DWORD *v1;
  id WeakRetained;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t vars8;

  v1 = (_DWORD *)a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = [WeakRetained nodes];
    uint64_t v4 = v1[2];
    if (v4 < 1 || *(unsigned char *)(v3 + 12 * v4 + 3))
    {
      id v6 = -[TrieNode objectForByte:leaf:create:]((uint64_t)v1, 0);
      id v7 = -[TrieNode object]();
    }
    else
    {
      id v5 = *(int *)(v3 + 12 * v4 + 4);
      if (!v5)
      {
        v1 = 0;
        goto LABEL_8;
      }
      id v6 = [WeakRetained objects];
      id v7 = [v6 objectAtIndexedSubscript:v5];
    }
    v1 = (_DWORD *)v7;

LABEL_8:
  }
  return v1;
}

- (id)objectForKeyedSubscript:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2 + 2);
    id v5 = WeakRetained;
    if (WeakRetained && *((unsigned char *)WeakRetained + 8))
    {
      id v6 = objc_loadWeakRetained(v2 + 2);
      char v7 = [v6 compressed];

      if (v7)
      {
LABEL_7:
        -[TrieNode objectForKey:create:]((uint64_t)v2, v3, 0);
        v2 = (id *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      id v5 = objc_loadWeakRetained(v2 + 2);
      -[Trie compress]((void **)v5);
    }

    goto LABEL_7;
  }
LABEL_8:
  return v2;
}

- (id)copy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trie);
  uint64_t v4 = +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, self->_node, self->_offset);

  return v4;
}

- (id)objectForKey:(int)a3 create:
{
  if (a1)
  {
    id v5 = (id *)(a1 + 16);
    id v6 = a2;
    id WeakRetained = objc_loadWeakRetained(v5);
    uint64_t v8 = +[TrieNode nodeWithTrie:node:offset:]((uint64_t)TrieNode, WeakRetained, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 12));

    int v9 = -[TrieNode visit:create:]((uint64_t)v8, v6, a3);
    if (v9) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (id)nodeWithTrie:(uint64_t)a3 node:(uint64_t)a4 offset:
{
  id v6 = a2;
  self;
  char v7 = objc_opt_new();
  [v7 setTrie:v6];

  [v7 setNode:a3];
  [v7 setOffset:a4];
  return v7;
}

- (void)setTrie:(id)a3
{
}

- (void)setOffset:(int)a3
{
  self->_offset = a3;
}

- (void)setNode:(int)a3
{
  self->_node = a3;
}

- (int)offset
{
  return self->_offset;
}

- (int)node
{
  return self->_node;
}

- (Trie)trie
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trie);
  return (Trie *)WeakRetained;
}

@end