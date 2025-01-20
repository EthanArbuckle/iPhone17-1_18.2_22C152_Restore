@interface PKMathContextMenuController
+ (PKMathContextMenuController)controllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6;
+ (id)insertGraphControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 alsoShowAddToExisiting:(uint64_t)a5 view:(void *)a6 delegate:(char)a7;
+ (id)mathCopyControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6;
+ (id)mathResultControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6;
+ (id)mathSolvingControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 supportCopy:(uint64_t)a5 view:(void *)a6 delegate:(char)a7;
+ (void)mathErrorControllerForItem:(CGFloat)a3 token:(CGFloat)a4 tapBounds:(uint64_t)a5 errorString:(void *)a6 errorReasonString:(void *)a7 view:(void *)a8 delegate:(void *)a9;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)drawing;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation PKMathContextMenuController

+ (PKMathContextMenuController)controllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  self;
  v18 = objc_alloc_init(PKMathContextMenuController);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mathItem, a6);
    v19->_tapBounds.origin.x = a1;
    v19->_tapBounds.origin.y = a2;
    v19->_tapBounds.size.width = a3;
    v19->_tapBounds.size.height = a4;
    objc_storeWeak((id *)&v19->_view, v16);
    objc_storeWeak((id *)&v19->_delegate, v17);
  }
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v19];
  if (v19) {
    objc_storeStrong((id *)&v19->_interaction, v20);
  }

  if (-[PKMathRecognitionItem hasAnyTrignometry]((uint64_t)v15))
  {
    v21 = _PencilKitBundle();
    v23 = [v21 localizedStringForKey:@"Math Notes uses radians if no units are specified. Use ‘°’, ‘deg’ or ‘degrees’ to specify degrees, for example: sin(45°) or sin(45 deg)", @"Math Notes uses radians if no units are specified. Use ‘°’, ‘deg’ or ‘degrees’ to specify degrees, for example: sin(45°) or sin(45 deg)", @"Localizable" value table];
    if (v19) {
      objc_setProperty_nonatomic_copy(v19, v22, v23, 64);
    }
  }
  if (v19) {
    interaction = v19->_interaction;
  }
  else {
    interaction = 0;
  }
  [v16 addInteraction:interaction];

  return v19;
}

+ (id)mathResultControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  uint64_t v17 = self;
  uint64_t v18 = +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v17, v16, v15, v14);

  if (v18)
  {
    *(void *)(v18 + 56) = 0;
    *(unsigned char *)(v18 + 8) = 1;
  }

  return (id)v18;
}

+ (id)mathSolvingControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 supportCopy:(uint64_t)a5 view:(void *)a6 delegate:(char)a7
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  uint64_t v19 = self;
  uint64_t v20 = +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v19, v18, v17, v16);

  if (v20)
  {
    *(void *)(v20 + 56) = 1;
    *(unsigned char *)(v20 + 8) = a7;
  }

  return (id)v20;
}

+ (id)mathCopyControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 view:(uint64_t)a5 delegate:(void *)a6
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  uint64_t v17 = self;
  uint64_t v18 = +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v17, v16, v15, v14);

  if (v18)
  {
    *(void *)(v18 + 56) = 2;
    *(unsigned char *)(v18 + 8) = 1;
  }

  return (id)v18;
}

+ (void)mathErrorControllerForItem:(CGFloat)a3 token:(CGFloat)a4 tapBounds:(uint64_t)a5 errorString:(void *)a6 errorReasonString:(void *)a7 view:(void *)a8 delegate:(void *)a9
{
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a10;
  id v25 = a6;
  uint64_t v26 = self;
  v27 = +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v26, v25, v24, v23);

  if (v27)
  {
    v27[7] = 3;
    objc_setProperty_nonatomic_copy(v27, v28, v21, 72);
    objc_setProperty_nonatomic_copy(v27, v29, v22, 80);
  }
  -[PKMathResultAttribution setDate:]((uint64_t)v27, v20);

  return v27;
}

