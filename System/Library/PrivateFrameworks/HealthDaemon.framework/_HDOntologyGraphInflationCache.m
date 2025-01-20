@interface _HDOntologyGraphInflationCache
- (_HDOntologyGraphInflationCache)init;
@end

@implementation _HDOntologyGraphInflationCache

- (_HDOntologyGraphInflationCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)_HDOntologyGraphInflationCache;
  v2 = [(_HDOntologyGraphInflationCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    conceptsByID = v2->_conceptsByID;
    v2->_conceptsByID = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    conceptIDStack = v2->_conceptIDStack;
    v2->_conceptIDStack = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conceptIDStack, 0);

  objc_storeStrong((id *)&self->_conceptsByID, 0);
}

@end