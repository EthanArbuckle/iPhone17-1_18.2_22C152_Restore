@interface IKViewElement
+ (BOOL)shouldParseChildDOMElements;
+ (id)DOMEventTypeNameMap;
+ (id)_eventXMLNameMap;
+ (id)effectiveChildDOMElementsForDOMElement:(id)a3;
+ (id)supportedFeatures;
+ (id)supportedFeaturesForElementName:(id)a3;
+ (unint64_t)evaluateElementUpdateType:(id)a3;
+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5;
+ (void)willParseDOMElement:(id)a3;
- (BOOL)_elevateToImplicitUpdateType:(unint64_t)a3;
- (BOOL)areChildrenBound;
- (BOOL)canProxyUnloadedChildElement:(id)a3;
- (BOOL)didUpdateAutoHighlightIdentifier;
- (BOOL)isDisabled;
- (BOOL)isHidden;
- (BOOL)isImpressionable;
- (BOOL)isPartOfPrototypeElement;
- (BOOL)isProxyElement;
- (BOOL)prototypesUpdated;
- (IKAppDocument)appDocument;
- (IKChangeSet)unfilteredChildrenChangeSet;
- (IKDOMBindingController)bindingController;
- (IKDataBinding)binding;
- (IKViewElement)init;
- (IKViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (IKViewElement)initWithOriginalElement:(id)a3;
- (IKViewElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5;
- (IKViewElement)parent;
- (IKViewElementStyle)style;
- (IKViewElementStyleComposer)styleComposer;
- (NSArray)aliases;
- (NSArray)children;
- (NSArray)features;
- (NSArray)unfilteredChildren;
- (NSDictionary)attributes;
- (NSDictionary)dataDictionary;
- (NSDictionary)impressionableAttributes;
- (NSMutableDictionary)metadataDict;
- (NSMutableSet)activeSingularEvents;
- (NSString)accessibilityText;
- (NSString)autoHighlightIdentifier;
- (NSString)classSelector;
- (NSString)debugDescription;
- (NSString)elementID;
- (NSString)elementName;
- (NSString)itmlID;
- (id)applyUpdatesWithElement:(id)a3;
- (id)childElementWithType:(unint64_t)a3;
- (id)childElementsWithType:(unint64_t)a3;
- (id)childImageElementWithType:(unint64_t)a3;
- (id)childTextElementWithStyle:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)proxyElementForLoadedChildElement:(id)a3;
- (unint64_t)_updateSubtreeWithElement:(id)a3;
- (unint64_t)elementType;
- (unint64_t)implicitUpdateType;
- (unint64_t)updateType;
- (void)adoptElement:(id)a3;
- (void)appDocumentDidMarkStylesDirty;
- (void)configureUpdatesWithElement:(id)a3;
- (void)dealloc;
- (void)dispatchEvent:(id)a3 eventAttribute:(id)a4 canBubble:(BOOL)a5 isCancelable:(BOOL)a6 extraInfo:(id)a7 completionBlock:(id)a8;
- (void)dispatchEventOfType:(unint64_t)a3 canBubble:(BOOL)a4 isCancelable:(BOOL)a5 extraInfo:(id)a6 completionBlock:(id)a7;
- (void)disperseUpdateType:(unint64_t)a3;
- (void)performImplicitUpdates:(id)a3;
- (void)resetImplicitUpdates;
- (void)resetProperty:(unint64_t)a3;
- (void)resetUpdates;
- (void)setActiveSingularEvents:(id)a3;
- (void)setAppDocument:(id)a3;
- (void)setAutoHighlightIdentifier:(id)a3;
- (void)setDataDictionary:(id)a3;
- (void)setDidUpdateAutoHighlightIdentifier:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setImpressionable:(BOOL)a3;
- (void)setMetadataDict:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setParent:(id)a3;
- (void)setStyleComposer:(id)a3;
- (void)setUpdateType:(unint64_t)a3;
- (void)updateWithActualElement:(id)a3;
@end

@implementation IKViewElement

+ (void)willParseDOMElement:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 jsNodeData];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __37__IKViewElement_willParseDOMElement___block_invoke;
  v47[3] = &unk_1E6DE6888;
  id v5 = v3;
  id v48 = v5;
  uint64_t v6 = MEMORY[0x1E4E65800](v47);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __37__IKViewElement_willParseDOMElement___block_invoke_2;
  v45[3] = &unk_1E6DE68B0;
  id v46 = v5;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __37__IKViewElement_willParseDOMElement___block_invoke_3;
  v43[3] = &unk_1E6DE6018;
  id v7 = v46;
  id v44 = v7;
  if ((*(unsigned int (**)(uint64_t, __CFString *, void *, void *))(v6 + 16))(v6, @"prototypes", v45, v43))
  {
    [v4 setPrototypesResolved:0];
    objc_msgSend(v4, "setUpdated:", objc_msgSend(v4, "containsUpdates"));
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __37__IKViewElement_willParseDOMElement___block_invoke_4;
  v41[3] = &unk_1E6DE68B0;
  id v42 = v7;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __37__IKViewElement_willParseDOMElement___block_invoke_5;
  v39[3] = &unk_1E6DE6018;
  id v30 = v42;
  id v40 = v30;
  if ((*(unsigned int (**)(uint64_t, __CFString *, void *, void *))(v6 + 16))(v6, @"rules", v41, v39))
  {
    [v4 setRulesParsed:0];
    objc_msgSend(v4, "setUpdated:", objc_msgSend(v4, "containsUpdates"));
  }
  if (![v4 isDataResolved]
    || ![v4 arePrototypesResolved]
    || ([v4 areRulesParsed] & 1) == 0)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v8 = [v30 childElements];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (([v4 isDataResolved] & 1) == 0)
          {
            v14 = [v13 jsNodeData];
            [v14 setDataResolved:0];
          }
          if (([v4 arePrototypesResolved] & 1) == 0)
          {
            v15 = [v13 jsNodeData];
            [v15 setPrototypesResolved:0];
          }
          if (([v4 areRulesParsed] & 1) == 0)
          {
            v16 = [v13 jsNodeData];
            [v16 setRulesParsed:0];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v50 count:16];
      }
      while (v10);
    }
  }
  +[IKDOMBindingController prepareForDOMElement:](IKDOMBindingController, "prepareForDOMElement:", v30, v6);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = [v30 childElements];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v23 = [v22 elementName];
        int v24 = [v23 isEqualToString:@"fragment"];

        if (v24)
        {
          +[IKViewElement willParseDOMElement:v22];
          v25 = [v22 jsNodeData];
          if ([v25 isUpdated])
          {
          }
          else
          {
            v26 = [v22 jsNodeData];
            int v27 = [v26 isChildrenUpdated];

            if (!v27) {
              continue;
            }
          }
          v28 = [v30 jsNodeData];
          [v28 setChildrenUpdated:1];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v49 count:16];
    }
    while (v19);
  }
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = a3;
  uint64_t v9 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "childElements", 0);
  id v11 = (id)[v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v15 = [v14 elementName];
        int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v17 = v8[2](v8);
  uint64_t v18 = [v11 getAttribute:@"itmlID"];
  uint64_t v19 = (void *)v18;
  uint64_t v20 = &stru_1F3E09950;
  if (v18) {
    uint64_t v20 = (__CFString *)v18;
  }
  v21 = v20;

  if (v17)
  {
    if ([v17 isEqualToString:v21])
    {
      v22 = [v11 jsNodeData];
      uint64_t v23 = [v22 containsUpdates];
    }
    else
    {
      uint64_t v23 = 1;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  v9[2](v9, v21);

  return v23;
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_prototypesID");
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_setPrototypesID:", a2);
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_rulesID");
}

uint64_t __37__IKViewElement_willParseDOMElement___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "ikve_setRulesID:", a2);
}

+ (id)effectiveChildDOMElementsForDOMElement:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 childElements];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "elementName", (void)v17);
        int v13 = [v12 isEqualToString:@"fragment"];

        if (v13)
        {
          v14 = [a1 effectiveChildDOMElementsForDOMElement:v11];
          [v5 addObjectsFromArray:v14];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v5 copy];
  return v15;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 1;
}

+ (id)supportedFeatures
{
  return 0;
}

+ (id)supportedFeaturesForElementName:(id)a3
{
  id v3 = objc_opt_class();
  return (id)[v3 supportedFeatures];
}

+ (unint64_t)updateTypeForChangeInAttribute:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  if (objc_msgSend(a3, "isEqualToString:", @"autoHighlight", a4, a5)) {
    return 1;
  }
  else {
    return 4;
  }
}

- (IKViewElement)init
{
  return 0;
}

