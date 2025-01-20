@interface RWIProtocolDOMNode(IKJSInspector)
+ (id)ik_nodeFromDOMNode:()IKJSInspector;
+ (id)ik_nodeFromDOMNode:()IKJSInspector depth:;
- (id)ik_attributesDictionary;
- (id)ik_description;
- (id)ik_nodeWithNodeId:()IKJSInspector;
- (uint64_t)ik_updateWithDOMNode:()IKJSInspector dispatcher:;
- (void)ik_insertChild:()IKJSInspector before:;
- (void)ik_removeAttributeNamed:()IKJSInspector;
- (void)ik_removeChildWithId:()IKJSInspector;
- (void)ik_setAttributeValue:()IKJSInspector name:;
- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:;
@end

@implementation RWIProtocolDOMNode(IKJSInspector)

+ (id)ik_nodeFromDOMNode:()IKJSInspector depth:
{
  id v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "ik_nodeFromDOMNode:", v5);
  if (a4)
  {
    v7 = [v5 childNodesAsArray];
    v8 = [MEMORY[0x1E4F1CA48] array];
    if ([v7 count])
    {
      unint64_t v9 = 0;
      if (a4 == -1) {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v10 = (a4 - 1);
      }
      do
      {
        v11 = objc_opt_class();
        v12 = [v7 objectAtIndex:v9];
        v13 = objc_msgSend(v11, "ik_nodeFromDOMNode:depth:", v12, v10);
        [v8 addObject:v13];

        ++v9;
      }
      while (v9 < [v7 count]);
    }
    [v6 setChildren:v8];
    if ([v5 nodeType] == 9)
    {
      uint64_t v14 = [v5 documentURI];
      v15 = (void *)v14;
      if (v14) {
        v16 = (__CFString *)v14;
      }
      else {
        v16 = @"myscheme://mydomain.com/default.html";
      }
      [v6 setDocumentURL:v16];

      [v6 setXmlVersion:@"1.0"];
    }
  }
  return v6;
}

+ (id)ik_nodeFromDOMNode:()IKJSInspector
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 nodeValue];
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = &stru_1F3E09950;
  }
  v6 = (void *)MEMORY[0x1E4FB6C80];
  uint64_t v7 = [v3 ITMLID];
  uint64_t v8 = [v3 nodeType];
  unint64_t v9 = [v3 nodeName];
  uint64_t v10 = [v3 nodeName];
  v11 = objc_msgSend(v6, "safe_initWithNodeId:nodeType:nodeName:localName:nodeValue:", v7, v8, v9, v10, v5);

  if ([v3 nodeType] == 1)
  {
    v12 = [v3 _attributes];
    v13 = [MEMORY[0x1E4F1CA48] array];
    if ([v12 count])
    {
      v25 = v5;
      id v26 = v3;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v14 = [v12 allKeys];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v20 = +[IKDOMElement _filteredAttributes];
            char v21 = [v20 containsObject:v19];

            if ((v21 & 1) == 0)
            {
              [v13 addObject:v19];
              v22 = [v12 objectForKey:v19];
              [v13 addObject:v22];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v16);
      }

      id v5 = v25;
      id v3 = v26;
    }
    [v11 setAttributes:v13];
  }
  v23 = [v3 childNodesAsArray];
  objc_msgSend(v11, "setChildNodeCount:", objc_msgSend(v23, "count"));

  return v11;
}

- (id)ik_attributesDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v3 = [a1 attributes];
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v3 objectAtIndex:v4];
      v6 = +[IKDOMElement _filteredAttributes];
      char v7 = [v6 containsObject:v5];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = [v3 objectAtIndex:v4 + 1];
        [v2 setObject:v8 forKey:v5];
      }
      v4 += 2;
    }
    while ([v3 count] > v4);
  }

  return v2;
}

- (void)ik_setAttributeValue:()IKJSInspector name:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IKDOMElement _filteredAttributes];
  char v9 = [v8 containsObject:v7];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = a1;
      _os_log_debug_impl(&dword_1E2ACE000, v10, OS_LOG_TYPE_DEBUG, "Setting %@ = %@ on %@", (uint8_t *)&v17, 0x20u);
    }

    v11 = [a1 attributes];
    v12 = (void *)[v11 mutableCopy];

    if ([v12 count])
    {
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [v12 objectAtIndex:v13];
        int v15 = [v14 isEqualToString:v7];

        if (v15) {
          break;
        }
        v13 += 2;
        if ([v12 count] <= v13) {
          goto LABEL_8;
        }
      }
      uint64_t v16 = v13 & 0xFFFFFFFE | 1;
      [v12 removeObjectAtIndex:v16];
      [v12 insertObject:v6 atIndex:v16];
    }
    else
    {
LABEL_8:
      [v12 addObject:v7];
      [v12 addObject:v6];
    }
    [a1 setAttributes:v12];
  }
}

