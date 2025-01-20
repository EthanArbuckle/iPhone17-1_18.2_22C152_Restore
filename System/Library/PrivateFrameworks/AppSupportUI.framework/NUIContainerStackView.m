@interface NUIContainerStackView
+ (id)containerStackViewWithAxis:(int64_t)a3 arrangedSubviews:(id)a4;
+ (id)horizontalContainerStackViewWithArrangedSubviews:(id)a3;
+ (id)verticalContainerStackViewWithArrangedSubviews:(id)a3;
- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (NUIContainerStackView)initWithArrangedSubviews:(id)a3;
- (NUIContainerStackView)initWithFrame:(CGRect)a3;
- (_BYTE)_baselineViewVendForFirstBaseline:(unsigned char *)a1;
- _effectiveAlignmentForArrangedSubview:(_DWORD *)result;
- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4;
- (double)customSpacingAfterView:(id)a3;
- (double)spacing;
- (id).cxx_construct;
- (id)arrangedDebugDescription;
- (id)calculateViewForFirstBaselineLayout;
- (id)calculateViewForLastBaselineLayout;
- (id)debugDictionary;
- (int64_t)alignment;
- (int64_t)axis;
- (int64_t)distribution;
- (void)dealloc;
- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
- (void)populateGridArrangementCells:(void *)a3;
- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5;
- (void)setAlignment:(int64_t)a3;
- (void)setAxis:(int64_t)a3;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setCustomSpacing:(double)a3 afterView:(id)a4;
- (void)setDistribution:(int64_t)a3;
- (void)setSpacing:(double)a3;
- (void)setSpacing:(double)a3 afterArrangedSubviewAtIndex:(int64_t)a4;
@end

