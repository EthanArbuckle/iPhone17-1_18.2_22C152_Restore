@interface CPObject
- (BOOL)isEqual:(id)a3;
- (CPObject)init;
- (id)ancestorOfClass:(Class)a3;
- (id)childAtIndex:(unsigned int)a3;
- (id)children;
- (id)childrenNotOfClass:(Class)a3;
- (id)childrenOfClass:(Class)a3;
- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutChildren;
- (id)descendantsOfClass:(Class)a3;
- (id)descendantsOfClass:(Class)a3 deep:(BOOL)a4;
- (id)descendantsOfClass:(Class)a3 omitTraversing:(Class)a4;
- (id)document;
- (id)firstChild;
- (id)firstDescendantOfClass:(Class)a3;
- (id)firstDescendantsOfClass:(Class)a3;
- (id)firstSibling;
- (id)initSuper;
- (id)lastChild;
- (id)lastDescendantOfClass:(Class)a3;
- (id)lastSibling;
- (id)newTakeChildren;
- (id)newTakeChildrenAmong:(id)a3;
- (id)nextSibling;
- (id)page;
- (id)parent;
- (id)previousSibling;
- (id)shallowDescendantsOfClass:(Class)a3;
- (int)depth;
- (int64_t)zOrder;
- (unint64_t)indexOf:(id)a3;
- (unsigned)count;
- (unsigned)countOfClass:(Class)a3;
- (unsigned)countOfFirstDescendantsOfClass:(Class)a3;
- (void)_printWithIndent:(int)a3;
- (void)add:(id)a3;
- (void)add:(id)a3 atIndex:(unsigned int)a4;
- (void)addChildren:(id)a3;
- (void)addChildrenOf:(id)a3;
- (void)childrenOfClass:(Class)a3 into:(id)a4;
- (void)clearCachedInfo;
- (void)commonMapFuncCall:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 ofCount:(int)a6;
- (void)dealloc;
- (void)descendantsOfClass:(Class)a3 to:(id)a4;
- (void)disposeDescendants;
- (void)map:(SEL)a3 target:(id)a4;
- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5;
- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 last:(BOOL)a6;
- (void)map:(SEL)a3 target:(id)a4 last:(BOOL)a5;
- (void)mapSafely:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5;
- (void)performSelector:(SEL)a3;
- (void)print;
- (void)promoteChildren;
- (void)recomputeZOrder;
- (void)remove;
- (void)remove:(id)a3;
- (void)removeAll;
- (void)removeFirstChild;
- (void)removeLastChild;
- (void)removeObjectAtIndex:(unsigned int)a3;
- (void)setDocument:(id)a3;
- (void)setPage:(id)a3;
- (void)setParent:(id)a3;
- (void)setZOrder:(int64_t)a3;
- (void)updateZOrder:(int64_t)a3;
@end

@implementation CPObject

- (int)depth
{
  uint64_t v3 = [(NSMutableArray *)self->children count];
  if (v3)
  {
    int v4 = [(NSMutableArray *)self->children count];
    if (v4 < 1)
    {
      LODWORD(v3) = 1;
    }
    else
    {
      uint64_t v5 = 0;
      int v6 = 0;
      uint64_t v7 = v4;
      do
      {
        int v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v5), "depth");
        if (v8 > v6) {
          int v6 = v8;
        }
        ++v5;
      }
      while (v7 != v5);
      LODWORD(v3) = v6 + 1;
    }
  }
  return v3;
}

- (id)page
{
  id result = self->page;
  if (!result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->page = (CPPage *)self;
      return self;
    }
    else
    {
      parent = self->parent;
      if (parent)
      {
        id result = [(CPObject *)parent page];
        self->page = (CPPage *)result;
      }
      else
      {
        return self->page;
      }
    }
  }
  return result;
}

- (void)setPage:(id)a3
{
  self->page = (CPPage *)a3;
}

- (id)firstDescendantsOfClass:(Class)a3
{
  int v5 = [(NSMutableArray *)self->children count];
  int v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v5;
    do
    {
      v9 = (void *)[(NSMutableArray *)self->children objectAtIndex:v7];
      if (objc_opt_isKindOfClass())
      {
        [v6 addObject:v9];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v9, "firstDescendantsOfClass:", a3));
        }
      }
      ++v7;
    }
    while (v8 != v7);
  }
  return v6;
}