- (IKViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v94 = a5;
  v109.receiver = self;
  v109.super_class = (Class)IKViewElement;
  uint64_t v10 = [(IKViewElement *)&v109 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_parent, v9);
    uint64_t v12 = +[IKDOMBindingController domBindingControllerForDOMElement:v8];
    bindingController = v11->_bindingController;
    v11->_bindingController = (IKDOMBindingController *)v12;

    uint64_t v14 = [(IKDOMBindingController *)v11->_bindingController binding];
    binding = v11->_binding;
    v11->_binding = (IKDataBinding *)v14;

    int v16 = [(IKDOMBindingController *)v11->_bindingController dataItem];
    uint64_t v17 = [v16 dataDictionary];
    dataDictionary = v11->_dataDictionary;
    v11->_dataDictionary = (NSDictionary *)v17;

    v11->_isPartOfPrototypeElement = [v8 _isPartOfPrototypeElement];
    long long v19 = [v8 jsNodeData];
    v11->_updateType = +[IKViewElement evaluateElementUpdateType:v19];
    long long v20 = [v8 _attributes];
    v21 = (void *)[v20 mutableCopy];

    v92 = objc_msgSend(v21, "objectForKeyedSubscript:");
    v93 = v8;
    uint64_t v22 = [v8 getAttribute:@"class"];
    uint64_t v23 = [v22 copy];
    classSelector = v11->_classSelector;
    v11->_classSelector = (NSString *)v23;

    if (![(IKViewElement *)v11 isPartOfPrototypeElement]
      && ([v19 isAutoHighlightRead] & 1) == 0)
    {
      uint64_t v25 = [v21 objectForKeyedSubscript:@"autoHighlight"];
      autoHighlightIdentifier = v11->_autoHighlightIdentifier;
      v11->_autoHighlightIdentifier = (NSString *)v25;

      v11->_didUpdateAutoHighlightIdentifier = 1;
      [v19 setAutoHighlightRead:1];
    }
    v96 = v19;
    uint64_t v27 = [v21 objectForKeyedSubscript:@"id"];
    elementID = v11->_elementID;
    v11->_elementID = (NSString *)v27;

    uint64_t v29 = [v21 objectForKeyedSubscript:@"itmlID"];
    itmlID = v11->_itmlID;
    v11->_itmlID = (NSString *)v29;

    uint64_t v31 = [v21 objectForKeyedSubscript:@"accessibilityText"];
    accessibilityText = v11->_accessibilityText;
    v11->_accessibilityText = (NSString *)v31;

    if (![(IKViewElement *)v11 isPartOfPrototypeElement])
    {
      long long v33 = [v21 objectForKey:@"disabled"];
      long long v34 = v33;
      if (v33) {
        char v35 = [v33 BOOLValue];
      }
      else {
        char v35 = [v9 isDisabled];
      }
      v11->_disabled = v35;
      [v21 removeObjectForKey:@"disabled"];
    }
    id v91 = v9;
    v11->_impressionable = 0;
    v95 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v36 = v21;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v113 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v106 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          if ([v41 hasPrefix:@"data-metrics"])
          {
            v11->_impressionable = 1;
            id v42 = [v36 objectForKeyedSubscript:v41];
            [v95 setObject:v42 forKey:v41];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v105 objects:v113 count:16];
      }
      while (v38);
    }

    uint64_t v43 = [v95 copy];
    impressionableAttributes = v11->_impressionableAttributes;
    v11->_impressionableAttributes = (NSDictionary *)v43;

    [v36 removeObjectForKey:v89];
    [v36 removeObjectForKey:@"itmlID"];
    [v36 removeObjectForKey:@"autoHighlight"];
    [v36 removeObjectForKey:@"style"];
    if ([v36 count])
    {
      uint64_t v45 = [v36 copy];
      attributes = v11->_attributes;
      v11->_attributes = (NSDictionary *)v45;
    }
    id v8 = v93;
    v47 = [v93 nodeName];
    uint64_t v48 = objc_msgSend(v47, "ik_sharedInstance");
    elementName = v11->_elementName;
    v11->_elementName = (NSString *)v48;

    v11->_elementType = [v94 elementTypeByTagName:v11->_elementName];
    v50 = (void *)MEMORY[0x1E4E655C0]();
    id v51 = +[IKViewElementStyle elementStyleWithSelector:v11->_classSelector inlineStyleString:v92 filterBlockedStyles:1];
    v52 = objc_msgSend(v93, "domb_boundCSSRule");

    if (v52)
    {
      v53 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        -[IKViewElement initWithDOMElement:parent:elementFactory:](v11, (uint64_t)v93, v53);
      }

      v54 = v11->_classSelector;
      v55 = objc_msgSend(v93, "domb_boundCSSRule");
      v56 = +[IKViewElementStyle elementStyleWithSelector:v54 cssRule:v55 filterBlockedStyles:1];

      if (v51)
      {
        v57 = v11->_classSelector;
        v112[0] = v51;
        v112[1] = v56;
        v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
        uint64_t v59 = +[IKViewElementStyle elementStyleWithSelector:v57 aggregatingStyles:v58];

        id v51 = (id)v59;
      }
      else
      {
        id v51 = v56;
      }
    }
    v60 = [v94 styleFactory];
    uint64_t v61 = [v60 styleComposerForElement:v11 elementStyleOverrides:v51];
    styleComposer = v11->_styleComposer;
    v11->_styleComposer = (IKViewElementStyleComposer *)v61;

    if ([(id)objc_opt_class() shouldParseChildDOMElements])
    {
      v63 = +[IKViewElement effectiveChildDOMElementsForDOMElement:v93];
      v64 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v63, "count"));
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v65 = v63;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v101 objects:v111 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v102;
        do
        {
          for (uint64_t j = 0; j != v67; ++j)
          {
            if (*(void *)v102 != v68) {
              objc_enumerationMutation(v65);
            }
            uint64_t v70 = *(void *)(*((void *)&v101 + 1) + 8 * j);
            if ([(id)objc_opt_class() shouldParseChildDOMElement:v70])
            {
              v71 = [v94 elementForDOMElement:v70 parent:v11];
              if (v71) {
                [v64 addObject:v71];
              }
            }
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v101 objects:v111 count:16];
        }
        while (v67);
      }

      if ([v64 count])
      {
        uint64_t v72 = [v64 copy];
        unfilteredChildren = v11->_unfilteredChildren;
        v11->_unfilteredChildren = (NSArray *)v72;
      }
      else
      {
        unfilteredChildren = v11->_unfilteredChildren;
        v11->_unfilteredChildren = 0;
      }
    }
    v74 = objc_opt_class();
    v75 = [(IKViewElement *)v11 elementName];
    v76 = [v74 supportedFeaturesForElementName:v75];

    if ([v76 count])
    {
      v77 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v76, "count"));
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      v90 = v76;
      id v78 = v76;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v97 objects:v110 count:16];
      if (!v79) {
        goto LABEL_56;
      }
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v98;
      while (1)
      {
        for (uint64_t k = 0; k != v80; ++k)
        {
          if (*(void *)v98 != v81) {
            objc_enumerationMutation(v78);
          }
          uint64_t v83 = *(void *)(*((void *)&v97 + 1) + 8 * k);
          v84 = [v96 featureForName:v83];
          if (!v84)
          {
            uint64_t v85 = +[IKDOMFeatureFactory featureForName:v83 withDOMNode:v93];
            if (!v85) {
              continue;
            }
            v84 = (void *)v85;
            [v96 setFeature:v85 forName:v83];
          }
          [v77 addObject:v84];
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v97 objects:v110 count:16];
        if (!v80)
        {
LABEL_56:

          id v8 = v93;
          v76 = v90;
          goto LABEL_58;
        }
      }
    }
    v77 = 0;
LABEL_58:
    uint64_t v86 = [v77 copy];
    features = v11->_features;
    v11->_features = (NSArray *)v86;

    id v9 = v91;
  }

  return v11;
}

