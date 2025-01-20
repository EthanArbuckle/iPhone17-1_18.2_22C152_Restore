@interface IKAppMenuBarDocument
+ (id)makeFeatureJSObjectForFeature:(id)a3;
- (IKAppContext)appContext;
- (IKAppMenuBarDocument)initWithDOMNode:(id)a3 featureName:(id)a4;
- (IKAppMenuBarDocumentDelegate)delegate;
- (IKViewElement)menuBarElement;
- (IKViewElement)selectedMenuItem;
- (NSString)featureName;
- (id)_menuItemElementForEntityUniqueIdentifier:(id)a3;
- (id)documentForEntityUniqueIdentifier:(id)a3;
- (id)documentForMenuItem:(id)a3;
- (id)documentOptionsForEntityUniqueIdentifier:(id)a3;
- (id)documentOptionsForMenuItem:(id)a3;
- (id)jsMenuBarDocument:(id)a3 documentForEntityUniqueIdentifier:(id)a4;
- (id)selectedItemForJsMenuBarDocument:(id)a3;
- (void)_evaluateDelegateBlockSync:(id)a3;
- (void)jsMenuBarDocument:(id)a3 setDocument:(id)a4 forEntityUniqueIdentifier:(id)a5 withOptions:(id)a6;
- (void)jsMenuBarDocument:(id)a3 setSelectedEntityUniqueIdentifier:(id)a4 withOptions:(id)a5;
- (void)migrateToViewElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuBarElement:(id)a3;
- (void)setSelectedMenuItem:(id)a3;
@end

@implementation IKAppMenuBarDocument

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  v4 = [IKJSMenuBarDocument alloc];
  v5 = [v3 appContext];
  v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  [(IKJSMenuBarDocument *)v6 setAppBridge:v3];
  return v6;
}

- (IKAppMenuBarDocument)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IKAppMenuBarDocument;
  v8 = [(IKAppMenuBarDocument *)&v19 init];
  if (v8)
  {
    v9 = [v6 appContext];
    objc_storeWeak((id *)&v8->_appContext, v9);

    objc_storeWeak((id *)&v8->_parentDOMNode, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    jsDocumentsByEntityUniqueIdentifier = v8->_jsDocumentsByEntityUniqueIdentifier;
    v8->_jsDocumentsByEntityUniqueIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    documentsByEntityUniqueIdentifier = v8->_documentsByEntityUniqueIdentifier;
    v8->_documentsByEntityUniqueIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    documentOptionsByEntityUniqueIdentifier = v8->_documentOptionsByEntityUniqueIdentifier;
    v8->_documentOptionsByEntityUniqueIdentifier = v14;

    uint64_t v16 = [v7 copy];
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v16;
  }
  return v8;
}

- (void)migrateToViewElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 elementName];
  if ([v5 isEqualToString:@"menuBar"]) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  objc_storeWeak((id *)&self->_menuBarElement, v6);

  if ([(NSMutableDictionary *)self->_jsDocumentsByEntityUniqueIdentifier count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
    v8 = [WeakRetained ownerDocument];
    v9 = [v8 navigationDocument];

    jsDocumentsByEntityUniqueIdentifier = self->_jsDocumentsByEntityUniqueIdentifier;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__IKAppMenuBarDocument_migrateToViewElement___block_invoke;
    v14[3] = &unk_1E6DE6BD8;
    id v15 = v9;
    id v11 = v9;
    [(NSMutableDictionary *)jsDocumentsByEntityUniqueIdentifier enumerateKeysAndObjectsUsingBlock:v14];
  }
  if (self->_selectedEntityUniqueIdentifier)
  {
    v12 = -[IKAppMenuBarDocument _menuItemElementForEntityUniqueIdentifier:](self, "_menuItemElementForEntityUniqueIdentifier:");
    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [v13 menuBarDocument:self didSelectMenuItem:v12 animated:0];
      }
    }
  }
}

uint64_t __45__IKAppMenuBarDocument_migrateToViewElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setNavigationDocument:*(void *)(a1 + 32)];
}

- (id)jsMenuBarDocument:(id)a3 documentForEntityUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__26;
  v18 = __Block_byref_object_dispose__26;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__IKAppMenuBarDocument_jsMenuBarDocument_documentForEntityUniqueIdentifier___block_invoke;
  v11[3] = &unk_1E6DE6C00;
  id v13 = &v14;
  id v8 = v7;
  id v12 = v8;
  [(IKAppMenuBarDocument *)self _evaluateDelegateBlockSync:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __76__IKAppMenuBarDocument_jsMenuBarDocument_documentForEntityUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a3 + 24) objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  return MEMORY[0x1F41817F8](v4, v6);
}

