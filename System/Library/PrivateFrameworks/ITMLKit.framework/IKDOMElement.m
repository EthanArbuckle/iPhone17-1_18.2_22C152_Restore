@interface IKDOMElement
+ (id)_filteredAttributes;
- (BOOL)_isPartOfPrototypeElement;
- (BOOL)_isPrototypeElement;
- (BOOL)hasAttribute:(id)a3;
- (BOOL)hasAttributes;
- (IKDOMElement)_aliasOf;
- (IKDOMElement)firstElementChild;
- (IKDOMElement)lastElementChild;
- (IKDOMHTMLCollection)children;
- (IKDOMNamedNodeMap)attributes;
- (IKStyleableElement)parentStyleableElement;
- (IKViewElementStyleComposer)styleComposer;
- (NSString)innerHTML;
- (NSString)outerHTML;
- (NSString)tagName;
- (_NSRange)domib_visibleIndexRange;
- (id)_attributes;
- (id)asPrivateIKJSDOMElement;
- (id)childElementByTagName:(id)a3;
- (id)childElements;
- (id)childElementsByTagName:(id)a3;
- (id)domb_boundCSSRule;
- (id)domb_dataBinding;
- (id)domb_domBindingController;
- (id)domb_mutationRuleSet;
- (id)dombs_items;
- (id)domib_appDataSet;
- (id)domib_itemsChangeSet;
- (id)domp_derivativeDOMElementsBySelector;
- (id)domp_prototype;
- (id)getAttribute:(id)a3;
- (id)getElementsByTagName:(id)a3;
- (id)ik_templateElementCSSSelectorList;
- (id)ik_templateName;
- (id)ikve_prototypesID;
- (id)ikve_rulesID;
- (id)objectForKeyedSubscript:(id)a3;
- (id)textContent;
- (int64_t)nodeType;
- (unint64_t)childElementCount;
- (void)_markUpdatedForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (void)_setAliasOf:(id)a3;
- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4;
- (void)domb_setBoundCSSRule:(id)a3;
- (void)domb_setDOMBindingController:(id)a3;
- (void)domb_setDataBinding:(id)a3;
- (void)domb_setMutationRuleSet:(id)a3;
- (void)dombs_setItems:(id)a3;
- (void)domib_setAppDataSet:(id)a3;
- (void)domib_setItemsChangeSet:(id)a3;
- (void)domib_setVisibleIndexRange:(_NSRange)a3;
- (void)domp_setDerivativeDOMElementsBySelector:(id)a3;
- (void)domp_setPrototype:(id)a3;
- (void)ikve_setPrototypesID:(id)a3;
- (void)ikve_setRulesID:(id)a3;
- (void)insertAdjacentHTML:(id)a3 :(id)a4;
- (void)removeAttribute:(id)a3;
- (void)setAttribute:(id)a3 :(id)a4;
- (void)setAttributeValue:(id)a3 withName:(id)a4;
- (void)setInnerHTML:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setOuterHTML:(id)a3;
- (void)setStyleComposer:(id)a3;
- (void)setTextContent:(id)a3;
@end

@implementation IKDOMElement

- (void)domib_setAppDataSet:(id)a3
{
}

- (id)domib_appDataSet
{
  return objc_getAssociatedObject(self, "domib_appDataSet");
}

- (void)domib_setItemsChangeSet:(id)a3
{
}

- (id)domib_itemsChangeSet
{
  return objc_getAssociatedObject(self, "domib_itemsChangeSet");
}

- (void)domib_setVisibleIndexRange:(_NSRange)a3
{
  _NSRange v5 = a3;
  v4 = [MEMORY[0x1E4F29238] value:&v5 withObjCType:"{_NSRange=QQ}"];
  objc_setAssociatedObject(self, "domib_visibleIndexRange", v4, (void *)0x301);
}

