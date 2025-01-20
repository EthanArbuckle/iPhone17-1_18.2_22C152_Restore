@interface _MKStackView
- (BOOL)bottomConstraintShouldBeGreaterThanOrEqual;
- (NSArray)stackedSubviews;
- (_MKAnimationStackViewDelegate)stackAnimationDelegate;
- (_MKStackView)initWithFrame:(CGRect)a3;
- (_MKStackViewDelegate)stackDelegate;
- (void)_createConstraints;
- (void)addSubview:(id)a3;
- (void)setBottomConstraintShouldBeGreaterThanOrEqual:(BOOL)a3;
- (void)setStackAnimationDelegate:(id)a3;
- (void)setStackDelegate:(id)a3;
- (void)setStackedSubviews:(id)a3;
- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4;
- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5;
@end

@implementation _MKStackView

- (_MKStackView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKStackView;
  v3 = -[_MKStackView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    viewsNeedingWidthConstraints = v3->_viewsNeedingWidthConstraints;
    v3->_viewsNeedingWidthConstraints = (NSHashTable *)v4;
  }
  return v3;
}

- (void)setStackedSubviews:(id)a3
{
}

- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4
{
}

- (void)setStackedSubviews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  v8 = (NSArray *)a3;
  v9 = v8;
  if (self->_stackedSubviews != v8 && (-[NSArray isEqual:](v8, "isEqual:") & 1) == 0)
  {
    if (v6)
    {
      v10 = [(_MKStackView *)self window];
      BOOL v95 = v10 != 0;
    }
    else
    {
      BOOL v95 = 0;
    }
    if (self->_stackConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      stackConstraints = self->_stackConstraints;
      self->_stackConstraints = 0;
    }
    v12 = self->_stackedSubviews;
    v13 = (NSArray *)[(NSArray *)v9 copy];
    stackedSubviews = self->_stackedSubviews;
    self->_stackedSubviews = v13;

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v15 = self->_stackedSubviews;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v117 objects:v125 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v118 != v18) {
            objc_enumerationMutation(v15);
          }
          [(_MKStackView *)self addSubview:*(void *)(*((void *)&v117 + 1) + 8 * i)];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v117 objects:v125 count:16];
      }
      while (v17);
    }

    v20 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      v21 = v12;
    }
    else {
      v21 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    v22 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v21];
    v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    [v22 minusSet:v23];

    if (v95)
    {
      v87 = v22;
      if (v5)
      {
        v24 = [(_MKStackView *)self stackAnimationDelegate];
        [v24 stackViewNeedsLayout:self];
      }
      v86 = v9;
      if (v9) {
        v25 = v9;
      }
      else {
        v25 = v20;
      }
      v26 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v25];
      v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      [v26 minusSet:v27];

      char v84 = [(_MKStackView *)self clipsToBounds];
      [(_MKStackView *)self setClipsToBounds:1];
      p_stackDelegate = &self->_stackDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_stackDelegate);
      v85 = v12;
      if (WeakRetained)
      {
        id v30 = objc_loadWeakRetained((id *)&self->_stackDelegate);
        char v31 = objc_opt_respondsToSelector();
      }
      else
      {
        char v31 = 0;
      }

      v96 = self;
      [(_MKStackView *)self bounds];
      double Width = CGRectGetWidth(v127);
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      obuint64_t j = v26;
      uint64_t v39 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v114;
        double v42 = *MEMORY[0x1E4F1DAD8];
        double v43 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v114 != v41) {
              objc_enumerationMutation(obj);
            }
            v45 = *(void **)(*((void *)&v113 + 1) + 8 * v44);
            v46 = [v45 widthAnchor];
            v47 = [v46 constraintEqualToConstant:Width];

            [v47 setActive:1];
            objc_msgSend(v45, "_mapkit_layoutIfNeeded");
            [v47 setActive:0];
            [v45 frame];
            double v49 = v48;
            double MaxY = v50;
            double v53 = v52;
            double v55 = v54;
            uint64_t v56 = [(NSArray *)v96->_stackedSubviews indexOfObject:v45];
            if (!v56)
            {
              v57 = 0;
              double MaxY = v43;
              double v49 = v42;
              if ((v31 & 1) == 0) {
                goto LABEL_46;
              }
LABEL_45:
              id v58 = objc_loadWeakRetained((id *)p_stackDelegate);
              [v58 stackView:v96 distanceBetweenUpperView:v57 andLowerView:v45];
              double MaxY = MaxY + v59;

              goto LABEL_46;
            }
            if (v56 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v57 = 0;
              if (v31) {
                goto LABEL_45;
              }
            }
            else
            {
              v57 = [(NSArray *)v96->_stackedSubviews objectAtIndexedSubscript:v56 - 1];
              [v57 frame];
              double MaxY = CGRectGetMaxY(v128);
              double v49 = 0.0;
              if (v31) {
                goto LABEL_45;
              }
            }
