@interface IKViewElementFactory
+ (BOOL)elementsForDocumentElement:(id)a3 context:(id)a4;
+ (BOOL)isDependentByTagName:(id)a3;
+ (Class)elementClassByTagName:(id)a3;
+ (void)initialize;
+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5;
+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6;
- (BOOL)isSparse;
- (Class)elementClassByTagName:(id)a3;
- (IKViewElementFactory)initWithElementRegistry:(id)a3;
- (IKViewElementStyleFactory)styleFactory;
- (id)elementForDOMElement:(id)a3 parent:(id)a4;
- (unint64_t)elementTypeByTagName:(id)a3;
- (void)setSparse:(BOOL)a3;
- (void)setStyleFactory:(id)a3;
@end

@implementation IKViewElementFactory

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = (void *)sClassMap;
    sClassMap = (uint64_t)v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = (void *)sTypeMap_0;
    sTypeMap_0 = (uint64_t)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = (void *)sDependentMap;
    sDependentMap = (uint64_t)v6;

    +[IKViewElementFactory registerClass:objc_opt_class() forElementName:@"head" elementType:47];
    +[IKViewElementFactory registerClass:objc_opt_class() forElementName:@"img" elementType:49];
    +[IKViewElementFactory registerClass:objc_opt_class() forElementName:@"text" elementType:138];
    uint64_t v8 = objc_opt_class();
    +[IKViewElementFactory registerClass:v8 forElementName:@"span" elementType:138];
  }
}

+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5
{
}

+ (void)registerClass:(Class)a3 forElementName:(id)a4 elementType:(unint64_t)a5 dependent:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = v9;
  if (a3)
  {
    id v15 = v9;
    id v9 = (id)[v9 length];
    id v10 = v15;
    if (a5)
    {
      if (v9)
      {
        [(id)sClassMap setObject:a3 forKey:v15];
        v11 = (void *)sTypeMap_0;
        v12 = [NSNumber numberWithUnsignedInteger:a5];
        [v11 setObject:v12 forKey:v15];

        v13 = (void *)sDependentMap;
        v14 = [NSNumber numberWithBool:v6];
        [v13 setObject:v14 forKey:v15];

        id v10 = v15;
      }
    }
  }
  MEMORY[0x1F41817F8](v9, v10);
}

- (IKViewElementFactory)initWithElementRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKViewElementFactory;
  BOOL v6 = [(IKViewElementFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elementRegistry, a3);
  }

  return v7;
}

+ (Class)elementClassByTagName:(id)a3
{
  id v3 = a3;
  id v4 = +[IKAppContext currentAppContext];
  id v5 = [v4 viewElementRegistry];

  if (v5)
  {
    BOOL v6 = (void *)[v5 elementClassByTagName:v3];

    id v7 = v6;
  }
  else
  {
    id v7 = [(id)sClassMap objectForKeyedSubscript:v3];
  }
  return (Class)v7;
}

+ (BOOL)isDependentByTagName:(id)a3
{
  id v3 = a3;
  id v4 = +[IKAppContext currentAppContext];
  id v5 = [v4 viewElementRegistry];

  if (v5)
  {
    char v6 = [v5 isDependentByTagName:v3];
  }
  else
  {
    id v7 = [(id)sDependentMap objectForKeyedSubscript:v3];

    char v6 = [v7 BOOLValue];
    id v3 = v7;
  }

  return v6;
}

- (Class)elementClassByTagName:(id)a3
{
  elementRegistry = self->_elementRegistry;
  if (elementRegistry)
  {
    id v4 = [(IKViewElementRegistry *)elementRegistry elementClassByTagName:a3];
  }
  else
  {
    id v4 = [(id)sClassMap objectForKeyedSubscript:a3];
  }
  return v4;
}

- (unint64_t)elementTypeByTagName:(id)a3
{
  elementRegistry = self->_elementRegistry;
  if (elementRegistry)
  {
    return [(IKViewElementRegistry *)elementRegistry elementTypeByTagName:a3];
  }
  else
  {
    id v5 = [(id)sTypeMap_0 objectForKeyedSubscript:a3];
    unint64_t v6 = [v5 unsignedIntegerValue];

    return v6;
  }
}

