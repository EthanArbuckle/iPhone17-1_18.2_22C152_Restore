@interface ManagedTableViewCell
- (ManagedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSIndexPath)currentIndexPath;
- (NSMutableDictionary)cellDict;
- (TableViewManager)parentTableManager;
- (double)calculateFrameSizeForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5 withRemainingContentWidth:(double)a6;
- (double)computedRightmostEditTextInset;
- (double)edgeInsetValue:(id)a3;
- (double)forcedRightmostEditTextInset;
- (double)horizontalSpacingForView:(id)a3 withItem:(id)a4;
- (double)leftInsetForView:(id)a3 withItem:(id)a4;
- (double)neededContentHeight;
- (double)rightInsetForView:(id)a3 withItem:(id)a4;
- (double)usableContentWidth;
- (double)usableContentWidthForItem:(id)a3 withVerticalNeighborView:(id)a4;
- (double)verticalInset;
- (double)verticalSpacingForView:(id)a3 withItem:(id)a4;
- (id)accessibilityValue;
- (void)calculatePositionForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)repositionView:(id)a3 ifOverlapsPreviousView:(id)a4;
- (void)setCellDict:(id)a3;
- (void)setCurrentIndexPath:(id)a3;
- (void)setForcedRightmostEditTextInset:(double)a3;
- (void)setParentTableManager:(id)a3;
@end

@implementation ManagedTableViewCell

- (ManagedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ManagedTableViewCell;
  return [(ManagedTableViewCell *)&v5 initWithStyle:a3 reuseIdentifier:a4];
}

- (void)prepareForReuse
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (dword_268147DF8 <= 800)
  {
    if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))
    {
      v4 = objc_msgSend_currentIndexPath(self, a2, v2);
      objc_msgSend_section(v4, v5, v6);
      v9 = objc_msgSend_currentIndexPath(self, v7, v8);
      objc_msgSend_row(v9, v10, v11);
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"cell %@ section %d row %d\n", v12, v13, v14, v15, (uint64_t)self);
    }
    if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
    {
      v16 = objc_msgSend_parentTableManager(self, a2, v2);
      v19 = objc_msgSend_managedTableView(v16, v17, v18);
      uint64_t v22 = objc_msgSend_visibleCells(v19, v20, v21);
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"visible cells %@\n", v23, v24, v25, v26, v22);
    }
  }
  objc_msgSend_setTag_(self, a2, 0);
  self->_cellXEdgeInset = 0.0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v29 = objc_msgSend_cellDict(self, v27, v28);
  v31 = objc_msgSend_objectForKey_(v29, v30, @"items");
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v50, v54, 16);
  if (v33)
  {
    uint64_t v35 = v33;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(v31);
        }
        v38 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v50 + 1) + 8 * i), v34, @"cachedView");
        uint64_t v41 = objc_msgSend_superview(v38, v39, v40);
        if (v41 == objc_msgSend_contentView(self, v42, v43))
        {
          if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"removing view %@ from superview\n", v45, v46, v47, v48, (uint64_t)v38);
          }
          objc_msgSend_removeFromSuperview(v38, v34, v44);
        }
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v50, v54, 16);
    }
    while (v35);
  }
  v49.receiver = self;
  v49.super_class = (Class)ManagedTableViewCell;
  [(ManagedTableViewCell *)&v49 prepareForReuse];
}

- (void)dealloc
{
  self->_cellDict = 0;
  self->_currentIndexPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)ManagedTableViewCell;
  [(ManagedTableViewCell *)&v3 dealloc];
}

- (void)setCellDict:(id)a3
{
  if (self->_cellDict != a3)
  {
    id v5 = a3;

    self->_cellDict = (NSMutableDictionary *)a3;
    if (a3)
    {
      objc_msgSend_setNeedsLayout(self, v6, v7);
    }
  }
}

- (double)edgeInsetValue:(id)a3
{
  objc_super v3 = objc_msgSend_objectForKey_(a3, a2, @"edgeInset");
  if (!v3) {
    return 10.0;
  }
  objc_msgSend_floatValue(v3, v4, v5);
  return v6;
}

- (double)horizontalSpacingForView:(id)a3 withItem:(id)a4
{
  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  if (v7 == 0.0) {
    return 0.0;
  }

  objc_msgSend_edgeInsetValue_(self, v6, (uint64_t)a4);
  return result;
}

- (double)verticalSpacingForView:(id)a3 withItem:(id)a4
{
  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  double result = 0.0;
  if (v7 > 0.0)
  {
    uint64_t v8 = objc_msgSend_valueForKey_(a4, v5, @"itemType", 0.0);
    int isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"labelView");
    double result = 5.0;
    if (isEqualToString) {
      return 2.0;
    }
  }
  return result;
}