@implementation NUIContainerStackView

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  v103 = (uint64_t **)a4;
  int64_t v104 = a5;
  v122[16] = *MEMORY[0x1E4F143B8];
  v107 = self;
  v6 = [(NUIContainerView *)self arrangedSubviews];
  uint64_t v7 = [(NSArray *)v6 count];
  [(NSArray *)v6 count];
  MEMORY[0x1F4188790]();
  v9 = (char *)&v102 - v8;
  bzero((char *)&v102 - v8, v10);
  uint64_t v120 = v7;
  v121 = v9;
  bzero(v9, (unint64_t)(8 * v7 + 504) >> 6);
  uint64_t v110 = (uint64_t)v6;
  uint64_t v11 = [(NSArray *)v6 count];
  [(id)v110 count];
  MEMORY[0x1F4188790]();
  v13 = (char *)&v102 - ((v12 + 15) & 0x7FFFFFFFFFFFFF0);
  bzero(v13, v12);
  uint64_t v118 = v11;
  v119 = v13;
  bzero(v13, (unint64_t)(8 * v11 + 504) >> 6);
  if ((uint64_t)(int)(*(_DWORD *)&v107->_stackViewFlags << 12) >> 28 == v104)
  {
    uint64_t v109 = [(id)v110 count];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v106 = [(NUIContainerView *)v107 visibleArrangedSubviews];
    uint64_t v14 = [(NSArray *)v106 countByEnumeratingWithState:&v114 objects:v122 count:16];
    if (v14)
    {
      unint64_t v15 = 0;
      uint64_t v108 = *(void *)v115;
      p_responderFlags = &v107->super.super.super._responderFlags;
      uint64_t v105 = (uint64_t)a3 + 16;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v115 != v108) {
            objc_enumerationMutation(v106);
          }
          unint64_t v18 = *(void *)(*((void *)&v114 + 1) + 8 * v17);
          unint64_t v19 = objc_msgSend((id)v110, "indexOfObject:inRange:", v18, v15, v109 - v15);
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
              v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v105, v26);
              uint64_t v29 = v28;
            }
            else
            {
              v27 = 0;
              uint64_t v29 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v27[56 * v23], v19, 1.79769313e308);
            v32 = *(char **)a3;
            v31 = (char *)*((void *)a3 + 1);
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
              v31 = *(char **)a3;
            }
            v37 = &v27[56 * v29];
            unint64_t v22 = v30 + 56;
            *(void *)a3 = v33;
            *((void *)a3 + 1) = v30 + 56;
            *((void *)a3 + 2) = v37;
            if (v31) {
              operator delete(v31);
            }
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), v19, 1.79769313e308);
            unint64_t v22 = v21 + 56;
            *((void *)a3 + 1) = v22;
          }
          *((void *)a3 + 1) = v22;
          v38 = *(void **)&p_responderFlags[166];
          if (!v38) {
            goto LABEL_34;
          }
          v39 = (char *)&p_responderFlags[166];
          do
          {
            unint64_t v40 = v38[4];
            BOOL v41 = v40 >= v18;
            if (v40 >= v18) {
              v42 = v38;
            }
            else {
              v42 = v38 + 1;
            }
            if (v41) {
              v39 = (char *)v38;
            }
            v38 = (void *)*v42;
          }
          while (*v42);
          if (v39 != (char *)&p_responderFlags[166] && v18 >= *((void *)v39 + 4)) {
            p_spacing = (double *)(v39 + 40);
          }
          else {
LABEL_34:
          }
            p_spacing = &v107->_spacing;
          double v44 = *p_spacing;
          *(double *)(v22 - 56) = *p_spacing;
          if (NUIContainerViewLengthIsSystem(0, v44)) {
            *(void *)&v121[(v19 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v19;
          }
          unint64_t v15 = v19 + 1;
          ++v17;
        }
        while (v17 != v14);
        uint64_t v45 = [(NSArray *)v106 countByEnumeratingWithState:&v114 objects:v122 count:16];
        uint64_t v14 = v45;
      }
      while (v45);
      v9 = v121;
    }
    v46 = *(char **)a3;
    uint64_t v47 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3;
    uint64_t v110 = -1;
    unint64_t v48 = 0x6DB6DB6DB6DB6DB7 * v47 - 1;
    *(void *)&v46[56 * v48] = 0;
    *(void *)&v9[(v48 >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << v48);
    v49 = *v103;
    v50 = v103[1];
    if (*v103 != v50)
    {
      v51 = (char *)&v107->super.super.super.super.isa + 2;
      do
      {
        uint64_t v52 = *v49;
        if (v104)
        {
          uint64_t v53 = v49[9];
          uint64_t v54 = v49[10];
          [(NUIContainerView *)v107 minimumSpacingAdjacentToView:v52];
          double v57 = v56;
          if (v53)
          {
            double v58 = v55;
            if (!NUIContainerViewLengthIsDefault(v55))
            {
              if (NUIContainerViewLengthIsSystem(0, v58))
              {
                uint64_t v59 = 1 << (v53 - 1);
                unint64_t v60 = ((unint64_t)(unsigned __int16)(v53 - 1) >> 3) & 0x1FF8;
                *(void *)&v119[v60] |= v59;
                *(void *)&v9[v60] &= ~v59;
              }
              else
              {
                double v68 = *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v53 - 1));
                if (v68 <= v58) {
                  double v68 = v58;
                }
                *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v53 - 1)) = v68;
              }
            }
          }
          unint64_t v69 = v54 + v53;
          if (v69 >= *((unsigned __int16 *)v51 + 328) || NUIContainerViewLengthIsDefault(v57)) {
            goto LABEL_69;
          }
        }
        else
        {
          uint64_t v62 = v49[7];
          uint64_t v61 = v49[8];
          [(NUIContainerView *)v107 minimumSpacingAdjacentToView:v52];
          double v57 = v64;
          if (v62)
          {
            double v65 = v63;
            if (!NUIContainerViewLengthIsDefault(v63))
            {
              if (NUIContainerViewLengthIsSystem(0, v65))
              {
                uint64_t v66 = 1 << (v62 - 1);
                unint64_t v67 = ((unint64_t)(unsigned __int16)(v62 - 1) >> 3) & 0x1FF8;
                *(void *)&v119[v67] |= v66;
                *(void *)&v9[v67] &= ~v66;
              }
              else
              {
                double v70 = *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v62 - 1));
                if (v70 <= v65) {
                  double v70 = v65;
                }
                *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v62 - 1)) = v70;
              }
            }
          }
          unint64_t v69 = v61 + v62;
          if (v69 >= v107->_visibleCount.width || NUIContainerViewLengthIsDefault(v57)) {
            goto LABEL_69;
          }
        }
        if (NUIContainerViewLengthIsSystem(0, v57))
        {
          uint64_t v71 = 1 << (v69 - 1);
          unint64_t v72 = ((unint64_t)(unsigned __int16)(v69 - 1) >> 3) & 0x1FF8;
          *(void *)&v119[v72] |= v71;
          *(void *)&v9[v72] &= ~v71;
        }
        else
        {
          double v73 = *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v69 - 1));
          if (v73 <= v57) {
            double v73 = v57;
          }
          *(double *)(*(void *)a3 + 56 * (unsigned __int16)(v69 - 1)) = v73;
        }
