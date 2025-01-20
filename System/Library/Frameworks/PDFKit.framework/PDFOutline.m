@interface PDFOutline
- (BOOL)_addDestinationToDictionaryRef:(__CFDictionary *)a3;
- (BOOL)_childDictionaryReferencesParent:(CGPDFDictionary *)a3;
- (BOOL)isOpen;
- (CGPDFDictionary)_srcDictionaryRef;
- (NSString)label;
- (NSUInteger)index;
- (NSUInteger)numberOfChildren;
- (PDFAction)action;
- (PDFDestination)destination;
- (PDFDocument)document;
- (PDFOutline)childAtIndex:(NSUInteger)index;
- (PDFOutline)init;
- (PDFOutline)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 parent:(id)a5;
- (PDFOutline)parent;
- (__CFDictionary)createDictionaryRef;
- (id)_childArray;
- (id)_firstChild;
- (id)_lastChild;
- (id)_next;
- (id)_previous;
- (int)_openDescendantCount;
- (void)_addActionToDictionaryRef:(__CFDictionary *)a3;
- (void)_lazilyLoadChildren;
- (void)_removeChildAtIndex:(unint64_t)a3;
- (void)_setParent:(id)a3;
- (void)commonInit;
- (void)dealloc;
- (void)insertChild:(PDFOutline *)child atIndex:(NSUInteger)index;
- (void)invalidateDictionaryRef;
- (void)removeFromParent;
- (void)setAction:(PDFAction *)action;
- (void)setDestination:(PDFDestination *)destination;
- (void)setDocument:(id)a3;
- (void)setIsOpen:(BOOL)isOpen;
- (void)setLabel:(NSString *)label;
@end

@implementation PDFOutline

- (PDFOutline)init
{
  v5.receiver = self;
  v5.super_class = (Class)PDFOutline;
  v2 = [(PDFOutline *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PDFOutline *)v2 commonInit];
  }
  return v3;
}

- (PDFDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return (PDFDocument *)WeakRetained;
}

- (PDFOutline)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->parent);

  return (PDFOutline *)WeakRetained;
}

- (NSUInteger)numberOfChildren
{
  v2 = self->_private;
  if (!v2->childrenLoaded)
  {
    [(PDFOutline *)self _lazilyLoadChildren];
    v2 = self->_private;
  }
  NSUInteger result = (NSUInteger)v2->children;
  if (result) {
    return (int)[(id)result count];
  }
  return result;
}

- (NSUInteger)index
{
  v3 = [(PDFOutline *)self parent];

  if (!v3) {
    return 0;
  }
  v4 = [(PDFOutline *)self parent];
  objc_super v5 = [v4 _childArray];
  NSUInteger v6 = [v5 indexOfObject:self];

  return v6;
}

- (PDFOutline)childAtIndex:(NSUInteger)index
{
  objc_super v5 = self->_private;
  if (!v5->childrenLoaded)
  {
    [(PDFOutline *)self _lazilyLoadChildren];
    objc_super v5 = self->_private;
  }
  children = v5->children;
  if (children)
  {
    if ([children count] <= index)
    {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"childAtIndex: %ld out of bounds", index);
      children = 0;
    }
    else
    {
      children = [(NSMutableArray *)self->_private->children objectAtIndex:index];
    }
  }

  return (PDFOutline *)children;
}

- (void)insertChild:(PDFOutline *)child atIndex:(NSUInteger)index
{
  NSUInteger v6 = child;
  if (v6)
  {
    v12 = v6;
    v7 = self->_private;
    if (!v7->childrenLoaded)
    {
      [(PDFOutline *)self _lazilyLoadChildren];
      v7 = self->_private;
    }
    children = v7->children;
    if (!children)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      v10 = self->_private;
      v11 = v10->children;
      v10->children = (NSMutableArray *)v9;

      children = self->_private->children;
    }
    [(NSMutableArray *)children insertObject:v12 atIndex:index];
    [(PDFOutline *)v12 _setParent:self];
    NSUInteger v6 = v12;
  }
}

- (void)removeFromParent
{
  v3 = [(PDFOutline *)self parent];

  if (v3)
  {
    NSUInteger v4 = [(PDFOutline *)self index];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v5 = (void *)MEMORY[0x263EFF940];
      uint64_t v6 = *MEMORY[0x263EFF488];
      [v5 raise:v6 format:@"removeFromParent: object no longer child of parent"];
    }
    else
    {
      NSUInteger v7 = v4;
      v8 = [(PDFOutline *)self parent];
      [v8 _removeChildAtIndex:v7];

      p_parent = &self->_private->parent;
      objc_storeWeak((id *)p_parent, 0);
    }
  }
}