+ (id)insertGraphControllerForItem:(CGFloat)a3 tapBounds:(CGFloat)a4 alsoShowAddToExisiting:(uint64_t)a5 view:(void *)a6 delegate:(char)a7
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  uint64_t v19 = self;
  uint64_t v20 = +[PKMathContextMenuController controllerForItem:tapBounds:view:delegate:](a1, a2, a3, a4, v19, v18, v17, v16);

  if (v20)
  {
    *(void *)(v20 + 56) = 4;
    *(unsigned char *)(v20 + 9) = a7;
  }

  return (id)v20;
}

- (id)drawing
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v1 = [WeakRetained contextMenuControllerDrawing:v1];
  }

  return v1;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  if (self && (v6 = self->_mathItem) != 0)
  {
    v7 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = [(PKMathRecognitionItem *)v7 uuid];
    v10 = [WeakRetained contextMenuController:self resultForItemUUID:v9];

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = [(PKMathRecognitionItem *)v7 uuid];
    v13 = [v11 contextMenuController:self resultDrawingForItemUUID:v12];

    id v14 = (void *)MEMORY[0x1E4F5C0C8];
    id v15 = [(PKMathRecognitionItem *)v7 expression];
    id v16 = [v14 textTranscriptionForLatex:v15];

    id v17 = [(PKMathRecognitionItem *)v7 strokes];
    id v18 = self->_mathToken;
    objc_initWeak(&location, self);
    uint64_t v19 = (void *)MEMORY[0x1E4FB1678];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v28[3] = &unk_1E64C6FE0;
    objc_copyWeak(&v36, &location);
    id v20 = v17;
    id v29 = v20;
    id v21 = v16;
    id v30 = v21;
    v31 = self;
    id v22 = v13;
    id v32 = v22;
    id v23 = v10;
    id v33 = v23;
    id v24 = v7;
    v34 = v24;
    id v25 = v18;
    v35 = v25;
    uint64_t v26 = [v19 configurationWithIdentifier:0 previewProvider:0 actionProvider:v28];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

id __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  v146[1] = *MEMORY[0x1E4F143B8];
  id v85 = a2;
  v90 = [MEMORY[0x1E4F1CA48] array];
  v89 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
  v2 = _PencilKitBundle();
  v86 = [v2 localizedStringForKey:@"Copy" value:@"Copy" table:@"Localizable"];

  v3 = _PencilKitBundle();
  v88 = [v3 localizedStringForKey:@"Copy Expression" value:@"Copy Expression" table:@"Localizable"];

  v4 = (void *)MEMORY[0x1E4FB13F0];
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v135[3] = &unk_1E64C6F90;
  from = (id *)(a1 + 88);
  objc_copyWeak(&v138, (id *)(a1 + 88));
  id v136 = *(id *)(a1 + 32);
  id v137 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 actionWithTitle:v88 image:v89 identifier:0 handler:v135];
  v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    switch(*(void *)(v7 + 56))
    {
      case 0:
        goto LABEL_3;
      case 1:
        v84 = (void *)v5;
        id WeakRetained = objc_loadWeakRetained((id *)(v7 + 40));
        v87 = [WeakRetained tintColor];

        id v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"equal.circle"];
        v96 = [v22 imageWithTintColor:v87 renderingMode:1];

        id v23 = _PencilKitBundle();
        id v24 = [v23 localizedStringForKey:@"Solve" value:@"Solve" table:@"Localizable"];

        id v25 = (void *)MEMORY[0x1E4FB13F0];
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5;
        v126[3] = &unk_1E64C6FB8;
        objc_copyWeak(&v128, from);
        id v127 = *(id *)(a1 + 72);
        uint64_t v26 = [v25 actionWithTitle:v24 image:v96 identifier:0 handler:v126];
        if (v87)
        {
          uint64_t v143 = *MEMORY[0x1E4FB0700];
          v144 = v87;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
          v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24 attributes:v27];
          [v26 setAttributedTitle:v28];
        }
        [v90 addObject:v26];
        id v29 = objc_loadWeakRetained(from);
        if (v29)
        {
          BOOL v30 = v29[8] == 0;

          if (!v30)
          {
            v31 = (void *)MEMORY[0x1E4FB1970];
            v142 = v84;
            id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v142 count:1];
            id v33 = [v31 menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v32];

            [v90 addObject:v33];
          }
        }

        objc_destroyWeak(&v128);
        goto LABEL_39;
      case 2:
        [v90 addObject:v5];
        break;
      case 3:
        v84 = (void *)v5;
        v34 = _PencilKitBundle();
        v87 = [v34 localizedStringForKey:@"Dismiss Error" value:@"Dismiss Error" table:@"Localizable"];

        v96 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
        v35 = (void *)MEMORY[0x1E4FB13F0];
        v122[0] = MEMORY[0x1E4F143A8];
        v122[1] = 3221225472;
        v122[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6;
        v122[3] = &unk_1E64C6F90;
        objc_copyWeak(&v125, from);
        id v123 = *(id *)(a1 + 72);
        id v124 = *(id *)(a1 + 80);
        id v36 = [v35 actionWithTitle:v87 image:v96 identifier:0 handler:v122];
        [v90 addObject:v36];

        objc_destroyWeak(&v125);
        goto LABEL_39;
      case 4:
        v84 = (void *)v5;
        v37 = _PencilKitBundle();
        v87 = [v37 localizedStringForKey:@"Insert Graph" value:@"Insert Graph" table:@"Localizable"];

        v96 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chart.xyaxis.line"];
        v38 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
        if ([v38 count] == 1)
        {
          v39 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
          v83 = [v39 objectAtIndexedSubscript:0];
        }
        else
        {
          v83 = 0;
        }

        v40 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
        BOOL v41 = (unint64_t)[v40 count] > 1;

        if (v41)
        {
          v42 = (void *)MEMORY[0x1E4F1CA48];
          v43 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
          v93 = objc_msgSend(v42, "arrayWithCapacity:", objc_msgSend(v43, "count"));

          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v44 = [obj countByEnumeratingWithState:&v118 objects:v141 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v119;
            do
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v119 != v45) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v47 = *(void *)(*((void *)&v118 + 1) + 8 * i);
                v48 = NSString;
                v49 = _PencilKitBundle();
                v50 = [v49 localizedStringForKey:@"%@ on x-axis" value:@"%@ on x-axis" table:@"Localizable"];
                v51 = objc_msgSend(v48, "localizedStringWithFormat:", v50, v47);

                v52 = (void *)MEMORY[0x1E4FB13F0];
                v114[0] = MEMORY[0x1E4F143A8];
                v114[1] = 3221225472;
                v114[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
                v114[3] = &unk_1E64C6F90;
                objc_copyWeak(&v117, from);
                id v115 = *(id *)(a1 + 72);
                uint64_t v116 = v47;
                v53 = [v52 actionWithTitle:v51 image:v96 identifier:0 handler:v114];
                [v93 addObject:v53];

                objc_destroyWeak(&v117);
              }
              uint64_t v44 = [obj countByEnumeratingWithState:&v118 objects:v141 count:16];
            }
            while (v44);
          }

          v54 = [MEMORY[0x1E4FB1970] menuWithTitle:v87 image:v96 identifier:0 options:0 children:v93];
          [v90 addObject:v54];
        }
        else
        {
          v55 = (void *)MEMORY[0x1E4FB13F0];
          v110[0] = MEMORY[0x1E4F143A8];
          v110[1] = 3221225472;
          v110[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8;
          v110[3] = &unk_1E64C6F90;
          objc_copyWeak(&v113, from);
          id v111 = *(id *)(a1 + 72);
          id v112 = v83;
          v56 = [v55 actionWithTitle:v87 image:v96 identifier:0 handler:v110];
          [v90 addObject:v56];

          objc_destroyWeak(&v113);
        }
        v57 = objc_loadWeakRetained(from);
        if (v57)
        {
          BOOL v58 = v57[9] == 0;

          if (!v58)
          {
            v59 = _PencilKitBundle();
            v82 = [v59 localizedStringForKey:@"Add to Existing Graph" value:@"Add to Existing Graph" table:@"Localizable"];

            v60 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
            BOOL v61 = (unint64_t)[v60 count] > 1;

            if (v61)
            {
              v62 = (void *)MEMORY[0x1E4F1CA48];
              v63 = -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
              v94 = objc_msgSend(v62, "arrayWithCapacity:", objc_msgSend(v63, "count"));

              long long v108 = 0u;
              long long v109 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              -[PKMathRecognitionItem graphableVariables](*(id **)(a1 + 72));
              id obja = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v64 = [obja countByEnumeratingWithState:&v106 objects:v140 count:16];
              if (v64)
              {
                uint64_t v65 = *(void *)v107;
                do
                {
                  for (uint64_t j = 0; j != v64; ++j)
                  {
                    if (*(void *)v107 != v65) {
                      objc_enumerationMutation(obja);
                    }
                    uint64_t v67 = *(void *)(*((void *)&v106 + 1) + 8 * j);
                    v68 = NSString;
                    v69 = _PencilKitBundle();
                    v70 = [v69 localizedStringForKey:@"%@ on x-axis" value:@"%@ on x-axis" table:@"Localizable"];
                    v71 = objc_msgSend(v68, "localizedStringWithFormat:", v70, v67);

                    v72 = (void *)MEMORY[0x1E4FB13F0];
                    v102[0] = MEMORY[0x1E4F143A8];
                    v102[1] = 3221225472;
                    v102[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9;
                    v102[3] = &unk_1E64C6F90;
                    objc_copyWeak(&v105, from);
                    id v103 = *(id *)(a1 + 72);
                    uint64_t v104 = v67;
                    v73 = [v72 actionWithTitle:v71 image:v96 identifier:0 handler:v102];
                    [v94 addObject:v73];

                    objc_destroyWeak(&v105);
                  }
                  uint64_t v64 = [obja countByEnumeratingWithState:&v106 objects:v140 count:16];
                }
                while (v64);
              }

              v74 = [MEMORY[0x1E4FB1970] menuWithTitle:v82 image:v96 identifier:0 options:0 children:v94];
              [v90 addObject:v74];
            }
            else
            {
              v75 = (void *)MEMORY[0x1E4FB13F0];
              v98[0] = MEMORY[0x1E4F143A8];
              v98[1] = 3221225472;
              v98[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10;
              v98[3] = &unk_1E64C6F90;
              objc_copyWeak(&v101, from);
              id v99 = *(id *)(a1 + 72);
              id v100 = v83;
              v76 = [v75 actionWithTitle:v82 image:v96 identifier:0 handler:v98];
              [v90 addObject:v76];

              objc_destroyWeak(&v101);
            }
          }
        }
        v77 = (void *)MEMORY[0x1E4FB1970];
        v139 = v84;
        v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v139 count:1];
        v79 = [v77 menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v78];

        [v90 addObject:v79];
        goto LABEL_39;
      default:
        break;
    }
  }
  else
  {
LABEL_3:
    v84 = (void *)v5;
    v8 = _PencilKitBundle();
    v87 = [v8 localizedStringForKey:@"Remove Result" value:@"Remove Result" table:@"Localizable"];

    v9 = _PencilKitBundle();
    v96 = [v9 localizedStringForKey:@"Copy Result" value:@"Copy Result" table:@"Localizable"];

    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    id v11 = (void *)MEMORY[0x1E4FB13F0];
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v132[3] = &unk_1E64C6E08;
    id v133 = *(id *)(a1 + 56);
    id v134 = *(id *)(a1 + 64);
    v12 = [v11 actionWithTitle:v96 image:v89 identifier:0 handler:v132];
    v13 = (void *)MEMORY[0x1E4FB13F0];
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v129[3] = &unk_1E64C6FB8;
    objc_copyWeak(&v131, from);
    id v130 = *(id *)(a1 + 72);
    id v14 = [v13 actionWithTitle:v87 image:v10 identifier:0 handler:v129];
    [v14 setAttributes:2];
    id v15 = (void *)MEMORY[0x1E4FB1970];
    v146[0] = v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:1];
    id v17 = [v15 menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v16];

    id v18 = (void *)MEMORY[0x1E4FB1970];
    v145[0] = v84;
    v145[1] = v12;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:2];
    id v20 = [v18 menuWithTitle:v86 image:v89 identifier:0 options:0 children:v19];

    [v90 addObject:v20];
    [v90 addObject:v17];

    objc_destroyWeak(&v131);
