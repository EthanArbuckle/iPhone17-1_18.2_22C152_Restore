@interface AXElementGroup
+ (AXElementGroup)groupWithElements:(id)a3;
+ (AXElementGroup)groupWithElements:(id)a3 label:(id)a4;
+ (AXElementGroup)groupWithGenerator:(id)a3;
- (AXElement)elementCommunity;
- (AXElementGroup)initWithElements:(id)a3 label:(id)a4;
- (AXElementGroup)initWithGenerator:(id)a3;
- (AXElementGroup)parentGroup;
- (AXElementGroupGenerator)generator;
- (BOOL)allowsChangingExistingGroupingOfContents;
- (BOOL)allowsVisualGroupingOfChildren;
- (BOOL)canBeGroupedWithOtherGroupables;
- (BOOL)canBeReplacedByChildren;
- (BOOL)containsNativeFocusElement;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isKeyboardContainer;
- (BOOL)isKeyboardRow;
- (BOOL)isRootGroup;
- (BOOL)shouldBeUngrouped;
- (CGRect)frame;
- (NSHashTable)groupObservers;
- (NSString)identifier;
- (NSString)label;
- (id)_debugBriefDescription;
- (id)_debugDescriptionForScanningBehaviorTraits;
- (id)_debugDescriptionForTraits;
- (id)_debugFullDescriptionWithIndent:(id)a3;
- (id)_leafAXElementWithPosition:(int64_t)a3;
- (id)_siblingOfChild:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5;
- (id)ancestorPassingTest:(id)a3;
- (id)bottomMostLeafAXElement;
- (id)childrenPassingTest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugFullDescription;
- (id)descendantWithNativeFocus;
- (id)descendantsPassingTest:(id)a3;
- (id)firstChild;
- (id)firstChildMatchingItem:(id)a3;
- (id)firstChildPassingTest:(id)a3;
- (id)firstDescendantMatchingItem:(id)a3;
- (id)firstDescendantPassingTest:(id)a3;
- (id)firstLeafDescendant;
- (id)groupByAppendingGroupable:(id)a3;
- (id)groupByPrependingGroupable:(id)a3;
- (id)groupByRemovingGroupable:(id)a3;
- (id)groupByReplacingGroupable:(id)a3 withGroupable:(id)a4;
- (id)highestAncestorGroup;
- (id)keyboardContainer;
- (id)keyboardContainerRows;
- (id)keyboardRow;
- (id)leftMostLeafAXElement;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nextSiblingOfChild:(id)a3 didWrap:(BOOL *)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)previousSiblingOfChild:(id)a3 didWrap:(BOOL *)a4;
- (id)rightMostLeafAXElement;
- (id)topMostLeafAXElement;
- (unint64_t)count;
- (unint64_t)groupTraits;
- (unint64_t)numberOfElements;
- (unint64_t)userDefinedScanningBehaviorTraits;
- (void)_commonInitWithElements:(id)a3 label:(id)a4 generator:(id)a5;
- (void)_generateGroupsIfNeeded;
- (void)_notifyGroupObserversDidTransferStateToGroup:(id)a3;
- (void)_notifyGroupObserversWillTransferStateToGroup:(id)a3;
- (void)_transferStateToGroup:(id)a3;
- (void)dealloc;
- (void)enumerateLeafDescendantsUsingBlock:(id)a3;
- (void)registerGroupObserver:(id)a3;
- (void)setElementCommunity:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setGroupObservers:(id)a3;
- (void)setGroupTraits:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setParentGroup:(id)a3;
- (void)setRootGroup:(BOOL)a3;
- (void)setUserDefinedScanningBehaviorTraits:(unint64_t)a3;
- (void)unregisterAllGroupObservers;
- (void)unregisterGroupObserver:(id)a3;
@end

@implementation AXElementGroup

+ (AXElementGroup)groupWithElements:(id)a3
{
  return (AXElementGroup *)[a1 groupWithElements:a3 label:0];
}

+ (AXElementGroup)groupWithElements:(id)a3 label:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithElements:v6 label:v5];

  return (AXElementGroup *)v7;
}

+ (AXElementGroup)groupWithGenerator:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGenerator:v3];

  return (AXElementGroup *)v4;
}

- (AXElementGroup)initWithElements:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXElementGroup;
  v8 = [(AXElementGroup *)&v11 init];
  v9 = v8;
  if (v8) {
    [(AXElementGroup *)v8 _commonInitWithElements:v6 label:v7 generator:0];
  }

  return v9;
}