- (double)verticalInset
{
  if (sub_2269050C4((uint64_t)self, a2, v2)) {
    return 12.0;
  }

  objc_msgSend_edgeInsetValue_(self, v4, 0);
  return result;
}

- (double)leftInsetForView:(id)a3 withItem:(id)a4
{
  if (sub_2269050C4((uint64_t)self, a2, (uint64_t)a3)) {
    return 15.0;
  }

  objc_msgSend_edgeInsetValue_(self, v6, (uint64_t)a4);
  return result;
}

- (double)rightInsetForView:(id)a3 withItem:(id)a4
{
  if (sub_2269050C4((uint64_t)self, a2, (uint64_t)a3))
  {
    if (!objc_msgSend_objectForKey_(a4, v7, @"edgeInset"))
    {
      v10 = objc_msgSend_cellDict(self, v7, v9);
      uint64_t v12 = objc_msgSend_valueForKey_(v10, v11, @"accessory");
      double result = 0.0;
      if (!v12) {
        return 15.0;
      }
      return result;
    }
  }
  else if (a3)
  {
    objc_msgSend_frame(a3, v7, v8);
    double result = 0.0;
    if (v14 <= 0.0) {
      return result;
    }
  }

  objc_msgSend_edgeInsetValue_(self, v7, (uint64_t)a4);
  return result;
}

- (double)usableContentWidthForItem:(id)a3 withVerticalNeighborView:(id)a4
{
  double width = self->_modifiedContentViewFrame.size.width;
  if (a3)
  {
    objc_msgSend_rightInsetForView_withItem_(self, a2, 0, a3);
    double v9 = v8;
    uint64_t isEqualToString = objc_msgSend_objectForKey_(a3, v10, @"position");
    if (!a4) {
      goto LABEL_9;
    }
  }
  else
  {
    int v14 = sub_2269050C4((uint64_t)self, a2, 0);
    uint64_t isEqualToString = 0;
    if (v14) {
      double v9 = 15.0;
    }
    else {
      double v9 = 10.0;
    }
    if (!a4) {
      goto LABEL_9;
    }
  }
  uint64_t isEqualToString = objc_msgSend_isEqualToString_((void *)isEqualToString, v12, @"bottom");
  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_frame(a4, v12, v13);
    double v20 = v9 + v21;
    return width - v20;
  }
LABEL_9:
  if (sub_2269050C4(isEqualToString, v12, v13))
  {
    double width = width - v9;
    v17 = objc_msgSend_cellDict(self, v15, v16);
    uint64_t v19 = objc_msgSend_valueForKey_(v17, v18, @"accessory");
    double v20 = 0.0;
    if (!v19) {
      double v20 = v9;
    }
    return width - v20;
  }
  return width + v9 * -2.0;
}

- (double)usableContentWidth
{
  objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, a2, 0, 0);
  return result;
}

