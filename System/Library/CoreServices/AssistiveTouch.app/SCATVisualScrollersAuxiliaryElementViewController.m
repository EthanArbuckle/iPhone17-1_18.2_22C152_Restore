@interface SCATVisualScrollersAuxiliaryElementViewController
- (BOOL)positionRelativeToContextElement;
- (NSMutableArray)scrollerConstraints;
- (SCATVisualScrollerContainerView)horizontalScroller;
- (SCATVisualScrollerContainerView)verticalScroller;
- (SCATVisualScrollersAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SCATVisualScrollersAuxiliaryElementViewControllerDelegate)scrollDelegate;
- (id)postTransitionUpdateBlock;
- (id)viewsRequiringStateUpdate;
- (void)_addConstraint:(id)a3 priority:(float)a4;
- (void)setHorizontalScroller:(id)a3;
- (void)setPositionRelativeToContextElement:(BOOL)a3;
- (void)setPostTransitionUpdateBlock:(id)a3;
- (void)setScrollDelegate:(id)a3;
- (void)setScrollerConstraints:(id)a3;
- (void)setTransitioningToOrFromActive:(BOOL)a3;
- (void)setVerticalScroller:(id)a3;
- (void)updateWithContextElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATVisualScrollersAuxiliaryElementViewController

- (SCATVisualScrollersAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCATVisualScrollersAuxiliaryElementViewController;
  v4 = [(SCATVisualScrollersAuxiliaryElementViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[SCATVisualScrollerContainerView alloc] initWithAxis:0];
    [(SCATVisualScrollersAuxiliaryElementViewController *)v4 setVerticalScroller:v5];
    v6 = [[SCATVisualScrollerContainerView alloc] initWithAxis:1];

    [(SCATVisualScrollersAuxiliaryElementViewController *)v4 setHorizontalScroller:v6];
  }
  return v4;
}

- (void)viewDidLoad
{
  v3 = [(SCATVisualScrollersAuxiliaryElementViewController *)self view];
  v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  v5 = [(SCATVisualScrollersAuxiliaryElementViewController *)self horizontalScroller];
  [v3 addSubview:v5];

  v6 = [(SCATVisualScrollersAuxiliaryElementViewController *)self verticalScroller];
  [v3 addSubview:v6];

  v7 = +[NSMutableArray array];
  [(SCATVisualScrollersAuxiliaryElementViewController *)self setScrollerConstraints:v7];

  [(SCATVisualScrollersAuxiliaryElementViewController *)self updateWithContextElement:0];
  v8.receiver = self;
  v8.super_class = (Class)SCATVisualScrollersAuxiliaryElementViewController;
  [(SCATAuxiliaryElementManagerViewController *)&v8 viewDidLoad];
}

- (void)_addConstraint:(id)a3 priority:(float)a4
{
  id v7 = a3;
  *(float *)&double v6 = a4;
  [v7 setPriority:v6];
  [*(id *)((char *)&self->_horizontalScroller + 1) addObject:v7];
}