- (IKViewElement)initWithPrototypeElement:(id)a3 parent:(id)a4 appDataItem:(id)a5
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (IKAppDataItem *)a5;
  v139.receiver = self;
  v139.super_class = (Class)IKViewElement;
  id v11 = [(IKViewElement *)&v139 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_isProxyElement = 1;
    objc_storeWeak((id *)&v11->_parent, v9);
    int v13 = [v8 classSelector];
    uint64_t v14 = [v13 copy];
    classSelector = v12->_classSelector;
    v12->_classSelector = (NSString *)v14;

    bindingController = v12->_bindingController;
    v12->_bindingController = 0;

    uint64_t v17 = [v8 binding];
    binding = v12->_binding;
    v12->_binding = (IKDataBinding *)v17;

    v122 = v10;
    uint64_t v19 = [(IKAppDataItem *)v10 dataDictionary];
    dataDictionary = v12->_dataDictionary;
    v12->_dataDictionary = (NSDictionary *)v19;

    elementID = v12->_elementID;
    v12->_elementID = 0;

    itmlID = v12->_itmlID;
    v12->_itmlID = 0;

    uint64_t v23 = [v8 accessibilityText];
    accessibilityText = v12->_accessibilityText;
    v12->_accessibilityText = (NSString *)v23;

    uint64_t v25 = [v8 elementName];
    elementName = v12->_elementName;
    v12->_elementName = (NSString *)v25;

    v12->_elementType = [v8 elementType];
    features = v12->_features;
    v12->_features = 0;

    long long v28 = [v8 attributes];
    uint64_t v29 = (void *)[v28 mutableCopy];
    uint64_t v30 = v29;
    id v114 = v8;
    id v111 = v9;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    v119 = v31;

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v32 = [(IKDataBinding *)v12->_binding keyValues];
    long long v33 = [v32 allKeys];

    uint64_t v34 = [v33 countByEnumeratingWithState:&v135 objects:v144 count:16];
    v121 = v12;
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v136;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v136 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          if ([v38 characterAtIndex:0] == 64)
          {
            uint64_t v39 = [(IKDataBinding *)v12->_binding keyValues];
            id v40 = [v39 objectForKeyedSubscript:v38];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v41 = [(IKAppDataItem *)v122 valueForPropertyPath:v40];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v42 = [v41 stringValue];

                v41 = (void *)v42;
                uint64_t v12 = v121;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v43 = [v38 substringFromIndex:1];
                [v119 setObject:v41 forKeyedSubscript:v43];
              }
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v135 objects:v144 count:16];
      }
      while (v35);
    }

    v112 = [v8 styleComposer];
    v115 = objc_opt_new();
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v44 = [(IKDataBinding *)v12->_binding keyValues];
    uint64_t v45 = [v44 allKeys];

    uint64_t v46 = [v45 countByEnumeratingWithState:&v131 objects:v143 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v132;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v132 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v131 + 1) + 8 * j);
          if ([v50 characterAtIndex:0] == 35)
          {
            id v51 = [v50 substringFromIndex:1];
            v52 = [(IKDataBinding *)v12->_binding keyValues];
            v53 = [v52 objectForKeyedSubscript:v50];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v54 = [(IKAppDataItem *)v122 valueForPropertyPath:v53];
              v55 = +[IKCSSFactory createDeclarationForName:v51 withObject:v54];
              if (v55) {
                [v115 addDeclaration:v55];
              }

              uint64_t v12 = v121;
            }
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v131 objects:v143 count:16];
      }
      while (v47);
    }

    if ([v115 count])
    {
      v56 = objc_opt_new();
      [v56 setDeclarationList:v115];
      v57 = +[IKViewElementStyle elementStyleWithSelector:v12->_classSelector cssRule:v56 filterBlockedStyles:1];
      uint64_t v58 = [v112 elementStyleOverrides];
      if (v58)
      {
        uint64_t v59 = (void *)v58;
        v60 = v12->_classSelector;
        v142[0] = v58;
        v142[1] = v57;
        uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
        id v62 = +[IKViewElementStyle elementStyleWithSelector:v60 aggregatingStyles:v61];
      }
      else
      {
        id v62 = v57;
      }
      id v65 = [v112 defaultStyleComposer];
      uint64_t v66 = [v112 parentStyleComposer];
      uint64_t v67 = [v112 styleList];
      v63 = +[IKViewElementStyleComposer styleComposerWithDefaultStyleComposer:v65 parentStyleComposer:v66 styleList:v67 elementStyleOverrides:v62];

      v64 = v111;
      uint64_t v12 = v121;
    }
    else
    {
      v64 = v111;
      v63 = v112;
    }
    objc_storeStrong((id *)&v12->_styleComposer, v63);
    if (([v64 isProxyElement] & 1) == 0)
    {
      uint64_t v68 = [(IKAppDataItem *)v122 identifier];
      [v119 setObject:v68 forKeyedSubscript:@"itemID"];
    }
    v69 = [v119 objectForKeyedSubscript:@"disabled"];
    v110 = v69;
    if (v69) {
      char v70 = [v69 BOOLValue];
    }
    else {
      char v70 = [v64 isDisabled];
    }
    v113 = v63;
    v12->_disabled = v70;
    [v119 removeObjectForKey:@"disabled"];
    uint64_t v71 = [v119 objectForKeyedSubscript:@"autoHighlight"];
    autoHighlightIdentifier = v12->_autoHighlightIdentifier;
    v12->_autoHighlightIdentifier = (NSString *)v71;

    if (v71) {
      v12->_didUpdateAutoHighlightIdentifier = 1;
    }
    [v119 removeObjectForKey:@"autoHighlight"];
    v12->_impressionable = 0;
    v117 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v73 = v119;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v127 objects:v141 count:16];
    v116 = v73;
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v128;
      do
      {
        for (uint64_t k = 0; k != v75; ++k)
        {
          if (*(void *)v128 != v76) {
            objc_enumerationMutation(v73);
          }
          id v78 = *(void **)(*((void *)&v127 + 1) + 8 * k);
          if ([v78 hasPrefix:@"data-metrics"])
          {
            v12->_impressionable = 1;
            uint64_t v79 = [v73 objectForKeyedSubscript:v78];
            [v117 setObject:v79 forKey:v78];

            id v73 = v116;
          }
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v127 objects:v141 count:16];
      }
      while (v75);
    }

    uint64_t v80 = [v117 copy];
    impressionableAttributes = v12->_impressionableAttributes;
    v12->_impressionableAttributes = (NSDictionary *)v80;

    if ([v73 count])
    {
      uint64_t v82 = [v73 copy];
      attributes = v12->_attributes;
      v12->_attributes = (NSDictionary *)v82;
    }
    else
    {
      attributes = v12->_attributes;
      v12->_attributes = 0;
    }

    v84 = [(IKViewElement *)v12 appDocument];
    int v85 = [v84 markImplicitlyUpdated];

    if (v85)
    {
      [(IKViewElement *)v12 _elevateToImplicitUpdateType:4];
      if ([v64 _elevateToImplicitUpdateType:3])
      {
        uint64_t v86 = [v64 parent];
        if ([v86 _elevateToImplicitUpdateType:1])
        {
          do
          {
            v87 = [v86 parent];

            uint64_t v86 = v87;
          }
          while (([v87 _elevateToImplicitUpdateType:1] & 1) != 0);
        }
        else
        {
          v87 = v86;
        }
      }
    }
    v88 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v89 = [v8 unfilteredChildren];
    v90 = objc_msgSend(v88, "arrayWithCapacity:", objc_msgSend(v89, "count"));

    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    obuint64_t j = [v8 unfilteredChildren];
    uint64_t v91 = [obj countByEnumeratingWithState:&v123 objects:v140 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v120 = *(void *)v124;
      do
      {
        for (uint64_t m = 0; m != v92; ++m)
        {
          if (*(void *)v124 != v120) {
            objc_enumerationMutation(obj);
          }
          id v94 = *(void **)(*((void *)&v123 + 1) + 8 * m);
          v95 = [v94 bindingController];
          v96 = [v95 binding];

          long long v97 = [v96 dataBoundKeys];
          int v98 = [v97 containsObject:@"dataItem"];

          if (v98)
          {
            long long v99 = [v96 keyValues];
            long long v100 = [v99 objectForKeyedSubscript:@"dataItem"];

            long long v101 = v122;
            long long v102 = [(IKAppDataItem *)v122 valueForPropertyPath:v100];
            long long v103 = [[IKAppDataItem alloc] initWithType:0 identifier:0 prototypeIdentifier:0 dataDictionary:v102];
          }
          else
          {
            long long v103 = 0;
            long long v101 = v122;
          }
          id v104 = objc_alloc((Class)objc_opt_class());
          if (v103) {
            long long v105 = v103;
          }
          else {
            long long v105 = v101;
          }
          long long v106 = (void *)[v104 initWithPrototypeElement:v94 parent:v121 appDataItem:v105];
          [v90 addObject:v106];
        }
        uint64_t v92 = [obj countByEnumeratingWithState:&v123 objects:v140 count:16];
      }
      while (v92);
    }

    if ([v90 count])
    {
      uint64_t v107 = [v90 copy];
      uint64_t v12 = v121;
      unfilteredChildren = v121->_unfilteredChildren;
      v121->_unfilteredChildren = (NSArray *)v107;
    }
    else
    {
      uint64_t v12 = v121;
      unfilteredChildren = v121->_unfilteredChildren;
      v121->_unfilteredChildren = 0;
    }
    uint64_t v10 = v122;

    id v8 = v114;
    id v9 = v111;
  }

  return v12;
}