- (void)jsMenuBarDocument:(id)a3 setDocument:(id)a4 forEntityUniqueIdentifier:(id)a5 withOptions:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    id v12 = [v9 jsDocument];
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
      uint64_t v14 = [WeakRetained ownerDocument];
      id v15 = [v14 navigationDocument];
      [v12 setNavigationDocument:v15];

      [(NSMutableDictionary *)self->_jsDocumentsByEntityUniqueIdentifier setObject:v12 forKey:v10];
    }
    else
    {
      [(NSMutableDictionary *)self->_jsDocumentsByEntityUniqueIdentifier removeObjectForKey:v10];
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__IKAppMenuBarDocument_jsMenuBarDocument_setDocument_forEntityUniqueIdentifier_withOptions___block_invoke;
    v16[3] = &unk_1E6DE6C28;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    [(IKAppMenuBarDocument *)self _evaluateDelegateBlockSync:v16];
  }
}

void __92__IKAppMenuBarDocument_jsMenuBarDocument_setDocument_forEntityUniqueIdentifier_withOptions___block_invoke(void *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)*((void *)v5 + 3);
  uint64_t v7 = a1[4];
  if (v7)
  {
    [v6 setObject:v7 forKey:a1[5]];
    id v8 = (void *)*((void *)v5 + 4);
    uint64_t v9 = a1[6];
    if (v9)
    {
      [v8 setObject:v9 forKey:a1[5]];
      goto LABEL_7;
    }
    uint64_t v10 = a1[5];
  }
  else
  {
    [v6 removeObjectForKey:a1[5]];
    id v8 = (void *)*((void *)v5 + 4);
    uint64_t v10 = a1[5];
  }
  [v8 removeObjectForKey:v10];
LABEL_7:
  id WeakRetained = objc_loadWeakRetained((id *)v5 + 9);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)v5 + 8);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v5 _menuItemElementForEntityUniqueIdentifier:a1[5]],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v12 menuBarDocument:v5 didReplaceDocumentForMenuItem:v13],
          !v13))
    {
      if (objc_opt_respondsToSelector()) {
        [v12 menuBarDocument:v5 didReplaceDocumentForEntityWithUniqueIdentifier:a1[5]];
      }
      id v13 = 0;
    }
  }
}

- (id)selectedItemForJsMenuBarDocument:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDOMNode);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__26;
  v23 = __Block_byref_object_dispose__26;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__IKAppMenuBarDocument_selectedItemForJsMenuBarDocument___block_invoke;
  v18[3] = &unk_1E6DE6C50;
  v18[4] = &v19;
  [(IKAppMenuBarDocument *)self _evaluateDelegateBlockSync:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [WeakRetained childNodesAsArray];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 getAttribute:@"itmlID"];
          int v11 = [v10 isEqualToString:v20[5]];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  _Block_object_dispose(&v19, 8);
  return v6;
}

void __57__IKAppMenuBarDocument_selectedItemForJsMenuBarDocument___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)jsMenuBarDocument:(id)a3 setSelectedEntityUniqueIdentifier:(id)a4 withOptions:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__IKAppMenuBarDocument_jsMenuBarDocument_setSelectedEntityUniqueIdentifier_withOptions___block_invoke;
    v9[3] = &unk_1E6DE6C28;
    id v10 = v7;
    int v11 = self;
    id v12 = v8;
    [(IKAppMenuBarDocument *)self _evaluateDelegateBlockSync:v9];
  }
}

void __88__IKAppMenuBarDocument_jsMenuBarDocument_setSelectedEntityUniqueIdentifier_withOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = v4 + 5;
  id v6 = *(id *)(a1 + 32);
  if (v4[5] != v6)
  {
    int v11 = v4;
    objc_storeStrong(v4 + 5, v6);
    id v7 = [*(id *)(a1 + 40) _menuItemElementForEntityUniqueIdentifier:*v5];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained(v11 + 8);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = *(void *)(a1 + 40);
        id v10 = [*(id *)(a1 + 48) objectForKey:@"animated"];
        objc_msgSend(WeakRetained, "menuBarDocument:didSelectMenuItem:animated:", v9, v7, objc_msgSend(v10, "BOOLValue"));
      }
    }

    uint64_t v4 = v11;
  }
}

