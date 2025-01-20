@interface IKJSInspectorCSSAgent
+ (void)_evaluator:(id)a3 updateMediaStylesWithActiveStyles:(id)a4 inActiveStyles:(id)a5 defaultStyles:(id)a6 forRule:(id)a7 withMatch:(id)a8;
- (IKJSInspectorCSSAgent)initWithInspectorController:(id)a3;
- (IKJSInspectorController)controller;
- (id)_getMatchedStyleRulesForNode:(id)a3;
- (id)_getMatchedTemplateStylesForNode:(id)a3;
- (id)_styleNodeForStylesheetId:(id)a3;
- (id)_stylesheetBodyForStylesheetId:(id)a3;
- (id)_updatedInlineStyleForNode:(int)a3 withStyleString:(id)a4;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getAllStyleSheetsWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getMatchedStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 includePseudo:(BOOL *)a6 includeInherited:(BOOL *)a7;
- (void)getStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5;
- (void)getStyleSheetWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5;
- (void)getSupportedCSSPropertiesWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)mediaQueryResultDidChange;
- (void)resetStylesFromNode:(id)a3;
- (void)setStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5 text:(id)a6;
- (void)setStyleTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleId:(id)a5 text:(id)a6;
- (void)updateStylesheets;
@end

@implementation IKJSInspectorCSSAgent

- (IKJSInspectorCSSAgent)initWithInspectorController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKJSInspectorCSSAgent;
  v5 = [(IKJSInspectorCSSAgent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    inlineStyleMap = v5->_inlineStyleMap;
    v5->_inlineStyleMap = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    authorStylesheets = v5->_authorStylesheets;
    v5->_authorStylesheets = (NSMapTable *)v8;

    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v5;
}

- (void)updateStylesheets
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Unable to parse style nodes: %@", (uint8_t *)&v2, 0xCu);
}

- (void)mediaQueryResultDidChange
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_DEBUG, "Media Query Result Changed", v1, 2u);
}

- (void)resetStylesFromNode:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 setStyleComposer:0];
    inlineStyleMap = self->_inlineStyleMap;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "ITMLID"));
    [(NSMutableDictionary *)inlineStyleMap removeObjectForKey:v6];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = objc_msgSend(v4, "childNodesAsArray", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        [(IKJSInspectorCSSAgent *)self resetStylesFromNode:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v4 = (void (**)(id, __CFString *))a3;
  v5 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[IKJSInspectorCSSAgent disableWithErrorCallback:successCallback:](v5);
  }

  v4[2](v4, @"unsupported");
}

- (void)getMatchedStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 includePseudo:(BOOL *)a6 includeInherited:(BOOL *)a7
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id *, id *, id *))a4;
  if (!self->_styleFactory) {
    [(IKJSInspectorCSSAgent *)self updateStylesheets];
  }
  long long v12 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = [(IKJSInspectorCSSAgent *)self controller];
  long long v15 = [v14 nodeById:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [(IKJSInspectorCSSAgent *)self _getMatchedStyleRulesForNode:v15];
    [v13 addObjectsFromArray:v16];

    uint64_t v17 = [(IKJSInspectorCSSAgent *)self _getMatchedTemplateStylesForNode:v15];
    [v13 addObjectsFromArray:v17];

    id v18 = v15;
    v19 = [v18 parentStyleableElement];
    objc_opt_class();
    v29 = v11;
    id v30 = v10;
    v28 = v18;
    if (objc_opt_isKindOfClass())
    {
      v20 = objc_msgSend(v18, "parentStyleableElement", v18);

      if (v20)
      {
        do
        {
          v21 = [(IKJSInspectorCSSAgent *)self _getMatchedStyleRulesForNode:v20];
          v22 = objc_msgSend(MEMORY[0x1E4FB6BE8], "safe_initWithMatchedCSSRules:", v21);
          [v12 addObject:v22];
          v23 = [v20 parentStyleableElement];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v20 parentStyleableElement];
          }
          else
          {
            uint64_t v24 = 0;
          }

          v20 = (void *)v24;
        }
        while (v24);
      }
    }
    else
    {
    }
    uint64_t v11 = v29;
    id v10 = v30;
  }
  id v32 = (id)MEMORY[0x1E4F1CBF0];
  id v33 = v13;
  id v31 = v12;
  v11[2](v11, &v33, &v32, &v31);
  id v25 = v33;

  id v26 = v32;
  id v27 = v31;
}

