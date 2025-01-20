@interface IKTemplateStyleSheet
+ (_xmlDoc)_xmlTreeForTemplateName:(id)a3;
+ (_xmlDoc)_xmlTreeWithData:(id)a3 error:(id *)a4;
+ (id)_coalesceNode:(_xmlNode *)a3 overridingNode:(_xmlNode *)a4 forcedTemplateName:(id)a5;
+ (id)_styleSheetForTemplateName:(id)a3;
+ (id)_templateNodeWithXMLNode:(_xmlNode *)a3 parentNode:(id)a4;
+ (id)_templateTreeWithXMLTree:(_xmlNode *)a3 parentNode:(id)a4;
+ (id)styleSheetForTemplateName:(id)a3;
+ (void)_coalesceTrees:(_xmlNode *)a3 overridingTree:(_xmlNode *)a4 forcedTemplateName:(id)a5;
+ (void)_findNodesInXmlTree:(_xmlDoc *)a3 styleNode:(_xmlNode *)a4 templateNode:(_xmlNode *)a5;
+ (void)_resolveEmbeddedTemplatesInXmlTree:(_xmlNode *)a3;
+ (void)loadStyleSheets;
+ (void)registerStyleSheetURL:(id)a3 forTemplateName:(id)a4;
+ (void)registerStyleSheetURL:(id)a3 parentStyleSheets:(id)a4 forTemplateName:(id)a5;
- (IKStyleFactory)styleFactory;
- (NSDictionary)templateTree;
- (NSMutableDictionary)styleComposersByKeypath;
- (NSString)templateName;
- (id)_initWithXMLDoc:(_xmlDoc *)a3 templateName:(id)a4 error:(id *)a5;
- (id)_styleComposerForNode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)styleComposerForElement:(id)a3;
- (void)setViewElementStylesDirty;
@end

@implementation IKTemplateStyleSheet

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(IKTemplateStyleSheet *)self templateName];
  v6 = *(void **)(v4 + 32);
  v27 = (void *)v4;
  *(void *)(v4 + 32) = v5;

  v7 = (void *)MEMORY[0x1E4F1CA60];
  v8 = [(IKTemplateStyleSheet *)self templateTree];
  v9 = objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(IKTemplateStyleSheet *)self templateTree];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
        v16 = [(IKTemplateStyleSheet *)self templateTree];
        v17 = [v16 objectForKey:v15];
        v18 = (void *)[v17 copy];
        [v9 setObject:v18 forKey:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  v19 = (void *)v27[2];
  v27[2] = v9;
  id v20 = v9;

  v21 = [(IKTemplateStyleSheet *)self styleFactory];
  uint64_t v22 = [v21 copy];
  v23 = (void *)v27[1];
  v27[1] = v22;

  uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
  v25 = (void *)v27[3];
  v27[3] = v24;

  return v27;
}

+ (void)registerStyleSheetURL:(id)a3 forTemplateName:(id)a4
{
}

+ (void)registerStyleSheetURL:(id)a3 parentStyleSheets:(id)a4 forTemplateName:(id)a5
{
  id v16 = a1;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  if (registerStyleSheetURL_parentStyleSheets_forTemplateName__onceToken == -1)
  {
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&registerStyleSheetURL_parentStyleSheets_forTemplateName__onceToken, &__block_literal_global_24);
    if (!v7) {
      goto LABEL_13;
    }
  }
  if (objc_msgSend(v7, "count", v16))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v12) scheme];
        uint64_t v14 = [v13 lowercaseString];
        int v15 = [v14 isEqualToString:@"file"];

        if (!v15) {
          goto LABEL_21;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
LABEL_13:
  if (objc_msgSend(v8, "length", v16))
  {
    id v9 = v17;
    objc_sync_enter(v9);
    if (v7) {
      [(id)sParentPathMap setObject:v7 forKey:v8];
    }
    else {
      [(id)sParentPathMap removeObjectForKey:v8];
    }
    if (v18) {
      [(id)sFilePathMap setObject:v18 forKey:v8];
    }
    else {
      [(id)sFilePathMap removeObjectForKey:v8];
    }
    [(id)sUnloadedTemplateNames addObject:v8];
    objc_sync_exit(v9);
LABEL_21:
  }
}

uint64_t __80__IKTemplateStyleSheet_registerStyleSheetURL_parentStyleSheets_forTemplateName___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)sUnloadedTemplateNames;
  sUnloadedTemplateNames = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v3 = (void *)sParentPathMap;
  sParentPathMap = v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  uint64_t v5 = sFilePathMap;
  sFilePathMap = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

+ (void)loadStyleSheets
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = [(id)sUnloadedTemplateNames allObjects];
  [(id)sUnloadedTemplateNames removeAllObjects];
  objc_sync_exit(v2);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = +[IKConcurrentEvaluator idleEvaluator];
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __39__IKTemplateStyleSheet_loadStyleSheets__block_invoke;
        v11[3] = &unk_1E6DE6108;
        v11[4] = v8;
        v11[5] = v2;
        [v9 addEvaluationBlock:v11 forKey:v8];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __39__IKTemplateStyleSheet_loadStyleSheets__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _styleSheetForTemplateName:*(void *)(a1 + 32)];
}