- (void)ik_removeAttributeNamed:()IKJSInspector
{
  id v9 = a3;
  unint64_t v4 = [a1 attributes];
  id v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    while (1)
    {
      id v7 = [v5 objectAtIndex:v6];
      int v8 = [v7 isEqualToString:v9];

      if (v8) {
        break;
      }
      v6 += 2;
      if ([v5 count] <= v6) {
        goto LABEL_7;
      }
    }
    [v5 removeObjectAtIndex:v6 & 0xFFFFFFFE | 1];
    [v5 removeObjectAtIndex:v6];
  }
LABEL_7:
  [a1 setAttributes:v5];
}

- (void)ik_removeChildWithId:()IKJSInspector
{
  id v5 = [a1 children];
  id v9 = (id)[v5 mutableCopy];

  if ([v9 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v9 objectAtIndex:v6];
      int v8 = [v7 nodeId];

      if (v8 == a3) {
        break;
      }
      if ([v9 count] <= (unint64_t)++v6) {
        goto LABEL_7;
      }
    }
    [v9 removeObjectAtIndex:v6];
    objc_msgSend(a1, "setChildNodeCount:", objc_msgSend(a1, "childNodeCount") - 1);
    [a1 setChildren:v9];
  }
LABEL_7:
}

- (void)ik_insertChild:()IKJSInspector before:
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [a1 children];
  int v8 = (void *)[v7 mutableCopy];

  if (v6)
  {
    if ([v8 count])
    {
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = [v8 objectAtIndex:v9];
        int v11 = [v10 nodeId];
        if (v11 == [v6 intValue]) {
          break;
        }

        if ([v8 count] <= (unint64_t)++v9) {
          goto LABEL_9;
        }
      }
      [v8 insertObject:v12 atIndex:v9];
    }
  }
  else
  {
    [v8 addObject:v12];
  }
LABEL_9:
  [a1 setChildren:v8];
}

- (id)ik_description
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a1 nodeId];
  id v6 = [a1 nodeName];
  id v7 = [v2 stringWithFormat:@"<%@: %p, id: %i, name: %@, type: %i>", v4, a1, v5, v6, objc_msgSend(a1, "nodeType")];

  return v7;
}

- (id)ik_nodeWithNodeId:()IKJSInspector
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a1 nodeId] == a3)
  {
    id v5 = a1;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = objc_msgSend(a1, "children", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "ik_nodeWithNodeId:", a3);
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:
  return v5;
}