- (void)getInlineStylesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v7 = (void (**)(id, id *, void))a4;
  uint64_t v8 = [(IKJSInspectorCSSAgent *)self _updatedInlineStyleForNode:v5 withStyleString:0];
  id v10 = v8;
  v7[2](v7, &v10, 0);

  id v9 = v10;
}

- (void)getComputedStyleForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  if (!self->_styleFactory) {
    [(IKJSInspectorCSSAgent *)self updateStylesheets];
  }
  id v10 = [(IKJSInspectorCSSAgent *)self controller];
  uint64_t v11 = [v10 nodeById:a5];

  v34 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v9;
    id v33 = v8;
    uint64_t v12 = [v11 getAttribute:@"style"];
    id v30 = [v11 getAttribute:@"class"];
    id v31 = (void *)v12;
    v29 = +[IKViewElementStyle elementStyleWithSelector:inlineStyleString:filterBlockedStyles:](IKViewElementStyle, "elementStyleWithSelector:inlineStyleString:filterBlockedStyles:");
    uint64_t v13 = -[IKViewElementStyleFactory styleComposerForElement:elementStyleOverrides:](self->_styleFactory, "styleComposerForElement:elementStyleOverrides:", v11);
    long long v14 = [(IKJSInspectorCSSAgent *)self controller];
    v28 = (void *)v13;
    long long v15 = [v14 styleFromComposer:v13];

    id v27 = v15;
    v16 = [v15 styleDict];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v17 = [v16 allKeys];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v23 = [v16 valueForKey:v22];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = (void *)MEMORY[0x1E4FB6BC8];
            id v25 = [v23 stringValue];
            id v26 = objc_msgSend(v24, "safe_initWithName:value:", v22, v25);

            [v34 addObject:v26];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v19);
    }

    id v9 = v32;
    id v8 = v33;
  }
  v9[2](v9, v34);
}

- (void)getAllStyleSheetsWithErrorCallback:(id)a3 successCallback:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!self->_styleFactory) {
    [(IKJSInspectorCSSAgent *)self updateStylesheets];
  }
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = v8;
  if (self->_templateStylesheetHeader) {
    objc_msgSend(v8, "addObject:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(NSMapTable *)self->_authorStylesheets keyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 addObject:*(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  v7[2](v7, v9);
}

- (void)getStyleSheetWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5
{
  id v10 = (void (**)(id, __CFString *))a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = [(IKJSInspectorCSSAgent *)self _stylesheetBodyForStylesheetId:a5];
  if (v9) {
    v8[2](v8, v9);
  }
  else {
    v10[2](v10, @"Unable to find stylesheet");
  }
}

- (void)getStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5
{
  uint64_t v12 = (void (**)(id, __CFString *))a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = [(IKJSInspectorCSSAgent *)self _stylesheetBodyForStylesheetId:a5];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 text];
    v8[2](v8, v11);
  }
  else
  {
    v12[2](v12, @"Unable to find stylesheet");
  }
}

- (void)setStyleSheetTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleSheetId:(id)a5 text:(id)a6
{
  uint64_t v14 = (void (**)(id, __CFString *))a3;
  id v10 = (void (**)(void))a4;
  id v11 = a6;
  uint64_t v12 = [(IKJSInspectorCSSAgent *)self _styleNodeForStylesheetId:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 setTextContent:v11];
    v10[2](v10);
  }
  else
  {
    v14[2](v14, @"Unable to find stylesheet");
  }
}