- (IKViewElement)initWithOriginalElement:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v54.receiver = self;
  v54.super_class = (Class)IKViewElement;
  id v5 = [(IKViewElement *)&v54 init];
  id v6 = v5;
  if (v5)
  {
    v5->_isProxyElement = 1;
    uint64_t v7 = [v4 parent];
    objc_storeWeak((id *)&v6->_parent, v7);

    bindingController = v6->_bindingController;
    v6->_bindingController = 0;

    binding = v6->_binding;
    v6->_binding = 0;

    uint64_t v10 = [v4 dataDictionary];
    dataDictionary = v6->_dataDictionary;
    v6->_dataDictionary = (NSDictionary *)v10;

    elementID = v6->_elementID;
    v6->_elementID = 0;

    itmlID = v6->_itmlID;
    v6->_itmlID = 0;

    uint64_t v14 = [v4 accessibilityText];
    accessibilityText = v6->_accessibilityText;
    v6->_accessibilityText = (NSString *)v14;

    uint64_t v16 = [v4 elementName];
    elementName = v6->_elementName;
    v6->_elementName = (NSString *)v16;

    v6->_elementType = [v4 elementType];
    uint64_t v18 = [v4 styleComposer];
    styleComposer = v6->_styleComposer;
    v6->_styleComposer = (IKViewElementStyleComposer *)v18;

    features = v6->_features;
    v6->_features = 0;

    v6->_impressionable = [v4 isImpressionable];
    uint64_t v21 = [v4 impressionableAttributes];
    impressionableAttributes = v6->_impressionableAttributes;
    v6->_impressionableAttributes = (NSDictionary *)v21;

    uint64_t v23 = [v4 attributes];
    attributes = v6->_attributes;
    v6->_attributes = (NSDictionary *)v23;

    uint64_t v25 = [(IKViewElement *)v6 appDocument];
    int v26 = [v25 markImplicitlyUpdated];

    if (v26)
    {
      [(IKViewElement *)v6 _elevateToImplicitUpdateType:4];
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_parent);
      int v28 = [WeakRetained _elevateToImplicitUpdateType:3];

      if (v28)
      {
        id v29 = objc_loadWeakRetained((id *)&v6->_parent);
        uint64_t v30 = [v29 parent];

        if ([v30 _elevateToImplicitUpdateType:1])
        {
          do
          {
            id v31 = [v30 parent];

            uint64_t v30 = v31;
          }
          while (([v31 _elevateToImplicitUpdateType:1] & 1) != 0);
        }
        else
        {
          id v31 = v30;
        }
      }
    }
    long long v32 = (void *)MEMORY[0x1E4F1CA48];
    long long v33 = [v4 unfilteredChildren];
    uint64_t v34 = objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v35 = objc_msgSend(v4, "unfilteredChildren", 0);
    uint64_t v36 = [v35 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v51 != v38) {
            objc_enumerationMutation(v35);
          }
          id v40 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOriginalElement:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          [v34 addObject:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v37);
    }

    if ([v34 count])
    {
      uint64_t v41 = [v34 copy];
      unfilteredChildren = v6->_unfilteredChildren;
      v6->_unfilteredChildren = (NSArray *)v41;
    }
    else
    {
      unfilteredChildren = v6->_unfilteredChildren;
      v6->_unfilteredChildren = 0;
    }

    uint64_t v43 = (void *)[v4[26] mutableCopy];
    id v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      id v45 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    uint64_t v46 = v45;

    [v46 addObject:v6];
    uint64_t v47 = [v46 copy];
    id v48 = v4[26];
    v4[26] = (id)v47;
  }
  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)IKViewElement;
  [(IKViewElement *)&v4 dealloc];
}

- (void)configureUpdatesWithElement:(id)a3
{
  id v4 = a3;
  id v5 = [(IKViewElement *)self unfilteredChildren];
  id v6 = [v4 unfilteredChildren];

  if (![(IKViewElement *)self updateType]
    || [(IKViewElement *)self updateType] == 3
    || [(IKViewElement *)self updateType] == 4)
  {
    id v29 = v5;
    uint64_t v7 = [[IKDiffEvaluator alloc] initWithObjects:v5 oldObjects:v6 hashing:&__block_literal_global_27];
    int v28 = v6;
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__IKViewElement_configureUpdatesWithElement___block_invoke_2;
    v33[3] = &unk_1E6DE5630;
    id v9 = v8;
    id v34 = v9;
    [(IKDiffEvaluator *)v7 enumerateCommonObjectsUsingBlock:v33];
    uint64_t v10 = [IKChangeSet alloc];
    id v11 = [(IKDiffEvaluator *)v7 addedIndexes];
    uint64_t v12 = [(IKDiffEvaluator *)v7 removedIndexes];
    int v13 = [(IKDiffEvaluator *)v7 movedIndexesByNewIndex];
    uint64_t v14 = [v9 count];
    if (v14) {
      v15 = (void *)[v9 copy];
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = &v34;
    uint64_t v17 = [(IKChangeSet *)v10 initWithAddedIndexes:v11 removedIndexes:v12 movedIndexesByNewIndex:v13 updatedIndexesByNewIndex:v15];
    unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
    self->_unfilteredChildrenChangeSet = v17;

    if (v14) {
    id v6 = v28;
    }
    id v5 = v29;
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    long long v20 = [v5 valueForKey:@"itmlID"];
    uint64_t v21 = [v19 dictionaryWithObjects:v5 forKeys:v20];

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __45__IKViewElement_configureUpdatesWithElement___block_invoke_3;
    v30[3] = &unk_1E6DE68D8;
    uint64_t v7 = v21;
    id v31 = v7;
    id v9 = v22;
    id v32 = v9;
    [v6 enumerateObjectsUsingBlock:v30];
    uint64_t v23 = [IKChangeSet alloc];
    uint64_t v24 = [v9 count];
    if (v24) {
      uint64_t v25 = (void *)[v9 copy];
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v16 = (id *)&v31;
    int v26 = [(IKChangeSet *)v23 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v25];
    uint64_t v27 = self->_unfilteredChildrenChangeSet;
    self->_unfilteredChildrenChangeSet = v26;

    if (v24) {
    id v11 = v32;
    }
  }
}

id __45__IKViewElement_configureUpdatesWithElement___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"itemID"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [v2 attributes];
    id v6 = [v7 objectForKeyedSubscript:@"searchResultIdentifier"];
  }
  id v8 = [v2 itmlID];
  if (v6)
  {
    id v9 = @"itemID_";
    id v10 = v6;
  }
  else
  {
    id v9 = @"ITMLID_";
    id v10 = v8;
  }
  id v11 = [(__CFString *)v9 stringByAppendingString:v10];

  return v11;
}

void __45__IKViewElement_configureUpdatesWithElement___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v16 = a3;
  id v9 = a5;
  id v10 = [v16 itmlID];
  id v11 = [v9 itmlID];
  if (![v10 isEqualToString:v11])
  {

    goto LABEL_5;
  }
  uint64_t v12 = [v16 updateType];

  if (v12)
  {
LABEL_5:
    int v13 = *(void **)(a1 + 32);
    uint64_t v14 = [NSNumber numberWithInteger:a4];
    v15 = [NSNumber numberWithInteger:a2];
    [v13 setObject:v14 forKey:v15];

    [v16 configureUpdatesWithElement:v9];
  }
}