- (_NSRange)domib_visibleIndexRange
{
  NSUInteger v5 = 0;
  NSUInteger v6 = 0;
  v2 = objc_getAssociatedObject(self, "domib_visibleIndexRange");
  [v2 getValue:&v5];

  NSUInteger v3 = v5;
  NSUInteger v4 = v6;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)asPrivateIKJSDOMElement
{
  if ([(IKDOMElement *)self conformsToProtocol:&unk_1F3E48EB8]) {
    NSUInteger v3 = self;
  }
  else {
    NSUInteger v3 = 0;
  }
  return v3;
}

- (void)setAttributeValue:(id)a3 withName:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  cachedAttributes = self->_cachedAttributes;
  self->_cachedAttributes = 0;

  v8 = [(IKDOMNode *)self nodePtr];
  if (v8)
  {
    v9 = v8;
    if ([v6 length])
    {
      id v10 = v6;
      v11 = (xmlNode *)xmlHasProp(v9, (const xmlChar *)[v10 UTF8String]);
      v12 = +[IKDOMNode nodeForNodePtr:v11];
      if (v12)
      {
        xmlUnlinkNode(v11);
        +[IKDOMNode handleNodeParentDidChange:v11];
      }
      v13 = (const xmlChar *)[v10 UTF8String];
      if (v15)
      {
        v14 = (xmlNode *)xmlSetProp(v9, v13, (const xmlChar *)[v15 UTF8String]);
        xmlSetTreeDoc(v14, v9->doc);
      }
      else
      {
        xmlUnsetProp(v9, v13);
      }
    }
  }
}

- (NSString)tagName
{
  v2 = [(IKDOMNode *)self nodePtr];
  if (v2)
  {
    if (LODWORD(v2->info) != 18)
    {
      uint64_t info = v2[2].info;
      if (info)
      {
        uint64_t v6 = *(void *)(info + 24);
        if (v6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%s:%s", v6, v2->data);
          v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      uint64_t data = (uint64_t)v2->data;
      NSUInteger v4 = NSString;
      goto LABEL_9;
    }
    uint64_t data = v2->length;
    if (data)
    {
      NSUInteger v4 = NSString;
LABEL_9:
      v2 = [v4 stringWithUTF8String:data];
      goto LABEL_11;
    }
    v2 = &stru_1F3E09950;
  }
LABEL_11:
  return (NSString *)v2;
}

- (id)getAttribute:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(IKDOMNode *)self nodePtr];
  if (v5)
  {
    if ([v4 length]
      && (Prop = xmlGetProp(v5, (const xmlChar *)[v4 UTF8String])) != 0)
    {
      v7 = Prop;
      NSUInteger v5 = [NSString stringWithUTF8String:Prop];
      ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v7);
    }
    else
    {
      NSUInteger v5 = 0;
    }
  }
  if (v5) {
    v8 = (__CFString *)v5;
  }
  else {
    v8 = &stru_1F3E09950;
  }
  v9 = v8;

  return v9;
}

- (void)setAttribute:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 isEqualToString:@"autoHighlight"];
  int v9 = [v7 isEqualToString:@"binding"];
  id v10 = [(IKDOMElement *)self _attributes];
  id v12 = [v10 objectForKeyedSubscript:v7];

  [(IKDOMElement *)self setAttributeValue:v6 withName:v7];
  [(IKDOMElement *)self _markUpdatedForChangeInAttribute:v7 fromValue:v12 toValue:v6];

  if (v8)
  {
    v11 = [(IKDOMNode *)self jsNodeData];
    [v11 setAutoHighlightRead:0];
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    v11 = [(IKDOMNode *)self jsNodeData];
    [v11 setBindingParsed:0];
  }

LABEL_6:
}

- (void)removeAttribute:(id)a3
{
  id v8 = a3;
  int v4 = [v8 isEqualToString:@"autoHighlight"];
  if (-[IKDOMNode nodePtr](self, "nodePtr") && [v8 length])
  {
    NSUInteger v5 = [(IKDOMElement *)self _attributes];
    id v6 = [v5 objectForKeyedSubscript:v8];

    [(IKDOMElement *)self setAttributeValue:0 withName:v8];
    [(IKDOMElement *)self _markUpdatedForChangeInAttribute:v8 fromValue:v6 toValue:0];
    if (v4)
    {
      id v7 = [(IKDOMNode *)self jsNodeData];
      [v7 setAutoHighlightRead:0];
    }
  }
}

