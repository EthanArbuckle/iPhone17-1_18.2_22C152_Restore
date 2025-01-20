@interface NUIContainerGridView
+ (id)containerGridViewWithArrangedSubviewRows:(id)a3;
- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (NSArray)arrangedSubviewRows;
- (NUIContainerGridView)initWithArrangedSubviewRows:(id)a3;
- (NUIContainerGridView)initWithArrangedSubviews:(id)a3;
- (NUIContainerGridView)initWithFrame:(CGRect)a3;
- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4;
- (double)_heightOfRowAtIndex:(uint64_t)a1;
- (double)_widthOfColumnAtIndex:(uint64_t)a1;
- (double)columnSpacing;
- (double)columnWidth;
- (double)rowHeight;
- (double)rowSpacing;
- (id).cxx_construct;
- (id)_horizontalAlignmentOfView:(uint64_t)a3 inColumn:;
- (id)_verticalAlignmentOfView:(uint64_t)a3 row:;
- (id)addColumnWithArrangedSubviews:(id)a3;
- (id)addRowWithArrangedSubviews:(id)a3;
- (id)arrangedDebugDescription;
- (id)arrangedSubviewInColumnAtIndex:(int64_t)a3 rowAtIndex:(int64_t)a4;
- (id)calculateViewForFirstBaselineLayout;
- (id)calculateViewForLastBaselineLayout;
- (id)columnAtIndex:(int64_t)a3;
- (id)debugDictionary;
- (id)debugDictionaryForVisibleArrangedSubview:(id)a3;
- (id)insertColumnAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4;
- (id)insertRowAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4;
- (id)rowAtIndex:(int64_t)a3;
- (id)viewForFirstBaselineLayoutInRowAtIndex:(int64_t)a3;
- (id)viewForLastBaselineLayoutInRowAtIndex:(int64_t)a3;
- (int64_t)columnIndexForArrangedSubview:(id)a3;
- (int64_t)horizontalAlignment;
- (int64_t)horizontalDistribution;
- (int64_t)numberOfColumns;
- (int64_t)numberOfRows;
- (int64_t)rowIndexForArrangedSubview:(id)a3;
- (int64_t)verticalAlignment;
- (int64_t)verticalDistribution;
- (uint64_t)_verifyInternalGridConsistencyWarningOnly:(uint64_t)result;
- (uint64_t)debugArrayForDimension:(uint64_t)a1;
- (void)_baselineViewVendForFirstBaseline:(void *)a3 fromViews:;
- (void)_setupViewRangesIfNeeded;
- (void)dealloc;
- (void)debugDictionaryForDimensionConfiguration:(uint64_t)a1;
- (void)didInsertArrangedSubview:(id)a3 atIndex:(int64_t)a4;
- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4;
- (void)ensureArrangedSubviewsAreValid;
- (void)getColumnRange:(_NSRange *)a3 rowRange:(_NSRange *)a4 forArrangedSubview:(id)a5;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
- (void)moveColumnAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)moveRowAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)populateGridArrangementCells:(void *)a3;
- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5;
- (void)removeColumnAtIndex:(int64_t)a3;
- (void)removeRowAtIndex:(int64_t)a3;
- (void)replaceArrangedSubview:(id)a3 inColumnAtIndex:(int64_t)a4 rowAtIndex:(int64_t)a5;
- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4;
- (void)setArrangedSubviewRows:(id)a3;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setColumnSpacing:(double)a3;
- (void)setColumnWidth:(double)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHorizontalDistribution:(int64_t)a3;
- (void)setRowHeight:(double)a3;
- (void)setRowSpacing:(double)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setVerticalDistribution:(int64_t)a3;
@end

@implementation NUIContainerGridView

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  p_arrangement = &self->_arrangement;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, a3);
  _NUIGridArrangement::resetForInvalidation(p_arrangement, a3);
  if (a3)
  {
    [(NUIContainerGridView *)self ensureArrangedSubviewsAreValid];
    if (_NUIIsDebuggerAttached())
    {
      -[NUIContainerGridView _verifyInternalGridConsistencyWarningOnly:]((uint64_t)self, 0);
    }
  }
}

- (void)ensureArrangedSubviewsAreValid
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags = self->_gridViewFlags;
  if ((*(_DWORD *)&gridViewFlags & 0x20000) != 0)
  {
    self->_$7C9949954A3843EED5620E8235AAC90E gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFDFFFF);
    if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    {
      uint64_t v5 = [(NSMutableArray *)self->_rows count];
      if (v5 != [(NSMutableArray *)self->_viewRows count])
      {
        uint64_t v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
        if (v55) {
          v56 = (__CFString *)v55;
        }
        else {
          v56 = @"<Unknown File>";
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v56, 187, @"Row count mismatch");
      }
    }
    if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    {
      uint64_t v6 = [(NSMutableArray *)self->_columns count];
      if (v6 != objc_msgSend((id)-[NSMutableArray firstObject](self->_viewRows, "firstObject"), "count"))
      {
        uint64_t v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
        if (v57) {
          v58 = (__CFString *)v57;
        }
        else {
          v58 = @"<Unknown File>";
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v58, 188, @"Column count mismatch");
      }
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v65 = 712;
    rows = self->_rows;
    uint64_t v8 = [(NSMutableArray *)rows countByEnumeratingWithState:&v84 objects:v92 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v85 != v10) {
            objc_enumerationMutation(rows);
          }
          uint64_t v12 = *(void *)(*((void *)&v84 + 1) + 8 * i);
          if (v12)
          {

            *(void *)(v12 + 16) = 0;
          }
        }
        uint64_t v9 = [(NSMutableArray *)rows countByEnumeratingWithState:&v84 objects:v92 count:16];
      }
      while (v9);
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    columns = self->_columns;
    uint64_t v14 = [(NSMutableArray *)columns countByEnumeratingWithState:&v80 objects:v91 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v81 != v16) {
            objc_enumerationMutation(columns);
          }
          uint64_t v18 = *(void *)(*((void *)&v80 + 1) + 8 * j);
          if (v18)
          {

            *(void *)(v18 + 16) = 0;
          }
        }
        uint64_t v15 = [(NSMutableArray *)columns countByEnumeratingWithState:&v80 objects:v91 count:16];
      }
      while (v15);
    }
    std::__tree<UIView *>::destroy((uint64_t)&self->_viewRanges, (void *)self->_viewRanges.__tree_.__pair1_.__value_.__left_);
    self->_viewRanges.__tree_.__begin_node_ = &self->_viewRanges.__tree_.__pair1_;
    self->_viewRanges.__tree_.__pair3_.__value_ = 0;
    self->_viewRanges.__tree_.__pair1_.__value_.__left_ = 0;
    v59 = self;
    v19 = [(NUIContainerView *)self arrangedSubviews];
    [(NSArray *)v19 count];
    MEMORY[0x1F4188790]();
    v62 = (char *)&v59 - v20;
    bzero((char *)&v59 - v20, v21);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v22 = [(NSArray *)v19 countByEnumeratingWithState:&v76 objects:v90 count:16];
    if (!v22)
    {
      unint64_t v60 = 0;
      goto LABEL_47;
    }
    uint64_t v23 = v22;
    unint64_t v60 = 0;
    uint64_t v24 = *(void *)v77;
    while (1)
    {
      uint64_t v25 = 0;
      v26 = v62;
      unint64_t v27 = v60;
      do
      {
        if (*(void *)v77 != v24)
        {
          objc_enumerationMutation(v19);
          v26 = v62;
        }
        unint64_t v28 = *(void *)(*((void *)&v76 + 1) + 8 * v25);
        v29 = &v26[8 * v27];
        if (!v27)
        {
          v30 = v26;
LABEL_42:
          *(void *)v30 = v28;
          ++v27;
          goto LABEL_43;
        }
        v30 = v26;
        unint64_t v31 = v27;
        do
        {
          unint64_t v32 = v31 >> 1;
          v33 = &v30[8 * (v31 >> 1)];
          unint64_t v35 = *(void *)v33;
          v34 = v33 + 8;
          v31 += ~(v31 >> 1);
          if (v35 < v28) {
            v30 = v34;
          }
          else {
            unint64_t v31 = v32;
          }
        }
        while (v31);
        if (v30 == v29 || *(void *)v30 != v28)
        {
          if (v29 > v30)
          {
            memmove(v30 + 8, v30, v29 - v30);
            v26 = v62;
          }
          goto LABEL_42;
        }
LABEL_43:
        ++v25;
      }
      while (v25 != v23);
      unint64_t v60 = v27;
      uint64_t v23 = [(NSArray *)v19 countByEnumeratingWithState:&v76 objects:v90 count:16];
      if (!v23)
      {
LABEL_47:
        v36 = v59;
        [*(id *)((char *)&v59->super.super.super.super.isa + v65) count];
        [(NSMutableArray *)v36->_columns count];
        MEMORY[0x1F4188790]();
        v38 = (char *)&v59 - v37;
        bzero((char *)&v59 - v37, v39);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        viewRows = v36->_viewRows;
        uint64_t v64 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v72 objects:v89 count:16];
        unint64_t v40 = 0;
        if (!v64) {
          goto LABEL_73;
        }
        uint64_t v63 = *(void *)v73;
        while (1)
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v73 != v63) {
              objc_enumerationMutation(viewRows);
            }
            uint64_t v65 = v41;
            v42 = *(void **)(*((void *)&v72 + 1) + 8 * v41);
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v68 objects:v88 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v69;
              do
              {
                for (uint64_t k = 0; k != v44; ++k)
                {
                  if (*(void *)v69 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  unint64_t v47 = *(void *)(*((void *)&v68 + 1) + 8 * k);
                  v48 = &v38[8 * v40];
                  if (!v40)
                  {
                    v49 = v38;
LABEL_68:
                    *(void *)v49 = v47;
                    ++v40;
                    continue;
                  }
                  v49 = v38;
                  unint64_t v50 = v40;
                  do
                  {
                    unint64_t v51 = v50 >> 1;
                    v52 = &v49[8 * (v50 >> 1)];
                    unint64_t v54 = *(void *)v52;
                    v53 = v52 + 8;
                    v50 += ~(v50 >> 1);
                    if (v54 < v47) {
                      v49 = v53;
                    }
                    else {
                      unint64_t v50 = v51;
                    }
                  }
                  while (v50);
                  if (v49 == v48 || *(void *)v49 != v47)
                  {
                    if (v48 > v49) {
                      memmove(v49 + 8, v49, v48 - v49);
                    }
                    goto LABEL_68;
                  }
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v68 objects:v88 count:16];
              }
              while (v44);
            }
            uint64_t v41 = v65 + 1;
          }
          while (v65 + 1 != v64);
          uint64_t v64 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v72 objects:v89 count:16];
          if (!v64)
          {
LABEL_73:
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __54__NUIContainerGridView_ensureArrangedSubviewsAreValid__block_invoke;
            v67[3] = &unk_1E5EFF3B0;
            v67[4] = v59;
            v67[5] = v60;
            v67[6] = v62;
            v67[7] = v40;
            v67[8] = v38;
            v66.receiver = v59;
            v66.super_class = (Class)NUIContainerGridView;
            [(NUIContainerView *)&v66 performBatchUpdates:v67];
            return;
          }
        }
      }
    }
  }
}