void __45__IKViewElement_configureUpdatesWithElement___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v12 = v5;
  uint64_t v7 = [v5 itmlID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = *(void **)(a1 + 40);
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    [v10 setObject:v9 forKeyedSubscript:v11];

    [v8 configureUpdatesWithElement:v12];
  }
}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4 = (IKViewElement *)a3;
  id v5 = self;
  if (v4 && v4 != self)
  {
    uint64_t v6 = [(IKViewElement *)v4 updateType];
    if (v6 == 4 || (uint64_t v7 = v6, ([(id)objc_opt_class() shouldParseChildDOMElements] & 1) == 0))
    {
      uint64_t v14 = [(IKViewElement *)v4 unfilteredChildrenChangeSet];
      v15 = [v14 updatedIndexesByNewIndex];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      uint64_t v23 = __41__IKViewElement_applyUpdatesWithElement___block_invoke;
      uint64_t v24 = &unk_1E6DE5D28;
      id v16 = v4;
      uint64_t v25 = v16;
      int v26 = v5;
      [v15 enumerateKeysAndObjectsUsingBlock:&v21];

      if (![(IKViewElement *)v16 didUpdateAutoHighlightIdentifier]&& [(IKViewElement *)v5 didUpdateAutoHighlightIdentifier])
      {
        [(IKViewElement *)v16 setDidUpdateAutoHighlightIdentifier:1];
        uint64_t v17 = [(IKViewElement *)v5 autoHighlightIdentifier];
        [(IKViewElement *)v16 setAutoHighlightIdentifier:v17];
      }
      uint64_t v18 = [(IKViewElement *)v5 parent];

      if (!v18) {
        [(IKViewElement *)v5 setAppDocument:0];
      }
      uint64_t v19 = v16;

      id v5 = v19;
    }
    else if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      unint64_t v8 = [(IKViewElement *)v5 _updateSubtreeWithElement:v4];
      id v9 = [(IKViewElement *)v5 dataDictionary];
      id v10 = [(IKViewElement *)v4 dataDictionary];

      if (v9 != v10)
      {
        id v11 = [(IKViewElement *)v4 dataDictionary];
        [(IKViewElement *)v5 setDataDictionary:v11];

        if (v8 <= 1) {
          unint64_t v8 = 1;
        }
      }
      if ([(IKViewElement *)v4 didUpdateAutoHighlightIdentifier])
      {
        [(IKViewElement *)v5 setDidUpdateAutoHighlightIdentifier:1];
        id v12 = [(IKViewElement *)v4 autoHighlightIdentifier];
        [(IKViewElement *)v5 setAutoHighlightIdentifier:v12];

        if (v8 <= 1) {
          unint64_t v8 = 1;
        }
      }
      if (v8 >= 2)
      {
        style = v5->_style;
        v5->_style = 0;
      }
      [(IKViewElement *)v5 setUpdateType:v8];
    }
  }

  return v5;
}

void __41__IKViewElement_applyUpdatesWithElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  unint64_t v8 = [v5 unfilteredChildren];
  uint64_t v9 = [v7 integerValue];

  id v13 = [v8 objectAtIndexedSubscript:v9];

  id v10 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = [v6 integerValue];

  id v12 = [v10 objectAtIndexedSubscript:v11];
  [v12 applyUpdatesWithElement:v13];
}

- (void)updateWithActualElement:(id)a3
{
  id v20 = a3;
  self->_isProxyElement = 0;
  id v4 = [v20 bindingController];
  bindingController = self->_bindingController;
  self->_bindingController = v4;

  id v6 = [v20 elementID];
  elementID = self->_elementID;
  self->_elementID = v6;

  unint64_t v8 = [v20 itmlID];
  itmlID = self->_itmlID;
  self->_itmlID = v8;

  features = self->_features;
  self->_features = 0;

  uint64_t v11 = [(IKViewElement *)self unfilteredChildren];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [(IKViewElement *)self unfilteredChildren];
      v15 = [v14 objectAtIndexedSubscript:v13];
      id v16 = [v20 unfilteredChildren];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v13];
      [v15 updateWithActualElement:v17];

      ++v13;
      uint64_t v18 = [(IKViewElement *)self unfilteredChildren];
      unint64_t v19 = [v18 count];
    }
    while (v13 < v19);
  }
}

- (NSString)debugDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@", self->_elementName];
  id v4 = v3;
  if (self->_disabled) {
    [v3 appendString:@" disabled=\"true\""];
  }
  if (self->_updateType)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 appendFormat:@" updateType=\"%@\"", v5];
  }
  id v6 = [(IKViewElement *)self style];
  id v7 = [v6 debugDescription];

  if ([v7 length]) {
    [v4 appendFormat:@" style=\"%@\"", v7];
  }
  unint64_t v8 = [(IKViewElement *)self attributes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(IKViewElement *)self attributes];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __33__IKViewElement_debugDescription__block_invoke;
    v23[3] = &unk_1E6DE58D0;
    id v24 = v4;
    [v10 enumerateKeysAndObjectsUsingBlock:v23];
  }
  [v4 appendString:@">"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = self->_unfilteredChildren;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) debugDescription];
        [v4 appendString:v16];
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v13);
  }

  [v4 appendFormat:@"</%@>", self->_elementName];
  uint64_t v17 = (void *)[v4 copy];

  return (NSString *)v17;
}

uint64_t __33__IKViewElement_debugDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" %@=\"%@\"", a2, a3];
}

- (IKViewElementStyle)style
{
  style = self->_style;
  if (!style)
  {
    id v4 = [(IKViewElement *)self styleComposer];
    id v5 = [(IKViewElement *)self appDocument];
    id v6 = [v4 composedStyleWithMediaQueryEvaluator:v5];
    id v7 = (void *)[v6 copy];

    if (v7) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = objc_alloc_init(IKViewElementStyle);
    }
    uint64_t v9 = self->_style;
    self->_style = v8;

    style = self->_style;
  }
  return style;
}

- (void)setAppDocument:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_appDocument, a3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(IKViewElement *)self unfilteredChildren];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAppDocument:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (IKAppDocument)appDocument
{
  p_appDocument = &self->_appDocument;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDocument);

  if (!WeakRetained)
  {
    uint64_t v5 = [(IKViewElement *)self parent];
    uint64_t v6 = [v5 appDocument];

    objc_storeWeak((id *)p_appDocument, v6);
  }
  id v7 = objc_loadWeakRetained((id *)p_appDocument);
  return (IKAppDocument *)v7;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKViewElement *)self metadataDict];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(IKViewElement *)self metadataDict];

  if (v13 && !v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(IKViewElement *)self setMetadataDict:v8];

LABEL_5:
    long long v9 = [(IKViewElement *)self metadataDict];
    [v9 setObject:v13 forKey:v6];

    goto LABEL_6;
  }
  if (v13) {
    goto LABEL_5;
  }
  long long v10 = [(IKViewElement *)self metadataDict];
  [v10 removeObjectForKey:v6];

  long long v11 = [(IKViewElement *)self metadataDict];
  uint64_t v12 = [v11 count];

  if (!v12) {
    [(IKViewElement *)self setMetadataDict:0];
  }
LABEL_6:
}

- (void)resetProperty:(unint64_t)a3
{
  if (a3 == 2)
  {
    [(IKViewElement *)self setDidUpdateAutoHighlightIdentifier:0];
    [(IKViewElement *)self setAutoHighlightIdentifier:0];
  }
  else if (a3 == 1)
  {
    [(IKViewElement *)self resetUpdates];
  }
}

- (void)dispatchEventOfType:(unint64_t)a3 canBubble:(BOOL)a4 isCancelable:(BOOL)a5 extraInfo:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v18 = a6;
  id v12 = a7;
  id v13 = [(id)objc_opt_class() DOMEventTypeNameMap];
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
  v15 = [v13 objectForKey:v14];

  if (v15)
  {
    id v16 = [(id)objc_opt_class() _eventXMLNameMap];
    uint64_t v17 = [v16 objectForKey:v15];
  }
  else
  {
    uint64_t v17 = 0;
  }
  [(IKViewElement *)self dispatchEvent:v15 eventAttribute:v17 canBubble:v9 isCancelable:v8 extraInfo:v18 completionBlock:v12];
}

- (void)dispatchEvent:(id)a3 eventAttribute:(id)a4 canBubble:(BOOL)a5 isCancelable:(BOOL)a6 extraInfo:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  if (([v14 isEqualToString:@"play"] & 1) == 0
    && ([v14 isEqualToString:@"select"] & 1) == 0
    && ![v14 isEqualToString:@"holdselect"])
  {
    char v23 = 0;
LABEL_11:
    id v24 = [(IKViewElement *)self appDocument];
    uint64_t v25 = [v24 appContext];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke;
    v27[3] = &unk_1E6DE6978;
    id v28 = v24;
    id v29 = self;
    id v30 = v14;
    id v33 = v17;
    id v31 = v15;
    BOOL v34 = a5;
    BOOL v35 = a6;
    id v32 = v16;
    char v36 = v23;
    id v26 = v24;
    [v25 evaluate:v27 completionBlock:0];

    goto LABEL_12;
  }
  id v18 = [(IKViewElement *)self activeSingularEvents];
  int v19 = [v18 containsObject:v14];

  if (!v19)
  {
    long long v20 = [(IKViewElement *)self activeSingularEvents];

    if (!v20)
    {
      long long v21 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      [(IKViewElement *)self setActiveSingularEvents:v21];
    }
    long long v22 = [(IKViewElement *)self activeSingularEvents];
    [v22 addObject:v14];

    char v23 = 1;
    goto LABEL_11;
  }
  if (v17) {
    (*((void (**)(id, void, void))v17 + 2))(v17, 0, 0);
  }