- (void)setStyleTextWithErrorCallback:(id)a3 successCallback:(id)a4 styleId:(id)a5 text:(id)a6
{
  v49 = (void (**)(id, __CFString *))a3;
  id v10 = (void (**)(id, void *))a4;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = [v12 styleSheetId];
  uint64_t v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  long long v15 = [v11 stringByTrimmingCharactersInSet:v14];

  if ([v13 isEqualToString:@"inline"])
  {
    long long v16 = [(IKJSInspectorCSSAgent *)self controller];
    int v17 = [v12 ordinal];

    long long v18 = [v16 nodeById:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = -[IKJSInspectorCSSAgent _updatedInlineStyleForNode:withStyleString:](self, "_updatedInlineStyleForNode:withStyleString:", [v18 ITMLID], v15);
      [v18 setAttribute:@"style" :v15];
      uint64_t v20 = [(IKJSInspectorCSSAgent *)self controller];
      v21 = [v20 inspector];
      uint64_t v22 = [v21 configuration];
      v23 = [v22 domEventDispatcher];

      objc_msgSend(v23, "safe_attributeModifiedWithNodeId:name:value:", objc_msgSend(v18, "ITMLID"), @"style", v15);
      v10[2](v10, v19);

LABEL_10:
      goto LABEL_13;
    }
  }
  else
  {
    long long v18 = [(IKJSInspectorCSSAgent *)self _stylesheetBodyForStylesheetId:v13];
    unsigned int v24 = [v12 ordinal];

    if (v18)
    {
      id v25 = [v18 rules];
      unint64_t v26 = [v25 count];

      if ((v24 & 0x80000000) == 0 && v26 > (int)v24)
      {
        id v27 = [v18 rules];
        uint64_t v47 = v24;
        v28 = objc_msgSend(v27, "objectAtIndex:");

        v48 = v28;
        v29 = [v28 style];
        id v30 = [v29 range];
        id v31 = objc_msgSend(v18, "ik_textNewLineIndexSet");
        uint64_t v32 = objc_msgSend(v30, "ik_rangeWithNewLineIndexSet:", v31);
        uint64_t v34 = v33;

        long long v35 = [(IKJSInspectorCSSAgent *)self _styleNodeForStylesheetId:v13];
        long long v36 = v35;
        if (v35 && v32 != 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v37 = [v35 textContent];
          v46 = (void *)[v37 mutableCopy];

          objc_msgSend(v46, "replaceCharactersInRange:withString:", v32, v34, v15);
          [v36 setTextContent:v46];
          [(IKJSInspectorCSSAgent *)self updateStylesheets];
          long long v38 = [v18 rules];
          v39 = [v38 objectAtIndex:v47];

          uint64_t v40 = [(IKJSInspectorCSSAgent *)self controller];
          v41 = [v40 inspector];
          v42 = [v41 configuration];
          v43 = [v42 cssEventDispatcher];

          v44 = [v18 styleSheetId];
          objc_msgSend(v43, "safe_styleSheetChangedWithStyleSheetId:", v44);

          v45 = [v39 style];
          v10[2](v10, v45);

          goto LABEL_10;
        }
      }
    }
  }

  v49[2](v49, @"Unable to find stylesheet");
LABEL_13:
}

- (void)getSupportedCSSPropertiesWithErrorCallback:(id)a3 successCallback:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = (void (**)(id, void *))a4;
  id v4 = +[IKViewElementStyle registeredStyles];
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = v4;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v9 = +[IKViewElementStyle propertiesForStyleName:v8];
        id v10 = [v9 objectForKey:@"IKViewElementStyleAliasesKey"];
        id v11 = [v9 objectForKey:@"IKViewElementStyleLonghandKey"];
        id v12 = objc_msgSend(MEMORY[0x1E4FB6BF8], "safe_initWithName:", v8);
        uint64_t v13 = [v9 objectForKey:@"IKViewElementStyleInheritedKey"];
        objc_msgSend(v12, "setInherited:", objc_msgSend(v13, "BOOLValue"));

        if (v10) {
          [v12 setAliases:v10];
        }
        if (v11) {
          [v12 setLonghands:v11];
        }
        [v18 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  v15[2](v15, v18);
}

