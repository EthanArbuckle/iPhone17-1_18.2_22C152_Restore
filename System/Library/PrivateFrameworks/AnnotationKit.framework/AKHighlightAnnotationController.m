@interface AKHighlightAnnotationController
- (AKController)controller;
- (AKHighlightAnnotation)continuousHighlight;
- (AKHighlightAnnotationController)initWithController:(id)a3;
- (BOOL)_adaptExistingHighlightsToNewHighlight:(id)a3 onPageController:(id)a4 firstModifiedHighlight:(id *)a5;
- (BOOL)_clearHighlightsWithStyleMatchingMask:(unint64_t)a3 except:(id)a4 inRange:(_NSRange)a5 onPageController:(id)a6;
- (id)_createHighlightAnnotationWithAttributeTag:(int64_t)a3;
- (id)_highlightsInCharacterIndexRange:(_NSRange)a3 onPageController:(id)a4;
- (id)highlightsWithinSelection;
- (void)beginContinuousHighlighting;
- (void)clearHighlightsWithinSelection;
- (void)continueHighlighting;
- (void)endContinuousHighlighting;
- (void)performOneShotHighlightWithAttributeTag:(int64_t)a3;
- (void)setContinuousHighlight:(id)a3;
- (void)setController:(id)a3;
@end

@implementation AKHighlightAnnotationController

- (AKHighlightAnnotationController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKHighlightAnnotationController;
  v5 = [(AKHighlightAnnotationController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

- (void)performOneShotHighlightWithAttributeTag:(int64_t)a3
{
  v5 = [(AKHighlightAnnotationController *)self controller];
  v6 = [v5 delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector())
    {
      v7 = [v5 currentPageController];
      objc_super v8 = objc_msgSend(v6, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v7, "pageIndex"), v5);
      v9 = [(AKHighlightAnnotationController *)self _createHighlightAnnotationWithAttributeTag:a3];
      v10 = objc_msgSend(v6, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v8, objc_msgSend(v7, "pageIndex"), v5);
      [v9 setQuadPoints:v10];
      id v18 = 0;
      BOOL v11 = [(AKHighlightAnnotationController *)self _adaptExistingHighlightsToNewHighlight:v9 onPageController:v7 firstModifiedHighlight:&v18];
      id v12 = v18;
      if (v11)
      {
        v13 = [v5 toolController];
        [v13 addNewAnnotation:v9 onPageController:v7 shouldSelect:1 shouldCascade:0];

        id v14 = v9;
        id v12 = v14;
      }
      if (v12)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_23766EDB4;
        block[3] = &unk_264CDB110;
        id v16 = v7;
        id v17 = v12;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
    else
    {
      NSLog(&cfstr_SDelegateDoesN_0.isa, "-[AKHighlightAnnotationController performOneShotHighlightWithAttributeTag:]");
    }
  }
  else
  {
    NSLog(&cfstr_SDelegateDoesN.isa, "-[AKHighlightAnnotationController performOneShotHighlightWithAttributeTag:]");
  }
}

- (void)clearHighlightsWithinSelection
{
  id v6 = [(AKHighlightAnnotationController *)self controller];
  v3 = [v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v6 currentPageController];
      v5 = objc_msgSend(v3, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v4, "pageIndex"), v6);
      -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](self, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", -1, 0, [v5 firstIndex], objc_msgSend(v5, "lastIndex") - objc_msgSend(v5, "firstIndex") + 1, v4);
    }
    else
    {
      NSLog(&cfstr_SDelegateDoesN.isa, "-[AKHighlightAnnotationController clearHighlightsWithinSelection]");
    }
  }
  else
  {
    NSLog(&cfstr_SDelegateDoesN_1.isa, "-[AKHighlightAnnotationController clearHighlightsWithinSelection]");
  }
}

