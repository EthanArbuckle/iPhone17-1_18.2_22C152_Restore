@interface LibraryLazyResultsEnumerator
- (int64_t)resultComplexity;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation LibraryLazyResultsEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong(&self->_block, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = self;
  if (self)
  {
    enumerator = self->_enumerator;
    if (!enumerator)
    {
      uint64_t v11 = (*((void (**)(void))v8->_block + 2))();
      v12 = v8->_enumerator;
      v8->_enumerator = (NSFastEnumeration *)v11;

      enumerator = v8->_enumerator;
    }
    v8 = enumerator;
  }
  unint64_t v13 = [(LibraryLazyResultsEnumerator *)v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v13;
}

- (int64_t)resultComplexity
{
  return self->_resultComplexity;
}

@end