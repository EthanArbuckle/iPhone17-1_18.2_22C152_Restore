@interface IKDOMFeatureNavigationDocument
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (IKAppNavigationController)navigationController;
- (IKDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4;
- (NSString)featureName;
- (id)documents;
- (void)clear;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setNavigationController:(id)a3;
@end

@implementation IKDOMFeatureNavigationDocument

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [IKJSNavigationDocument alloc];
  v5 = [v3 appContext];
  v6 = [(IKJSNavigationDocument *)v4 initWithAppContext:v5 navigationController:v3];

  return v6;
}

- (IKDOMFeatureNavigationDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IKDOMFeatureNavigationDocument;
  v8 = [(IKDOMFeatureNavigationDocument *)&v15 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    uint64_t v10 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackItems = v8->_stackItems;
    v8->_stackItems = v12;
  }
  return v8;
}

- (void)setNavigationController:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = (IKAppNavigationController *)a3;
  p_appNavigationController = &self->_appNavigationController;
  if (self->_appNavigationController != v5)
  {
    objc_storeStrong((id *)&self->_appNavigationController, a3);
    if ([(NSMutableArray *)self->_stackItems count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = [(NSMutableArray *)self->_stackItems reverseObjectEnumerator];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        v18 = self;
        v19 = v5;
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)v21;
        do
        {
          uint64_t v12 = 0;
          v13 = v10;
          do
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v7);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
            objc_super v15 = *p_appNavigationController;
            v16 = objc_msgSend(v14, "document", v18, v19);
            v17 = [v14 options];
            if (v13) {
              [(IKAppNavigationController *)v15 insertDocument:v16 beforeDocument:v13 options:v17];
            }
            else {
              [(IKAppNavigationController *)v15 pushDocument:v16 options:v17];
            }

            uint64_t v10 = [v14 document];

            ++v12;
            v13 = v10;
          }
          while (v9 != v12);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);

        self = v18;
        v5 = v19;
      }

      [(NSMutableArray *)self->_stackItems removeAllObjects];
    }
  }
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    id v6 = a4;
    uint64_t v10 = (IKNavigationItem *)a3;
    -[IKAppNavigationController pushDocument:options:](appNavigationController, "pushDocument:options:");
  }
  else
  {
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = [[IKNavigationItem alloc] initWithDocument:v9 presentationOptions:v8];

    [(NSMutableArray *)self->_stackItems addObject:v10];
  }
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = v8;
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    id v11 = a5;
    id v12 = a3;
    [(IKAppNavigationController *)appNavigationController insertDocument:v12 beforeDocument:v9 options:v11];
  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__IKDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke;
    v19[3] = &unk_1E6DE3B98;
    id v20 = v8;
    id v14 = a5;
    id v15 = a3;
    uint64_t v16 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v19];
    v17 = [[IKNavigationItem alloc] initWithDocument:v15 presentationOptions:v14];

    v18 = self->_stackItems;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v18 addObject:v17];
    }
    else {
      [(NSMutableArray *)v18 insertObject:v17 atIndex:v16];
    }

    id v12 = v20;
  }
}

BOOL __72__IKDOMFeatureNavigationDocument_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    id v11 = a5;
    id v12 = a4;
    [(IKAppNavigationController *)appNavigationController replaceDocument:v9 withDocument:v12 options:v11];
  }
  else
  {
    stackItems = self->_stackItems;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__IKDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke;
    v19[3] = &unk_1E6DE3B98;
    id v20 = v8;
    id v14 = a5;
    id v15 = a4;
    uint64_t v16 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v19];
    v17 = [[IKNavigationItem alloc] initWithDocument:v15 presentationOptions:v14];

    v18 = self->_stackItems;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)v18 addObject:v17];
    }
    else {
      [(NSMutableArray *)v18 replaceObjectAtIndex:v16 withObject:v17];
    }

    id v12 = v20;
  }
}

BOOL __71__IKDOMFeatureNavigationDocument_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popDocument
{
  appNavigationController = self->_appNavigationController;
  if (appNavigationController) {
    [(IKAppNavigationController *)appNavigationController popDocument];
  }
  else {
    [(NSMutableArray *)self->_stackItems removeLastObject];
  }
}

- (void)popToDocument:(id)a3
{
  id v4 = a3;
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    [(IKAppNavigationController *)appNavigationController popToDocument:v4];
  }
  else
  {
    stackItems = self->_stackItems;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__IKDOMFeatureNavigationDocument_popToDocument___block_invoke;
    v8[3] = &unk_1E6DE3B98;
    id v9 = v4;
    uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v8];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableArray removeObjectsInRange:](self->_stackItems, "removeObjectsInRange:", v7, [(NSMutableArray *)self->_stackItems count] - v7);
    }
  }
}

BOOL __48__IKDOMFeatureNavigationDocument_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popToRootDocument
{
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    [(IKAppNavigationController *)appNavigationController popToRootDocument];
  }
  else
  {
    uint64_t v4 = [(NSMutableArray *)self->_stackItems count];
    if (v4 >= 2)
    {
      uint64_t v5 = v4 - 1;
      stackItems = self->_stackItems;
      -[NSMutableArray removeObjectsInRange:](stackItems, "removeObjectsInRange:", 1, v5);
    }
  }
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    [(IKAppNavigationController *)appNavigationController removeDocument:v4];
  }
  else
  {
    stackItems = self->_stackItems;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__IKDOMFeatureNavigationDocument_removeDocument___block_invoke;
    v8[3] = &unk_1E6DE3B98;
    id v9 = v4;
    uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v8];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v7];
    }
  }
}

BOOL __49__IKDOMFeatureNavigationDocument_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)documents
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  appNavigationController = self->_appNavigationController;
  if (appNavigationController)
  {
    BOOL v4 = [(IKAppNavigationController *)appNavigationController documents];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_stackItems;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "document", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)clear
{
  appNavigationController = self->_appNavigationController;
  if (appNavigationController) {
    [(IKAppNavigationController *)appNavigationController clear];
  }
  else {
    [(NSMutableArray *)self->_stackItems removeAllObjects];
  }
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKAppNavigationController)navigationController
{
  return self->_navigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_appNavigationController, 0);
}

@end