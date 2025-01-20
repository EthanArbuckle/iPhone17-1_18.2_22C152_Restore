@interface _MPMediaRemoteEntityPropertyTranslator
+ (id)translatorWithBlock:(id)a3;
+ (id)translatorWithKeyPath:(id)a3;
- (NSString)keyPath;
- (id)valueFromSource:(id)a3 context:(id)a4;
- (id)valueTransformBlock;
@end

@implementation _MPMediaRemoteEntityPropertyTranslator

- (id)valueFromSource:(id)a3 context:(id)a4
{
  keyPath = self->_keyPath;
  if (keyPath) {
    objc_msgSend(a3, "valueForKeyPath:", keyPath, a4);
  }
  else {
  v5 = (*((void (**)(void))self->_valueTransformBlock + 2))();
  }

  return v5;
}

+ (id)translatorWithBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = MEMORY[0x19971E0F0](v4);

  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (id)translatorWithKeyPath:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueTransformBlock, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (id)valueTransformBlock
{
  return self->_valueTransformBlock;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

@end