- (void)calculatePositionForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5
{
  if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v108);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a4, a2, @"neighbor");
  uint64_t v13 = objc_msgSend_edgeInsetValue_(self, v12, (uint64_t)a4);
  double v109 = v16;
  if (v11)
  {
    v17 = objc_msgSend_objectForKey_(v11, v14, @"cachedView");
    objc_msgSend_frame(v17, v18, v19);
    double forcedRightmostEditTextInset = v21;
    double y = v23;
    double width = v25;
    double v28 = v27;
  }
  else
  {
    if (sub_2269050C4(v13, v14, v15))
    {
      double y = self->_modifiedContentViewFrame.origin.y;
      objc_msgSend_usableContentWidth(self, v29, v30);
      double width = v31;
      double forcedRightmostEditTextInset = 15.0;
    }
    else
    {
      double forcedRightmostEditTextInset = 10.0;
      CGRect v110 = CGRectInset(self->_modifiedContentViewFrame, 10.0, 0.0);
      double y = v110.origin.y;
      double width = v110.size.width;
    }
    v17 = 0;
    double v28 = 44.0;
  }
  uint64_t v32 = objc_msgSend_objectForKey_(a4, v20, @"position");
  if (v32) {
    v39 = (__CFString *)v32;
  }
  else {
    v39 = @"left";
  }
  if (dword_268147DF8 <= 800)
  {
    if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"itemInfo position '%@'\n", v35, v36, v37, v38, (uint64_t)v39);
    }
    if (dword_268147DF8 <= 800)
    {
      if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"itemInfo neighbor '%@'\n", v35, v36, v37, v38, (uint64_t)v11);
      }
      if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"neighbor frame=(x = %.1f, double y = %.1f, w = %.1f, h = %.1f)\n", v35, v36, v37, v38, *(uint64_t *)&forcedRightmostEditTextInset);
      }
    }
  }
  objc_msgSend_frame(a3, v33, v34);
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  long long v50 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v48, v49);
  if (objc_msgSend_userInterfaceLayoutDirection(v50, v51, v52) == 1)
  {
    char isEqualToString = objc_msgSend_isEqualToString_(v39, v53, @"left");
    uint64_t v55 = @"right";
    if ((isEqualToString & 1) == 0)
    {
      char v56 = objc_msgSend_isEqualToString_(v39, v53, @"right");
      uint64_t v55 = @"left";
      if ((v56 & 1) == 0)
      {
        char v57 = objc_msgSend_isEqualToString_(v39, v53, @"topLeft");
        uint64_t v55 = @"topRight";
        if ((v57 & 1) == 0)
        {
          char v58 = objc_msgSend_isEqualToString_(v39, v53, @"topRight");
          uint64_t v55 = @"topLeft";
          if ((v58 & 1) == 0)
          {
            char v59 = objc_msgSend_isEqualToString_(v39, v53, @"bottomLeft");
            uint64_t v55 = @"bottomRight";
            if ((v59 & 1) == 0)
            {
              if (objc_msgSend_isEqualToString_(v39, v53, @"bottomRight")) {
                uint64_t v55 = @"bottomLeft";
              }
              else {
                uint64_t v55 = 0;
              }
            }
          }
        }
      }
    }
    if (v55) {
      v39 = v55;
    }
  }
  uint64_t v60 = objc_msgSend_isEqualToString_(v39, v53, @"center");
  if (v60)
  {
    if (!v17)
    {
      if (sub_2269050C4(v60, v61, v62))
      {
        v63 = objc_msgSend_contentView(self, v61, v62);
        objc_msgSend_bounds(v63, v64, v65);
        double width = v66;
      }
      double v67 = 0.5;
      float v68 = (width - v45) * 0.5;
      float v69 = floorf(v68);
      if (v69 <= 0.0) {
        float v69 = 0.0;
      }
      double forcedRightmostEditTextInset = v69;
      goto LABEL_44;
    }
    goto LABEL_48;
  }
  if (objc_msgSend_isEqualToString_(v39, v61, @"top"))
  {
    if (v17) {
      goto LABEL_48;
    }
    float v95 = (width - v45) * 0.5;
    double forcedRightmostEditTextInset = floorf(v95);
LABEL_75:
    double v43 = v109;
    goto LABEL_49;
  }
  if (!objc_msgSend_isEqualToString_(v39, v61, @"left"))
  {
    if (objc_msgSend_isEqualToString_(v39, v90, @"right"))
    {
      double v93 = width + forcedRightmostEditTextInset;
      if (v17)
      {
        objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
        double forcedRightmostEditTextInset = v93 + v94;
        *(float *)&double v94 = (v28 - v47) * 0.5;
        double v43 = y + floorf(*(float *)&v94);
        goto LABEL_49;
      }
      double forcedRightmostEditTextInset = v93 - v45;
      double v70 = v28 - v47;
      double v67 = 0.5;
      goto LABEL_45;
    }
    if (objc_msgSend_isEqualToString_(v39, v61, @"bottom"))
    {
      if (!v17)
      {
        double v67 = 0.5;
        float v104 = (width - v45) * 0.5;
        double forcedRightmostEditTextInset = forcedRightmostEditTextInset + floorf(v104);
LABEL_44:
        double v70 = v28 - v47;
LABEL_45:
        float v71 = v70 * v67;
        double v43 = floorf(v71);
        goto LABEL_49;
      }
      v96 = objc_msgSend_contentView(self, v61, v62);
      objc_msgSend_frame(v96, v97, v98);
      float v100 = (v99 - v45) * 0.5;
      double forcedRightmostEditTextInset = floorf(v100);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v39, v61, @"topLeft"))
      {
        if (v17) {
          goto LABEL_48;
        }
        objc_msgSend_leftInsetForView_withItem_(self, v61, (uint64_t)a3, a4);
        double forcedRightmostEditTextInset = v102;
        goto LABEL_75;
      }
      if (objc_msgSend_isEqualToString_(v39, v61, @"topRight"))
      {
        if (!v17) {
          goto LABEL_48;
        }
        objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
        double forcedRightmostEditTextInset = width + forcedRightmostEditTextInset + v103;
        goto LABEL_75;
      }
      if (objc_msgSend_isEqualToString_(v39, v61, @"bottomLeft"))
      {
        if (v17)
        {
          objc_msgSend_verticalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
          double v43 = v28 + y + v105;
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      int v106 = objc_msgSend_isEqualToString_(v39, v61, @"bottomRight");
      if (!v17 || !v106)
      {
LABEL_48:
        double forcedRightmostEditTextInset = v41;
        goto LABEL_49;
      }
      objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
      double forcedRightmostEditTextInset = width + forcedRightmostEditTextInset + v107;
    }
    double v43 = v109 + v28 + y;
    goto LABEL_49;
  }
  float v91 = (v28 - v47) * 0.5;
  double v43 = floorf(v91);
  if (v17)
  {
    double forcedRightmostEditTextInset = forcedRightmostEditTextInset - v45;
    objc_msgSend_horizontalSpacingForView_withItem_(self, v90, (uint64_t)a3, a4);
    double v45 = v45 - v92;
  }
  else
  {
    objc_msgSend_leftInsetForView_withItem_(self, v90, (uint64_t)a3, a4);
    double forcedRightmostEditTextInset = v101;
  }
