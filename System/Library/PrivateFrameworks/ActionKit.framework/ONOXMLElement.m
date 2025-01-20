@interface ONOXMLElement
- (BOOL)isBlank;
- (BOOL)isEqual:(id)a3;
- (NSArray)children;
- (NSDate)dateValue;
- (NSDictionary)attributes;
- (NSNumber)numberValue;
- (NSString)namespace;
- (NSString)rawXMLString;
- (NSString)stringValue;
- (NSString)tag;
- (ONOXMLDocument)document;
- (ONOXMLElement)initWithCoder:(id)a3;
- (ONOXMLElement)nextSibling;
- (ONOXMLElement)parent;
- (ONOXMLElement)previousSibling;
- (_xmlNode)xmlNode;
- (_xmlXPathObject)xmlXPathObjectPtrWithXPath:(id)a3;
- (id)CSS:(id)a3;
- (id)XPath:(id)a3;
- (id)childrenAtIndexes:(id)a3;
- (id)childrenWithTag:(id)a3;
- (id)childrenWithTag:(id)a3 inNamespace:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstChildWithCSS:(id)a3;
- (id)firstChildWithTag:(id)a3;
- (id)firstChildWithTag:(id)a3 inNamespace:(id)a4;
- (id)firstChildWithXPath:(id)a3;
- (id)functionResultByEvaluatingXPath:(id)a3;
- (id)indexesOfChildrenPassingTest:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)valueForAttribute:(id)a3;
- (id)valueForAttribute:(id)a3 inNamespace:(id)a4;
- (unint64_t)lineNumber;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4;
- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4;
- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4;
- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDocument:(id)a3;
- (void)setLineNumber:(unint64_t)a3;
- (void)setNamespace:(id)a3;
- (void)setNextSibling:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)setParent:(id)a3;
- (void)setPreviousSibling:(id)a3;
- (void)setRawXMLString:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTag:(id)a3;
- (void)setXmlNode:(_xmlNode *)a3;
@end

@implementation ONOXMLElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawXMLString, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_nextSibling, 0);
  objc_storeStrong((id *)&self->_previousSibling, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_destroyWeak((id *)&self->_document);
}

- (void)setXmlNode:(_xmlNode *)a3
{
  self->_xmlNode = a3;
}

- (_xmlNode)xmlNode
{
  return self->_xmlNode;
}

- (void)setRawXMLString:(id)a3
{
}

- (NSString)rawXMLString
{
  return self->_rawXMLString;
}

- (void)setDateValue:(id)a3
{
}

- (void)setNumberValue:(id)a3
{
}

- (void)setStringValue:(id)a3
{
}

- (void)setNextSibling:(id)a3
{
}

- (void)setPreviousSibling:(id)a3
{
}

- (void)setParent:(id)a3
{
}

- (void)setAttributes:(id)a3
{
}

- (void)setLineNumber:(unint64_t)a3
{
  self->_lineNumber = a3;
}

- (void)setTag:(id)a3
{
}

- (void)setNamespace:(id)a3
{
}

- (void)setDocument:(id)a3
{
}

- (ONOXMLDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ONOXMLDocument *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ONOXMLElement *)self tag];
  v6 = NSStringFromSelector("tag");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(ONOXMLElement *)self attributes];
  v8 = NSStringFromSelector(sel_attributes);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(ONOXMLElement *)self stringValue];
  v10 = NSStringFromSelector(sel_stringValue);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(ONOXMLElement *)self children];
  v11 = NSStringFromSelector(sel_children);
  [v4 encodeObject:v12 forKey:v11];
}

