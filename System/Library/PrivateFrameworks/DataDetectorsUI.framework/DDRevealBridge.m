@interface DDRevealBridge
+ (BOOL)_revealItem:(id)a3 view:(id)a4 location:(CGPoint)a5 menuInteraction:(id)a6 context:(id)a7;
+ (BOOL)_textActionsAreAvailableForItem:(id)a3;
+ (BOOL)performDefaultActionForRVItem:(id)a3 view:(id)a4 location:(CGPoint)a5 fallbackMenuInteraction:(id)a6 context:(id)a7;
+ (BOOL)underlyingViewDisappeared:(id)a3;
+ (id)_lookupTextForText:(id)a3;
+ (id)contextMenuConfigurationWithRVItem:(id)a3 view:(id)a4 context:(id)a5 menuIdentifier:(id)a6;
+ (id)updatedTextInteractionMenuElements:(id)a3 withRVItem:(id)a4 view:(id)a5 context:(id)a6;
@end

@implementation DDRevealBridge

+ (BOOL)_revealItem:(id)a3 view:(id)a4 location:(CGPoint)a5 menuInteraction:(id)a6 context:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void *)[a7 copy];
  if (v12)
  {
    v16 = 0;
    switch([v12 normalizedType])
    {
      case 1:
        v17 = [v12 normalizedURL];
        v16 = v17;
        if (!v17 || (dd_urlLooksSuspicious(v17) & 1) != 0) {
          goto LABEL_21;
        }
        v18 = +[DDContextMenuAction defaultActionWithURL:v16 context:v15];
        goto LABEL_18;
      case 2:
        v19 = [v12 text];
        if (![v19 length] || !+[DDParsecAction isAvailable](DDLookupAction, "isAvailable")) {
          goto LABEL_16;
        }
        v20 = [DDLookupAction alloc];
        uint64_t v21 = [v12 highlightRange];
        v18 = -[DDLookupAction initWithQueryString:range:context:](v20, "initWithQueryString:range:context:", v19, v21, v22, v15);
        break;
      case 3:
        v23 = [v12 ddResult];
        uint64_t v24 = [v23 coreResult];

        if (!v24) {
          goto LABEL_12;
        }
        v18 = +[DDContextMenuAction defaultActionWithResult:v24 context:v15];
        v16 = 0;
        if (!v18) {
          goto LABEL_21;
        }
        goto LABEL_19;
      case 6:
        v19 = [v12 query];
        if (v19 && +[DDParsecAction isAvailable])
        {
          v25 = [DDLookupAction alloc];
          v26 = [v12 reportAnIssueExtendedBlock];
          v27 = [v12 reportAnIssueMetadataFetchingBlock];
          v18 = [(DDLookupAction *)v25 initWithRVQuery:v19 reportAnIssueBlock:v26 metadataFetchingBlock:v27 context:v15];
        }
        else
        {
LABEL_16:
          v18 = 0;
        }
        break;
      default:
        goto LABEL_21;
    }

    v16 = 0;
LABEL_18:
    uint64_t v24 = 0;
    if (v18)
    {
LABEL_19:
      if (v24)
      {
        v28 = +[DDDetectionController sharedController];
        [v28 interactionDidStartForResult:v24];
      }
      else
      {
        if (!v16)
        {
LABEL_27:
          v30 = [[DDRVInteractionDelegate alloc] initWithItem:v12];
          v31 = +[DDDetectionController sharedController];
          [v31 performAction:v18 inView:v13 interactionDelegate:v30];

          goto LABEL_28;
        }
        v28 = +[DDDetectionController sharedController];
        [v28 interactionDidStartForURL:v16];
      }

      goto LABEL_27;
    }
  }
  else
  {
LABEL_12:
    v16 = 0;
  }
LABEL_21:
  if (v14)
  {
    objc_msgSend(v14, "_presentMenuAtLocation:", x, y);
LABEL_28:
    BOOL v29 = 1;
    goto LABEL_29;
  }
  BOOL v29 = 0;