LABEL_39:

    v6 = v84;
  }
  v80 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F1FB2C00 image:0 identifier:0 options:1 children:v90];

  objc_destroyWeak(&v138);

  return v80;
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(id *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v4 = -[PKMathContextMenuController drawing](WeakRetained);

  if ([a1[4] count]) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:a1[4] fromDrawing:v4];
    uint64_t v7 = [v6 serializeTransiently];
    [v2 setObject:v7 forKeyedSubscript:@"com.apple.drawing"];
  }
  if ([a1[5] length])
  {
    v8 = [a1[5] dataUsingEncoding:4];
    v9 = [(id)*MEMORY[0x1E4F44510] identifier];
    [v2 setObject:v8 forKeyedSubscript:v9];
  }
  if ([v2 count])
  {
    v10 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v12[0] = v2;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v10 setItems:v11];
  }
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = [v3 serializeTransiently];
    [v2 setObject:v4 forKeyedSubscript:@"com.apple.drawing"];
  }
  BOOL v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = [v5 dataUsingEncoding:4];
    uint64_t v7 = [(id)*MEMORY[0x1E4F44510] identifier];
    [v2 setObject:v6 forKeyedSubscript:v7];
  }
  if ([v2 count])
  {
    v8 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v10[0] = v2;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v8 setItems:v9];
  }
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 removeResultForItemUUID:v6];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_5(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 solveItemUUID:v6];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_6(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  [v4 contextMenuController:v5 dismissErrorForItem:*(void *)(a1 + 32) token:*(void *)(a1 + 40)];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 addGraphForItemUUID:v6 addToExisting:0 graphableVariable:*(void *)(a1 + 40)];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_8(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 addGraphForItemUUID:v6 addToExisting:0 graphableVariable:*(void *)(a1 + 40)];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_9(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 addGraphForItemUUID:v6 addToExisting:1 graphableVariable:*(void *)(a1 + 40)];
}

