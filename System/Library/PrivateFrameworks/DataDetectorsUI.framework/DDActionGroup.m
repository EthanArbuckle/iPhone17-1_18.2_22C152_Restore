@interface DDActionGroup
+ (DDActionGroup)emptyGroup;
+ (DDActionGroup)groupWithAction:(uint64_t)a1;
+ (DDActionGroup)groupWithActions:(uint64_t)a1;
- (BOOL)extractedActions;
- (BOOL)inlinedGroup;
- (BOOL)isEmpty;
- (BOOL)isLeaf;
- (DDActionGroup)initWithActions:(id)a3;
- (DDActionGroup)initWithSingleAction:(id)a3;
- (id)_extractFirstAction;
- (id)children;
- (id)ddAction;
- (id)extractDefaultActions;
- (id)flattenedActions;
- (id)mainAction;
- (id)nonnullChildren;
- (uint64_t)count;
- (uint64_t)setInlinedGroup:(uint64_t)result;
- (void)_fillFlattenedActions:(id)a3;
- (void)_regroupByService;
- (void)appendAction:(uint64_t)a1;
- (void)appendActions:(unsigned char *)a1;
- (void)appendGroup:(unsigned char *)a1;
- (void)cleanup;
- (void)finalizeWithFilter:(uint64_t)a1;
- (void)insertAction:(uint64_t)a3 atIndex:;
- (void)insertActions:(uint64_t)a3 atIndex:;
- (void)insertGroup:(uint64_t)a3 atIndex:;
- (void)regroupByService;
- (void)removeChild:(id)a3;
- (void)simplify;
@end

@implementation DDActionGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

- (uint64_t)count
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 24)) {
    return 1;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v1 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v1 += -[DDActionGroup count](*(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

+ (DDActionGroup)emptyGroup
{
  self;
  v0 = [DDActionGroup alloc];
  uint64_t v1 = [(DDActionGroup *)v0 initWithActions:MEMORY[0x1E4F1CBF0]];
  return v1;
}

- (DDActionGroup)initWithActions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DDActionGroup;
  uint64_t v5 = [(DDActionGroup *)&v21 init];
  if (v5 && [v4 count])
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          uint64_t v13 = [DDActionGroup alloc];
          v14 = -[DDActionGroup initWithSingleAction:](v13, "initWithSingleAction:", v12, (void)v17);
          [(NSMutableArray *)v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    children = v5->_children;
    v5->_children = v6;
  }
  return v5;
}

- (void)appendGroup:(unsigned char *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!a1[16])
    {
      if (!v3) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    id v7 = v3;
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:sel_appendGroup_, a1, @"DDActionGroup.m", 201, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];

    id v3 = v7;
    if (v7)
    {
LABEL_4:
      id v6 = v3;
      id v4 = [a1 nonnullChildren];
      [v4 addObject:v6];

      id v3 = v6;
    }
  }
LABEL_5:
}

- (uint64_t)setInlinedGroup:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 32) = a2;
  }
  return result;
}

- (id)nonnullChildren
{
  if (!self->_children)
  {
    if (self->_action)
    {
      id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v4 = [[DDActionGroup alloc] initWithSingleAction:self->_action];
      uint64_t v5 = (NSMutableArray *)objc_msgSend(v3, "initWithObjects:", v4, 0);
      children = self->_children;
      self->_children = v5;

      action = self->_action;
      self->_action = 0;
    }
    else
    {
      uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      action = self->_children;
      self->_children = v8;
    }
  }
  uint64_t v9 = self->_children;
  return v9;
}

- (void)appendAction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      id v9 = v3;
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_appendAction_, a1, @"DDActionGroup.m", 147, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];

      id v3 = v9;
      if (!v9) {
        goto LABEL_8;
      }
    }
    else if (!v3)
    {
      goto LABEL_8;
    }
    id v8 = v3;
    if (*(void *)(a1 + 24) || *(void *)(a1 + 8))
    {
      id v4 = [(id)a1 nonnullChildren];
      uint64_t v5 = [[DDActionGroup alloc] initWithSingleAction:v8];
      [v4 addObject:v5];
    }
    else
    {
      id v6 = v3;
      id v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;
    }

    id v3 = v8;
  }
LABEL_8:
}

- (BOOL)extractedActions
{
  if (result) {
    return *(unsigned char *)(result + 17) != 0;
  }
  return result;
}