LABEL_29:

  return v29;
}

+ (BOOL)performDefaultActionForRVItem:(id)a3 view:(id)a4 location:(CGPoint)a5 fallbackMenuInteraction:(id)a6 context:(id)a7
{
  return +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", a3, a4, a6, a7, a5.x, a5.y);
}

+ (id)contextMenuConfigurationWithRVItem:(id)a3 view:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  return +[DDContextMenuAction contextMenuConfigurationWithRVItem:a3 inView:a4 context:a5 menuIdentifier:a6];
}

+ (id)_lookupTextForText:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_lookupTextForText__onceToken != -1) {
      dispatch_once(&_lookupTextForText__onceToken, &__block_literal_global_8);
    }
    v4 = [v3 componentsSeparatedByCharactersInSet:_lookupTextForText__undesirableChars];
    v5 = [v4 componentsJoinedByString:@" "];
    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v7 = [v5 stringByTrimmingCharactersInSet:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __37__DDRevealBridge__lookupTextForText___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 65532, 1);
  v1 = (void *)_lookupTextForText__undesirableChars;
  _lookupTextForText__undesirableChars = v0;

  v2 = (void *)_lookupTextForText__undesirableChars;
  id v3 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [v2 formUnionWithCharacterSet:v3];
}

+ (BOOL)_textActionsAreAvailableForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 normalizedType];
  if (v5 == 2) {
    goto LABEL_4;
  }
  if (v5 != 3)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v6 = [v4 originalSelectedText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
LABEL_4:
    v8 = [v4 originalSelectedText];

    if (v8)
    {
      v9 = [v4 originalSelectedText];
      goto LABEL_15;
    }
    uint64_t v10 = [v4 highlightRange];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL
      || (unint64_t v12 = v10 + v11,
          [v4 text],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unint64_t v14 = [v13 length],
          v13,
          v12 > v14))
    {
      v15 = 0;
      LOBYTE(v16) = 0;
      goto LABEL_26;
    }
    v19 = [v4 text];
    uint64_t v21 = [v4 highlightRange];
    uint64_t v20 = objc_msgSend(v19, "substringWithRange:", v21, v22);
    goto LABEL_14;
  }
  v17 = [v4 ddResult];
  unsigned int v18 = [v17 category];

  v9 = 0;
  if (v18 <= 6 && ((1 << v18) & 0x58) != 0)
  {
    v19 = [v4 ddResult];
    uint64_t v20 = [v19 matchedString];
LABEL_14:
    v9 = (void *)v20;
  }
LABEL_15:
  if ((unint64_t)([v9 length] - 513) >= 0xFFFFFFFFFFFFFE00)
  {
    v15 = [a1 _lookupTextForText:v9];

    unint64_t v23 = [v15 length];
    BOOL v16 = v23;
    if (v23)
    {
      if (v23 >= 0x21)
      {
        uint64_t v24 = [v15 componentsSeparatedByString:@" "];
        if ((unint64_t)([v24 count] - 33) >= 0xFFFFFFFFFFFFFFE0)
        {
          v25 = [v24 componentsJoinedByString:&stru_1EF5023D8];
          unint64_t v26 = [v25 length];

          if (v26 >= 0x21)
          {
            uint64_t v30 = 0;
            v31 = &v30;
            uint64_t v32 = 0x2020000000;
            uint64_t v33 = 0;
            v27 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __50__DDRevealBridge__textActionsAreAvailableForItem___block_invoke;
            v29[3] = &unk_1E5A85CD8;
            v29[4] = &v30;
            objc_msgSend(v27, "enumerateTokensInRange:usingBlock:", 0, v16, v29);
            LOBYTE(v16) = (unint64_t)v31[3] < 0x21;

            _Block_object_dispose(&v30, 8);
          }
          else
          {
            LOBYTE(v16) = 1;
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v16) = 0;
    v15 = v9;
  }
LABEL_26:

  return v16;
}

uint64_t __50__DDRevealBridge__textActionsAreAvailableForItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= 0x20uLL) {
    *a5 = 1;
  }
  return result;
}