- (AXElementGroup)initWithGenerator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXElementGroup;
  id v5 = [(AXElementGroup *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(AXElementGroup *)v5 _commonInitWithElements:0 label:0 generator:v4];
  }

  return v6;
}

- (void)_commonInitWithElements:(id)a3 label:(id)a4 generator:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(AXElementGroup *)self setGroupObservers:v11];

  if (v10)
  {
    [(AXElementGroup *)self setGenerator:v10];
  }
  else
  {
    v12 = (NSArray *)[v8 copy];
    elementStore = self->_elementStore;
    self->_elementStore = v12;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = self->_elementStore;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "setParentGroup:", self, (void)v21);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    v19 = (NSString *)[v9 copy];
    label = self->_label;
    self->_label = v19;
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(AXElementGroup *)self unregisterAllGroupObservers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_elementStore;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 parentGroup];

        if (v9 == self) {
          [v8 setParentGroup:0];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXElementGroup;
  [(AXElementGroup *)&v10 dealloc];
}

- (id)groupByPrependingGroupable:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
    [v4 addObjectsFromArray:self];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(AXElementGroup *)self label];
    id v7 = [v5 groupWithElements:v4 label:v6];

    [(AXElementGroup *)self _transferStateToGroup:v7];
  }
  else
  {
    id v8 = objc_opt_class();
    uint64_t v4 = [(AXElementGroup *)self label];
    id v7 = [v8 groupWithElements:self label:v4];
  }

  return v7;
}

- (id)groupByAppendingGroupable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)[(NSArray *)self->_elementStore mutableCopy];
    [v5 addObject:v4];
    uint64_t v6 = objc_opt_class();
    id v7 = [(AXElementGroup *)self label];
    id v8 = [v6 groupWithElements:v5 label:v7];

    [(AXElementGroup *)self _transferStateToGroup:v8];
  }
  else
  {
    id v9 = objc_opt_class();
    uint64_t v5 = [(AXElementGroup *)self label];
    id v8 = [v9 groupWithElements:self label:v5];
  }

  return v8;
}

- (id)groupByRemovingGroupable:(id)a3
{
  elementStore = self->_elementStore;
  id v5 = a3;
  uint64_t v6 = (void *)[(NSArray *)elementStore mutableCopy];
  [v6 removeObject:v5];

  id v7 = objc_opt_class();
  id v8 = [(AXElementGroup *)self label];
  id v9 = [v7 groupWithElements:v6 label:v8];

  [(AXElementGroup *)self _transferStateToGroup:v9];
  return v9;
}

- (id)groupByReplacingGroupable:(id)a3 withGroupable:(id)a4
{
  id v6 = a4;
  elementStore = self->_elementStore;
  id v8 = a3;
  id v9 = (void *)[(NSArray *)elementStore mutableCopy];
  uint64_t v10 = [v9 indexOfObject:v8];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v9 replaceObjectAtIndex:v10 withObject:v6];
  }
  long long v11 = objc_opt_class();
  long long v12 = [(AXElementGroup *)self label];
  long long v13 = [v11 groupWithElements:v9 label:v12];

  [(AXElementGroup *)self _transferStateToGroup:v13];
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  elementStore = self->_elementStore;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = v5;
  if (elementStore)
  {
    id v7 = (void *)[v5 initWithElements:self->_elementStore label:self->_label];
  }
  else
  {
    id v8 = [(AXElementGroup *)self generator];
    id v7 = (void *)[v6 initWithGenerator:v8];
  }
  [(AXElementGroup *)self _transferStateToGroup:v7];
  return v7;
}

