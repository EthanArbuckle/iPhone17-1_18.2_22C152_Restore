@interface BKEventDeferringEnvironmentGraph
- (BOOL)isEqual:(id)a3;
- (__CFString)_matchSubnode:(void *)a1 toSupernode:(void *)a2;
- (unint64_t)hash;
- (void)_chooseSubnodeOfNode:(void *)a3 appendToPath:;
- (void)_logNodes:(void *)a3 toGraphDescription:;
- (void)_policyNodeFromCollection:(uint64_t)a1;
- (void)_reevaluateActiveUIResponderNodesForPID:(uint64_t)a1;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)setActiveUIResponderTokens:(uint64_t)a3 forPID:;
- (void)setRules:(uint64_t)a3 forPID:;
@end

@implementation BKEventDeferringEnvironmentGraph

- (void)_chooseSubnodeOfNode:(void *)a3 appendToPath:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16 = a2;
  id v5 = a3;
  [v5 addObject:v16];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v16[4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(unsigned char **)(*((void *)&v17 + 1) + 8 * i);
        if (v11 && v11[8])
        {
          v13 = v11;

          [v5 addObject:v13];
          goto LABEL_18;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    if (!v16)
    {
      id v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v12 = v16[4];
LABEL_15:
  id v14 = v12;
  v15 = -[BKEventDeferringEnvironmentGraph _policyNodeFromCollection:](a1, v14);

  if (v15) {
    -[BKEventDeferringEnvironmentGraph _chooseSubnodeOfNode:appendToPath:](a1, v15, v5);
  }

  v13 = 0;
LABEL_18:
}

- (void)_policyNodeFromCollection:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 firstObject];
  if ([*(id *)(a1 + 24) count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      long long v18 = v4;
      uint64_t v8 = *(void *)v20;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        v11 = *(void **)(a1 + 24);
        id v12 = v10 ? (void *)v10[2] : 0;
        id v13 = v12;
        id v14 = [v13 identity];
        int v15 = [v11 containsObject:v14];

        if (v15) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v16 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
          uint64_t v7 = v16;
          if (!v16)
          {
            v4 = v18;
            goto LABEL_16;
          }
          goto LABEL_4;
        }
      }
      v4 = v10;
    }
LABEL_16:
  }

  return v4;
}