+ (id)updatedTextInteractionMenuElements:(id)a3 withRVItem:(id)a4 view:(id)a5 context:(id)a6
{
  uint64_t v199 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v140 = a4;
  id v10 = a5;
  id v139 = a6;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v189 objects:v198 count:16];
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v190;
  uint64_t v150 = *MEMORY[0x1E4F43BC8];
  v129 = v172;
  uint64_t v132 = *MEMORY[0x1E4F5EF80];
  uint64_t v131 = *MEMORY[0x1E4F5F0E8];
LABEL_3:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v190 != v14) {
      objc_enumerationMutation(v11);
    }
    BOOL v16 = *(void **)(*((void *)&v189 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v17 = v16;
    unsigned int v18 = objc_msgSend(v17, "identifier", v129);
    char v19 = [v18 isEqualToString:v150];

    if (v19) {
      break;
    }

LABEL_9:
    if (v13 == ++v15)
    {
      uint64_t v13 = [v11 countByEnumeratingWithState:&v189 objects:v198 count:16];
      if (!v13)
      {
LABEL_11:

        id v20 = v11;
        uint64_t v21 = v140;
        goto LABEL_169;
      }
      goto LABEL_3;
    }
  }
  v137 = (void *)[v11 mutableCopy];
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  obuint64_t j = [v17 children];
  uint64_t v146 = [obj countByEnumeratingWithState:&v185 objects:v197 count:16];
  id v148 = v11;
  id v161 = v17;
  if (!v146)
  {
    v157 = 0;
    v158 = 0;
    id v22 = 0;
    unint64_t v23 = 0;
    v156 = 0;
    v138 = 0;
    v141 = 0;
    v149 = 0;
    goto LABEL_47;
  }
  v157 = 0;
  v158 = 0;
  id v22 = 0;
  unint64_t v23 = 0;
  v156 = 0;
  v138 = 0;
  v141 = 0;
  v149 = 0;
  uint64_t v144 = *(void *)v186;
  while (2)
  {
    uint64_t v24 = 0;
    while (2)
    {
      v159 = v22;
      if (*(void *)v186 != v144) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v185 + 1) + 8 * v24);
      unint64_t v26 = +[DDContextMenuAction identificationStringsForMenuElement:v25 useDefault:1];
      if (([v26 containsObject:@"_define:"] & 1) != 0
        || ([v26 containsObject:@"define:"] & 1) != 0)
      {
        v27 = v149;
        BOOL v29 = v156;
        v28 = v157;
        uint64_t v30 = v25;
        v149 = v26;
        goto LABEL_20;
      }
      if (([v26 containsObject:@"_lookup:"] & 1) != 0
        || ([v26 containsObject:@"lookup:"] & 1) != 0)
      {
        uint64_t v30 = v23;
        v27 = v141;
        unint64_t v23 = v159;
        BOOL v29 = v156;
        v28 = v157;
        v159 = v25;
        v141 = v26;
        goto LABEL_20;
      }
      if (([v26 containsObject:@"_translate:"] & 1) != 0
        || ([v26 containsObject:@"translate:"] & 1) != 0)
      {
        uint64_t v30 = v23;
        v27 = v138;
        v28 = v157;
        unint64_t v23 = v158;
        v158 = v25;
        BOOL v29 = v156;
        v138 = v26;
        goto LABEL_20;
      }
      uint64_t v30 = v23;
      if ([v26 containsObject:@"_findSelected:"])
      {
        v27 = v156;
        unint64_t v23 = v157;
        v28 = v25;
        BOOL v29 = v26;
        goto LABEL_20;
      }
      v27 = v156;
      uint64_t v33 = v157;
      unint64_t v23 = v157;
      v28 = v25;
      BOOL v29 = v26;
      if ([v26 containsObject:@"findSelected:"])
      {
LABEL_20:
        id v31 = v26;

        id v32 = v25;
        uint64_t v33 = v28;
        v156 = v29;
      }

      unint64_t v23 = v30;
      id v22 = v159;
      if (v30) {
        BOOL v34 = v159 == 0;
      }
      else {
        BOOL v34 = 1;
      }
      BOOL v35 = v34 || v158 == 0;
      v157 = v33;
      if (!v35 && v33 != 0)
      {
        id v11 = v148;
        id v17 = v161;
        goto LABEL_47;
      }
      ++v24;
      id v11 = v148;
      id v17 = v161;
      if (v146 != v24) {
        continue;
      }
      break;
    }
    uint64_t v37 = [obj countByEnumeratingWithState:&v185 objects:v197 count:16];
    uint64_t v146 = v37;
    if (v37) {
      continue;
    }
    break;
  }