LABEL_46:
            objc_msgSend(v45, "setFrame:", v49, MaxY, v53, v55);
            [v45 setAlpha:0.0];

            ++v44;
          }
          while (v40 != v44);
          uint64_t v60 = [obj countByEnumeratingWithState:&v113 objects:v124 count:16];
          uint64_t v40 = v60;
        }
        while (v60);
      }

      v91 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 4 * objc_msgSend(v87, "count"));
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v88 = v87;
      uint64_t v92 = [v88 countByEnumeratingWithState:&v109 objects:v123 count:16];
      if (v92)
      {
        uint64_t v90 = *(void *)v110;
        do
        {
          for (uint64_t j = 0; j != v92; ++j)
          {
            if (*(void *)v110 != v90) {
              objc_enumerationMutation(v88);
            }
            v62 = *(void **)(*((void *)&v109 + 1) + 8 * j);
            [v62 frame];
            CGFloat v64 = v63;
            CGFloat v66 = v65;
            CGFloat v68 = v67;
            CGFloat v70 = v69;
            [v62 removeFromSuperview];
            v108.receiver = v96;
            v108.super_class = (Class)_MKStackView;
            [(_MKStackView *)&v108 addSubview:v62];
            v94 = [v62 topAnchor];
            v93 = [(_MKStackView *)v96 topAnchor];
            v129.origin.x = v64;
            v129.origin.y = v66;
            v129.size.width = v68;
            v129.size.height = v70;
            v71 = [v94 constraintEqualToAnchor:v93 constant:CGRectGetMinY(v129)];
            v122[0] = v71;
            v72 = [v62 leftAnchor];
            v73 = [(_MKStackView *)v96 leftAnchor];
            v130.origin.x = v64;
            v130.origin.y = v66;
            v130.size.width = v68;
            v130.size.height = v70;
            v74 = [v72 constraintEqualToAnchor:v73 constant:CGRectGetMinX(v130)];
            v122[1] = v74;
            v75 = [v62 widthAnchor];
            v131.origin.x = v64;
            v131.origin.y = v66;
            v131.size.width = v68;
            v131.size.height = v70;
            v76 = [v75 constraintEqualToConstant:CGRectGetWidth(v131)];
            v122[2] = v76;
            v77 = [v62 heightAnchor];
            v132.origin.x = v64;
            v132.origin.y = v66;
            v132.size.width = v68;
            v132.size.height = v70;
            v78 = [v77 constraintEqualToConstant:CGRectGetHeight(v132)];
            v122[3] = v78;
            v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:4];
            [v91 addObjectsFromArray:v79];
          }
          uint64_t v92 = [v88 countByEnumeratingWithState:&v109 objects:v123 count:16];
        }
        while (v92);
      }

      [MEMORY[0x1E4F28DC8] activateConstraints:v91];
      [(_MKStackView *)v96 _createConstraints];
      unint64_t v80 = [obj count];
      double v81 = dbl_18BD1B000[v80 < [v88 count]];
      v82 = (void *)MEMORY[0x1E4F42FF0];
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __57___MKStackView_setStackedSubviews_animated_isNeedLayout___block_invoke;
      v105[3] = &unk_1E54B8270;
      v105[4] = v96;
      id v106 = obj;
      id v107 = v88;
      v101[0] = MEMORY[0x1E4F143A8];
      v101[1] = 3221225472;
      v101[2] = __57___MKStackView_setStackedSubviews_animated_isNeedLayout___block_invoke_2;
      v101[3] = &unk_1E54B94A8;
      id v102 = v107;
      v103 = v96;
      char v104 = v84;
      id v83 = obj;
      objc_msgSend(v82, "_mapkit_animateWithDuration:animations:completion:", v105, v101, v81);

      v12 = v85;
      v9 = v86;
      v34 = v87;
    }
    else
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v32 = v22;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v97 objects:v121 count:16];
      v34 = v22;
      if (v33)
      {
        uint64_t v35 = v33;
        uint64_t v36 = *(void *)v98;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v98 != v36) {
              objc_enumerationMutation(v32);
            }
            [*(id *)(*((void *)&v97 + 1) + 8 * k) removeFromSuperview];
          }
          uint64_t v35 = [v32 countByEnumeratingWithState:&v97 objects:v121 count:16];
        }
        while (v35);
      }

      [(_MKStackView *)self _createConstraints];
    }
  }
}

