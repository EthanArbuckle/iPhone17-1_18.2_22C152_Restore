@interface ICControlCenterQuickNoteModule
- (id)iconGlyph;
- (id)launchURLForTouchType:(int64_t)a3;
- (void)handleTapWithTouchType:(int64_t)a3;
@end

@implementation ICControlCenterQuickNoteModule

- (id)launchURLForTouchType:(int64_t)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F5AB68];
  uint64_t v20 = *MEMORY[0x263F5AAF0];
  v6 = objc_msgSend_numberWithBool_(NSNumber, a2, v3, v4, a3 == 2);
  v10 = objc_msgSend_stringValue(v6, v7, v8, v9);
  v21[0] = v10;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, v12, v13, v21, &v20, 1);
  v18 = objc_msgSend_urlForQuickNoteWithOptions_(v5, v15, v16, v17, v14);

  return v18;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_showOnLockScreen(MEMORY[0x263F5ACC8], a2, v3, v4);
  v11 = objc_msgSend_launchURLForTouchType_(self, v8, v9, v10, a3);
  double v12 = objc_opt_new();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, v14, v15, MEMORY[0x263EFFA88], *MEMORY[0x263F3F5E8]);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v16, v17, v18, *MEMORY[0x263F33C38], *MEMORY[0x263F3F5C0]);
  if (v7) {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v19, v20, v21, *MEMORY[0x263F79530], *MEMORY[0x263F79540]);
  }
  v22 = dispatch_get_global_queue(0, 0);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_24069E390;
  v25[3] = &unk_2650CE9C0;
  id v26 = v11;
  id v27 = v12;
  id v23 = v12;
  id v24 = v11;
  dispatch_async(v22, v25);
}

- (id)iconGlyph
{
  double v3 = objc_msgSend_configurationWithPointSize_weight_scale_(MEMORY[0x263F1C6C8], a2, 30.0, v2, 4, -1);
  uint64_t v7 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v4, v5, v6);
  v11 = objc_msgSend_traitCollection(v7, v8, v9, v10);
  double v15 = objc_msgSend_configurationWithTraitCollection_(v3, v12, v13, v14, v11);

  v19 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v16, v17, v18, @"note.text.badge.plus", v15);
  objc_msgSend_size(v19, v20, v21, v22);
  double v24 = v23;
  objc_msgSend_size(v19, v25, v23, v26);
  double v28 = v27;
  objc_msgSend_alignmentRectInsets(v19, v29, v30, v27);
  double v35 = v32 + 0.0;
  double v36 = v31 + 0.0;
  double v37 = v24 - (v32 + v34);
  double v38 = v28 - (v31 + v33);
  if (v32 < v34) {
    double v32 = v34;
  }
  if (v31 < v33) {
    double v31 = v33;
  }
  CGFloat v39 = -v32;
  CGFloat v40 = -v31;
  v82.origin.CGFloat x = v35;
  v82.origin.CGFloat y = v36;
  v82.size.double width = v37;
  v82.size.double height = v38;
  CGRect v83 = CGRectInset(v82, v39, v40);
  CGFloat x = v83.origin.x;
  CGFloat y = v83.origin.y;
  double width = v83.size.width;
  double height = v83.size.height;
  double v45 = -CGRectGetMinX(v83);
  v84.origin.CGFloat x = x;
  v84.origin.CGFloat y = y;
  v84.size.double width = width;
  v84.size.double height = height;
  double MinY = CGRectGetMinY(v84);
  double v47 = -MinY;
  v50 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v48, MinY, v49);
  uint64_t v54 = objc_msgSend_userInterfaceLayoutDirection(v50, v51, v52, v53);

  if (v54 == 1)
  {
    uint64_t v58 = objc_msgSend_imageWithHorizontallyFlippedOrientation(v19, v55, v56, v57);

    v19 = (void *)v58;
  }
  id v59 = objc_alloc(MEMORY[0x263F1C680]);
  v61 = objc_msgSend_initWithSize_(v59, v60, width, height);
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = sub_24069E6D4;
  v77[3] = &unk_2650CE9E8;
  id v78 = v19;
  double v79 = v45;
  double v80 = v47;
  id v62 = v19;
  v66 = objc_msgSend_imageWithActions_(v61, v63, v64, v65, v77);
  v70 = objc_msgSend_imageWithRenderingMode_(v66, v67, v68, v69, 2);

  if (v54 == 1)
  {
    objc_msgSend_imageWithHorizontallyFlippedOrientation(v70, v71, v72, v73);
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = v70;
  }
  v75 = v74;

  return v75;
}

@end