@interface EMFIndexManager
- (EMFIndexManager)initWithBundle:(id)a3;
- (EMFInvertedIndex)defaultIndex;
- (EMFInvertedIndex)stemmedIndex;
- (void)preheatIndexes;
- (void)setDefaultIndex:(id)a3;
- (void)setStemmedIndex:(id)a3;
@end

@implementation EMFIndexManager

- (EMFIndexManager)initWithBundle:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)EMFIndexManager;
    v6 = [(EMFIndexManager *)&v14 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_searchEngineBundle, a3);
      v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      defaultIndexLock = v7->_defaultIndexLock;
      v7->_defaultIndexLock = v8;

      v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      stemmedIndexLock = v7->_stemmedIndexLock;
      v7->_stemmedIndexLock = v10;
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (EMFInvertedIndex)defaultIndex
{
  [(NSLock *)self->_defaultIndexLock lock];
  if (!self->_triedLoadingDefaultIndex)
  {
    v3 = +[EMFIndexLoader defaultIndexForBundle:self->_searchEngineBundle];
    defaultIndex = self->_defaultIndex;
    self->_defaultIndex = v3;

    self->_triedLoadingDefaultIndex = 1;
  }
  [(NSLock *)self->_defaultIndexLock unlock];
  id v5 = self->_defaultIndex;
  return v5;
}

- (EMFInvertedIndex)stemmedIndex
{
  [(NSLock *)self->_stemmedIndexLock lock];
  if (!self->_triedLoadingStemmedIndex)
  {
    v3 = +[EMFIndexLoader stemmedIndexForBundle:self->_searchEngineBundle];
    stemmedIndex = self->_stemmedIndex;
    self->_stemmedIndex = v3;

    self->_triedLoadingStemmedIndex = 1;
  }
  [(NSLock *)self->_stemmedIndexLock unlock];
  id v5 = self->_stemmedIndex;
  return v5;
}

- (void)preheatIndexes
{
  id v3 = [(EMFIndexManager *)self defaultIndex];
  id v4 = [(EMFIndexManager *)self stemmedIndex];
}

- (void)setDefaultIndex:(id)a3
{
}

- (void)setStemmedIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stemmedIndex, 0);
  objc_storeStrong((id *)&self->_defaultIndex, 0);
  objc_storeStrong((id *)&self->_stemmedIndexLock, 0);
  objc_storeStrong((id *)&self->_defaultIndexLock, 0);
  objc_storeStrong((id *)&self->_searchEngineBundle, 0);
}

@end