- (id)highlightsWithinSelection
{
  v3 = [(AKHighlightAnnotationController *)self controller];
  id v4 = [v3 delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if ([v4 hasHighlightableSelectionForAnnotationController:v3])
    {
      v5 = [v3 currentPageController];
      id v6 = objc_msgSend(v4, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v5, "pageIndex"), v3);
      v7 = -[AKHighlightAnnotationController _highlightsInCharacterIndexRange:onPageController:](self, "_highlightsInCharacterIndexRange:onPageController:", [v6 firstIndex], objc_msgSend(v6, "lastIndex") - objc_msgSend(v6, "firstIndex") + 1, v5);

      goto LABEL_7;
    }
  }
  else
  {
    NSLog(&cfstr_SDelegateDoesN.isa, "-[AKHighlightAnnotationController highlightsWithinSelection]");
  }
  v7 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v7;
}

- (void)beginContinuousHighlighting
{
  id v7 = [(AKHighlightAnnotationController *)self controller];
  v3 = [v7 attributeController];
  id v4 = -[AKHighlightAnnotationController _createHighlightAnnotationWithAttributeTag:](self, "_createHighlightAnnotationWithAttributeTag:", [v3 highlightStyle]);
  [(AKHighlightAnnotationController *)self setContinuousHighlight:v4];

  v5 = [v7 toolController];
  id v6 = [(AKHighlightAnnotationController *)self continuousHighlight];
  [v5 addNewAnnotation:v6 onPageController:0 shouldSelect:1 shouldCascade:0];
}

- (void)continueHighlighting
{
  id v8 = [(AKHighlightAnnotationController *)self controller];
  v3 = [v8 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 hasHighlightableSelectionForAnnotationController:v8])
  {
    id v4 = [v8 currentPageController];
    v5 = objc_msgSend(v3, "highlightableSelectionCharacterIndexesOnPageAtIndex:forAnnotationController:", objc_msgSend(v4, "pageIndex"), v8);
    id v6 = objc_msgSend(v3, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v5, objc_msgSend(v4, "pageIndex"), v8);
    id v7 = [(AKHighlightAnnotationController *)self continuousHighlight];
    [v7 setQuadPoints:v6];
  }
}

- (void)endContinuousHighlighting
{
  v3 = [(AKHighlightAnnotationController *)self continuousHighlight];

  if (v3)
  {
    id v17 = [(AKHighlightAnnotationController *)self controller];
    id v4 = [v17 delegate];
    v5 = [v17 currentPageController];
    id v6 = [(AKHighlightAnnotationController *)self continuousHighlight];
    id v7 = [v6 quadPoints];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        v9 = [(AKHighlightAnnotationController *)self continuousHighlight];
        BOOL v10 = [(AKHighlightAnnotationController *)self _adaptExistingHighlightsToNewHighlight:v9 onPageController:v5 firstModifiedHighlight:0];

        if (!v10)
        {
          BOOL v11 = [v5 pageModelController];
          id v12 = [v11 mutableArrayValueForKey:@"annotations"];
          v13 = [(AKHighlightAnnotationController *)self continuousHighlight];
          [v12 removeObject:v13];
        }
      }
      if (objc_opt_respondsToSelector()) {
        [v4 clearHighlightableSelectionForAnnotationController:v17];
      }
    }
    else
    {
      id v14 = [v5 pageModelController];
      v15 = [v14 mutableArrayValueForKey:@"annotations"];
      id v16 = [(AKHighlightAnnotationController *)self continuousHighlight];
      [v15 removeObject:v16];
    }
    [(AKHighlightAnnotationController *)self setContinuousHighlight:0];
  }
}

- (id)_createHighlightAnnotationWithAttributeTag:(int64_t)a3
{
  id v4 = objc_opt_new();
  if ((unint64_t)(a3 - 765200) > 6)
  {
    id v6 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = qword_2376F40E8[a3 - 765200];
    id v6 = +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:a3];
  }
  [v4 setColor:v6];
  [v4 setStyle:v5];

  return v4;
}