- (void)updateWithContextElement:(id)a3
{
  id v4 = a3;
  v5 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
  +[NSLayoutConstraint deactivateConstraints:v5];

  double v6 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
  [v6 removeAllObjects];

  id v7 = [(SCATVisualScrollersAuxiliaryElementViewController *)self view];
  objc_super v8 = [(SCATVisualScrollersAuxiliaryElementViewController *)self verticalScroller];
  v9 = [(SCATVisualScrollersAuxiliaryElementViewController *)self horizontalScroller];
  unsigned int v10 = [(SCATVisualScrollersAuxiliaryElementViewController *)self positionRelativeToContextElement];
  if (v4 && v10)
  {
    objc_msgSend(v9, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double v12 = v11 * 2.0 + 10.0;
    [v4 frame];
    CGRect v127 = CGRectInset(v126, -20.0, -20.0);
    CGFloat x = v127.origin.x;
    CGFloat y = v127.origin.y;
    CGFloat width = v127.size.width;
    CGFloat height = v127.size.height;
    double MinX = CGRectGetMinX(v127);
    v128.origin.CGFloat x = x;
    v128.origin.CGFloat y = y;
    v128.size.CGFloat width = width;
    v128.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v128);
    v129.origin.CGFloat x = x;
    v129.origin.CGFloat y = y;
    v129.size.CGFloat width = width;
    v129.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v129);
    v130.origin.CGFloat x = x;
    v130.origin.CGFloat y = y;
    v130.size.CGFloat width = width;
    v130.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v130);
    v131.origin.CGFloat x = x;
    v131.origin.CGFloat y = y;
    v131.size.CGFloat width = width;
    v131.size.CGFloat height = height;
    double v19 = CGRectGetWidth(v131);
    v132.origin.CGFloat x = x;
    v132.origin.CGFloat y = y;
    v132.size.CGFloat width = width;
    v132.size.CGFloat height = height;
    double v20 = CGRectGetHeight(v132);
    v21 = [v9 topAnchor];
    v22 = [v7 topAnchor];
    v23 = [v21 constraintGreaterThanOrEqualToAnchor:v22 constant:50.0];

    LODWORD(v24) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v23 priority:v24];
    v25 = [v9 bottomAnchor];
    v26 = [v7 bottomAnchor];
    v27 = [v25 constraintLessThanOrEqualToAnchor:v26 constant:-50.0];

    LODWORD(v28) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v27 priority:v28];
    v29 = [v9 leftAnchor];
    v30 = [v7 leftAnchor];
    v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30 constant:50.0];

    LODWORD(v32) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v31 priority:v32];
    v33 = [v9 rightAnchor];
    v34 = [v7 rightAnchor];
    v35 = [v33 constraintLessThanOrEqualToAnchor:v34 constant:-50.0];

    LODWORD(v36) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v35 priority:v36];
    v37 = [v8 topAnchor];
    v38 = [v7 topAnchor];
    v39 = [v37 constraintGreaterThanOrEqualToAnchor:v38 constant:50.0];

    LODWORD(v40) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v39 priority:v40];
    v41 = [v8 bottomAnchor];
    v42 = [v7 bottomAnchor];
    v43 = [v41 constraintLessThanOrEqualToAnchor:v42 constant:-50.0];

    LODWORD(v44) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v43 priority:v44];
    v45 = [v8 leftAnchor];
    v46 = [v7 leftAnchor];
    v47 = [v45 constraintGreaterThanOrEqualToAnchor:v46 constant:50.0];

    LODWORD(v48) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v47 priority:v48];
    v49 = [v8 rightAnchor];
    v50 = [v7 rightAnchor];
    v51 = [v49 constraintLessThanOrEqualToAnchor:v50 constant:-50.0];

    LODWORD(v52) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v51 priority:v52];
    v53 = [v9 widthAnchor];
    v54 = [v53 constraintGreaterThanOrEqualToConstant:v12];

    LODWORD(v55) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v54 priority:v55];
    v56 = [v8 heightAnchor];
    v57 = [v56 constraintGreaterThanOrEqualToConstant:v12];

    LODWORD(v58) = 1148846080;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v57 priority:v58];
    v59 = [v9 leftAnchor];
    v60 = [v8 rightAnchor];
    v61 = [v59 constraintLessThanOrEqualToAnchor:v60 constant:-10.0];

    LODWORD(v62) = 1148829696;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v61 priority:v62];
    v63 = [v9 widthAnchor];
    v64 = [v63 constraintLessThanOrEqualToConstant:v19];

    LODWORD(v65) = 1148813312;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v64 priority:v65];
    v66 = [v8 heightAnchor];
    v67 = [v66 constraintLessThanOrEqualToConstant:v20];

    LODWORD(v68) = 1148813312;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v67 priority:v68];
    v69 = [v9 widthAnchor];
    v70 = [v69 constraintEqualToConstant:v19];

    LODWORD(v71) = 1148796928;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v70 priority:v71];
    v72 = [v8 heightAnchor];
    v73 = [v72 constraintEqualToConstant:v20];

    LODWORD(v74) = 1148796928;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v73 priority:v74];
    v75 = [v9 topAnchor];
    v76 = [v7 topAnchor];
    v77 = [v75 constraintEqualToAnchor:v76 constant:MaxY];

    LODWORD(v78) = 1148780544;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v77 priority:v78];
    v79 = [v9 leftAnchor];
    v80 = [v7 leftAnchor];
    v81 = [v79 constraintEqualToAnchor:v80 constant:MinX];

    LODWORD(v82) = 1148780544;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v81 priority:v82];
    v83 = [v8 topAnchor];
    v84 = [v7 topAnchor];
    v85 = [v83 constraintEqualToAnchor:v84 constant:MinY];

    LODWORD(v86) = 1148780544;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v85 priority:v86];
    v87 = [v8 leftAnchor];
    v88 = [v7 leftAnchor];
    v89 = [v87 constraintEqualToAnchor:v88 constant:MaxX];

    LODWORD(v90) = 1148780544;
    [(SCATVisualScrollersAuxiliaryElementViewController *)self _addConstraint:v89 priority:v90];
  }
  else
  {
    v91 = +[UIScreen mainScreen];
    [v91 overscanCompensationInsets];
    double v93 = v92;
    double v95 = v94;

    v96 = [v9 bottomAnchor];
    v97 = [v7 bottomAnchor];
    v98 = [v96 constraintEqualToAnchor:v97 constant:-v93];

    v99 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v99 addObject:v98];

    v100 = [v9 centerXAnchor];
    v101 = [v7 centerXAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];

    v103 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v103 addObject:v102];

    v104 = [v9 widthAnchor];
    v105 = [v104 constraintEqualToConstant:600.0];

    v106 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v106 addObject:v105];

    v107 = [v8 rightAnchor];
    v108 = [v7 rightAnchor];
    v109 = [v107 constraintEqualToAnchor:v108 constant:-v95];

    v110 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v110 addObject:v109];

    v111 = [v8 centerYAnchor];
    v112 = [v7 centerYAnchor];
    v113 = [v111 constraintEqualToAnchor:v112];

    v114 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v114 addObject:v113];

    v115 = [v8 heightAnchor];
    v89 = [v115 constraintEqualToConstant:600.0];

    v116 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
    [v116 addObject:v89];
  }
  v117 = [(SCATVisualScrollersAuxiliaryElementViewController *)self scrollerConstraints];
  +[NSLayoutConstraint activateConstraints:v117];

  objc_initWeak(&location, self);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_1000B206C;
  v122[3] = &unk_1001AAA40;
  objc_copyWeak(&v124, &location);
  id v118 = v4;
  id v123 = v118;
  v119 = objc_retainBlock(v122);
  if ([(SCATAuxiliaryElementManagerViewController *)self isTransitioningToOrFromActive]) {
    [(SCATVisualScrollersAuxiliaryElementViewController *)self setPostTransitionUpdateBlock:v119];
  }
  else {
    ((void (*)(void *))v119[2])(v119);
  }

  objc_destroyWeak(&v124);
  objc_destroyWeak(&location);
}