- (NSString)label
{
  v3 = self->_private;
  title = v3->title;
  if (!title)
  {
    v3->title = (NSString *)&stru_26C516768;

    title = self->_private->title;
  }

  return title;
}

- (void)setLabel:(NSString *)label
{
  uint64_t v4 = [(NSString *)label copy];
  objc_super v5 = self->_private;
  title = v5->title;
  v5->title = (NSString *)v4;

  MEMORY[0x270F9A758](v4, title);
}

- (BOOL)isOpen
{
  return self->_private->open;
}

- (void)setIsOpen:(BOOL)isOpen
{
  self->_private->open = isOpen;
}

- (PDFDestination)destination
{
  v2 = [(PDFOutline *)self action];
  v3 = v2;
  if (v2
    && ([v2 type],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"GoTo"],
        v4,
        v5))
  {
    uint64_t v6 = [v3 destination];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (PDFDestination *)v6;
}

- (void)setDestination:(PDFDestination *)destination
{
  uint64_t v4 = destination;
  int v5 = [[PDFActionGoTo alloc] initWithDestination:v4];

  [(PDFOutline *)self setAction:v5];
}

- (PDFAction)action
{
  v2 = self->_private;
  if (v2->action)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v2 = self->_private;
    if (isKindOfClass)
    {
      action = v2->action;
      v2->action = 0;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
      NSUInteger v7 = [[PDFDestination alloc] initWithDictionary:self->_private->srcDictionary forDocument:WeakRetained];
      if (v7)
      {
        v8 = [[PDFActionGoTo alloc] initWithDestination:v7];
      }
      else
      {
        CGPDFDictionaryRef value = 0;
        if (!CGPDFDictionaryGetDictionary(self->_private->srcDictionary, "A", &value))
        {
LABEL_8:

          v2 = self->_private;
          goto LABEL_9;
        }
        v8 = +[PDFAction actionWithActionDictionary:value forDocument:WeakRetained forPage:0];
      }
      uint64_t v9 = self->_private;
      v10 = v9->action;
      v9->action = &v8->super;

      goto LABEL_8;
    }
  }
LABEL_9:
  v11 = v2->action;

  return v11;
}

- (void)setAction:(PDFAction *)action
{
  int v5 = action;
  uint64_t v6 = self->_private;
  v8 = v6->action;
  p_action = (id *)&v6->action;
  if (v8 != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong(p_action, action);
    int v5 = v9;
  }

  MEMORY[0x270F9A758](p_action, v5);
}

- (void)dealloc
{
  dictionary = self->_private->dictionary;
  if (dictionary) {
    CFRelease(dictionary);
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFOutline;
  [(PDFOutline *)&v4 dealloc];
}

- (PDFOutline)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 parent:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDFOutline;
  v10 = [(PDFOutline *)&v21 init];
  v11 = v10;
  if (v10)
  {
    [(PDFOutline *)v10 commonInit];
    CGPDFInteger v19 = 0;
    CGPDFStringRef value = 0;
    objc_storeWeak((id *)&v11->_private->document, v8);
    v11->_private->srcDictionary = a3;
    objc_storeWeak((id *)&v11->_private->parent, v9);
    if (CGPDFDictionaryGetString(a3, "Title", &value))
    {
      CFStringRef v12 = CGPDFStringCopyTextString(value);
      v13 = v11->_private;
      title = v13->title;
      v13->title = &v12->isa;
    }
    else
    {
      v11->_private->open = 1;
    }
    if (CGPDFDictionaryGetInteger(a3, "Count", &v19)) {
      v11->_private->open = v19 > 0;
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v19);
    v16 = v11->_private;
    action = v16->action;
    v16->action = (PDFAction *)v15;

    v11->_private->childrenLoaded = 0;
  }

  return v11;
}