+ (id)styleSheetForTemplateName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[IKConcurrentEvaluator idleEvaluator];
  uint64_t v5 = [v4 objectForKey:v3];

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

- (id)styleComposerForElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v8 = 0;
    goto LABEL_45;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"templateKeyPath"];
  if (!v6
    || ([(IKTemplateStyleSheet *)self styleComposersByKeypath],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:v6],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    v55 = v5;
    id v11 = v5;
    long long v12 = 0;
    v59 = v11;
    do
    {
      long long v13 = [v11 elementName];
      if (!+[IKViewElementFactory isDependentByTagName:v13])
      {
        if (v12) {
          long long v14 = v12;
        }
        else {
          long long v14 = v13;
        }
        id v15 = v14;

        [v10 addObject:v13];
        long long v12 = v15;
      }
      [v9 insertObject:v13 atIndex:0];
      uint64_t v16 = [v11 parentStyleableElement];

      id v11 = (id)v16;
    }
    while (v16);
    v57 = v12;
    v58 = v10;
    uint64_t v17 = [v9 componentsJoinedByString:@"."];
    uint64_t v18 = objc_msgSend(v17, "ik_sharedInstance");

    v54 = (void *)v18;
    [v59 setObject:v18 forKeyedSubscript:@"templateKeyPath"];
    uint64_t v19 = [v9 count];
    long long v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19];
    long long v21 = [(IKTemplateStyleSheet *)self templateTree];
    long long v22 = [v9 firstObject];
    v23 = [v21 objectForKey:v22];

    if (!v23) {
      goto LABEL_21;
    }
    [v20 addObject:&unk_1F3E3DCF8];
    if (v19 < 2) {
      goto LABEL_18;
    }
    for (uint64_t i = 1; i != v19; ++i)
    {
      v25 = [v9 objectAtIndex:i];
      v26 = [v23 childNodes];
      v27 = [v26 objectForKey:v25];

      if (v27)
      {
        id v28 = v27;

        long long v29 = [NSNumber numberWithInteger:i];
        [v20 addObject:v29];

        v23 = v28;
      }
    }
    if (v23)
    {
LABEL_18:
      long long v30 = [v59 elementName];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __48__IKTemplateStyleSheet_styleComposerForElement___block_invoke;
      v63[3] = &unk_1E6DE6130;
      id v64 = v58;
      id v31 = v30;
      id v65 = v31;
      id v66 = v57;
      v61 = (uint64_t (**)(void, void))MEMORY[0x1E4E65800](v63);
      if (((uint64_t (**)(void, void *))v61)[2](v61, v23))
      {
        uint64_t v8 = [(IKTemplateStyleSheet *)self _styleComposerForNode:v23];
        uint64_t v5 = v55;
      }
      else
      {
        id v52 = v31;
        id v62 = v23;
        uint64_t v32 = [v20 count];
        v60 = v20;
        v53 = v23;
        v56 = self;
        while (1)
        {
LABEL_23:
          objc_msgSend(v62, "parentNode", v52);
          id v33 = (id)objc_claimAutoreleasedReturnValue();

          id v62 = v33;
          if (!v33) {
            break;
          }
          v34 = [v20 objectAtIndex:--v32];
          uint64_t v35 = [v34 integerValue] + 1;

          if (v35 < v19)
          {
            uint64_t v36 = 1;
            while (1)
            {
              id v33 = v62;
              do
              {
                v37 = v33;
                v38 = [v9 objectAtIndex:v35];
                v39 = [v33 childNodes];
                uint64_t v40 = [v39 objectForKey:v38];
                v41 = (void *)v40;
                if (v40) {
                  v42 = (void *)v40;
                }
                else {
                  v42 = v33;
                }
                id v33 = v42;

                ++v35;
              }
              while (v35 < v19);
              if (((uint64_t (**)(void, id))v61)[2](v61, v33)) {
                break;
              }
              ++v36;
              long long v20 = v60;
              v43 = [v60 objectAtIndex:v32];
              uint64_t v35 = [v43 integerValue] + v36;

              if (v35 >= v19)
              {
                self = v56;
                goto LABEL_23;
              }
            }
            self = v56;
            long long v20 = v60;
            if (v33) {
              break;
            }
          }
        }
        v44 = [v59 parentStyleableElement];
        v45 = [(IKTemplateStyleSheet *)self styleComposerForElement:v44];

        if (v62)
        {
          v46 = [(IKTemplateStyleSheet *)self _styleComposerForNode:v33];
        }
        else
        {
          v47 = [v45 defaultStyleComposer];
          v46 = +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:0 parentStyleComposer:v47 styleList:0 elementStyleOverrides:0];
        }
        v48 = [(IKTemplateStyleSheet *)self styleFactory];
        v49 = [v48 styleListForClassSelector:0];

        uint64_t v8 = +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:v46 parentStyleComposer:v45 styleList:v49 elementStyleOverrides:0];

        uint64_t v5 = v55;
        long long v20 = v60;
        id v31 = v52;
        v23 = v53;
      }

      if (v8)
      {
        v50 = [(IKTemplateStyleSheet *)self styleComposersByKeypath];
        uint64_t v6 = v54;
        [v50 setObject:v8 forKey:v54];

LABEL_43:
        goto LABEL_44;
      }
    }
    else
    {
LABEL_21:
      uint64_t v8 = 0;
      uint64_t v5 = v55;
    }
    uint64_t v6 = v54;
    goto LABEL_43;
  }