- (uint64_t)ik_updateWithDOMNode:()IKJSInspector dispatcher:
{
  return objc_msgSend(a1, "ik_updateWithDOMNode:fullfillChildren:dispatcher:", a3, 0, a4);
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v104 = a5;
  uint64_t v9 = [v8 nodeValue];
  uint64_t v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  else {
    uint64_t v11 = &stru_1F3E09950;
  }
  [a1 setNodeValue:v11];

  objc_msgSend(a1, "setNodeType:", objc_msgSend(v8, "nodeType"));
  uint64_t v12 = [v8 nodeName];
  long long v13 = (void *)v12;
  if (v12) {
    long long v14 = (__CFString *)v12;
  }
  else {
    long long v14 = &stru_1F3E09950;
  }
  [a1 setNodeName:v14];

  uint64_t v15 = [v8 nodeName];
  long long v16 = (void *)v15;
  if (v15) {
    int v17 = (__CFString *)v15;
  }
  else {
    int v17 = &stru_1F3E09950;
  }
  [a1 setLocalName:v17];

  if ([v8 nodeType] == 1)
  {
    int v94 = a4;
    id v96 = v8;
    uint64_t v18 = [v8 _attributes];
    v102 = objc_msgSend(a1, "ik_attributesDictionary");
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v117 objects:v134 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v118 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v117 + 1) + 8 * i);
          v25 = +[IKDOMElement _filteredAttributes];
          char v26 = [v25 containsObject:v24];

          if ((v26 & 1) == 0)
          {
            long long v27 = [v102 objectForKey:v24];
            long long v28 = [v19 objectForKey:v24];
            if (([v27 isEqualToString:v28] & 1) == 0)
            {
              long long v29 = ITMLKitGetLogObject(1);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                v99 = objc_msgSend(a1, "ik_description");
                *(_DWORD *)buf = 138412802;
                v129 = v99;
                __int16 v130 = 2112;
                v131 = v24;
                __int16 v132 = 2112;
                v133 = v28;
                _os_log_debug_impl(&dword_1E2ACE000, v29, OS_LOG_TYPE_DEBUG, "Updating attribute for %@: %@ = %@", buf, 0x20u);
              }
              objc_msgSend(a1, "ik_setAttributeValue:name:", v28, v24);
              objc_msgSend(v104, "safe_attributeModifiedWithNodeId:name:value:", objc_msgSend(a1, "nodeId"), v24, v28);
              if ([v24 isEqualToString:@"style"])
              {
                long long v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "nodeId"));
                v127 = v30;
                v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
                objc_msgSend(v104, "safe_inlineStyleInvalidatedWithNodeIds:", v31);
              }
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v117 objects:v134 count:16];
      }
      while (v21);
    }

    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v32 = [v102 allKeys];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v113 objects:v126 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v114 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v113 + 1) + 8 * j);
          v38 = [v19 allKeys];
          char v39 = [v38 containsObject:v37];

          if ((v39 & 1) == 0)
          {
            v40 = ITMLKitGetLogObject(1);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              v41 = objc_msgSend(a1, "ik_description");
              *(_DWORD *)buf = 138412546;
              v129 = v37;
              __int16 v130 = 2112;
              v131 = v41;
              _os_log_debug_impl(&dword_1E2ACE000, v40, OS_LOG_TYPE_DEBUG, "Removing attribute (%@) for %@", buf, 0x16u);
            }
            objc_msgSend(a1, "ik_removeAttributeNamed:", v37);
            objc_msgSend(v104, "safe_attributeRemovedWithNodeId:name:", objc_msgSend(a1, "nodeId"), v37);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v113 objects:v126 count:16];
      }
      while (v34);
    }

    id v8 = v96;
    a4 = v94;
  }
  v42 = [a1 children];

  if (v42 || a4)
  {
    v43 = [a1 children];
    if (v43)
    {
      v44 = [a1 children];
      v45 = (void *)[v44 mutableCopy];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA48] array];
    }

    v46 = [v8 childNodesAsArray];
    v47 = (void *)[v46 mutableCopy];

    v48 = [[IKDiffEvaluator alloc] initWithObjects:v47 oldObjects:v45 hashing:&__block_literal_global_1];
    v49 = [MEMORY[0x1E4F28E60] indexSet];
    v50 = [(IKDiffEvaluator *)v48 addedIndexes];

    if (v50)
    {
      v51 = [(IKDiffEvaluator *)v48 addedIndexes];
      [v49 addIndexes:v51];
    }
    v101 = v49;
    v103 = a1;
    v98 = [MEMORY[0x1E4F1CA60] dictionary];
    v52 = [(IKDiffEvaluator *)v48 movedIndexesByNewIndex];

    v100 = v48;
    if (v52)
    {
      v53 = v47;
      v54 = v45;
      id v97 = v8;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v55 = [(IKDiffEvaluator *)v48 movedIndexesByNewIndex];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v109 objects:v125 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v110;
        do
        {
          for (uint64_t k = 0; k != v57; ++k)
          {
            if (*(void *)v110 != v58) {
              objc_enumerationMutation(v55);
            }
            v60 = *(void **)(*((void *)&v109 + 1) + 8 * k);
            objc_msgSend(v101, "addIndex:", objc_msgSend(v60, "unsignedIntegerValue"));
            v61 = [(IKDiffEvaluator *)v48 movedIndexesByNewIndex];
            v62 = [v61 objectForKey:v60];
            uint64_t v63 = [v62 unsignedIntegerValue];

            v64 = [v54 objectAtIndex:v63];
            v65 = objc_msgSend(v53, "objectAtIndex:", objc_msgSend(v60, "unsignedIntegerValue"));
            LODWORD(v63) = [v64 nodeId];
            if ([v65 ITMLID] == (int)v63)
            {
              v66 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v64, "nodeId"));
              [v98 setObject:v64 forKey:v66];
            }
            v48 = v100;
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v109 objects:v125 count:16];
        }
        while (v57);
      }

      id v8 = v97;
      v45 = v54;
      v47 = v53;
    }
    v67 = [(IKDiffEvaluator *)v48 removedIndexes];

    if (v67)
    {
      v68 = v47;
      v69 = [(IKDiffEvaluator *)v100 removedIndexes];
      v70 = [v45 objectsAtIndexes:v69];

      v71 = [(IKDiffEvaluator *)v100 removedIndexes];
      v72 = v45;
      [v45 removeObjectsAtIndexes:v71];

      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v73 = v70;
      uint64_t v74 = [v73 countByEnumeratingWithState:&v105 objects:v124 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = *(void *)v106;
        do
        {
          for (uint64_t m = 0; m != v75; ++m)
          {
            if (*(void *)v106 != v76) {
              objc_enumerationMutation(v73);
            }
            v78 = *(void **)(*((void *)&v105 + 1) + 8 * m);
            v79 = ITMLKitGetLogObject(1);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
              -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.5((uint64_t)buf, (uint64_t)v103);
            }

            objc_msgSend(v104, "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v103, "nodeId"), objc_msgSend(v78, "nodeId"));
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v105 objects:v124 count:16];
        }
        while (v75);
      }

      v45 = v72;
      v47 = v68;
    }
    a1 = v103;
    v80 = v101;
    if ([v47 count])
    {
      unint64_t v81 = 0;
      v95 = &v122;
      do
      {
        v82 = objc_msgSend(v47, "objectAtIndex:", v81, v95);
        if (v81 >= [v45 count])
        {
          if ([v80 containsIndex:v81])
          {
            v83 = 0;
LABEL_76:
            v85 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v82, "ITMLID"));
            v86 = [v98 objectForKey:v85];

            if (v86)
            {
              objc_msgSend(v86, "ik_updateWithDOMNode:dispatcher:", v82, v104);
              v83 = v86;
              if (v81) {
                goto LABEL_78;
              }
LABEL_82:
              uint64_t v88 = 0;
            }
            else
            {
              v83 = objc_msgSend(MEMORY[0x1E4FB6C80], "ik_nodeFromDOMNode:", v82);
              v89 = ITMLKitGetLogObject(1);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
                -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:]((uint64_t)v123, (uint64_t)v83);
              }

              if (!v81) {
                goto LABEL_82;
              }
LABEL_78:
              v87 = [v45 objectAtIndex:v81 - 1];
              uint64_t v88 = [v87 nodeId];
            }
            v80 = v101;
            objc_msgSend(v104, "safe_childNodeInsertedWithParentNodeId:previousNodeId:node:", objc_msgSend(v103, "nodeId"), v88, v83);
            [v45 insertObject:v83 atIndex:v81];