- (BOOL)isLeaf
{
  return self->_action != 0;
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_action) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_children;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEmpty", (void)v9))
        {
          BOOL v2 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v2 = 1;
LABEL_13:

  return v2;
}

- (id)mainAction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 24);
    if (v1)
    {
      id v2 = v1;
      goto LABEL_15;
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = -[DDActionGroup mainAction](*(void *)(*((void *)&v10 + 1) + 8 * i));
          if (v8)
          {
            id v2 = (id)v8;

            goto LABEL_15;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  id v2 = 0;
LABEL_15:
  return v2;
}

- (id)children
{
  if (a1)
  {
    id v2 = a1;
    if (a1[3] || ![a1[1] count]) {
      id v3 = 0;
    }
    else {
      id v3 = v2[1];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)ddAction
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (DDActionGroup)groupWithActions:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 count];
  if (v3 == 1)
  {
    uint64_t v4 = [v2 firstObject];
    +[DDActionGroup groupWithAction:]((uint64_t)DDActionGroup, v4);
    uint64_t v5 = (DDActionGroup *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 < 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [[DDActionGroup alloc] initWithActions:v2];
  }

  return v5;
}

+ (DDActionGroup)groupWithAction:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [[DDActionGroup alloc] initWithSingleAction:v2];

  return v3;
}

- (DDActionGroup)initWithSingleAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDActionGroup;
  uint64_t v6 = [(DDActionGroup *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_action, a3);
  }

  return v7;
}

- (void)insertAction:(uint64_t)a3 atIndex:
{
  id v5 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      id v12 = v5;
      objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel_insertAction_atIndex_, a1, @"DDActionGroup.m", 159, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];

      id v5 = v12;
      if (!v12) {
        goto LABEL_8;
      }
    }
    else if (!v5)
    {
      goto LABEL_8;
    }
    id v11 = v5;
    if (*(void *)(a1 + 24) || *(void *)(a1 + 8))
    {
      uint64_t v6 = [(id)a1 nonnullChildren];
      id v7 = [[DDActionGroup alloc] initWithSingleAction:v11];
      [v6 insertObject:v7 atIndex:a3];
    }
    else
    {
      if (a3)
      {
        long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertAction_atIndex_, a1, @"DDActionGroup.m", 162, @"Attempted to insert a DDAction in empty group at index %ld", a3);

        id v5 = v11;
      }
      id v8 = v5;
      uint64_t v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v8;
    }

    id v5 = v11;
  }
LABEL_8:
}

- (void)appendActions:(unsigned char *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (a1[16])
    {
      long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel_appendActions_, a1, @"DDActionGroup.m", 172, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];
    }
    uint64_t v4 = [v3 count];
    if (v4 >= 2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v3;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            id v11 = [a1 nonnullChildren];
            id v12 = [[DDActionGroup alloc] initWithSingleAction:v10];
            [v11 addObject:v12];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
      goto LABEL_15;
    }
    if (v4 == 1)
    {
      id v5 = [v3 firstObject];
      -[DDActionGroup appendAction:]((uint64_t)a1, v5);
LABEL_15:
    }
  }
}

- (void)insertActions:(uint64_t)a3 atIndex:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    if (a1[16])
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_insertActions_atIndex_, a1, @"DDActionGroup.m", 185, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];
    }
    uint64_t v6 = [v5 count];
    if (v6 < 2)
    {
      if (v6 == 1)
      {
        long long v15 = [v5 firstObject];
        -[DDActionGroup insertAction:atIndex:]((uint64_t)a1, v15, a3);
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v17 = v5;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            long long v13 = [a1 nonnullChildren];
            long long v14 = [[DDActionGroup alloc] initWithSingleAction:v12];
            [v13 insertObject:v14 atIndex:a3 + i];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          a3 += i;
        }
        while (v9);
      }

      id v5 = v17;
    }
  }
}

- (void)insertGroup:(uint64_t)a3 atIndex:
{
  id v5 = a2;
  if (a1)
  {
    if (!a1[16])
    {
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    id v9 = v5;
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:sel_insertGroup_atIndex_, a1, @"DDActionGroup.m", 211, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];

    id v5 = v9;
    if (v9)
    {
LABEL_4:
      id v8 = v5;
      uint64_t v6 = [a1 nonnullChildren];
      [v6 insertObject:v8 atIndex:a3];

      id v5 = v8;
    }
  }
LABEL_5:
}