LABEL_44:

LABEL_45:
  return v8;
}

uint64_t __48__IKTemplateStyleSheet_styleComposerForElement___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    while (1)
    {
      uint64_t v6 = (void *)a1[4];
      uint64_t v7 = [v5 nodeName];
      LODWORD(v6) = [v6 containsObject:v7];

      if (v6) {
        break;
      }
      uint64_t v8 = [v5 parentNode];

      id v5 = (id)v8;
      if (!v8) {
        goto LABEL_8;
      }
    }
    id v5 = v5;
  }
  else
  {
    id v5 = 0;
  }
LABEL_8:
  id v9 = [v4 nodeName];
  if ([v9 isEqualToString:a1[5]])
  {
    uint64_t v10 = [v5 parentNode];
    if (v10)
    {
      id v11 = [v5 nodeName];
      uint64_t v12 = [v11 isEqualToString:a1[6]];
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)setViewElementStylesDirty
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(IKTemplateStyleSheet *)self styleComposersByKeypath];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setNeedsRecomposition];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(IKTemplateStyleSheet *)self styleFactory];
  [v9 setViewElementStylesDirty];
}

+ (id)_styleSheetForTemplateName:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id ptr = a3;
  id v4 = ITMLKitGetLogObject(3);
  uint64_t v5 = ITMLKitGetLogObject(3);
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, ptr);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "IKTemplateStyleSheet-Parse", (const char *)&unk_1E2B9A9C2, buf, 2u);
  }

  uint64_t v7 = +[IKTemplateStyleSheet _xmlTreeForTemplateName:ptr];
  doc = v7;
  if (v7)
  {
    +[IKTemplateStyleSheet _resolveEmbeddedTemplatesInXmlTree:xmlDocGetRootElement(v7)];
    id v8 = a1;
    objc_sync_enter(v8);
    id v9 = [(id)sParentPathMap objectForKey:ptr];
    objc_sync_exit(v8);

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v10)
    {
      long long v12 = 0;
      uint64_t v13 = *(void *)v58;
      *(void *)&long long v11 = 138412290;
      long long v50 = v11;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v58 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          char v56 = 0;
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v50);
          uint64_t v17 = [v15 path];
          char v18 = [v16 fileExistsAtPath:v17 isDirectory:&v56];
          if (v56) {
            char v19 = 0;
          }
          else {
            char v19 = v18;
          }

          if ((v19 & 1) == 0)
          {
            long long v29 = ITMLKitGetLogObject(0);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              +[IKTemplateStyleSheet _styleSheetForTemplateName:](v29, v30, v31, v32, v33, v34, v35, v36);
            }

            id v37 = 0;
            id v38 = obj;
            goto LABEL_41;
          }
          long long v20 = (void *)MEMORY[0x1E4F1C9B8];
          long long v21 = [v15 path];
          long long v22 = [v20 dataWithContentsOfFile:v21];

          v23 = ITMLKitGetLogObject(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            +[IKTemplateStyleSheet _styleSheetForTemplateName:](buf, v15, &v64, v23);
          }

          id v55 = 0;
          uint64_t v24 = +[IKTemplateStyleSheet _xmlTreeWithData:v22 error:&v55];
          id v25 = v55;
          if (v25)
          {
            v26 = ITMLKitGetLogObject(0);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v61 = v50;
              id v62 = v25;
              _os_log_error_impl(&dword_1E2ACE000, v26, OS_LOG_TYPE_ERROR, "%@", v61, 0xCu);
            }
          }
          if (v12 && v24)
          {
            xmlNodePtr RootElement = xmlDocGetRootElement(v12);
            +[IKTemplateStyleSheet _coalesceTrees:RootElement overridingTree:xmlDocGetRootElement(v24) forcedTemplateName:ptr];
            xmlFreeDoc(v24);
          }
          else
          {
            long long v12 = v24;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      if (v12)
      {
        xmlNodePtr v28 = xmlDocGetRootElement(v12);
        +[IKTemplateStyleSheet _coalesceTrees:v28 overridingTree:xmlDocGetRootElement(doc) forcedTemplateName:ptr];
        xmlFreeDoc(doc);
        doc = (xmlDoc *)v12;
      }
    }
    else
    {
    }
    id v54 = 0;
    id v37 = [[IKTemplateStyleSheet alloc] _initWithXMLDoc:doc templateName:ptr error:&v54];
    id v38 = v54;
    if (v38)
    {
      v39 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        +[IKTemplateStyleSheet _styleSheetForTemplateName:]((uint64_t)v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }
    xmlFreeDoc(doc);
    v46 = ITMLKitGetLogObject(3);
    v47 = ITMLKitGetLogObject(3);
    os_signpost_id_t v48 = os_signpost_id_make_with_pointer(v47, ptr);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)v61 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v46, OS_SIGNPOST_INTERVAL_END, v48, "IKTemplateStyleSheet-Parse", (const char *)&unk_1E2B9A9C2, v61, 2u);
    }