- (void)setRules:(uint64_t)a3 forPID:
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 48);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke;
    v117[3] = &__block_descriptor_36_e30__16__0__BKEventDeferringNode_8l;
    int v118 = a3;
    v101 = objc_msgSend(v6, "bs_compactMap:", v117);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v98 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v113 objects:v135 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v114;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v114 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v113 + 1) + 8 * i) identity];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v113 objects:v135 count:16];
      }
      while (v10);
    }

    id v14 = (void *)[v7 mutableCopy];
    [v14 minusOrderedSet:v101];
    int v15 = (void *)[v101 mutableCopy];
    [v15 minusOrderedSet:v7];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke_2;
    v110[3] = &unk_1E68717C0;
    id v102 = v14;
    id v111 = v102;
    int v112 = a3;
    v99 = objc_msgSend(v8, "bs_compactMap:", v110);
    v100 = v15;
    unsigned int v97 = a3;
    uint64_t v108 = a1;
    v96 = v7;
    if ([v15 count])
    {
      uint64_t v16 = BKLogEventDelivery();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v94 = *(void *)(a1 + 8);
        *(_DWORD *)v152 = 138543618;
        uint64_t v153 = v94;
        __int16 v154 = 2114;
        id v155 = v15;
        _os_log_debug_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEBUG, "removing rules from %{public}@: %{public}@", v152, 0x16u);
      }

      id v17 = v15;
      long long v18 = [NSNumber numberWithInt:a3];
      long long v148 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v148 objects:v152 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v149;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v149 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = [*(id *)(a1 + 56) objectForKey:*(void *)(*((void *)&v148 + 1) + 8 * j)];
            v25 = v24;
            if (v24)
            {
              -[BKEventDeferringNode disconnectFromGraph](v24);
              id v26 = v25[2];
              v27 = [v26 target];
              v28 = [v27 token];

              if (v28) {
                [*(id *)(a1 + 64) removeObjectForKey:v28];
              }
              objc_msgSend(*(id *)(a1 + 16), "bs_removeObject:fromCollectionForKey:", v25, v18);
              v29 = *(void **)(a1 + 56);
              v30 = [v26 identity];
              [v29 removeObjectForKey:v30];

              [*(id *)(v108 + 48) removeObject:v25];
              v31 = *(void **)(v108 + 24);
              v32 = [v19 set];
              [v31 minusSet:v32];

              a1 = v108;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v148 objects:v152 count:16];
        }
        while (v21);
      }
    }
    if ([v102 count])
    {
      v33 = BKLogEventDelivery();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v95 = *(void *)(a1 + 8);
        *(_DWORD *)v152 = 138543618;
        uint64_t v153 = v95;
        __int16 v154 = 2114;
        id v155 = v102;
        _os_log_debug_impl(&dword_1CFDE2000, v33, OS_LOG_TYPE_DEBUG, "adding rules to %{public}@: %{public}@", v152, 0x16u);
      }

      id v34 = v99;
      [*(id *)(a1 + 48) addObjectsFromArray:v34];
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      obuint64_t j = v34;
      uint64_t v35 = [obj countByEnumeratingWithState:&v131 objects:v152 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v132;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v132 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void *)(*((void *)&v131 + 1) + 8 * v38);
            if (v39) {
              v40 = *(void **)(v39 + 16);
            }
            else {
              v40 = 0;
            }
            id v41 = v40;
            v42 = *(void **)(a1 + 56);
            v43 = [v41 identity];
            [v42 setObject:v39 forKey:v43];

            v44 = [v41 target];
            v45 = [v44 token];

            if (v45) {
              [*(id *)(a1 + 64) setObject:v39 forKey:v45];
            }

            ++v38;
          }
          while (v36 != v38);
          uint64_t v46 = [obj countByEnumeratingWithState:&v131 objects:v152 count:16];
          uint64_t v36 = v46;
        }
        while (v46);
      }

      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v47 = *(id *)(a1 + 48);
      uint64_t v48 = [v47 countByEnumeratingWithState:&v127 objects:&v148 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v128;
        do
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v128 != v50) {
              objc_enumerationMutation(v47);
            }
            -[BKEventDeferringNode disconnectFromGraph](*(id **)(*((void *)&v127 + 1) + 8 * k));
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v127 objects:&v148 count:16];
        }
        while (v49);
      }

      long long v125 = 0u;
      long long v126 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id v103 = *(id *)(a1 + 48);
      uint64_t v106 = [v103 countByEnumeratingWithState:&v123 objects:&v144 count:16];
      if (v106)
      {
        uint64_t v105 = *(void *)v124;
        do
        {
          uint64_t v52 = 0;
          do
          {
            if (*(void *)v124 != v105) {
              objc_enumerationMutation(v103);
            }
            uint64_t v53 = *(void *)(*((void *)&v123 + 1) + 8 * v52);
            v54 = BKLogEventDelivery();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              if (v53) {
                v71 = *(void **)(v53 + 16);
              }
              else {
                v71 = 0;
              }
              id v72 = v71;
              v73 = [v72 identity];
              *(_DWORD *)buf = 138543362;
              v137 = v73;
              _os_log_debug_impl(&dword_1CFDE2000, v54, OS_LOG_TYPE_DEBUG, "match supernode %{public}@", buf, 0xCu);
            }
            uint64_t v107 = v52;

            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            id v55 = *(id *)(a1 + 48);
            uint64_t v56 = [v55 countByEnumeratingWithState:&v119 objects:&v140 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v120;
              do
              {
                uint64_t v59 = 0;
                do
                {
                  if (*(void *)v120 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  v60 = *(void **)(*((void *)&v119 + 1) + 8 * v59);
                  if ((void *)v53 != v60)
                  {
                    -[BKEventDeferringEnvironmentGraph _matchSubnode:toSupernode:](*(void **)(*((void *)&v119 + 1) + 8 * v59), (void *)v53);
                    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    if (v61 != @"process doesn't match")
                    {
                      v62 = BKLogEventDelivery();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                      {
                        if (v60) {
                          v67 = (void *)v60[2];
                        }
                        else {
                          v67 = 0;
                        }
                        id v68 = v67;
                        v69 = [v68 identity];
                        *(_DWORD *)buf = 138543618;
                        v137 = v69;
                        __int16 v138 = 2114;
                        v139 = v61;
                        _os_log_debug_impl(&dword_1CFDE2000, v62, OS_LOG_TYPE_DEBUG, "   -> %{public}@: %{public}@", buf, 0x16u);
                      }
                      if (v61 == @"connected" && v53 != 0)
                      {
                        v64 = *(void **)(v53 + 32);
                        v65 = v60;
                        objc_msgSend(*(id *)(v53 + 32), "insertObject:atIndex:", v65, objc_msgSend(v64, "indexOfObject:inSortedRange:options:usingComparator:", v65, 0, objc_msgSend(v64, "count"), 1024, &__block_literal_global));
                        v66 = (void *)v65[3];

                        [v66 addObject:v53];
                      }
                    }
                  }
                  ++v59;
                }
                while (v57 != v59);
                uint64_t v70 = [v55 countByEnumeratingWithState:&v119 objects:&v140 count:16];
                uint64_t v57 = v70;
              }
              while (v70);
            }

            uint64_t v52 = v107 + 1;
            a1 = v108;
          }
          while (v107 + 1 != v106);
          uint64_t v74 = [v103 countByEnumeratingWithState:&v123 objects:&v144 count:16];
          uint64_t v106 = v74;
        }
        while (v74);
      }
    }
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v109 = *(id *)(a1 + 48);
    uint64_t v75 = [v109 countByEnumeratingWithState:&v140 objects:&v148 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v141;
      do
      {
        uint64_t v78 = 0;
        do
        {
          if (*(void *)v141 != v77) {
            objc_enumerationMutation(v109);
          }
          v79 = *(id *)(*((void *)&v140 + 1) + 8 * v78);
          v80 = v79;
          if (v79) {
            uint64_t v81 = *((unsigned int *)v79 + 3);
          }
          else {
            uint64_t v81 = 0;
          }
          v82 = [NSNumber numberWithInt:v81];
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          if (v80) {
            v83 = (void *)v80[3];
          }
          else {
            v83 = 0;
          }
          id v84 = v83;
          uint64_t v85 = [v84 countByEnumeratingWithState:&v144 objects:v152 count:16];
          if (v85)
          {
            uint64_t v86 = v85;
            uint64_t v87 = *(void *)v145;
LABEL_93:
            uint64_t v88 = 0;
            while (1)
            {
              if (*(void *)v145 != v87) {
                objc_enumerationMutation(v84);
              }
              uint64_t v89 = *(void *)(*((void *)&v144 + 1) + 8 * v88);
              if (v89) {
                LODWORD(v89) = *(_DWORD *)(v89 + 12);
              }
              if (v81 != v89) {
                break;
              }
              if (v86 == ++v88)
              {
                uint64_t v86 = [v84 countByEnumeratingWithState:&v144 objects:v152 count:16];
                if (v86) {
                  goto LABEL_93;
                }

                a1 = v108;
                objc_msgSend(*(id *)(v108 + 16), "bs_removeObject:fromCollectionForKey:", v80, v82);
                goto LABEL_108;
              }
            }
          }

          a1 = v108;
          id v90 = [*(id *)(v108 + 16) objectForKey:v82];
          if (!v90)
          {
            id v90 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
            [*(id *)(v108 + 16) setObject:v90 forKey:v82];
          }
          unint64_t v91 = objc_msgSend(v90, "indexOfObject:inSortedRange:options:usingComparator:", v80, 0, objc_msgSend(v90, "count"), 1024, &__block_literal_global_2735);
          if (v91 >= [v90 count]
            || ([v90 objectAtIndex:v91],
                v92 = objc_claimAutoreleasedReturnValue(),
                v92,
                v92 != v80))
          {
            [v90 insertObject:v80 atIndex:v91];
          }

LABEL_108:
          ++v78;
        }
        while (v78 != v76);
        uint64_t v93 = [v109 countByEnumeratingWithState:&v140 objects:&v148 count:16];
        uint64_t v76 = v93;
      }
      while (v93);
    }

    -[BKEventDeferringEnvironmentGraph _reevaluateActiveUIResponderNodesForPID:](a1, v97);
    id v5 = v98;
  }
}