- (id)_styleNodeForStylesheetId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IKJSInspectorCSSAgent *)self controller];
  uint64_t v6 = [v5 activeDocument];
  v7 = [v6 nodesForXPath:@"/document/head/style" error:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "ITMLID", (void)v15);
        if (v13 == [v4 integerValue])
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_stylesheetBodyForStylesheetId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_authorStylesheets keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 styleSheetId];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v13 = [(NSMapTable *)self->_authorStylesheets objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)_updatedInlineStyleForNode:(int)a3 withStyleString:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(IKJSInspectorCSSAgent *)self controller];
  uint64_t v8 = [v7 nodeById:(int)v4];

  inlineStyleMap = self->_inlineStyleMap;
  uint64_t v10 = [NSNumber numberWithInt:v4];
  id v11 = [(NSMutableDictionary *)inlineStyleMap objectForKey:v10];
  int v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB6C40], "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", 0, 0, 0, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = v13;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = objc_msgSend(MEMORY[0x1E4FB6C50], "safe_initWithStyleSheetId:ordinal:", @"inline", objc_msgSend(v8, "ITMLID"));
    [v14 setStyleId:v15];

    long long v16 = objc_msgSend(MEMORY[0x1E4FB6C38], "ik_emptySourceRange");
    [v14 setRange:v16];

    if ([v6 length])
    {
      id v17 = v6;
    }
    else
    {
      id v17 = [v8 getAttribute:@"style"];
    }
    long long v18 = v17;
    long long v19 = objc_msgSend(MEMORY[0x1E4FB6C38], "ik_newLineIndexSetForStyleMarkup:", v17);
    if (v18 && ([v18 isEqualToString:&stru_1F3E09950] & 1) == 0)
    {
      uint64_t v20 = [v8 nodeName];
      long long v21 = +[IKViewElementStyle elementStyleWithSelector:v20 inlineStyleString:v18 filterBlockedStyles:0 inlineStyleRangeCorrect:1];

      long long v22 = (void *)MEMORY[0x1E4FB6C40];
      v23 = [v21 cssRule];
      uint64_t v24 = [v23 declarationList];
      uint64_t v25 = objc_msgSend(v22, "ik_cssStyleFromDeclarationList:forStyleMarkup:withNewLineIndexSet:existingStyle:", v24, v18, v19, v14);

      uint64_t v14 = (void *)v25;
    }
  }
  unint64_t v26 = self->_inlineStyleMap;
  id v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "ITMLID"));
  [(NSMutableDictionary *)v26 setObject:v14 forKey:v27];

  return v14;
}

- (id)_getMatchedTemplateStylesForNode:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v26 = [(IKViewElementStyleFactory *)self->_styleFactory styleComposerForElement:v4 elementStyleOverrides:0];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v40 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    id v6 = [v26 consolidatedDefaultStyleList];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v11 = [v10 styles];
          if (v11)
          {
            int v12 = [v10 styles];
            [v5 addObjectsFromArray:v12];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v7);
    }

    if ([v5 count])
    {
      id v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      long long v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      long long v16 = objc_msgSend(v4, "ik_templateElementCSSSelectorList");
      objc_initWeak(&location, self);
      id v17 = [(IKJSInspectorCSSAgent *)self controller];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke;
      v29[3] = &unk_1E6DE5E10;
      objc_copyWeak(&v35, &location);
      id v30 = v5;
      id v18 = v16;
      id v31 = v18;
      id v19 = v13;
      id v32 = v19;
      id v20 = v14;
      id v33 = v20;
      id v21 = v15;
      id v34 = v21;
      [v17 evaluateMediaQuery:v29];

      unsigned int v28 = 0;
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_44(v22, v20, &v28);
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_44(v23, v21, &v28);
      __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_44(v24, v19, &v28);
      [v27 addObjectsFromArray:v20];
      [v27 addObjectsFromArray:v21];
      [v27 addObjectsFromArray:v19];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
  }

  return v27;
}

void __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) cssRule];
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB6C08], "ik_cssRuleForRule:withOrdinal:forStyleSheetHeader:forStyleMarkup:withNewLineIndexSet:", v9, 0, WeakRetained[2], 0, 0);
          [v10 setSelectorList:*(void *)(a1 + 40)];
          id v11 = objc_msgSend(v10, "ik_ruleMatchForClassSelectors:andIdSelector:", 0, 0);
          [v11 setMatchingSelectors:&unk_1F3E3DAD0];
          [(id)objc_opt_class() _evaluator:v3 updateMediaStylesWithActiveStyles:*(void *)(a1 + 48) inActiveStyles:*(void *)(a1 + 56) defaultStyles:*(void *)(a1 + 64) forRule:v9 withMatch:v11];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