LABEL_49:
  v72 = objc_msgSend_reuseIdentifier(self, v61, v62);
  if ((objc_msgSend_isEqualToString_(v72, v73, @"NoBackgroundTypeCellID") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_frame(a3, v74, v75);
      if (forcedRightmostEditTextInset < v109 && v78 > 0.0) {
        double forcedRightmostEditTextInset = v109;
      }
      objc_msgSend_frame(a3, v76, v77);
      if (v82 > 0.0)
      {
        objc_msgSend_verticalInset(self, v80, v81);
        if (v43 < v83) {
          double v43 = v83;
        }
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (forcedRightmostEditTextInset > self->_computedRightmostEditTextInset) {
      self->_computedRightmostEditTextInset = forcedRightmostEditTextInset;
    }
    double v45 = v45 - (self->_forcedRightmostEditTextInset - forcedRightmostEditTextInset);
    double forcedRightmostEditTextInset = self->_forcedRightmostEditTextInset;
  }
  objc_msgSend_setFrame_(a3, v84, v85, forcedRightmostEditTextInset, v43, v45, v47);
  if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"view.frame set to frame=(x = %.1f, double y = %.1f, w = %.1f, h = %.1f)\n", v86, v87, v88, v89, *(uint64_t *)&forcedRightmostEditTextInset);
  }
}

- (double)calculateFrameSizeForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5 withRemainingContentWidth:(double)a6
{
  v185[1] = *MEMORY[0x263EF8340];
  if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"\n", a5, v6, v7, v8, v180);
  }
  int v14 = objc_msgSend_objectForKey_(a4, a2, @"position");
  objc_msgSend_edgeInsetValue_(self, v15, (uint64_t)a4);
  if ((objc_msgSend_isEqualToString_(v14, v16, @"bottomLeft") & 1) != 0
    || objc_msgSend_isEqualToString_(v14, v17, @"bottom"))
  {
    uint64_t v19 = objc_msgSend_objectForKey_(a4, v17, @"neighbor");
    if (v19)
    {
      uint64_t v21 = objc_msgSend_objectForKey_(v19, v20, @"cachedView");
      objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, v22, (uint64_t)a4, v21);
    }
    else
    {
      objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, v20, (uint64_t)a4, 0);
    }
    a6 = v23;
    int v24 = 1;
  }
  else
  {
    int v24 = 0;
  }
  double v25 = objc_msgSend_cellDict(self, v17, v18);
  double v27 = objc_msgSend_objectForKey_(v25, v26, @"items");
  if (objc_msgSend_count(v27, v28, v29) - 1 == a5) {
    int v34 = 1;
  }
  else {
    int v34 = v24;
  }
  if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
  {
    uint64_t v35 = "NO";
    if (v34) {
      uint64_t v35 = "YES";
    }
    sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"isLastItem = %s\n", v30, v31, v32, v33, (uint64_t)v35);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_frame(a3, v36, v37);
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    if (!objc_msgSend_text(a3, v46, v47)) {
      goto LABEL_54;
    }
    if (objc_msgSend_numberOfLines(a3, v48, v49) == 1)
    {
      uint64_t v52 = objc_msgSend_text(a3, v50, v51);
      uint64_t v184 = *MEMORY[0x263F1C238];
      v185[0] = objc_msgSend_font(a3, v53, v54);
      uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v185, &v184, 1);
      objc_msgSend_boundingRectWithSize_options_attributes_context_(v52, v57, 32, v56, 0, a6, 1.79769313e308);
    }
    else
    {
      if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
      {
        objc_msgSend_numberOfLines(a3, v50, v51);
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"laying out UILabel to double width = %.1f (number of lines %d)\n", v121, v122, v123, v124, *(uint64_t *)&a6);
      }
      v125 = objc_msgSend_text(a3, v50, v51);
      uint64_t v182 = *MEMORY[0x263F1C238];
      uint64_t v183 = objc_msgSend_font(a3, v126, v127);
      uint64_t v129 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v128, (uint64_t)&v183, &v182, 1);
      objc_msgSend_boundingRectWithSize_options_attributes_context_(v125, v130, 1, v129, 0, a6, 1.79769313e308);
    }
    double v39 = v58;
    double v41 = v59;
    float v131 = v60;
    float v132 = ceilf(v131);
    double v43 = v132;
    float v133 = v61;
    double v134 = ceilf(v133);
    if (v132 == 0.0) {
      double v45 = 0.0;
    }
    else {
      double v45 = v134;
    }
    if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
    {
      v186.origin.x = v39;
      v186.origin.double y = v41;
      v186.size.double width = v43;
      v186.size.height = v45;
      v135 = NSStringFromCGRect(v186);
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"computed text rect = %@ (remainingContentWidth %.3f)\n", v136, v137, v138, v139, (uint64_t)v135);
    }
    if (v34)
    {
      double v43 = a6;
      objc_msgSend_setFrame_(a3, v48, v49, v39, v41, a6, v45);
    }
    else
    {
LABEL_54:
      objc_msgSend_setFrame_(a3, v48, v49, v39, v41, v43, v45);
    }
    a6 = a6 - v43;
    if (dword_268147DF8 <= 800)
    {
      if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))
      {
        objc_msgSend_frame(a3, v140, v141);
        uint64_t v143 = v142;
        objc_msgSend_frame(a3, v144, v145);
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UILabel size set to=(w = %.1f, h = %.1f)\n", v146, v147, v148, v149, v143);
      }