LABEL_47:
  v160 = v22;

  v147 = v23;
  if (objc_opt_respondsToSelector())
  {
    v38 = [v149 arrayByAddingObjectsFromArray:v141];
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id v39 = v38;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v181 objects:v196 count:16];
    v41 = v157;
    if (v40)
    {
      uint64_t v42 = v40;
      int v43 = 0;
      uint64_t v44 = *(void *)v182;
      if (!v22) {
        id v22 = v17;
      }
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v182 != v44) {
            objc_enumerationMutation(v39);
          }
          v43 |= [v10 canPerformAction:NSSelectorFromString(*(NSString **)(*((void *)&v181 + 1) + 8 * i)) withSender:v22];
        }
        uint64_t v42 = [v39 countByEnumeratingWithState:&v181 objects:v196 count:16];
      }
      while (v42);
    }
    else
    {
      int v43 = 0;
    }

    SEL v46 = 0;
    if (v147 && (v43 & 1) == 0 && !v160)
    {
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      uint64_t v47 = [&unk_1EF510C98 countByEnumeratingWithState:&v177 objects:v195 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        SEL v46 = 0;
        uint64_t v49 = *(void *)v178;
        do
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v178 != v49) {
              objc_enumerationMutation(&unk_1EF510C98);
            }
            if (!v46)
            {
              v51 = *(NSString **)(*((void *)&v177 + 1) + 8 * j);
              if ([v10 canPerformAction:NSSelectorFromString(v51) withSender:v161])
              {
                SEL v46 = NSSelectorFromString(v51);
                int v43 = 1;
              }
              else
              {
                SEL v46 = 0;
              }
            }
          }
          uint64_t v48 = [&unk_1EF510C98 countByEnumeratingWithState:&v177 objects:v195 count:16];
        }
        while (v48);
      }
      else
      {
        SEL v46 = 0;
      }
    }

    id v17 = v161;
    unint64_t v23 = v147;
  }
  else
  {
    SEL v46 = 0;
    int v43 = 1;
    v41 = v157;
  }
  v52 = 0;
  uint64_t v21 = v140;
  if (!v140)
  {
    id obja = 0;
    v145 = 0;
    goto LABEL_93;
  }
  id obja = 0;
  v145 = 0;
  if ((v43 & 1) == 0) {
    goto LABEL_93;
  }
  v53 = [[DDContextMenuAction alloc] initWithRVItem:v140];
  v54 = [v139 objectForKeyedSubscript:@"kDDContextNoRoomForSubtitlesKey"];
  int v55 = [v54 BOOLValue];

  if (v55) {
    uint64_t v56 = 5;
  }
  else {
    uint64_t v56 = 1;
  }
  id v176 = 0;
  id v57 = [(DDContextMenuAction *)v53 contextMenuConfigurationWithIdentifier:v150 inView:v10 context:v139 defaultAction:0 menuProvider:&v176 options:v56];
  id v58 = v176;
  v59 = v58;
  if (!v58)
  {
    id obja = 0;
LABEL_89:

    v52 = 0;
    goto LABEL_90;
  }
  v151 = v53;
  v60 = (*((void (**)(id, id))v58 + 2))(v58, v11);
  v61 = [v60 children];
  uint64_t v62 = [v61 count];

  id obja = v60;
  if (!v62)
  {
    v53 = v151;
    goto LABEL_89;
  }
  v63 = [v60 children];
  v64 = (void *)[v63 mutableCopy];

  v52 = v64;
  if (!v64) {
    goto LABEL_90;
  }
  v65 = [v64 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = [v64 firstObject];
  }
  else
  {
    v66 = 0;
  }

  v107 = [v66 identifier];
  char v108 = [v107 hasPrefix:@"com.apple.datadetectors.DDSearchWebAction"];

  if (v108)
  {
    v145 = v66;
    [v52 removeObjectAtIndex:0];
    goto LABEL_91;
  }

  v109 = v140;
  uint64_t v110 = [v140 normalizedType];
  if (v110 == 2)
  {
LABEL_190:
    v113 = [v109 originalSelectedText];
    v114 = [DDSearchWebAction alloc];
    if (v113)
    {
      v115 = -[DDSearchWebAction initWithQueryString:range:context:](v114, "initWithQueryString:range:context:", v113, 0, [v113 length], v139);
    }
    else
    {
      [v109 text];
      v117 = v116 = v52;
      uint64_t v118 = [v109 highlightRange];
      v115 = -[DDSearchWebAction initWithQueryString:range:context:](v114, "initWithQueryString:range:context:", v117, v118, v119, v139);

      v52 = v116;
    }
    id v17 = v161;
LABEL_197:

    if (v115)
    {
      v136 = v52;
      v120 = [[DDRVInteractionDelegate alloc] initWithItem:v140];
      v155 = (void *)MEMORY[0x1E4F426E8];
      v121 = [(DDSearchWebAction *)v115 localizedName];
      v122 = [(DDAction *)v115 icon];
      v123 = [(DDAction *)v115 generateIdentifier];
      v171[0] = MEMORY[0x1E4F143A8];
      v171[1] = 3221225472;
      v172[0] = __77__DDRevealBridge_updatedTextInteractionMenuElements_withRVItem_view_context___block_invoke;
      v172[1] = &unk_1E5A85D00;
      v173 = v115;
      id v174 = v10;
      v175 = v120;
      v124 = v115;
      v125 = v120;
      v145 = [v155 actionWithTitle:v121 image:v122 identifier:v123 handler:v171];

      v52 = v136;
      goto LABEL_199;
    }
LABEL_90:
    v145 = 0;
    goto LABEL_91;
  }
  if (v110 != 3)
  {
    v145 = 0;
LABEL_199:
    uint64_t v21 = v140;
    id v17 = v161;
    goto LABEL_92;
  }
  v109 = v140;
  v111 = [v140 originalSelectedText];
  uint64_t v112 = [v111 length];

  if (v112) {
    goto LABEL_190;
  }
  v126 = [v140 ddResult];
  unsigned int v127 = [v126 category];

  v145 = 0;
  if (v127 > 6) {
    goto LABEL_199;
  }
  id v17 = v161;
  if (((1 << v127) & 0x58) != 0)
  {
    v128 = [v140 ddResult];
    v113 = [v128 matchedString];

    v115 = -[DDSearchWebAction initWithQueryString:range:context:]([DDSearchWebAction alloc], "initWithQueryString:range:context:", v113, 0, [v113 length], v139);
    goto LABEL_197;
  }