void *__54__NUIContainerGridView_ensureArrangedSubviewsAreValid__block_invoke(void *result)
{
  v1 = result;
  *(_DWORD *)(result[4] + 728) |= 0x10000u;
  uint64_t v2 = result[5];
  if (v2)
  {
    v3 = (unint64_t *)result[6];
    v4 = &v3[v2];
    do
    {
      unint64_t v5 = *v3;
      uint64_t v6 = v1[7];
      uint64_t v7 = v1[8];
      if (!v6) {
        goto LABEL_11;
      }
      uint64_t v8 = (void *)v1[8];
      unint64_t v9 = v1[7];
      do
      {
        unint64_t v10 = v9 >> 1;
        v11 = &v8[v9 >> 1];
        unint64_t v13 = *v11;
        uint64_t v12 = v11 + 1;
        v9 += ~(v9 >> 1);
        if (v13 < v5) {
          uint64_t v8 = v12;
        }
        else {
          unint64_t v9 = v10;
        }
      }
      while (v9);
      if (v8 == (void *)(v7 + 8 * v6) || *v8 != v5) {
LABEL_11:
      }
        uint64_t v8 = (void *)(v7 + 8 * v6);
      if (v8 == (void *)(v7 + 8 * v6))
      {
        v27.receiver = (id)v1[4];
        v27.super_class = (Class)NUIContainerGridView;
        result = objc_msgSendSuper2(&v27, sel_removeArrangedSubview_, v5);
      }
      ++v3;
    }
    while (v3 != v4);
  }
  uint64_t v14 = v1[7];
  if (v14)
  {
    uint64_t v15 = (unint64_t *)v1[8];
    uint64_t v16 = &v15[v14];
    do
    {
      unint64_t v17 = *v15;
      uint64_t v18 = v1[5];
      uint64_t v19 = v1[6];
      if (!v18) {
        goto LABEL_25;
      }
      uint64_t v20 = (void *)v1[6];
      unint64_t v21 = v1[5];
      do
      {
        unint64_t v22 = v21 >> 1;
        uint64_t v23 = &v20[v21 >> 1];
        unint64_t v25 = *v23;
        uint64_t v24 = v23 + 1;
        v21 += ~(v21 >> 1);
        if (v25 < v17) {
          uint64_t v20 = v24;
        }
        else {
          unint64_t v21 = v22;
        }
      }
      while (v21);
      if (v20 == (void *)(v19 + 8 * v18) || *v20 != v17) {
LABEL_25:
      }
        uint64_t v20 = (void *)(v19 + 8 * v18);
      if (v20 == (void *)(v19 + 8 * v18))
      {
        v26.receiver = (id)v1[4];
        v26.super_class = (Class)NUIContainerGridView;
        result = objc_msgSendSuper2(&v26, sel_addArrangedSubview_, v17);
      }
      ++v15;
    }
    while (v15 != v16);
  }
  *(_DWORD *)(v1[4] + 728) |= 0x10000u;
  return result;
}

- (void)setArrangedSubviewRows:(id)a3
{
  unint64_t v5 = [(NUIContainerView *)self arrangedSubviews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NUIContainerGridView_setArrangedSubviewRows___block_invoke;
  v6[3] = &unk_1E5EFF3D8;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  [(NUIContainerView *)self performBatchUpdates:v6];
}

uint64_t __52__NUIContainerGridView_initWithArrangedSubviewRows___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) addRowWithArrangedSubviews:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)addRowWithArrangedSubviews:(id)a3
{
  int64_t v5 = [(NUIContainerGridView *)self numberOfRows];
  return [(NUIContainerGridView *)self insertRowAtIndex:v5 withArrangedSubviews:a3];
}

- (id)insertColumnAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  long long v8 = &NUIStringFromAlignment(NUIContainerAlignment)::onceToken;
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_columns count] < (unint64_t)a3)
  {
    uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v21) {
      unint64_t v22 = (__CFString *)v21;
    }
    else {
      unint64_t v22 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v22, 394, @"Invalid parameter not satisfying: %@", @"column <= _columns.count");
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()) && ![a4 count])
  {
    uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v23) {
      uint64_t v24 = (__CFString *)v23;
    }
    else {
      uint64_t v24 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v24, 395, @"Invalid parameter not satisfying: %@", @"arrangedViews.count > 0");
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  uint64_t v9 = [(NSMutableArray *)self->_rows count];
  uint64_t v10 = v9;
  if (v9 < 2)
  {
    if (!v9)
    {
      objc_super v27 = a2;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v14 = [a4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        while (1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(a4);
          }
          -[NSMutableArray addObject:](self->_viewRows, "addObject:", [MEMORY[0x1E4F1CA48] array]);
          if (!--v15)
          {
            uint64_t v15 = [a4 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }
      uint64_t v10 = [a4 count];
      a2 = v27;
    }
  }
  else if ([a4 count] == 1)
  {
    v11 = a2;
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
    uint64_t v13 = v10;
    do
    {
      objc_msgSend(v12, "addObject:", objc_msgSend(a4, "firstObject"));
      --v13;
    }
    while (v13);
    a4 = v12;
    a2 = v11;
    long long v8 = &NUIStringFromAlignment(NUIContainerAlignment)::onceToken;
  }
  if ((*((unsigned char *)v8 + 56) || _NUIIsDebuggerAttached()) && v10 && v10 != [a4 count])
  {
    uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v25) {
      objc_super v26 = (__CFString *)v25;
    }
    else {
      objc_super v26 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v26, 414, @"Invalid parameter not satisfying: %@", @"numberOfRows == 0 || numberOfRows == copy.count");
  }
  unint64_t v17 = [a4 count];
  viewRows = self->_viewRows;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__NUIContainerGridView_insertColumnAtIndex_withArrangedSubviews___block_invoke;
  v28[3] = &unk_1E5EFF400;
  v28[4] = a4;
  v28[5] = a3;
  [(NSMutableArray *)viewRows enumerateObjectsUsingBlock:v28];
  id v19 = -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 0);
  [(NSMutableArray *)self->_columns insertObject:v19 atIndex:a3];
  while ([(NSMutableArray *)self->_rows count] < v17)
    -[NSMutableArray addObject:](self->_rows, "addObject:", -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 1));
  [(NUIContainerView *)self setNeedsInvalidation:4];
  return v19;
}

- (id)insertRowAtIndex:(int64_t)a3 withArrangedSubviews:(id)a4
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_rows count] < (unint64_t)a3)
  {
    uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v14) {
      uint64_t v15 = (__CFString *)v14;
    }
    else {
      uint64_t v15 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 317, @"Invalid parameter not satisfying: %@", @"row <= _rows.count");
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()) && ![a4 count])
  {
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v16) {
      unint64_t v17 = (__CFString *)v16;
    }
    else {
      unint64_t v17 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 318, @"Invalid parameter not satisfying: %@", @"arrangedViews.count > 0");
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  uint64_t v8 = [(NSMutableArray *)self->_columns count];
  if (v8 >= 2 && (uint64_t v9 = v8, [a4 count] == 1))
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
    do
    {
      objc_msgSend(v10, "addObject:", objc_msgSend(a4, "firstObject"));
      --v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:a4];
  }
  unint64_t v11 = [v10 count];
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && v11
    && v11 != [v10 count])
  {
    uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v18) {
      id v19 = (__CFString *)v18;
    }
    else {
      id v19 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 331, @"Invalid parameter not satisfying: %@", @"numberOfColumns == 0 || numberOfColumns == copy.count");
  }
  [(NSMutableArray *)self->_viewRows insertObject:v10 atIndex:a3];
  id v12 = -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 1);
  [(NSMutableArray *)self->_rows insertObject:v12 atIndex:a3];
  while ([(NSMutableArray *)self->_columns count] < v11)
    -[NSMutableArray addObject:](self->_columns, "addObject:", -[NUIGridDimension initWithContainerGridView:isRow:]([NUIGridDimension alloc], (uint64_t)self, 0));
  [(NUIContainerView *)self setNeedsInvalidation:4];
  return v12;
}