void __58__IKJSInspectorCSSAgent__getMatchedTemplateStylesForNode___block_invoke_44(uint64_t a1, void *a2, unsigned int *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 rule];
        id v11 = [v10 style];
        int v12 = [v11 styleId];
        [v12 setOrdinal:*a3];

        long long v13 = [v9 rule];
        long long v14 = [v13 ruleId];
        [v14 setOrdinal:*a3];

        ++*a3;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)_getMatchedStyleRulesForNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSMapTable *)self->_authorStylesheets count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    objc_opt_class();
    id v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v4 getAttribute:@"class"];
      id v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v9 = [v10 componentsSeparatedByCharactersInSet:v11];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [v4 getAttribute:@"id"];
    }
    else
    {
      int v12 = 0;
    }
    objc_initWeak(&location, self);
    long long v13 = [(IKJSInspectorCSSAgent *)self controller];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__IKJSInspectorCSSAgent__getMatchedStyleRulesForNode___block_invoke;
    v20[3] = &unk_1E6DE5E10;
    objc_copyWeak(&v26, &location);
    id v14 = v9;
    id v21 = v14;
    id v15 = v12;
    id v22 = v15;
    id v16 = v6;
    id v23 = v16;
    id v17 = v7;
    id v24 = v17;
    id v18 = v8;
    id v25 = v18;
    [v13 evaluateMediaQuery:v20];

    [v5 addObjectsFromArray:v17];
    [v5 addObjectsFromArray:v18];
    [v5 addObjectsFromArray:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __54__IKJSInspectorCSSAgent__getMatchedStyleRulesForNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [WeakRetained[4] objectEnumerator];
    uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v8 = [v7 rules];
          if ([v8 count])
          {
            unint64_t v9 = 0;
            do
            {
              uint64_t v10 = [v8 objectAtIndex:v9];
              id v11 = objc_msgSend(v10, "ik_ruleMatchForClassSelectors:andIdSelector:", *(void *)(a1 + 32), *(void *)(a1 + 40));

              int v12 = objc_msgSend(v7, "ik_ruleList");
              long long v13 = [v12 ruleAtIndex:v9];

              [(id)objc_opt_class() _evaluator:v3 updateMediaStylesWithActiveStyles:*(void *)(a1 + 48) inActiveStyles:*(void *)(a1 + 56) defaultStyles:*(void *)(a1 + 64) forRule:v13 withMatch:v11];
              ++v9;
            }
            while (v9 < [v8 count]);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v16);
    }
  }
}

+ (void)_evaluator:(id)a3 updateMediaStylesWithActiveStyles:(id)a4 inActiveStyles:(id)a5 defaultStyles:(id)a6 forRule:(id)a7 withMatch:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  long long v19 = [v18 matchingSelectors];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = [v17 mediaQuery];
      uint64_t v22 = +[IKStyleMediaQuery mediaQueryListWithCSSMediaQuery:v21];
      int v23 = [v13 evaluateStyleMediaQueryList:v22];

      if (v23)
      {
        id v24 = v14;
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v25 = objc_msgSend(v18, "rule", 0);
        id v26 = [v25 style];
        id v27 = [v26 cssProperties];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v33;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v33 != v30) {
                objc_enumerationMutation(v27);
              }
              [*(id *)(*((void *)&v32 + 1) + 8 * v31++) setStatus:2];
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v29);
        }

        id v24 = v15;
      }
    }
    else
    {
      id v24 = v16;
    }
    [v24 addObject:v18];
  }
}

- (IKJSInspectorController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKJSInspectorController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_authorStylesheets, 0);
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_templateStylesheetHeader, 0);
  objc_storeStrong((id *)&self->_inlineStyleMap, 0);
}

- (void)disableWithErrorCallback:(os_log_t)log successCallback:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_DEBUG, "disableWithErrorCallback", v1, 2u);
}

@end