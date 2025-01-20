@interface BKEventDeferringGraph
- (BKEventDeferringGraph)init;
- (NSString)description;
- (id)_aggregateIdentitiesLabel:(uint64_t)a1;
- (id)_dictionaryWithGraphToIdentityMapping;
- (id)deferringPathForPID:(void *)a3 environment:(void *)a4 display:(void *)a5 dispatchTarget:;
- (void)_setRules:(int)a3 forPID:(void *)a4 toDisplay:;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)logGraphToTarget:(uint64_t)a1;
- (void)setActiveUIResponderPredicates:(int)a3 forPID:;
@end

@implementation BKEventDeferringGraph

- (id)deferringPathForPID:(void *)a3 environment:(void *)a4 display:(void *)a5 dispatchTarget:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v9 = (objc_class *)MEMORY[0x1E4F4F268];
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    v13 = (void *)[[v9 alloc] initWithDisplay:v11 environment:v12];

    v14 = [*(id *)(a1 + 8) objectForKey:v13];
    id v15 = v10;
    v16 = v15;
    if (v14)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18 = (void *)v14[2];
      v19 = [NSNumber numberWithInt:a2];
      v42 = [v18 objectForKey:v19];

      v20 = v16;
      if (v16)
      {
        uint64_t v21 = [v16 deferringToken];
        if (v21)
        {
          v22 = (void *)v21;
          v40 = v16;
          v41 = v13;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v23 = v42;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v44;
            id v38 = v17;
            v39 = v14;
            while (2)
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v44 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v43 + 1) + 8 * v27);
                if (v28) {
                  v29 = (void *)v28[2];
                }
                else {
                  v29 = 0;
                }
                id v30 = v29;
                v31 = [v30 predicate];
                v32 = [v31 token];
                char v33 = [v32 isEqual:v22];

                if (v33)
                {
                  v35 = v28;

                  v20 = v40;
                  v13 = v41;
                  id v17 = v38;
                  v14 = v39;
                  if (!v28) {
                    goto LABEL_20;
                  }
                  v36 = v42;
                  goto LABEL_21;
                }
                ++v27;
              }
              while (v25 != v27);
              uint64_t v34 = [v23 countByEnumeratingWithState:&v43 objects:v47 count:16];
              uint64_t v25 = v34;
              id v17 = v38;
              v14 = v39;
              if (v34) {
                continue;
              }
              break;
            }
          }

          v20 = v40;
          v13 = v41;
        }
      }
LABEL_20:
      v36 = v42;
      v35 = -[BKEventDeferringEnvironmentGraph _policyNodeFromCollection:]((uint64_t)v14, v42);
      if (v35)
      {
LABEL_21:
        -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:]((uint64_t)v14, v35, v17);
      }
    }
    else
    {
      id v17 = 0;
      v20 = v15;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

id __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 predicate];
  v5 = [v4 display];
  int v6 = _BKHIDEventDeferringDisplayMatch(v5, *(void **)(a1 + 32));

  if (v6)
  {
    v7 = [v3 predicate];
    v8 = [v7 environment];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F268]) initWithDisplay:*(void *)(a1 + 32) environment:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  v5 = a3;
  int v6 = [v9 display];
  v7 = v6;
  if (v6 == *(void **)(a1 + 32))
  {
    v8 = [*(id *)(a1 + 40) objectForKey:v9];

    if (!v8) {
      -[BKEventDeferringEnvironmentGraph setRules:forPID:]((uint64_t)v5, MEMORY[0x1E4F1CBF0], *(unsigned int *)(a1 + 56));
    }
  }
  else
  {
  }
  if (v5 && ![v5[6] count]) {
    [*(id *)(*(void *)(a1 + 48) + 8) removeObjectForKey:v9];
  }
}