- (void)_transferStateToGroup:(id)a3
{
  id v6 = a3;
  [(AXElementGroup *)self _notifyGroupObserversWillTransferStateToGroup:v6];
  objc_msgSend(v6, "setGroupTraits:", -[AXElementGroup groupTraits](self, "groupTraits"));
  objc_msgSend(v6, "setUserDefinedScanningBehaviorTraits:", -[AXElementGroup userDefinedScanningBehaviorTraits](self, "userDefinedScanningBehaviorTraits"));
  id v4 = [(AXElementGroup *)self elementCommunity];
  [v6 setElementCommunity:v4];

  id v5 = [(AXElementGroup *)self identifier];
  [v6 setIdentifier:v5];

  [(AXElementGroup *)self _notifyGroupObserversDidTransferStateToGroup:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXElementGroup;
  if ([(AXElementGroup *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(AXElementGroup *)self identifier];
      id v7 = [v4 identifier];
      char v5 = [v6 isEqualToString:v7];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)count
{
  [(AXElementGroup *)self _generateGroupsIfNeeded];
  elementStore = self->_elementStore;
  return [(NSArray *)elementStore count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  [(AXElementGroup *)self _generateGroupsIfNeeded];
  elementStore = self->_elementStore;
  return [(NSArray *)elementStore objectAtIndex:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (CGRect)frame
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXElementGroup *)self elementCommunity];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [(AXElementGroup *)self elementCommunity];
    if ([v5 isSpringBoard])
    {
LABEL_5:

      goto LABEL_6;
    }
    id v6 = [(AXElementGroup *)self elementCommunity];
    id v7 = [v6 application];
    if ([v7 isAXUIServer])
    {

      goto LABEL_5;
    }
    BOOL v25 = [(AXElementGroup *)self isKeyboardContainer];

    if (!v25)
    {
      long long v12 = [(AXElementGroup *)self elementCommunity];
      [(AXElementGroup *)v12 frame];
      CGFloat x = v26;
      CGFloat y = v27;
      CGFloat width = v28;
      CGFloat height = v29;
      goto LABEL_13;
    }
  }
LABEL_6:
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v12 = self;
  uint64_t v13 = [(AXElementGroup *)v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v16), "frame", (void)v30);
        v39.origin.CGFloat x = v17;
        v39.origin.CGFloat y = v18;
        v39.size.CGFloat width = v19;
        v39.size.CGFloat height = v20;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        CGRect v37 = CGRectUnion(v36, v39);
        CGFloat x = v37.origin.x;
        CGFloat y = v37.origin.y;
        CGFloat width = v37.size.width;
        CGFloat height = v37.size.height;
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(AXElementGroup *)v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }
LABEL_13:

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)highestAncestorGroup
{
  v2 = self;
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = v2;
    do
    {
      char v5 = v3;

      uint64_t v3 = [(AXElementGroup *)v5 parentGroup];

      id v4 = v5;
    }
    while (v3);
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (BOOL)isGroup
{
  return 1;
}

- (void)_generateGroupsIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_elementStore = &self->_elementStore;
  if (!self->_elementStore)
  {
    id v4 = [(AXElementGroup *)self generator];

    if (v4)
    {
      char v5 = [(AXElementGroup *)self generator];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = [(AXElementGroup *)self generator];
        [v7 willGenerateElements:self];
      }
      id v8 = [(AXElementGroup *)self generator];
      objc_super v9 = [v8 generateElementsForGroup:self];

      objc_storeStrong((id *)p_elementStore, v9);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = *p_elementStore;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "setParentGroup:", self, (void)v18);
          }
          while (v12 != v14);
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      uint64_t v15 = [(AXElementGroup *)self generator];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        CGFloat v17 = [(AXElementGroup *)self generator];
        [v17 didGenerateElements:self];
      }
    }
  }
}

- (id)firstChild
{
  return [(AXElementGroup *)self objectAtIndex:0];
}

- (id)_siblingOfChild:(id)a3 inDirection:(BOOL)a4 didWrap:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = [(AXElementGroup *)self indexOfObject:a3];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = 0;
    uint64_t v10 = 0;
    if (!a5) {
      goto LABEL_17;
    }
LABEL_16:
    *a5 = v9;
    goto LABEL_17;
  }
  uint64_t v11 = v8;
  unint64_t v12 = [(AXElementGroup *)self count];
  unint64_t v13 = v11 - 1;
  if (!v11) {
    unint64_t v13 = v12 - 1;
  }
  if (v11 + 1 == v12) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v11 + 1;
  }
  BOOL v15 = !v6;
  if (v6) {
    BOOL v9 = v11 + 1 == v12;
  }
  else {
    BOOL v9 = v11 == 0;
  }
  if (v15) {
    unint64_t v16 = v13;
  }
  else {
    unint64_t v16 = v14;
  }
  uint64_t v10 = [(AXElementGroup *)self objectAtIndex:v16];
  if (a5) {
    goto LABEL_16;
  }
LABEL_17:
  return v10;
}

