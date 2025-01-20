@interface PDFHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (PDFHostViewController)hostViewController;
- (void)extensionSnapshotToHost:(id)a3 scale:(double)a4;
- (void)extensionToHost:(id)a3;
- (void)setHostViewController:(id)a3;
@end

@implementation PDFHostExtensionContext

- (void)setHostViewController:(id)a3
{
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[XPCExtensionInterface extensionInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[XPCExtensionInterface hostInterface];
}

- (void)extensionToHost:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"function"];
  v6 = v5;
  if (v5 && [v5 length])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__PDFHostExtensionContext_extensionToHost___block_invoke;
    block[3] = &unk_264204420;
    block[4] = self;
    id v8 = v6;
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __43__PDFHostExtensionContext_extensionToHost___block_invoke(id *a1)
{
  id v187 = [a1[4] hostViewController];
  if ([a1[5] isEqualToString:@"setupDocumentViewSize"])
  {
    v2 = [a1[6] objectForKey:@"documentViewSize"];
    if ([v2 count] == 2)
    {
      v3 = [v2 objectAtIndex:0];
      [v3 floatValue];
      double v5 = v4;
      v6 = [v2 objectAtIndex:1];
      uint64_t v7 = [v6 floatValue];
      double v9 = PDFSizeMake(v7, v5, v8);
      double v11 = v10;

      objc_msgSend(v187, "setupDocumentViewSize:", v9, v11);
    }
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"updateDocumentViewSize"])
  {
    [v187 updateDocumentViewSize];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"documentIsLocked"])
  {
    v12 = [a1[6] objectForKey:@"isLocked"];
    uint64_t v13 = [v12 BOOLValue];

    [v187 documentIsLocked:v13];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"updateDocumentIsLocked"])
  {
    v14 = [a1[6] objectForKey:@"isLocked"];
    uint64_t v15 = [v14 BOOLValue];

    [v187 updateDocumentIsLocked:v15];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"findStringUpdate"])
  {
    v16 = [a1[6] objectForKey:@"numFound"];
    uint64_t v17 = [v16 integerValue];

    v18 = [a1[6] objectForKey:@"done"];
    uint64_t v19 = [v18 BOOLValue];

    [v187 findStringUpdate:v17 done:v19];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"goToPage"])
  {
    v20 = [a1[6] objectForKey:@"pageIndex"];
    uint64_t v21 = [v20 integerValue];

    v2 = [a1[6] objectForKey:@"pageFrame"];
    if ([v2 count] == 4)
    {
      v22 = [v2 objectAtIndex:0];
      [v22 floatValue];
      double v24 = v23;

      v25 = [v2 objectAtIndex:1];
      [v25 floatValue];
      double v27 = v26;

      v28 = [v2 objectAtIndex:2];
      [v28 floatValue];
      double v30 = v29;

      v31 = [v2 objectAtIndex:3];
      [v31 floatValue];
      double v33 = v32;

      v34.n128_f64[0] = v24;
      v35.n128_f64[0] = v27;
      objc_msgSend(v187, "goToPageIndex:pageFrame:", v21, PDFRectMake(v34, v35, v30, v33));
    }
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"goToDestination"])
  {
    v36 = [a1[6] objectForKey:@"pageIndex"];
    uint64_t v37 = [v36 integerValue];

    v2 = [a1[6] objectForKey:@"point"];
    if ([v2 count] == 2)
    {
      v38 = [v2 objectAtIndex:0];
      [v38 floatValue];
      double v40 = v39;

      v41 = [v2 objectAtIndex:1];
      [v41 floatValue];
      double v43 = v42;

      objc_msgSend(v187, "goToDestination:point:", v37, PDFPointMake(v40, v43));
    }
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"zoomToRect"])
  {
    v2 = [a1[6] objectForKey:@"visibleRect"];
    if ([v2 count] == 4)
    {
      v44 = [v2 objectAtIndex:0];
      [v44 floatValue];
      double v46 = v45;

      v47 = [v2 objectAtIndex:1];
      [v47 floatValue];
      double v49 = v48;

      v50 = [v2 objectAtIndex:2];
      [v50 floatValue];
      double v52 = v51;

      v53 = [v2 objectAtIndex:3];
      [v53 floatValue];
      double v55 = v54;

      v56.n128_f64[0] = v46;
      v57.n128_f64[0] = v49;
      objc_msgSend(v187, "zoomToRect:", PDFRectMake(v56, v57, v52, v55));
    }
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"showSelectionRect"])
  {
    v2 = [a1[6] objectForKey:@"selectionRect"];
    if ([v2 count] == 4)
    {
      v58 = [v2 objectAtIndex:0];
      [v58 floatValue];
      double v60 = v59;

      v61 = [v2 objectAtIndex:1];
      [v61 floatValue];
      double v63 = v62;

      v64 = [v2 objectAtIndex:2];
      [v64 floatValue];
      double v66 = v65;

      v67 = [v2 objectAtIndex:3];
      [v67 floatValue];
      double v69 = v68;

      v70.n128_f64[0] = v60;
      v71.n128_f64[0] = v63;
      objc_msgSend(v187, "showSelectionRect:", PDFRectMake(v70, v71, v66, v69));
    }
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"updateCurrentPageIndex"])
  {
    v72 = [a1[6] objectForKey:@"pageIndex"];
    uint64_t v73 = [v72 integerValue];

    [v187 updateCurrentPageIndex:v73];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"updatePageCount"])
  {
    v74 = [a1[6] objectForKey:@"pageCount"];
    uint64_t v75 = [v74 integerValue];

    [v187 updatePageCount:v75];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"setHasSelection"])
  {
    v76 = [a1[6] objectForKey:@"hasSelection"];
    uint64_t v77 = [v76 BOOLValue];

    [v187 setHasSelection:v77];
    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"setTextSelectionPoints"])
  {
    double v78 = *MEMORY[0x263F00148];
    double v79 = *(double *)(MEMORY[0x263F00148] + 8);
    v80 = [a1[6] objectForKey:@"topLeftSelectionPoint"];
    double v81 = v79;
    double v82 = v78;
    if ([v80 count] == 2)
    {
      v83 = [v80 objectAtIndex:0];
      [v83 floatValue];
      double v85 = v84;

      v86 = [v80 objectAtIndex:1];
      [v86 floatValue];
      double v88 = v87;

      double v82 = PDFPointMake(v85, v88);
      double v81 = v89;
    }
    v90 = [a1[6] objectForKey:@"bottomRightSelectionPoint"];
    if ([v90 count] == 2)
    {
      v91 = [v90 objectAtIndex:0];
      [v91 floatValue];
      double v93 = v92;

      v94 = [v90 objectAtIndex:1];
      [v94 floatValue];
      double v96 = v95;

      double v78 = PDFPointMake(v93, v96);
      double v79 = v97;
    }
    objc_msgSend(v187, "setTextSelectionPoints:right:", v82, v81, v78, v79);
    goto LABEL_40;
  }
  if ([a1[5] isEqualToString:@"showTextSelectionMenu"])
  {
    v98 = [a1[6] objectForKey:@"visible"];
    uint64_t v99 = [v98 BOOLValue];

    v2 = [a1[6] objectForKey:@"selectionRect"];
    if ([v2 count] == 4)
    {
      v100 = [v2 objectAtIndex:0];
      [v100 floatValue];
      double v102 = v101;

      v103 = [v2 objectAtIndex:1];
      [v103 floatValue];
      double v105 = v104;

      v106 = [v2 objectAtIndex:2];
      [v106 floatValue];
      double v108 = v107;

      v109 = [v2 objectAtIndex:3];
      [v109 floatValue];
      double v111 = v110;

      v112.n128_f64[0] = v102;
      v113.n128_f64[0] = v105;
      double v114 = PDFRectMake(v112, v113, v108, v111);
    }
    else
    {
      double v114 = *MEMORY[0x263F001A8];
      double v115 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v116 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v117 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    objc_msgSend(v187, "showTextSelectionMenu:selectionRect:", v99, v114, v115, v116, v117);
    goto LABEL_4;
  }
  if ([a1[5] isEqualToString:@"didCopy"])
  {
    v2 = [a1[6] objectForKey:@"items"];
    [v187 didCopy:v2];
LABEL_4:

    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"goToURL"])
  {
    v80 = [a1[6] objectForKey:@"location"];
    if ([v80 count] != 2) {
      goto LABEL_41;
    }
    v118 = [v80 objectAtIndex:0];
    [v118 floatValue];
    double v120 = v119;

    v121 = [v80 objectAtIndex:1];
    [v121 floatValue];
    double v123 = v122;

    double v124 = PDFPointMake(v120, v123);
    double v126 = v125;
    v90 = [a1[6] objectForKey:@"urlString"];
    v127 = [NSURL URLWithString:v90];
    objc_msgSend(v187, "goToURL:atLocation:", v127, v124, v126);
    goto LABEL_64;
  }
  if ([a1[5] isEqualToString:@"didLongPressLink"])
  {
    v80 = [a1[6] objectForKey:@"location"];
    v128 = [a1[6] objectForKey:@"annotationRect"];
    if ([v80 count] == 2 && objc_msgSend(v128, "count") == 4)
    {
      v129 = [v80 objectAtIndex:0];
      [v129 floatValue];
      double v131 = v130;

      v132 = [v80 objectAtIndex:1];
      [v132 floatValue];
      double v134 = v133;

      double v135 = PDFPointMake(v131, v134);
      double v137 = v136;
      v138 = [v128 objectAtIndex:0];
      [v138 floatValue];
      double v140 = v139;

      v141 = [v128 objectAtIndex:1];
      [v141 floatValue];
      double v143 = v142;

      v144 = [v128 objectAtIndex:2];
      [v144 floatValue];
      double v146 = v145;

      v147 = [v128 objectAtIndex:3];
      [v147 floatValue];
      double v149 = v148;

      v150.n128_f64[0] = v140;
      v151.n128_f64[0] = v143;
      double v152 = PDFRectMake(v150, v151, v146, v149);
      double v154 = v153;
      double v156 = v155;
      double v158 = v157;
      v159 = [a1[6] objectForKey:@"urlString"];

      id v160 = a1[6];
      if (v159)
      {
        v161 = [v160 objectForKey:@"urlString"];
        v162 = [NSURL URLWithString:v161];
        objc_msgSend(v187, "didLongPressURL:atLocation:withAnnotationRect:", v162, v135, v137, v152, v154, v156, v158);
      }
      else
      {
        v184 = [v160 objectForKey:@"pageIndex"];

        if (v184)
        {
          v185 = [a1[6] objectForKey:@"pageIndex"];
          uint64_t v186 = [v185 integerValue];

          objc_msgSend(v187, "didLongPressPageIndex:atLocation:withAnnotationRect:", v186, v135, v137, v152, v154, v156, v158);
        }
      }
    }

    goto LABEL_41;
  }
  if ([a1[5] isEqualToString:@"pointerRegionForLocation"])
  {
    v80 = [a1[6] objectForKey:@"regionRect"];
    if ([v80 count] == 4)
    {
      v163 = [v80 objectAtIndex:0];
      [v163 floatValue];
      double v165 = v164;

      v166 = [v80 objectAtIndex:1];
      [v166 floatValue];
      double v168 = v167;

      v169 = [v80 objectAtIndex:2];
      [v169 floatValue];
      double v171 = v170;

      v172 = [v80 objectAtIndex:3];
      [v172 floatValue];
      double v174 = v173;

      v175.n128_f64[0] = v165;
      v176.n128_f64[0] = v168;
      double v177 = PDFRectMake(v175, v176, v171, v174);
      double v179 = v178;
      double v181 = v180;
      double v183 = v182;
    }
    else
    {
      double v177 = *MEMORY[0x263F001A8];
      double v179 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v181 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v183 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    v90 = [a1[6] objectForKey:@"regionIdentifier"];
    v127 = -[PDFPointerRegion initWithRect:identifier:]([PDFPointerRegion alloc], "initWithRect:identifier:", v90, v177, v179, v181, v183);
    [v187 completePointerInteractionRegionForRequest:v127];
LABEL_64:

LABEL_40:
LABEL_41:

    goto LABEL_13;
  }
  if ([a1[5] isEqualToString:@"killExtensionProcess"]) {
    [v187 killExtensionProcess];
  }
  else {
    NSLog(&cfstr_UnsuportedExte.isa, a1[5]);
  }
LABEL_13:
}

- (void)extensionSnapshotToHost:(id)a3 scale:(double)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PDFHostExtensionContext_extensionSnapshotToHost_scale___block_invoke;
  block[3] = &unk_2642050A8;
  double v11 = a4;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__PDFHostExtensionContext_extensionSnapshotToHost_scale___block_invoke(uint64_t a1)
{
  uint64_t v2 = CGImageCreateFromIOSurface();
  if (v2)
  {
    v3 = (CGImage *)v2;
    id v5 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v2 scale:0 orientation:*(double *)(a1 + 48)];
    CGImageRelease(v3);
  }
  else
  {
    id v5 = 0;
  }
  float v4 = [*(id *)(a1 + 40) hostViewController];
  [v4 recievedSnapshotViewRect:v5];
}

- (PDFHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (PDFHostViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end