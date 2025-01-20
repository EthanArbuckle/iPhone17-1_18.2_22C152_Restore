@interface IKDataSourceElement
+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (BOOL)areItemsBound;
- (BOOL)canProxyUnloadedChildElement:(id)a3;
- (IKChangeSet)itemsChangeSet;
- (IKDataSourceElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (IKDataSourceElementImplementing)impl;
- (NSArray)autoHighlightedChildElements;
- (NSArray)masterPrototypes;
- (NSArray)prototypes;
- (NSArray)proxiedItemElements;
- (NSDictionary)indexTitles;
- (id)_parsedIndexTitlesFromString:(id)a3;
- (id)applyUpdatesWithElement:(id)a3;
- (id)debugDescription;
- (id)elementForItemAtIndex:(int64_t)a3;
- (id)firstItemElement;
- (id)lastItemElement;
- (id)masterPrototypeForItemAtIndex:(unint64_t)a3;
- (id)prototypeForItemAtIndex:(int64_t)a3;
- (id)proxyElementForLoadedChildElement:(id)a3;
- (int64_t)autoHighlightIndex;
- (int64_t)indexOfItemForElement:(id)a3;
- (int64_t)numberOfItems;
- (void)appDocumentDidMarkStylesDirty;
- (void)configureUpdatesWithElement:(id)a3;
- (void)dealloc;
- (void)enumerateItemElementsUsingBlock:(id)a3;
- (void)loadIndex:(int64_t)a3;
- (void)resetImplicitUpdates;
- (void)resetProperty:(unint64_t)a3;
- (void)resetUpdates;
- (void)setAutoHighlightIndex:(int64_t)a3;
- (void)setAutoHighlightedChildElements:(id)a3;
- (void)setIndexTitles:(id)a3;
- (void)unloadIndex:(int64_t)a3;
@end

@implementation IKDataSourceElement

+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"indexTitles"])
  {
    unint64_t v11 = 3;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___IKDataSourceElement;
    unint64_t v11 = (unint64_t)objc_msgSendSuper2(&v13, sel_updateTypeForChangeInAttribute_fromValue_toValue_, v8, v9, v10);
  }

  return v11;
}

- (IKDataSourceElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a5;
  v31.receiver = self;
  v31.super_class = (Class)IKDataSourceElement;
  id v9 = [(IKViewElement *)&v31 initWithDOMElement:a3 parent:a4 elementFactory:v8];
  id v10 = v9;
  if (v9)
  {
    unint64_t v11 = [(IKViewElement *)v9 bindingController];
    v12 = [v11 binding];
    objc_super v13 = [v12 keyValues];
    v14 = [v13 objectForKeyedSubscript:@"items"];
    v10->_areItemsBound = v14 != 0;

    if (v10->_areItemsBound) {
      v15 = off_1E6DE3028;
    }
    else {
      v15 = off_1E6DE3030;
    }
    v16 = (void *)[objc_alloc(*v15) initWithDataSourceElement:v10];
    objc_storeStrong((id *)&v10->_impl, v16);

    v10->_implFlags.hasMasterPrototypes = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasProxiedItemElements = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasMasterPrototypeForItemAtIndex = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasResetImplicitUpdates = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasProxyElementForLoadedChildElement = objc_opt_respondsToSelector() & 1;
    v10->_implFlags.hasCanProxyUnloadedChildElement = objc_opt_respondsToSelector() & 1;
    [(IKDataSourceElementImplementing *)v10->_impl initializeWithElementFactory:v8];
    uint64_t v17 = [(IKDataSourceElementImplementing *)v10->_impl indexTitles];
    indexTitles = v10->_indexTitles;
    v10->_indexTitles = (NSDictionary *)v17;

    if ((![(IKViewElement *)v10 updateType] || [(IKViewElement *)v10 updateType] == 4)
      && !v10->_indexTitles)
    {
      v19 = [(IKViewElement *)v10 attributes];
      v20 = [v19 objectForKeyedSubscript:@"indexTitles"];
      uint64_t v21 = [(IKDataSourceElement *)v10 _parsedIndexTitlesFromString:v20];
      v22 = v10->_indexTitles;
      v10->_indexTitles = (NSDictionary *)v21;
    }
    v10->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
    if ([(IKViewElement *)v10 updateType] != 1)
    {
      v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      v24 = [(IKViewElement *)v10 unfilteredChildren];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__IKDataSourceElement_initWithDOMElement_parent_elementFactory___block_invoke;
      v29[3] = &unk_1E6DE4EC8;
      id v25 = v23;
      id v30 = v25;
      [v24 enumerateObjectsUsingBlock:v29];

      uint64_t v26 = [v25 count];
      if (v26) {
        v27 = (void *)[v25 copy];
      }
      else {
        v27 = 0;
      }
      objc_storeStrong((id *)&v10->_autoHighlightedChildElements, v27);
      if (v26) {
    }
      }
  }

  return v10;
}