LABEL_69:
        v49 += 14;
      }
      while (v49 != v50);
    }
    uint64_t v74 = [(NUIContainerView *)v107 isBaselineRelativeArrangement];
    nui::stack_bitset::begin((nui::stack_bitset *)&v120);
    unint64_t v76 = v75;
    v112 = &v120;
    unint64_t v113 = v75;
    uint64_t v77 = v120;
    if (v75 != v120)
    {
      uint64_t v78 = *MEMORY[0x1E4F1C3B8];
      do
      {
        if (v76 < v110 + 0x6DB6DB6DB6DB6DB7 * (((char *)v103[1] - (char *)*v103) >> 4))
        {
          double v111 = 0.0;
          if (!NUIContainerViewLengthIsSystem(&v111, *(double *)(*(void *)a3 + 56 * v76))) {
            [MEMORY[0x1E4F1CA00] raise:v78 format:@"Invalid system spacing"];
          }
          [(id)(*v103)[14 * v76] systemSpacingToAdjecentSiblingView:(*v103)[14 * v76 + 14] axis:v104 baselineRelative:v74 multiplier:v111];
          *(void *)(*(void *)a3 + 56 * v76) = v79;
        }
        nui::stack_bitset::iterator::operator++((uint64_t)&v112);
        unint64_t v76 = v113;
      }
      while (v113 != v77 || v112 != &v120);
    }
    nui::stack_bitset::begin((nui::stack_bitset *)&v118);
    unint64_t v81 = v80;
    v112 = &v118;
    unint64_t v113 = v80;
    uint64_t v82 = v118;
    if (v80 != v118)
    {
      uint64_t v83 = *MEMORY[0x1E4F1C3B8];
      do
      {
        double v111 = 0.0;
        if (!NUIContainerViewLengthIsSystem(&v111, *(double *)(*(void *)a3 + 56 * v81))) {
          [MEMORY[0x1E4F1CA00] raise:v83 format:@"Invalid system spacing"];
        }
        [(id)(*v103)[14 * v81] systemSpacingToAdjecentSiblingView:(*v103)[14 * v81 + 14] axis:v104 baselineRelative:v74 multiplier:v111];
        if (*(double *)(*(void *)a3 + 56 * v81) > v84) {
          double v84 = *(double *)(*(void *)a3 + 56 * v81);
        }
        *(double *)(*(void *)a3 + 56 * v81) = v84;
        nui::stack_bitset::iterator::operator++((uint64_t)&v112);
        unint64_t v81 = v113;
      }
      while (v113 != v82 || v112 != &v118);
    }
  }
  else
  {
    unint64_t v85 = *((void *)a3 + 2);
    unint64_t v86 = *((void *)a3 + 1);
    if (v86 >= v85)
    {
      uint64_t v88 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v86 - *(void *)a3) >> 3);
      if ((unint64_t)(v88 + 1) > 0x492492492492492) {
        abort();
      }
      unint64_t v89 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v85 - *(void *)a3) >> 3);
      uint64_t v90 = 2 * v89;
      if (2 * v89 <= v88 + 1) {
        uint64_t v90 = v88 + 1;
      }
      if (v89 >= 0x249249249249249) {
        unint64_t v91 = 0x492492492492492;
      }
      else {
        unint64_t v91 = v90;
      }
      if (v91)
      {
        v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v91);
        uint64_t v94 = v93;
      }
      else
      {
        v92 = 0;
        uint64_t v94 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v92[56 * v88], 0, 1.79769313e308);
      v96 = &v92[56 * v94];
      unint64_t v87 = v95 + 56;
      v98 = *(char **)a3;
      v97 = (char *)*((void *)a3 + 1);
      if (v97 != *(char **)a3)
      {
        do
        {
          long long v99 = *(_OWORD *)(v97 - 56);
          long long v100 = *(_OWORD *)(v97 - 40);
          long long v101 = *(_OWORD *)(v97 - 24);
          *(void *)(v95 - 8) = *((void *)v97 - 1);
          *(_OWORD *)(v95 - 24) = v101;
          *(_OWORD *)(v95 - 40) = v100;
          *(_OWORD *)(v95 - 56) = v99;
          v95 -= 56;
          v97 -= 56;
        }
        while (v97 != v98);
        v97 = *(char **)a3;
      }
      *(void *)a3 = v95;
      *((void *)a3 + 1) = v87;
      *((void *)a3 + 2) = v96;
      if (v97) {
        operator delete(v97);
      }
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      unint64_t v87 = v86 + 56;
      *((void *)a3 + 1) = v86 + 56;
    }
    *((void *)a3 + 1) = v87;
    *(void *)(v87 - 56) = 0;
  }
}