- (void)clearCachedInfo
{
  parent = self->parent;
  if (parent) {
    [(CPObject *)parent clearCachedInfo];
  }
}

- (void)setZOrder:(int64_t)a3
{
  self->zOrder = a3;
}

- (void)updateZOrder:(int64_t)a3
{
  if (self->zOrder < a3)
  {
    self->zOrder = a3;
    parent = self->parent;
    if (parent) {
      -[CPObject updateZOrder:](parent, "updateZOrder:");
    }
  }
}

- (void)recomputeZOrder
{
  int v3 = [(NSMutableArray *)self->children count];
  if (v3)
  {
    int v4 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", 0), "zOrder");
    if (v3 >= 2)
    {
      uint64_t v5 = v3;
      for (uint64_t i = 1; i != v5; ++i)
      {
        int v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i), "zOrder");
        if (v4 <= v7) {
          int v4 = v7;
        }
      }
    }
    [(CPObject *)self setZOrder:v4];
  }
}

- (int64_t)zOrder
{
  return self->zOrder;
}

- (id)document
{
  return self->document;
}

- (void)setDocument:(id)a3
{
  if (self->document != a3)
  {
    self->document = (CPDocument *)a3;
    int v5 = [(NSMutableArray *)self->children count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      do
      {
        objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v6), "setDocument:", a3);
        uint64_t v6 = (v6 + 1);
      }
      while (v5 != v6);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPObject;
  return [(CPObject *)&v4 isEqual:a3];
}

- (unint64_t)indexOf:(id)a3
{
  return [(NSMutableArray *)self->children indexOfObject:a3];
}

- (unsigned)countOfFirstDescendantsOfClass:(Class)a3
{
  uint64_t v5 = [(NSMutableArray *)self->children count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = 0;
  unsigned int v7 = 0;
  do
  {
    uint64_t v8 = (void *)[(NSMutableArray *)self->children objectAtIndex:v6];
    if (objc_opt_isKindOfClass())
    {
      ++v7;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7 += [v8 countOfFirstDescendantsOfClass:a3];
      }
    }
    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (id)lastDescendantOfClass:(Class)a3
{
  unsigned int v5 = [(CPObject *)self count];
  uint64_t v6 = v5 - 1;
  if ((int)(v5 - 1) < 0) {
    return 0;
  }
  do
  {
    id v7 = [(CPObject *)self childAtIndex:v6];
    id result = (id)[v7 lastDescendantOfClass:a3];
    if (result) {
      break;
    }
    id result = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
    BOOL v9 = v6 != 0;
    uint64_t v6 = (v6 - 1);
    BOOL v10 = v9;
  }
  while (!result && v10);
  return result;
}

- (id)firstDescendantOfClass:(Class)a3
{
  int v5 = [(NSMutableArray *)self->children count];
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = v5;
  while (1)
  {
    uint64_t v8 = (void *)[(NSMutableArray *)self->children objectAtIndex:v6];
    if (objc_opt_isKindOfClass()) {
      break;
    }
    BOOL v9 = (void *)[v8 firstDescendantOfClass:a3];
    if (v9) {
      return v9;
    }
    if (v7 == ++v6) {
      return 0;
    }
  }
  return v8;
}

- (id)descendantsOfClass:(Class)a3 omitTraversing:(Class)a4
{
  int v7 = [(NSMutableArray *)self->children count];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7;
    do
    {
      v11 = (void *)[(NSMutableArray *)self->children objectAtIndex:v9];
      if (objc_opt_isKindOfClass()) {
        [v8 addObject:v11];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) == 0) {
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "descendantsOfClass:omitTraversing:", a3, a4));
      }
      ++v9;
    }
    while (v10 != v9);
  }
  return v8;
}

- (id)shallowDescendantsOfClass:(Class)a3
{
  return [(CPObject *)self descendantsOfClass:a3 deep:0];
}

- (id)descendantsOfClass:(Class)a3
{
  return [(CPObject *)self descendantsOfClass:a3 deep:1];
}

- (void)descendantsOfClass:(Class)a3 to:(id)a4
{
  if (a4)
  {
    if (objc_opt_isKindOfClass()) {
      [a4 addObject:self];
    }
    unsigned int v7 = [(CPObject *)self count];
    if (v7)
    {
      unsigned int v8 = v7;
      uint64_t v9 = 0;
      do
      {
        objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v9), "descendantsOfClass:to:", a3, a4);
        uint64_t v9 = (v9 + 1);
      }
      while (v8 != v9);
    }
  }
}