- (void)didInsertArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && (*((unsigned char *)&self->_gridViewFlags + 2) & 1) == 0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm", a4);
    if (v6) {
      long long v7 = (__CFString *)v6;
    }
    else {
      long long v7 = @"<Unknown File>";
    }
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    [v8 handleFailureInMethod:a2, self, v7, 802, @"-[%1$@ insertArrangedSubview:atIndex:] not supported, use -[%1$@ insert{Row|Column}AtIndex:withArrangedSubviews:] to insert arranged subviews.", NSStringFromClass(v9) object file lineNumber description];
  }
}

- (void)populateGridArrangementCells:(void *)a3
{
  v53 = (void **)a3;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v4 = [(NSMutableArray *)self->_columns count];
  uint64_t v59 = 712;
  unsigned __int16 v5 = [(NSMutableArray *)self->_rows count];
  self->_visibleCount.width = v4;
  self->_visibleCount.height = v5;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v64 = 720;
  columns = self->_columns;
  uint64_t v7 = [(NSMutableArray *)columns countByEnumeratingWithState:&v84 objects:v91 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(columns);
        }
        if ([*(id *)(*((void *)&v84 + 1) + 8 * i) isHidden]) {
          --self->_visibleCount.width;
        }
      }
      uint64_t v7 = [(NSMutableArray *)columns countByEnumeratingWithState:&v84 objects:v91 count:16];
    }
    while (v7);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v10 = *(Class *)((char *)&self->super.super.super.super.isa + v59);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v81 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v80 + 1) + 8 * j) isHidden]) {
          --self->_visibleCount.height;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v11);
  }
  std::vector<_NUIGridArrangementCell>::reserve(v53, self->_visibleCount.height * (unint64_t)self->_visibleCount.width);
  unint64_t v61 = v5;
  unint64_t v62 = v4;
  MEMORY[0x1F4188790]();
  unint64_t v54 = (char *)&viewRows - v14;
  bzero((char *)&viewRows - v14, v15);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v60 = 544;
  viewRows = self->_viewRows;
  uint64_t v47 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v47)
  {
    unint64_t v58 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v46 = *(void *)v77;
    do
    {
      uint64_t v48 = 0;
      unint64_t v49 = v52 + 1;
      do
      {
        if (*(void *)v77 != v46) {
          objc_enumerationMutation(viewRows);
        }
        id v63 = *(id *)(*((void *)&v76 + 1) + 8 * v48);
        if ((*(_WORD *)([*(id *)((char *)&self->super.super.super.super.isa + v59) objectAtIndexedSubscript:v52]+ 40) & 0x200) == 0)
        {
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          uint64_t v56 = [v63 countByEnumeratingWithState:&v71 objects:v88 count:16];
          if (!v56) {
            goto LABEL_76;
          }
          uint64_t v57 = 0;
          uint64_t v16 = 0;
          uint64_t v55 = *(void *)v72;
          unint64_t v50 = v52 + 1;
          while (1)
          {
            uint64_t v17 = 0;
            uint64_t v18 = v16 + 1;
            do
            {
              if (*(void *)v72 != v55) {
                objc_enumerationMutation(v63);
              }
              unint64_t v75 = 0;
              unint64_t v75 = *(void *)(*((void *)&v71 + 1) + 8 * v17);
              if ((*(_WORD *)([*(id *)((char *)&self->super.super.super.super.isa + v64) objectAtIndexedSubscript:v16]+ 40) & 0x200) == 0)
              {
                id v19 = v54;
                unint64_t v20 = v58;
                if (!v58) {
                  goto LABEL_39;
                }
                uint64_t v21 = v54;
                unint64_t v22 = v58;
                do
                {
                  unint64_t v23 = v22 >> 1;
                  uint64_t v24 = (unint64_t *)&v21[8 * (v22 >> 1)];
                  unint64_t v26 = *v24;
                  uint64_t v25 = (char *)(v24 + 1);
                  v22 += ~(v22 >> 1);
                  if (v26 < v75) {
                    uint64_t v21 = v25;
                  }
                  else {
                    unint64_t v22 = v23;
                  }
                }
                while (v22);
                id v19 = v54;
                unint64_t v20 = v58;
                if (v21 == &v54[8 * v58] || *(void *)v21 != v75) {
LABEL_39:
                }
                  uint64_t v21 = &v19[8 * v20];
                objc_super v27 = (unint64_t *)&v19[8 * v20];
                if (v21 == (char *)v27)
                {
                  if (v16 + 1 >= v62)
                  {
                    uint64_t v29 = 1;
                  }
                  else
                  {
                    unint64_t v28 = v18;
                    uint64_t v29 = 1;
                    do
                    {
                      uint64_t v30 = [v63 objectAtIndex:v28];
                      if (v30 != v75) {
                        break;
                      }
                      if ((*(_WORD *)([*(id *)((char *)&self->super.super.super.super.isa + v64) objectAtIndexedSubscript:v28]+ 40) & 0x200) == 0)++v29; {
                      ++v28;
                      }
                    }
                    while (v28 < v62);
                  }
                  if (v50 >= v61)
                  {
                    uint64_t v32 = 1;
                  }
                  else
                  {
                    unint64_t v31 = v49;
                    uint64_t v32 = 1;
                    do
                    {
                      uint64_t v33 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v60), "objectAtIndex:", v31), "objectAtIndex:", v16);
                      if (v33 != v75) {
                        break;
                      }
                      if ((*(_WORD *)([*(id *)((char *)&self->super.super.super.super.isa + v59) objectAtIndexedSubscript:v31]+ 40) & 0x200) == 0)++v32; {
                      ++v31;
                      }
                    }
                    while (v31 < v61);
                  }
                  uint64_t v69 = v57;
                  uint64_t v70 = v29;
                  uint64_t v67 = v51;
                  uint64_t v68 = v32;
                  objc_super v66 = -[NUIContainerGridView _horizontalAlignmentOfView:inColumn:]((id *)&self->super.super.super.super.isa, v75, v16);
                  uint64_t v34 = -[NUIContainerGridView _verticalAlignmentOfView:row:]((id *)&self->super.super.super.super.isa, v75, v52);
                  uint64_t v65 = v34;
                  unint64_t v35 = v53;
                  v36 = (char *)v53[1];
                  if (v36 >= v53[2])
                  {
                    uint64_t v37 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView  {__kindof}*&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(v53, (uint64_t *)&v75, &v69, &v67, &v66, &v65);
                    unint64_t v35 = v53;
                  }
                  else
                  {
                    _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)v53[1], v75, v69, v70, v67, v68, v66, (__int16)v34);
                    uint64_t v37 = v36 + 112;
                    v35[1] = v36 + 112;
                  }
                  v35[1] = v37;
                  unint64_t v38 = v75;
                  unint64_t v39 = v58;
                  if (!v58)
                  {
                    unint64_t v40 = v27;
                    goto LABEL_72;
                  }
                  unint64_t v40 = (unint64_t *)v54;
                  do
                  {
                    unint64_t v41 = v39 >> 1;
                    v42 = &v40[v39 >> 1];
                    unint64_t v44 = *v42;
                    uint64_t v43 = v42 + 1;
                    v39 += ~(v39 >> 1);
                    if (v44 < v75) {
                      unint64_t v40 = v43;
                    }
                    else {
                      unint64_t v39 = v41;
                    }
                  }
                  while (v39);
                  if (v40 == v27 || *v40 != v75)
                  {
                    if (v27 > v40) {
                      memmove(v40 + 1, v40, (char *)v27 - (char *)v40);
                    }
                    unint64_t v39 = v58;
LABEL_72:
                    *unint64_t v40 = v38;
                    unint64_t v58 = v39 + 1;
                  }
                }
                ++v57;
              }
              ++v16;
              ++v17;
              ++v18;
            }
            while (v17 != v56);
            uint64_t v56 = [v63 countByEnumeratingWithState:&v71 objects:v88 count:16];
            if (!v56)
            {
LABEL_76:
              ++v51;
              break;
            }
          }
        }
        ++v52;
        ++v48;
        ++v49;
      }
      while (v48 != v47);
      uint64_t v47 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v47);
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    int64_t v9 = [(NUIContainerGridView *)self numberOfRows];
    p_height = ($C125A01A7EEDA62CE9060793D5E4A593 *)&self->_visibleCount.height;
    uint64_t v11 = &OBJC_IVAR___NUIContainerGridView__rows;
  }
  else
  {
    int64_t v9 = [(NUIContainerGridView *)self numberOfColumns];
    p_height = &self->_visibleCount;
    uint64_t v11 = &OBJC_IVAR___NUIContainerGridView__columns;
  }
  uint64_t v100 = *v11;
  uint64_t v101 = 664;
  std::vector<_NUIGridArrangementDimension>::reserve((void **)a3, p_height->width);
  size_t v12 = (unint64_t)(8 * v9 + 504) >> 6;
  MEMORY[0x1F4188790]();
  int64_t v13 = v9;
  uint64_t v14 = (v12 + 15) & 0x7FFFFFFFFFFFFF0;
  int64_t v107 = v13;
  v108 = (char *)&v96 - v14;
  bzero((char *)&v96 - v14, v12);
  MEMORY[0x1F4188790]();
  int64_t v105 = v13;
  v106 = (char *)&v96 - v14;
  bzero((char *)&v96 - v14, v12);
  int64_t v99 = v13;
  if (v13)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    p_responderFlags = (double *)&self->super.super.super._responderFlags;
    v98 = (NUIContainerGridView *)(v99 - 1);
    if (!a5) {
      p_responderFlags = (double *)self;
    }
    uint64_t v96 = (uint64_t)a3 + 16;
    v97 = p_responderFlags;
    do
    {
      if ((*(_WORD *)(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v100), "objectAtIndexedSubscript:", v16, v96)+ 40) & 0x200) == 0)
      {
        if (a5) {
          double v18 = -[NUIContainerGridView _heightOfRowAtIndex:]((uint64_t)self, v16);
        }
        else {
          double v18 = -[NUIContainerGridView _widthOfColumnAtIndex:]((uint64_t)self, v16);
        }
        double v19 = v18;
        unint64_t v21 = *((void *)a3 + 1);
        unint64_t v20 = *((void *)a3 + 2);
        if (v21 >= v20)
        {
          uint64_t v23 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v21 - *(void *)a3) >> 3);
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) > 0x492492492492492) {
            abort();
          }
          unint64_t v25 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v20 - *(void *)a3) >> 3);
          if (2 * v25 > v24) {
            unint64_t v24 = 2 * v25;
          }
          if (v25 >= 0x249249249249249) {
            unint64_t v26 = 0x492492492492492;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            objc_super v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v96, v26);
            uint64_t v29 = v28;
          }
          else
          {
            objc_super v27 = 0;
            uint64_t v29 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v27[56 * v23], v16, v19);
          uint64_t v32 = *(char **)a3;
          unint64_t v31 = (char *)*((void *)a3 + 1);
          uint64_t v33 = v30;
          if (v31 != *(char **)a3)
          {
            do
            {
              long long v34 = *(_OWORD *)(v31 - 56);
              long long v35 = *(_OWORD *)(v31 - 40);
              long long v36 = *(_OWORD *)(v31 - 24);
              *(void *)(v33 - 8) = *((void *)v31 - 1);
              *(_OWORD *)(v33 - 24) = v36;
              *(_OWORD *)(v33 - 40) = v35;
              *(_OWORD *)(v33 - 56) = v34;
              v33 -= 56;
              v31 -= 56;
            }
            while (v31 != v32);
            unint64_t v31 = *(char **)a3;
          }
          unint64_t v22 = v30 + 56;
          *(void *)a3 = v33;
          *((void *)a3 + 1) = v30 + 56;
          *((void *)a3 + 2) = &v27[56 * v29];
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), v16, v18);
          unint64_t v22 = v21 + 56;
          *((void *)a3 + 1) = v21 + 56;
        }
        *((void *)a3 + 1) = v22;
        double v37 = 0.0;
        if (v15 < (uint64_t)v98)
        {
          double v37 = v97[87];
          if (NUIContainerViewLengthIsSystem(0, v37)) {
            *(void *)&v108[((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v15;
          }
        }
        *(double *)(*(void *)a3 + 56 * v15++) = v37;
      }
      ++v16;
    }
    while (v16 != v99);
  }
  unint64_t v38 = *(void **)a4;
  unint64_t v39 = (void *)*((void *)a4 + 1);
  if (*(void **)a4 != v39)
  {
    uint64_t v96 = (int)v101;
    v97 = (double *)((char *)&self->super.super.super.super.isa + 2);
    if (a5) {
      unint64_t v40 = (NUIContainerGridView *)((char *)&self->super.super.super.super.isa + 2);
    }
    else {
      unint64_t v40 = self;
    }
    v98 = v40;
    do
    {
      uint64_t v41 = 10;
      if (!a5) {
        uint64_t v41 = 8;
      }
      uint64_t v42 = 9;
      if (!a5) {
        uint64_t v42 = 7;
      }
      uint64_t v43 = v38[v42];
      unint64_t v44 = v38[v41] + v43;
      if (*(unsigned __int16 *)((char *)&v98->super.super.super.super.isa + (int)v101) - 1 > (unsigned __int16)(v44 - 1))
      {
        unint64_t v45 = (unsigned __int16)(v44 - 1);
        double v46 = *(double *)([*(id *)((char *)&self->super.super.super.super.isa + v100) objectAtIndexedSubscript:*(unsigned __int16 *)(*(void *)a3 + 56 * v45 + 48)]+ 32);
        if (!NUIContainerViewLengthIsDefault(v46))
        {
          if (NUIContainerViewLengthIsSystem(0, v46)) {
            *(void *)&v108[(v45 >> 3) & 0x1FF8] |= 1 << (v44 - 1);
          }
          *(double *)(*(void *)a3 + 56 * v45) = v46;
        }
      }
      [(NUIContainerView *)self minimumSpacingAdjacentToView:*v38];
      if (a5)
      {
        double v51 = v49;
        if (v43)
        {
          double v52 = v47;
          if (!NUIContainerViewLengthIsDefault(v47))
          {
            BOOL IsSystem = NUIContainerViewLengthIsSystem(0, v52);
            unint64_t v54 = v43 - 1;
            if (IsSystem)
            {
              uint64_t v55 = 1 << v54;
              uint64_t v56 = (v54 >> 3) & 0x1FFFFFFFFFFFFFF8;
              *(void *)&v106[v56] |= v55;
              *(void *)&v108[v56] &= ~v55;
            }
            else
            {
              uint64_t v63 = 56 * v54;
              double v64 = *(double *)(*(void *)a3 + v63);
              if (v64 <= v52) {
                double v64 = v52;
              }
              *(double *)(*(void *)a3 + v63) = v64;
            }
          }
        }
        if (v44 >= *(unsigned __int16 *)((char *)v97 + (int)v101) || NUIContainerViewLengthIsDefault(v51)) {
          goto LABEL_75;
        }
        BOOL v65 = NUIContainerViewLengthIsSystem(0, v51);
        unint64_t v66 = (unsigned __int16)(v44 - 1);
        if (!v65)
        {
          uint64_t v67 = *(char **)a3;
          uint64_t v68 = 56 * (unsigned __int16)(v44 - 1);
          double v69 = *(double *)(*(void *)a3 + v68);
          if (v69 <= v51) {
            double v69 = v51;
          }
LABEL_74:
          *(double *)&v67[v68] = v69;
          goto LABEL_75;
        }
      }
      else
      {
        double v57 = v50;
        if (v43)
        {
          double v58 = v48;
          if (!NUIContainerViewLengthIsDefault(v48))
          {
            BOOL v59 = NUIContainerViewLengthIsSystem(0, v58);
            unint64_t v60 = v43 - 1;
            if (v59)
            {
              uint64_t v61 = 1 << v60;
              uint64_t v62 = (v60 >> 3) & 0x1FFFFFFFFFFFFFF8;
              *(void *)&v106[v62] |= v61;
              *(void *)&v108[v62] &= ~v61;
            }
            else
            {
              uint64_t v70 = 56 * v60;
              double v71 = *(double *)(*(void *)a3 + v70);
              if (v71 <= v58) {
                double v71 = v58;
              }
              *(double *)(*(void *)a3 + v70) = v71;
            }
          }
        }
        if (v44 >= *(unsigned __int16 *)((char *)&self->super.super.super.super.isa + v96)
          || NUIContainerViewLengthIsDefault(v57))
        {
          goto LABEL_75;
        }
        BOOL v72 = NUIContainerViewLengthIsSystem(0, v57);
        unint64_t v66 = (unsigned __int16)(v44 - 1);
        if (!v72)
        {
          uint64_t v67 = *(char **)a3;
          uint64_t v68 = 56 * (unsigned __int16)(v44 - 1);
          double v69 = *(double *)(*(void *)a3 + v68);
          if (v69 <= v57) {
            double v69 = v57;
          }
          goto LABEL_74;
        }
      }
      uint64_t v73 = 1 << v66;
      uint64_t v74 = (v66 >> 3) & 0x1FF8;
      *(void *)&v106[v74] |= v73;
      *(void *)&v108[v74] &= ~v73;
LABEL_75:
      v38 += 14;
    }
    while (v38 != v39);
  }
  LODWORD(v101) = [(NUIContainerView *)self isBaselineRelativeArrangement];
  nui::stack_bitset::begin((nui::stack_bitset *)&v107);
  uint64_t v76 = v75;
  v103 = &v107;
  uint64_t v104 = v75;
  int64_t v77 = v107;
  if (v75 != v107)
  {
    int64_t v78 = v99 - 1;
    uint64_t v100 = *MEMORY[0x1E4F1C3B8];
    while (1)
    {
      uint64_t v79 = *(void *)a3 + 56 * v76;
      uint64_t v80 = *(unsigned __int16 *)(v79 + 48);
      if (v78 > v80) {
        break;
      }
LABEL_89:
      nui::stack_bitset::iterator::operator++((uint64_t)&v103);
      uint64_t v76 = v104;
      if (v104 == v77 && v103 == &v107) {
        goto LABEL_91;
      }
    }
    if (a5)
    {
      id v81 = [(NUIContainerGridView *)self viewForLastBaselineLayoutInRowAtIndex:*(unsigned __int16 *)(v79 + 48)];
      if (!v81) {
        id v81 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", v80), "firstObject");
      }
      uint64_t v82 = v80 + 1;
      id v83 = [(NUIContainerGridView *)self viewForFirstBaselineLayoutInRowAtIndex:v80 + 1];
      if (v83) {
        goto LABEL_86;
      }
      uint64_t v84 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", v82), "firstObject");
    }
    else
    {
      id v81 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v80);
      uint64_t v84 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v80 + 1);
    }
    id v83 = (id)v84;
