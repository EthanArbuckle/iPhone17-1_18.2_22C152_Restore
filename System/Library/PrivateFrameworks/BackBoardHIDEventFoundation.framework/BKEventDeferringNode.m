@interface BKEventDeferringNode
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (uint64_t)_disconnectSubnode:(uint64_t)result;
- (uint64_t)hasAncestorNode:(uint64_t)a1;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendGraphDescription:(uint64_t)a1;
- (void)disconnectFromGraph;
@end

@implementation BKEventDeferringNode

- (unint64_t)hash
{
  uint64_t v3 = [(BKSHIDEventDeferringRule *)self->_rule hash];
  v4 = [NSNumber numberWithInt:self->_pid];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (uint64_t)hasAncestorNode:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 24) containsObject:v3])
    {
      uint64_t v4 = 1;
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v5 = *(id *)(a1 + 24);
      uint64_t v4 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4)
      {
        uint64_t v6 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v5);
            }
            if (-[BKEventDeferringNode hasAncestorNode:](*(void *)(*((void *)&v9 + 1) + 8 * i), v3))
            {
              uint64_t v4 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v4 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)disconnectFromGraph
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v2 = (void *)[a1[3] copy];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          -[BKEventDeferringNode _disconnectSubnode:](*(void *)(*((void *)&v16 + 1) + 8 * v6++), a1);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v4);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(a1[4], "copy", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[BKEventDeferringNode _disconnectSubnode:]((uint64_t)a1, *(void **)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (uint64_t)_disconnectSubnode:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(result + 32);
    uint64_t v4 = a2;
    [v3 removeObject:v4];
    uint64_t v5 = (void *)v4[3];

    return [v5 removeObject:v2];
  }
  return result;
}

uint64_t __39__BKEventDeferringNode_connectSubnode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (!a2)
  {
    uint64_t v6 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  uint64_t v6 = *(void **)(a2 + 16);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = v4[2];
LABEL_4:
  id v8 = v6;
  uint64_t v9 = [v8 weightedDeferringRuleCompare:v7];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BKEventDeferringNode *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v9 = v7;

    if (v9 && *((_DWORD *)v9 + 3) == self->_pid) {
      char v8 = [v9[2] isEqual:self->_rule];
    }
    else {
      char v8 = 0;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_supernodes, 0);

  objc_storeStrong((id *)&self->_rule, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(BKSHIDEventDeferringRule *)self->_rule identity];
  id v5 = (id)[v12 appendObject:v4 withName:0];

  uint64_t v6 = [(BKSHIDEventDeferringRule *)self->_rule predicate];
  id v7 = (id)[v12 appendObject:v6 withName:0];

  [v12 appendRightArrow];
  char v8 = [(BKSHIDEventDeferringRule *)self->_rule target];
  id v9 = (id)[v12 appendObject:v8 withName:0];

  uint64_t v10 = [(BKSHIDEventDeferringRule *)self->_rule reason];
  id v11 = (id)[v12 appendObject:v10 withName:0];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendGraphDescription:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 16) predicate];
    id v5 = [v4 token];

    if (v5)
    {
      uint64_t v6 = [v5 description];
    }
    else
    {
      uint64_t v6 = &stru_1F267F920;
    }
    id v7 = [*(id *)(a1 + 16) identity];
    -[BKGraphDescription appendNode:](v3, @"%@ <%@>", v8, v9, v10, v11, v12, v13, (uint64_t)v7);

    if (![*(id *)(a1 + 32) count])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__BKEventDeferringNode_appendGraphDescription___block_invoke;
      v14[3] = &unk_1E68718D8;
      v14[4] = a1;
      long long v15 = v3;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v15, 1, v14);
    }
  }
}

void __47__BKEventDeferringNode_appendGraphDescription___block_invoke(uint64_t a1)
{
  id v19 = [*(id *)(*(void *)(a1 + 32) + 16) target];
  int v2 = [v19 pid];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(id **)(a1 + 40);
  if (v2 == *(_DWORD *)(v3 + 12))
  {
    id v5 = [v19 token];
    -[BKGraphDescription appendNode:](v4, @"<token: %@>", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    uint64_t v12 = [v19 pid];
    id v5 = [v19 token];
    -[BKGraphDescription appendNode:](v4, @"<pid: %d; token: %@>", v13, v14, v15, v16, v17, v18, v12);
  }
}

@end