@interface BSService
- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1;
- (id)_identifier;
- (id)debugDescription;
@end

@implementation BSService

- (id)_identifier
{
  if (a1)
  {
    a1 = [a1[1] identifier];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __43__BSService__registerListener_forInstance___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
    if (WeakRetained[56])
    {
LABEL_3:
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      goto LABEL_4;
    }
    if (v4)
    {
      v5 = (id *)(WeakRetained + 40);
      id v6 = [*((id *)WeakRetained + 5) objectForKey:v4];

      if (v6 != v3) {
        goto LABEL_3;
      }
      uint64_t v7 = [*v5 count];
      id v8 = *v5;
      if (v7 != 1)
      {
        [v8 removeObjectForKey:v4];
        goto LABEL_3;
      }
    }
    else
    {
      v5 = (id *)(WeakRetained + 32);
      if (*((id *)WeakRetained + 4) != v3) {
        goto LABEL_3;
      }
      id v8 = v3;
    }
    id *v5 = 0;

    goto LABEL_3;
  }
LABEL_4:
}

- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke;
    v16[3] = &unk_1E58FC4E0;
    id v5 = v4;
    id v17 = v5;
    uint64_t v18 = a1;
    id v6 = (id)[v5 modifyProem:v16];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_2;
    v13 = &unk_1E58FC4E0;
    uint64_t v14 = a1;
    id v7 = v5;
    id v15 = v7;
    [v7 appendBodySectionWithName:0 multilinePrefix:v3 block:&v10];
    id v8 = objc_msgSend(v7, "build", v10, v11, v12, v13, v14);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) identifier];
  id v4 = (id)[v2 appendObject:v3 withName:0];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 56)) {
    id v6 = @"invalid";
  }
  else {
    id v6 = @"active";
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
  return (id)[*(id *)(a1 + 32) appendObject:v6 withName:@"state"];
}

void __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = [v2 activeMultilinePrefix];
  -[BSServiceSpecification _appendManagerDumpBodyToBuilder:withMultilinePrefix:](v3, v2, v4);

  id v5 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 32) withName:@"listener" skipIfNil:1];
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) allKeys];
    id v7 = (void *)[v6 mutableCopy];

    [v7 sortUsingSelector:sel_compare_];
    id v8 = *(void **)(a1 + 40);
    v9 = [v8 activeMultilinePrefix];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_3;
    v16[3] = &unk_1E58FC508;
    id v10 = v7;
    id v17 = v10;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v18 = v11;
    uint64_t v19 = v12;
    [v8 appendBodySectionWithName:@"listeners" multilinePrefix:v9 block:v16];
  }
  v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 48);
  id v15 = [v13 activeMultilinePrefix];
  [v13 appendArraySection:v14 withName:@"pendedConnections" multilinePrefix:v15 skipIfEmpty:1];
}

void __50__BSService__debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 40), "objectForKey:", v6, (void)v10);
        id v9 = (id)[v7 appendObject:v8 withName:v6];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (id)debugDescription
{
  return -[BSService _debugDescriptionWithMultilinePrefix:]((uint64_t)self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_pendedConnections, 0);
  objc_storeStrong((id *)&self->_lock_instanceToListener, 0);
  objc_storeStrong((id *)&self->_lock_globalListener, 0);
  objc_storeStrong((id *)&self->_domainSpecification, 0);

  objc_storeStrong((id *)&self->_specification, 0);
}

@end