LABEL_84:
          }
        }
        else
        {
          v83 = [v45 objectAtIndex:v81];
          if ([v80 containsIndex:v81]) {
            goto LABEL_76;
          }
          if (v83)
          {
            v84 = ITMLKitGetLogObject(1);
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
              -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.4((uint64_t)v121, (uint64_t)v83);
            }

            objc_msgSend(v83, "ik_updateWithDOMNode:dispatcher:", v82, v104);
            goto LABEL_84;
          }
        }

        ++v81;
      }
      while (v81 < [v47 count]);
    }
    [v103 setChildren:v45];
    v90 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
      -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:](v103);
    }
  }
  v91 = [v8 childNodesAsArray];
  uint64_t v92 = [v91 count];

  if ([a1 childNodeCount] != v92)
  {
    v93 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
      -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:](a1);
    }

    [a1 setChildNodeCount:v92];
    objc_msgSend(v104, "safe_childNodeCountUpdatedWithNodeId:childNodeCount:", objc_msgSend(a1, "nodeId"), v92);
  }
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.1(void *a1)
{
  uint64_t v7 = objc_msgSend(a1, "ik_description");
  [a1 childNodeCount];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x18u);
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.2(void *a1)
{
  id v6 = objc_msgSend(a1, "ik_description");
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.3(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "ik_description");
  *os_log_type_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1E2ACE000, v5, v6, "Newly added node: %@");
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.4(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "ik_description");
  *os_log_type_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1E2ACE000, v5, v6, "Updating node: %@");
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.5(uint64_t a1, uint64_t a2)
{
  os_log_type_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_0(a1, a2), "ik_description");
  *os_log_type_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1E2ACE000, v5, v6, "Removed %@");
}

@end