- _effectiveAlignmentForArrangedSubview:(_DWORD *)result
{
  if (result)
  {
    v2 = result;
    result = (_DWORD *)[result alignmentForView:a2 inAxis:(result[172] & 0xF0000) == 0];
    if (result == (_DWORD *)-1) {
      return (_DWORD *)*((char *)v2 + 688);
    }
  }
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = [(NUIContainerView *)self visibleArrangedSubviews];
  v6 = v5;
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  int v9 = *(_DWORD *)&stackViewFlags & 0xF0000;
  BOOL v8 = (*(_DWORD *)&stackViewFlags & 0xF0000) == 0;
  __int16 v10 = *((unsigned __int8 *)&stackViewFlags + 1);
  if (!v8) {
    __int16 v10 = 0;
  }
  *((unsigned char *)&self->_arrangement + 8) = v10;
  if (v9) {
    __int16 v11 = *((unsigned __int8 *)&self->_stackViewFlags + 1) << 8;
  }
  else {
    __int16 v11 = 0;
  }
  *((_WORD *)&self->_arrangement + 4) = v11 | v10;
  *((void *)a3 + 1) = *(void *)a3;
  long long v29 = xmmword_1AE675740;
  long long v30 = xmmword_1AE675740;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v28 = 0;
        uint64_t v28 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v23 = 0;
        unint64_t v15 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, v28);
        uint64_t v23 = v15;
        if (v9)
        {
          uint64_t v22 = 0;
          unint64_t v16 = *((void *)a3 + 1);
          if (v16 >= *((void *)a3 + 2))
          {
            unint64_t v18 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v28, (uint64_t *)&v30, (uint64_t *)&v29, &v23, &v22);
          }
          else
          {
            unint64_t v17 = _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v28, v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), v15, 0).n128_u64[0];
            unint64_t v18 = (void *)(v16 + 112);
            *((void *)a3 + 1) = v16 + 112;
          }
          *((void *)a3 + 1) = v18;
          *(void *)&long long v29 = v29 + 1;
        }
        else
        {
          uint64_t v22 = 0;
          unint64_t v19 = *((void *)a3 + 1);
          if (v19 >= *((void *)a3 + 2))
          {
            unint64_t v20 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment,NUIContainerAlignment&>((void **)a3, &v28, (uint64_t *)&v30, (uint64_t *)&v29, &v22, &v23);
          }
          else
          {
            unint64_t v17 = _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v28, v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), 0, (__int16)v15).n128_u64[0];
            unint64_t v20 = (void *)(v19 + 112);
            *((void *)a3 + 1) = v19 + 112;
          }
          *((void *)a3 + 1) = v20;
          *(void *)&long long v30 = v30 + 1;
        }
      }
      uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16, *(double *)&v17, v22, v23);
    }
    while (v12);
    int v21 = (unsigned __int16)v30 | (v29 << 16);
  }
  else
  {
    int v21 = 0;
  }
  self->_visibleCount = ($C125A01A7EEDA62CE9060793D5E4A593)v21;
}