- (id)getElementsByTagName:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(IKJSObject *)self appContext];
  id v6 = [@".//" stringByAppendingString:v4];

  id v7 = +[IKDOMNodeList nodeListWithAppContext:v5 contextNode:self xpath:v6];

  return v7;
}

- (BOOL)hasAttribute:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(IKDOMNode *)self nodePtr];
  if (v5)
  {
    if ([v4 length]) {
      LOBYTE(v5) = xmlHasProp(v5, (const xmlChar *)[v4 UTF8String]) != 0;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)hasAttributes
{
  uint64_t v2 = (uint64_t)[(IKDOMNode *)self nodePtr][88];
  return v2 && *(void *)(v2 + 48) != 0;
}

- (IKDOMNamedNodeMap)attributes
{
  NSUInteger v3 = [IKDOMNamedNodeMap alloc];
  id v4 = [(IKJSObject *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__IKDOMElement_attributes__block_invoke;
  v7[3] = &unk_1E6DE4C60;
  v7[4] = self;
  NSUInteger v5 = [(IKDOMNodeList *)v3 initWithAppContext:v4 contextNode:self evaluationBlock:v7];

  return v5;
}

id __26__IKDOMElement_attributes__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) nodePtr];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 88);
  }
  else {
    uint64_t v3 = 0;
  }
  for (i = [MEMORY[0x1E4F1CA48] array];
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    NSUInteger v5 = [(id)objc_opt_class() _filteredAttributes];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (xmlStrEqual(*(const xmlChar **)(v3 + 16), (const xmlChar *)[*(id *)(*((void *)&v13 + 1) + 8 * v9) UTF8String]))
        {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v7) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:

      id v10 = [*(id *)(a1 + 32) appContext];
      NSUInteger v5 = +[IKDOMNode nodeWithAppContext:v10 nodePtr:v3];

      [i addObject:v5];
    }
  }
  if (![i count])
  {

    i = 0;
  }
  v11 = (void *)[i copy];

  return v11;
}

- (id)childElements
{
  cachedChildElements = self->_cachedChildElements;
  if (!cachedChildElements)
  {
    id v4 = [(IKDOMNode *)self nodePtr];
    if (v4) {
      children = v4->children;
    }
    else {
      children = 0;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    while (children)
    {
      uint64_t v7 = [(IKJSObject *)self appContext];
      uint64_t v8 = +[IKDOMNode nodeWithAppContext:v7 nodePtr:children];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 addObject:v8];
      }
      children = children->next;
    }
    uint64_t v9 = (NSArray *)[v6 copy];
    id v10 = self->_cachedChildElements;
    self->_cachedChildElements = v9;

    cachedChildElements = self->_cachedChildElements;
  }
  v11 = [(NSArray *)cachedChildElements count];
  if (v11) {
    v11 = self->_cachedChildElements;
  }
  return v11;
}

- (id)childElementByTagName:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(IKDOMNode *)self nodePtr];
  if (v5 && (children = v5->children) != 0)
  {
    while (1)
    {
      uint64_t v7 = [(IKJSObject *)self appContext];
      uint64_t v8 = +[IKDOMNode nodeWithAppContext:v7 nodePtr:children];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 tagName];
        char v10 = [v9 isEqualToString:v4];

        if (v10) {
          break;
        }
      }
      children = children->next;

      if (!children) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)childElementsByTagName:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(IKDOMNode *)self nodePtr];
  if (v5) {
    children = v5->children;
  }
  else {
    children = 0;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  while (children)
  {
    uint64_t v8 = [(IKJSObject *)self appContext];
    uint64_t v9 = +[IKDOMNode nodeWithAppContext:v8 nodePtr:children];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v10 = [v9 tagName];
      int v11 = [v10 isEqualToString:v4];

      if (v11) {
        [v7 addObject:v9];
      }
    }
    children = children->next;
  }
  if ([v7 count]) {
    id v12 = v7;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (IKDOMHTMLCollection)children
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMElement;
  uint64_t v2 = [(IKDOMNode *)&v4 children];
  return (IKDOMHTMLCollection *)v2;
}