- (id)nextSiblingOfChild:(id)a3 didWrap:(BOOL *)a4
{
  return [(AXElementGroup *)self _siblingOfChild:a3 inDirection:1 didWrap:a4];
}

- (id)previousSiblingOfChild:(id)a3 didWrap:(BOOL *)a4
{
  return [(AXElementGroup *)self _siblingOfChild:a3 inDirection:0 didWrap:a4];
}

- (id)firstChildMatchingItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v5 = self;
    id v6 = (id)[(AXElementGroup *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(v4, "isEqual:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
          {
            id v6 = v4;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(AXElementGroup *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)firstChildPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v5 = self;
    id v6 = (id)[(AXElementGroup *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (v4[2](v4, v9))
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[(AXElementGroup *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)childrenPassingTest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void))a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self;
    uint64_t v7 = [(AXElementGroup *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            objc_msgSend(v5, "addObject:", v11, (void)v14);
          }
        }
        uint64_t v8 = [(AXElementGroup *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      id v12 = v5;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)firstDescendantMatchingItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self];
    id v6 = v5;
    while ([v5 count])
    {
      uint64_t v7 = [v6 firstObject];
      [v6 removeObject:v7];
      if ([v4 isEqual:v7]) {
        goto LABEL_10;
      }
      if ([v7 isGroup]) {
        [v6 addObjectsFromArray:v7];
      }

      char v5 = v6;
    }
    uint64_t v7 = 0;
LABEL_10:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)firstDescendantPassingTest:(id)a3
{
  id v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self];
    if ([v5 count])
    {
      while (1)
      {
        id v6 = [v5 firstObject];
        [v5 removeObject:v6];
        if (v4[2](v4, v6)) {
          break;
        }
        if ([v6 isGroup]) {
          [v5 addObjectsFromArray:v6];
        }

        if (![v5 count]) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descendantsPassingTest:(id)a3
{
  id v4 = (unsigned int (**)(id, void *))a3;
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:self];
    while ([v6 count])
    {
      uint64_t v7 = [v6 firstObject];
      [v6 removeObject:v7];
      if (v4[2](v4, v7)) {
        [v5 addObject:v7];
      }
      if ([v7 isGroup]) {
        [v6 addObjectsFromArray:v7];
      }
    }
    if ([v5 count]) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)ancestorPassingTest:(id)a3
{
  id v4 = (uint64_t (**)(id, AXElementGroup *))a3;
  if (v4)
  {
    char v5 = self;
    if (v5)
    {
      do
      {
        if (v4[2](v4, v5)) {
          break;
        }
        uint64_t v6 = [(AXElementGroup *)v5 parentGroup];

        char v5 = (AXElementGroup *)v6;
      }
      while (v6);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)firstLeafDescendant
{
  return [(AXElementGroup *)self firstDescendantPassingTest:&__block_literal_global_14];
}

uint64_t __37__AXElementGroup_firstLeafDescendant__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isGroup] ^ 1;
}

- (void)enumerateLeafDescendantsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = self;
  uint64_t v6 = [(AXElementGroup *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isGroup", (void)v11)) {
          [v10 enumerateLeafDescendantsUsingBlock:v4];
        }
        else {
          v4[2](v4, v10);
        }
      }
      uint64_t v7 = [(AXElementGroup *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)keyboardContainerRows
{
  if ([(AXElementGroup *)self isKeyboardContainer])
  {
    uint64_t v3 = [(AXElementGroup *)self childrenPassingTest:&__block_literal_global_17];
    if ([v3 count]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __39__AXElementGroup_keyboardContainerRows__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGroup]) {
    uint64_t v3 = [v2 isKeyboardRow];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)keyboardRow
{
  return [(AXElementGroup *)self ancestorPassingTest:&__block_literal_global_20];
}

uint64_t __29__AXElementGroup_keyboardRow__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isKeyboardRow];
}

- (id)keyboardContainer
{
  return [(AXElementGroup *)self ancestorPassingTest:&__block_literal_global_22];
}

uint64_t __35__AXElementGroup_keyboardContainer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isKeyboardContainer];
}

- (BOOL)isKeyboardContainer
{
  return [(AXElementGroup *)self groupTraits] & 1;
}

- (BOOL)isKeyboardRow
{
  return ([(AXElementGroup *)self groupTraits] >> 1) & 1;
}

- (BOOL)canBeGroupedWithOtherGroupables
{
  return ([(AXElementGroup *)self groupTraits] & 0x43) == 0;
}

- (BOOL)canBeReplacedByChildren
{
  return ([(AXElementGroup *)self groupTraits] & 0x113) == 0;
}

- (BOOL)allowsChangingExistingGroupingOfContents
{
  return ([(AXElementGroup *)self groupTraits] & 0x22) == 0;
}

- (BOOL)shouldBeUngrouped
{
  return ([(AXElementGroup *)self groupTraits] >> 7) & 1;
}

- (BOOL)allowsVisualGroupingOfChildren
{
  return ([(AXElementGroup *)self groupTraits] & 0x180) == 0;
}

- (unint64_t)numberOfElements
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self;
  uint64_t v3 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isGroup", (void)v11)) {
          uint64_t v9 = [v8 numberOfElements];
        }
        else {
          uint64_t v9 = 1;
        }
        v5 += v9;
      }
      uint64_t v4 = [(AXElementGroup *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)descendantWithNativeFocus
{
  return [(AXElementGroup *)self firstDescendantPassingTest:&__block_literal_global_24];
}

uint64_t __43__AXElementGroup_descendantWithNativeFocus__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isNativeFocused];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)containsNativeFocusElement
{
  id v2 = [(AXElementGroup *)self descendantWithNativeFocus];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_leafAXElementWithPosition:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  long long v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AXElementGroup__leafAXElementWithPosition___block_invoke;
  v5[3] = &unk_1E6220FA8;
  v5[4] = &v6;
  v5[5] = a3;
  [(AXElementGroup *)self enumerateLeafDescendantsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __45__AXElementGroup__leafAXElementWithPosition___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  id v13 = v4;
  if (v7)
  {
    switch(*(void *)(a1 + 40))
    {
      case 0:
        [v4 frame];
        double MinY = CGRectGetMinY(v15);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) frame];
        double MinX = CGRectGetMinY(v16);
        goto LABEL_6;
      case 1:
        [v4 frame];
        double MaxY = CGRectGetMaxY(v17);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) frame];
        double MaxX = CGRectGetMaxY(v18);
        goto LABEL_9;
      case 2:
        [v4 frame];
        double MinY = CGRectGetMinX(v19);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) frame];
        double MinX = CGRectGetMinX(v20);