- (NUIContainerStackView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerStackView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_arrangement.container = (_NUIGridArrangementContainer *)result;
  }
  return result;
}

- (NUIContainerStackView)initWithArrangedSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerStackView;
  result = [(NUIContainerView *)&v4 initWithArrangedSubviews:a3];
  if (result) {
    result->_arrangement.container = (_NUIGridArrangementContainer *)result;
  }
  return result;
}

uint64_t __56__NUIContainerStackView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NUIContainerStackView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.size.width forLayout:a3.size.height];
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_3, x, y, width, height);
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  do
  {
    _NUIGridArrangement::resetForInvalidation((_NUIGridArrangement *)(a1 + 544), 0);
    v11.double width = a3;
    v11.double height = a4;
    _NUIGridArrangement::measureCells((_NUIGridArrangement *)(a1 + 544), a2, v11);
    double v9 = v8;
  }
  while (([(id)a1 mustRestartMeasurement] & 1) != 0);
  return v9;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3 = [(NUIContainerStackView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.width forLayout:a3.height];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (_BYTE)_baselineViewVendForFirstBaseline:(unsigned char *)a1
{
  v2 = a1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v4 = (void *)[a1 visibleArrangedSubviews];
    v5 = v4;
    if ((v2[690] & 0xF) != 0)
    {
      if (a2)
      {
        v2 = (unsigned char *)[v4 firstObject];
        [v2 effectiveFirstBaselineOffsetFromTop];
      }
      else
      {
        v2 = (unsigned char *)[v4 lastObject];
        [v2 effectiveBaselineOffsetFromBottom];
      }
      if (v6 <= 0.0) {
        return 0;
      }
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v7) {
        return 0;
      }
      uint64_t v8 = v7;
      v2 = 0;
      uint64_t v9 = *(void *)v16;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (a2) {
            [v12 effectiveFirstBaselineOffsetFromTop];
          }
          else {
            [v12 effectiveBaselineOffsetFromBottom];
          }
          if (v13 > v10)
          {
            v2 = v12;
            double v10 = v13;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  return v2;
}

- (id)calculateViewForLastBaselineLayout
{
  id result = -[NUIContainerStackView _baselineViewVendForFirstBaseline:](self, 0);
  if (!result) {
    return self;
  }
  return result;
}

- (id).cxx_construct
{
  self->_customSpacings.__tree_.__pair3_.__value_ = 0;
  self->_customSpacings.__tree_.__pair1_.__value_.__left_ = 0;
  self->_customSpacings.__tree_.__begin_node_ = &self->_customSpacings.__tree_.__pair1_;
  return self;
}

- (void)setSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (void)setAxis:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  if ((uint64_t)(int)(*(_DWORD *)&stackViewFlags << 12) >> 28 != a3)
  {
    self->_$16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFF0FFFF | ((a3 & 0xF) << 16));
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)setAlignment:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  if (v5 != stackViewFlags)
  {
    self->_$16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFFFFF00 | v5);
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUIContainerStackView;
  -[NUIContainerView setBaselineRelativeArrangement:](&v5, sel_setBaselineRelativeArrangement_);
  self->_arrangement.baselineRelative = a3;
}

- (void)setDistribution:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  int v7 = *(_WORD *)&stackViewFlags >> 8;
  if (v5 != v7)
  {
    if (v7 == 1 || v5 == 1) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 1;
    }
    __int16 v10 = (_WORD)v5 << 8;
    self->_$16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFFF00FF | (v5 << 8));
    LOWORD(v5) = v5;
    if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0) {
      __int16 v11 = 255;
    }
    else {
      __int16 v11 = -256;
    }
    if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0) {
      LOWORD(v5) = v10;
    }
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) & v11 | v5;
    [(NUIContainerView *)self setNeedsInvalidation:v9];
  }
}