- (id)documentForMenuItem:(id)a3
{
  uint64_t v4 = [a3 itmlID];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_documentsByEntityUniqueIdentifier objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)documentOptionsForMenuItem:(id)a3
{
  uint64_t v4 = [a3 itmlID];
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_documentOptionsByEntityUniqueIdentifier objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)documentForEntityUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_documentsByEntityUniqueIdentifier, "objectForKey:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)documentOptionsForEntityUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSMutableDictionary objectForKey:](self->_documentOptionsByEntityUniqueIdentifier, "objectForKey:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_menuItemElementForEntityUniqueIdentifier:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarElement);
  if (!WeakRetained)
  {
    id v19 = 0;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v39 = v6;
  if (!v39)
  {
    id v19 = 0;
    goto LABEL_41;
  }
  id v34 = WeakRetained;
  id v35 = v4;
  [WeakRetained children];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v8) {
    goto LABEL_37;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v45;
  uint64_t v36 = *(void *)v45;
  id v37 = v7;
LABEL_8:
  uint64_t v11 = 0;
  uint64_t v38 = v9;
  while (2)
  {
    if (*(void *)v45 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
    id v13 = [v12 elementName];
    if ([v13 isEqualToString:@"menuItem"])
    {

LABEL_14:
      id v16 = v12;
      long long v17 = [v16 itmlID];
      int v18 = [v17 isEqualToString:v39];

      if (v18)
      {
        id v16 = v16;
        id v19 = v16;
      }
      else
      {
        id v19 = 0;
      }
      goto LABEL_34;
    }
    long long v14 = [v12 elementName];
    int v15 = [v14 isEqualToString:@"searchMenuItem"];

    if (v15) {
      goto LABEL_14;
    }
    v20 = [v12 elementName];
    int v21 = [v20 isEqualToString:@"section"];

    if (!v21) {
      goto LABEL_35;
    }
    v22 = [v12 children];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v16 = v22;
    uint64_t v23 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v23)
    {
      id v19 = 0;
      goto LABEL_33;
    }
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v16);
        }
        v27 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v28 = [v27 elementName];
        if ([v28 isEqualToString:@"menuItem"])
        {
        }
        else
        {
          v29 = [v27 elementName];
          int v30 = [v29 isEqualToString:@"searchMenuItem"];

          if (!v30) {
            continue;
          }
        }
        id v19 = v27;
        v31 = [v19 itmlID];
        char v32 = [v31 isEqualToString:v39];

        if (v32) {
          goto LABEL_31;
        }
      }
      uint64_t v24 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v24);
    id v19 = 0;
LABEL_31:
    uint64_t v10 = v36;
    id v7 = v37;
    uint64_t v9 = v38;
LABEL_33:

LABEL_34:
    if (!v19)
    {
LABEL_35:
      if (++v11 != v9) {
        continue;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (!v9)
      {
LABEL_37:
        id v19 = 0;
        break;
      }
      goto LABEL_8;
    }
    break;
  }

  id WeakRetained = v34;
  id v4 = v35;
LABEL_41:

LABEL_42:
  return v19;
}

- (IKViewElement)selectedMenuItem
{
  if (self->_selectedEntityUniqueIdentifier)
  {
    v2 = -[IKAppMenuBarDocument _menuItemElementForEntityUniqueIdentifier:](self, "_menuItemElementForEntityUniqueIdentifier:");
  }
  else
  {
    v2 = 0;
  }
  return (IKViewElement *)v2;
}

- (void)setSelectedMenuItem:(id)a3
{
  id v4 = [a3 itmlID];
  id v5 = v4;
  selectedEntityUniqueIdentifier = self->_selectedEntityUniqueIdentifier;
  p_selectedEntityUniqueIdentifier = &self->_selectedEntityUniqueIdentifier;
  if (selectedEntityUniqueIdentifier != v4)
  {
    uint64_t v8 = v4;
    objc_storeStrong((id *)p_selectedEntityUniqueIdentifier, v4);
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(IKAppMenuBarDocument *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__IKAppMenuBarDocument__evaluateDelegateBlockSync___block_invoke;
  v7[3] = &unk_1E6DE47E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 evaluateDelegateBlockSync:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__IKAppMenuBarDocument__evaluateDelegateBlockSync___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, WeakRetained);
    }
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppMenuBarDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKAppMenuBarDocumentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IKViewElement)menuBarElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuBarElement);
  return (IKViewElement *)WeakRetained;
}

- (void)setMenuBarElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuBarElement);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_selectedEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_documentOptionsByEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_documentsByEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_jsDocumentsByEntityUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parentDOMNode);
}

@end