- (IKDOMElement)firstElementChild
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMElement;
  uint64_t v2 = [(IKDOMNode *)&v4 firstElementChild];
  return (IKDOMElement *)v2;
}

- (IKDOMElement)lastElementChild
{
  v4.receiver = self;
  v4.super_class = (Class)IKDOMElement;
  uint64_t v2 = [(IKDOMNode *)&v4 lastElementChild];
  return (IKDOMElement *)v2;
}

- (unint64_t)childElementCount
{
  v3.receiver = self;
  v3.super_class = (Class)IKDOMElement;
  return [(IKDOMNode *)&v3 childElementCount];
}

- (BOOL)_isPrototypeElement
{
  objc_super v3 = [(IKDOMNode *)self parentNode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [(IKDOMNode *)self parentNode];
  }
  else
  {
    objc_super v4 = 0;
  }

  NSUInteger v5 = [v4 elementName];
  if ([v5 isEqualToString:@"prototypes"])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = [(IKDOMElement *)self _aliasOf];
    char v6 = [v7 _isPrototypeElement];
  }
  return v6;
}

- (BOOL)_isPartOfPrototypeElement
{
  if ([(IKDOMElement *)self _isPrototypeElement]) {
    return 1;
  }
  objc_super v4 = [(IKDOMNode *)self parentNode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v5 = [(IKDOMNode *)self parentNode];
    char v3 = [v5 _isPartOfPrototypeElement];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)_attributes
{
  cachedAttributes = self->_cachedAttributes;
  if (!cachedAttributes)
  {
    objc_super v4 = [(IKDOMNode *)self nodePtr];
    NSUInteger v5 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v4)
    {
      properties = v4->properties;
      if (properties)
      {
        uint64_t v7 = (void (**)(xmlChar *))MEMORY[0x1E4FBA9D0];
        do
        {
          String = xmlNodeListGetString(v4->doc, properties->children, 1);
          uint64_t v9 = [NSString stringWithUTF8String:properties->name];
          char v10 = objc_msgSend(v9, "ik_sharedInstance");

          int v11 = [NSString stringWithUTF8String:String];
          [v5 setObject:v11 forKey:v10];
          (*v7)(String);

          properties = properties->next;
        }
        while (properties);
      }
    }
    id v12 = (NSDictionary *)[v5 copy];
    id v13 = self->_cachedAttributes;
    self->_cachedAttributes = v12;

    cachedAttributes = self->_cachedAttributes;
  }
  return cachedAttributes;
}

- (void)_markUpdatedForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [(IKDOMElement *)self nodeName];
  int v11 = +[IKViewElementFactory elementClassByTagName:v10];

  if (v11)
  {
    uint64_t v12 = [(objc_class *)v11 updateTypeForChangeInAttribute:v15 fromValue:v8 toValue:v9];
    switch(v12)
    {
      case 0:
        goto LABEL_9;
      case 1:
        id v13 = self;
        uint64_t v14 = 0;
        goto LABEL_8;
      case 3:
        [(IKDOMElement *)self childrenUpdatedWithUpdatedChildNodes:0 notify:1];
        goto LABEL_9;
    }
  }
  id v13 = self;
  uint64_t v14 = 1;
LABEL_8:
  [(IKDOMNode *)v13 updatedAndMark:v14 notify:1];
LABEL_9:
}

- (int64_t)nodeType
{
  return 1;
}