LABEL_6:
        id v4 = v13;
        if (MinY >= MinX) {
          goto LABEL_12;
        }
        goto LABEL_10;
      case 3:
        [v4 frame];
        double MaxY = CGRectGetMaxX(v21);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) frame];
        double MaxX = CGRectGetMaxX(v22);
LABEL_9:
        id v4 = v13;
        if (MaxY <= MaxX) {
          goto LABEL_12;
        }
LABEL_10:
        uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        break;
      default:
        goto LABEL_12;
    }
  }
  objc_storeStrong(v6, a2);
  id v4 = v13;
LABEL_12:
  return MEMORY[0x1F41817F8](v6, v4);
}

- (id)leftMostLeafAXElement
{
  return [(AXElementGroup *)self _leafAXElementWithPosition:2];
}

- (id)rightMostLeafAXElement
{
  return [(AXElementGroup *)self _leafAXElementWithPosition:3];
}

- (id)topMostLeafAXElement
{
  return [(AXElementGroup *)self _leafAXElementWithPosition:0];
}

- (id)bottomMostLeafAXElement
{
  return [(AXElementGroup *)self _leafAXElementWithPosition:1];
}

- (void)registerGroupObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AXElementGroup *)self groupObservers];
  [v5 addObject:v4];
}

- (void)unregisterGroupObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AXElementGroup *)self groupObservers];
  [v5 removeObject:v4];
}

- (void)unregisterAllGroupObservers
{
  id v2 = [(AXElementGroup *)self groupObservers];
  [v2 removeAllObjects];
}

- (void)_notifyGroupObserversWillTransferStateToGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(AXElementGroup *)self groupObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 group:self willTransferStateToGroup:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyGroupObserversDidTransferStateToGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(AXElementGroup *)self groupObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 group:self didTransferStateToGroup:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_debugDescriptionForScanningBehaviorTraits
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:@"ScanAttrs:["];
  if (([(AXElementGroup *)self userDefinedScanningBehaviorTraits] & 0x10) != 0) {
    [v3 appendString:@" (delegated)"];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  char v4 = [(AXElementGroup *)self scatScanningBehaviorTraits];
  char v5 = v4;
  if ((v4 & 2) == 0)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 appendString:@" include-h-scroll-group"];
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  [v3 appendString:@" include-v-scroll-group"];
  if (v5) {
    goto LABEL_13;
  }
