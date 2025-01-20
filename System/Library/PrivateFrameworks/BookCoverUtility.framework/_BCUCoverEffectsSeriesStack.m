@interface _BCUCoverEffectsSeriesStack
- (BCULayerRenderer)renderer;
- (CGPoint)_positionForImageAtIndex:(int64_t)a3 imageSetCount:(int64_t)a4 coverWidth:(double)a5 coverAreaWidth:(double)a6 isRTL:(BOOL)a7;
- (NSString)identifier;
- (_BCUCoverEffectsSeriesStack)initWithIdentifier:(id)a3 renderer:(id)a4;
- (double)_coverScaleForIndex:(unint64_t)a3;
- (id)_stackLayerForDiagonalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8;
- (id)_stackLayerForHorizontalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8 isRTL:(BOOL)a9;
- (id)_stackLayerWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8;
- (id)newOperationWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 completion:(id)a8;
@end

@implementation _BCUCoverEffectsSeriesStack

- (_BCUCoverEffectsSeriesStack)initWithIdentifier:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BCUCoverEffectsSeriesStack;
  v9 = [(_BCUCoverEffectsSeriesStack *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
  }

  return v10;
}

- (id)newOperationWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 waitForCPUSynchronization:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  if (objc_msgSend_count(v15, v18, v19))
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[3] = &unk_236A4B9D6;
    v40[2] = 0x4010000000;
    long long v41 = BCUInsetsZero;
    long long v42 = *(_OWORD *)&qword_236A4A1B0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    v22 = objc_msgSend_renderer(self, v20, v21);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_236A44DA8;
    v31[3] = &unk_264CBAD38;
    v31[4] = self;
    id v32 = v15;
    CGFloat v36 = width;
    CGFloat v37 = height;
    double v38 = a6;
    id v33 = v16;
    v34 = v40;
    v35 = v39;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_236A44DD4;
    v27[3] = &unk_264CBAD60;
    id v28 = v17;
    v29 = v40;
    v30 = v39;
    LODWORD(v23) = 1056964608;
    v25 = objc_msgSend_newOperationWithPriority_waitForCPUSynchronization_logKey_renderLayer_completion_(v22, v24, v9, 0, v31, v27, v23);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v40, 8);
  }
  else
  {
    (*((void (**)(id, void, void, void, double, double, double, double))v17 + 2))(v17, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    v25 = 0;
  }

  return v25;
}

- (double)_coverScaleForIndex:(unint64_t)a3
{
  double result = 1.0;
  if (a3 - 1 <= 3) {
    return dbl_236A4A180[a3 - 1];
  }
  return result;
}

- (CGPoint)_positionForImageAtIndex:(int64_t)a3 imageSetCount:(int64_t)a4 coverWidth:(double)a5 coverAreaWidth:(double)a6 isRTL:(BOOL)a7
{
  if (!a3)
  {
    double v9 = a6 - a5;
    if (a7) {
      double v7 = v9;
    }
    else {
      double v7 = 0.0;
    }
    goto LABEL_23;
  }
  if (a4 - 1 == a3)
  {
    double v7 = a6 * 0.0;
    double v8 = a6 - a5;
  }
  else
  {
    if (a3 == 3)
    {
      double v7 = a6 * 0.04;
      double v10 = 0.96;
    }
    else
    {
      if (a3 == 2)
      {
        double v11 = -a5;
        if (a4 == 4)
        {
          double v7 = a6 * 0.09;
          double v12 = 0.91;
        }
        else
        {
          double v7 = a6 * 0.12;
          double v12 = 0.88;
        }
        double v8 = v11 + a6 * v12;
        goto LABEL_21;
      }
      double v7 = 0.0;
      if (a3 != 1) {
        goto LABEL_23;
      }
      if (a4 == 4)
      {
        double v7 = a6 * 0.24;
        double v10 = 0.76;
      }
      else if (a4 == 3)
      {
        double v7 = a6 * 0.17;
        double v10 = 0.83;
      }
      else
      {
        double v7 = a6 * 0.25;
        double v10 = 0.75;
      }
    }
    double v8 = -(a5 - a6 * v10);
  }
LABEL_21:
  if (!a7) {
    double v7 = v8;
  }
LABEL_23:
  double v13 = 0.0;
  double v14 = v7;
  result.y = v13;
  result.x = v14;
  return result;
}