LABEL_12:
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) retrieveJSElementForViewElement:*(void *)(a1 + 40) jsContext:v3];
  if (v4)
  {
    uint64_t v5 = [IKDOMEvent alloc];
    id v6 = [*(id *)(a1 + 32) appContext];
    id v7 = [(IKDOMEvent *)v5 initWithAppContext:v6 type:*(void *)(a1 + 48) xmlAttribute:*(void *)(a1 + 56) canBubble:*(unsigned __int8 *)(a1 + 80) isCancelable:*(unsigned __int8 *)(a1 + 81)];

    [(IKDOMEvent *)v7 setTarget:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = [MEMORY[0x1E4F30938] valueWithObject:v7 inContext:v3];
      BOOL v9 = *(void **)(a1 + 64);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_2;
      v28[3] = &unk_1E6DE6900;
      id v29 = v8;
      id v10 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v28];
    }
    long long v11 = +[IKDOMEventDispatcher sharedInstance];
    char v12 = [v11 dispatchEvent:v7];

    LOBYTE(v11) = [(IKDOMEvent *)v7 defaultPrevented];
    id v13 = [*(id *)(a1 + 32) appContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_3;
    v20[3] = &unk_1E6DE6950;
    char v25 = *(unsigned char *)(a1 + 82);
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = *(void **)(a1 + 48);
    id v21 = v14;
    uint64_t v22 = v15;
    id v23 = v16;
    id v24 = *(id *)(a1 + 72);
    char v26 = v12;
    char v27 = (char)v11;
    [v13 addPostEvaluateBlock:v20];

    goto LABEL_9;
  }
  id v17 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_cold_1(a1, v17);
  }

  id v18 = *(void **)(a1 + 72);
  if (v18)
  {
    int v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_134;
    block[3] = &unk_1E6DE4260;
    id v31 = v18;
    dispatch_async(v19, block);

    id v7 = v31;
LABEL_9:
  }
}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    id v4 = [*(id *)(a1 + 32) appContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_4;
    v11[3] = &unk_1E6DE3A98;
    uint64_t v5 = *(void **)(a1 + 48);
    v11[4] = *(void *)(a1 + 40);
    id v12 = v5;
    [v4 evaluateDelegateBlockSync:v11];
  }
  id v6 = *(void **)(a1 + 56);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_5;
    v8[3] = &unk_1E6DE6928;
    id v9 = v6;
    __int16 v10 = *(_WORD *)(a1 + 65);
    dispatch_async(v7, v8);
  }
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeSingularEvents];
  [v2 removeObject:*(void *)(a1 + 40)];
}

uint64_t __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (BOOL)isProxyElement
{
  if (self->_isProxyElement) {
    return 1;
  }
  id v3 = [(IKViewElement *)self parent];
  char v4 = [v3 isProxyElement];

  return v4;
}

- (BOOL)isHidden
{
  id v2 = [(IKViewElement *)self style];
  char v3 = [v2 hidden];

  return v3;
}

- (NSArray)children
{
  if (!+[IKViewElementStyle isHiddenStyleRegistered])
  {
    unfilteredChildren = self->_unfilteredChildren;
    p_unfilteredChildren = &self->_unfilteredChildren;
    BOOL v8 = [(NSArray *)unfilteredChildren count];
    if (!v8) {
      goto LABEL_10;
    }
    p_visibleChildren = p_unfilteredChildren;
    goto LABEL_9;
  }
  p_visibleChildren = &self->_visibleChildren;
  if (!self->_visibleChildren && [(NSArray *)self->_unfilteredChildren count])
  {
    char v4 = self->_unfilteredChildren;
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_145];
    id v6 = [(NSArray *)v4 filteredArrayUsingPredicate:v5];
    visibleChildren = self->_visibleChildren;
    self->_visibleChildren = v6;
  }
  BOOL v8 = [(NSArray *)*p_visibleChildren count];
  if (v8) {
LABEL_9:
  }
    BOOL v8 = *p_visibleChildren;
LABEL_10:
  return v8;
}

uint64_t __25__IKViewElement_children__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (id)proxyElementForLoadedChildElement:(id)a3
{
  return 0;
}

- (BOOL)canProxyUnloadedChildElement:(id)a3
{
  return 0;
}

- (id)childElementWithType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(IKViewElement *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 elementType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)childElementsWithType:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v4 = [(IKViewElement *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 elementType] == a3)
        {
          if (!v7)
          {
            uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if ([v7 count]) {
    long long v11 = v7;
  }
  else {
    long long v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)childTextElementWithStyle:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(IKViewElement *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 elementType] == 138 && objc_msgSend(v9, "textStyle") == a3)
        {
          id v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)childImageElementWithType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(IKViewElement *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 elementType] == 49 && objc_msgSend(v9, "imageType") == a3)
        {
          id v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (void)disperseUpdateType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(IKViewElement *)self updateType] < a3) {
    [(IKViewElement *)self setUpdateType:a3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_unfilteredChildren;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "disperseUpdateType:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (void)resetUpdates
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(IKViewElement *)self updateType])
  {
    unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
    self->_updateType = 0;
    self->_unfilteredChildrenChangeSet = 0;

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    char v4 = self->_unfilteredChildren;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "resetUpdates", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

+ (unint64_t)evaluateElementUpdateType:(id)a3
{
  id v3 = a3;
  if ([v3 isUpdated])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isChildrenUpdated])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = [v3 isSubtreeUpdated];
  }

  return v4;
}

- (void)performImplicitUpdates:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(IKViewElement *)self appDocument];
  [v5 pushTrackingImplictUpdates];

  v4[2](v4);
  id v6 = [(IKViewElement *)self appDocument];
  [v6 popTrackingImplictUpdates];
}

- (void)resetImplicitUpdates
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(IKViewElement *)self implicitUpdateType])
  {
    self->_implicitUpdateType = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_unfilteredChildren;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "resetImplicitUpdates", (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)adoptElement:(id)a3
{
}

- (void)appDocumentDidMarkStylesDirty
{
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  unint64_t v3 = [(IKViewElement *)self updateType];
  uint64_t v4 = 2;
  if (v3 > 2) {
    uint64_t v4 = v3;
  }
  uint64_t v35 = v4;
  uint64_t v5 = [(IKViewElement *)self styleComposer];
  int v6 = [v5 requiresMediaQueryEvaluation];

  if (v6)
  {
    if (+[IKViewElementStyle isHiddenStyleRegistered])
    {
      BOOL v7 = [(IKViewElement *)self isHidden];
      long long v8 = [(IKViewElement *)self styleComposer];
      [v8 setNeedsRecomposition];

      if (v7 != [(IKViewElement *)self isHidden])
      {
        unint64_t v9 = v33[3];
        if (v9 <= 4) {
          unint64_t v9 = 4;
        }
        v33[3] = v9;
      }
    }
    else
    {
      long long v10 = [(IKViewElement *)self styleComposer];
      [v10 setNeedsRecomposition];
    }
  }
  long long v11 = [MEMORY[0x1E4F28E60] indexSet];
  long long v12 = [(IKViewElement *)self unfilteredChildren];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke;
  v29[3] = &unk_1E6DE69A0;
  v29[4] = self;
  id v31 = &v32;
  id v13 = v11;
  id v30 = v13;
  [v12 enumerateObjectsUsingBlock:v29];

  uint64_t v14 = [(IKViewElement *)self aliases];
  [v14 enumerateObjectsUsingBlock:&__block_literal_global_148];

  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  for (uint64_t i = [v13 firstIndex]; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend(v13, "indexGreaterThanIndex:", i))
  {
    uint64_t v17 = [NSNumber numberWithInteger:i];
    id v18 = [NSNumber numberWithInteger:i];
    [v15 setObject:v17 forKeyedSubscript:v18];
  }
  uint64_t v19 = [IKChangeSet alloc];
  uint64_t v20 = [v15 count];
  if (v20) {
    id v21 = (void *)[v15 copy];
  }
  else {
    id v21 = 0;
  }
  uint64_t v22 = [(IKChangeSet *)v19 initWithAddedIndexes:0 removedIndexes:0 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v21];
  if (v20) {

  }
  unfilteredChildrenChangeSet = self->_unfilteredChildrenChangeSet;
  if (unfilteredChildrenChangeSet)
  {
    id v24 = [(IKChangeSet *)unfilteredChildrenChangeSet changeSetByConcatenatingChangeSet:v22];
  }
  else
  {
    id v24 = v22;
  }
  char v25 = self->_unfilteredChildrenChangeSet;
  self->_unfilteredChildrenChangeSet = v24;

  unint64_t v26 = v33[3];
  if (v26 >= 3)
  {
    visibleChildren = self->_visibleChildren;
    self->_visibleChildren = 0;

    unint64_t v26 = v33[3];
  }
  if (v26 >= 2)
  {
    style = self->_style;
    self->_style = 0;

    unint64_t v26 = v33[3];
  }
  [(IKViewElement *)self setUpdateType:v26];

  _Block_object_dispose(&v32, 8);
}

void __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) unfilteredChildrenChangeSet];
  int v6 = [v5 addedIndexes];
  char v7 = [v6 containsIndex:a3];

  if ((v7 & 1) == 0)
  {
    if (+[IKViewElementStyle isHiddenStyleRegistered])
    {
      int v8 = [v15 isHidden];
      [v15 appDocumentDidMarkStylesDirty];
      BOOL v9 = v8 == [v15 isHidden];
      long long v10 = v15;
      if (!v9)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        unint64_t v12 = *(void *)(v11 + 24);
        if (v12 <= 3) {
          unint64_t v12 = 3;
        }
        *(void *)(v11 + 24) = v12;
      }
    }
    else
    {
      [v15 appDocumentDidMarkStylesDirty];
      long long v10 = v15;
    }
    if ([v10 updateType])
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v14 = *(void *)(v13 + 24);
      if (v14 <= 1) {
        unint64_t v14 = 1;
      }
      *(void *)(v13 + 24) = v14;
      [*(id *)(a1 + 40) addIndex:a3];
    }
  }
}