void __85__PKMathContextMenuController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_10(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    id v4 = objc_loadWeakRetained(WeakRetained + 6);
  }
  else {
    id v4 = 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [*(id *)(a1 + 32) uuid];
  [v4 contextMenuController:v5 addGraphForItemUUID:v6 addToExisting:1 graphableVariable:*(void *)(a1 + 40)];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  v169[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self || (v160 = self->_mathItem) == 0)
  {
    v160 = 0;
    goto LABEL_9;
  }
  id v11 = -[PKMathContextMenuController drawing]((id *)&self->super.isa);
  BOOL v12 = [(PKMathRecognitionItem *)v160 isValidForDrawing:v11];

  if (!v12)
  {
LABEL_9:
    id v17 = 0;
    goto LABEL_61;
  }
  v13 = self->_errorString;
  if (v13)
  {
  }
  else if (self->_explanationString)
  {
    id v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v19 = [v18 integerForKey:@"PKTrigonometryHintCounterUserDefaultsName"];

    if (v19 < 3)
    {
      v150 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v150 setInteger:v19 + 1 forKey:@"PKTrigonometryHintCounterUserDefaultsName"];
    }
    else
    {
      objc_setProperty_nonatomic_copy(self, v20, 0, 64);
    }
  }
  id location = (id *)&self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v15 = [(PKMathRecognitionItem *)v160 uuid];
  v159 = [WeakRetained contextMenuController:self imageForItemUUID:v15];

  id v16 = self->_errorString;
  id v157 = v9;
  id v158 = v8;
  id v156 = v10;
  if (v16)
  {

    goto LABEL_14;
  }
  if (self->_explanationString)
  {
LABEL_14:
    uint64_t v21 = *MEMORY[0x1E4FB06F8];
    v168[0] = *MEMORY[0x1E4FB06F8];
    id v22 = +[PKMathContextMenuPreviewView footnoteBoldFont];
    v169[0] = v22;
    uint64_t v23 = *MEMORY[0x1E4FB0700];
    v168[1] = *MEMORY[0x1E4FB0700];
    unint64_t v24 = 0x1E4FB1000uLL;
    id v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v169[1] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:2];

    id v27 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    unint64_t v28 = 0x1E4F29000uLL;
    unint64_t v29 = 0x1E4F28000uLL;
    if (self->_errorString)
    {
      BOOL v30 = [NSString stringWithFormat:@" %@", self->_errorString];
      id v31 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      id v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle"];
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v34 = id v33 = v26;
      [v32 imageWithTintColor:v34 renderingMode:1];
      uint64_t v35 = v23;
      v37 = uint64_t v36 = v21;
      [v31 setImage:v37];

      uint64_t v26 = v33;
      unint64_t v24 = 0x1E4FB1000;

      v38 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v31];
      [v27 appendAttributedString:v38];
      v39 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v30 attributes:v26];
      [v27 appendAttributedString:v39];

      uint64_t v21 = v36;
      uint64_t v23 = v35;
      unint64_t v28 = 0x1E4F29000;

      unint64_t v29 = 0x1E4F28000;
    }
    else
    {
      if (!self->_explanationString)
      {
LABEL_19:
        id v40 = objc_alloc_init(MEMORY[0x1E4FB1930]);
        [v40 setAttributedText:v27];
        [v40 setTextAlignment:1];
        [v40 setNumberOfLines:1];
        BOOL v41 = self->_errorReasonString;
        if (!v41) {
          goto LABEL_22;
        }
        v42 = v41;
        [*(id *)(v28 + 24) stringWithFormat:@"\n%@", v41];
        v43 = v40;
        v45 = unint64_t v44 = v29;

        uint64_t v46 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
        unint64_t v47 = v24;
        v48 = v26;
        v49 = (void *)v46;
        v166[1] = v23;
        v167[0] = v46;
        v166[0] = v21;
        v50 = [*(id *)(v47 + 1560) secondaryLabelColor];
        v167[1] = v50;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v167 forKeys:v166 count:2];

        v52 = *(objc_class **)(v44 + 2840);
        id v40 = v43;
        v53 = (void *)[[v52 alloc] initWithString:v45 attributes:v51];
        [v27 appendAttributedString:v53];

        [v43 setAttributedText:v27];
        uint64_t v26 = v48;
        if (v45)
        {
          [v43 setNumberOfLines:0];

          double v54 = 480.0;
        }
        else
        {
LABEL_22:
          if (!self->_explanationString)
          {
            [v40 sizeToFit];
            goto LABEL_26;
          }
          [v40 setNumberOfLines:0];
          double v54 = 360.0;
        }
        objc_msgSend(v40, "sizeThatFits:", v54, 100000.0);
        objc_msgSend(v40, "setFrame:", 0.0, 0.0, v55, v56);
LABEL_26:

        goto LABEL_27;
      }
      BOOL v30 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_explanationString attributes:v26];
      [v27 appendAttributedString:v30];
    }

    goto LABEL_19;
  }
  id v40 = 0;