+ (id)containerStackViewWithAxis:(int64_t)a3 arrangedSubviews:(id)a4
{
  int64_t v5 = (void *)[objc_alloc((Class)a1) initWithArrangedSubviews:a4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__NUIContainerStackView_containerStackViewWithAxis_arrangedSubviews___block_invoke;
  v7[3] = &unk_1E5EFF4C0;
  v7[4] = v5;
  v7[5] = a3;
  [v5 performBatchUpdates:v7];
  return v5;
}

uint64_t __69__NUIContainerStackView_containerStackViewWithAxis_arrangedSubviews___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBaselineRelativeArrangement:1];
  [*(id *)(a1 + 32) setSpacing:-1.79769313e308];
  [*(id *)(a1 + 32) setAxis:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = 2 * (*(void *)(a1 + 40) == 0);
  return [v2 setAlignment:v3];
}

+ (id)horizontalContainerStackViewWithArrangedSubviews:(id)a3
{
  return (id)[a1 containerStackViewWithAxis:0 arrangedSubviews:a3];
}

+ (id)verticalContainerStackViewWithArrangedSubviews:(id)a3
{
  return (id)[a1 containerStackViewWithAxis:1 arrangedSubviews:a3];
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUIContainerStackView;
  if (-[NUIContainerView needsBaselineDebugBoundingBoxesForArrangedSubview:](&v8, sel_needsBaselineDebugBoundingBoxesForArrangedSubview_))
  {
    return 1;
  }
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0) {
    return (*(_DWORD *)&stackViewFlags & 0xF0000) == 0x10000
  }
        && [(NUIContainerView *)self isBaselineRelativeArrangement];
  int v7 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, (uint64_t)a3);
  BOOL result = 1;
  if (v7 != (_DWORD *)2 && v7 != (_DWORD *)5)
  {
    $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
    return (*(_DWORD *)&stackViewFlags & 0xF0000) == 0x10000
        && [(NUIContainerView *)self isBaselineRelativeArrangement];
  }
  return result;
}

- (void)dealloc
{
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerStackView;
  [(NUIContainerView *)&v3 dealloc];
}

- (id)calculateViewForFirstBaselineLayout
{
  id result = -[NUIContainerStackView _baselineViewVendForFirstBaseline:](self, 1);
  if (!result) {
    return self;
  }
  return result;
}

- (int64_t)axis
{
  return (uint64_t)(int)(*(_DWORD *)&self->_stackViewFlags << 12) >> 28;
}

- (int64_t)distribution
{
  return (uint64_t)(int)(*(_DWORD *)&self->_stackViewFlags << 16) >> 24;
}

- (int64_t)alignment
{
  return (int64_t)self->_stackViewFlags;
}

- (double)customSpacingAfterView:(id)a3
{
  left = (char *)self->_customSpacings.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (NUIContainerStackView *)&self->_customSpacings.__tree_.__pair1_;
    do
    {
      unint64_t v5 = *((void *)left + 4);
      BOOL v6 = v5 >= (unint64_t)a3;
      if (v5 >= (unint64_t)a3) {
        int v7 = (char **)left;
      }
      else {
        int v7 = (char **)(left + 8);
      }
      if (v6) {
        p_pair1 = (NUIContainerStackView *)left;
      }
      left = *v7;
    }
    while (*v7);
    objc_super v8 = (double *)&NUIContainerViewLengthUseDefault;
    if (p_pair1 != (NUIContainerStackView *)&self->_customSpacings.__tree_.__pair1_)
    {
      unint64_t cachedTraitCollection = (unint64_t)p_pair1->super.super._cachedTraitCollection;
      p_swiftAnimationInfo = (double *)&p_pair1->super.super._swiftAnimationInfo;
      if (cachedTraitCollection <= (unint64_t)a3) {
        objc_super v8 = p_swiftAnimationInfo;
      }
    }
  }
  else
  {
    objc_super v8 = (double *)&NUIContainerViewLengthUseDefault;
  }
  return *v8;
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
  id v8 = a4;
  BOOL IsDefault = NUIContainerViewLengthIsDefault(a3);
  p_customSpacings = (uint64_t **)&self->_customSpacings;
  if (IsDefault)
  {
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)p_customSpacings, (unint64_t *)&v8);
  }
  else
  {
    uint64_t v9 = &v8;
    *((double *)std::__tree<std::__value_type<UIView *,double>,std::__map_value_compare<UIView *,std::__value_type<UIView *,double>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,double>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(p_customSpacings, (unint64_t *)&v8, (uint64_t)&std::piecewise_construct, (uint64_t **)&v9)+ 5) = a3;
  }
  [(NUIContainerView *)self setNeedsInvalidation:2];
}