- (__CFString)_matchSubnode:(void *)a1 toSupernode:(void *)a2
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = a2;
  id v5 = v4;
  if (v3 != v4)
  {
    if (v4) {
      id v7 = (void *)v4[2];
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v8 target];

    int v10 = [v9 pid];
    if (v3)
    {
      if (v10 == *((_DWORD *)v3 + 3))
      {
        uint64_t v11 = (void *)v3[2];
LABEL_8:
        id v12 = v11;
        id v13 = [v12 predicate];

        id v14 = [v13 token];
        uint64_t v15 = [v9 token];
        uint64_t v16 = (void *)v15;
        if (v14 || !v15)
        {
          if ((BSEqualObjects() & 1) == 0)
          {
            uint64_t v6 = @"no token match";
            goto LABEL_22;
          }
          if (!-[BKEventDeferringNode hasAncestorNode:]((uint64_t)v5, v3))
          {
            uint64_t v6 = @"connected";
            goto LABEL_22;
          }
        }
        else
        {
          if (v3) {
            id v17 = (void *)v3[3];
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;
          uint64_t v19 = [v18 count];

          if (v19)
          {
            uint64_t v6 = @"partial match, but there's already a supernode";
LABEL_22:

LABEL_31:
            goto LABEL_32;
          }
          if ((-[BKEventDeferringNode hasAncestorNode:]((uint64_t)v5, v3) & 1) == 0)
          {
            uint64_t v6 = @"partial connection";
            goto LABEL_22;
          }
        }
        uint64_t v20 = BKLogEventDelivery();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          if (v5) {
            uint64_t v21 = (void *)v5[2];
          }
          else {
            uint64_t v21 = 0;
          }
          id v22 = v21;
          [v22 identity];
          v23 = v28 = v22;
          if (v3) {
            uint64_t v24 = (void *)v3[2];
          }
          else {
            uint64_t v24 = 0;
          }
          id v25 = v24;
          id v26 = [v25 identity];
          *(_DWORD *)buf = 138543618;
          v30 = v23;
          __int16 v31 = 2114;
          v32 = v26;
          _os_log_error_impl(&dword_1CFDE2000, v20, OS_LOG_TYPE_ERROR, "cycle detected between %{public}@ -> %{public}@", buf, 0x16u);
        }
        uint64_t v6 = @"cycle detected";
        goto LABEL_22;
      }
    }
    else if (!v10)
    {
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    uint64_t v6 = @"process doesn't match";
    goto LABEL_31;
  }
  uint64_t v6 = 0;
LABEL_32:

  return v6;
}