LABEL_86:
    double v102 = 0.0;
    if (!NUIContainerViewLengthIsSystem(&v102, *(double *)(*(void *)a3 + 56 * v76))) {
      [MEMORY[0x1E4F1CA00] raise:v100 format:@"Invalid system spacing"];
    }
    [v81 systemSpacingToAdjecentSiblingView:v83 axis:a5 baselineRelative:v101 multiplier:v102];
    *(void *)(*(void *)a3 + 56 * v76) = v85;
    goto LABEL_89;
  }
LABEL_91:
  nui::stack_bitset::begin((nui::stack_bitset *)&v105);
  uint64_t v87 = v86;
  v103 = &v105;
  uint64_t v104 = v86;
  int64_t v88 = v105;
  if (v86 != v105)
  {
    int64_t v89 = v99 - 1;
    uint64_t v100 = *MEMORY[0x1E4F1C3B8];
    do
    {
      uint64_t v90 = *(void *)a3 + 56 * v87;
      uint64_t v91 = *(unsigned __int16 *)(v90 + 48);
      if (v89 > v91)
      {
        if (a5)
        {
          id v92 = [(NUIContainerGridView *)self viewForLastBaselineLayoutInRowAtIndex:*(unsigned __int16 *)(v90 + 48)];
          id v93 = [(NUIContainerGridView *)self viewForFirstBaselineLayoutInRowAtIndex:v91 + 1];
        }
        else
        {
          id v92 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v91);
          id v93 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", 0), "objectAtIndex:", v91 + 1);
        }
        id v94 = v93;
        double v102 = 0.0;
        if (!NUIContainerViewLengthIsSystem(&v102, *(double *)(*(void *)a3 + 56 * v87))) {
          [MEMORY[0x1E4F1CA00] raise:v100 format:@"Invalid system spacing"];
        }
        [v92 systemSpacingToAdjecentSiblingView:v94 axis:a5 baselineRelative:v101 multiplier:v102];
        if (*(double *)(*(void *)a3 + 56 * v87) > v95) {
          double v95 = *(double *)(*(void *)a3 + 56 * v87);
        }
        *(double *)(*(void *)a3 + 56 * v87) = v95;
      }
      nui::stack_bitset::iterator::operator++((uint64_t)&v103);
      uint64_t v87 = v104;
    }
    while (v104 != v88 || v103 != &v105);
  }
}