- (ONOXMLElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ONOXMLElement;
  v5 = [(ONOXMLElement *)&v16 init];
  if (v5)
  {
    v6 = NSStringFromSelector("tag");
    v7 = [v4 decodeObjectForKey:v6];

    v8 = NSStringFromSelector(sel_attributes);
    v9 = [v4 decodeObjectForKey:v8];

    v10 = NSStringFromSelector(sel_stringValue);
    v11 = [v4 decodeObjectForKey:v10];

    id v12 = NSStringFromSelector(sel_children);
    v13 = [v4 decodeObjectForKey:v12];

    v14 = 0;
    if (v7 && v9 && v11 && v13)
    {
      [(ONOXMLElement *)v5 setTag:v7];
      [(ONOXMLElement *)v5 setAttributes:v9];
      [(ONOXMLElement *)v5 setStringValue:v11];
      [(ONOXMLElement *)v5 setChildren:v13];
      v14 = v5;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setXmlNode:", -[ONOXMLElement xmlNode](self, "xmlNode"));
  v5 = [(ONOXMLElement *)self document];
  [v4 setDocument:v5];

  return v4;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = a3;
  id v4 = [(ONOXMLElement *)self stringValue];
  if (v4) {
    [v5 invokeWithTarget:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(ONOXMLElement *)self stringValue];
  id v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (_xmlXPathObject)xmlXPathObjectPtrWithXPath:(id)a3
{
  id v4 = a3;
  xmlXPathContextPtr v5 = xmlXPathNewContext((xmlDocPtr)[(ONOXMLElement *)self xmlNode][64]);
  if (!v5)
  {
    v19 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v5->node = [(ONOXMLElement *)self xmlNode];
  v7 = [(ONOXMLElement *)self xmlNode];
  p_parent = &v7->parent;
  parent = v7->parent;
  if (!parent) {
    goto LABEL_14;
  }
  do
  {
    nsDef = v7->nsDef;
    if (!nsDef) {
      goto LABEL_13;
    }
    do
    {
      prefix = nsDef->prefix;
      if (prefix)
      {
LABEL_5:
        xmlXPathRegisterNs(v6, prefix, nsDef->href);
        goto LABEL_6;
      }
      id v12 = [(ONOXMLElement *)self document];
      v13 = [v12 defaultNamespaces];

      if (v13)
      {
        v14 = [NSString stringWithUTF8String:nsDef->href];
        v15 = [(ONOXMLElement *)self document];
        objc_super v16 = [v15 defaultNamespaces];
        v17 = [v16 objectForKeyedSubscript:v14];

        if (v17)
        {
          id v18 = v17;
          prefix = (const xmlChar *)[v18 UTF8String];

          if (prefix) {
            goto LABEL_5;
          }
        }
        else
        {
        }
      }
LABEL_6:
      nsDef = nsDef->next;
    }
    while (nsDef);
    parent = *p_parent;
LABEL_13:
    v7 = parent;
    p_parent = &parent->parent;
    parent = parent->parent;
  }
  while (parent);
LABEL_14:
  v19 = (_xmlXPathObject *)MEMORY[0x23ECE7160]([v4 UTF8String], v6);
  xmlXPathFreeContext(v6);
LABEL_16:

  return v19;
}

- (id)firstChildWithCSS:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  v3 = -[ONOXMLElement CSS:](self, "CSS:", a3, 0);
  if ([v3 countByEnumeratingWithState:v6 objects:v7 count:16]) {
    id v4 = **((id **)&v6[0] + 1);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  ONOXPathFromCSS(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(ONOXMLElement *)self enumerateElementsWithXPath:v7 usingBlock:v6];
}

- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = ONOXPathFromCSS(a3);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__ONOXMLElement_enumerateElementsWithCSS_block___block_invoke;
    v8[3] = &unk_264E59190;
    id v9 = v6;
    [(ONOXMLElement *)self enumerateElementsWithCSS:v7 usingBlock:v8];
  }
}

uint64_t __48__ONOXMLElement_enumerateElementsWithCSS_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)CSS:(id)a3
{
  id v4 = ONOXPathFromCSS(a3);
  xmlXPathContextPtr v5 = [(ONOXMLElement *)self XPath:v4];

  return v5;
}

- (id)firstChildWithXPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  v3 = -[ONOXMLElement XPath:](self, "XPath:", a3, 0);
  if ([v3 countByEnumeratingWithState:v6 objects:v7 count:16]) {
    id v4 = **((id **)&v6[0] + 1);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, uint64_t, char *))a4;
  if (v6)
  {
    char v17 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = -[ONOXMLElement XPath:](self, "XPath:", a3, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v13 + 1) + 8 * v12), v10 + v12, &v17);
        if (v17) {
          break;
        }
        if (v9 == ++v12)
        {
          v10 += v12;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__ONOXMLElement_enumerateElementsWithXPath_block___block_invoke;
    v8[3] = &unk_264E59190;
    id v9 = v6;
    [(ONOXMLElement *)self enumerateElementsWithXPath:a3 usingBlock:v8];
  }
}

uint64_t __50__ONOXMLElement_enumerateElementsWithXPath_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)functionResultByEvaluatingXPath:(id)a3
{
  v3 = [(ONOXMLElement *)self xmlXPathObjectPtrWithXPath:a3];
  if (v3)
  {
    id v4 = v3;
    xmlXPathContextPtr v5 = objc_alloc_init(ONOXPathFunctionResult);
    [(ONOXPathFunctionResult *)v5 setXmlXPath:v4];
  }
  else
  {
    xmlXPathContextPtr v5 = 0;
  }
  return v5;
}