uint64_t __46__IKViewElement_appDocumentDidMarkStylesDirty__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appDocumentDidMarkStylesDirty];
}

- (unint64_t)_updateSubtreeWithElement:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v86 = [v4 updateType];
  uint64_t v89 = v4;
  uint64_t v5 = [v4 unfilteredChildrenChangeSet];
  int v6 = [(IKViewElement *)self unfilteredChildren];
  char v7 = (void *)[v6 mutableCopy];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
  }
  v93 = v9;

  long long v10 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v11 = [v5 removedIndexes];
  if (v11)
  {
    unint64_t v12 = [v5 removedIndexes];
    uint64_t v13 = [v12 firstIndex];

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v14 = [v93 objectAtIndex:v13];
      if ([(IKViewElement *)self canProxyUnloadedChildElement:v14]) {
        [v10 addIndex:v13];
      }
      [v14 setAppDocument:0];
      [v14 setParent:0];
      id v15 = [v5 removedIndexes];
      uint64_t v13 = [v15 indexGreaterThanIndex:v13];
    }
  }
  else
  {
  }
  long long v16 = [v5 removedIndexes];
  uint64_t v17 = (void *)[v16 mutableCopy];
  id v18 = v17;
  int v85 = self;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28E60] indexSet];
  }
  uint64_t v20 = v19;

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v21 = [v5 movedIndexesByNewIndex];
  uint64_t v22 = [v21 allValues];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v110 objects:v116 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v111 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v20, "addIndex:", objc_msgSend(*(id *)(*((void *)&v110 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v110 objects:v116 count:16];
    }
    while (v24);
  }

  [v93 removeObjectsAtIndexes:v20];
  v88 = [MEMORY[0x1E4F28E60] indexSet];
  char v27 = [v5 addedIndexes];
  id v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [MEMORY[0x1E4F28D60] indexSet];
  }
  uint64_t v92 = v29;

  id v30 = [MEMORY[0x1E4F28E60] indexSet];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v31 = [v5 movedIndexesByNewIndex];
  uint64_t v32 = [v31 allKeys];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v106 objects:v115 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v107 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_msgSend(v30, "addIndex:", objc_msgSend(*(id *)(*((void *)&v106 + 1) + 8 * j), "integerValue"));
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v106 objects:v115 count:16];
    }
    while (v34);
  }
  uint64_t v91 = v5;

  uint64_t v37 = [v92 firstIndex];
  uint64_t v38 = [v30 firstIndex];
  int v39 = v38 != 0x7FFFFFFFFFFFFFFFLL;
  BOOL v40 = v37 != 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v41 = v85;
  while (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    if (v40 && (v39 & 1) != 0)
    {
      if (v37 <= v38) {
        goto LABEL_36;
      }
    }
    else if (v40 & ~v39)
    {
LABEL_36:
      uint64_t v42 = [v89 unfilteredChildren];
      uint64_t v43 = [v42 objectAtIndexedSubscript:v37];

      id v44 = [(IKViewElement *)v85 proxyElementForLoadedChildElement:v43];
      id v45 = v44;
      if (v44)
      {
        [v44 updateWithActualElement:v43];
        id v46 = v45;

        [v88 addIndex:v37];
        uint64_t v43 = v46;
      }
      else
      {
        [(IKViewElement *)v85 adoptElement:v43];
      }
      [v93 insertObject:v43 atIndex:v37];
      uint64_t v37 = [v92 indexGreaterThanIndex:v37];

      goto LABEL_42;
    }
    uint64_t v47 = [v91 movedIndexesByNewIndex];
    id v48 = [NSNumber numberWithInteger:v38];
    uint64_t v43 = [v47 objectForKeyedSubscript:v48];

    v49 = -[NSArray objectAtIndexedSubscript:](v85->_unfilteredChildren, "objectAtIndexedSubscript:", [v43 integerValue]);
    [v93 insertObject:v49 atIndex:v38];

    uint64_t v38 = [v30 indexGreaterThanIndex:v38];
LABEL_42:

    int v39 = v38 != 0x7FFFFFFFFFFFFFFFLL;
    BOOL v40 = v37 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v38 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_33;
  }
  unint64_t v50 = 0x1E4F1C000uLL;
  uint64_t v83 = v10;
  if (v86 == 1)
  {
    long long v51 = [MEMORY[0x1E4F28E60] indexSet];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v52 = [v91 updatedIndexesByNewIndex];
    long long v53 = [v52 allValues];

    uint64_t v54 = [v53 countByEnumeratingWithState:&v102 objects:v114 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v103;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v103 != v56) {
            objc_enumerationMutation(v53);
          }
          objc_msgSend(v51, "addIndex:", objc_msgSend(*(id *)(*((void *)&v102 + 1) + 8 * k), "integerValue", v83));
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v102 objects:v114 count:16];
      }
      while (v55);
    }

    uint64_t v58 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
    uint64_t v59 = [v51 firstIndex];
    if (v59 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v60 = v59;
      uint64_t v61 = 0;
      do
      {
        uint64_t v62 = v61 + 1;
        v63 = [NSNumber numberWithInteger:v83];
        v64 = [NSNumber numberWithInteger:v60];
        [v58 setObject:v63 forKeyedSubscript:v64];

        uint64_t v60 = [v51 indexGreaterThanIndex:v60];
        uint64_t v61 = v62;
      }
      while (v60 != 0x7FFFFFFFFFFFFFFFLL);
    }
    id v65 = objc_msgSend(v58, "copy", v83);

    long long v10 = v83;
    uint64_t v41 = v85;
    unint64_t v50 = 0x1E4F1C000;
  }
  else
  {
    id v65 = 0;
  }
  uint64_t v66 = objc_msgSend(*(id *)(v50 + 2656), "dictionary", v83);
  uint64_t v67 = [v91 updatedIndexesByNewIndex];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __43__IKViewElement__updateSubtreeWithElement___block_invoke;
  v95[3] = &unk_1E6DE69E8;
  id v90 = v89;
  id v96 = v90;
  uint64_t v101 = v86;
  id v87 = v65;
  id v97 = v87;
  int v98 = v41;
  id v68 = v66;
  id v99 = v68;
  id v69 = v93;
  id v100 = v69;
  [v67 enumerateKeysAndObjectsUsingBlock:v95];

  char v70 = [[IKChangeSet alloc] initWithAddedIndexes:v88 removedIndexes:v10 movedIndexesByNewIndex:0 updatedIndexesByNewIndex:v68];
  uint64_t v71 = [v91 changeSetBySubtractingChangeSet:v70];

  uint64_t v72 = [v71 addedIndexes];
  if ([v72 count]) {
    goto LABEL_60;
  }
  id v73 = [v71 removedIndexes];
  if ([v73 count])
  {

LABEL_60:
LABEL_61:
    BOOL v74 = 1;
    unint64_t v75 = 3;
    goto LABEL_62;
  }
  uint64_t v80 = [v71 movedIndexesByNewIndex];
  uint64_t v94 = [v80 count];

  if (v94) {
    goto LABEL_61;
  }
  uint64_t v81 = [v71 updatedIndexesByNewIndex];
  uint64_t v82 = [v81 count];

  BOOL v74 = v82 != 0;
  unint64_t v75 = v82 != 0;
LABEL_62:
  if ([v69 count])
  {
    uint64_t v76 = [v69 copy];
    unfilteredChildren = v41->_unfilteredChildren;
    v41->_unfilteredChildren = (NSArray *)v76;
  }
  else
  {
    unfilteredChildren = v41->_unfilteredChildren;
    v41->_unfilteredChildren = 0;
  }

  visibleChildren = v41->_visibleChildren;
  v41->_visibleChildren = 0;

  if (v74) {
    objc_storeStrong((id *)&v41->_unfilteredChildrenChangeSet, v71);
  }

  return v75;
}