+ (BOOL)elementsForDocumentElement:(id)a3 context:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tagName];
  int v8 = [v7 isEqualToString:@"document"];
  BOOL v9 = v8;
  if (!v8) {
    goto LABEL_90;
  }
  v80 = v7;
  BOOL v81 = v8;
  v82 = v6;
  v83 = v5;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v10 = [v5 childElements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v86 = 0;
    v87 = 0;
    v88 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v95;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v95 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        if (v13
          || ([*(id *)(*((void *)&v94 + 1) + 8 * i) tagName],
              v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v17 isEqualToString:@"head"],
              v17,
              (v18 & 1) == 0))
        {
          if (v87
            || ([v16 tagName],
                v20 = objc_claimAutoreleasedReturnValue(),
                char v21 = [v20 isEqualToString:@"navigationBar"],
                v20,
                (v21 & 1) == 0))
          {
            if (v86
              || ([v16 tagName],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  char v23 = [v22 isEqualToString:@"toolbar"],
                  v22,
                  (v23 & 1) == 0))
            {
              v19 = v16;
              if (v88) {
                continue;
              }
              goto LABEL_18;
            }
            v86 = v16;
          }
          else
          {
            v87 = v16;
          }
          v19 = v88;
        }
        else
        {
          v19 = v88;
          v13 = v16;
        }
LABEL_18:
        id v24 = v16;
        v88 = v19;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v94 objects:v99 count:16];
      if (!v12) {
        goto LABEL_23;
      }
    }
  }
  v86 = 0;
  v87 = 0;
  v88 = 0;
  v13 = 0;
LABEL_23:

  id v5 = v83;
  uint64_t v25 = [v83 jsNodeData];
  unint64_t v84 = +[IKViewElement evaluateElementUpdateType:v25];
  BOOL v85 = v84 != 0;
  v26 = v13;
  v27 = [v13 jsNodeData];
  id v6 = v82;
  v28 = [v82 headViewElement];
  v79 = (void *)v25;
  if (v28 || !v13)
  {
    v30 = [v82 headViewElement];
    if (v30) {
      BOOL v31 = v13 == 0;
    }
    else {
      BOOL v31 = 0;
    }
    int v29 = v31;
    if (v13)
    {
      if ([v27 isSubtreeUpdated] & 1) != 0 || (objc_msgSend(v27, "isChildrenUpdated")) {
        int v29 = 1;
      }
      else {
        int v29 = [v27 isUpdated];
      }
    }
  }
  else
  {
    int v29 = 1;
  }

  v32 = [v82 templateViewElement];
  v33 = [v32 elementName];
  v34 = [v88 tagName];
  int v35 = [v33 isEqualToString:v34];

  v78 = v27;
  int v77 = v35;
  if ((v84 | 4) == 4) {
    goto LABEL_39;
  }
  if ((v29 | v35 ^ 1) == 1)
  {
    BOOL v85 = 1;
LABEL_39:
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v36 = [v13 childElements];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      v39 = 0;
      uint64_t v40 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v91 != v40) {
            objc_enumerationMutation(v36);
          }
          v42 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          v43 = [v42 tagName];
          int v44 = [v43 isEqualToString:@"style"];

          if (v44)
          {
            uint64_t v45 = [v42 textContent];
            v46 = (void *)v45;
            if (v39)
            {
              uint64_t v47 = [v39 stringByAppendingString:v45];

              v39 = (void *)v47;
            }
            else
            {
              v39 = (void *)v45;
            }
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v90 objects:v98 count:16];
      }
      while (v38);
    }
    else
    {
      v39 = 0;
    }

    v48 = +[IKAppContext currentAppContext];
    if ([v48 appUsesDefaultStyleSheets])
    {
      v49 = [v88 tagName];
      v50 = +[IKTemplateStyleSheet styleSheetForTemplateName:v49];
    }
    else
    {
      v50 = 0;
    }
    id v6 = v82;
    id v5 = v83;
    v26 = v13;

    v51 = +[IKViewElementStyleFactory styleFactoryWithMarkup:v39 styleSheet:v50];
    [v82 setStyleFactory:v51];

    goto LABEL_58;
  }
  BOOL v85 = 0;
