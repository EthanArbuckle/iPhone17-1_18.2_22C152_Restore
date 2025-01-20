@interface PDFPageViewAnnotationController
- (BOOL)_indexSet:(id)a3 touchesIndexSet:(id)a4;
- (PDFPageViewAnnotationController)initWithPDFPageView:(id)a3;
- (id)_getIndexSetIntersectionBetween:(id)a3 and:(id)a4;
- (id)_markupAnnotationsForExactIndexSet:(id)a3;
- (id)activeAnnotation;
- (id)markupAnnotationsForIndexSet:(id)a3;
- (void)_addPopupForAnnotation:(id)a3;
- (void)_propagateNotesForIndexSet:(id)a3;
- (void)_rotateActiveAnnotation;
- (void)addControlForAnnotation:(id)a3;
- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4;
- (void)dealloc;
- (void)removeControlForAnnotation:(id)a3;
@end

@implementation PDFPageViewAnnotationController

- (PDFPageViewAnnotationController)initWithPDFPageView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDFPageViewAnnotationController;
  v5 = [(PDFPageViewAnnotationController *)&v16 init];
  if (v5)
  {
    v6 = objc_alloc_init(PDFPageViewAnnotationControllerPrivate);
    v7 = v5->_private;
    v5->_private = v6;

    objc_storeWeak((id *)&v5->_private->pageView, v4);
    v8 = [v4 page];
    objc_storeWeak((id *)&v5->_private->page, v8);
    v9 = [v8 view];
    objc_storeWeak((id *)&v5->_private->view, v9);

    objc_storeWeak((id *)&v5->_private->activeAnnotation, 0);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v11 = v5->_private;
    activeControls = v11->activeControls;
    v11->activeControls = v10;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v5 selector:sel__didRotatePageNotification_ name:@"PDFPageDidRotate" object:v8];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v5 selector:sel__didRotatePageNotification_ name:@"PDFPageDidChangeBounds" object:v8];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFPageViewAnnotationController;
  [(PDFPageViewAnnotationController *)&v4 dealloc];
}

- (id)activeAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

  return WeakRetained;
}

- (void)addControlForAnnotation:(id)a3
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v5 = [WeakRetained document];
  int v6 = [v5 allowsFormFieldEntry];

  if (v6)
  {
    activeControls = self->_private->activeControls;
    v8 = [v14 pdfAnnotationUUID];
    v9 = [(NSMutableDictionary *)activeControls objectForKey:v8];

    if (!v9)
    {
      v10 = [v14 valueForAnnotationKey:@"/Subtype"];
      v11 = [v14 popup];

      if ((([v10 isEqualToString:@"/Widget"] & 1) != 0 || v11)
        && ([v14 isReadOnly] & 1) == 0)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        if (v11)
        {
          [(PDFPageViewAnnotationController *)self _addPopupForAnnotation:v14];
        }
        else
        {
          id v12 = objc_loadWeakRetained((id *)&self->_private->pageView);
          v13 = [v14 valueForAnnotationKey:@"/FT"];
          if ([v13 isEqualToString:@"/Tx"])
          {
            [v12 _addPDFAnnotationTextWidget:v14];
          }
          else if ([v13 isEqualToString:@"/Ch"])
          {
            [v12 _addPDFAnnotationChoiceWidget:v14];
          }
        }
        [MEMORY[0x263F158F8] commit];
      }
    }
  }
}

- (void)removeControlForAnnotation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    if ([v4 isSelected]) {
      [v10 setIsSelected:0];
    }
    v5 = [v10 pdfAnnotationUUID];
    if (v5)
    {
      int v6 = [(NSMutableDictionary *)self->_private->activeControls objectForKey:v5];
      if (v6)
      {
        [MEMORY[0x263F158F8] begin];
        [MEMORY[0x263F158F8] setDisableActions:1];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
        v8 = [WeakRetained undoManager];
        [v8 removeAllActionsWithTarget:v6];

        [v10 setControl:0];
        [v6 removeFromSuperview];
        id v9 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

        if (v9 == v10) {
          objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
        }
        [(NSMutableDictionary *)self->_private->activeControls removeObjectForKey:v5];
        [MEMORY[0x263F158F8] commit];
      }
    }
    id v4 = v10;
  }
}

