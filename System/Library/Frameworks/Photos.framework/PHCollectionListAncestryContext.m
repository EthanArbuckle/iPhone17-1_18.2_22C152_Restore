@interface PHCollectionListAncestryContext
- (NSFastEnumeration)allCollectionLists;
- (NSMutableDictionary)collectionListsByOID;
- (PHCollectionListAncestryContext)initWithCollectionLists:(id)a3;
- (id)folderForID:(id)a3;
- (void)setAllCollectionLists:(id)a3;
- (void)setCollectionListsByOID:(id)a3;
@end

@implementation PHCollectionListAncestryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListsByOID, 0);

  objc_storeStrong((id *)&self->_allCollectionLists, 0);
}

- (void)setCollectionListsByOID:(id)a3
{
}

- (NSMutableDictionary)collectionListsByOID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllCollectionLists:(id)a3
{
}

- (NSFastEnumeration)allCollectionLists
{
  return (NSFastEnumeration *)objc_getProperty(self, a2, 8, 1);
}

- (id)folderForID:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_collectionListsByOID, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PHCollectionListAncestryContext)initWithCollectionLists:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PHCollectionListAncestryContext;
  v6 = [(PHCollectionListAncestryContext *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_allCollectionLists, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    collectionListsByOID = v7->_collectionListsByOID;
    v7->_collectionListsByOID = v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = v7->_allCollectionLists;
    uint64_t v11 = [(NSFastEnumeration *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "objectID", (void)v18);
          if (v16) {
            [(NSMutableDictionary *)v7->_collectionListsByOID setObject:v15 forKeyedSubscript:v16];
          }
        }
        uint64_t v12 = [(NSFastEnumeration *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

@end