LABEL_27:
  v57 = self->_errorString;
  if (v57)
  {
    id v58 = v57;
    v59 = 0;
  }
  else
  {
    if ((self->_mode | 2) != 2)
    {
      v59 = 0;
      goto LABEL_32;
    }
    id v58 = objc_loadWeakRetained(location);
    v60 = [(PKMathRecognitionItem *)v160 uuid];
    v59 = [v58 contextMenuController:self resultAttributionForItemUUID:v60];
  }
LABEL_32:
  p_view = &self->_view;
  id v62 = objc_loadWeakRetained((id *)&self->_view);
  v63 = [v62 traitCollection];
  uint64_t v64 = [v63 userInterfaceStyle];

  if (v59)
  {
    uint64_t v65 = 1;
    if (v64 == 2) {
      uint64_t v65 = 2;
    }
    v66 = (void *)v59[v65];
  }
  else
  {
    v66 = 0;
  }
  id v67 = v66;
  v68 = [PKMathContextMenuPreviewView alloc];
  if (v59) {
    uint64_t v69 = v59[4];
  }
  else {
    uint64_t v69 = 0;
  }
  v70 = [(PKMathContextMenuPreviewView *)v68 initWithImage:v159 label:v40 attributionImage:v67 lastRefreshDate:v69];
  v71 = v70;
  if (v70)
  {
    [(PKMathContextMenuPreviewView *)v70 bounds];
    double v73 = v72;
    double v75 = v74;
    memset(&v165, 0, sizeof(v165));
    id v76 = objc_loadWeakRetained(location);
    v77 = v76;
    if (v76) {
      [v76 contextMenuControllerDrawingTransform:self];
    }
    else {
      memset(&v165, 0, sizeof(v165));
    }
    double v151 = v75;
    double v152 = v73;

    CGFloat x = self->_tapBounds.origin.x;
    CGFloat y = self->_tapBounds.origin.y;
    CGFloat width = self->_tapBounds.size.width;
    CGFloat height = self->_tapBounds.size.height;
    v171.origin.CGFloat x = x;
    v171.origin.CGFloat y = y;
    v171.size.CGFloat width = width;
    v171.size.CGFloat height = height;
    if (CGRectIsNull(v171))
    {
      [(PKMathRecognitionItem *)v160 bounds];
      CGFloat x = v82;
      CGFloat y = v83;
      CGFloat width = v84;
      CGFloat height = v85;
    }
    v153.origin.CGFloat x = x;
    v153.origin.CGFloat y = y;
    v153.size.CGFloat width = width;
    v153.size.CGFloat height = height;
    [(PKMathRecognitionItem *)v160 bounds];
    CGFloat v86 = v172.origin.x;
    CGFloat v87 = v172.origin.y;
    CGFloat v88 = v172.size.width;
    CGFloat v89 = v172.size.height;
    CGAffineTransform v164 = v165;
    CGRect v173 = CGRectApplyAffineTransform(v172, &v164);
    double v90 = v173.origin.x;
    double v91 = v173.origin.y;
    double v92 = v173.size.width;
    double v93 = v173.size.height;
    id v94 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v94, "convertRect:toView:", 0, v90, v91, v92, v93);
    uint64_t v96 = v95;
    uint64_t v98 = v97;
    uint64_t v100 = v99;
    uint64_t v102 = v101;

    BOOL v103 = [(PKMathRecognitionItem *)v160 isVerticalExpression];
    uint64_t v104 = v96;
    uint64_t v105 = v98;
    uint64_t v106 = v100;
    uint64_t v107 = v102;
    if (v103)
    {
      double MidX = CGRectGetMidX(*(CGRect *)&v104);
      id v109 = objc_loadWeakRetained((id *)&self->_view);
      v110 = [v109 window];
      [v110 bounds];
      double v112 = v111 * 0.5;

      CGFloat v113 = v86;
      CGFloat v114 = v87;
      CGFloat v115 = v88;
      CGFloat v116 = v89;
      if (MidX <= v112)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v113);
        double v118 = 1.0;
        double v120 = 0.0;
        double v119 = v152;
      }
      else
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v113);
        double v118 = -1.0;
        double v119 = v152;
        double v120 = v152;
      }
      double v133 = v151;
      CGFloat MidY = CGRectGetMidY(v153);
      double v135 = v165.tx + MidY * v165.c + v165.a * MaxX + v118 * 8.0 - v120;
      double v136 = v165.ty + MidY * v165.d + v165.b * MaxX + v151 * -0.5;
    }
    else
    {
      double v121 = CGRectGetMidY(*(CGRect *)&v104);
      id v122 = objc_loadWeakRetained((id *)&self->_view);
      id v123 = [v122 window];
      [v123 bounds];
      double v125 = v124 * 0.5;

      double v126 = CGRectGetMidX(v153);
      *(double *)&locationa = v121;
      CGFloat v127 = v86;
      CGFloat v128 = v87;
      CGFloat v129 = v88;
      CGFloat v130 = v89;
      if (v121 < v125)
      {
        double MaxY = CGRectGetMaxY(*(CGRect *)&v127);
        double v132 = 1.0;
      }
      else
      {
        double MaxY = CGRectGetMinY(*(CGRect *)&v127);
        double v132 = -1.0;
      }
      double v133 = v151;
      double v119 = v152;
      CGFloat v137 = v165.tx + MaxY * v165.c + v165.a * v126;
      double v138 = v165.ty + MaxY * v165.d + v165.b * v126 + v132 * 8.0;
      double v135 = v137 + v152 * -0.5;
      double v139 = 0.0;
      if (*(double *)&locationa >= v125) {
        double v139 = -1.0;
      }
      double v136 = v138 + v151 * v139;
    }
    -[PKMathContextMenuPreviewView setFrame:](v71, "setFrame:", v135, v136, v119, v133);
    v174.origin.CGFloat x = v135;
    v174.origin.CGFloat y = v136;
    v174.size.CGFloat width = v119;
    v174.size.CGFloat height = v133;
    double v140 = CGRectGetMidX(v174);
    v175.origin.CGFloat x = v135;
    v175.origin.CGFloat y = v136;
    v175.size.CGFloat width = v119;
    v175.size.CGFloat height = v133;
    double v141 = CGRectGetMidY(v175);
    memset(&v164, 0, sizeof(v164));
    id v142 = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v143 = v142;
    if (v142) {
      [v142 transform];
    }
    else {
      memset(&v163, 0, sizeof(v163));
    }
    CGAffineTransformInvert(&v164, &v163);

    memset(&v162, 0, sizeof(v162));
    CGAffineTransformMakeScale(&v162, v164.a, v164.d);
    id v144 = objc_alloc(MEMORY[0x1E4FB1D48]);
    id v145 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v146 = objc_alloc(MEMORY[0x1E4FB1B38]);
    id v147 = objc_loadWeakRetained((id *)p_view);
    CGAffineTransform v161 = v162;
    v148 = objc_msgSend(v146, "initWithContainer:center:transform:", v147, &v161, v140, v141);
    id v17 = (void *)[v144 initWithView:v71 parameters:v145 target:v148];
  }
  else
  {
    id v17 = 0;
  }

  id v9 = v157;
  id v8 = v158;
  id v10 = v156;
LABEL_61:

  return v17;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PKMathContextMenuController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E64C5F60;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  [a5 addCompletion:v9];
}

void __87__PKMathContextMenuController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeInteraction:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
    id WeakRetained = 0;
  }
  id v6 = WeakRetained;
  [WeakRetained contextMenuControllerDidFinish:v5];
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReasonString, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_explanationString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_mathToken, 0);
  objc_storeStrong((id *)&self->_mathItem, 0);

  objc_storeStrong((id *)&self->_interaction, 0);
}

@end