LABEL_91:
  uint64_t v21 = v140;
LABEL_92:
  unint64_t v23 = v147;
LABEL_93:
  v135 = v52;
  if ([v21 normalizedType] == 1)
  {
LABEL_96:
    int v68 = 0;
    LOBYTE(v69) = 0;
    BOOL v70 = v158 != 0;
  }
  else
  {
    v67 = [v21 ddResult];
    if ([v67 category] == 2)
    {

      goto LABEL_96;
    }
    [v21 ddResult];
    v78 = v77 = v21;
    if ([v78 category] == 1)
    {

      int v68 = 0;
      LOBYTE(v69) = 0;
      BOOL v70 = v158 != 0;
      uint64_t v21 = v77;
      goto LABEL_202;
    }
    v130 = [v77 ddResult];
    uint64_t v69 = [v130 type];
    if ([(id)v69 isEqualToString:v132])
    {
      int v153 = 0;
    }
    else
    {
      v100 = [v77 ddResult];
      v101 = [v100 type];
      int v153 = [v101 isEqualToString:v131] ^ 1;

      id v11 = v148;
    }
    unint64_t v23 = v147;

    LOBYTE(v69) = 0;
    BOOL v70 = v158 != 0;
    int v68 = v153;
    if (v153)
    {
      uint64_t v21 = v140;
      if (v158)
      {
        if (objc_opt_respondsToSelector())
        {
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          id v102 = v138;
          uint64_t v103 = [v102 countByEnumeratingWithState:&v167 objects:v194 count:16];
          if (v103)
          {
            uint64_t v104 = v103;
            LODWORD(v69) = 0;
            uint64_t v105 = *(void *)v168;
            do
            {
              for (uint64_t k = 0; k != v104; ++k)
              {
                if (*(void *)v168 != v105) {
                  objc_enumerationMutation(v102);
                }
                LODWORD(v69) = v69 | [v10 canPerformAction:NSSelectorFromString(*(NSString **)(*((void *)&v167 + 1) + 8 * k)) withSender:v158];
              }
              uint64_t v104 = [v102 countByEnumeratingWithState:&v167 objects:v194 count:16];
            }
            while (v104);
          }
          else
          {
            LOBYTE(v69) = 0;
          }

          BOOL v70 = 1;
          int v68 = 1;
          uint64_t v21 = v140;
          id v17 = v161;
LABEL_202:
          unint64_t v23 = v147;
        }
        else
        {
          BOOL v70 = 1;
          int v68 = 1;
          LOBYTE(v69) = 1;
        }
      }
    }
    else
    {
      uint64_t v21 = v140;
    }
  }
  BOOL v133 = v70;
  if (!v41)
  {
    uint64_t v162 = [v137 indexOfObject:v17];
    if ((v43 & v68) == 1)
    {
      LOBYTE(v74) = 1;
      goto LABEL_119;
    }
    id v79 = v160;
    if ((v69 & 1) == 0) {
      goto LABEL_142;
    }
    goto LABEL_113;
  }
  if (objc_opt_respondsToSelector())
  {
    int v152 = v68;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v71 = v156;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v163 objects:v193 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      int v74 = 0;
      uint64_t v75 = *(void *)v164;
      do
      {
        for (uint64_t m = 0; m != v73; ++m)
        {
          if (*(void *)v164 != v75) {
            objc_enumerationMutation(v71);
          }
          v74 |= [v10 canPerformAction:NSSelectorFromString(*(NSString **)(*((void *)&v163 + 1) + 8 * m)) withSender:v41];
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v163 objects:v193 count:16];
      }
      while (v73);
    }
    else
    {
      LOBYTE(v74) = 0;
    }

    uint64_t v21 = v140;
    id v17 = v161;
    unint64_t v23 = v147;
    int v68 = v152;
  }
  else
  {
    LOBYTE(v74) = 1;
  }
  uint64_t v162 = [v137 indexOfObject:v17];
  if ((v43 & v68 & 1) == 0)
  {
    id v79 = v160;
    if (v74)
    {
      v80 = v137;
      [v137 replaceObjectAtIndex:v162++ withObject:v41];
      id v11 = v148;
      goto LABEL_164;
    }
    id v11 = v148;
    if ((v69 & 1) == 0)
    {
LABEL_142:
      v80 = v137;
      [v137 removeObject:v17];
      goto LABEL_164;
    }
LABEL_113:
    v80 = v137;
    [v137 replaceObjectAtIndex:v162++ withObject:v158];
    goto LABEL_164;
  }