- (void)_reevaluateActiveUIResponderNodesForPID:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithInt:a2];
  v4 = [*(id *)(a1 + 32) objectForKey:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v9) {
          *(unsigned char *)(v9 + 8) = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  int v10 = [*(id *)(a1 + 40) objectForKey:v3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__BKEventDeferringEnvironmentGraph__reevaluateActiveUIResponderNodesForPID___block_invoke;
  v12[3] = &unk_1E68717E8;
  v12[4] = a1;
  uint64_t v11 = objc_msgSend(v10, "bs_compactMap:", v12);
  if (v11)
  {
    [*(id *)(a1 + 32) setObject:v11 forKey:v3];
  }
  else if (v4)
  {
    [*(id *)(a1 + 32) removeObjectForKey:v3];
  }
}

uint64_t __62__BKEventDeferringEnvironmentGraph__updateNodeTopLevelStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = a3;
  if (a2) {
    uint64_t v5 = *(void **)(a2 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v4) {
    uint64_t v7 = (void *)v4[2];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v6 weightedDeferringRuleCompare:v8];
  return v9;
}

id __52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*((_DWORD *)v3 + 3) == *(_DWORD *)(a1 + 32))
    {
      uint64_t v5 = (void *)*((void *)v3 + 2);
LABEL_4:
      id v6 = v5;
      uint64_t v7 = [v6 identity];

      goto LABEL_6;
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v9 = a1;
    uint64_t v7 = 0;
    if (!*(_DWORD *)(v9 + 32)) {
      goto LABEL_4;
    }
  }
LABEL_6:

  return v7;
}