- (id)textContent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(IKDOMNode *)self nodePtr])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v4 = [(IKDOMNode *)self childNodesAsArray];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v9 nodeType] != 8 && objc_msgSend(v9, "nodeType") != 7)
          {
            char v10 = [v9 textContent];
            if ([v10 length]) {
              [v3 appendString:v10];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setTextContent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IKDOMNode *)self nodePtr])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v5 = [(IKDOMNode *)self childNodesAsArray];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = *(void *)v17;
        uint64_t v9 = v6;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            id v11 = [(IKDOMNode *)self performDOMOperation:2 newNode:0 refNode:*(void *)(*((void *)&v16 + 1) + 8 * v10++)];
          }
          while (v9 != v10);
          uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v9);
      }

      if ([v4 length])
      {
        long long v12 = [(IKDOMNode *)self ownerDocument];
        long long v13 = [v12 createTextNode:v4];
        id v14 = [(IKDOMNode *)self performDOMOperation:0 newNode:v13 refNode:0];

        if (v7) {
          goto LABEL_15;
        }
      }
      else
      {
        long long v13 = 0;
        if (v7) {
          goto LABEL_15;
        }
      }
      if (!v13)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_15:
      if (v13)
      {
        v20 = v13;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
        [(IKDOMElement *)self childrenUpdatedWithUpdatedChildNodes:v15 notify:1];
      }
      else
      {
        [(IKDOMElement *)self childrenUpdatedWithUpdatedChildNodes:0 notify:1];
      }
      goto LABEL_18;
    }
  }
LABEL_19:
}

- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  cachedChildElements = self->_cachedChildElements;
  self->_cachedChildElements = 0;
  id v7 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKDOMElement;
  [(IKDOMNode *)&v8 childrenUpdatedWithUpdatedChildNodes:v7 notify:v4];
}

- (IKStyleableElement)parentStyleableElement
{
  id v3 = [(IKDOMNode *)self parentNode];
  if (v3)
  {
    BOOL v4 = v3;
    uint64_t v5 = [(IKDOMNode *)self parentNode];
    if ([v5 nodeType] == 1)
    {
      uint64_t v6 = [(IKDOMNode *)self parentNode];
      id v7 = [v6 nodeName];
      char v8 = [v7 isEqualToString:@"document"];

      if ((v8 & 1) == 0)
      {
        id v3 = [(IKDOMNode *)self parentNode];
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v3 = 0;
  }
LABEL_7:
  return (IKStyleableElement *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadataDict objectForKey:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  metadataDict = self->_metadataDict;
  if (v13 && !metadataDict)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = self->_metadataDict;
    self->_metadataDict = v10;

    id v7 = v13;
    metadataDict = self->_metadataDict;
LABEL_5:
    [(NSMutableDictionary *)metadataDict setObject:v7 forKey:v8];
    goto LABEL_6;
  }
  if (v13) {
    goto LABEL_5;
  }
  [(NSMutableDictionary *)metadataDict removeObjectForKey:v8];
  if (![(NSMutableDictionary *)self->_metadataDict count])
  {
    long long v12 = self->_metadataDict;
    self->_metadataDict = 0;
  }
LABEL_6:
}

+ (id)_filteredAttributes
{
  if (_filteredAttributes_onceToken != -1) {
    dispatch_once(&_filteredAttributes_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)_filteredAttributes_filteredAttributes;
  return v2;
}

void __35__IKDOMElement__filteredAttributes__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"itmlID";
  v2[1] = @"prototypeID";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)_filteredAttributes_filteredAttributes;
  _filteredAttributes_filteredAttributes = v0;
}

- (IKViewElementStyleComposer)styleComposer
{
  return self->styleComposer;
}

- (void)setStyleComposer:(id)a3
{
}

- (IKDOMElement)_aliasOf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__aliasOf);
  return (IKDOMElement *)WeakRetained;
}

- (void)_setAliasOf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__aliasOf);
  objc_storeStrong((id *)&self->styleComposer, 0);
  objc_storeStrong((id *)&self->_cachedAttributes, 0);
  objc_storeStrong((id *)&self->_cachedChildElements, 0);
  objc_storeStrong((id *)&self->_metadataDict, 0);
}

- (void)domp_setPrototype:(id)a3
{
}

- (id)domp_prototype
{
  return objc_getAssociatedObject(self, "domp_prototype");
}

- (void)domp_setDerivativeDOMElementsBySelector:(id)a3
{
}