- (double)_widthOfColumnAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  double v3 = *(double *)([*(id *)(a1 + 720) objectAtIndexedSubscript:a2] + 24);
  if (NUIContainerViewLengthIsDefault(v3)) {
    return *(double *)(a1 + 744);
  }
  return v3;
}

- (double)_heightOfRowAtIndex:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  double v3 = *(double *)([*(id *)(a1 + 712) objectAtIndexedSubscript:a2] + 24);
  if (NUIContainerViewLengthIsDefault(v3)) {
    return *(double *)(a1 + 736);
  }
  return v3;
}

- (int64_t)numberOfRows
{
  return [(NSMutableArray *)self->_rows count];
}

- (int64_t)numberOfColumns
{
  return [(NSMutableArray *)self->_columns count];
}

- (id)_horizontalAlignmentOfView:(uint64_t)a3 inColumn:
{
  if (result)
  {
    unsigned __int16 v4 = result;
    uint64_t result = (id *)[result alignmentForView:a2 inAxis:0];
    if (result == (id *)-1)
    {
      int v5 = *(unsigned __int16 *)([v4[90] objectAtIndexedSubscript:a3] + 40);
      if ((~(v5 << 8) & 0xFF00) != 0) {
        return (id *)(char)v5;
      }
      else {
        return (id *)*((char *)v4 + 728);
      }
    }
  }
  return result;
}

- (id)_verticalAlignmentOfView:(uint64_t)a3 row:
{
  if (result)
  {
    unsigned __int16 v4 = result;
    uint64_t result = (id *)[result alignmentForView:a2 inAxis:1];
    if (result == (id *)-1)
    {
      int v5 = *(unsigned __int16 *)([v4[89] objectAtIndexedSubscript:a3] + 40);
      if ((~(v5 << 8) & 0xFF00) != 0) {
        return (id *)(char)v5;
      }
      else {
        return (id *)((uint64_t)(int)(*((_DWORD *)v4 + 182) << 16) >> 24);
      }
    }
  }
  return result;
}

- (NUIContainerGridView)initWithArrangedSubviewRows:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUIContainerGridView;
  unsigned __int16 v4 = [(NUIContainerView *)&v8 initWithArrangedSubviews:0];
  int v5 = v4;
  if (v4)
  {
    _NUIContainerGridViewCommonInit(v4);
    if (a3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __52__NUIContainerGridView_initWithArrangedSubviewRows___block_invoke;
      v7[3] = &unk_1E5EFF340;
      v7[4] = a3;
      v7[5] = v5;
      [(NUIContainerView *)v5 performBatchUpdates:v7];
    }
  }
  return v5;
}

- (NUIContainerGridView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NUIContainerGridView;
  double v3 = -[NUIContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unsigned __int16 v4 = v3;
  if (v3) {
    _NUIContainerGridViewCommonInit(v3);
  }
  return v4;
}

uint64_t __55__NUIContainerGridView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  do
  {
    _NUIGridArrangement::resetForInvalidation((_NUIGridArrangement *)(a1 + 552), 0);
    v11.width = a3;
    v11.height = a4;
    _NUIGridArrangement::measureCells((_NUIGridArrangement *)(a1 + 552), a2, v11);
    double v9 = v8;
  }
  while (([(id)a1 mustRestartMeasurement] & 1) != 0);
  return v9;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NUIContainerGridView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.size.width forLayout:a3.size.height];
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_2, x, y, width, height);
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3 = [(NUIContainerGridView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.width forLayout:a3.height];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id).cxx_construct
{
  self->_viewRanges.__tree_.__pair3_.__value_ = 0;
  self->_viewRanges.__tree_.__pair1_.__value_.__left_ = 0;
  self->_viewRanges.__tree_.__begin_node_ = &self->_viewRanges.__tree_.__pair1_;
  return self;
}

uint64_t __65__NUIContainerGridView_insertColumnAtIndex_withArrangedSubviews___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  uint64_t v5 = *(void *)(a1 + 40);
  return [a2 insertObject:v4 atIndex:v5];
}

- (void)setColumnSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing.width != a3)
  {
    self->_spacing.double width = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)setRowSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing.height != a3)
  {
    self->_spacing.double height = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

uint64_t __47__NUIContainerGridView_setArrangedSubviewRows___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  for (uint64_t i = *(void *)(a1 + 32); [*(id *)(i + 712) count]; uint64_t i = *(void *)(a1 + 32))
    [*(id *)(a1 + 32) removeRowAtIndex:0];
  [*(id *)(a1 + 40) makeObjectsPerformSelector:sel_removeFromSuperview];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = *(void **)(a1 + 48);
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) addRowWithArrangedSubviews:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUIContainerGridView;
  -[NUIContainerView setBaselineRelativeArrangement:](&v5, sel_setBaselineRelativeArrangement_);
  self->_arrangement.baselineRelative = a3;
}

- (id)columnAtIndex:(int64_t)a3
{
  if (_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_columns count] <= (unint64_t)a3)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v8) {
      long long v9 = (__CFString *)v8;
    }
    else {
      long long v9 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 382, @"Invalid parameter not satisfying: %@", @"column < _columns.count");
  }
  columns = self->_columns;
  return (id)[(NSMutableArray *)columns objectAtIndex:a3];
}

- (void)setVerticalAlignment:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = a3;
  }
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags = self->_gridViewFlags;
  if (v5 != *(_WORD *)&gridViewFlags >> 8)
  {
    self->_$7C9949954A3843EED5620E8235AAC90E gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFF00FF | (v5 << 8));
    [(NUIContainerView *)self setNeedsInvalidation:1];
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = a3;
  }
  $7C9949954A3843EED5620E8235AAC90E gridViewFlags = self->_gridViewFlags;
  if (v5 != gridViewFlags)
  {
    self->_$7C9949954A3843EED5620E8235AAC90E gridViewFlags = ($7C9949954A3843EED5620E8235AAC90E)(*(_DWORD *)&gridViewFlags & 0xFFFFFF00 | v5);
    [(NUIContainerView *)self setNeedsInvalidation:1];
  }
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  __int16 v6 = *((_WORD *)&self->_arrangement + 4);
  if (v5 != (char)v6)
  {
    if ((unsigned __int16)(v6 << 8) == 256 || v5 == 1) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    *((_WORD *)&self->_arrangement + 4) = v6 & 0xFF00 | v5;
    [(NUIContainerView *)self setNeedsInvalidation:v8];
  }
}

- (NSArray)arrangedSubviewRows
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_viewRows count];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  int64_t v5 = (void **)((char *)v10 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  for (uint64_t i = 0; i != v4; ++i)
    v5[i] = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_viewRows, "objectAtIndex:", i), "copy");
  uint64_t v7 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:v4];
  do
  {
    uint64_t v8 = *v5++;

    --v4;
  }
  while (v4);
  return v7;
}

- (void)setVerticalDistribution:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  if (v5 != *((__int16 *)&self->_arrangement + 4) >> 8)
  {
    if (*((_WORD *)&self->_arrangement + 4) == 1 || v5 == 1) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) | (unsigned __int16)((_WORD)v5 << 8);
    [(NUIContainerView *)self setNeedsInvalidation:v7];
  }
}