- (id)flattenedActions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      v4[0] = *(void *)(a1 + 24);
      id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    }
    else if ([*(id *)(a1 + 8) count])
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(id)a1 _fillFlattenedActions:v2];
    }
    else
    {
      id v2 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_fillFlattenedActions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_action)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_children;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_fillFlattenedActions:", v5, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)cleanup
{
  if (self->_final)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DDActionGroup.m", 251, @"Attempted to mutate immutable %@", objc_opt_class() object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_children count] == 1 && !self->_inlinedGroup)
  {
    uint64_t v3 = [(NSMutableArray *)self->_children firstObject];
    if ([(id)v3 isLeaf])
    {
      objc_storeStrong((id *)&self->_action, *(id *)(v3 + 24));
      id v4 = 0;
    }
    else
    {
      if (v3 && *(unsigned char *)(v3 + 32)) {
        goto LABEL_11;
      }
      id v4 = (NSMutableArray *)*(id *)(v3 + 8);
    }
    children = self->_children;
    self->_children = v4;

LABEL_11:
  }
  if (![(NSMutableArray *)self->_children count])
  {
    uint64_t v6 = self->_children;
    self->_children = 0;
  }
}

- (BOOL)inlinedGroup
{
  if (result) {
    return *(unsigned char *)(result + 32) != 0;
  }
  return result;
}

- (void)removeChild:(id)a3
{
  [(NSMutableArray *)self->_children removeObject:a3];
  [(DDActionGroup *)self cleanup];
}

- (void)simplify
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(NSMutableArray *)self->_children copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 simplify];
        if ([v8 isEmpty]) {
          [(DDActionGroup *)self removeChild:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(DDActionGroup *)self cleanup];
}

- (void)finalizeWithFilter:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && !*(unsigned char *)(a1 + 16))
  {
    if (*(void *)(a1 + 24))
    {
      if (((*((uint64_t (**)(id))v3 + 2))(v3) & 1) == 0)
      {
        uint64_t v5 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = 0;
      }
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 8), "copy", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            -[DDActionGroup finalizeWithFilter:](v11, v4);
            if ([v11 isEmpty]) {
              [(id)a1 removeChild:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    [(id)a1 cleanup];
    *(unsigned char *)(a1 + 16) = 1;
  }
}

- (void)regroupByService
{
  if (result)
  {
    uint64_t v1 = result;
    [result simplify];
    return (void *)[v1 _regroupByService];
  }
  return result;
}

- (void)_regroupByService
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (void *)[(NSMutableArray *)self->_children copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4)
  {
    uint64_t v6 = v3;
    goto LABEL_18;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(id **)(*((void *)&v14 + 1) + 8 * i);
      [v9 _regroupByService];
      id v10 = v9[3];
      long long v11 = [v10 _serviceIdentifier];
      if (v11)
      {
        if (!v6) {
          uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_children, "count"));
        }
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        long long v13 = (void *)v12;
        if (v12)
        {
          -[DDActionGroup appendAction:](v12, v10);
          [(NSMutableArray *)self->_children removeObject:v9];
        }
        else
        {
          [v6 setObject:v9 forKeyedSubscript:v11];
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v5);

  if (v6)
  {
    [(DDActionGroup *)self cleanup];
LABEL_18:
  }
}

- (id)_extractFirstAction
{
  id v2 = -[DDActionGroup children]((id *)&self->super.isa);
  id v3 = [v2 firstObject];

  if ([v3 isLeaf])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 _extractFirstAction];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)extractDefaultActions
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    +[DDActionGroup emptyGroup]();
    id v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    v2[17] = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = -[DDActionGroup children](v1);
    id v4 = objc_msgSend(v3, "copy", 0);

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
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v9 isLeaf])
          {
            [v1 removeChild:v9];
            -[DDActionGroup appendGroup:](v2, v9);
          }
          else
          {
            id v10 = [v9 _extractFirstAction];
            -[DDActionGroup appendGroup:](v2, v10);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if (-[DDActionGroup count]((uint64_t)v2) < 1)
    {
      uint64_t v1 = 0;
    }
    else
    {
      [v1 simplify];
      if (v2) {
        v2[32] = 1;
      }
      *((unsigned char *)v1 + 17) = 1;
      uint64_t v1 = v2;
    }
  }
  return v1;
}

@end