- (void)_createConstraints
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000;
  if ([(NSHashTable *)self->_viewsNeedingWidthConstraints count])
  {
    uint64_t v4 = [(NSHashTable *)self->_viewsNeedingWidthConstraints allObjects];
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * objc_msgSend(v4, "count"));
    [(NSHashTable *)self->_viewsNeedingWidthConstraints removeAllObjects];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v55 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v12 = [v11 superview];

          if (v12 == self)
          {
            v13 = [v11 leadingAnchor];
            v14 = [(_MKStackView *)self leadingAnchor];
            v15 = [v13 constraintEqualToAnchor:v14];
            [v5 addObject:v15];

            uint64_t v16 = [(_MKStackView *)self trailingAnchor];
            uint64_t v17 = [v11 trailingAnchor];
            uint64_t v18 = [v16 constraintEqualToAnchor:v17];
            [v5 addObject:v18];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v8);
    }

    unint64_t v3 = 0x1E4F28000uLL;
    [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  }
  uint64_t v19 = 408;
  if (![(NSArray *)self->_stackConstraints count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stackDelegate);
    location = (id *)&self->_stackDelegate;
    if (WeakRetained)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_stackDelegate);
      char v22 = objc_opt_respondsToSelector();
    }
    else
    {
      char v22 = 0;
    }

    double v49 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_stackedSubviews, "count") + 1);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v23 = self->_stackedSubviews;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v46 = 408;
      id v26 = 0;
      uint64_t v27 = *(void *)v51;
      obuint64_t j = v23;
      do
      {
        uint64_t v28 = 0;
        v29 = v26;
        do
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(obj);
          }
          id v30 = *(void **)(*((void *)&v50 + 1) + 8 * v28);
          double v31 = 0.0;
          if (v22)
          {
            id v32 = objc_loadWeakRetained(location);
            [v32 stackView:self distanceBetweenUpperView:v29 andLowerView:v30];
            double v31 = v33;
          }
          v34 = objc_msgSend(v30, "topAnchor", v46);
          if (v29) {
            [v29 bottomAnchor];
          }
          else {
          uint64_t v35 = [(_MKStackView *)self topAnchor];
          }
          uint64_t v36 = [v34 constraintEqualToAnchor:v35 constant:v31];
          [v49 addObject:v36];

          id v26 = v30;
          ++v28;
          v29 = v26;
        }
        while (v25 != v28);
        uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v25);

      if (!v26)
      {
        unint64_t v3 = 0x1E4F28000;
        uint64_t v19 = v46;
LABEL_38:
        uint64_t v44 = (objc_class *)[v49 copy];
        v45 = *(Class *)((char *)&self->super.super.super.isa + v19);
        *(Class *)((char *)&self->super.super.super.isa + v19) = v44;

        [*(id *)(v3 + 3528) activateConstraints:*(Class *)((char *)&self->super.super.super.isa + v19)];
        return;
      }
      double v37 = 0.0;
      unint64_t v3 = 0x1E4F28000uLL;
      uint64_t v19 = v46;
      if (v22)
      {
        id v38 = objc_loadWeakRetained(location);
        [v38 stackView:self distanceBetweenUpperView:v26 andLowerView:0];
        double v37 = v39;
      }
      BOOL bottomConstraintShouldBeGreaterThanOrEqual = self->_bottomConstraintShouldBeGreaterThanOrEqual;
      uint64_t v41 = [(_MKStackView *)self bottomAnchor];
      double v42 = [v26 bottomAnchor];
      if (bottomConstraintShouldBeGreaterThanOrEqual) {
        [v41 constraintGreaterThanOrEqualToAnchor:v42 constant:v37];
      }
      else {
      v23 = [v41 constraintEqualToAnchor:v42 constant:v37];
      }

      LODWORD(v43) = 1132068864;
      [(NSArray *)v23 setPriority:v43];
      [v49 addObject:v23];
    }
    else
    {
      id v26 = 0;
    }

    goto LABEL_38;
  }
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 superview];

  if (v5 != self)
  {
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKStackView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    if (objc_msgSend(v4, "_hostsLayoutEngineAllowsTAMIC_NO")) {
      [v4 _setHostsLayoutEngine:1];
    }
    [v4 bounds];
    CGFloat Height = CGRectGetHeight(v15);
    double v13 = 1.0;
    if (Height > 1.0)
    {
      [v4 bounds];
      double v13 = CGRectGetHeight(v16);
    }
    objc_msgSend(v4, "setFrame:", v7, v9, v11, v13);
    [(NSHashTable *)self->_viewsNeedingWidthConstraints addObject:v4];
    v14.receiver = self;
    v14.super_class = (Class)_MKStackView;
    [(_MKStackView *)&v14 addSubview:v4];
    [(UIView *)self _mapkit_setNeedsUpdateConstraints];
  }
}

- (_MKStackViewDelegate)stackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackDelegate);

  return (_MKStackViewDelegate *)WeakRetained;
}

- (void)setStackDelegate:(id)a3
{
}

- (NSArray)stackedSubviews
{
  return self->_stackedSubviews;
}

- (_MKAnimationStackViewDelegate)stackAnimationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackAnimationDelegate);

  return (_MKAnimationStackViewDelegate *)WeakRetained;
}

- (void)setStackAnimationDelegate:(id)a3
{
}

- (BOOL)bottomConstraintShouldBeGreaterThanOrEqual
{
  return self->_bottomConstraintShouldBeGreaterThanOrEqual;
}

- (void)setBottomConstraintShouldBeGreaterThanOrEqual:(BOOL)a3
{
  self->_BOOL bottomConstraintShouldBeGreaterThanOrEqual = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackAnimationDelegate);
  objc_storeStrong((id *)&self->_stackedSubviews, 0);
  objc_destroyWeak((id *)&self->_stackDelegate);
  objc_storeStrong((id *)&self->_viewsNeedingWidthConstraints, 0);

  objc_storeStrong((id *)&self->_stackConstraints, 0);
}

@end