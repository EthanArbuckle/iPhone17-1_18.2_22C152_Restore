@interface GLKShaderBlockNode
+ (GLKBigInt_s)maskForLabel:(id)a3 root:(id)a4 index:(int)a5;
+ (id)copyTreeWithRoot:(id)a3 parent:(id)a4;
+ (id)copyTreeWithRootButNotSiblings:(id)a3 parent:(id)a4;
+ (unsigned)nodeCt:(id)a3 nodeCt:(unsigned int *)a4;
+ (void)buildUnrollNodeArray:(id)a3 array:(id)a4;
+ (void)insertNode:(id)a3 afterSibling:(id)a4;
+ (void)printTree:(id)a3;
+ (void)printTreeVerbose:(id)a3;
+ (void)setIndicesForRoot:(id)a3 andReplaceLoopVar:(id)a4 baseLabel:(id)a5 basePropertyClass:(int)a6 usingIndex:(unsigned int)a7 indexString:(id)a8;
+ (void)setMasksWithRoot:(id)a3 treeRoot:(id)a4 mask:(GLKBigInt_s *)a5;
- (BOOL)indexedMask;
- (GLKBigInt_s)mask;
- (GLKShaderBlockNode)children;
- (GLKShaderBlockNode)init;
- (GLKShaderBlockNode)next;
- (GLKShaderBlockNode)parent;
- (NSMutableString)blockText;
- (NSString)description;
- (NSString)label;
- (NSString)loopVar;
- (id)copyWithZone:(_NSZone *)a3;
- (int)propertyClass;
- (int)type;
- (int)unrollCt;
- (unsigned)index;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setBlockText:(id)a3;
- (void)setChildren:(id)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setIndexedMask:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLoopVar:(id)a3;
- (void)setMask:(GLKBigInt_s)a3;
- (void)setNext:(id)a3;
- (void)setParent:(id)a3;
- (void)setPropertyClass:(int)a3;
- (void)setType:(int)a3;
- (void)setUnrollCt:(int)a3;
@end

@implementation GLKShaderBlockNode

- (GLKShaderBlockNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)GLKShaderBlockNode;
  result = [(GLKShaderBlockNode *)&v3 init];
  if (result)
  {
    result->_blockText = 0;
    result->_mask = 0u;
    *(_OWORD *)&result->_parent = 0u;
    *(_OWORD *)&result->_children = 0u;
    result->_loopVar = 0;
    result->_index = 0;
    result->_indexedMask = 1;
    result->_propertyClass = 21;
    *(void *)&result->_type = 0x100000000;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(GLKShaderBlockNode);
  uint64_t v6 = [(GLKShaderBlockNode *)self mask];
  -[GLKShaderBlockNode setMask:](v5, "setMask:", v6, v7);
  [(GLKShaderBlockNode *)v5 setUnrollCt:[(GLKShaderBlockNode *)self unrollCt]];
  [(GLKShaderBlockNode *)v5 setPropertyClass:[(GLKShaderBlockNode *)self propertyClass]];
  [(GLKShaderBlockNode *)v5 setType:[(GLKShaderBlockNode *)self type]];
  [(GLKShaderBlockNode *)v5 setIndex:[(GLKShaderBlockNode *)self index]];
  [(GLKShaderBlockNode *)v5 setIndexedMask:[(GLKShaderBlockNode *)self indexedMask]];
  if ([(GLKShaderBlockNode *)self blockText]) {
    [(GLKShaderBlockNode *)v5 setBlockText:(id)[(NSMutableString *)[(GLKShaderBlockNode *)self blockText] mutableCopyWithZone:a3]];
  }
  [(GLKShaderBlockNode *)v5 setLoopVar:[(GLKShaderBlockNode *)self loopVar]];
  [(GLKShaderBlockNode *)v5 setLabel:[(GLKShaderBlockNode *)self label]];
  return v5;
}