void __64__IKDataSourceElement_initWithDOMElement_parent_elementFactory___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [v4 autoHighlightIdentifier];

  if (v3) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)dealloc
{
  [(IKDataSourceElementImplementing *)self->_impl teardown];
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  [(IKViewElement *)&v3 dealloc];
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(IKDataSourceElement *)self impl];
  v7 = [v6 debugDescription];
  id v8 = [v3 stringWithFormat:@"<%@: %p, impl = %@>", v5, self, v7];

  return v8;
}

- (void)configureUpdatesWithElement:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IKDataSourceElement;
  [(IKViewElement *)&v18 configureUpdatesWithElement:v4];
  unint64_t v5 = [(IKViewElement *)self updateType];
  id v6 = v4;
  if (-[IKDataSourceElement areItemsBound](self, "areItemsBound") && ([v6 areItemsBound] & 1) != 0
    || !-[IKDataSourceElement areItemsBound](self, "areItemsBound") && ([v6 areItemsBound] & 1) == 0)
  {
    v7 = [(IKDataSourceElement *)self impl];
    id v8 = [v6 impl];
    [v7 configureUpdatesWithImplementation:v8];
  }
  if (v5 == 3)
  {
    id v9 = [(IKDataSourceElement *)self indexTitles];

    if (!v9)
    {
      id v10 = [v6 attributes];
      unint64_t v11 = [v10 objectForKeyedSubscript:@"indexTitles"];
      v12 = [(IKViewElement *)self attributes];
      objc_super v13 = [v12 objectForKeyedSubscript:@"indexTitles"];
      char v14 = [v11 isEqualToString:v13];

      if (v14)
      {
        v15 = [v6 indexTitles];
        [(IKDataSourceElement *)self setIndexTitles:v15];
      }
      else
      {
        v15 = [(IKViewElement *)self attributes];
        v16 = [v15 objectForKeyedSubscript:@"indexTitles"];
        uint64_t v17 = [(IKDataSourceElement *)self _parsedIndexTitlesFromString:v16];
        [(IKDataSourceElement *)self setIndexTitles:v17];
      }
    }
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 updateType];
  id v6 = v4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13;
  v35 = __Block_byref_object_dispose__13;
  id v36 = 0;
  if (-[IKDataSourceElement areItemsBound](self, "areItemsBound") && ([v6 areItemsBound] & 1) != 0
    || !-[IKDataSourceElement areItemsBound](self, "areItemsBound") && ([v6 areItemsBound] & 1) == 0)
  {
    id v9 = [(IKDataSourceElement *)self impl];
    id v10 = [v6 impl];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke;
    v27[3] = &unk_1E6DE4EF0;
    id v30 = &v31;
    id v28 = v6;
    v29 = self;
    [v9 applyUpdatesWithImplementation:v10 usingUpdater:v27];

    id v8 = v28;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)IKDataSourceElement;
    uint64_t v7 = [(IKViewElement *)&v26 applyUpdatesWithElement:v6];
    id v8 = (void *)v32[5];
    v32[5] = v7;
  }

  if (v5 == 3)
  {
    unint64_t v11 = [v6 indexTitles];
    [(IKDataSourceElement *)self setIndexTitles:v11];

    self->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    uint64_t v17 = [v6 autoHighlightedChildElements];

    if (!v17) {
      goto LABEL_22;
    }
    id v14 = [v6 autoHighlightedChildElements];
    [(IKDataSourceElement *)self setAutoHighlightedChildElements:v14];
    goto LABEL_21;
  }
  self->_autoHighlightIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 4)
  {
    objc_super v18 = [v6 autoHighlightedChildElements];

    if (v18) {
      goto LABEL_22;
    }
    id v14 = [(IKDataSourceElement *)self autoHighlightedChildElements];
    [v6 setAutoHighlightedChildElements:v14];
  }
  else
  {
    if (v5 != 1) {
      goto LABEL_13;
    }
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    objc_super v13 = [(IKViewElement *)self unfilteredChildren];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke_2;
    v24 = &unk_1E6DE4EC8;
    id v14 = v12;
    id v25 = v14;
    [v13 enumerateObjectsUsingBlock:&v21];

    uint64_t v15 = objc_msgSend(v14, "count", v21, v22, v23, v24);
    if (v15) {
      v16 = (void *)[v14 copy];
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&self->_autoHighlightedChildElements, v16);
    if (v15) {
  }
    }