- (void)_rotateActiveAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = [WeakRetained pdfAnnotationUUID];
    if (v4)
    {
      v5 = [(NSMutableDictionary *)self->_private->activeControls objectForKey:v4];
      if (v5)
      {
        [(PDFPageViewAnnotationController *)self removeControlForAnnotation:v6];
        [(PDFPageViewAnnotationController *)self addControlForAnnotation:v6];
      }
    }
    id WeakRetained = v6;
  }
}

- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  int v8 = [WeakRetained allowsMarkupAnnotationEditing];

  if (!v8) {
    goto LABEL_69;
  }
  id v82 = objc_loadWeakRetained((id *)&self->_private->page);
  [v82 pageLayout];
  if (a3 == 8 || ![v6 rangeCount]) {
    goto LABEL_68;
  }
  v83 = self;
  int64_t v9 = +[PDFAnnotation MarkupTypeForMarkupStyle:a3];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndexSet:v6];
  v11 = [v82 annotations];
  id v78 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v79 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v95 objects:v103 count:16];
  id v70 = v12;
  id v72 = v6;
  if (!v13) {
    goto LABEL_40;
  }
  id v14 = (id)v13;
  uint64_t v15 = *(void *)v96;
  objc_super v16 = v83;
  int64_t v80 = v9;
  unint64_t v81 = a3;
  uint64_t v84 = *(void *)v96;
  do
  {
    v17 = 0;
    obuint64_t j = v14;
    do
    {
      if (*(void *)v96 != v15) {
        objc_enumerationMutation(v12);
      }
      v18 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v17);
      if (objc_msgSend(v18, "isMarkupAnnotationSubtype", v70)
        && (v9 == 3 || [v18 markupType] == 3 || objc_msgSend(v18, "markupType") == v9))
      {
        v19 = [v18 indexSetForQuadPoints];
        v20 = [(PDFPageViewAnnotationController *)v16 _getIndexSetIntersectionBetween:v6 and:v19];
        if ([v20 count]
          || [(PDFPageViewAnnotationController *)v16 _indexSet:v19 touchesIndexSet:v6])
        {
          if ([v18 markupStyle] == a3)
          {
            if ([v19 containsIndexes:v6])
            {
              if ([v19 isEqualToIndexSet:v6])
              {
                [v79 addObject:v18];
              }
              else
              {
                v74 = v10;
                v26 = [v82 string];
                uint64_t v27 = [v6 firstIndex] - 1;
                uint64_t v73 = [v6 lastIndex];
                v76 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndexSet:v6];
                int v28 = [v19 containsIndex:v27];
                v77 = v26;
                v29 = objc_msgSend(v26, "substringWithRange:", v27, 1);
                v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
                v31 = [v29 stringByTrimmingCharactersInSet:v30];
                uint64_t v32 = [v31 length];

                if (v28 && !v32) {
                  [v76 addIndex:v27];
                }
                int v33 = [v19 containsIndex:v73 + 1];
                v34 = objc_msgSend(v77, "substringWithRange:", v73 + 1, 1);
                v35 = [MEMORY[0x263F08708] whitespaceCharacterSet];
                v36 = [v34 stringByTrimmingCharactersInSet:v35];
                uint64_t v37 = [v36 length];

                if (v33 && !v37) {
                  [v76 addIndex:v73 + 1];
                }
                v38 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndexSet:v19];
                [v38 removeIndexes:v76];
                [v78 setObject:v18 forKey:v38];

                id v12 = v70;
                id v6 = v72;
                objc_super v16 = v83;
                id v10 = v74;
                int64_t v9 = v80;
                a3 = v81;
              }

              id v10 = 0;
            }
            else
            {
              [v79 addObject:v18];
              [v10 addIndexes:v19];
            }
            goto LABEL_35;
          }
          v21 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndexSet:v19];
          [v21 removeIndexes:v6];
          if ([v21 count])
          {
            [v78 setObject:v18 forKey:v21];
            goto LABEL_25;
          }
          uint64_t v22 = [v18 popup];
          if (v22 && (v23 = (void *)v22, int v24 = [v19 isEqualToIndexSet:v6], v23, !v24))
          {
            [v10 removeIndexes:v19];

            objc_super v16 = v83;
          }
          else
          {
            [v79 addObject:v18];
            objc_super v16 = v83;
LABEL_25:
            v25 = (void *)[objc_alloc(MEMORY[0x263F089C8]) initWithIndexSet:v19];
            [v25 removeIndexes:v21];
            [v10 addIndexes:v25];
          }
          int64_t v9 = v80;
          a3 = v81;
        }