LABEL_6:
  if ((v5 & 8) == 0) {
    goto LABEL_7;
  }
LABEL_14:
  [v3 appendString:@" include-v-scroll-top"];
  if ((v5 & 4) != 0) {
LABEL_8:
  }
    [v3 appendString:@" include-h-scroll-top"];
LABEL_9:
  [v3 appendString:@"]"];
  return v3;
}

- (id)_debugDescriptionForTraits
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  if ([(AXElementGroup *)self groupTraits]) {
    [v3 appendString:@" <Keyboard> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 2) != 0) {
    [v3 appendString:@" <Keyboard Row> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 0x20) != 0) {
    [v3 appendString:@" <Fixed Subgroups> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 0x40) != 0) {
    [v3 appendString:@" <Resists Being Grouped> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 0x10) != 0) {
    [v3 appendString:@" <Unsplittable> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 0x100) != 0) {
    [v3 appendString:@" <Grouped> "];
  }
  if (([(AXElementGroup *)self groupTraits] & 0x80) != 0) {
    [v3 appendString:@" <Ungrouped> "];
  }
  return v3;
}

- (id)_debugBriefDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  char v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXElementGroup count](self, "count"));
  char v5 = [(AXElementGroup *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"AXElementGroup<%p>. %@ items. Identifier: %@.", self, v4, v5];

  uint64_t v7 = [(AXElementGroup *)self _debugDescriptionForTraits];
  [v6 appendString:v7];

  uint64_t v8 = [(AXElementGroup *)self _debugDescriptionForScanningBehaviorTraits];
  [v6 appendString:v8];

  return v6;
}

- (id)debugFullDescription
{
  return [(AXElementGroup *)self _debugFullDescriptionWithIndent:&stru_1F141B5A8];
}

- (id)_debugFullDescriptionWithIndent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXElementGroup count](self, "count"));
  uint64_t v7 = [(AXElementGroup *)self label];
  uint64_t v8 = [(AXElementGroup *)self identifier];
  uint64_t v9 = [v5 stringWithFormat:@"AXElementGroup<%p>. %@ items. Label: %@. Identifier: %@.", self, v6, v7, v8];

  if ([(AXElementGroup *)self count])
  {
    long long v10 = [(AXElementGroup *)self _debugDescriptionForTraits];
    [v9 appendString:v10];

    long long v11 = [(AXElementGroup *)self _debugDescriptionForScanningBehaviorTraits];
    [v9 appendString:v11];

    [v9 appendFormat:@" Children:\n"];
    long long v12 = [v4 stringByAppendingString:@" "];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v13 = self;
    uint64_t v14 = [(AXElementGroup *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          CGRect v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CGRect v19 = [v18 _debugFullDescriptionWithIndent:v12];
            [v9 appendFormat:@"%@%@\n", v12, v19];
          }
          else
          {
            [v9 appendFormat:@"%@%@\n", v12, v18];
          }
        }
        uint64_t v15 = [(AXElementGroup *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
  else
  {
    long long v12 = v4;
  }

  return v9;
}

- (AXElementGroupGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  return (AXElementGroupGenerator *)WeakRetained;
}

- (void)setGenerator:(id)a3
{
}

- (unint64_t)groupTraits
{
  return self->_groupTraits;
}

- (void)setGroupTraits:(unint64_t)a3
{
  self->_groupTraits = a3;
}

- (unint64_t)userDefinedScanningBehaviorTraits
{
  return self->_userDefinedScanningBehaviorTraits;
}

- (void)setUserDefinedScanningBehaviorTraits:(unint64_t)a3
{
  self->_userDefinedScanningBehaviorTraits = a3;
}

- (BOOL)isRootGroup
{
  return self->_rootGroup;
}

- (void)setRootGroup:(BOOL)a3
{
  self->_rootGroup = a3;
}

- (NSHashTable)groupObservers
{
  return self->_groupObservers;
}

- (void)setGroupObservers:(id)a3
{
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

- (AXElement)elementCommunity
{
  return self->_elementCommunity;
}

- (void)setElementCommunity:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_elementCommunity, 0);
  objc_storeStrong((id *)&self->_groupObservers, 0);
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_elementStore, 0);
}

@end