LABEL_41:
  }
  else
  {
    id v37 = 0;
  }

  return v37;
}

+ (void)_coalesceTrees:(_xmlNode *)a3 overridingTree:(_xmlNode *)a4 forcedTemplateName:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4E655C0]();
  uint64_t v10 = [a1 _coalesceNode:a3 overridingNode:a4 forcedTemplateName:v8];
  for (uint64_t i = a4->children; i; uint64_t i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      long long v12 = [NSString stringWithUTF8String:i->name];
      uint64_t v13 = [v10 objectForKey:v12];
      long long v14 = v13;
      uint64_t v16 = 0;
      if (v13)
      {
        [v13 getValue:&v16];
        xmlNodePtr v15 = v16;
      }
      else
      {
        xmlNodePtr v15 = xmlNewChild(a3, 0, (const xmlChar *)[v12 UTF8String], 0);
        uint64_t v16 = v15;
      }
      +[IKTemplateStyleSheet _coalesceTrees:v15 overridingTree:i forcedTemplateName:v8];
    }
  }
}

+ (id)_coalesceNode:(_xmlNode *)a3 overridingNode:(_xmlNode *)a4 forcedTemplateName:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v90 = a5;
  uint64_t v7 = 0;
  parent = a3;
  if (a3 && a4)
  {
    v102 = [MEMORY[0x1E4F1CA60] dictionary];
    v101 = [MEMORY[0x1E4F1CA60] dictionary];
    v100 = [MEMORY[0x1E4F1CA60] dictionary];
    v99 = [MEMORY[0x1E4F1CA60] dictionary];
    v95 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v8 = 0x1E4F29000uLL;
    id v9 = [NSString stringWithUTF8String:a3->name];
    uint64_t v10 = [v9 lowercaseString];
    int v98 = [v10 isEqualToString:@"head"];

    v89 = v9;
    long long v11 = [v9 lowercaseString];
    int v96 = [v11 isEqualToString:@"document"];

    children = a4->children;
    if (children)
    {
      uint64_t v13 = &stru_1F3E09950;
      long long v14 = &stru_1F3E09950;
      while (children->type != XML_ELEMENT_NODE)
      {
        id v25 = v14;
        long long v20 = v13;
LABEL_34:
        children = children->next;
        if (!children) {
          goto LABEL_39;
        }
      }
      xmlNodePtr v15 = [NSString stringWithUTF8String:children->name];
      if (v96)
      {
        uint64_t v16 = [(__CFString *)v13 lowercaseString];
        int v17 = [v16 isEqualToString:@"head"];

        if (v17)
        {
          id v18 = v90;
          xmlNodeSetName(children, (const xmlChar *)[v18 UTF8String]);
          id v19 = v18;

          xmlNodePtr v15 = v19;
        }
      }
      long long v20 = v15;

      if (v98
        && ([(__CFString *)v20 lowercaseString],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v21 isEqualToString:@"style"],
            v21,
            v22))
      {
        Content = xmlNodeGetContent(children);
        uint64_t v24 = [NSString stringWithUTF8String:Content];
        id v25 = [(__CFString *)v14 stringByAppendingString:v24];

        if (Content) {
          ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(Content);
        }
      }
      else
      {
        id v25 = v14;
      }
      Prop = xmlGetProp(children, (const xmlChar *)[@"class" UTF8String]);
      if (Prop)
      {
        v27 = Prop;
        xmlNodePtr v28 = [NSString stringWithUTF8String:Prop];
        ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v27);
      }
      else
      {
        xmlNodePtr v28 = 0;
      }
      long long v29 = xmlGetProp(children, (const xmlChar *)[@"style" UTF8String]);
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = [NSString stringWithUTF8String:v29];
        ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v30);
        if (!v28) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v31 = 0;
        if (!v28)
        {
LABEL_21:
          if (v31) {
            [v100 setObject:v31 forKey:v20];
          }

          uint64_t v32 = xmlGetProp(children, (const xmlChar *)"overrideclass");
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = [NSString stringWithUTF8String:v32];
            ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v33);
          }
          else
          {
            uint64_t v34 = 0;
          }
          uint64_t v35 = xmlGetProp(children, (const xmlChar *)"overridestyle");
          if (v35)
          {
            uint64_t v36 = v35;
            id v37 = [NSString stringWithUTF8String:v35];
            ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v36);
            if (!v34)
            {
LABEL_31:
              if (v37) {
                [v99 setObject:v37 forKey:v20];
              }

              uint64_t v13 = v20;
              long long v14 = v25;
              goto LABEL_34;
            }
          }
          else
          {
            id v37 = 0;
            if (!v34) {
              goto LABEL_31;
            }
          }
          [v101 setObject:v34 forKey:v20];
          goto LABEL_31;
        }
      }
      [v102 setObject:v28 forKey:v20];
      goto LABEL_21;
    }
    long long v20 = &stru_1F3E09950;
    id v25 = &stru_1F3E09950;