- (void)getColumnRange:(_NSRange *)a3 rowRange:(_NSRange *)a4 forArrangedSubview:(id)a5
{
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && !((unint64_t)a3 | (unint64_t)a4))
  {
    uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v20) {
      unint64_t v21 = (__CFString *)v20;
    }
    else {
      unint64_t v21 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v21, 272, @"Invalid parameter not satisfying: %@", @"colRangeOut != NULL || rowRangeOut != NULL");
  }
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (!a5) {
      goto LABEL_6;
    }
  }
  else
  {
    char v12 = _NUIIsDebuggerAttached();
    if (!a5 && (v12 & 1) != 0)
    {
LABEL_6:
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
      if (v10) {
        long long v11 = (__CFString *)v10;
      }
      else {
        long long v11 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 273, @"Invalid parameter not satisfying: %@", @"findView != nil");
    }
  }
  -[NUIContainerGridView _setupViewRangesIfNeeded]((uint64_t)self);
  left = (char *)self->_viewRanges.__tree_.__pair1_.__value_.__left_;
  _NSRange v14 = (_NSRange)xmmword_1AE675860;
  if (!left) {
    goto LABEL_24;
  }
  p_pair1 = &self->_viewRanges.__tree_.__pair1_;
  do
  {
    unint64_t v16 = *((void *)left + 4);
    BOOL v17 = v16 >= (unint64_t)a5;
    if (v16 >= (unint64_t)a5) {
      double v18 = (char **)left;
    }
    else {
      double v18 = (char **)(left + 8);
    }
    if (v17) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<UIView *, const std::pair<_NSRange, _NSRange>>, void *>>> *)left;
    }
    left = *v18;
  }
  while (*v18);
  if (p_pair1 == &self->_viewRanges.__tree_.__pair1_)
  {
LABEL_24:
    _NSRange v19 = (_NSRange)xmmword_1AE675860;
  }
  else
  {
    _NSRange v19 = (_NSRange)xmmword_1AE675860;
    if (p_pair1[4].__value_.__left_ <= a5)
    {
      _NSRange v19 = *(_NSRange *)&p_pair1[5].__value_.__left_;
      _NSRange v14 = *(_NSRange *)&p_pair1[7].__value_.__left_;
    }
  }
  if (a3) {
    *a3 = v19;
  }
  if (a4) {
    *a4 = v14;
  }
}

- (void)_setupViewRangesIfNeeded
{
  v14[8] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 720) count];
    if (*(void *)(a1 + 688)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = v2 == 0;
    }
    if (!v3)
    {
      __int16 v4 = v2;
      __int16 v5 = [*(id *)(a1 + 712) count];
      v14[0] = 0;
      v14[1] = v14;
      v6.n128_u64[0] = 0x4012000000;
      v14[2] = 0x4012000000;
      v14[3] = __Block_byref_object_copy__1;
      v14[4] = __Block_byref_object_dispose__1;
      v14[5] = 0;
      MEMORY[0x1F4188790](v6);
      uint64_t v8 = (char *)v11 - v7;
      bzero((char *)v11 - v7, v9);
      v14[6] = 0;
      v14[7] = v8;
      uint64_t v10 = *(void **)(a1 + 544);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke;
      v11[3] = &unk_1E5EFF498;
      __int16 v12 = v4;
      __int16 v13 = v5;
      v11[4] = a1;
      v11[5] = v14;
      [v10 enumerateObjectsUsingBlock:v11];
      _Block_object_dispose(v14, 8);
    }
  }
}

void *__48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke_2(void *result, unint64_t a2, uint64_t a3)
{
  __int16 v5 = result;
  unint64_t v32 = a2;
  uint64_t v6 = *(void *)(result[6] + 8);
  unint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void **)(v6 + 56);
  if (!v7) {
    goto LABEL_9;
  }
  size_t v9 = v8;
  unint64_t v10 = v7;
  do
  {
    unint64_t v11 = v10 >> 1;
    __int16 v12 = &v9[v10 >> 1];
    unint64_t v14 = *v12;
    __int16 v13 = v12 + 1;
    v10 += ~(v10 >> 1);
    if (v14 < a2) {
      size_t v9 = v13;
    }
    else {
      unint64_t v10 = v11;
    }
  }
  while (v10);
  if (v9 == &v8[v7] || *v9 != a2) {
LABEL_9:
  }
    size_t v9 = &v8[v7];
  if (v9 == &v8[v7])
  {
    uint64_t v15 = 1;
    if (a3 + 1 < (unint64_t)*((unsigned __int16 *)result + 32))
    {
      do
      {
        if ([(id)v5[4] objectAtIndex:a3 + v15] != a2) {
          break;
        }
        ++v15;
      }
      while (a3 + v15 < (unint64_t)*((unsigned __int16 *)v5 + 32));
    }
    uint64_t v16 = v5[7];
    for (uint64_t i = 1; v16 + i < (unint64_t)*((unsigned __int16 *)v5 + 33); ++i)
    {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(*(id *)(v5[5] + 544), "objectAtIndex:"), "objectAtIndex:", a3);
      uint64_t v16 = v5[7];
      if (v18 != a2) {
        break;
      }
    }
    _NSRange v19 = (uint64_t **)(v5[5] + 672);
    *(void *)&long long v29 = a3;
    *((void *)&v29 + 1) = v15;
    uint64_t v30 = v16;
    uint64_t v31 = i;
    uint64_t result = std::__tree<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::__map_value_compare<UIView *,std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>>>::__emplace_unique_key_args<UIView *,UIView * const&,std::pair<_NSRange,_NSRange>>(v19, &v32, &v32, &v29);
    uint64_t v20 = *(void *)(v5[6] + 8);
    unint64_t v21 = *(void *)(v20 + 48);
    unint64_t v22 = *(unint64_t **)(v20 + 56);
    uint64_t v23 = &v22[v21];
    unint64_t v24 = v32;
    if (!v21) {
      goto LABEL_26;
    }
    do
    {
      unint64_t v25 = v21 >> 1;
      unint64_t v26 = &v22[v21 >> 1];
      unint64_t v28 = *v26;
      objc_super v27 = v26 + 1;
      v21 += ~(v21 >> 1);
      if (v28 < v32) {
        unint64_t v22 = v27;
      }
      else {
        unint64_t v21 = v25;
      }
    }
    while (v21);
    if (v22 == v23 || *v22 != v32)
    {
      if (v23 > v22)
      {
        uint64_t result = memmove(v22 + 1, v22, (char *)v23 - (char *)v22);
        unint64_t v24 = v32;
      }
LABEL_26:
      *unint64_t v22 = v24;
      ++*(void *)(v20 + 48);
    }
  }
  return result;
}

uint64_t __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__NUIContainerGridView__setupViewRangesIfNeeded__block_invoke_2;
  v4[3] = &unk_1E5EFF470;
  int v7 = *(_DWORD *)(a1 + 48);
  v4[4] = a2;
  uint64_t v6 = a3;
  long long v5 = *(_OWORD *)(a1 + 32);
  return [a2 enumerateObjectsUsingBlock:v4];
}

+ (id)containerGridViewWithArrangedSubviewRows:(id)a3
{
  BOOL v3 = (void *)[objc_alloc((Class)a1) initWithArrangedSubviewRows:a3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__NUIContainerGridView_containerGridViewWithArrangedSubviewRows___block_invoke;
  v5[3] = &unk_1E5EFF258;
  v5[4] = v3;
  [v3 performBatchUpdates:v5];
  return v3;
}

uint64_t __65__NUIContainerGridView_containerGridViewWithArrangedSubviewRows___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBaselineRelativeArrangement:1];
  [*(id *)(a1 + 32) setColumnSpacing:-1.79769313e308];
  [*(id *)(a1 + 32) setRowSpacing:-1.79769313e308];
  [*(id *)(a1 + 32) setHorizontalAlignment:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setVerticalAlignment:2];
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  [(NUIContainerGridView *)self getColumnRange:0 rowRange:v10 forArrangedSubview:a3];
  v9.receiver = self;
  v9.super_class = (Class)NUIContainerGridView;
  if ([(NUIContainerView *)&v9 needsBaselineDebugBoundingBoxesForArrangedSubview:a3])
  {
    goto LABEL_7;
  }
  long long v5 = -[NUIContainerGridView _verticalAlignmentOfView:row:]((id *)&self->super.super.super.super.isa, (uint64_t)a3, v10[0]);
  if (v5 == (id *)2 || v5 == (id *)5) {
    goto LABEL_7;
  }
  BOOL v7 = [(NUIContainerView *)self isBaselineRelativeArrangement];
  if (v7)
  {
    if ([(NUIContainerGridView *)self viewForFirstBaselineLayoutInRowAtIndex:v10[0]] != a3)
    {
      LOBYTE(v7) = [(NUIContainerGridView *)self viewForLastBaselineLayoutInRowAtIndex:v10[0] + v10[1] - 1] == a3;
      return v7;
    }
LABEL_7:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (NUIContainerGridView)initWithArrangedSubviews:(id)a3
{
  if (a3 && (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached()))
  {
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v5) {
      uint64_t v6 = (__CFString *)v5;
    }
    else {
      uint64_t v6 = @"<Unknown File>";
    }
    BOOL v7 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    unint64_t v10 = (objc_class *)objc_opt_class();
    [v7 handleFailureInMethod:a2, self, v6, 97, @"Use -[%@ initWithArrangedSubviewRows:] or -[%@ init]", v9, NSStringFromClass(v10) object file lineNumber description];
  }
  return [(NUIContainerGridView *)self initWithArrangedSubviewRows:0];
}

- (void)dealloc
{
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  *(_DWORD *)&self->_gridViewFlags |= 0x10000u;

  self->_viewRows = 0;
  self->_columns = 0;

  self->_rows = 0;
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerGridView;
  [(NUIContainerView *)&v3 dealloc];
}