- (void)setTransitioningToOrFromActive:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCATVisualScrollersAuxiliaryElementViewController;
  -[SCATAuxiliaryElementManagerViewController setTransitioningToOrFromActive:](&v7, "setTransitioningToOrFromActive:");
  if (!a3)
  {
    v5 = [(SCATVisualScrollersAuxiliaryElementViewController *)self postTransitionUpdateBlock];

    if (v5)
    {
      double v6 = [(SCATVisualScrollersAuxiliaryElementViewController *)self postTransitionUpdateBlock];
      v6[2]();

      [(SCATVisualScrollersAuxiliaryElementViewController *)self setPostTransitionUpdateBlock:0];
    }
  }
}

- (id)viewsRequiringStateUpdate
{
  if ([(SCATVisualScrollersAuxiliaryElementViewController *)self isViewLoaded])
  {
    v14 = [(SCATVisualScrollersAuxiliaryElementViewController *)self verticalScroller];
    v15[0] = v14;
    v3 = [(SCATVisualScrollersAuxiliaryElementViewController *)self horizontalScroller];
    v15[1] = v3;
    id v4 = [(SCATVisualScrollersAuxiliaryElementViewController *)self verticalScroller];
    v5 = [v4 scrollUpView];
    v15[2] = v5;
    double v6 = [(SCATVisualScrollersAuxiliaryElementViewController *)self verticalScroller];
    objc_super v7 = [v6 scrollDownView];
    v15[3] = v7;
    objc_super v8 = [(SCATVisualScrollersAuxiliaryElementViewController *)self horizontalScroller];
    v9 = [v8 scrollLeftView];
    v15[4] = v9;
    unsigned int v10 = [(SCATVisualScrollersAuxiliaryElementViewController *)self horizontalScroller];
    double v11 = [v10 scrollRightView];
    v15[5] = v11;
    double v12 = +[NSArray arrayWithObjects:v15 count:6];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (SCATVisualScrollersAuxiliaryElementViewControllerDelegate)scrollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->_positionRelativeToContextElement + 1));

  return (SCATVisualScrollersAuxiliaryElementViewControllerDelegate *)WeakRetained;
}

- (void)setScrollDelegate:(id)a3
{
}

- (BOOL)positionRelativeToContextElement
{
  return *(&self->super._transitioningToOrFromActive + 1);
}

- (void)setPositionRelativeToContextElement:(BOOL)a3
{
  *(&self->super._transitioningToOrFromActive + 1) = a3;
}

- (SCATVisualScrollerContainerView)verticalScroller
{
  return *(SCATVisualScrollerContainerView **)((char *)&self->_scrollDelegate + 1);
}

- (void)setVerticalScroller:(id)a3
{
}

- (SCATVisualScrollerContainerView)horizontalScroller
{
  return *(SCATVisualScrollerContainerView **)((char *)&self->_verticalScroller + 1);
}

- (void)setHorizontalScroller:(id)a3
{
}

- (NSMutableArray)scrollerConstraints
{
  return *(NSMutableArray **)((char *)&self->_horizontalScroller + 1);
}

- (void)setScrollerConstraints:(id)a3
{
}

- (id)postTransitionUpdateBlock
{
  return *(NSMutableArray **)((char *)&self->_scrollerConstraints + 1);
}

- (void)setPostTransitionUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_scrollerConstraints + 1), 0);
  objc_storeStrong((id *)((char *)&self->_horizontalScroller + 1), 0);
  objc_storeStrong((id *)((char *)&self->_verticalScroller + 1), 0);
  objc_storeStrong((id *)((char *)&self->_scrollDelegate + 1), 0);

  objc_destroyWeak((id *)(&self->_positionRelativeToContextElement + 1));
}

@end