- (id)domp_derivativeDOMElementsBySelector
{
  return objc_getAssociatedObject(self, "domp_derivativeDOMElementsBySelector");
}

- (NSString)innerHTML
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(IKDOMNode *)self nodePtr])
  {
    id v7 = 0;
    id v3 = 0;
    goto LABEL_17;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(IKDOMNode *)self childNodesAsArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v4);
      }
      if (v7) {
        break;
      }
      uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      id v16 = 0;
      id v11 = [v10 toStringWithError:&v16];
      id v7 = v16;
      [v3 appendString:v11];

      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_4;
        }

        if (!v7) {
          goto LABEL_17;
        }
LABEL_13:
        BOOL v4 = [(IKJSObject *)self appContext];
        long long v12 = [(IKJSObject *)self appContext];
        id v13 = +[IKDOMException exceptionWithAppContext:v12 code:11];
        id v14 = [v7 description];
        [v4 setException:v13 withErrorMessage:v14];

        goto LABEL_16;
      }
    }

    goto LABEL_13;
  }
  id v7 = 0;
LABEL_16:

LABEL_17:
  return (NSString *)v3;
}

- (void)setInnerHTML:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [IKDOMLSInput alloc];
  uint64_t v6 = [(IKJSObject *)self appContext];
  id v11 = [(IKJSObject *)v5 initWithAppContext:v6];

  [(IKDOMLSInput *)v11 setStringData:v4];
  id v7 = [IKDOMLSParser alloc];
  uint64_t v8 = [(IKJSObject *)self appContext];
  uint64_t v9 = [(IKJSObject *)v7 initWithAppContext:v8];

  id v10 = [(IKDOMLSParser *)v9 parseWithContext:v11 :self :2];
}

- (NSString)outerHTML
{
  if ([(IKDOMNode *)self nodePtr])
  {
    id v10 = 0;
    id v3 = [(IKDOMNode *)self toStringWithError:&v10];
    id v4 = v10;
    if (v4)
    {
      uint64_t v5 = [(IKJSObject *)self appContext];
      uint64_t v6 = [(IKJSObject *)self appContext];
      id v7 = +[IKDOMException exceptionWithAppContext:v6 code:11];
      uint64_t v8 = [v4 description];
      [v5 setException:v7 withErrorMessage:v8];
    }
  }
  else
  {
    id v4 = 0;
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setOuterHTML:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [IKDOMLSInput alloc];
  uint64_t v6 = [(IKJSObject *)self appContext];
  id v11 = [(IKJSObject *)v5 initWithAppContext:v6];

  [(IKDOMLSInput *)v11 setStringData:v4];
  id v7 = [IKDOMLSParser alloc];
  uint64_t v8 = [(IKJSObject *)self appContext];
  uint64_t v9 = [(IKJSObject *)v7 initWithAppContext:v8];

  id v10 = [(IKDOMLSParser *)v9 parseWithContext:v11 :self :5];
}

- (void)insertAdjacentHTML:(id)a3 :(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [IKDOMLSInput alloc];
  uint64_t v8 = [(IKJSObject *)self appContext];
  uint64_t v9 = [(IKJSObject *)v7 initWithAppContext:v8];

  id v10 = [IKDOMLSParser alloc];
  id v11 = [(IKJSObject *)self appContext];
  long long v12 = [(IKJSObject *)v10 initWithAppContext:v11];

  if ([v24 compare:@"beforebegin" options:1])
  {
    if ([v24 compare:@"afterbegin" options:1])
    {
      if ([v24 compare:@"beforeend" options:1])
      {
        if ([v24 compare:@"afterend" options:1])
        {
          id v13 = [(IKJSObject *)self appContext];
          id v14 = [(IKJSObject *)self appContext];
          long long v15 = +[IKDOMException exceptionWithAppContext:v14 code:12];
          [v13 setException:v15 withErrorMessage:@"Invalid position"];

          goto LABEL_13;
        }
        [(IKDOMLSInput *)v9 setStringData:v6];
        id v16 = v12;
        long long v17 = v9;
        long long v18 = self;
        uint64_t v19 = 4;
        goto LABEL_12;
      }
      [(IKDOMLSInput *)v9 setStringData:v6];
    }
    else
    {
      [(IKDOMLSInput *)v9 setStringData:v6];
      long long v20 = [(IKDOMNode *)self firstChild];

      if (v20)
      {
        v21 = [(IKDOMNode *)self firstChild];
        id v22 = [(IKDOMLSParser *)v12 parseWithContext:v9 :v21 :3];

        goto LABEL_13;
      }
    }
    id v16 = v12;
    long long v17 = v9;
    long long v18 = self;
    uint64_t v19 = 1;
  }
  else
  {
    [(IKDOMLSInput *)v9 setStringData:v6];
    id v16 = v12;
    long long v17 = v9;
    long long v18 = self;
    uint64_t v19 = 3;
  }
LABEL_12:
  id v23 = [(IKDOMLSParser *)v16 parseWithContext:v17 :v18 :v19];
LABEL_13:
}

- (id)ik_templateName
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(IKDOMElement *)self tagName];
  if (![v3 isEqualToString:@"document"])
  {
    v21 = 0;
    goto LABEL_24;
  }
  id v23 = v3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(IKDOMElement *)self childElements];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v4)
  {
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(obj);
      }
      long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (v6
        || ([*(id *)(*((void *)&v25 + 1) + 8 * i) tagName],
            id v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isEqualToString:@"head"],
            v13,
            (v14 & 1) == 0))
      {
        if (v8
          || ([v12 tagName],
              id v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v16 isEqualToString:@"navigationBar"],
              v16,
              (v17 & 1) == 0))
        {
          if (v9
            || ([v12 tagName],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                char v19 = [v18 isEqualToString:@"toolbar"],
                v18,
                (v19 & 1) == 0))
          {
            long long v15 = v12;
            if (v7) {
              continue;
            }
          }
          else
          {
            long long v15 = v7;
            uint64_t v9 = v12;
          }
        }
        else
        {
          long long v15 = v7;
          uint64_t v8 = v12;
        }
      }
      else
      {
        id v6 = v12;
        long long v15 = v7;
      }
      id v20 = v12;
      id v7 = v15;
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v5);
LABEL_23:

  v21 = [v7 tagName];

  id v3 = v23;