- (id)_highlightsInCharacterIndexRange:(_NSRange)a3 onPageController:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v21 = [MEMORY[0x263EFF980] array];
  v23 = [v4 controller];
  uint64_t v5 = [v23 delegate];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  id v7 = [v4 pageModelController];
  uint64_t v8 = [v7 annotations];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v14 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v16 = v13;
          id v17 = [v16 quadPoints];
          id v18 = objc_msgSend(v5, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v17, objc_msgSend(v6, "pageIndex"), v23);
          v19 = v18;
          if (v18 && objc_msgSend(v18, "countOfIndexesInRange:", a3.location, a3.length)) {
            [v21 addObject:v16];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v21;
}

- (BOOL)_adaptExistingHighlightsToNewHighlight:(id)a3 onPageController:(id)a4 firstModifiedHighlight:(id *)a5
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v114 = a3;
  id v7 = a4;
  v109 = self;
  v112 = [(AKHighlightAnnotationController *)self controller];
  v111 = [v112 delegate];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v113 = v7;
  uint64_t v9 = [v7 pageModelController];
  uint64_t v10 = [v9 annotations];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v121 objects:v129 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v122 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v121 + 1) + 8 * i);
        id v16 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 && v15 != v114)
        {
          id v18 = [v15 quadPoints];
          v19 = objc_msgSend(v111, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v18, objc_msgSend(v7, "pageIndex"), v112);

          v127[0] = @"annotation";
          v127[1] = @"characterIndexes";
          v128[0] = v15;
          v128[1] = v19;
          v20 = [NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:2];
          [v8 addObject:v20];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v121 objects:v129 count:16];
    }
    while (v12);
  }

  id v21 = v8;
  if (![v8 count])
  {
    id v30 = 0;
    BOOL v31 = 1;
    v32 = a5;
    if (!a5) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  [v8 sortUsingComparator:&unk_26EA575F8];
  v22 = [v114 quadPoints];
  v23 = objc_msgSend(v111, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v22, objc_msgSend(v7, "pageIndex"), v112);

  uint64_t v106 = [v23 firstIndex];
  uint64_t v24 = [v23 lastIndex];
  uint64_t v25 = [v23 firstIndex];
  v118[0] = MEMORY[0x263EF8330];
  v118[1] = 3221225472;
  v118[2] = sub_237670204;
  v118[3] = &unk_264CDB5E0;
  id v26 = v114;
  id v119 = v26;
  id v27 = v23;
  id v120 = v27;
  uint64_t v28 = [v8 indexOfObjectPassingTest:v118];
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v108 = 0;
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v33 = v28;
    [v8 objectAtIndex:v28];
    v35 = uint64_t v34 = v25;
    uint64_t v29 = [v35 objectForKeyedSubscript:@"annotation"];

    uint64_t v25 = v34;
    v36 = [v21 objectAtIndex:v33];
    v108 = [v36 objectForKeyedSubscript:@"characterIndexes"];
  }
  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = sub_2376702BC;
  v115[3] = &unk_264CDB5E0;
  id v37 = v26;
  id v116 = v37;
  id v38 = v27;
  id v117 = v38;
  uint64_t v39 = [v21 indexOfObjectPassingTest:v115];
  if (v39 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = 0;
    v41 = 0;
  }
  else
  {
    uint64_t v42 = v39;
    v43 = [v21 objectAtIndex:v39];
    v41 = [v43 objectForKeyedSubscript:@"annotation"];

    v44 = [v21 objectAtIndex:v42];
    v40 = [v44 objectForKeyedSubscript:@"characterIndexes"];
  }
  v107 = v41;
  if (!v29) {
    goto LABEL_32;
  }
  if (v29 != v41) {
    goto LABEL_32;
  }
  uint64_t v45 = [v29 style];
  if (v45 != [v37 style]) {
    goto LABEL_32;
  }
  v46 = [v29 color];
  [v37 color];
  id v104 = v37;
  v47 = v40;
  v48 = v21;
  v49 = v29;
  uint64_t v50 = v24;
  v52 = uint64_t v51 = v25;
  BOOL v53 = +[AKHighlightAppearanceHelper highlightColor:v46 isEquivalentToHighlightColor:v52];

  uint64_t v25 = v51;
  uint64_t v24 = v50;
  uint64_t v29 = v49;
  id v21 = v48;
  v40 = v47;
  id v37 = v104;

  if (v53)
  {
    uint64_t v54 = [v38 firstIndex];
    uint64_t v55 = [v108 firstIndex];
    if (v54 - v55 >= 0) {
      unint64_t v56 = v54 - v55;
    }
    else {
      unint64_t v56 = v55 - v54;
    }
    uint64_t v57 = [v38 lastIndex];
    uint64_t v58 = [v108 lastIndex];
    unint64_t v59 = v57 - v58;
    if (v57 - v58 < 0) {
      unint64_t v59 = v58 - v57;
    }
    if (v56 <= 1 && v59 <= 1)
    {
      v60 = [v113 pageModelController];
      v61 = [v60 mutableArrayValueForKey:@"annotations"];
      [v61 removeObject:v29];

      id v30 = 0;
LABEL_47:
      BOOL v31 = 0;
      v32 = a5;
      goto LABEL_53;
    }
    v93 = (void *)[v38 mutableCopy];
    [v93 removeIndexes:v108];
    uint64_t v94 = [v93 count];
    v95 = (void *)[v108 mutableCopy];
    v60 = v95;
    if (v94) {
      [v95 addIndexes:v38];
    }
    else {
      [v95 removeIndexes:v38];
    }
    v32 = a5;
    v98 = objc_msgSend(v111, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v60, objc_msgSend(v113, "pageIndex"), v112);
    [v29 setQuadPoints:v98];
    id v30 = v29;

    BOOL v31 = 0;
  }
  else
  {
LABEL_32:
    v105 = v40;
    id v62 = v38;
    uint64_t v63 = v24 - v25 + 1;
    if ((v29 != 0) == (v41 != 0)) {
      goto LABEL_60;
    }
    uint64_t v64 = [v37 style];
    v65 = v29 ? v29 : v41;
    if (v64 != [v65 style]) {
      goto LABEL_60;
    }
    v66 = [v37 color];
    [v65 color];
    v68 = uint64_t v67 = v63;
    BOOL v69 = +[AKHighlightAppearanceHelper highlightColor:v66 isEquivalentToHighlightColor:v68];

    uint64_t v63 = v67;
    if (v69)
    {
      id v70 = v65;
      v71 = [v70 quadPoints];
      v100 = objc_msgSend(v111, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v71, objc_msgSend(v113, "pageIndex"), v112);

      v60 = (void *)[v100 mutableCopy];
      [v60 addIndexes:v62];
      v72 = objc_msgSend(v111, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v60, objc_msgSend(v113, "pageIndex"), v112);
      [v70 setQuadPoints:v72];
      id v30 = v70;
      uint64_t v73 = 1 << [v37 style];
      v74 = (void *)MEMORY[0x263EFFA08];
      v126[0] = v37;
      v126[1] = v30;
      v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v126 count:2];
      v76 = [v74 setWithArray:v75];
      uint64_t v77 = v73;
      id v38 = v62;
      -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v109, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v77, v76, v106, v67, v113);

      BOOL v31 = 0;
      v32 = a5;
    }
    else
    {
LABEL_60:
      if (v29)
      {
        if (v41)
        {
          if (v29 != v41)
          {
            uint64_t v78 = [v37 style];
            if (v78 == [v29 style])
            {
              uint64_t v79 = [v37 style];
              if (v79 == [v41 style])
              {
                uint64_t v103 = v63;
                v80 = [v37 color];
                v81 = [v29 color];
                if (+[AKHighlightAppearanceHelper highlightColor:v80 isEquivalentToHighlightColor:v81])
                {
                  v82 = [v37 color];
                  v83 = [v41 color];
                  BOOL v84 = +[AKHighlightAppearanceHelper highlightColor:v82 isEquivalentToHighlightColor:v83];

                  uint64_t v63 = v103;
                  if (v84)
                  {
                    id v85 = v105;
                    id v99 = v108;
                    v60 = (void *)[v99 mutableCopy];
                    [v60 addIndexes:v85];
                    v102 = v62;
                    [v60 addIndexes:v62];
                    v101 = objc_msgSend(v111, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v60, objc_msgSend(v113, "pageIndex"), v112);
                    [v29 setQuadPoints:v101];
                    id v30 = v29;
                    v86 = [v113 pageModelController];
                    v87 = [v86 mutableArrayValueForKey:@"annotations"];
                    v40 = v105;
                    [v87 removeObject:v41];

                    uint64_t v88 = 1 << [v37 style];
                    v89 = (void *)MEMORY[0x263EFFA08];
                    v125[0] = v37;
                    v125[1] = v30;
                    v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:2];

                    v91 = [v89 setWithArray:v90];
                    uint64_t v92 = v88;
                    id v38 = v102;
                    -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v109, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v92, v91, v106, v103, v113);

                    goto LABEL_47;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
      BOOL v31 = 1;
      uint64_t v96 = 1 << [v37 style];
      v60 = [MEMORY[0x263EFFA08] setWithObject:v37];
      -[AKHighlightAnnotationController _clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:](v109, "_clearHighlightsWithStyleMatchingMask:except:inRange:onPageController:", v96, v60, v106, v63, v113);
      id v30 = 0;
      v32 = a5;
      id v38 = v62;
    }
    v40 = v105;
  }
LABEL_53:

  if (v32) {
LABEL_54:
  }
    id *v32 = v30;
LABEL_55:

  return v31;
}

- (BOOL)_clearHighlightsWithStyleMatchingMask:(unint64_t)a3 except:(id)a4 inRange:(_NSRange)a5 onPageController:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  NSUInteger v31 = location;
  NSUInteger v32 = length;
  uint64_t v12 = -[AKHighlightAnnotationController _highlightsInCharacterIndexRange:onPageController:](self, "_highlightsInCharacterIndexRange:onPageController:", location, length, v11);
  id v30 = [MEMORY[0x263EFF980] array];
  uint64_t v34 = [(AKHighlightAnnotationController *)self controller];
  uint64_t v33 = [v34 delegate];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v13)
  {
    char v15 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  char v15 = 0;
  uint64_t v16 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v38 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ([v10 containsObject:v18] & 1) == 0 && ((a3 >> objc_msgSend(v18, "style")))
      {
        v19 = [v18 quadPoints];
        v20 = v11;
        id v21 = objc_msgSend(v33, "characterIndexesForQuadPoints:onPageAtIndex:forAnnotationController:", v19, objc_msgSend(v11, "pageIndex"), v34);
        uint64_t v22 = objc_msgSend(v21, "countOfIndexesInRange:", v31, v32);
        uint64_t v23 = [v21 count];
        unint64_t v24 = v22 - v23;
        if (v22 - v23 < 0) {
          unint64_t v24 = v23 - v22;
        }
        if (v24 <= 1)
        {
          [v30 addObject:v18];
          goto LABEL_14;
        }
        if (v22)
        {
          uint64_t v25 = (void *)[v21 mutableCopy];
          objc_msgSend(v25, "removeIndexesInRange:", v31, v32);
          id v26 = objc_msgSend(v33, "quadPointsForCharacterIndexes:onPageAtIndex:forAnnotationController:", v25, objc_msgSend(v20, "pageIndex"), v34);
          [v18 setQuadPoints:v26];

LABEL_14:
          char v15 = 1;
        }

        id v11 = v20;
        continue;
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v14);
LABEL_20:

  if ([v30 count])
  {
    id v27 = [v11 pageModelController];
    uint64_t v28 = [v27 mutableArrayValueForKey:@"annotations"];
    [v28 removeObjectsInArray:v30];
  }
  return v15 & 1;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKHighlightAnnotation)continuousHighlight
{
  return (AKHighlightAnnotation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContinuousHighlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuousHighlight, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end