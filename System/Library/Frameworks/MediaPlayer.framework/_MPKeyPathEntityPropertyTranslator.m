@interface _MPKeyPathEntityPropertyTranslator
+ (id)translatorForKeyPaths:(id)a3 valueTransformBlock:(id)a4;
+ (id)translatorForKeyPaths:(id)a3 valueTransformFunction:(void *)a4;
- (NSArray)sourceKeyPaths;
- (id)valueFromSource:(id)a3 context:(id)a4;
- (id)valueTransformBlock;
- (void)valueTransformFunction;
@end

@implementation _MPKeyPathEntityPropertyTranslator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueTransformBlock, 0);

  objc_storeStrong((id *)&self->_sourceKeyPaths, 0);
}

- (void)valueTransformFunction
{
  return self->_valueTransformFunction;
}

- (id)valueTransformBlock
{
  return self->_valueTransformBlock;
}

- (NSArray)sourceKeyPaths
{
  return self->_sourceKeyPaths;
}

- (id)valueFromSource:(id)a3 context:(id)a4
{
  valueTransformFunction = (void (*)(NSArray *, id, id))self->_valueTransformFunction;
  if (valueTransformFunction) {
    valueTransformFunction(self->_sourceKeyPaths, a3, a4);
  }
  else {
  v5 = (*((void (**)(void))self->_valueTransformBlock + 2))();
  }

  return v5;
}

+ (id)translatorForKeyPaths:(id)a3 valueTransformFunction:(void *)a4
{
  v5 = (NSArray *)a3;
  v6 = objc_alloc_init(_MPKeyPathEntityPropertyTranslator);
  sourceKeyPaths = v6->_sourceKeyPaths;
  v6->_sourceKeyPaths = v5;

  v6->_valueTransformFunction = a4;

  return v6;
}

+ (id)translatorForKeyPaths:(id)a3 valueTransformBlock:(id)a4
{
  v5 = (NSArray *)a3;
  id v6 = a4;
  v7 = objc_alloc_init(_MPKeyPathEntityPropertyTranslator);
  sourceKeyPaths = v7->_sourceKeyPaths;
  v7->_sourceKeyPaths = v5;
  v9 = v5;

  uint64_t v10 = MEMORY[0x19971E0F0](v6);
  id valueTransformBlock = v7->_valueTransformBlock;
  v7->_id valueTransformBlock = (id)v10;

  return v7;
}

@end