LABEL_59:
      if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"returning remainingContentWidth of %.1f\n", v96, v97, v98, v99, *(uint64_t *)&a6);
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_sizeToFit(a3, v108, v109);
        if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
        {
          objc_msgSend_frame(a3, v110, v111);
          uint64_t v113 = v112;
          objc_msgSend_frame(a3, v114, v115);
          sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UIButton size set to=(w = %.1f, h = %.1f)\n", v116, v117, v118, v119, v113);
        }
        objc_msgSend_frame(a3, v110, v111);
        a6 = a6 - v120;
      }
      else
      {
        objc_opt_class();
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          if (sub_2269050C4(isKindOfClass, v152, v153))
          {
            v156 = objc_msgSend_contentView(self, v154, v155);
            objc_msgSend_frame(v156, v157, v158);
            CGFloat v160 = v159;
            CGFloat v162 = v161;
            CGFloat v164 = v163;
            CGFloat v166 = v165;
            v169 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v167, v168);
            objc_msgSend_scale(v169, v170, v171);
            if (v172 == 2.0) {
              double v173 = 7.5;
            }
            else {
              double v173 = 7.0;
            }
            v187.origin.x = v160;
            v187.origin.double y = v162;
            v187.size.double width = v164;
            v187.size.height = v166;
            CGRect modifiedContentViewFrame = CGRectInset(v187, 5.0, v173);
          }
          else
          {
            CGRect modifiedContentViewFrame = self->_modifiedContentViewFrame;
          }
          objc_msgSend_setFrame_(a3, v154, v155, modifiedContentViewFrame.origin.x, modifiedContentViewFrame.origin.y, modifiedContentViewFrame.size.width, modifiedContentViewFrame.size.height);
        }
        else
        {
          objc_msgSend_frame(a3, v152, v153);
          a6 = a6 - v174;
          if (dword_268147DF8 > 800) {
            return a6;
          }
          if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))
          {
            v175 = (objc_class *)objc_opt_class();
            v181 = NSStringFromClass(v175);
            sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"size calculation for this class %@ is not yet supported\n", v176, v177, v178, v179, (uint64_t)v181);
          }
        }
      }
      goto LABEL_59;
    }
    v64 = (void *)MEMORY[0x263F1C658];
    objc_msgSend_labelFontSize(MEMORY[0x263F1C658], v62, v63);
    double v67 = objc_msgSend_systemFontOfSize_(v64, v65, v66);
    double v70 = objc_msgSend_font(a3, v68, v69);
    objc_msgSend_pointSize(v70, v71, v72);
    double v74 = v73;
    objc_msgSend_pointSize(v67, v75, v76);
    if (v74 > v79) {
      double v67 = objc_msgSend_font(a3, v77, v78);
    }
    objc_msgSend_frame(a3, v77, v78);
    double v81 = v80;
    double v83 = v82;
    objc_msgSend_lineHeight(v67, v84, v85);
    float v89 = a6 * 0.5;
    float v90 = floorf(v89);
    if (v34)
    {
      float v91 = a6;
      float v90 = v91;
    }
    double v92 = ceilf(v90);
    float v93 = v88;
    objc_msgSend_setFrame_(a3, v86, v87, v81, v83, v92, ceilf(v93));
    a6 = a6 - v92;
    if (dword_268147DF8 <= 800)
    {
      if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))
      {
        objc_msgSend_frame(a3, v94, v95);
        uint64_t v101 = v100;
        objc_msgSend_frame(a3, v102, v103);
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UITextField size set to=(w = %.1f, h = %.1f)\n", v104, v105, v106, v107, v101);
      }
      goto LABEL_59;
    }
  }
  return a6;
}