- (id)_stackLayerForHorizontalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8 isRTL:(BOOL)a9
{
  BOOL v9 = a9;
  double width = a5.width;
  double height = a5.height;
  v151[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v17 = objc_msgSend_layer(MEMORY[0x263F157E8], v15, v16);
  uint64_t v19 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v18, MEMORY[0x263EFFA68]);
  unint64_t v22 = objc_msgSend_count(v13, v20, v21);
  if (v22 >= 5) {
    uint64_t v25 = 5;
  }
  else {
    uint64_t v25 = v22;
  }
  if (v25)
  {
    uint64_t v26 = 0;
    double v28 = *MEMORY[0x263F001B0];
    double v27 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v29 = *MEMORY[0x263F00148];
    double v30 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      v31 = objc_msgSend_objectAtIndexedSubscript_(v13, v23, v26);

      id v33 = objc_msgSend_objectAtIndexedSubscript_(v14, v32, v26);
      objc_msgSend__coverScaleForIndex_(self, v34, v26);
      double v37 = v27;
      double v38 = v28;
      if (v31)
      {
        double v38 = sub_236A43F04((CGImage *)v31, width * 0.536 * v36, height * v36, a6);
        double v37 = v39;
      }
      v40 = objc_msgSend_coverLayerWithImage_size_contentsScale_(v33, v35, (uint64_t)v31, v38, v37, a6);
      objc_msgSend_setAnchorPoint_(v40, v41, v42, v29, v30);
      objc_msgSend__positionForImageAtIndex_imageSetCount_coverWidth_coverAreaWidth_isRTL_(self, v43, v26, v25, v9, v38, width);
      objc_msgSend_setPosition_(v40, v44, v45);
      objc_msgSend_addObject_(v19, v46, (uint64_t)v40);

      ++v26;
    }
    while (v25 != v26);
  }
  uint64_t v47 = objc_msgSend_count(v19, v23, v24);
  if (v47 - 1 >= 0)
  {
    uint64_t v50 = v47;
    double v51 = 0.0;
    double v52 = 0.0;
    do
    {
      v53 = objc_msgSend_objectAtIndexedSubscript_(v19, v48, --v50);
      if (v50 == objc_msgSend_count(v19, v54, v55) - 1)
      {
        objc_msgSend_addSublayer_(v17, v56, (uint64_t)v53);
      }
      else
      {
        v60 = objc_msgSend_layer(MEMORY[0x263F157E8], v56, v57);
        objc_msgSend__coverScaleForIndex_(self, v61, v50);
        double v63 = v62;
        objc_msgSend_setMasksToBounds_(v60, v64, 0);
        objc_msgSend_setShadowRadius_(v60, v65, v66, v63 * 1.2);
        LODWORD(v67) = 0.5;
        objc_msgSend_setShadowOpacity_(v60, v68, v69, v67);
        objc_msgSend_setShouldRasterize_(v60, v70, 1);
        objc_msgSend_setRasterizationScale_(v60, v71, v72, 1.0);
        if (qword_2688A7348 != -1) {
          dispatch_once(&qword_2688A7348, &unk_26E9DCCE8);
        }
        objc_msgSend_setShadowColor_(v60, v73, qword_2688A7340);
        objc_msgSend_setShadowOffset_(v60, v74, v75, 0.0, 0.0);
        objc_msgSend_frame(v53, v76, v77);
        double v79 = v78;
        objc_msgSend_size(v53, v80, v81);
        CGFloat v83 = v79 + v82 + -0.5;
        Mutable = CGPathCreateMutable();
        v153.origin.CGFloat x = v83;
        v153.origin.CGFloat y = v51 + 1.0;
        v153.size.double width = v63 * 4.0;
        v153.size.double height = v52 + -2.0;
        CGPathAddRect(Mutable, 0, v153);
        objc_msgSend_setShadowPath_(v60, v85, (uint64_t)Mutable);
        CGPathRelease(Mutable);
        objc_msgSend_addSublayer_(v17, v86, (uint64_t)v60);
        objc_msgSend_addSublayer_(v17, v87, (uint64_t)v53);
      }
      objc_msgSend_frame(v53, v58, v59);
      double v51 = v88;
      objc_msgSend_frame(v53, v89, v90);
      double v52 = v91;
    }
    while (v50 > 0);
  }
  v143 = v14;
  objc_msgSend_setBounds_(v17, v48, v49, 0.0, 0.0, width, height);
  v154.origin.CGFloat x = sub_236A45658(v17);
  CGFloat x = v154.origin.x;
  CGFloat y = v154.origin.y;
  CGFloat v94 = v154.size.width;
  CGFloat v95 = v154.size.height;
  double v140 = fmax(0.0 - CGRectGetMinX(v154), 0.0);
  v155.origin.CGFloat x = x;
  v155.origin.CGFloat y = y;
  v155.size.double width = v94;
  v155.size.double height = v95;
  double v96 = fmax(0.0 - CGRectGetMinY(v155), 0.0);
  v156.origin.CGFloat x = x;
  v156.origin.CGFloat y = y;
  v156.size.double width = v94;
  v156.size.double height = v95;
  double MaxX = CGRectGetMaxX(v156);
  objc_msgSend_bounds(v17, v98, v99);
  double v100 = fmax(MaxX - CGRectGetMaxX(v157), 0.0);
  v158.origin.CGFloat x = x;
  v158.origin.CGFloat y = y;
  v158.size.double width = v94;
  v158.size.double height = v95;
  double MaxY = CGRectGetMaxY(v158);
  objc_msgSend_bounds(v17, v102, v103);
  double v104 = fmax(MaxY - CGRectGetMaxY(v159), 0.0);
  v107 = objc_msgSend_layer(MEMORY[0x263F157E8], v105, v106);
  CGFloat v108 = v140;
  objc_msgSend_setFrame_(v107, v109, v110, 0.0, 0.0, width + v140 + v100, height + v96 + v104);
  v151[0] = v17;
  v112 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v111, (uint64_t)v151, 1);
  objc_msgSend_setSublayers_(v107, v113, (uint64_t)v112);

  objc_msgSend_setPosition_(v17, v114, v115, v140 + width * 0.5, v96 + height * 0.5);
  v116 = CGPathCreateMutable();
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  v119 = objc_msgSend_sublayers(v17, v117, v118);
  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v146, v150, 16);
  if (v121)
  {
    uint64_t v124 = v121;
    uint64_t v125 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v124; ++i)
      {
        if (*(void *)v147 != v125) {
          objc_enumerationMutation(v119);
        }
        v127 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        objc_msgSend_bounds(v127, v122, v123, *(void *)&v140);
        objc_msgSend_convertRect_toLayer_(v127, v128, (uint64_t)v107);
        CGPathAddRect(v116, 0, v160);
      }
      uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v146, v150, 16);
    }
    while (v124);
  }

  v131 = objc_msgSend_sublayers(v17, v129, v130);
  uint64_t v134 = objc_msgSend_count(v131, v132, v133);

  if (!v134)
  {
    objc_msgSend_bounds(v107, v135, v136);
    CGPathAddRect(v116, 0, v161);
  }
  if (a7)
  {
    a7->top = v96;
    a7->left = v108;
    a7->bottom = v104;
    a7->right = v100;
  }
  if (a8) {
    *a8 = CGPathRetain(v116);
  }
  CGPathRelease(v116);
  objc_msgSend_setRasterizationScale_(v107, v137, v138, a6);

  return v107;
}

- (id)_stackLayerForDiagonalstyleWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8
{
  double height = a5.height;
  double width = a5.width;
  v139[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v16 = objc_msgSend_layer(MEMORY[0x263F157E8], v14, v15);
  if ((unint64_t)objc_msgSend_count(v12, v17, v18) <= 1) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.85;
  }
  Object = (CGImage *)objc_msgSend_firstObject(v12, v19, v20);
  if ((unint64_t)objc_msgSend_count(v12, v23, v24) < 2)
  {
    double v27 = 0;
  }
  else
  {
    double v27 = objc_msgSend_objectAtIndexedSubscript_(v12, v25, 1);
  }
  double v28 = objc_msgSend_firstObject(v13, v25, v26);
  if ((unint64_t)objc_msgSend_count(v13, v29, v30) < 2)
  {
    v128 = 0;
  }
  else
  {
    v128 = objc_msgSend_objectAtIndexedSubscript_(v13, v31, 1);
  }
  v127 = v13;
  double v126 = a6;
  uint64_t v125 = a8;
  uint64_t v123 = v28;
  if (Object)
  {
    double v34 = sub_236A43F04(Object, width, height, a6);
    double v36 = v35;
    if (v27)
    {
      double v37 = sub_236A43F04((CGImage *)v27, width, height, a6);
      double v39 = v38;
    }
    else
    {
      double v37 = *MEMORY[0x263F001B0];
      double v39 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    uint64_t v42 = objc_msgSend_coverLayerWithImage_size_contentsScale_(v28, v33, (uint64_t)Object, v34, v36, a6);
    if (!v27)
    {
      v43 = objc_msgSend_shadowLayerWithImage_size_contentsScale_kind_(v28, v45, (uint64_t)Object, 0, v34, v36, a6);
      uint64_t v47 = 0;
      uint64_t v49 = 0;
      v44 = 0;
      char v50 = 1;
      if (v43) {
LABEL_21:
      }
        objc_msgSend_addSublayer_(v16, v31, (uint64_t)v43);
LABEL_22:
      BOOL v122 = v47 != 0;
      if (v47)
      {
        if (v44) {
          objc_msgSend_addSublayer_(v47, v31, (uint64_t)v44);
        }
        objc_msgSend_addSublayer_(v16, v31, (uint64_t)v47);
      }
      BOOL v51 = v42 != 0;
      if (v42)
      {
        objc_msgSend_addSublayer_(v16, v31, (uint64_t)v42);
        double v52 = fmin(width, height) * (1.0 - v21);
        if (v50)
        {
          BOOL v51 = 1;
LABEL_31:
          double v53 = height;
          double v54 = width;
          double v119 = v52;
          double v55 = v39;
LABEL_33:
          double v56 = v52;
          goto LABEL_34;
        }
      }
      else
      {
        double v52 = fmin(width, height) * (1.0 - v21);
        if (v50)
        {
          uint64_t v42 = 0;
          BOOL v51 = 0;
          goto LABEL_31;
        }
      }
      double v119 = v52 + fmax(width * 0.1 - (v34 + v52 - v37), 0.0);
      double v54 = fmax(v21 * v37, v119 + v34 * v21);
      double v55 = v39;
      double v53 = fmax(v21 * v39, v52 + v36 * v21);
      goto LABEL_33;
    }
    v43 = objc_msgSend_shadowLayerWithImage_size_contentsScale_kind_(v28, v45, (uint64_t)Object, 1, v34, v36, a6);
    v44 = objc_msgSend_shadowLayerWithImage_size_contentsScale_kind_(v28, v46, (uint64_t)Object, 2, v34, v36, a6);
LABEL_18:
    uint64_t v47 = objc_msgSend_coverLayerWithImage_size_contentsScale_(v128, v40, (uint64_t)v27, v37, v39, a6);
    uint64_t v49 = objc_msgSend_shadowLayerWithImage_size_contentsScale_kind_(v128, v48, (uint64_t)v27, 0, v37, v39, a6);
    if (v49) {
      objc_msgSend_addSublayer_(v16, v31, (uint64_t)v49);
    }
    char v50 = 0;
    if (v43) {
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  double v34 = *MEMORY[0x263F001B0];
  double v36 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v27)
  {
    double v37 = sub_236A43F04((CGImage *)v27, width, height, a6);
    double v39 = v41;
    uint64_t v42 = 0;
    v43 = 0;
    v44 = 0;
    goto LABEL_18;
  }
  BOOL v122 = 0;
  uint64_t v47 = 0;
  uint64_t v49 = 0;
  v44 = 0;
  v43 = 0;
  uint64_t v42 = 0;
  BOOL v51 = 0;
  double v53 = height;
  double v118 = width;
  double v56 = fmin(width, height) * (1.0 - v21);
  double v55 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v37 = *MEMORY[0x263F001B0];
  double v54 = v118;
  double v119 = v56;
LABEL_34:
  double v57 = v54;
  objc_msgSend_setBounds_(v16, v31, v32, 0.0, 0.0, *(void *)&v119);
  double v58 = v57;
  double v121 = v57;
  double v59 = v57 + v34 * -0.5 * v21;
  double v60 = v53;
  double v130 = v53;
  double v61 = v53 + v36 * -0.5 * v21;
  double v62 = v58 - v34 * v21 - v120 + v37 * 0.5 * v21;
  double v63 = v60 - v56 + v55 * -0.5 * v21;
  CGAffineTransformMakeScale(&v138, v21, v21);
  CGAffineTransform v137 = v138;
  objc_msgSend_setAffineTransform_(v43, v64, (uint64_t)&v137);
  CGAffineTransformMakeScale(&v136, v21, v21);
  CGAffineTransform v135 = v136;
  objc_msgSend_setAffineTransform_(v49, v65, (uint64_t)&v135);
  CGAffineTransformMakeScale(&v134, v21, v21);
  CGAffineTransform v133 = v134;
  objc_msgSend_setAffineTransform_(v42, v66, (uint64_t)&v133);
  CGAffineTransformMakeScale(&v132, v21, v21);
  CGAffineTransform v131 = v132;
  objc_msgSend_setAffineTransform_(v47, v67, (uint64_t)&v131);
  objc_msgSend_setPosition_(v43, v68, v69, v59, v61);
  objc_msgSend_setPosition_(v49, v70, v71, v62, v63);
  objc_msgSend_setPosition_(v42, v72, v73, v59, v61);
  objc_msgSend_setPosition_(v47, v74, v75, v62, v63);
  double v78 = objc_msgSend_superlayer(v44, v76, v77);
  objc_msgSend_convertPoint_fromLayer_(v78, v79, (uint64_t)v16, v59, v61);
  objc_msgSend_setPosition_(v44, v80, v81);

  v141.origin.CGFloat x = sub_236A45658(v16);
  CGFloat x = v141.origin.x;
  CGFloat y = v141.origin.y;
  CGFloat v84 = v141.size.width;
  CGFloat v85 = v141.size.height;
  double v86 = fmax(0.0 - CGRectGetMinX(v141), 0.0);
  v142.origin.CGFloat x = x;
  v142.origin.CGFloat y = y;
  v142.size.double width = v84;
  v142.size.double height = v85;
  double v87 = fmax(0.0 - CGRectGetMinY(v142), 0.0);
  v143.origin.CGFloat x = x;
  v143.origin.CGFloat y = y;
  v143.size.double width = v84;
  v143.size.double height = v85;
  double MaxX = CGRectGetMaxX(v143);
  objc_msgSend_bounds(v16, v89, v90);
  double v91 = fmax(MaxX - CGRectGetMaxX(v144), 0.0);
  v145.origin.CGFloat x = x;
  v145.origin.CGFloat y = y;
  v145.size.double width = v84;
  v145.size.double height = v85;
  double MaxY = CGRectGetMaxY(v145);
  objc_msgSend_bounds(v16, v93, v94);
  double v95 = fmax(MaxY - CGRectGetMaxY(v146), 0.0);
  v98 = objc_msgSend_layer(MEMORY[0x263F157E8], v96, v97);
  objc_msgSend_setFrame_(v98, v99, v100, 0.0, 0.0, v121 + v86 + v91, v130 + v87 + v95);
  v139[0] = v16;
  v102 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v101, (uint64_t)v139, 1);
  objc_msgSend_setSublayers_(v98, v103, (uint64_t)v102);

  objc_msgSend_setPosition_(v16, v104, v105, v86 + v121 * 0.5, v87 + v130 * 0.5);
  Mutable = CGPathCreateMutable();
  if (!v122)
  {
    if (!v51)
    {
      objc_msgSend_bounds(v98, v106, v107);
      goto LABEL_40;
    }
LABEL_38:
    objc_msgSend_bounds(v42, v106, v107);
    objc_msgSend_convertRect_toLayer_(v42, v110, (uint64_t)v98);
LABEL_40:
    CGPathAddRect(Mutable, 0, *(CGRect *)&v111);
    goto LABEL_41;
  }
  objc_msgSend_bounds(v47, v106, v107);
  objc_msgSend_convertRect_toLayer_(v47, v109, (uint64_t)v98);
  CGPathAddRect(Mutable, 0, v147);
  if (v51) {
    goto LABEL_38;
  }
LABEL_41:
  if (a7)
  {
    a7->top = v87;
    a7->left = v86;
    a7->bottom = v95;
    a7->right = v91;
  }
  if (v125) {
    *uint64_t v125 = CGPathRetain(Mutable);
  }
  CGPathRelease(Mutable);
  objc_msgSend_setRasterizationScale_(v98, v115, v116, v126);

  return v98;
}

- (id)_stackLayerWithImages:(id)a3 filters:(id)a4 size:(CGSize)a5 contentsScale:(double)a6 insets:(UIEdgeInsets *)a7 path:(const CGPath *)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  id v16 = a4;
  uint64_t v19 = objc_msgSend_identifier(self, v17, v18);
  int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, @"BCUCoverEffectsIdentifierSeriesStackHorizontal");

  if (isEqualToString)
  {
    objc_msgSend__stackLayerForHorizontalstyleWithImages_filters_size_contentsScale_insets_path_isRTL_(self, v22, (uint64_t)v15, v16, a7, a8, 0, width, height, a6);
    uint64_t v28 = LABEL_5:;
    goto LABEL_7;
  }
  uint64_t v24 = objc_msgSend_identifier(self, v22, v23);
  int v26 = objc_msgSend_isEqualToString_(v24, v25, @"BCUCoverEffectsIdentifierSeriesStackHorizontalRTL");

  if (v26)
  {
    objc_msgSend__stackLayerForHorizontalstyleWithImages_filters_size_contentsScale_insets_path_isRTL_(self, v27, (uint64_t)v15, v16, a7, a8, 1, width, height, a6);
    goto LABEL_5;
  }
  uint64_t v28 = objc_msgSend__stackLayerForDiagonalstyleWithImages_filters_size_contentsScale_insets_path_(self, v27, (uint64_t)v15, v16, a7, a8, width, height, a6);
LABEL_7:
  double v29 = (void *)v28;

  return v29;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BCULayerRenderer)renderer
{
  return self->_renderer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end