- (id)XPath:(id)a3
{
  id v4 = a3;
  if (v4 && (xmlXPathContextPtr v5 = [(ONOXMLElement *)self xmlXPathObjectPtrWithXPath:v4]) != 0)
  {
    id v6 = v5;
    id v7 = [(ONOXMLElement *)self document];
    uint64_t v8 = [v7 enumeratorWithXPathObject:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263EFF8C0] array];
    uint64_t v8 = [v7 objectEnumerator];
  }
  id v9 = (void *)v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ONOXMLElement *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(ONOXMLElement *)self hash];
      BOOL v6 = v5 == [(ONOXMLElement *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  xmlBufferPtr v3 = xmlBufferCreate();
  xmlNodeDump(v3, (xmlDocPtr)[(ONOXMLElement *)self xmlNode][64], [(ONOXMLElement *)self xmlNode], 0, 0);
  id v4 = [NSString stringWithUTF8String:xmlBufferContent(v3)];
  xmlBufferFree(v3);
  return v4;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  id v4 = [(ONOXMLElement *)self children];
  unint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (NSDate)dateValue
{
  dateValue = self->_dateValue;
  if (!dateValue)
  {
    id v4 = [(ONOXMLElement *)self stringValue];
    if (!v4) {
      goto LABEL_5;
    }
    unint64_t v5 = v4;
    BOOL v6 = [(ONOXMLElement *)self document];
    id v7 = [v6 dateFormatter];
    uint64_t v8 = [v7 dateFromString:v5];
    [(ONOXMLElement *)self setDateValue:v8];

    dateValue = self->_dateValue;
  }
  id v4 = dateValue;
LABEL_5:
  return v4;
}

- (NSNumber)numberValue
{
  numberValue = self->_numberValue;
  if (!numberValue)
  {
    id v4 = [(ONOXMLElement *)self stringValue];
    if (!v4) {
      goto LABEL_5;
    }
    unint64_t v5 = v4;
    BOOL v6 = [(ONOXMLElement *)self document];
    id v7 = [v6 numberFormatter];
    uint64_t v8 = [v7 numberFromString:v5];
    [(ONOXMLElement *)self setNumberValue:v8];

    numberValue = self->_numberValue;
  }
  id v4 = numberValue;
LABEL_5:
  return v4;
}

- (NSString)stringValue
{
  stringValue = self->_stringValue;
  if (!stringValue)
  {
    Content = xmlNodeGetContent([(ONOXMLElement *)self xmlNode]);
    if (Content)
    {
      unint64_t v5 = [NSString stringWithCString:Content encoding:4];
      [(ONOXMLElement *)self setStringValue:v5];
    }
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Content);
    stringValue = self->_stringValue;
  }
  return stringValue;
}

- (BOOL)isBlank
{
  v2 = [(ONOXMLElement *)self stringValue];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (ONOXMLElement)nextSibling
{
  nextSibling = self->_nextSibling;
  if (!nextSibling)
  {
    id v4 = [(ONOXMLElement *)self document];
    unint64_t v5 = objc_msgSend(v4, "elementWithNode:", (void)-[ONOXMLElement xmlNode](self, "xmlNode")[48]);
    [(ONOXMLElement *)self setNextSibling:v5];

    nextSibling = self->_nextSibling;
  }
  return nextSibling;
}

- (ONOXMLElement)previousSibling
{
  previousSibling = self->_previousSibling;
  if (!previousSibling)
  {
    id v4 = [(ONOXMLElement *)self document];
    unint64_t v5 = objc_msgSend(v4, "elementWithNode:", (void)-[ONOXMLElement xmlNode](self, "xmlNode")[56]);
    [(ONOXMLElement *)self setPreviousSibling:v5];

    previousSibling = self->_previousSibling;
  }
  return previousSibling;
}

- (id)indexesOfChildrenPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    unint64_t v5 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v6 = (uint64_t)[(ONOXMLElement *)self xmlNode][24];
    char v10 = 0;
    if (v6)
    {
      uint64_t v7 = 0;
      do
      {
        if (v4[2](v4, v6, &v10)) {
          [v5 addIndex:v7];
        }
        uint64_t v6 = *(void *)(v6 + 48);
        ++v7;
        if (v6) {
          BOOL v8 = v10 == 0;
        }
        else {
          BOOL v8 = 0;
        }
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v5 = [MEMORY[0x263F088D0] indexSet];
  }

  return v5;
}

- (id)childrenAtIndexes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = (uint64_t)[(ONOXMLElement *)self xmlNode][24];
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      if ([v4 containsIndex:v7] && *(_DWORD *)(v6 + 8) == 1)
      {
        BOOL v8 = [(ONOXMLElement *)self document];
        id v9 = [v8 elementWithNode:v6];

        if (v9) {
          [v5 addObject:v9];
        }
      }
      ++v7;
      uint64_t v6 = *(void *)(v6 + 48);
    }
    while (v6);
  }
  char v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v10;
}

- (id)childrenWithTag:(id)a3 inNamespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  long long v15 = __45__ONOXMLElement_childrenWithTag_inNamespace___block_invoke;
  long long v16 = &unk_264E591B8;
  id v17 = v6;
  id v18 = v7;
  id v8 = v7;
  id v9 = v6;
  char v10 = [(ONOXMLElement *)self indexesOfChildrenPassingTest:&v13];
  uint64_t v11 = -[ONOXMLElement childrenAtIndexes:](self, "childrenAtIndexes:", v10, v13, v14, v15, v16);

  return v11;
}