LABEL_119:
  v81 = [v17 children];
  v154 = (void *)[v81 mutableCopy];

  id v79 = v160;
  if (v160) {
    BOOL v82 = 1;
  }
  else {
    BOOL v82 = v23 == 0;
  }
  int v83 = !v82;
  if (!v82 && v46)
  {
    v84 = (void *)MEMORY[0x1E4F428D0];
    v85 = [v23 title];
    v86 = [v23 image];
    id v79 = [v84 commandWithTitle:v85 image:v86 action:v46 propertyList:0];

    uint64_t v87 = [v154 indexOfObject:v147];
    if (v87 != 0x7FFFFFFFFFFFFFFFLL) {
      [v154 replaceObjectAtIndex:v87 withObject:v79];
    }
    uint64_t v21 = v140;
    goto LABEL_136;
  }
  if (v46) {
    int v83 = 0;
  }
  if (v83 == 1)
  {
    id v79 = v23;
LABEL_137:
    if ([v21 normalizedType] == 2
      && ![a1 _textActionsAreAvailableForItem:v21])
    {
      char v88 = 0;
    }
    else
    {
      char v88 = 1;
      if (+[DDParsecAction isAvailable])
      {
        int v89 = 0;
        goto LABEL_146;
      }
    }
    [v154 removeObject:v79];
    int v89 = 1;
  }
  else
  {
LABEL_136:
    if (v79) {
      goto LABEL_137;
    }
    int v89 = 0;
    char v88 = 0;
  }