LABEL_58:
  v52 = [v6 styleFactory];
  v53 = [IKViewElementFactory alloc];
  v54 = +[IKAppContext currentAppContext];
  v55 = [v54 viewElementRegistry];
  v56 = [(IKViewElementFactory *)v53 initWithElementRegistry:v55];

  [(IKViewElementFactory *)v56 setSparse:v84 != 0];
  [(IKViewElementFactory *)v56 setStyleFactory:v52];
  if (v26)
  {
    if (v85)
    {
      v57 = [v26 jsNodeData];
      [v57 setUpdated:1];
    }
    v58 = [(IKViewElementFactory *)v56 elementForDOMElement:v26 parent:0];
    [v6 setHeadViewElement:v58];
  }
  if (v87)
  {
    if (v85)
    {
      v59 = [v87 jsNodeData];
      [v59 setUpdated:1];

      v60 = [(IKViewElementFactory *)v56 elementForDOMElement:v87 parent:0];
      [v60 disperseUpdateType:2];
    }
    else
    {
      v60 = [(IKViewElementFactory *)v56 elementForDOMElement:v87 parent:0];
    }
    [v6 setNavigationBarViewElement:v60];
  }
  if (v86)
  {
    if (v85)
    {
      v61 = [v86 jsNodeData];
      [v61 setUpdated:1];

      v62 = [(IKViewElementFactory *)v56 elementForDOMElement:v86 parent:0];
      [v62 disperseUpdateType:2];
    }
    else
    {
      v62 = [(IKViewElementFactory *)v56 elementForDOMElement:v86 parent:0];
    }
    [v6 setToolBarViewElement:v62];
  }
  if (v85)
  {
    v63 = [v88 jsNodeData];
    [v63 setUpdated:1];
  }
  if (!v84)
  {
    v64 = [v88 jsNodeData];
    [v64 setDataResolved:0];

    v65 = [v88 jsNodeData];
    [v65 setPrototypesResolved:0];

    v66 = [v88 jsNodeData];
    [v66 setRulesParsed:0];
  }
  v67 = ITMLKitGetLogObject(3);
  v68 = ITMLKitGetLogObject(3);
  os_signpost_id_t v69 = os_signpost_id_make_with_pointer(v68, &stru_1F3E09950);

  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v69, "DOMParsing", (const char *)&unk_1E2B9A9C2, buf, 2u);
  }

  v70 = [(IKViewElementFactory *)v56 elementForDOMElement:v88 parent:0];
  v71 = ITMLKitGetLogObject(3);
  v72 = ITMLKitGetLogObject(3);
  os_signpost_id_t v73 = os_signpost_id_make_with_pointer(v72, &stru_1F3E09950);

  if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v71, OS_SIGNPOST_INTERVAL_END, v73, "DOMParsing", (const char *)&unk_1E2B9A9C2, buf, 2u);
  }

  if (v85) {
    [v70 disperseUpdateType:2];
  }
  [v6 setTemplateViewElement:v70];
  uint64_t v74 = 4;
  if (v77) {
    uint64_t v74 = 1;
  }
  if (v84) {
    uint64_t v75 = v74;
  }
  else {
    uint64_t v75 = 0;
  }
  [v6 setUpdateType:v75];

  BOOL v9 = v81;
  id v7 = v80;
LABEL_90:

  return v9;
}

- (void)setSparse:(BOOL)a3
{
  *(unsigned char *)&self->_parsingFlags = *(unsigned char *)&self->_parsingFlags & 0xFE | a3;
}

- (BOOL)isSparse
{
  return *(unsigned char *)&self->_parsingFlags & 1;
}