uint64_t __45__ONOXMLElement_childrenWithTag_inNamespace___block_invoke(uint64_t a1, uint64_t a2)
{
  return ONOXMLNodeMatchesTagInNamespace(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (id)childrenWithTag:(id)a3
{
  return [(ONOXMLElement *)self childrenWithTag:a3 inNamespace:0];
}

- (id)firstChildWithTag:(id)a3 inNamespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __47__ONOXMLElement_firstChildWithTag_inNamespace___block_invoke;
  id v17 = &unk_264E591B8;
  id v18 = v6;
  id v19 = v7;
  id v8 = v7;
  id v9 = v6;
  char v10 = [(ONOXMLElement *)self indexesOfChildrenPassingTest:&v14];
  uint64_t v11 = -[ONOXMLElement childrenAtIndexes:](self, "childrenAtIndexes:", v10, v14, v15, v16, v17);

  if ([v11 count])
  {
    uint64_t v12 = [v11 objectAtIndex:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __47__ONOXMLElement_firstChildWithTag_inNamespace___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = ONOXMLNodeMatchesTagInNamespace(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
  *a3 = result;
  return result;
}

- (id)firstChildWithTag:(id)a3
{
  return [(ONOXMLElement *)self firstChildWithTag:a3 inNamespace:0];
}

- (NSArray)children
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  id v4 = [(ONOXMLElement *)self childrenAtIndexes:v3];

  return (NSArray *)v4;
}

- (ONOXMLElement)parent
{
  parent = self->_parent;
  if (!parent)
  {
    id v4 = [(ONOXMLElement *)self document];
    unint64_t v5 = objc_msgSend(v4, "elementWithNode:", (void)-[ONOXMLElement xmlNode](self, "xmlNode")[40]);
    [(ONOXMLElement *)self setParent:v5];

    parent = self->_parent;
  }
  return parent;
}

- (id)valueForAttribute:(id)a3 inNamespace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ONOXMLElement *)self xmlNode];
  id v9 = v7;
  char v10 = (const xmlChar *)[v9 UTF8String];

  id v11 = v6;
  uint64_t v12 = (const xmlChar *)[v11 UTF8String];

  NsProp = xmlGetNsProp(v8, v10, v12);
  if (NsProp)
  {
    uint64_t v14 = NsProp;
    uint64_t v15 = [NSString stringWithUTF8String:NsProp];
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)valueForAttribute:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLElement *)self xmlNode];
  id v6 = v4;
  id v7 = (const xmlChar *)[v6 UTF8String];

  Prop = xmlGetProp(v5, v7);
  if (Prop)
  {
    id v9 = Prop;
    char v10 = [NSString stringWithUTF8String:Prop];
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v9);
  }
  else
  {
    char v10 = 0;
  }
  return v10;
}

- (NSDictionary)attributes
{
  attributes = self->_attributes;
  if (!attributes)
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    for (uint64_t i = (uint64_t)[(ONOXMLElement *)self xmlNode][88]; i; uint64_t i = *(void *)(i + 48))
    {
      id v6 = [NSString stringWithUTF8String:*(void *)(i + 16)];
      id v7 = [(ONOXMLElement *)self valueForAttribute:v6];
      [v4 setObject:v7 forKey:v6];
    }
    id v8 = [NSDictionary dictionaryWithDictionary:v4];
    [(ONOXMLElement *)self setAttributes:v8];

    attributes = self->_attributes;
  }
  return attributes;
}

- (unint64_t)lineNumber
{
  unint64_t result = self->_lineNumber;
  if (!result)
  {
    [(ONOXMLElement *)self setLineNumber:xmlGetLineNo([(ONOXMLElement *)self xmlNode])];
    return self->_lineNumber;
  }
  return result;
}

- (NSString)tag
{
  if (!self->_tag && (void)[(ONOXMLElement *)self xmlNode][16])
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithUTF8String:", (void)-[ONOXMLElement xmlNode](self, "xmlNode")[16]);
    [(ONOXMLElement *)self setTag:v3];
  }
  tag = self->_tag;
  return tag;
}

- (NSString)namespace
{
  if (!self->_namespace
    && (void)[(ONOXMLElement *)self xmlNode][72]
    && *(void *)((void)[(ONOXMLElement *)self xmlNode][72] + 24))
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithUTF8String:", *(void *)((void)-[ONOXMLElement xmlNode](self, "xmlNode")[72] + 24));
    [(ONOXMLElement *)self setNamespace:v3];
  }
  id v4 = self->_namespace;
  return v4;
}

@end