LABEL_146:
  if (!(v69 & 1 | !v133))
  {
    [v154 removeObject:v158];
    int v89 = 1;
  }
  v80 = v137;
  if ((v74 & 1) == 0)
  {
    [v154 removeObject:v41];
    char v91 = v88 ^ 1;
    if (!v145) {
      char v91 = 1;
    }
    if (v91) {
      goto LABEL_159;
    }
LABEL_158:
    objc_msgSend(v154, "addObject:");
    goto LABEL_159;
  }
  if (v145) {
    char v90 = v88;
  }
  else {
    char v90 = 0;
  }
  if (v90) {
    goto LABEL_158;
  }
  if (!v89)
  {
    ++v162;
    id v11 = v148;
    goto LABEL_162;
  }
LABEL_159:
  id v92 = v79;
  v93 = [v17 children];
  uint64_t v94 = [v93 count];

  id v11 = v148;
  if (v94)
  {
    v95 = v154;
    uint64_t v96 = [v17 menuByReplacingChildren:v154];

    [v137 replaceObjectAtIndex:v162++ withObject:v96];
    id v17 = (id)v96;
    id v79 = v92;
    v41 = v157;
  }
  else
  {
    [v137 removeObjectAtIndex:v162];
    id v79 = v92;
    v41 = v157;
LABEL_162:
    v95 = v154;
  }

LABEL_164:
  if ((v43 & 1) != 0 && [v135 count])
  {
    uint64_t v97 = [obja menuByReplacingChildren:v135];

    [v80 insertObject:v97 atIndex:v162];
    v98 = (void *)v97;
  }
  else
  {
    v98 = obja;
  }
  id v20 = v80;

LABEL_169:
  return v20;
}

uint64_t __77__DDRevealBridge_updatedTextInteractionMenuElements_withRVItem_view_context___block_invoke(void *a1)
{
  return +[DDContextMenuAction performAction:a1[4] fromView:a1[5] alertController:0 interactionDelegate:a1[6]];
}

+ (BOOL)underlyingViewDisappeared:(id)a3
{
  id v3 = a3;
  id v4 = +[DDDetectionController sharedController];
  char v5 = [v4 tryDismissActionInView:v3];

  return v5;
}

@end