- (id)descendantsOfClass:(Class)a3 deep:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(NSMutableArray *)self->children count];
  unsigned int v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7;
    while (1)
    {
      v11 = (void *)[(NSMutableArray *)self->children objectAtIndex:v9];
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v13 = v4;
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_6;
      }
      objc_msgSend(v8, "addObject:", v11, v4);
      if (v4) {
        break;
      }
LABEL_7:
      if (v10 == ++v9) {
        return v8;
      }
    }
    uint64_t v13 = 1;
LABEL_6:
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v11, "descendantsOfClass:deep:", a3, v13));
    goto LABEL_7;
  }
  return v8;
}

- (id)children
{
  return self->children;
}

- (void)map:(SEL)a3 target:(id)a4 last:(BOOL)a5
{
  uint64_t v8 = [(NSMutableArray *)self->children count] - !a5;
  if ((int)v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
      objc_msgSend(a4, a3, -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", i));
  }
}

- (void)map:(SEL)a3 target:(id)a4
{
  int v7 = [(NSMutableArray *)self->children count];
  if (v7 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7;
    do
      objc_msgSend(a4, a3, -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v8++));
    while (v9 != v8);
  }
}

- (void)mapSafely:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5
{
  int v8 = [(NSMutableArray *)self->children count];
  id v15 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = [(NSMutableArray *)self->children objectAtIndex:v9];
      if (objc_opt_isKindOfClass()) {
        [v15 addObject:v11];
      }
      ++v9;
    }
    while (v10 != v9);
  }
  int v12 = [v15 count];
  if (v12 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v12;
    do
      objc_msgSend(a4, a3, objc_msgSend(v15, "objectAtIndex:", v13++));
    while (v14 != v13);
  }
}

- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5
{
  uint64_t v9 = [(NSMutableArray *)self->children count];

  [(CPObject *)self commonMapFuncCall:a3 target:a4 childrenOfClass:a5 ofCount:v9];
}

- (void)map:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 last:(BOOL)a6
{
  uint64_t v10 = [(NSMutableArray *)self->children count] - !a6;

  [(CPObject *)self commonMapFuncCall:a3 target:a4 childrenOfClass:a5 ofCount:v10];
}

- (void)commonMapFuncCall:(SEL)a3 target:(id)a4 childrenOfClass:(Class)a5 ofCount:(int)a6
{
  if (a6 >= 1)
  {
    uint64_t v22 = v13;
    uint64_t v23 = v12;
    uint64_t v24 = v11;
    uint64_t v25 = v10;
    uint64_t v26 = v9;
    uint64_t v27 = v8;
    uint64_t v28 = v7;
    uint64_t v29 = v6;
    uint64_t v30 = v14;
    uint64_t v31 = v15;
    uint64_t v19 = 0;
    uint64_t v20 = a6;
    do
    {
      uint64_t v21 = -[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v19, a4, a5, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a4, a3, v21);
      }
      ++v19;
    }
    while (v20 != v19);
  }
}

- (void)performSelector:(SEL)a3
{
}

- (id)childrenNotOfClass:(Class)a3
{
  uint64_t v4 = [(NSMutableArray *)self->children count];
  int v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(NSMutableArray *)self->children objectAtIndex:i];
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v5 addObject:v7];
      }
    }
  }
  return v5;
}

- (id)childrenOfClass:(Class)a3
{
  uint64_t v4 = [(NSMutableArray *)self->children count];
  int v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(NSMutableArray *)self->children objectAtIndex:i];
      if (objc_opt_isKindOfClass()) {
        [v5 addObject:v7];
      }
    }
  }
  return v5;
}

- (void)childrenOfClass:(Class)a3 into:(id)a4
{
  uint64_t v6 = [(NSMutableArray *)self->children count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [(NSMutableArray *)self->children objectAtIndex:i];
      if (objc_opt_isKindOfClass()) {
        [a4 addObject:v8];
      }
    }
  }
}

- (id)ancestorOfClass:(Class)a3
{
  id result = self->parent;
  if (result)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    id result = self->parent;
    if ((isKindOfClass & 1) == 0)
    {
      return (id)[result ancestorOfClass:a3];
    }
  }
  return result;
}