- (id)elementForDOMElement:(id)a3 parent:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_6;
  }
  int v8 = [v6 tagName];
  if ([v8 isEqualToString:@"placeholder"]) {
    goto LABEL_5;
  }
  BOOL v9 = [v6 tagName];
  if ([v9 isEqualToString:@"prototypes"])
  {

LABEL_5:
LABEL_6:
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = [v6 tagName];
  char v13 = [v12 isEqualToString:@"rules"];

  if (v13) {
    goto LABEL_6;
  }
  char parsingFlags = (char)self->_parsingFlags;
  char v15 = parsingFlags;
  if ((parsingFlags & 8) != 0 || (v16 = [v6 _isPrototypeElement], char v15 = (char)self->_parsingFlags, v16))
  {
    char v17 = 8;
    char v18 = 1;
  }
  else
  {
    char v18 = 0;
    char v17 = 0;
  }
  *(unsigned char *)&self->_char parsingFlags = v17 | v15 & 0xF7;
  if (v15) {
    char v19 = v18;
  }
  else {
    char v19 = 1;
  }
  v20 = [v6 jsNodeData];
  char v21 = v20;
  if ((v19 & 1) != 0 || ([v20 containsUpdates] & 1) != 0 || (*(unsigned char *)&self->_parsingFlags & 6) != 0)
  {
    char v22 = parsingFlags & 8;
    char v23 = [v6 tagName];
    id v24 = [(IKViewElementFactory *)self elementClassByTagName:v23];
    if (v24)
    {
      uint64_t v25 = v24;
      if ((*(unsigned char *)&self->_parsingFlags & 0xA) == 2) {
        id v24 = (objc_class *)[v21 setUpdated:1];
      }
      v26 = (void *)MEMORY[0x1E4E655C0](v24);
      [(objc_class *)v25 willParseDOMElement:v6];
      char v27 = (char)self->_parsingFlags;
      char v28 = v27 & 2;
      if (v19)
      {
        char v29 = 0;
        char v30 = v27 & 0xFD;
      }
      else
      {
        char v33 = [v21 isUpdated];
        char v34 = 2;
        if ((v33 & 1) == 0 && (v27 & 2) == 0)
        {
          if ([(objc_class *)v25 shouldParseChildDOMElements]) {
            char v34 = 0;
          }
          else {
            char v34 = 2;
          }
        }
        char v27 = (char)self->_parsingFlags;
        *(unsigned char *)&self->_char parsingFlags = v27 & 0xFD | v34;
        if ([v21 isChildrenUpdated]) {
          char v29 = 4;
        }
        else {
          char v29 = 0;
        }
        char v30 = (char)self->_parsingFlags;
      }
      char v35 = v27 & 4;
      *(unsigned char *)&self->_char parsingFlags = v30 & 0xFB | v29;
      v36 = (void *)[[v25 alloc] initWithDOMElement:v6 parent:v7 elementFactory:self];
      id v10 = v36;
      if ((v19 & 1) != 0 || (char v37 = (char)self->_parsingFlags, (v37 & 2) != 0))
      {
        char v44 = v35;
        char v45 = v28;
        v46 = v23;
        char v47 = v22;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v38 = [v36 features];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v49 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v43 migrateToViewElement:v10];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
          }
          while (v40);
        }

        char v37 = (char)self->_parsingFlags;
        char v22 = v47;
        char v23 = v46;
        char v35 = v44;
        char v28 = v45;
      }
      char v32 = v35 | v28 | v37 & 0xF9;
    }
    else
    {
      BOOL v31 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[IKViewElementFactory elementForDOMElement:parent:]((uint64_t)v23, v31);
      }

      id v10 = 0;
      char v32 = (char)self->_parsingFlags;
    }
    *(unsigned char *)&self->_char parsingFlags = v32 & 0xF7 | v22;
  }
  else
  {
    id v10 = 0;
  }

LABEL_7:
  return v10;
}

- (IKViewElementStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void)setStyleFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_storeStrong((id *)&self->_elementRegistry, 0);
}

- (void)elementForDOMElement:(uint64_t)a1 parent:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unsupported tag [%@]", (uint8_t *)&v2, 0xCu);
}

@end