LABEL_39:

    id v38 = parent->children;
    if (v38)
    {
      v39 = &stru_1F3E09950;
      uint64_t v40 = v25;
      while (v38->type != XML_ELEMENT_NODE)
      {
        v46 = v39;
LABEL_64:
        id v38 = v38->next;
        if (!v38) {
          goto LABEL_69;
        }
      }
      uint64_t v41 = [*(id *)(v8 + 24) stringWithUTF8String:v38->name];
      if (v96)
      {
        uint64_t v42 = [(__CFString *)v39 lowercaseString];
        int v43 = [v42 isEqualToString:@"head"];

        if (v43)
        {
          id v44 = v90;
          xmlNodeSetName(v38, (const xmlChar *)[v44 UTF8String]);
          id v45 = v44;

          uint64_t v41 = v45;
        }
      }
      v46 = v41;

      if (v98)
      {
        v47 = [(__CFString *)v46 lowercaseString];
        int v48 = [v47 isEqualToString:@"style"];

        if (v48)
        {
          if (([(__CFString *)v40 isEqualToString:&stru_1F3E09950] & 1) == 0)
          {
            v49 = xmlNodeGetContent(v38);
            long long v50 = [*(id *)(v8 + 24) stringWithUTF8String:v49];
            if (v49) {
              ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v49);
            }
            v51 = [v50 stringByAppendingString:v40];

            id v52 = v51;
            xmlNodeSetContent(v38, (const xmlChar *)[v52 UTF8String]);

            uint64_t v40 = &stru_1F3E09950;
          }
        }
      }
      v53 = [MEMORY[0x1E4F29238] valueWithPointer:v38];
      [v95 setObject:v53 forKey:v46];

      id v54 = [v100 valueForKey:v46];
      id v55 = [v102 valueForKey:v46];
      char v56 = [v99 valueForKey:v46];
      long long v57 = [v101 valueForKey:v46];
      if (v54)
      {
        [v100 removeObjectForKey:v46];
        long long v58 = xmlGetProp(v38, (const xmlChar *)[@"style" UTF8String]);
        if (v58)
        {
          long long v59 = v58;
          [*(id *)(v8 + 24) stringWithUTF8String:v58];
          v61 = long long v60 = v46;
          ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v59);
          id v62 = (const xmlChar *)[@"style" UTF8String];
          id v63 = [NSString stringWithFormat:@"%@;%@", v61, v54];
          xmlSetProp(v38, v62, (const xmlChar *)[v63 UTF8String]);

          v46 = v60;
          unint64_t v8 = 0x1E4F29000;
        }
        else
        {
          xmlSetProp(v38, (const xmlChar *)[@"style" UTF8String], (const xmlChar *)objc_msgSend(v54, "UTF8String"));
        }
      }
      if (v55)
      {
        [v102 removeObjectForKey:v46];
        uint64_t v64 = xmlGetProp(v38, (const xmlChar *)[@"class" UTF8String]);
        if (!v64)
        {
          xmlSetProp(v38, (const xmlChar *)[@"class" UTF8String], (const xmlChar *)objc_msgSend(v55, "UTF8String"));
          if (!v56) {
            goto LABEL_61;
          }
          goto LABEL_60;
        }
        id v65 = v64;
        [*(id *)(v8 + 24) stringWithUTF8String:v64];
        v67 = uint64_t v66 = v46;
        ((void (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v65);
        v68 = (const xmlChar *)[@"class" UTF8String];
        id v69 = [NSString stringWithFormat:@"%@ %@", v67, v55];
        xmlSetProp(v38, v68, (const xmlChar *)[v69 UTF8String]);

        v46 = v66;
        unint64_t v8 = 0x1E4F29000;
      }
      if (!v56)
      {
LABEL_61:
        if (v57)
        {
          [v101 removeObjectForKey:v46];
          xmlSetProp(v38, (const xmlChar *)[@"class" UTF8String], (const xmlChar *)objc_msgSend(v57, "UTF8String"));
        }

        v39 = v46;
        goto LABEL_64;
      }
LABEL_60:
      [v99 removeObjectForKey:v46];
      xmlSetProp(v38, (const xmlChar *)[@"style" UTF8String], (const xmlChar *)objc_msgSend(v56, "UTF8String"));
      goto LABEL_61;
    }
    v46 = &stru_1F3E09950;
    uint64_t v40 = v25;
LABEL_69:
    v88 = v46;
    v91 = v40;
    v70 = [MEMORY[0x1E4F1CA80] set];
    v71 = [v100 allKeys];
    [v70 addObjectsFromArray:v71];

    v72 = [v102 allKeys];
    [v70 addObjectsFromArray:v72];

    v73 = [v99 allKeys];
    [v70 addObjectsFromArray:v73];

    v74 = [v101 allKeys];
    [v70 addObjectsFromArray:v74];

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obj = [v70 allObjects];
    uint64_t v97 = [obj countByEnumeratingWithState:&v103 objects:v107 count:16];
    v87 = v70;
    if (v97)
    {
      uint64_t v93 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v97; ++i)
        {
          if (*(void *)v104 != v93) {
            objc_enumerationMutation(obj);
          }
          id v76 = *(id *)(*((void *)&v103 + 1) + 8 * i);
          v77 = xmlNewChild(parent, 0, (const xmlChar *)[v76 UTF8String], 0);
          v78 = [MEMORY[0x1E4F29238] valueWithPointer:v77];
          [v95 setObject:v78 forKey:v76];

          if (v98)
          {
            v79 = [v76 lowercaseString];
            int v80 = [v79 isEqualToString:@"style"];

            if (v80)
            {
              if (([(__CFString *)v91 isEqualToString:&stru_1F3E09950] & 1) == 0)
              {
                v81 = v91;
                xmlNodeSetContent(0, (const xmlChar *)[(__CFString *)v81 UTF8String]);

                v91 = &stru_1F3E09950;
              }
            }
          }
          v82 = [v100 objectForKey:v76];
          if (v82) {
            xmlSetProp(v77, (const xmlChar *)[@"style" UTF8String], (const xmlChar *)objc_msgSend(v82, "UTF8String"));
          }
          v83 = [v102 objectForKey:v76];
          if (v83) {
            xmlSetProp(v77, (const xmlChar *)[@"class" UTF8String], (const xmlChar *)objc_msgSend(v83, "UTF8String"));
          }
          v84 = [v99 objectForKey:v76];
          if (v84) {
            xmlSetProp(v77, (const xmlChar *)[@"style" UTF8String], (const xmlChar *)objc_msgSend(v84, "UTF8String"));
          }
          v85 = [v101 objectForKey:v76];
          if (v85) {
            xmlSetProp(v77, (const xmlChar *)[@"class" UTF8String], (const xmlChar *)objc_msgSend(v85, "UTF8String"));
          }
        }
        uint64_t v97 = [obj countByEnumeratingWithState:&v103 objects:v107 count:16];
      }
      while (v97);
    }

    uint64_t v7 = (void *)[v95 copy];
  }

  return v7;
}