void __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  int v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v24];
  if (!v6)
  {
    int v6 = [BKEventDeferringEnvironmentGraph alloc];
    v7 = [v24 environment];
    id v8 = v7;
    if (v6)
    {
      v25.receiver = v6;
      v25.super_class = (Class)BKEventDeferringEnvironmentGraph;
      id v9 = (BKEventDeferringEnvironmentGraph *)objc_msgSendSuper2(&v25, sel_init);
      int v6 = v9;
      if (v9)
      {
        objc_storeStrong((id *)&v9->_environment, v7);
        id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        selectedNodeIdentities = v6->_selectedNodeIdentities;
        v6->_selectedNodeIdentities = v10;

        id v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
        allNodes = v6->_allNodes;
        v6->_allNodes = v12;

        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        tokenToNode = v6->_tokenToNode;
        v6->_tokenToNode = v14;

        v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        topLevelInEachProcess = v6->_topLevelInEachProcess;
        v6->_topLevelInEachProcess = v16;

        v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        nodeByIdentity = v6->_nodeByIdentity;
        v6->_nodeByIdentity = v18;

        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        pidToActiveUIResponderNodes = v6->_pidToActiveUIResponderNodes;
        v6->_pidToActiveUIResponderNodes = v20;

        v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        pidToActiveUIResponderTokens = v6->_pidToActiveUIResponderTokens;
        v6->_pidToActiveUIResponderTokens = v22;
      }
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKey:v24];
  }
  -[BKEventDeferringEnvironmentGraph setRules:forPID:]((uint64_t)v6, v5, *(unsigned int *)(a1 + 40));
}

- (void)_setRules:(int)a3 forPID:(void *)a4 toDisplay:
{
  id v7 = a4;
  id v8 = v7;
  if (a1)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke;
    v20[3] = &unk_1E6871618;
    id v9 = v7;
    id v21 = v9;
    id v10 = objc_msgSend(a2, "bs_dictionaryByPartitioning:", v20);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_2;
    v18[3] = &unk_1E68715C8;
    v18[4] = a1;
    int v19 = a3;
    [v10 enumerateKeysAndObjectsUsingBlock:v18];
    id v11 = (void *)[*(id *)(a1 + 8) copy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_3;
    v13[3] = &unk_1E6871640;
    id v14 = v9;
    id v15 = v10;
    int v17 = a3;
    uint64_t v16 = a1;
    id v12 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v13];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDisplays, 0);
  objc_storeStrong((id *)&self->_pidToRules, 0);

  objc_storeStrong((id *)&self->_identityToGraph, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = (id)[a3 appendObject:self->_identityToGraph withName:0];
}

- (NSString)description
{
  id v3 = objc_alloc_init(BKStringTranscriptTarget);
  -[BKEventDeferringGraph logGraphToTarget:]((uint64_t)self, v3);
  v4 = [(BKStringTranscriptTarget *)v3 build];

  return (NSString *)v4;
}