+ (id)copyTreeWithRoot:(id)a3 parent:(id)a4
{
  uint64_t v6 = (void *)[a3 copyWithZone:0];
  [v6 setParent:a4];
  if ([a3 children]) {
    objc_msgSend(v6, "setChildren:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "children"), v6));
  }
  if ([a3 next]) {
    objc_msgSend(v6, "setNext:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "next"), a4));
  }
  return v6;
}

+ (id)copyTreeWithRootButNotSiblings:(id)a3 parent:(id)a4
{
  uint64_t v6 = (void *)[a3 copyWithZone:0];
  [v6 setParent:a4];
  if ([a3 children]) {
    objc_msgSend(v6, "setChildren:", +[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", objc_msgSend(a3, "children"), v6));
  }
  return v6;
}

+ (GLKBigInt_s)maskForLabel:(id)a3 root:(id)a4 index:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([a4 index] != a5
    || !objc_msgSend((id)objc_msgSend(a4, "label"), "isEqualToString:", a3))
  {
    if (![a4 children]) {
      goto LABEL_9;
    }
    unint64_t v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", a3, [a4 children], v5);
    if (v8) {
      goto LABEL_12;
    }
    if (!v9)
    {
LABEL_9:
      if (![a4 next]) {
        goto LABEL_11;
      }
      unint64_t v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", a3, [a4 next], v5);
      if (v8) {
        goto LABEL_12;
      }
      if (!v9)
      {
LABEL_11:
        unint64_t v8 = 0;
        unint64_t v9 = 0;
        goto LABEL_12;
      }
    }
    unint64_t v8 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = [a4 mask];
LABEL_12:
  result.n1 = v9;
  result.n0 = v8;
  return result;
}

+ (void)setMasksWithRoot:(id)a3 treeRoot:(id)a4 mask:(GLKBigInt_s *)a5
{
  uint64_t v8 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", [a3 label], a4, objc_msgSend(a3, "index"));
  if (v8 | v9)
  {
    objc_msgSend(a3, "setMask:", v8, v9);
  }
  else
  {
    objc_msgSend(a3, "setMask:", a5->n0, a5->n1);
    *(_OWORD *)a5 *= 2;
  }
  if ([a3 children]) {
    +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", [a3 children], a4, a5);
  }
  if ([a3 next])
  {
    uint64_t v10 = [a3 next];
    +[GLKShaderBlockNode setMasksWithRoot:v10 treeRoot:a4 mask:a5];
  }
}

+ (void)buildUnrollNodeArray:(id)a3 array:(id)a4
{
  if ((int)[a3 unrollCt] >= 2) {
    [a4 addObject:a3];
  }
  if ([a3 children]) {
    +[GLKShaderBlockNode buildUnrollNodeArray:array:](GLKShaderBlockNode, "buildUnrollNodeArray:array:", [a3 children], a4);
  }
  if ([a3 next])
  {
    uint64_t v6 = [a3 next];
    +[GLKShaderBlockNode buildUnrollNodeArray:v6 array:a4];
  }
}

+ (void)insertNode:(id)a3 afterSibling:(id)a4
{
  objc_msgSend(a3, "setNext:", objc_msgSend(a4, "next"));

  [a4 setNext:a3];
}

+ (unsigned)nodeCt:(id)a3 nodeCt:(unsigned int *)a4
{
  if ([a3 children]) {
    +[GLKShaderBlockNode nodeCt:nodeCt:](GLKShaderBlockNode, "nodeCt:nodeCt:", [a3 children], a4);
  }
  if ([a3 next]) {
    +[GLKShaderBlockNode nodeCt:nodeCt:](GLKShaderBlockNode, "nodeCt:nodeCt:", [a3 next], a4);
  }
  return *a4;
}

+ (void)setIndicesForRoot:(id)a3 andReplaceLoopVar:(id)a4 baseLabel:(id)a5 basePropertyClass:(int)a6 usingIndex:(unsigned int)a7 indexString:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  if ([a3 indexedMask])
  {
    [a3 setIndex:v9];
    if ([a3 propertyClass] == v10) {
      [a3 setPropertyClass:(v9 + v10)];
    }
  }
  else
  {
    [a3 setIndex:0];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", a5))
  {
    [a3 setLabel:objc_msgSend(NSString, "stringWithFormat:", @"%@%d", objc_msgSend(a3, "label"), v9)];
    [a3 setType:1];
  }
  if ([a3 blockText]) {
    objc_msgSend((id)objc_msgSend(a3, "blockText"), "replaceOccurrencesOfString:withString:options:range:", a4, a8, 0, 0, objc_msgSend((id)objc_msgSend(a3, "blockText"), "length"));
  }
  if ([a3 children]) {
    +[GLKShaderBlockNode setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:](GLKShaderBlockNode, "setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:", [a3 children], a4, a5, v10, v9, a8);
  }
  if ([a3 next])
  {
    uint64_t v14 = [a3 next];
    +[GLKShaderBlockNode setIndicesForRoot:v14 andReplaceLoopVar:a4 baseLabel:a5 basePropertyClass:v10 usingIndex:v9 indexString:a8];
  }
}

+ (void)printTree:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (a3)
  {
    id v5 = a3;
    do
    {
      id v5 = (id)[v5 parent];
      [v4 appendString:@"\t"];
    }
    while (v5);
  }
  NSLog(&cfstr_PClassDIndexD.isa, a3, v4, [a3 label], objc_msgSend(a3, "propertyClass"), objc_msgSend(a3, "index"));
  uint64_t v6 = [a3 children];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      +[GLKShaderBlockNode printTree:v7];
      uint64_t v7 = (void *)[v7 next];
    }
    while (v7);
  }
}

+ (void)printTreeVerbose:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (a3)
  {
    id v5 = a3;
    do
    {
      id v5 = (id)[v5 parent];
      [v4 appendString:@"\t"];
    }
    while (v5);
  }
  NSLog(&cfstr_PClassDIndexD_0.isa, a3, v4, [a3 label], objc_msgSend(a3, "propertyClass"), objc_msgSend(a3, "index"), objc_msgSend(a3, "blockText"));
  uint64_t v6 = [a3 children];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    do
    {
      +[GLKShaderBlockNode printTreeVerbose:v7];
      uint64_t v7 = (void *)[v7 next];
    }
    while (v7);
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if ([a4 isEqualToString:@"codeblock"])
  {
    v11 = objc_alloc_init(GLKShaderBlockNode);
    v12 = (void *)[a7 valueForKey:@"indexedMask"];
    if (v12 && [v12 isEqualToString:@"no"]) {
      [(GLKShaderBlockNode *)v11 setIndexedMask:0];
    }
    -[GLKShaderBlockNode setLabel:](v11, "setLabel:", [a7 valueForKey:@"label"]);
    v13 = (void *)[a7 valueForKey:@"type"];
    if ([v13 isEqualToString:@"std"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"cond"])
    {
      uint64_t v14 = 1;
    }
    else
    {
      if (![v13 isEqualToString:@"loop"]) {
        goto LABEL_15;
      }
      uint64_t v14 = 2;
    }
    [(GLKShaderBlockNode *)v11 setType:v14];
LABEL_15:
    v15 = (void *)[a7 valueForKey:@"unrollCt"];
    if (v15) {
      -[GLKShaderBlockNode setUnrollCt:](v11, "setUnrollCt:", [v15 intValue]);
    }
    v16 = (void *)[a7 valueForKey:@"class"];
    -[GLKShaderBlockNode setLoopVar:](v11, "setLoopVar:", [a7 valueForKey:@"loopVar"]);
    if ([v16 isEqualToString:@"STATIC_BLOCK"])
    {
      uint64_t v17 = 21;
    }
    else if ([v16 isEqualToString:@"EFFECT"])
    {
      uint64_t v17 = 0;
    }
    else if ([v16 isEqualToString:@"LIGHT"])
    {
      uint64_t v17 = 2;
    }
    else if ([v16 isEqualToString:@"MATERIAL"])
    {
      uint64_t v17 = 10;
    }
    else if ([v16 isEqualToString:@"TEXTURE"])
    {
      uint64_t v17 = 11;
    }
    else if ([v16 isEqualToString:@"FOG"])
    {
      uint64_t v17 = 19;
    }
    else
    {
      if (![v16 isEqualToString:@"CONSTANT_COLOR"])
      {
LABEL_32:
        [(GLKShaderBlockNode *)v11 setParent:self];
        children = self->_children;
        if (children)
        {
          for (i = self->_children; [(GLKShaderBlockNode *)i next]; children = i)
            i = [(GLKShaderBlockNode *)children next];
          [(GLKShaderBlockNode *)children setNext:v11];
        }
        else
        {
          [(GLKShaderBlockNode *)self setChildren:v11];
        }
        [a3 setDelegate:v11];
        return;
      }
      uint64_t v17 = 20;
    }
    [(GLKShaderBlockNode *)v11 setPropertyClass:v17];
    goto LABEL_32;
  }
  if ([a4 isEqualToString:@"codeblocks"])
  {
    -[GLKShaderBlockNode setLabel:](self, "setLabel:", [a7 valueForKey:@"label"]);
    self->_type = 0;
    self->_propertyClass = 21;
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v6 = (unsigned char *)objc_msgSend(a4, "UTF8String", a3);
  char v7 = *v6;
  if (!*v6) {
    return;
  }
  uint64_t v8 = v6 + 1;
  uint64_t v9 = MEMORY[0x263EF8318];
  while ((v7 & 0x80) == 0)
  {
    if ((*(_DWORD *)(v9 + 4 * v7 + 60) & 0x4000) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    int v10 = *v8++;
    char v7 = v10;
    if (!v10) {
      return;
    }
  }
  if (__maskrune(v7, 0x4000uLL)) {
    goto LABEL_7;
  }
LABEL_9:
  v11 = objc_alloc_init(GLKShaderBlockNode);
  [(GLKShaderBlockNode *)v11 setLabel:[(GLKShaderBlockNode *)self label]];
  [(GLKShaderBlockNode *)v11 setParent:self];
  [(GLKShaderBlockNode *)v11 setBlockText:objc_alloc_init(MEMORY[0x263F089D8])];
  [(NSMutableString *)[(GLKShaderBlockNode *)v11 blockText] appendString:a4];
  children = self->_children;
  if (children)
  {
    for (i = self->_children; [(GLKShaderBlockNode *)i next]; children = i)
      i = [(GLKShaderBlockNode *)children next];
    [(GLKShaderBlockNode *)children setNext:v11];
  }
  else
  {
    [(GLKShaderBlockNode *)self setChildren:v11];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
}

- (NSString)description
{
  if (self->_loopVar) {
    loopVar = (__CFString *)self->_loopVar;
  }
  else {
    loopVar = @"nil";
  }
  return (NSString *)[MEMORY[0x263F089D8] stringWithFormat:@"label:\t\t%@\ntype:\t\t%d\nclass:\t\t%d\nloopVar:\t\t%@\nchildren:\t%p\nparent:\t\t%p\nnext:\t\t%p\nmask:\t\t%@\nunrollCt:\t%d\nindex:\t\t%d\nblockText:\t%p", self->_label, self->_type, self->_propertyClass, loopVar, self->_children, self->_parent, self->_next, objc_msgSend(NSString, "stringWithFormat:", @"0x%016llX%016llx", self->_mask.n1, self->_mask.n0), self->_unrollCt, self->_index, self->_blockText];
}

- (void)dealloc
{
  children = self->_children;
  if (children)
  {
    do
    {
      uint64_t v4 = [(GLKShaderBlockNode *)children next];

      children = (GLKShaderBlockNode *)v4;
    }
    while (v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)GLKShaderBlockNode;
  [(GLKShaderBlockNode *)&v5 dealloc];
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)loopVar
{
  return self->_loopVar;
}

- (void)setLoopVar:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (GLKShaderBlockNode)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  self->_parent = (GLKShaderBlockNode *)a3;
}

- (GLKShaderBlockNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  self->_next = (GLKShaderBlockNode *)a3;
}

- (GLKShaderBlockNode)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  self->_children = (GLKShaderBlockNode *)a3;
}

- (GLKBigInt_s)mask
{
  unint64_t n1 = self->_mask.n1;
  unint64_t n0 = self->_mask.n0;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

- (void)setMask:(GLKBigInt_s)a3
{
  self->_mask = a3;
}

- (int)unrollCt
{
  return self->_unrollCt;
}

- (void)setUnrollCt:(int)a3
{
  self->_unrollCt = a3;
}

- (NSMutableString)blockText
{
  return self->_blockText;
}

- (void)setBlockText:(id)a3
{
}

- (int)propertyClass
{
  return self->_propertyClass;
}

- (void)setPropertyClass:(int)a3
{
  self->_propertyClass = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (BOOL)indexedMask
{
  return self->_indexedMask;
}

- (void)setIndexedMask:(BOOL)a3
{
  self->_indexedMask = a3;
}

@end