- (void)_lazilyLoadChildren
{
  v2 = self->_private;
  if (v2)
  {
    if (v2->srcDictionary)
    {
      CGPDFDictionaryRef value = 0;
      v2->childrenLoaded = 1;
      if (CGPDFDictionaryGetDictionary(self->_private->srcDictionary, "First", &value))
      {
        uint64_t v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
        int v5 = self->_private;
        children = v5->children;
        v5->children = (NSMutableArray *)v4;

        if (self->_private->children)
        {
          while (![(PDFOutline *)self _childDictionaryReferencesParent:value])
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
            id v8 = objc_alloc((Class)objc_opt_class());
            uint64_t v9 = [v8 initWithDictionary:value forDocument:WeakRetained parent:self];
            if (!v9)
            {

              return;
            }
            v10 = (void *)v9;
            [(NSMutableArray *)self->_private->children addObject:v9];

            if (!CGPDFDictionaryGetDictionary(value, "Next", &value)) {
              return;
            }
          }
        }
      }
    }
  }
}

- (void)commonInit
{
  v3 = objc_alloc_init(PDFOutlinePrivate);
  uint64_t v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  int v5 = self->_private;
  title = v5->title;
  v5->title = 0;

  NSUInteger v7 = self->_private;
  action = v7->action;
  v7->action = 0;

  objc_storeWeak((id *)&self->_private->parent, 0);
  uint64_t v9 = self->_private;
  children = v9->children;
  v9->children = 0;

  self->_private->childrenLoaded = 0;
  self->_private->dictionary = 0;
  self->_private->open = 0;
  self->_private->srcDictionary = 0;
}

- (CGPDFDictionary)_srcDictionaryRef
{
  return self->_private->srcDictionary;
}

- (__CFDictionary)createDictionaryRef
{
  int valuePtr = 0;
  dictionary = self->_private->dictionary;
  v3 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!dictionary)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    self->_private->dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (self->_private->dictionary)
    {
      id v8 = [(PDFOutline *)self _firstChild];
      uint64_t v9 = v8;
      if (v8)
      {
        v10 = (const void *)[v8 createDictionaryRef];
        if (v10)
        {
          v11 = v10;
          CFDictionarySetValue(self->_private->dictionary, @"/First", v10);
          CFRelease(v11);
        }
      }
      CFStringRef v12 = [(PDFOutline *)self parent];

      if (v12)
      {
        v13 = (const void *)[v12 createDictionaryRef];
        if (v13)
        {
          v14 = v13;
          CFDictionarySetValue(self->_private->dictionary, @"/Parent", v13);
          CFRelease(v14);
        }
      }
      uint64_t v15 = [(PDFOutline *)self _next];

      if (v15)
      {
        v16 = (const void *)[v15 createDictionaryRef];
        if (v16)
        {
          v17 = v16;
          CFDictionarySetValue(self->_private->dictionary, @"/Next", v16);
          CFRelease(v17);
        }
      }
      v18 = [(PDFOutline *)self _previous];

      if (v18)
      {
        CGPDFInteger v19 = (const void *)[v18 createDictionaryRef];
        if (v19)
        {
          v20 = v19;
          CFDictionarySetValue(self->_private->dictionary, @"/Prev", v19);
          CFRelease(v20);
        }
      }
      uint64_t v4 = [(PDFOutline *)self _lastChild];

      if (v4)
      {
        objc_super v21 = (const void *)[v4 createDictionaryRef];
        if (v21)
        {
          v22 = v21;
          CFDictionarySetValue(self->_private->dictionary, @"/Last", v21);
          CFRelease(v22);
        }
      }
      int v23 = [(PDFOutline *)self _openDescendantCount];
      int valuePtr = v23;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_private->parent);
      if (WeakRetained || v23 >= 1)
      {
        CFNumberRef v25 = CFNumberCreate(v7, kCFNumberSInt32Type, &valuePtr);
        if (v25)
        {
          CFNumberRef v26 = v25;
          CFDictionarySetValue(self->_private->dictionary, @"/Count", v25);
          CFRelease(v26);
        }
        if (WeakRetained)
        {
          v27 = self->_private->dictionary;
          v28 = [(PDFOutline *)self label];
          CFDictionarySetValue(v27, @"/Title", v28);
        }
      }
      if (![(PDFOutline *)self _addDestinationToDictionaryRef:self->_private->dictionary])[(PDFOutline *)self _addActionToDictionaryRef:self->_private->dictionary]; {

      }
      dictionary = self->_private->dictionary;
      if (dictionary) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    Copy = 0;
    goto LABEL_32;
  }
  uint64_t v4 = 0;
LABEL_3:
  Copy = CFDictionaryCreateCopy(*v3, dictionary);
LABEL_32:

  return Copy;
}

- (void)invalidateDictionaryRef
{
  dictionary = self->_private->dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_private->dictionary = 0;
  }
  NSUInteger v4 = [(PDFOutline *)self numberOfChildren];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      CFAllocatorRef v7 = [(PDFOutline *)self childAtIndex:i];
      [v7 invalidateDictionaryRef];
    }
  }
}