- (void)logGraphToTarget:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = -[BKEventDeferringGraph _dictionaryWithGraphToIdentityMapping](a1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__BKEventDeferringGraph_logGraphToTarget___block_invoke;
    v5[3] = &unk_1E6871518;
    id v6 = v3;
    uint64_t v7 = a1;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

- (id)_dictionaryWithGraphToIdentityMapping
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = *(void **)(a1 + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__BKEventDeferringGraph__dictionaryWithGraphToIdentityMapping__block_invoke;
  v6[3] = &unk_1E68714C8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

void __42__BKEventDeferringGraph_logGraphToTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = (id *)-[BKGraphDescription initWithTopLevelCount:target:]([BKGraphDescription alloc], 1, *(void **)(a1 + 32));
  id v8 = -[BKEventDeferringGraph _aggregateIdentitiesLabel:](*(void *)(a1 + 40), v5);

  -[BKGraphDescription appendNode:](v7, @"(%@)", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  uint64_t v16 = v7;
  if (v6)
  {
    uint64_t v15 = [v6[2] count];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke;
    v17[3] = &unk_1E68718D8;
    v17[4] = v6;
    v18 = v16;
    -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v18, v15, v17);
  }
  [*(id *)(a1 + 32) writeString:@"\n"];
}

- (id)_aggregateIdentitiesLabel:(uint64_t)a1
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__BKEventDeferringGraph__aggregateIdentitiesLabel___block_invoke;
    v5[3] = &unk_1E68714F0;
    void v5[4] = a1;
    id v2 = objc_msgSend(a2, "bs_map:", v5);
    id v3 = [v2 componentsJoinedByString:@"|"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __51__BKEventDeferringGraph__aggregateIdentitiesLabel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = v3;
  if (v2)
  {
    id v5 = [v3 display];
    char v6 = [v5 _isNullDisplay];

    if (v6)
    {
      id v7 = [v4 environment];
      id v8 = [v7 description];
    }
    else
    {
      uint64_t v9 = NSString;
      id v7 = [v4 environment];
      uint64_t v10 = [v4 display];
      id v8 = [v9 stringWithFormat:@"%@-%@", v7, v10];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __62__BKEventDeferringGraph__dictionaryWithGraphToIdentityMapping__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v4, "bs_addObject:toCollectionClass:forKey:", v6, objc_opt_class(), v5);
}

- (BKEventDeferringGraph)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKEventDeferringGraph;
  uint64_t v2 = [(BKEventDeferringGraph *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identityToGraph = v2->_identityToGraph;
    v2->_identityToGraph = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pidToRules = v2->_pidToRules;
    v2->_pidToRules = v5;
  }
  return v2;
}

void __83__BKEventDeferringGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v74 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  if (v74)
  {
    id v7 = [v74[7] objectForKey:v5];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v9 = NSString;
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = -[BKEventDeferringGraph _aggregateIdentitiesLabel:](*(void *)(a1 + 48), v6);

  if (!v8)
  {
    v66 = [v9 stringWithFormat:@"not in %@\n", v11];
    [v10 writeString:v66];

    goto LABEL_62;
  }
  uint64_t v12 = [v9 stringWithFormat:@"%@\n", v11];
  [v10 writeString:v12];

  uint64_t v13 = *(void **)(a1 + 40);
  id v14 = *(id *)(a1 + 32);
  id v15 = v13;
  if (v74)
  {
    uint64_t v16 = [v74[7] objectForKey:v14];
    int v17 = (void *)v16;
    v18 = (void *)MEMORY[0x1E4F4F720];
    if (v16)
    {
      id v19 = *(id *)(v16 + 16);
      v20 = [v18 descriptionForRootObject:v19];
      [v15 writeString:v20];

      [v15 writeString:@"\n"];
      id v21 = (void *)v17[3];
    }
    else
    {
      v67 = [MEMORY[0x1E4F4F720] descriptionForRootObject:0];
      [v15 writeString:v67];

      [v15 writeString:@"\n"];
      id v21 = 0;
    }
    id v22 = v21;
    uint64_t v23 = objc_msgSend(v22, "bs_map:", &__block_literal_global_38);

    id v24 = NSString;
    v69 = (void *)v23;
    objc_super v25 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v23];
    uint64_t v26 = [v24 stringWithFormat:@"has supernodes %@\n", v25];
    [v15 writeString:v26];

    v70 = v14;
    uint64_t v71 = a1;
    if (v17) {
      uint64_t v27 = (void *)v17[4];
    }
    else {
      uint64_t v27 = 0;
    }
    id v28 = v27;
    uint64_t v29 = objc_msgSend(v28, "bs_map:", &__block_literal_global_44);

    id v30 = NSString;
    v68 = (void *)v29;
    v31 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v29];
    v32 = [v30 stringWithFormat:@"has subnodes %@\n", v31];
    v78 = v15;
    [v15 writeString:v32];

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v74[6];
    v77 = v17;
    uint64_t v75 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
    if (v75)
    {
      uint64_t v73 = *(void *)v85;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v85 != v73) {
            objc_enumerationMutation(obj);
          }
          uint64_t v76 = v33;
          uint64_t v34 = *(void **)(*((void *)&v84 + 1) + 8 * v33);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id v79 = v74[6];
          uint64_t v35 = [v79 countByEnumeratingWithState:&v80 objects:v88 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v81;
            do
            {
              uint64_t v38 = 0;
              do
              {
                if (*(void *)v81 != v37) {
                  objc_enumerationMutation(v79);
                }
                v39 = *(void **)(*((void *)&v80 + 1) + 8 * v38);
                BOOL v41 = v34 == v17 || v39 == v17;
                if (v34 != v39 && v41)
                {
                  long long v43 = -[BKEventDeferringEnvironmentGraph _matchSubnode:toSupernode:](*(void **)(*((void *)&v80 + 1) + 8 * v38), v34);
                  if (v43)
                  {
                    if (v34) {
                      long long v44 = (void *)v34[2];
                    }
                    else {
                      long long v44 = 0;
                    }
                    long long v45 = NSString;
                    id v46 = v44;
                    v47 = [v46 identity];
                    if (v39) {
                      uint64_t v48 = (void *)v39[2];
                    }
                    else {
                      uint64_t v48 = 0;
                    }
                    id v49 = v48;
                    v50 = [v49 identity];
                    v51 = [v45 stringWithFormat:@" %@  -> %@: %@\n", v47, v50, v43];
                    [v78 writeString:v51];

                    int v17 = v77;
                  }
                }
                ++v38;
              }
              while (v36 != v38);
              uint64_t v52 = [v79 countByEnumeratingWithState:&v80 objects:v88 count:16];
              uint64_t v36 = v52;
            }
            while (v52);
          }

          uint64_t v33 = v76 + 1;
        }
        while (v76 + 1 != v75);
        uint64_t v75 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
      }
      while (v75);
    }

    id v53 = v74[2];
    id v14 = v70;
    v54 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v70, "pid"));
    v55 = [v53 objectForKey:v54];
    int v56 = [v55 containsObject:v17];

    a1 = v71;
    id v15 = v78;
    if (!v56) {
      goto LABEL_60;
    }
    if (v17) {
      v57 = (void *)v17[3];
    }
    else {
      v57 = 0;
    }
    id v58 = v57;
    uint64_t v59 = [v58 count];

    v60 = NSString;
    if (v17)
    {
      v61 = BSProcessDescriptionForPID();
      if (v59)
      {
        v62 = (void *)v17[3];
LABEL_49:
        id v63 = v62;
        v64 = objc_msgSend(v63, "bs_map:", &__block_literal_global_55);
        v65 = [v60 stringWithFormat:@"entrypoint into %@ from %@\n", v61, v64];
        [v15 writeString:v65];

LABEL_59:
LABEL_60:

        goto LABEL_61;
      }
    }
    else
    {
      v61 = BSProcessDescriptionForPID();
      if (v59)
      {
        v62 = 0;
        int v17 = v77;
        id v15 = v78;
        goto LABEL_49;
      }
      int v17 = v77;
      id v15 = v78;
    }
    id v63 = [v60 stringWithFormat:@"root node in %@\n", v61];
    [v15 writeString:v63];
    goto LABEL_59;
  }
LABEL_61:

  [*(id *)(a1 + 40) writeString:@"\n"];
LABEL_62:
}

void __45__BKEventDeferringGraph_processDidTerminate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (void)setActiveUIResponderPredicates:(int)a3 forPID:
{
  if (a1)
  {
    uint64_t v5 = objc_msgSend(a2, "bs_dictionaryByPartitioning:", &__block_literal_global_2158);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_2;
    v6[3] = &unk_1E68715C8;
    void v6[4] = a1;
    int v7 = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_29);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v5];

  -[BKEventDeferringEnvironmentGraph setActiveUIResponderTokens:forPID:]((uint64_t)v6, v7, *(unsigned int *)(a1 + 40));
}

uint64_t __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 token];
}

id __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F4F268];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 display];
  id v6 = [v3 environment];

  id v7 = (void *)[v4 initWithDisplay:v5 environment:v6];

  return v7;
}

void __43__BKEventDeferringGraph_setSenderDisplays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  -[BKEventDeferringGraph _setRules:forPID:toDisplay:](*(void *)(a1 + 32), v5, [a2 intValue], *(void **)(a1 + 40));
}

@end