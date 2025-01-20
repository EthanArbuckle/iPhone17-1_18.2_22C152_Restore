@interface IKTemplateTreeNode
- (IKTemplateTreeNode)initWithNodeName:(id)a3 styleOverrides:(id)a4 parentNode:(id)a5;
- (IKTemplateTreeNode)parentNode;
- (IKViewElementStyle)styleOverrides;
- (IKViewElementStyleComposer)styleComposer;
- (NSDictionary)childNodes;
- (NSString)nodeName;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChildNodes:(id)a3;
- (void)setStyleComposer:(id)a3;
@end

@implementation IKTemplateTreeNode

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(IKTemplateTreeNode *)self nodeName];
  v6 = [(IKTemplateTreeNode *)self styleOverrides];
  v7 = (void *)[v4 initWithNodeName:v5 styleOverrides:v6 parentNode:0];

  v8 = (void *)MEMORY[0x1E4F1CA60];
  v9 = [(IKTemplateTreeNode *)self childNodes];
  v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(IKTemplateTreeNode *)self childNodes];
  uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v16 = [(IKTemplateTreeNode *)self childNodes];
        v17 = [v16 objectForKey:v15];
        v18 = (id *)[v17 copy];

        objc_storeWeak(v18 + 1, v7);
        [v10 setObject:v18 forKey:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v7 setChildNodes:v10];
  [v7 setStyleComposer:0];

  return v7;
}

- (IKTemplateTreeNode)initWithNodeName:(id)a3 styleOverrides:(id)a4 parentNode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IKTemplateTreeNode;
  uint64_t v11 = [(IKTemplateTreeNode *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(v8, "ik_sharedInstance");
    nodeName = v11->_nodeName;
    v11->_nodeName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_styleOverrides, a4);
    objc_storeWeak((id *)&v11->_parentNode, v10);
  }

  return v11;
}

- (void)setChildNodes:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    v4 = (NSDictionary *)[v6 copy];
    childNodes = self->_childNodes;
    self->_childNodes = v4;
  }
  else
  {
    childNodes = self->_childNodes;
    self->_childNodes = 0;
  }
}

- (IKTemplateTreeNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  return (IKTemplateTreeNode *)WeakRetained;
}

- (NSString)nodeName
{
  return self->_nodeName;
}

- (IKViewElementStyle)styleOverrides
{
  return self->_styleOverrides;
}

- (NSDictionary)childNodes
{
  return self->_childNodes;
}

- (IKViewElementStyleComposer)styleComposer
{
  return self->_styleComposer;
}

- (void)setStyleComposer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleComposer, 0);
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_storeStrong((id *)&self->_styleOverrides, 0);
  objc_storeStrong((id *)&self->_nodeName, 0);
  objc_destroyWeak((id *)&self->_parentNode);
}

@end