+ (_xmlDoc)_xmlTreeForTemplateName:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  os_signpost_id_t v6 = [(id)sFilePathMap objectForKey:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    unsigned __int8 v24 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v8 = [v6 path];
    int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v24];
    int v10 = v24;

    if (!v9 || v10)
    {
      uint64_t v13 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[IKTemplateStyleSheet _styleSheetForTemplateName:](v13, v15, v16, v17, v18, v19, v20, v21);
      }
      long long v14 = 0;
    }
    else
    {
      long long v11 = (void *)MEMORY[0x1E4F1C9B8];
      long long v12 = [v6 path];
      uint64_t v13 = [v11 dataWithContentsOfFile:v12];

      uint64_t v23 = 0;
      long long v14 = +[IKTemplateStyleSheet _xmlTreeWithData:v13 error:&v23];
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

+ (_xmlDoc)_xmlTreeWithData:(id)a3 error:(id *)a4
{
  id v5 = (void *)*MEMORY[0x1E4F143C8];
  id v6 = a3;
  xmlSetGenericErrorFunc(v5, MEMORY[0x1E4F14830]);
  id v7 = v6;
  unint64_t v8 = (const char *)[v7 bytes];
  int v9 = [v7 length];

  Memory = xmlReadMemory(v8, v9, 0, 0, 4096);
  xmlSetGenericErrorFunc(0, 0);
  long long v11 = 0;
  if (!Memory)
  {
    long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ITMLKitErrorDomain" code:200 userInfo:0];
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  return Memory;
}

+ (void)_resolveEmbeddedTemplatesInXmlTree:(_xmlNode *)a3
{
  doc = a3->doc;
  cur = 0;
  id v5 = off_1E6DE3000;
  +[IKTemplateStyleSheet _findNodesInXmlTree:doc styleNode:&cur templateNode:0];
  children = a3->children;
  if (children)
  {
    unint64_t v7 = 0x1E4F29000uLL;
    unint64_t v8 = (void (**)(xmlChar *))MEMORY[0x1E4FBA9D0];
    do
    {
      if (children->type == XML_ELEMENT_NODE)
      {
        int v9 = (const xmlChar *)[@"embedStyleSheetForTemplate" UTF8String];
        xmlAttrPtr v10 = xmlHasProp(children, v9);
        if (v10)
        {
          long long v11 = v10;
          Prop = xmlGetProp(children, v9);
          if (Prop)
          {
            uint64_t v13 = Prop;
            long long v14 = [*(id *)(v7 + 24) stringWithUTF8String:Prop];
            (*v8)(v13);
          }
          else
          {
            long long v14 = 0;
          }
          xmlRemoveProp(v11);
        }
        else
        {
          long long v14 = 0;
        }
        if ([v14 length])
        {
          uint64_t v15 = [(__objc2_class *)v5[78] _xmlTreeForTemplateName:v14];
          if (v15)
          {
            uint64_t v16 = (xmlDoc *)v15;
            uint64_t v32 = 0;
            uint64_t v33 = 0;
            [(__objc2_class *)v5[78] _findNodesInXmlTree:v15 styleNode:&v33 templateNode:&v32];
            if (cur && v33)
            {
              Content = xmlNodeGetContent(cur);
              if (Content)
              {
                uint64_t v18 = Content;
                uint64_t v19 = [*(id *)(v7 + 24) stringWithUTF8String:Content];
                (*v8)(v18);
              }
              else
              {
                uint64_t v19 = &stru_1F3E09950;
              }
              uint64_t v20 = xmlNodeGetContent(v33);
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v31 = [*(id *)(v7 + 24) stringWithUTF8String:v20];
                [(__CFString *)v19 stringByAppendingString:v31];
                v23 = unint64_t v22 = v7;

                unsigned __int8 v24 = v8;
                id v25 = cur;
                v26 = (void *)v23;
                unint64_t v7 = v22;
                uint64_t v19 = v26;
                v27 = (const xmlChar *)[(__CFString *)v19 UTF8String];
                xmlNodePtr v28 = v25;
                unint64_t v8 = v24;
                xmlNodeSetContent(v28, v27);
                (*v24)(v21);

                id v5 = off_1E6DE3000;
              }
            }
            if (v32)
            {
              for (uint64_t i = *(void *)(v32 + 24); i; uint64_t i = *(void *)(i + 48))
              {
                if (*(_DWORD *)(i + 8) == 1)
                {
                  uint64_t v30 = xmlDocCopyNode((xmlNodePtr)i, doc, 1);
                  xmlAddChild(children, v30);
                }
              }
            }
            xmlFreeDoc(v16);
          }
        }
        else if (children->children)
        {
          [(__objc2_class *)v5[78] _resolveEmbeddedTemplatesInXmlTree:children];
        }
      }
      children = children->next;
    }
    while (children);
  }
}

+ (void)_findNodesInXmlTree:(_xmlDoc *)a3 styleNode:(_xmlNode *)a4 templateNode:(_xmlNode *)a5
{
  xmlNodePtr RootElement = xmlDocGetRootElement(a3);
  if (!xmlStrcmp(RootElement->name, (const xmlChar *)"document"))
  {
    children = RootElement->children;
    if (children)
    {
      int v9 = 0;
      xmlAttrPtr v10 = 0;
      do
      {
        if (v10 && v9) {
          break;
        }
        if (children->type == XML_ELEMENT_NODE)
        {
          if (v10 || xmlStrcmp(children->name, (const xmlChar *)"head"))
          {
            if (v9) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = v10 == 0;
            }
            if (!v11) {
              int v9 = children;
            }
          }
          else
          {
            xmlAttrPtr v10 = children;
          }
        }
        children = children->next;
      }
      while (children);
    }
    else
    {
      xmlAttrPtr v10 = 0;
      int v9 = 0;
    }
    if (a5) {
      *a5 = v9;
    }
    if (a4 && v10)
    {
      long long v12 = v10->children;
      if (v12)
      {
        do
        {
          if (v12->type == XML_ELEMENT_NODE)
          {
            if (xmlStrcmp(v12->name, (const xmlChar *)"style")) {
              uint64_t v13 = 0;
            }
            else {
              uint64_t v13 = v12;
            }
          }
          else
          {
            uint64_t v13 = 0;
          }
          long long v12 = v12->next;
          if (v12) {
            BOOL v14 = v13 == 0;
          }
          else {
            BOOL v14 = 0;
          }
        }
        while (v14);
      }
      else
      {
        uint64_t v13 = 0;
      }
      *a4 = v13;
    }
  }
}