LABEL_35:

        uint64_t v15 = v84;
        id v14 = obj;
      }
      v17 = (char *)v17 + 1;
    }
    while (v14 != v17);
    uint64_t v39 = [v12 countByEnumeratingWithState:&v95 objects:v103 count:16];
    id v14 = (id)v39;
  }
  while (v39);
LABEL_40:

  if (v10)
  {
    v40 = +[PDFAnnotation SubtypeForPDFMarkupStyle:a3];
    v41 = +[PDFAnnotation PDFMarkupColors];
    v42 = [v41 objectAtIndex:a3];

    id v43 = objc_alloc((Class)[v82 annotationSubclassForSubtype:v40]);
    v101 = @"/C";
    v102 = v42;
    v44 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    v45 = objc_msgSend(v43, "initWithBounds:forType:withProperties:", v40, v44, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

    [v45 setPage:v82];
    [v45 setQuadPointsForIndexSet:v10 withUndo:0];
    if ([v40 isEqualToString:@"/Redact"]) {
      [v45 setShouldBurnIn:1];
    }
    objc_msgSend(v82, "addAnnotation:withUndo:", v45, 1, v70);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v46 = v78;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v92 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        v52 = objc_msgSend(v46, "objectForKey:", v51, v70);
        [v52 setQuadPointsForIndexSet:v51 withUndo:1];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v91 objects:v100 count:16];
    }
    while (v48);
  }
  v75 = v10;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obja = v79;
  uint64_t v53 = [obja countByEnumeratingWithState:&v87 objects:v99 count:16];
  v54 = v82;
  v55 = v83;
  if (v53)
  {
    uint64_t v56 = v53;
    uint64_t v57 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v88 != v57) {
          objc_enumerationMutation(obja);
        }
        v59 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        objc_msgSend(v54, "removeAnnotation:withUndo:", v59, 1, v70);
        uint64_t v60 = [v59 contents];
        if (v60)
        {
          v61 = (void *)v60;
          v62 = [v59 indexSetForQuadPoints];
          v63 = [(PDFPageViewAnnotationController *)v55 markupAnnotationsForIndexSet:v62];

          if ([v63 count])
          {
            v64 = [v63 objectAtIndex:0];
            v65 = [v64 contents];

            if (v65)
            {
              v66 = [v64 contents];
              v67 = [v66 stringByAppendingString:@"\n\n"];
              uint64_t v68 = [v67 stringByAppendingString:v61];

              v54 = v82;
              v61 = (void *)v68;
              v55 = v83;
            }
            [v64 setContents:v61 withUndo:1];
          }
        }
      }
      uint64_t v56 = [obja countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v56);
  }

  id v6 = v72;
  if (v75) {
    v69 = v75;
  }
  else {
    v69 = v72;
  }
  -[PDFPageViewAnnotationController _propagateNotesForIndexSet:](v55, "_propagateNotesForIndexSet:", v69, v70);

LABEL_68:
LABEL_69:
}

- (id)markupAnnotationsForIndexSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v6 = [WeakRetained annotations];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 isMarkupAnnotationSubtype])
        {
          uint64_t v13 = [v12 indexSetForQuadPoints];
          id v14 = [(PDFPageViewAnnotationController *)self _getIndexSetIntersectionBetween:v4 and:v13];
          uint64_t v15 = [v14 count];

          if (v15) {
            [v17 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [v17 sortUsingComparator:&__block_literal_global];

  return v17;
}

uint64_t __64__PDFPageViewAnnotationController_markupAnnotationsForIndexSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 indexSetForQuadPoints];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [v5 indexSetForQuadPoints];
  uint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    if (v7 <= v9)
    {
      uint64_t v11 = [v4 priority];
      uint64_t v12 = [v5 priority];
      if (v11 > v12) {
        uint64_t v10 = -1;
      }
      else {
        uint64_t v10 = v11 < v12;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)_addPopupForAnnotation:(id)a3
{
  obuint64_t j = a3;
  id v4 = [PDFKitPopupView alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageView);
  id v6 = objc_loadWeakRetained((id *)&self->_private->view);
  uint64_t v7 = [(PDFKitPopupView *)v4 initWithParentAnnotation:obj owningPageView:WeakRetained owningPDFView:v6];

  if (v7)
  {
    objc_storeWeak((id *)&self->_private->activeAnnotation, obj);
    activeControls = self->_private->activeControls;
    uint64_t v9 = [obj pdfAnnotationUUID];
    [(NSMutableDictionary *)activeControls setObject:v7 forKey:v9];

    [obj setControl:v7];
  }
}

- (id)_getIndexSetIntersectionBetween:(id)a3 and:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__PDFPageViewAnnotationController__getIndexSetIntersectionBetween_and___block_invoke;
  v9[3] = &unk_2642038B8;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = [a3 indexesPassingTest:v9];

  return v7;
}

uint64_t __71__PDFPageViewAnnotationController__getIndexSetIntersectionBetween_and___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

- (BOOL)_indexSet:(id)a3 touchesIndexSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke;
  v10[3] = &unk_264203908;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v5 enumerateRangesUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke_2;
  v8[3] = &unk_2642038E0;
  v8[5] = a2;
  v8[6] = a3;
  v8[4] = *(void *)(a1 + 40);
  uint64_t result = [v6 enumerateRangesUsingBlock:v8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void *__61__PDFPageViewAnnotationController__indexSet_touchesIndexSet___block_invoke_2(void *result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v4 = result[5];
  if (v4 >= a2) {
    BOOL v5 = a2 + a3 == v4;
  }
  else {
    BOOL v5 = result[6] + v4 == a2;
  }
  char v6 = v5;
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = v6;
  if (*(unsigned char *)(*(void *)(result[4] + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)_markupAnnotationsForExactIndexSet:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  id v7 = [WeakRetained annotations];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "isMarkupAnnotationSubtype", (void)v17))
        {
          id v14 = [v13 indexSetForQuadPoints];
          int v15 = [v14 isEqualToIndexSet:v4];

          if (v15) {
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [v5 sortUsingComparator:&__block_literal_global_77];

  return v5;
}

BOOL __70__PDFPageViewAnnotationController__markupAnnotationsForExactIndexSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 priority];
  uint64_t v6 = [v4 priority];

  return v5 < v6;
}

- (void)_propagateNotesForIndexSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = [(PDFPageViewAnnotationController *)self _markupAnnotationsForExactIndexSet:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->view);
  if ([v4 count])
  {
    uint64_t v6 = [v4 objectAtIndex:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "contents", (void)v16);
          if (v13)
          {
            id v14 = (void *)v13;
            [v12 setContents:0 withUndo:1];
            [v6 setContents:v14 withUndo:1];

            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [WeakRetained setActiveAnnotation:v6];
  }
  else
  {
    int v15 = [WeakRetained currentSelection];

    if (!v15) {
      [WeakRetained setActiveAnnotation:0];
    }
  }
}

- (void).cxx_destruct
{
}

@end