LABEL_21:

LABEL_22:
  id v19 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v19;
}

id __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)IKDataSourceElement;
  objc_super v3 = objc_msgSendSuper2(&v7, sel_applyUpdatesWithElement_, v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return v3;
}

void __47__IKDataSourceElement_applyUpdatesWithElement___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_super v3 = [v4 autoHighlightIdentifier];

  if (v3) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)resetProperty:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    [(IKDataSourceElement *)self setAutoHighlightIndex:0x7FFFFFFFFFFFFFFFLL];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [(IKDataSourceElement *)self autoHighlightedChildElements];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v8++) resetProperty:2];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(IKDataSourceElement *)self setAutoHighlightedChildElements:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IKDataSourceElement;
    -[IKViewElement resetProperty:](&v9, sel_resetProperty_);
  }
}

- (NSArray)prototypes
{
  uint64_t v2 = [(IKDataSourceElement *)self impl];
  objc_super v3 = [v2 prototypes];

  return (NSArray *)v3;
}

- (IKChangeSet)itemsChangeSet
{
  uint64_t v2 = [(IKDataSourceElement *)self impl];
  objc_super v3 = [v2 itemsChangeSet];

  return (IKChangeSet *)v3;
}

- (int64_t)numberOfItems
{
  uint64_t v2 = [(IKDataSourceElement *)self impl];
  int64_t v3 = [v2 numberOfItems];

  return v3;
}

- (id)prototypeForItemAtIndex:(int64_t)a3
{
  id v4 = [(IKDataSourceElement *)self impl];
  uint64_t v5 = [v4 prototypeForItemAtIndex:a3];

  return v5;
}

- (id)elementForItemAtIndex:(int64_t)a3
{
  id v4 = [(IKDataSourceElement *)self impl];
  uint64_t v5 = [v4 elementForItemAtIndex:a3];

  return v5;
}

- (int64_t)indexOfItemForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKDataSourceElement *)self impl];
  int64_t v6 = [v5 indexOfItemForElement:v4];

  return v6;
}

- (void)loadIndex:(int64_t)a3
{
  id v4 = [(IKDataSourceElement *)self impl];
  [v4 loadIndex:a3];
}

- (void)unloadIndex:(int64_t)a3
{
  id v4 = [(IKDataSourceElement *)self impl];
  [v4 unloadIndex:a3];
}

- (int64_t)autoHighlightIndex
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_autoHighlightIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [(IKDataSourceElement *)self autoHighlightedChildElements];

    if (v3)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v4 = [(IKDataSourceElement *)self autoHighlightedChildElements];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            long long v10 = [(IKDataSourceElement *)self impl];
            int64_t v11 = [v10 indexOfItemForElement:v9];

            if (v11 != 0x7FFFFFFFFFFFFFFFLL)
            {
              self->_autoHighlightIndex = v11;
              goto LABEL_13;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if (self->_autoHighlightIndex == 0x7FFFFFFFFFFFFFFFLL) {
        [(IKDataSourceElement *)self setAutoHighlightedChildElements:0];
      }
    }
  }
  return self->_autoHighlightIndex;
}