- (void)promoteChildren
{
  int v3 = [(NSMutableArray *)self->children count];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v4++), "setParent:", self->parent);
    while (v5 != v4);
  }
  parent = self->parent;
  if (parent) {
    [(NSMutableArray *)parent->children addObjectsFromArray:self->children];
  }

  [(CPObject *)self removeAll];
}

- (void)removeAll
{
  self->zOrder = 0;
}

- (void)removeObjectAtIndex:(unsigned int)a3
{
  uint64_t v4 = a3;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", a3), "setParent:", 0);
  children = self->children;

  [(NSMutableArray *)children removeObjectAtIndex:v4];
}

- (void)remove
{
  parent = self->parent;
  if (parent) {
    [(CPObject *)parent remove:self];
  }
}

- (void)removeLastChild
{
  if ([(NSMutableArray *)self->children count])
  {
    uint64_t v3 = [(NSMutableArray *)self->children lastObject];
    [(CPObject *)self remove:v3];
  }
}

- (void)removeFirstChild
{
  if ([(NSMutableArray *)self->children count])
  {
    uint64_t v3 = [(NSMutableArray *)self->children objectAtIndex:0];
    [(CPObject *)self remove:v3];
  }
}

- (void)remove:(id)a3
{
  [a3 setParent:0];
  children = self->children;

  [(NSMutableArray *)children removeObject:a3];
}

- (void)addChildrenOf:(id)a3
{
  int v5 = [a3 count];
  uint64_t v6 = (void *)[a3 children];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", i++), "setParent:", self))
      ;
  }
  [(NSMutableArray *)self->children addObjectsFromArray:v6];
  [a3 removeAll];

  [(CPObject *)self recomputeZOrder];
}

- (void)addChildren:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      -[CPObject add:](self, "add:", [a3 objectAtIndex:i]);
  }
}

- (void)add:(id)a3 atIndex:(unsigned int)a4
{
  id v6 = a3;
  if ([a3 parent]) {
    [a3 remove];
  }
  [(NSMutableArray *)self->children insertObject:a3 atIndex:a4];
  [a3 setParent:self];
  [a3 setDocument:self->document];
}

- (void)add:(id)a3
{
  id v4 = a3;
  [a3 remove];
  [(NSMutableArray *)self->children addObject:a3];
  [a3 setParent:self];
  [a3 setDocument:self->document];
}

- (id)firstSibling
{
  if (!self->parent) {
    return 0;
  }
  v2 = objc_msgSend(-[CPObject parent](self, "parent"), "children");

  return (id)[v2 objectAtIndex:0];
}

- (id)lastSibling
{
  if (!self->parent) {
    return 0;
  }
  v2 = objc_msgSend(-[CPObject parent](self, "parent"), "children");

  return (id)[v2 lastObject];
}

- (id)previousSibling
{
  if (!self->parent) {
    return 0;
  }
  int v3 = objc_msgSend(-[CPObject parent](self, "parent"), "indexOf:", self);
  if (!v3) {
    return 0;
  }
  id v4 = [(CPObject *)self parent];

  return (id)[v4 childAtIndex:(v3 - 1)];
}

- (id)nextSibling
{
  if (!self->parent) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(-[CPObject parent](self, "parent"), "indexOf:", self) + 1;
  if (v3 >= [(CPObject *)self->parent count]) {
    return 0;
  }
  id v4 = [(CPObject *)self parent];

  return (id)[v4 childAtIndex:v3];
}

- (id)lastChild
{
  int v3 = [(CPObject *)self count];
  if (v3 < 1) {
    return 0;
  }

  return [(CPObject *)self childAtIndex:(v3 - 1)];
}

- (id)firstChild
{
  id result = (id)[(NSMutableArray *)self->children count];
  if (result)
  {
    children = self->children;
    return (id)[(NSMutableArray *)children objectAtIndex:0];
  }
  return result;
}

- (id)childAtIndex:(unsigned int)a3
{
  return (id)[(NSMutableArray *)self->children objectAtIndex:a3];
}