- (uint64_t)_verifyInternalGridConsistencyWarningOnly:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    __int16 v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend((id)result, "arrangedSubviews"));
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = *(void **)(v3 + 544);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObjectsFromArray:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    if ([v4 isEqualToSet:v5])
    {
      return 1;
    }
    else
    {
      unint64_t v11 = (void *)[v5 mutableCopy];
      [v11 minusSet:v4];
      [v4 minusSet:v5];
      __int16 v12 = (void *)[MEMORY[0x1E4F28E78] string];
      if ([v11 count]) {
        [v12 appendFormat:@"Views managed by grid missing from arranged subviews: %@\n", v11];
      }
      if ([v4 count]) {
        [v12 appendFormat:@"Arranged subviews not being managed by grid: %@\n", v4];
      }
      if (a2)
      {
        __int16 v13 = _NUILog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[UIView(NUIPrivate) calculateLayoutSizeFittingSize:]((uint64_t)v12, v13);
        }
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v12 format];
      }

      return 0;
    }
  }
  return result;
}

- (id)arrangedSubviewInColumnAtIndex:(int64_t)a3 rowAtIndex:(int64_t)a4
{
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_columns count] <= (unint64_t)a3)
  {
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v10) {
      unint64_t v11 = (__CFString *)v10;
    }
    else {
      unint64_t v11 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 265, @"Invalid parameter not satisfying: %@", @"column < _columns.count");
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_rows count] <= (unint64_t)a4)
  {
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v12) {
      __int16 v13 = (__CFString *)v12;
    }
    else {
      __int16 v13 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 266, @"Invalid parameter not satisfying: %@", @"row < _rows.count");
  }
  uint64_t v8 = (void *)[(NSMutableArray *)self->_viewRows objectAtIndexedSubscript:a4];
  return (id)[v8 objectAtIndexedSubscript:a3];
}

- (int64_t)rowIndexForArrangedSubview:(id)a3
{
  [(NUIContainerGridView *)self getColumnRange:v5 rowRange:&v4 forArrangedSubview:a3];
  return v4;
}

- (int64_t)columnIndexForArrangedSubview:(id)a3
{
  [(NUIContainerGridView *)self getColumnRange:&v5 rowRange:&v4 forArrangedSubview:a3];
  return v5;
}

- (id)rowAtIndex:(int64_t)a3
{
  if (_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_rows count] <= (unint64_t)a3)
  {
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v8) {
      uint64_t v9 = (__CFString *)v8;
    }
    else {
      uint64_t v9 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 305, @"Invalid parameter not satisfying: %@", @"row < _rows.count");
  }
  rows = self->_rows;
  return (id)[(NSMutableArray *)rows objectAtIndex:a3];
}

- (void)moveRowAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  if (a3 != a4)
  {
    -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && [(NSMutableArray *)self->_rows count] <= (unint64_t)a3)
    {
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
      if (v11) {
        uint64_t v12 = (__CFString *)v11;
      }
      else {
        uint64_t v12 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 346, @"Invalid parameter not satisfying: %@", @"fromRow < _rows.count");
    }
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && [(NSMutableArray *)self->_rows count] <= (unint64_t)a4)
    {
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
      if (v13) {
        long long v14 = (__CFString *)v13;
      }
      else {
        long long v14 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 347, @"Invalid parameter not satisfying: %@", @"toRow < _rows.count");
    }
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    id v9 = (id)[(NSMutableArray *)self->_viewRows objectAtIndex:a3];
    [(NSMutableArray *)self->_viewRows removeObjectAtIndex:a3];
    [(NSMutableArray *)self->_viewRows insertObject:v9 atIndex:a4];

    id v10 = (id)[(NSMutableArray *)self->_rows objectAtIndex:a3];
    [(NSMutableArray *)self->_rows removeObjectAtIndex:a3];
    [(NSMutableArray *)self->_rows insertObject:v10 atIndex:a4];

    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)removeRowAtIndex:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_rows count] <= (unint64_t)a3)
  {
    uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v14) {
      long long v15 = (__CFString *)v14;
    }
    else {
      long long v15 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 363, @"Invalid parameter not satisfying: %@", @"row < _rows.count");
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  unint64_t v6 = [(NSMutableArray *)self->_rows count];
  viewRows = self->_viewRows;
  if (v6 < 2)
  {
    [(NSMutableArray *)viewRows removeAllObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    columns = self->_columns;
    uint64_t v9 = [(NSMutableArray *)columns countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(columns);
          }
          *(_WORD *)(*(void *)(*((void *)&v16 + 1) + 8 * i) + 40) |= 0x400u;
        }
        uint64_t v10 = [(NSMutableArray *)columns countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    [(NSMutableArray *)self->_columns removeAllObjects];
  }
  else
  {
    [(NSMutableArray *)viewRows removeObjectAtIndex:a3];
  }
  uint64_t v13 = [(NSMutableArray *)self->_rows objectAtIndex:a3];
  *(_WORD *)(v13 + 40) |= 0x400u;
  [(NSMutableArray *)self->_rows removeObjectAtIndex:a3];
  [(NUIContainerView *)self setNeedsInvalidation:4];
}

- (id)addColumnWithArrangedSubviews:(id)a3
{
  int64_t v5 = [(NUIContainerGridView *)self numberOfColumns];
  return [(NUIContainerGridView *)self insertColumnAtIndex:v5 withArrangedSubviews:a3];
}

- (void)moveColumnAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 != a4)
  {
    -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && [(NSMutableArray *)self->_columns count] <= (unint64_t)a3)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
      if (v16) {
        long long v17 = (__CFString *)v16;
      }
      else {
        long long v17 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v17, 433, @"Invalid parameter not satisfying: %@", @"fromCol < _columns.count");
    }
    if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
      && [(NSMutableArray *)self->_columns count] <= (unint64_t)a4)
    {
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
      if (v18) {
        long long v19 = (__CFString *)v18;
      }
      else {
        long long v19 = @"<Unknown File>";
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 434, @"Invalid parameter not satisfying: %@", @"toCol < _columns.count");
    }
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    viewRows = self->_viewRows;
    uint64_t v9 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(viewRows);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = [v13 objectAtIndex:a3];
          [v13 removeObjectAtIndex:a3];
          [v13 insertObject:v14 atIndex:a4];
        }
        uint64_t v10 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    id v15 = (id)[(NSMutableArray *)self->_columns objectAtIndex:a3];
    [(NSMutableArray *)self->_columns removeObjectAtIndex:a3];
    [(NSMutableArray *)self->_columns insertObject:v15 atIndex:a4];

    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)removeColumnAtIndex:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (_NUIEnableAPIMisuseAssertions || (_NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_columns count] <= (unint64_t)a3)
  {
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v17) {
      uint64_t v18 = (__CFString *)v17;
    }
    else {
      uint64_t v18 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 451, @"Invalid parameter not satisfying: %@", @"column < _columns.count");
  }
  *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
  if ((unint64_t)[(NSMutableArray *)self->_columns count] < 2)
  {
    [(NSMutableArray *)self->_viewRows removeAllObjects];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    rows = self->_rows;
    uint64_t v12 = [(NSMutableArray *)rows countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(rows);
          }
          *(_WORD *)(*(void *)(*((void *)&v19 + 1) + 8 * i) + 40) |= 0x400u;
        }
        uint64_t v13 = [(NSMutableArray *)rows countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }
    [(NSMutableArray *)self->_rows removeAllObjects];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    viewRows = self->_viewRows;
    uint64_t v7 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(viewRows);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * j) removeObjectAtIndex:a3];
        }
        uint64_t v8 = [(NSMutableArray *)viewRows countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  uint64_t v16 = [(NSMutableArray *)self->_columns objectAtIndex:a3];
  *(_WORD *)(v16 + 40) |= 0x400u;
  [(NSMutableArray *)self->_columns removeObjectAtIndex:a3];
  [(NUIContainerView *)self setNeedsInvalidation:4];
}

- (void)replaceArrangedSubview:(id)a3 inColumnAtIndex:(int64_t)a4 rowAtIndex:(int64_t)a5
{
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_columns count] <= (unint64_t)a4)
  {
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v15) {
      uint64_t v16 = (__CFString *)v15;
    }
    else {
      uint64_t v16 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 472, @"Invalid parameter not satisfying: %@", @"column < _columns.count");
  }
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && [(NSMutableArray *)self->_rows count] <= (unint64_t)a5)
  {
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm"];
    if (v17) {
      uint64_t v18 = (__CFString *)v17;
    }
    else {
      uint64_t v18 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 473, @"Invalid parameter not satisfying: %@", @"row < _rows.count");
  }
  id v10 = [(NUIContainerGridView *)self arrangedSubviewInColumnAtIndex:a4 rowAtIndex:a5];
  if (v10 != a3)
  {
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    [(NUIContainerGridView *)self getColumnRange:&v21 rowRange:&v19 forArrangedSubview:v10];
    for (unint64_t i = v19; i < v20 + v19; ++i)
    {
      uint64_t v12 = [(NSMutableArray *)self->_viewRows objectAtIndex:i];
      unint64_t v13 = v21;
      if (v21 < v22 + v21)
      {
        uint64_t v14 = (void *)v12;
        do
          [v14 replaceObjectAtIndex:v13++ withObject:a3];
        while (v13 < v22 + v21);
      }
    }
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)replaceArrangedSubviewAtIndex:(unint64_t)a3 withView:(id)a4
{
  id v6 = [(NSArray *)[(NUIContainerView *)self arrangedSubviews] objectAtIndex:a3];
  if (v6 != a4)
  {
    *(_DWORD *)&self->_gridViewFlags |= 0x20000u;
    [(NUIContainerGridView *)self getColumnRange:&v13 rowRange:&v11 forArrangedSubview:v6];
    for (unint64_t i = v11; i < v12 + v11; ++i)
    {
      uint64_t v8 = [(NSMutableArray *)self->_viewRows objectAtIndex:i];
      unint64_t v9 = v13;
      if (v13 < v14 + v13)
      {
        id v10 = (void *)v8;
        do
          [v10 replaceObjectAtIndex:v9++ withObject:a4];
        while (v9 < v14 + v13);
      }
    }
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_gridViewFlags;
}

- (int64_t)verticalAlignment
{
  return (uint64_t)(int)(*(_DWORD *)&self->_gridViewFlags << 16) >> 24;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (double)rowSpacing
{
  return self->_spacing.height;
}

- (double)columnSpacing
{
  return self->_spacing.width;
}

- (void)setRowHeight:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_rowHeight != a3)
  {
    self->_rowHeight = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)setColumnWidth:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_columnWidth != a3)
  {
    self->_columnWidth = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)_baselineViewVendForFirstBaseline:(void *)a3 fromViews:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v16;
  double v10 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (v12 != v8)
      {
        if (([*(id *)(*((void *)&v15 + 1) + 8 * i) isHidden] & 1) == 0)
        {
          if (a2) {
            [v12 effectiveFirstBaselineOffsetFromTop];
          }
          else {
            [v12 effectiveBaselineOffsetFromBottom];
          }
          if (v13 > v10)
          {
            uint64_t v7 = v12;
            double v10 = v13;
          }
        }
        uint64_t v8 = v12;
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);
  return v7;
}