- (id)_initWithXMLDoc:(_xmlDoc *)a3 templateName:(id)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)IKTemplateStyleSheet;
  int v9 = [(IKTemplateStyleSheet *)&v41 init];
  if (!v9) {
    goto LABEL_18;
  }
  xmlAttrPtr v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (a3)
  {
    xmlNodePtr RootElement = xmlDocGetRootElement(a3);
    p_private = &RootElement->_private;
    if (!RootElement)
    {
LABEL_14:
      objc_storeStrong((id *)&v9->_styleFactory, p_private);
      uint64_t v20 = [v10 copy];
      templateTree = v9->_templateTree;
      v9->_templateTree = (NSDictionary *)v20;

      uint64_t v22 = [v8 copy];
      templateName = v9->_templateName;
      v9->_templateName = (NSString *)v22;

      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v16 = 0;
      styleComposersByKeypath = v9->_styleComposersByKeypath;
      v9->_styleComposersByKeypath = (NSMutableDictionary *)v24;
      goto LABEL_15;
    }
    IKXMLStripSpaces((uint64_t)RootElement);
    uint64_t v13 = [NSString stringWithUTF8String:p_private[2]];
    if ([v13 isEqualToString:@"document"])
    {
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke;
      v33[3] = &unk_1E6DE6158;
      uint64_t v36 = &v37;
      id v34 = v10;
      uint64_t v35 = v9;
      IKXMLEnumerateChildElements((uint64_t)p_private, v33);
      uint64_t v27 = 0;
      xmlNodePtr v28 = &v27;
      uint64_t v29 = 0x3032000000;
      uint64_t v30 = __Block_byref_object_copy__22;
      uint64_t v31 = __Block_byref_object_dispose__22;
      id v32 = 0;
      uint64_t v14 = v38[3];
      if (v14)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke_92;
        v26[3] = &unk_1E6DE6180;
        v26[4] = &v27;
        IKXMLEnumerateChildElements(v14, v26);
        uint64_t v15 = v28[5];
      }
      else
      {
        uint64_t v15 = 0;
      }
      p_private = +[IKStyleFactory styleFactoryWithMarkup:v15 filterBlockedStyles:0];
      _Block_object_dispose(&v27, 8);

      _Block_object_dispose(&v37, 8);
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v42 = *MEMORY[0x1E4F28568];
      uint64_t v17 = [NSString stringWithFormat:@"Not a style sheet document (must be document): %@", v13];
      v43[0] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];

      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ITMLKitErrorDomain" code:203 userInfo:v18];
      p_private = 0;
    }
  }
  else
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ITMLKitErrorDomain" code:200 userInfo:0];
    p_private = 0;
  }
  if (!v16) {
    goto LABEL_14;
  }
  styleComposersByKeypath = v9;
  int v9 = 0;