- (unsigned)countOfClass:(Class)a3
{
  uint64_t v4 = [(NSMutableArray *)self->children count];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = 0;
  unsigned int v6 = 0;
  do
  {
    [(NSMutableArray *)self->children objectAtIndex:v5];
    v6 += objc_opt_isKindOfClass() & 1;
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (unsigned)count
{
  return [(NSMutableArray *)self->children count];
}

- (id)parent
{
  return self->parent;
}

- (void)setParent:(id)a3
{
  self->parent = (CPObject *)a3;
}

- (id)newTakeChildrenAmong:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [a3 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:i];
      if ((CPObject *)[v8 parent] == self) {
        [v8 setParent:0];
      }
    }
  }
  unsigned int v9 = [(NSMutableArray *)self->children count];
  if (v9)
  {
    unsigned int v10 = 0;
    do
    {
      uint64_t v11 = (void *)[(NSMutableArray *)self->children objectAtIndex:v10];
      if ([v11 parent])
      {
        ++v10;
      }
      else
      {
        [v5 addObject:v11];
        [(NSMutableArray *)self->children removeObjectAtIndex:v10];
        --v9;
      }
    }
    while (v10 < v9);
  }
  return v5;
}

- (id)newTakeChildren
{
  children = self->children;
  int v4 = [(NSMutableArray *)children count];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v5++), "setParent:", 0);
    while (v6 != v5);
  }
  self->children = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->zOrder = 0;
  return children;
}

- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3
{
  uint64_t v5 = [(CPObject *)self copyWithoutChildren];
  unsigned int v6 = [(NSMutableArray *)self->children count];
  uint64_t v7 = v6 - a3;
  if (v6 > a3)
  {
    int v8 = v6 - a3;
    uint64_t v9 = a3;
    do
    {
      uint64_t v10 = [(NSMutableArray *)self->children objectAtIndex:v9];
      *(void *)(v10 + 8) = v5;
      [v5[2] addObject:v10];
      ++v9;
      --v8;
    }
    while (v8);
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a3, v7);
    [(NSMutableArray *)self->children removeObjectsAtIndexes:v11];
  }
  return v5;
}

- (id)copyWithoutChildren
{
  children = self->children;
  self->children = 0;
  id result = (id)[(CPObject *)self copy];
  self->children = children;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)CPCopyObject(self, a3);
  if (v5)
  {
    v5[4] = [(CPObject *)self page];
    v5[1] = 0;
    if (self->children)
    {
      v5[2] = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->children, "count"));
      uint64_t v6 = [(NSMutableArray *)self->children count];
      if (v6)
      {
        uint64_t v7 = 0;
        do
        {
          int v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v7), "copyWithZone:", a3);
          [v5 add:v8];

          ++v7;
        }
        while (v6 != v7);
      }
    }
    else
    {
      v5[2] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  return v5;
}

- (void)disposeDescendants
{
  uint64_t v3 = [(NSMutableArray *)self->children count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = (void *)[(NSMutableArray *)self->children objectAtIndex:i];
      [v5 disposeDescendants];
      if ([v5 conformsToProtocol:&unk_1ED0AEEE0]) {
        [v5 dispose];
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = [(NSMutableArray *)self->children count];
  if (v3)
  {
    uint64_t v4 = 0;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->children, "objectAtIndex:", v4++), "setParent:", 0);
    while (v3 != v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)CPObject;
  [(CPObject *)&v5 dealloc];
}

- (id)initSuper
{
  v3.receiver = self;
  v3.super_class = (Class)CPObject;
  return [(CPObject *)&v3 init];
}

- (CPObject)init
{
  v5.receiver = self;
  v5.super_class = (Class)CPObject;
  v2 = [(CPObject *)&v5 init];
  if (v2)
  {
    objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->document = 0;
    v2->page = 0;
    v2->children = v3;
  }
  return v2;
}

- (void)print
{
}

- (void)_printWithIndent:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    int v5 = a3;
    do
    {
      printf("    ");
      --v5;
    }
    while (v5);
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = [NSStringFromClass(v6) UTF8String];
  printf("(%s) %p", v7, self);
  if (objc_opt_respondsToSelector())
  {
    [(CPObject *)self zoneBounds];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_9;
    }
    [(CPObject *)self renderedBounds];
  }
  printf("bounds: (%.2f, %.2f), [%.2f, %.2f]", v8, v9, v10, v11);
LABEL_9:
  fputc(10, (FILE *)*MEMORY[0x1E4F143D8]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  children = self->children;
  uint64_t v13 = [(NSMutableArray *)children countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    uint64_t v16 = (a3 + 1);
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) _printWithIndent:v16];
      }
      uint64_t v14 = [(NSMutableArray *)children countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

@end