- (NSArray)masterPrototypes
{
  if (self->_implFlags.hasMasterPrototypes)
  {
    uint64_t v2 = [(IKDataSourceElementImplementing *)self->_impl masterPrototypes];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)proxiedItemElements
{
  if (self->_implFlags.hasProxiedItemElements)
  {
    uint64_t v2 = [(IKDataSourceElementImplementing *)self->_impl proxiedItemElements];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

- (id)masterPrototypeForItemAtIndex:(unint64_t)a3
{
  if (self->_implFlags.hasMasterPrototypeForItemAtIndex)
  {
    int64_t v3 = [(IKDataSourceElementImplementing *)self->_impl masterPrototypeForItemAtIndex:a3];
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (void)resetUpdates
{
  [(IKDataSourceElementImplementing *)self->_impl resetUpdates];
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  [(IKViewElement *)&v3 resetUpdates];
}

- (void)resetImplicitUpdates
{
  if (self->_implFlags.hasResetImplicitUpdates) {
    [(IKDataSourceElementImplementing *)self->_impl resetImplicitUpdates];
  }
  v3.receiver = self;
  v3.super_class = (Class)IKDataSourceElement;
  [(IKViewElement *)&v3 resetImplicitUpdates];
}

- (void)appDocumentDidMarkStylesDirty
{
  objc_super v3 = [(IKDataSourceElement *)self impl];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__IKDataSourceElement_appDocumentDidMarkStylesDirty__block_invoke;
  v4[3] = &unk_1E6DE3CC0;
  v4[4] = self;
  [v3 updateStylesUsingUpdater:v4];
}

id __52__IKDataSourceElement_appDocumentDidMarkStylesDirty__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)IKDataSourceElement;
  return objc_msgSendSuper2(&v2, sel_appDocumentDidMarkStylesDirty);
}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  if (self->_implFlags.hasProxyElementForLoadedChildElement)
  {
    objc_super v3 = [(IKDataSourceElementImplementing *)self->_impl proxyElementForLoadedChildElement:a3];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  if (self->_implFlags.hasCanProxyUnloadedChildElement) {
    return [(IKDataSourceElementImplementing *)self->_impl canProxyUnloadedChildElement:a3];
  }
  else {
    return 0;
  }
}

- (BOOL)areItemsBound
{
  return self->_areItemsBound;
}

- (id)_parsedIndexTitlesFromString:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    int64_t v11 = 0;
    goto LABEL_25;
  }
  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  uint64_t v6 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@" "];
  uint64_t v7 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  [v6 formUnionWithCharacterSet:v7];

  uint64_t v8 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  [v6 formUnionWithCharacterSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v3];
  if (([v9 isAtEnd] & 1) == 0)
  {
    unsigned int v12 = 0;
    long long v10 = 0;
    while (1)
    {
      if (v12 <= 1) {
        unsigned int v12 = 1;
      }
      long long v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v24 = 0;
      [v9 scanCharactersFromSet:v13 intoString:&v24];
      id v14 = v24;

      if (v14) {
        goto LABEL_19;
      }
      if (v12 == 2)
      {
        id v22 = 0;
        [v9 scanCharactersFromSet:v5 intoString:&v22];
        id v17 = v22;
        id v14 = v17;
        if (v17)
        {
          uint64_t v18 = [v17 integerValue];
          if (([v4 containsIndex:v18] & 1) == 0)
          {
            [v4 addIndex:v18];
            id v19 = [NSNumber numberWithInteger:v18];
            [v21 setObject:v10 forKeyedSubscript:v19];
          }
          id v16 = 0;
          unsigned int v12 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        id v23 = 0;
        [v9 scanCharactersFromSet:v6 intoString:&v23];
        id v15 = v23;
        if (v15)
        {
          id v16 = v15;
          unsigned int v12 = 2;
          id v14 = v16;
LABEL_16:

          long long v10 = v16;
          goto LABEL_19;
        }
        id v14 = 0;
      }
      unsigned int v12 = 3;
LABEL_19:

      if (([v9 isAtEnd] & 1) != 0 || v12 == 3) {
        goto LABEL_21;
      }
    }
  }
  long long v10 = 0;
LABEL_21:
  if ([v21 count]) {
    int64_t v11 = (void *)[v21 copy];
  }
  else {
    int64_t v11 = 0;
  }

LABEL_25:
  return v11;
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void)setIndexTitles:(id)a3
{
}

- (void)setAutoHighlightIndex:(int64_t)a3
{
  self->_autoHighlightIndex = a3;
}

- (NSArray)autoHighlightedChildElements
{
  return self->_autoHighlightedChildElements;
}

- (void)setAutoHighlightedChildElements:(id)a3
{
}

- (IKDataSourceElementImplementing)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_autoHighlightedChildElements, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
}

- (id)firstItemElement
{
  if ([(IKDataSourceElement *)self numberOfItems] < 1)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(IKDataSourceElement *)self elementForItemAtIndex:0];
  }
  return v3;
}

- (id)lastItemElement
{
  uint64_t v3 = [(IKDataSourceElement *)self numberOfItems];
  if (v3 < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(IKDataSourceElement *)self elementForItemAtIndex:v3 - 1];
  }
  return v4;
}

- (void)enumerateItemElementsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  char v9 = 0;
  uint64_t v5 = [(IKDataSourceElement *)self numberOfItems];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = [(IKDataSourceElement *)self elementForItemAtIndex:v7 - 1];
      v4[2](v4, v8, v7 - 1, &v9);

      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v9);
  }
}

@end