LABEL_15:

  if (a5) {
    *a5 = v16;
  }

LABEL_18:
  return v9;
}

void __59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v11 = v5;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (int v7 = [v5 isEqualToString:@"head"], v6 = v11, !v7))
  {
    id v8 = [*(id *)(a1 + 32) objectForKey:v6];

    if (!v8)
    {
      int v9 = *(void **)(a1 + 32);
      xmlAttrPtr v10 = [(id)objc_opt_class() _templateTreeWithXMLTree:a2 parentNode:0];
      [v9 setObject:v10 forKey:v11];
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
}

xmlChar *__59__IKTemplateStyleSheet__initWithXMLDoc_templateName_error___block_invoke_92(uint64_t a1, const xmlNode *a2, void *a3, unsigned char *a4)
{
  result = (xmlChar *)[a3 isEqualToString:@"style"];
  if (result)
  {
    result = xmlNodeGetContent(a2);
    if (result)
    {
      id v8 = result;
      uint64_t v9 = [NSString stringWithUTF8String:result];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      result = (xmlChar *)((uint64_t (*)(xmlChar *))*MEMORY[0x1E4FBA9D0])(v8);
    }
    *a4 = 1;
  }
  return result;
}

+ (id)_templateTreeWithXMLTree:(_xmlNode *)a3 parentNode:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1E4E655C0]();
  id v8 = [a1 _templateNodeWithXMLNode:a3 parentNode:v6];
  uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__IKTemplateStyleSheet__templateTreeWithXMLTree_parentNode___block_invoke;
  v15[3] = &unk_1E6DE61A8;
  id v16 = v9;
  id v18 = a1;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  IKXMLEnumerateChildElements((uint64_t)a3, v15);
  [v10 setChildNodes:v11];
  long long v12 = v17;
  id v13 = v10;

  return v13;
}

void __60__IKTemplateStyleSheet__templateTreeWithXMLTree_parentNode___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[5];
  id v4 = (void *)a1[6];
  id v6 = (void *)a1[4];
  id v7 = a3;
  id v9 = [v4 _templateTreeWithXMLTree:a2 parentNode:v5];
  id v8 = objc_msgSend(v7, "ik_sharedInstance");

  [v6 setObject:v9 forKey:v8];
}

+ (id)_templateNodeWithXMLNode:(_xmlNode *)a3 parentNode:(id)a4
{
  uint64_t v5 = NSString;
  name = a3->name;
  id v7 = a4;
  id v8 = [v5 stringWithUTF8String:name];
  Prop = xmlGetProp(a3, (const xmlChar *)[@"class" UTF8String]);
  id v10 = (void (**)(xmlChar *))MEMORY[0x1E4FBA9D0];
  if (Prop)
  {
    id v11 = Prop;
    long long v12 = [NSString stringWithUTF8String:Prop];
    (*v10)(v11);
  }
  else
  {
    long long v12 = 0;
  }
  id v13 = xmlGetProp(a3, (const xmlChar *)[@"style" UTF8String]);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = [NSString stringWithUTF8String:v13];
    (*v10)(v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = [IKTemplateTreeNode alloc];
  id v17 = +[IKViewElementStyle elementStyleWithSelector:v12 inlineStyleString:v15 filterBlockedStyles:0];
  id v18 = [(IKTemplateTreeNode *)v16 initWithNodeName:v8 styleOverrides:v17 parentNode:v7];

  return v18;
}

- (id)_styleComposerForNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 styleComposer];

    if (!v6)
    {
      id v7 = [v5 parentNode];
      id v8 = [(IKTemplateStyleSheet *)self _styleComposerForNode:v7];

      id v9 = [v5 styleOverrides];
      id v10 = [v9 classDescriptorString];
      id v11 = [(IKTemplateStyleSheet *)self styleFactory];
      long long v12 = [v11 styleListForClassSelector:v10];

      id v13 = +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:0 parentStyleComposer:v8 styleList:v12 elementStyleOverrides:v9];
      [v5 setStyleComposer:v13];
    }
  }
  uint64_t v14 = [v5 styleComposer];

  return v14;
}

- (IKStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (NSDictionary)templateTree
{
  return self->_templateTree;
}

- (NSMutableDictionary)styleComposersByKeypath
{
  return self->_styleComposersByKeypath;
}

- (NSString)templateName
{
  return self->_templateName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_styleComposersByKeypath, 0);
  objc_storeStrong((id *)&self->_templateTree, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
}

+ (void)_styleSheetForTemplateName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_styleSheetForTemplateName:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 path];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1E2ACE000, a4, OS_LOG_TYPE_DEBUG, "Getting data for: %@", a1, 0xCu);
}

+ (void)_styleSheetForTemplateName:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end