LABEL_24:

  return v21;
}

- (id)ik_templateElementCSSSelectorList
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB6C20];
  uint64_t v4 = [(IKDOMElement *)self elementName];
  uint64_t v5 = objc_msgSend(v3, "safe_initWithText:", v4);

  id v6 = (void *)MEMORY[0x1E4FB6C28];
  v11[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v8 = [(IKDOMElement *)self elementName];
  uint64_t v9 = objc_msgSend(v6, "safe_initWithSelectors:text:", v7, v8);

  return v9;
}

- (id)domb_boundCSSRule
{
  return objc_getAssociatedObject(self, "domb_boundCSSRule");
}

- (void)domb_setDOMBindingController:(id)a3
{
}

- (id)domb_domBindingController
{
  return objc_getAssociatedObject(self, "domb_domBindingController");
}

- (void)domb_setDataBinding:(id)a3
{
}

- (id)domb_dataBinding
{
  return objc_getAssociatedObject(self, "domb_dataBinding");
}

- (void)domb_setMutationRuleSet:(id)a3
{
}

- (id)domb_mutationRuleSet
{
  return objc_getAssociatedObject(self, "domb_mutationRuleSet");
}

- (void)domb_setBoundCSSRule:(id)a3
{
}

- (void)ikve_setPrototypesID:(id)a3
{
}

- (id)ikve_prototypesID
{
  return objc_getAssociatedObject(self, "ikve_prototypesID");
}

- (void)ikve_setRulesID:(id)a3
{
}

- (id)ikve_rulesID
{
  return objc_getAssociatedObject(self, "ikve_rulesID");
}

- (void)dombs_setItems:(id)a3
{
}

- (id)dombs_items
{
  return objc_getAssociatedObject(self, "dombs_items");
}

@end