- (void)repositionView:(id)a3 ifOverlapsPreviousView:(id)a4
{
  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  objc_msgSend_frame(a4, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v40.origin.x = v7;
  v40.origin.double y = v9;
  v40.size.double width = v11;
  v40.size.height = v13;
  v45.origin.x = v17;
  v45.origin.double y = v19;
  v45.size.double width = v21;
  v45.size.height = v23;
  if (CGRectIntersectsRect(v40, v45))
  {
    CGFloat v38 = v13;
    CGFloat v28 = v11;
    CGFloat v29 = v9;
    CGFloat v30 = v7;
    if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell repositionView:ifOverlapsPreviousView:]", 800, (uint64_t)"view %@ collides with %@\n", v24, v25, v26, v27, (uint64_t)a3);
    }
    v41.origin.x = v17;
    v41.origin.double y = v19;
    v41.size.double width = v21;
    v41.size.height = v23;
    double MinX = CGRectGetMinX(v41);
    v42.origin.x = v30;
    v42.origin.double y = v29;
    v42.size.double width = v28;
    v42.size.height = v38;
    if (MinX < CGRectGetMinX(v42))
    {
      v43.origin.x = v17;
      v43.origin.double y = v19;
      v43.size.double width = v21;
      v43.size.height = v23;
      CGFloat MaxX = CGRectGetMaxX(v43);
      CGFloat v33 = v30;
      double v34 = MaxX;
      v44.origin.x = v33;
      v44.origin.double y = v29;
      v44.size.double width = v28;
      v44.size.height = v38;
      double v37 = v21 - (v34 - (CGRectGetMinX(v44) + -10.0));
      objc_msgSend_setFrame_(a4, v35, v36, v17, v19, v37, v23);
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  if (dword_268147DF8 <= 800)
  {
    if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))
    {
      double v8 = objc_msgSend_currentIndexPath(self, a2, v2);
      objc_msgSend_section(v8, v9, v10);
      CGFloat v13 = objc_msgSend_currentIndexPath(self, v11, v12);
      objc_msgSend_row(v13, v14, v15);
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"cell %@ section %d row %d\n", v16, v17, v18, v19, (uint64_t)self);
    }
    if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"current forced max edit text inset = %.1f\n", v4, v5, v6, v7, *(void *)&self->_forcedRightmostEditTextInset);
    }
  }
  v175.receiver = self;
  v175.super_class = (Class)ManagedTableViewCell;
  [(ManagedTableViewCell *)&v175 layoutSubviews];
  double v22 = objc_msgSend_reuseIdentifier(self, v20, v21);
  int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, @"NoBackgroundTypeCellID");
  self->_computedRightmostEditTextInset = 0.0;
  objc_msgSend_verticalInset(self, v25, v26);
  double v30 = v29;
  char v168 = isEqualToString;
  if (isEqualToString) {
    objc_msgSend_setBackgroundView_(self, v27, 0);
  }
  uint64_t v31 = objc_msgSend_contentView(self, v27, v28);
  uint64_t v34 = objc_msgSend_frame(v31, v32, v33);
  double v39 = v37;
  if (self->_cellXEdgeInset != v37)
  {
    double v40 = v38;
    self->_cellXEdgeInset = v37;
    CGRect v41 = objc_msgSend_parentTableManager(self, v35, v36);
    uint64_t v34 = objc_msgSend_informOfNewCellLeftEdge_andWidth_(v41, v42, v43, v39, v40);
  }
  if (sub_2269050C4(v34, v35, v36))
  {
    if (objc_msgSend_isEditing(self, v44, v45) && objc_msgSend_accessoryType(self, v46, v47))
    {
      objc_msgSend_frame(self, v46, v47);
      p_CGRect modifiedContentViewFrame = &self->_modifiedContentViewFrame;
      double v55 = v54 + -33.0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v56 = objc_msgSend_parentTableManager(self, v44, v45);
    double v59 = objc_msgSend_managedTableView(v56, v57, v58);
    if (objc_msgSend_style(v59, v60, v61) == 1)
    {
      uint64_t v62 = objc_msgSend_contentView(self, v46, v47);
      objc_msgSend_frame(v62, v63, v64);
      double v66 = v65;
      objc_msgSend_frame(self, v67, v68);
      if (v66 == v69)
      {
        p_CGRect modifiedContentViewFrame = &self->_modifiedContentViewFrame;
        double v70 = objc_msgSend_contentView(self, v46, v47);
        objc_msgSend_frame(v70, v71, v72);
        *(CGRect *)&CGFloat v50 = CGRectInset(v178, 10.0, 0.0);
        goto LABEL_22;
      }
    }
  }
  p_CGRect modifiedContentViewFrame = &self->_modifiedContentViewFrame;
  double v73 = objc_msgSend_contentView(self, v46, v47);
  objc_msgSend_frame(v73, v74, v75);
LABEL_22:
  p_modifiedContentViewFrame->origin.x = v50;
  p_modifiedContentViewFrame->origin.double y = v51;
  p_modifiedContentViewFrame->size.double width = v55;
  p_modifiedContentViewFrame->size.height = v52;
  objc_msgSend_usableContentWidth(self, v48, v49);
  double v83 = v82;
  if (dword_268147DF8 >= 801)
  {
    p_neededContentHeight = (uint64_t *)&self->_neededContentHeight;
    self->_neededContentHeight = 44.0;
  }
  else
  {
    if (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"initial content double width = %.1f\n", v78, v79, v80, v81, *(uint64_t *)&v83);
    }
    int v84 = dword_268147DF8;
    p_neededContentHeight = (uint64_t *)&self->_neededContentHeight;
    self->_neededContentHeight = 44.0;
    if (v84 <= 800 && (v84 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u)))
    {
      uint64_t v85 = objc_msgSend_contentView(self, v76, v77);
      sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"contentView %@\n", v86, v87, v88, v89, v85);
    }
  }
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  float v90 = objc_msgSend_cellDict(self, v76, v77);
  id obj = (id)objc_msgSend_objectForKey_(v90, v91, @"items");
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v92, (uint64_t)&v171, v176, 16);
  if (v93)
  {
    uint64_t v101 = v93;
    double v102 = 0;
    uint64_t v103 = 0;
    uint64_t v104 = *(void *)v172;
    do
    {
      uint64_t v105 = 0;
      uint64_t v106 = v102;
      do
      {
        if (*(void *)v172 != v104) {
          objc_enumerationMutation(obj);
        }
        uint64_t v107 = *(void **)(*((void *)&v171 + 1) + 8 * v105);
        double v102 = objc_msgSend_objectForKey_(v107, v94, @"cachedView");
        if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"item index %d cached view %@\n", v109, v110, v111, v112, v103 + v105);
        }
        objc_msgSend_calculateFrameSizeForView_forItem_atItemIndex_withRemainingContentWidth_(self, v108, (uint64_t)v102, v107, v103 + v105, v83);
        double v114 = v113;
        objc_msgSend_calculatePositionForView_forItem_atItemIndex_(self, v115, (uint64_t)v102, v107, v103 + v105);
        if (v106) {
          objc_msgSend_repositionView_ifOverlapsPreviousView_(self, v116, (uint64_t)v102, v106);
        }
        uint64_t v118 = objc_msgSend_contentView(self, v116, v117);
        objc_msgSend_addSubview_(v118, v119, (uint64_t)v102);
        objc_msgSend_horizontalSpacingForView_withItem_(self, v120, (uint64_t)v102, v107);
        double v122 = v121;
        if (objc_msgSend_objectForKey_(v107, v123, @"edgeInset"))
        {
          objc_msgSend_edgeInsetValue_(self, v124, (uint64_t)v107);
          double v30 = v130;
        }
        double v83 = v114 - v122;
        if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"remaining content double width = %.1f\n", v126, v127, v128, v129, *(uint64_t *)&v83);
        }
        objc_msgSend_frame(v102, v124, v125);
        double MaxY = CGRectGetMaxY(v179);
        if (MaxY > *(double *)p_neededContentHeight)
        {
          *(double *)p_neededContentHeight = MaxY;
          if (dword_268147DF8 <= 800)
          {
            if (dword_268147DF8 == -1)
            {
              if (!sub_226865630((uint64_t)&dword_268147DF8, 0x320u)) {
                goto LABEL_54;
              }
              double MaxY = *(double *)p_neededContentHeight;
            }
            sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"adjusted _neededContentHeight to %.1f\n", v131, v132, v133, v134, *(uint64_t *)&MaxY);
          }
        }