- (void)setDocument:(id)a3
{
}

- (void)_setParent:(id)a3
{
}

- (id)_childArray
{
  v2 = self->_private;
  if (!v2->childrenLoaded)
  {
    [(PDFOutline *)self _lazilyLoadChildren];
    v2 = self->_private;
  }
  children = v2->children;

  return children;
}

- (void)_removeChildAtIndex:(unint64_t)a3
{
  NSUInteger v4 = self->_private;
  if (!v4->childrenLoaded)
  {
    [(PDFOutline *)self _lazilyLoadChildren];
    NSUInteger v4 = self->_private;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    children = v4->children;
    if (children)
    {
      [(NSMutableArray *)children removeObjectAtIndex:a3];
    }
  }
}

- (BOOL)_addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  NSUInteger v4 = [(PDFOutline *)self destination];
  NSUInteger v5 = v4;
  if (v4 && (uint64_t v6 = (const void *)[v4 createArrayRef]) != 0)
  {
    CFAllocatorRef v7 = v6;
    CFDictionarySetValue(a3, @"/Dest", v6);
    CFRelease(v7);
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_addActionToDictionaryRef:(__CFDictionary *)a3
{
  NSUInteger v4 = [(PDFOutline *)self action];
  if (v4)
  {
    id v6 = v4;
    NSUInteger v5 = (const void *)[v4 createDictionaryRef];
    NSUInteger v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, @"/A", v5);
      CFRelease(v5);
      NSUInteger v4 = v6;
    }
  }
}

- (int)_openDescendantCount
{
  int v3 = [(PDFOutline *)self numberOfChildren];
  if (!v3) {
    return 0;
  }
  if (![(PDFOutline *)self isOpen]) {
    return -v3;
  }
  if (v3 < 1) {
    return v3;
  }
  uint64_t v4 = 0;
  int v5 = v3;
  do
  {
    id v6 = [(PDFOutline *)self childAtIndex:v4];
    int v7 = [v6 _openDescendantCount];

    if (v7 <= 0) {
      int v8 = 0;
    }
    else {
      int v8 = v3;
    }
    v5 += v8;
    ++v4;
  }
  while (v3 != v4);
  return v5;
}

- (BOOL)_childDictionaryReferencesParent:(CGPDFDictionary *)a3
{
  NSUInteger v5 = [(PDFOutline *)self numberOfChildren];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = [(PDFOutline *)self childAtIndex:v7];
      uint64_t v9 = (CGPDFDictionary *)[v8 _srcDictionaryRef];

      if (v9 == a3) {
        return 1;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v10 = self;
    do
    {
      v11 = [(PDFOutline *)v10 _srcDictionaryRef];
      BOOL v12 = v11 == a3;
      if (v11 == a3) {
        break;
      }
      uint64_t v13 = [(PDFOutline *)v10 parent];

      v10 = (PDFOutline *)v13;
    }
    while (v13);
  }
  return v12;
}

- (id)_next
{
  int v3 = [(PDFOutline *)self parent];

  if (v3)
  {
    unint64_t v4 = [(PDFOutline *)self index];
    NSUInteger v5 = [(PDFOutline *)self parent];
    uint64_t v6 = [v5 numberOfChildren];

    uint64_t v7 = 0;
    if (v6 && v4 < v6 - 1)
    {
      int v8 = [(PDFOutline *)self parent];
      uint64_t v7 = [v8 childAtIndex:v4 + 1];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_previous
{
  int v3 = [(PDFOutline *)self parent];

  if (v3)
  {
    NSUInteger v4 = [(PDFOutline *)self index];
    NSUInteger v5 = [(PDFOutline *)self parent];
    uint64_t v6 = [v5 numberOfChildren];

    uint64_t v7 = 0;
    if (v6 && v4)
    {
      int v8 = [(PDFOutline *)self parent];
      uint64_t v7 = [v8 childAtIndex:v4 - 1];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_firstChild
{
  int v3 = [(PDFOutline *)self numberOfChildren];
  if (v3)
  {
    int v3 = [(PDFOutline *)self childAtIndex:0];
  }

  return v3;
}

- (id)_lastChild
{
  int v3 = [(PDFOutline *)self numberOfChildren];
  if (v3)
  {
    int v3 = [(PDFOutline *)self childAtIndex:v3 - 1];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end