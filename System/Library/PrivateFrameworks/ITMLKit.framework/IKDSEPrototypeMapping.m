@interface IKDSEPrototypeMapping
+ (id)prototypeMappingFromAppPrototype:(id)a3 dataSourceElement:(id)a4 elementFactory:(id)a5;
- (IKAppPrototypeIdentifier)identifier;
- (IKDSEPrototypeMapping)initWithIdentifier:(id)a3 viewElement:(id)a4 usageIndexes:(id)a5;
- (IKViewElement)viewElement;
- (NSIndexSet)usageIndexes;
@end

@implementation IKDSEPrototypeMapping

+ (id)prototypeMappingFromAppPrototype:(id)a3 dataSourceElement:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(v8, "dsepm_viewElement");
  uint64_t v12 = [v9 updateType];
  if (!v11 || v12 == 4)
  {
    v13 = [v8 prototype];
    v14 = [v13 domElement];

    v15 = [v8 prototype];
    v16 = [v15 grouping];

    if (v16)
    {
      v17 = +[IKAppContext currentAppContext];
      v18 = [v17 jsContext];

      v19 = [v14 cloneNode:1];
      [v19 _setAliasOf:v14];
      v20 = (void *)MEMORY[0x1E4F30938];
      v21 = [v8 groupingValues];
      v22 = [v20 valueWithObject:v21 inContext:v18];
      [v19 setDataItem:v22];

      v14 = v19;
    }
    uint64_t v23 = [v10 elementForDOMElement:v14 parent:v9];

    objc_msgSend(v8, "dsepm_setViewElement:", v23);
    v11 = (void *)v23;
  }
  id v24 = objc_alloc((Class)a1);
  v25 = [v8 identifier];
  v26 = [v8 usageIndexes];
  v27 = (void *)[v24 initWithIdentifier:v25 viewElement:v11 usageIndexes:v26];

  return v27;
}

- (IKDSEPrototypeMapping)initWithIdentifier:(id)a3 viewElement:(id)a4 usageIndexes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IKDSEPrototypeMapping;
  uint64_t v12 = [(IKDSEPrototypeMapping *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_viewElement, a4);
    uint64_t v14 = [v11 copy];
    usageIndexes = v13->_usageIndexes;
    v13->_usageIndexes = (NSIndexSet *)v14;
  }
  return v13;
}

- (IKAppPrototypeIdentifier)identifier
{
  return self->_identifier;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (NSIndexSet)usageIndexes
{
  return self->_usageIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageIndexes, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end