LABEL_54:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_setIsAccessibilityElement_(v102, v94, 0);
          uint64_t v138 = objc_msgSend_accessibilityTraits(v102, v136, v137);
          objc_msgSend_setAccessibilityTraits_(self, v139, v138);
          objc_msgSend_accessibilityActivationPoint(v102, v140, v141);
          objc_msgSend_setAccessibilityActivationPoint_(self, v142, v143);
        }
        ++v105;
        uint64_t v106 = v102;
      }
      while (v101 != v105);
      uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v94, (uint64_t)&v171, v176, 16);
      v103 += v105;
    }
    while (v101);
  }
  if ((v168 & 1) == 0)
  {
    double v100 = *(double *)p_neededContentHeight;
    if (*(double *)p_neededContentHeight > 44.0)
    {
      double v100 = v30 + v100;
      *(double *)p_neededContentHeight = v100;
      if (dword_268147DF8 <= 800)
      {
        if (dword_268147DF8 == -1)
        {
          if (!sub_226865630((uint64_t)&dword_268147DF8, 0x320u)) {
            goto LABEL_65;
          }
          double v100 = *(double *)p_neededContentHeight;
        }
        sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"adjusted _neededContentHeight by kStandardEdgeInset to %.1f\n", v96, v97, v98, v99, *(uint64_t *)&v100);
      }
    }
  }