void __43__IKViewElement__updateSubtreeWithElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) unfilteredChildren];
  if (*(void *)(a1 + 72) == 1)
  {
    char v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    int v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "integerValue"));
  }
  else
  {
    int v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v11, "integerValue"));
  }

  id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  long long v10 = [v9 applyUpdatesWithElement:v8];
  if ([v10 updateType]) {
    [*(id *)(a1 + 48) adoptElement:v10];
  }
  else {
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v11];
  }
  objc_msgSend(*(id *)(a1 + 64), "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "integerValue"), v10);
}

- (BOOL)_elevateToImplicitUpdateType:(unint64_t)a3
{
  unint64_t implicitUpdateType = self->_implicitUpdateType;
  if (implicitUpdateType < a3) {
    self->_unint64_t implicitUpdateType = a3;
  }
  return implicitUpdateType < a3;
}

+ (id)DOMEventTypeNameMap
{
  if (DOMEventTypeNameMap_onceToken != -1) {
    dispatch_once(&DOMEventTypeNameMap_onceToken, &__block_literal_global_151);
  }
  id v2 = (void *)DOMEventTypeNameMap_eventTypeNameMap;
  return v2;
}

void __36__IKViewElement_DOMEventTypeNameMap__block_invoke()
{
  v3[21] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F3E3DD28;
  v2[1] = &unk_1F3E3DD40;
  v3[0] = @"play";
  v3[1] = @"select";
  v2[2] = &unk_1F3E3DD58;
  v2[3] = &unk_1F3E3DD70;
  v3[2] = @"holdselect";
  v3[3] = @"highlight";
  v2[4] = &unk_1F3E3DD88;
  v2[5] = &unk_1F3E3DDA0;
  v3[4] = @"contextmenu";
  v3[5] = @"action";
  v2[6] = &unk_1F3E3DDB8;
  v2[7] = &unk_1F3E3DDD0;
  v3[6] = @"load";
  v3[7] = @"unload";
  v2[8] = &unk_1F3E3DDE8;
  v2[9] = &unk_1F3E3DE00;
  v3[8] = @"appear";
  v3[9] = @"disappear";
  v2[10] = &unk_1F3E3DE18;
  v2[11] = &unk_1F3E3DE30;
  v3[10] = @"update";
  v3[11] = @"didupdate";
  v2[12] = &unk_1F3E3DE48;
  v2[13] = &unk_1F3E3DE60;
  v3[12] = @"dataavailable";
  v3[13] = @"submit";
  v2[14] = &unk_1F3E3DE78;
  v2[15] = &unk_1F3E3DE90;
  v3[14] = @"change";
  v3[15] = @"needsmore";
  v2[16] = &unk_1F3E3DEA8;
  v2[17] = &unk_1F3E3DEC0;
  v3[16] = @"needscontent";
  v3[17] = @"playersessionbegin";
  v2[18] = &unk_1F3E3DED8;
  v2[19] = &unk_1F3E3DEF0;
  v3[18] = @"playersessionend";
  v3[19] = @"playerstatechange";
  v2[20] = &unk_1F3E3DF08;
  v3[20] = @"finish";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:21];
  v1 = (void *)DOMEventTypeNameMap_eventTypeNameMap;
  DOMEventTypeNameMap_eventTypeNameMap = v0;
}

+ (id)_eventXMLNameMap
{
  if (_eventXMLNameMap_onceToken != -1) {
    dispatch_once(&_eventXMLNameMap_onceToken, &__block_literal_global_194);
  }
  id v2 = (void *)_eventXMLNameMap_eventXMLNameMap;
  return v2;
}

void __33__IKViewElement__eventXMLNameMap__block_invoke()
{
  v3[21] = *MEMORY[0x1E4F143B8];
  v2[0] = @"play";
  v2[1] = @"select";
  v3[0] = @"onplay";
  v3[1] = @"onselect";
  v2[2] = @"holdselect";
  v2[3] = @"highlight";
  v3[2] = @"onholdselect";
  v3[3] = @"onhighlight";
  v2[4] = @"contextmenu";
  v2[5] = @"action";
  v3[4] = @"oncontextmenu";
  v3[5] = @"onaction";
  v2[6] = @"load";
  v2[7] = @"unload";
  v3[6] = @"onload";
  v3[7] = @"onunload";
  v2[8] = @"appear";
  v2[9] = @"disappear";
  v3[8] = @"onappear";
  v3[9] = @"ondisappear";
  v2[10] = @"update";
  v2[11] = @"didupdate";
  v3[10] = @"onupdate";
  v3[11] = @"ondidupdate";
  v2[12] = @"dataavailable";
  v2[13] = @"submit";
  v3[12] = @"ondataavailable";
  v3[13] = @"onsubmit";
  v2[14] = @"change";
  v2[15] = @"needsmore";
  v3[14] = @"onchange";
  v3[15] = @"onneedsmore";
  v2[16] = @"needscontent";
  v2[17] = @"playersessionbegin";
  v3[16] = @"onneedscontent";
  v3[17] = @"onplayersessionbegin";
  v2[18] = @"playersessionend";
  v2[19] = @"playerstatechange";
  v3[18] = @"onplayersessionend";
  v3[19] = @"onplayerstatechange";
  v2[20] = @"finish";
  v3[20] = @"onfinish";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:21];
  v1 = (void *)_eventXMLNameMap_eventXMLNameMap;
  _eventXMLNameMap_eventXMLNameMap = v0;
}

- (IKViewElementStyleComposer)styleComposer
{
  return self->_styleComposer;
}

- (void)setStyleComposer:(id)a3
{
}

- (BOOL)isPartOfPrototypeElement
{
  return self->_isPartOfPrototypeElement;
}

- (NSString)elementID
{
  return self->_elementID;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (IKViewElement)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (IKViewElement *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSArray)unfilteredChildren
{
  return self->_unfilteredChildren;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (NSString)autoHighlightIdentifier
{
  return self->_autoHighlightIdentifier;
}

- (void)setAutoHighlightIdentifier:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isImpressionable
{
  return self->_impressionable;
}

- (void)setImpressionable:(BOOL)a3
{
  self->_impressionable = a3;
}

- (NSDictionary)impressionableAttributes
{
  return self->_impressionableAttributes;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (IKChangeSet)unfilteredChildrenChangeSet
{
  return self->_unfilteredChildrenChangeSet;
}

- (NSArray)features
{
  return self->_features;
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void)setDataDictionary:(id)a3
{
}

- (NSString)classSelector
{
  return self->_classSelector;
}

- (BOOL)didUpdateAutoHighlightIdentifier
{
  return self->_didUpdateAutoHighlightIdentifier;
}

- (void)setDidUpdateAutoHighlightIdentifier:(BOOL)a3
{
  self->_didUpdateAutoHighlightIdentifier = a3;
}

- (NSMutableDictionary)metadataDict
{
  return self->_metadataDict;
}

- (void)setMetadataDict:(id)a3
{
}

- (NSMutableSet)activeSingularEvents
{
  return self->_activeSingularEvents;
}

- (void)setActiveSingularEvents:(id)a3
{
}

- (NSString)itmlID
{
  return self->_itmlID;
}

- (IKDataBinding)binding
{
  return self->_binding;
}

- (IKDOMBindingController)bindingController
{
  return self->_bindingController;
}

- (BOOL)areChildrenBound
{
  return self->_areChildrenBound;
}

- (BOOL)prototypesUpdated
{
  return self->_prototypesUpdated;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (unint64_t)implicitUpdateType
{
  return self->_implicitUpdateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_bindingController, 0);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_itmlID, 0);
  objc_storeStrong((id *)&self->_activeSingularEvents, 0);
  objc_storeStrong((id *)&self->_metadataDict, 0);
  objc_storeStrong((id *)&self->_classSelector, 0);
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_unfilteredChildrenChangeSet, 0);
  objc_storeStrong((id *)&self->_impressionableAttributes, 0);
  objc_storeStrong((id *)&self->_autoHighlightIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_destroyWeak((id *)&self->_parentStyleableElement);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_styleComposer, 0);
  objc_destroyWeak((id *)&self->_appDocument);
  objc_storeStrong((id *)&self->_visibleChildren, 0);
  objc_storeStrong((id *)&self->_unfilteredChildren, 0);
}

- (void)initWithDOMElement:(void *)a1 parent:(uint64_t)a2 elementFactory:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 elementName];
  int v6 = 138412546;
  char v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_DEBUG, "bound_css: applied for %@(%p)", (uint8_t *)&v6, 0x16u);
}

void __95__IKViewElement_dispatchEvent_eventAttribute_canBubble_isCancelable_extraInfo_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Can't dispatch event: %@ because target DOM element cannot be found", (uint8_t *)&v3, 0xCu);
}

@end