- (id)calculateViewForFirstBaselineLayout
{
  id result = (id)[(NSMutableArray *)self->_rows count];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = 0;
    while ((*(_WORD *)([(NSMutableArray *)self->_rows objectAtIndexedSubscript:v5] + 40) & 0x200) != 0)
    {
      if (v4 == (id)++v5)
      {
        id result = 0;
        goto LABEL_7;
      }
    }
    id result = [(NUIContainerGridView *)self viewForFirstBaselineLayoutInRowAtIndex:v5];
  }
LABEL_7:
  if (!result) {
    return self;
  }
  return result;
}

- (id)calculateViewForLastBaselineLayout
{
  uint64_t v3 = [(NSMutableArray *)self->_rows count];
  do
    --v3;
  while ((*(_WORD *)([(NSMutableArray *)self->_rows objectAtIndexedSubscript:v3] + 40) & 0x200) != 0);
  id result = [(NUIContainerGridView *)self viewForLastBaselineLayoutInRowAtIndex:v3];
  if (!result) {
    return self;
  }
  return result;
}

- (id)viewForFirstBaselineLayoutInRowAtIndex:(int64_t)a3
{
  if ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:") + 40) & 0x200) != 0) {
    return 0;
  }
  uint64_t v5 = (void *)[(NSMutableArray *)self->_viewRows objectAtIndex:a3];
  return -[NUIContainerGridView _baselineViewVendForFirstBaseline:fromViews:]((uint64_t)self, 1, v5);
}

- (id)viewForLastBaselineLayoutInRowAtIndex:(int64_t)a3
{
  if ((*(_WORD *)(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:") + 40) & 0x200) != 0) {
    return 0;
  }
  uint64_t v5 = (void *)[(NSMutableArray *)self->_viewRows objectAtIndex:a3];
  return -[NUIContainerGridView _baselineViewVendForFirstBaseline:fromViews:]((uint64_t)self, 0, v5);
}

- (id)arrangedDebugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)NUIContainerGridView;
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@ size = {%ld, %ld} cells = ", -[NUIContainerView arrangedDebugDescription](&v10, sel_arrangedDebugDescription), -[NUIContainerGridView numberOfColumns](self, "numberOfColumns"), -[NUIContainerGridView numberOfRows](self, "numberOfRows")];
  _NUIGridArrangement::_NUIGridArrangement(&v9);
  v9.container = (_NUIGridArrangementContainer *)self;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  [(NUIContainerGridView *)self bounds];
  v11.double width = v4;
  v11.double height = v5;
  _NUIGridArrangement::measureCells(&v9, 1, v11);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NUIContainerGridView_arrangedDebugDescription__block_invoke;
  v8[3] = &unk_1E5EFF448;
  v8[4] = v3;
  _NUIGridArrangement::enumerateCells((uint64_t)&v9, (uint64_t)v8);
  uint64_t v6 = (void *)[v3 stringByAppendingString:@";"];
  if (v9.viewFrames.__begin_)
  {
    v9.viewFrames.__end_ = v9.viewFrames.__begin_;
    operator delete(v9.viewFrames.__begin_);
  }
  if (v9.rows.__begin_)
  {
    v9.rows.__end_ = v9.rows.__begin_;
    operator delete(v9.rows.__begin_);
  }
  if (v9.columns.__begin_)
  {
    v9.columns.__end_ = v9.columns.__begin_;
    operator delete(v9.columns.__begin_);
  }
  if (v9.cells.__begin_)
  {
    v9.cells.__end_ = v9.cells.__begin_;
    operator delete(v9.cells.__begin_);
  }
  return v6;
}

uint64_t __48__NUIContainerGridView_arrangedDebugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = *(void *)(a2 + 64);
  if (v5 == 1) {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(a2 + 56), v17);
  }
  else {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", *(void *)(a2 + 56), v5);
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a2 + 80);
  if (v8 == 1) {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)(a2 + 72), v18);
  }
  else {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", *(void *)(a2 + 72), v8);
  }
  objc_super v10 = (void *)[v4 stringWithFormat:@"[%@:%@]", v7, v9];
  uint64_t v11 = *(char *)(a2 + 104);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_355);
  }
  uint64_t v12 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v11));
  if (!v12) {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v11);
  }
  uint64_t v13 = *(char *)(a2 + 105);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_355);
  }
  uint64_t v14 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v13));
  if (!v14) {
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v13);
  }
  [v10 appendFormat:@"(%@|%@)", v12, v14];
  long long v15 = *(void **)(a1 + 32);
  return [v15 appendString:v10];
}

- (id)debugDictionaryForVisibleArrangedSubview:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerGridView;
  id v5 = -[NUIContainerView debugDictionaryForVisibleArrangedSubview:](&v11, sel_debugDictionaryForVisibleArrangedSubview_);
  [(NUIContainerGridView *)self getColumnRange:v10 rowRange:v9 forArrangedSubview:a3];
  v12[0] = @"column";
  if (v10[1] < 2uLL) {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v10[0]];
  }
  else {
    uint64_t v6 = [MEMORY[0x1E4F29238] valueWithRange:v10[0]];
  }
  v13[0] = v6;
  v12[1] = @"row";
  if (v9[1] < 2uLL) {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v9[0]];
  }
  else {
    uint64_t v7 = [MEMORY[0x1E4F29238] valueWithRange:v9[0]];
  }
  v13[1] = v7;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 2), @"span");
  return v5;
}

- (void)debugDictionaryForDimensionConfiguration:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [a2 length];
  if (!NUIContainerViewLengthIsDefault(v4))
  {
    id v5 = NSNumber;
    [a2 length];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v5, "numberWithDouble:"), @"length");
  }
  [a2 spacingAfter];
  if (!NUIContainerViewLengthIsDefault(v6))
  {
    uint64_t v7 = NSNumber;
    [a2 spacingAfter];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "numberWithDouble:"), @"spacingAfter");
  }
  if (([a2 alignment] & 0x8000000000000000) == 0)
  {
    uint64_t v8 = [a2 alignment];
    if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
      dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_355);
    }
    uint64_t v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v8));
    if (!v9) {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v8);
    }
    [v3 setObject:v9 forKeyedSubscript:@"alignment"];
  }
  return v3;
}

- (uint64_t)debugArrayForDimension:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isHidden])
        {
          objc_super v10 = (void *)v4;
          objc_super v11 = @"hidden";
        }
        else
        {
          objc_super v11 = (__CFString *)-[NUIContainerGridView debugDictionaryForDimensionConfiguration:](a1, v9);
          objc_super v10 = (void *)v4;
        }
        [v10 addObject:v11];
      }
      uint64_t v6 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)debugDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)NUIContainerGridView;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v5, sel_debugDictionary));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NUIContainerGridView debugArrayForDimension:]((uint64_t)self, self->_columns), @"columns");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NUIContainerGridView debugArrayForDimension:]((uint64_t)self, self->_rows), @"rows");
  [v3 setObject:_NUIGridArrangement::debugDictionary(&self->_arrangement) forKeyedSubscript:@"arrangement"];
  return v3;
}

- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  if ((_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
    && (*((unsigned char *)&self->_gridViewFlags + 2) & 1) == 0)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContainerGridView.mm", a4);
    if (v6) {
      uint64_t v7 = (__CFString *)v6;
    }
    else {
      uint64_t v7 = @"<Unknown File>";
    }
    uint64_t v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    [v8 handleFailureInMethod:a2, self, v7, 811, @"-[%1$@ removeArrangedSubview:] not supported, use -[%1$@ remove{Row|Column}AtIndex:] to remove arranged subviews.", NSStringFromClass(v9) object file lineNumber description];
  }
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void).cxx_destruct
{
  std::__tree<UIView *>::destroy((uint64_t)&self->_viewRanges, (void *)self->_viewRanges.__tree_.__pair1_.__value_.__left_);
  p_arrangement = &self->_arrangement;
  begin = p_arrangement->viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  objc_super v5 = p_arrangement->rows.__begin_;
  if (v5)
  {
    p_arrangement->rows.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = p_arrangement->columns.__begin_;
  if (v6)
  {
    p_arrangement->columns.__end_ = v6;
    operator delete(v6);
  }
  uint64_t v7 = p_arrangement->cells.__begin_;
  if (v7)
  {
    p_arrangement->cells.__end_ = v7;
    operator delete(v7);
  }
}

@end