LABEL_65:
  v144 = objc_msgSend_cellDict(self, v94, v95, v100);
  uint64_t v148 = objc_msgSend_objectForKey_(v144, v145, @"cachedHeight");
  if (!v148)
  {
    uint64_t v148 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v146, v147);
    v151 = objc_msgSend_cellDict(self, v149, v150);
    objc_msgSend_setObject_forKey_(v151, v152, (uint64_t)v148, @"cachedHeight");
  }
  double v153 = *(double *)p_neededContentHeight;
  *(float *)&double v153 = *(double *)p_neededContentHeight;
  uint64_t v154 = objc_msgSend_numberWithFloat_(NSNumber, v146, v147, v153);
  uint64_t v155 = NSNumber;
  objc_msgSend_bounds(self, v156, v157);
  *(float *)&double v159 = v158;
  uint64_t v162 = objc_msgSend_numberWithFloat_(v155, v160, v161, v159);
  objc_msgSend_setObject_forKey_(v148, v163, v154, v162);
  if (dword_268147DF8 <= 800 && (dword_268147DF8 != -1 || sub_226865630((uint64_t)&dword_268147DF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147DF8, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"final _neededContentHeight = %.1f\n", v164, v165, v166, v167, *p_neededContentHeight);
  }
}

- (id)accessibilityValue
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v4 = objc_msgSend_cellDict(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"items");
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v31, v35, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v32;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v6);
      }
      int v14 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v31 + 1) + 8 * v13), v9, @"cachedView");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v31, v35, 16);
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if (!v14) {
      goto LABEL_12;
    }
    return (id)objc_msgSend_accessibilityValue(v14, v9, v10);
  }
  else
  {
LABEL_12:
    uint64_t v16 = objc_msgSend_parentTableManager(self, v9, v10);
    uint64_t v19 = objc_msgSend_currentIndexPath(self, v17, v18);
    uint64_t ValueForFirstItemOfType_inCellAtIndexPath = objc_msgSend_getValueForFirstItemOfType_inCellAtIndexPath_(v16, v20, @"unreadBubbleCount", v19);
    if (ValueForFirstItemOfType_inCellAtIndexPath)
    {
      double v22 = (void *)ValueForFirstItemOfType_inCellAtIndexPath;
      uint64_t v23 = sub_22685D62C(@"status.alerts.plural", @"AirportAccessibility");
      if (objc_msgSend_integerValue(v22, v24, v25) == 1) {
        uint64_t v23 = sub_22685D62C(@"status.alerts.singular", @"AirportAccessibility");
      }
      uint64_t v27 = NSString;
      uint64_t v28 = objc_msgSend_localizedStringFromNumber_numberStyle_(MEMORY[0x263F08A30], v26, (uint64_t)v22, 0);
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v27, v29, v23, @"%@", 0, v28);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)ManagedTableViewCell;
      return [(ManagedTableViewCell *)&v30 accessibilityValue];
    }
  }
}

- (TableViewManager)parentTableManager
{
  return self->_parentTableManager;
}

- (void)setParentTableManager:(id)a3
{
  self->_parentTableManager = (TableViewManager *)a3;
}

- (NSMutableDictionary)cellDict
{
  return self->_cellDict;
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
}

- (double)neededContentHeight
{
  return self->_neededContentHeight;
}

- (double)computedRightmostEditTextInset
{
  return self->_computedRightmostEditTextInset;
}

- (double)forcedRightmostEditTextInset
{
  return self->_forcedRightmostEditTextInset;
}

- (void)setForcedRightmostEditTextInset:(double)a3
{
  self->_double forcedRightmostEditTextInset = a3;
}

@end