BKEventDeferringNode *__52__BKEventDeferringEnvironmentGraph_setRules_forPID___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v4 identity];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    uint64_t v7 = [BKEventDeferringNode alloc];
    int v8 = *(_DWORD *)(a1 + 40);
    id v9 = v4;
    if (v7)
    {
      v16.receiver = v7;
      v16.super_class = (Class)BKEventDeferringNode;
      int v10 = (BKEventDeferringNode *)objc_msgSendSuper2(&v16, sel_init);
      uint64_t v7 = v10;
      if (v10)
      {
        v10->_pid = v8;
        objc_storeStrong((id *)&v10->_rule, a2);
        uint64_t v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
        subnodes = v7->_subnodes;
        v7->_subnodes = v11;

        long long v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
        supernodes = v7->_supernodes;
        v7->_supernodes = v13;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToNode, 0);
  objc_storeStrong((id *)&self->_nodeByIdentity, 0);
  objc_storeStrong((id *)&self->_allNodes, 0);
  objc_storeStrong((id *)&self->_pidToActiveUIResponderTokens, 0);
  objc_storeStrong((id *)&self->_pidToActiveUIResponderNodes, 0);
  objc_storeStrong((id *)&self->_selectedNodeIdentities, 0);
  objc_storeStrong((id *)&self->_topLevelInEachProcess, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = (id)[a3 appendObject:self->_topLevelInEachProcess withName:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKEventDeferringEnvironmentGraph *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(NSMutableOrderedSet *)self->_allNodes isEqual:v5->_allNodes]) {
        char v6 = [(NSMutableSet *)self->_selectedNodeIdentities isEqual:v5->_selectedNodeIdentities];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_allNodes hash];
  return [(NSMutableSet *)self->_selectedNodeIdentities hash] ^ v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableOrderedSet *)self->_allNodes count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = self->_allNodes;
    uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          -[BKEventDeferringNode disconnectFromGraph](*(id **)(*((void *)&v9 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)BKEventDeferringEnvironmentGraph;
  [(BKEventDeferringEnvironmentGraph *)&v8 dealloc];
}

id __76__BKEventDeferringEnvironmentGraph__reevaluateActiveUIResponderNodesForPID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:v3];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = 1;
  }
  else
  {
    uint64_t v6 = BKLogEventDelivery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_error_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_ERROR, "no node for active UI responder token %{public}@ (yet?)", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5;
}

- (void)setActiveUIResponderTokens:(uint64_t)a3 forPID:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = BKLogEventDelivery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v5];
      int v11 = 138543618;
      long long v12 = v7;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl(&dword_1CFDE2000, v6, OS_LOG_TYPE_DEFAULT, "setActiveUIResponderTokens:%{public}@ forPID:%d", (uint8_t *)&v11, 0x12u);
    }
    uint64_t v8 = [v5 count];
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithInt:a3];
    if (v8) {
      [v9 setObject:v5 forKey:v10];
    }
    else {
      [v9 removeObjectForKey:v10];
    }

    -[BKEventDeferringEnvironmentGraph _reevaluateActiveUIResponderNodesForPID:](a1, a3);
  }
}

- (void)_logNodes:(void *)a3 toGraphDescription:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__BKEventDeferringEnvironmentGraph__logNodes_toGraphDescription___block_invoke;
    v8[3] = &unk_1E6871848;
    id v9 = v5;
    id v10 = v6;
    uint64_t v11 = a1;
    -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v10, v7, v8);
  }
}

void __65__BKEventDeferringEnvironmentGraph__logNodes_toGraphDescription___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        -[BKEventDeferringNode appendGraphDescription:](v7, *(void **)(a1 + 40));
        uint64_t v8 = *(void *)(a1 + 48);
        if (v7) {
          id v9 = *(void **)(v7 + 32);
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;
        -[BKEventDeferringEnvironmentGraph _logNodes:toGraphDescription:](v8, v10, *(void *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v11;
    }
    while (v11);
  }
}

void __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke_2;
  v5[3] = &unk_1E6871870;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __59__BKEventDeferringEnvironmentGraph_appendGraphDescription___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(id **)(a1 + 32);
  id v13 = a3;
  [a2 intValue];
  id v6 = BSProcessDescriptionForPID();
  -[BKGraphDescription appendNode:](v5, @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  -[BKEventDeferringEnvironmentGraph _logNodes:toGraphDescription:](*(void *)(a1 + 40), v13, *(void **)(a1 + 32));
}

uint64_t __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke_3()
{
  return BSProcessDescriptionForPID();
}

id __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 16);
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = [v3 identity];

  return v4;
}

id __94__BKEventDeferringEnvironmentGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = *(void **)(a2 + 16);
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;
  uint64_t v4 = [v3 identity];

  return v4;
}

@end