- (void)setSpacing:(double)a3 afterArrangedSubviewAtIndex:(int64_t)a4
{
  id v6 = [(NSArray *)[(NUIContainerView *)self arrangedSubviews] objectAtIndex:a4];
  [(NUIContainerStackView *)self setCustomSpacing:v6 afterView:a3];
}

- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  id v8 = a3;
  std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_customSpacings, (unint64_t *)&v8);
  v7.receiver = self;
  v7.super_class = (Class)NUIContainerStackView;
  [(NUIContainerView *)&v7 didRemoveArrangedSubview:a3 atIndex:a4];
}

- (id)arrangedDebugDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags = self->_stackViewFlags;
  double v4 = (void *)MEMORY[0x1E4F28E78];
  if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0) {
    unint64_t v5 = @"Vert";
  }
  else {
    unint64_t v5 = @"Horz";
  }
  uint64_t v6 = (uint64_t)(int)(*(_DWORD *)&stackViewFlags << 16) >> 24;
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1) {
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_167);
  }
  uint64_t v7 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v6));
  if (!v7) {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v6);
  }
  v21.receiver = self;
  v21.super_class = (Class)NUIContainerStackView;
  id v8 = objc_msgSend(v4, "stringWithFormat:", @"%@ axis = %@: distribution = %@; alignments = ",
                 v5,
                 v7,
                 [(NUIContainerView *)&v21 arrangedDebugDescription]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = [(NUIContainerView *)self visibleArrangedSubviews];
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, *(void *)(*((void *)&v17 + 1) + 8 * v12));
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_223);
        }
        uint64_t v14 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v13));
        if (!v14) {
          uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v13);
        }
        [v8 appendFormat:@"[%@]", v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }
  return (id)[v8 stringByAppendingString:@";"];
}

- (id)debugDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)NUIContainerStackView;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v11, sel_debugDictionary));
  if ([(NUIContainerStackView *)self axis]) {
    double v4 = @"vertical";
  }
  else {
    double v4 = @"horizontal";
  }
  [v3 setObject:v4 forKeyedSubscript:@"axis"];
  int64_t v5 = [(NUIContainerStackView *)self alignment];
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_223);
  }
  uint64_t v6 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v5));
  if (!v6) {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v5);
  }
  [v3 setObject:v6 forKeyedSubscript:@"alignment"];
  int64_t v7 = [(NUIContainerStackView *)self distribution];
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1) {
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_167);
  }
  uint64_t v8 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v7));
  if (!v8) {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v7);
  }
  [v3 setObject:v8 forKeyedSubscript:@"distribution"];
  uint64_t v9 = NSNumber;
  [(NUIContainerStackView *)self spacing];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v9, "numberWithDouble:"), @"spacing");
  [v3 setObject:_NUIGridArrangement::debugDictionary(&self->_arrangement) forKeyedSubscript:@"arrangement"];
  return (id)[v3 copy];
}

- (double)spacing
{
  return self->_spacing;
}

- (void).cxx_destruct
{
  std::__tree<UIView *>::destroy((uint64_t)&self->_customSpacings, (void *)self->_customSpacings.__tree_.__pair1_.__value_.__left_);
  p_arrangement = &self->_arrangement;
  begin = p_arrangement->viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  int64_t v5 = p_arrangement->rows.__begin_;
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
  int64_t v7 = p_arrangement->cells.__begin_;
  if (v7)
  {
    p_arrangement->cells.__end_ = v7;
    operator delete(v7);
  }
}

@end