@interface DRFlockLayout
- (BOOL)_isNewItemModel:(id)a3;
- (BOOL)_itemModelHasUpdatedPreview:(id)a3 forItemView:(id)a4;
- (BOOL)_shouldScaleItemModel:(id)a3 withPotentialDrop:(id)a4;
- (CGPoint)_anchorPointForItem:(id)a3 sessionModel:(id)a4;
- (DRFlockLayout)init;
- (DRFlockLayout)layoutWithInput:(id)a3;
- (NSMapTable)imageComponentByItemView;
- (NSMapTable)transitioningViewsByItem;
- (NSMapTable)viewsByItem;
- (_DRBadgeContainer)badgeContainer;
- (_UIDragBadge)badge;
- (_UIPlatterView)badgeAnchorPlatter;
- (id)_badgeLayoutForPlatterView:(id)a3 totalItemDepth:(double)a4 orientation:(CGAffineTransform *)a5 count:(unint64_t)a6 potentialDrop:(id)a7 centroid:(CGPoint)a8;
- (id)_componentViewForItemModel:(id)a3;
- (id)_itemModelsForModel:(id)a3 withCapacity:(unint64_t)a4;
- (id)_previewTransitionForItemModel:(id)a3 rotation:(double)a4 center:(CGPoint)a5 anchorPoint:(CGPoint)a6 outItemView:(id *)a7 appliedTransform:(CGAffineTransform *)a8;
- (id)_viewForItemModel:(id)a3 rotation:(double)a4 defaultCenter:(CGPoint)a5 appliedTransform:(CGAffineTransform *)a6;
- (void)setBadge:(id)a3;
- (void)setBadgeAnchorPlatter:(id)a3;
- (void)setBadgeContainer:(id)a3;
- (void)setImageComponentByItemView:(id)a3;
- (void)setTransitioningViewsByItem:(id)a3;
- (void)setViewsByItem:(id)a3;
@end

@implementation DRFlockLayout

- (DRFlockLayout)init
{
  v16.receiver = self;
  v16.super_class = (Class)DRFlockLayout;
  v2 = [(DRFlockLayout *)&v16 init];
  if (v2)
  {
    v3 = +[NSMapTable strongToStrongObjectsMapTable];
    [(DRFlockLayout *)v2 setViewsByItem:v3];

    v4 = +[NSMapTable strongToStrongObjectsMapTable];
    [(DRFlockLayout *)v2 setTransitioningViewsByItem:v4];

    v5 = +[NSMapTable strongToStrongObjectsMapTable];
    [(DRFlockLayout *)v2 setImageComponentByItemView:v5];

    v6 = objc_opt_new();
    [(DRFlockLayout *)v2 setBadgeContainer:v6];

    v7 = [(DRFlockLayout *)v2 badgeContainer];
    v8 = [v7 layer];
    [v8 setAllowsHitTesting:0];

    v9 = [(DRFlockLayout *)v2 badgeContainer];
    [v9 setUserInteractionEnabled:0];

    v10 = [(DRFlockLayout *)v2 badgeContainer];
    [v10 setAlpha:0.0];

    v11 = objc_opt_new();
    v12 = [(DRFlockLayout *)v2 badge];
    [v12 frame];

    [v11 intrinsicContentSize];
    [(DRFlockLayout *)v2 setBadge:v11];
    v13 = [(DRFlockLayout *)v2 badgeContainer];
    v14 = [(DRFlockLayout *)v2 badge];
    [v13 addSubview:v14];
  }
  return v2;
}

- (BOOL)_itemModelHasUpdatedPreview:(id)a3 forItemView:(id)a4
{
  id v6 = a3;
  v7 = [(NSMapTable *)self->_imageComponentByItemView objectForKey:a4];
  if (v7)
  {
    v8 = [v6 imageComponent];
    unsigned int v9 = [v7 isEqual:v8] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (CGPoint)_anchorPointForItem:(id)a3 sessionModel:(id)a4
{
  id v4 = a3;
  v5 = [v4 preview];
  if (([v4 constrainSize] & 1) != 0
    || [v4 precisionMode]
    || (([v5 liftAnchorPoint], v7 == CGPointZero.x) ? (BOOL v8 = v6 == CGPointZero.y) : (BOOL v8 = 0), v8))
  {
    [v5 unscaledAnchorPoint];
  }
  else
  {
    [v5 liftAnchorPoint];
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)_previewTransitionForItemModel:(id)a3 rotation:(double)a4 center:(CGPoint)a5 anchorPoint:(CGPoint)a6 outItemView:(id *)a7 appliedTransform:(CGAffineTransform *)a8
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  double v12 = a5.y;
  double v13 = a5.x;
  id v16 = a3;
  v17 = [(NSMapTable *)self->_viewsByItem objectForKey:v16];
  v18 = [(NSMapTable *)self->_transitioningViewsByItem objectForKey:v16];
  if (!v18)
  {
    v18 = objc_opt_new();
    [(NSMapTable *)self->_transitioningViewsByItem setObject:v18 forKey:v16];
  }
  [v18 addObject:v17];
  [(NSMapTable *)self->_viewsByItem removeObjectForKey:v16];
  [(NSMapTable *)self->_imageComponentByItemView removeObjectForKey:v17];
  long long v19 = *(_OWORD *)&a8->c;
  v54[0] = *(_OWORD *)&a8->a;
  v54[1] = v19;
  v54[2] = *(_OWORD *)&a8->tx;
  -[DRFlockLayout _viewForItemModel:rotation:defaultCenter:appliedTransform:](self, "_viewForItemModel:rotation:defaultCenter:appliedTransform:", v16, v54, a4, v13, v12);
  id v20 = objc_claimAutoreleasedReturnValue();
  *a7 = v20;
  [v20 setAlpha:0.0];
  unsigned __int8 v21 = 1;
  [v20 setLifted:1];
  objc_msgSend(v20, "setConstrainSize:", objc_msgSend(v17, "constrainSize"));
  v22 = [v17 preview];
  [v22 scaledSize];
  objc_msgSend(v20, "setOverrideSize:");

  v23 = [v17 _velocityForKey:@"position"];
  [v20 _setVelocity:v23 forKey:@"position"];

  v24 = [v17 _targetVelocityForKey:@"position"];
  [v20 _setTargetVelocity:v24 forKey:@"position"];

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100017028;
  v51[3] = &unk_100054C58;
  id v25 = v17;
  id v52 = v25;
  id v26 = v20;
  id v53 = v26;
  +[UIView _performWithoutRetargetingAnimations:v51];
  v27 = [v25 preview];
  if (([v27 avoidAnimation] & 1) == 0)
  {
    v28 = [v16 preview];
    unsigned __int8 v21 = [v28 avoidAnimation];
  }
  v29 = [v16 preview];
  [v29 scaledSize];
  uint64_t v31 = v30;
  uint64_t v33 = v32;

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000170F4;
  v43[3] = &unk_100055498;
  id v44 = v26;
  id v34 = v25;
  id v45 = v34;
  uint64_t v46 = v31;
  uint64_t v47 = v33;
  unsigned __int8 v50 = v21;
  CGFloat v48 = x;
  CGFloat v49 = y;
  id v35 = v26;
  v36 = +[DRFlockAnimatable animationBlock:v43];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10001729C;
  v40[3] = &unk_1000554C0;
  v40[4] = self;
  id v41 = v16;
  id v42 = v34;
  id v37 = v34;
  id v38 = v16;
  [v36 setCompletionBlock:v40];

  return v36;
}

- (DRFlockLayout)layoutWithInput:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(DRFlockLayoutOutput);
  v101 = +[NSMutableArray array];
  v98 = +[NSMutableArray array];
  v100 = +[NSMutableArray array];
  v99 = +[NSMutableArray array];
  double v6 = [v4 model];
  double v7 = -[DRFlockLayout _itemModelsForModel:withCapacity:](self, "_itemModelsForModel:withCapacity:", v6, [v4 maxItemCount]);

  [(DRFlockLayoutOutput *)v5 setShownItemModels:v7];
  v97 = v7;
  BOOL v8 = (char *)[v7 count];
  double v9 = [v4 model];
  double v10 = [v9 itemModels];
  id v11 = [v10 count];

  double v12 = [v4 model];
  [v12 centroid];
  double v14 = v13;
  v15 = [v4 model];
  [v15 centroid];
  double v17 = v16;

  if (v14 == CGPointZero.x && v17 == CGPointZero.y)
  {
    v18 = [v97 firstObject];
    long long v19 = [v18 preview];

    if (v19)
    {
      [v19 originalCenter];
      double v14 = v20;
      double v17 = v21;
    }
  }
  v22 = [v4 model];
  v103 = [v22 potentialDrop];

  v23 = [v4 model];
  id v24 = [v23 orientation];

  if (v24 == (id)1)
  {
    double v25 = 0.0;
  }
  else if (v24 == (id)3)
  {
    double v25 = 1.57079633;
  }
  else if (v24 == (id)4)
  {
    double v25 = -1.57079633;
  }
  else if (v24 == (id)2)
  {
    double v25 = 3.14159265;
  }
  else
  {
    double v25 = 0.0;
  }
  [(DRFlockLayoutOutput *)v5 setOrientationRotation:v25];
  id v26 = [v4 model];
  v27 = [v26 delegate];
  v28 = [v4 model];
  v102 = [v27 referenceScreenForViewModel:v28];

  if (v8)
  {
    id v89 = v11;
    v90 = v5;
    v104 = v4;
    v96 = 0;
    v29 = 0;
    v94 = v8 - 1;
    v95 = v8;
    double v92 = v17;
    double v93 = v14;
    double v91 = v25;
    while (1)
    {
      uint64_t v30 = objc_msgSend(v97, "objectAtIndexedSubscript:", v29, v89);
      uint64_t v31 = [v30 preview];
      uint64_t v32 = objc_opt_new();
      id v33 = objc_alloc_init((Class)_DUIPreviewAndImageComponentUpdate);
      id v34 = [v30 preview];
      [v33 setPreview:v34];

      id v35 = [v30 imageComponent];
      [v33 setImageComponent:v35];

      objc_msgSend(v33, "setIndex:", objc_msgSend(v30, "itemIndex"));
      v36 = [v30 currentClient];
      objc_msgSend(v33, "setIsFromSource:", objc_msgSend(v36, "isSource"));

      [v99 addObject:v33];
      BOOL v37 = (unint64_t)v8 > 1
         || [(DRFlockLayout *)self _shouldScaleItemModel:v30 withPotentialDrop:v103];
      id v38 = v104;
      [v30 setConstrainSize:v37];
      [v32 setConstrainSize:v37];
      if (([v30 precisionMode] & 1) == 0)
      {
        v39 = [v104 model];
        v40 = [v39 precisionMode];
        id v41 = [v40 direction];

        id v38 = v104;
        if (v41) {
          [v30 setPrecisionMode:1];
        }
      }
      id v42 = [v38 model];
      [(DRFlockLayout *)self _anchorPointForItem:v30 sessionModel:v42];
      double v44 = v43;
      double v46 = v45;

      if (v37 && [v31 previewMode] == (id)4 && objc_msgSend(v30, "itemIndex"))
      {
        uint64_t v47 = [v38 model];
        CGFloat v48 = [v47 itemModels];
        CGFloat v49 = [v48 firstObject];
        [v49 anchorPoint];
        double v44 = v50;
        double v46 = v51;
      }
      id v52 = [v30 currentClientItemViewModel];
      objc_msgSend(v52, "setAnchorPoint:", v44, v46);

      [v30 stackOffset];
      double v54 = v14 + v53;
      double v56 = v17 + v55;
      objc_msgSend(v30, "setCenter:", v14 + v53, v17 + v55);
      objc_msgSend(v32, "setCenter:", v54, v56);
      [v102 scale];
      objc_msgSend(v30, "setDisplayScale:");
      unsigned int v57 = [(DRFlockLayout *)self _isNewItemModel:v30];
      v58 = v38;
      unsigned int v59 = v57;
      v60 = [v58 model];
      v61 = v60;
      if (v60) {
        [v60 appliedTransform];
      }
      else {
        memset(v119, 0, 48);
      }
      v62 = -[DRFlockLayout _viewForItemModel:rotation:defaultCenter:appliedTransform:](self, "_viewForItemModel:rotation:defaultCenter:appliedTransform:", v30, v119, v25, v14, v17);

      if (([v103 prefersFullSizePreview] & 1) == 0
        && (objc_opt_respondsToSelector() & 1) != 0
        && [v31 shouldUseGlassBackgroundEffect])
      {
        +[_DUIPreview defaultStackAlpha];
        objc_msgSend(v62, "setAlpha:");
        if (v59)
        {
LABEL_34:
          [v32 setNewItem:1];
          v63 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v44, v46);
          [v62 setAnchorPointValueToAdjustToOnMoveToWindow:v63];

          if ([v31 previewMode] == (id)4)
          {
            [v102 _referenceBounds];
            [v31 liftAnchorPoint];
            [v31 contentSize];
            [v31 originalCenter];
            _UIConvertPointFromOrientationToOrientation();
            double v17 = v92;
            double v14 = v93;
            _UIConvertPointFromOrientationToOrientation();
            double v25 = v91;
            UIDistanceBetweenPoints();
            [v32 setNeedsImmediateTracking:v64 <= 40.0];
          }
          goto LABEL_43;
        }
      }
      else if (v59)
      {
        goto LABEL_34;
      }
      if ([(DRFlockLayout *)self _itemModelHasUpdatedPreview:v30 forItemView:v62])
      {
        id v118 = v62;
        v65 = [v104 model];
        v66 = v65;
        if (v65) {
          [v65 appliedTransform];
        }
        else {
          memset(v117, 0, sizeof(v117));
        }
        v67 = -[DRFlockLayout _previewTransitionForItemModel:rotation:center:anchorPoint:outItemView:appliedTransform:](self, "_previewTransitionForItemModel:rotation:center:anchorPoint:outItemView:appliedTransform:", v30, &v118, v117, v25, v54, v56, v44, v46);
        id v68 = v118;

        [v32 setPreview:v67];
        [v32 setStartingPreviewTransition:1];
        v62 = v68;
      }
      else
      {
        [v30 setApplyOriginalRotation:0];
      }
LABEL_43:
      if ([v31 avoidAnimation] && objc_msgSend(v30, "constrainSize")) {
        objc_msgSend(v62, "setConstrainSize:", objc_msgSend(v30, "constrainSize"));
      }
      v113[0] = _NSConcreteStackBlock;
      v113[1] = 3221225472;
      v113[2] = sub_100017EFC;
      v113[3] = &unk_1000554E8;
      id v69 = v62;
      id v114 = v69;
      id v70 = v30;
      id v115 = v70;
      double v116 = v25;
      v71 = +[DRFlockAnimatable animationBlock:v113];
      [v32 setSize:v71];

      v72 = [(NSMapTable *)self->_transitioningViewsByItem objectForKey:v70];
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472;
      v107[2] = sub_100017FA4;
      v107[3] = &unk_100055510;
      id v73 = v72;
      id v108 = v73;
      double v111 = v54;
      double v112 = v56;
      id v74 = v69;
      id v109 = v74;
      id v110 = v104;
      v75 = +[DRFlockAnimatable animationBlock:v107];
      [v32 setPosition:v75];

      if ([v73 count])
      {
        [v32 setInPreviewTransition:1];
        [v98 addObjectsFromArray:v73];
      }
      [v100 addObject:v32];
      [v101 addObject:v74];
      [v98 addObject:v74];
      if (v94 == v29)
      {
        id v76 = v74;

        v96 = v76;
      }

      ++v29;
      BOOL v8 = v95;
      if (v95 == v29)
      {
        v77 = v98;
        v78 = v96;
        if (v96)
        {
          memset(&v106, 0, sizeof(v106));
          CGAffineTransformMakeRotation(&v106, v25);
          CGAffineTransform v105 = v106;
          v79 = -[DRFlockLayout _badgeLayoutForPlatterView:totalItemDepth:orientation:count:potentialDrop:centroid:](self, "_badgeLayoutForPlatterView:totalItemDepth:orientation:count:potentialDrop:centroid:", v96, &v105, v89, v103, 0.0, v14, v17);
          v5 = v90;
          [(DRFlockLayoutOutput *)v90 setBadgeLayout:v79];

          v80 = [(DRFlockLayout *)self badgeContainer];
          [(DRFlockLayoutOutput *)v90 setBadgeView:v80];

          id v4 = v104;
        }
        else
        {
          id v4 = v104;
          v5 = v90;
        }
        goto LABEL_55;
      }
    }
  }
  v78 = 0;
  v77 = v98;
LABEL_55:
  [(DRFlockLayoutOutput *)v5 setAllViews:v77];
  [(DRFlockLayoutOutput *)v5 setItemViews:v101];
  [(DRFlockLayoutOutput *)v5 setItemLayouts:v100];
  v81 = [v4 model];
  -[DRFlockLayoutOutput setTouchesCount:](v5, "setTouchesCount:", [v81 touchesCount]);

  v82 = [v4 model];
  if ([v82 isManipulatingTransform])
  {
    [(DRFlockLayoutOutput *)v5 setReduceBadgeAnimationSpring:1];
  }
  else
  {
    v83 = [v4 model];
    -[DRFlockLayoutOutput setReduceBadgeAnimationSpring:](v5, "setReduceBadgeAnimationSpring:", [v83 wantsElasticEffects]);
  }
  [(DRFlockLayoutOutput *)v5 setAnimatesFlockItemSizeAlongsidePreviewTransition:0];
  [(DRFlockLayoutOutput *)v5 setPreviewAndImageComponents:v99];
  v84 = [v4 model];
  if ([v84 continuityDisplayWantsDragsHidden])
  {
    v85 = [v4 model];
    if ([v85 sourceRestrictsDragToSelf])
    {
      [(DRFlockLayoutOutput *)v5 setShouldHideFlock:0];
    }
    else
    {
      v86 = [v4 model];
      -[DRFlockLayoutOutput setShouldHideFlock:](v5, "setShouldHideFlock:", [v86 sourceRestrictsDragToLocalDevice] ^ 1);
    }
  }
  else
  {
    [(DRFlockLayoutOutput *)v5 setShouldHideFlock:0];
  }

  v87 = v5;
  return v87;
}

- (id)_itemModelsForModel:(id)a3 withCapacity:(unint64_t)a4
{
  id v5 = a3;
  double v6 = +[NSMutableArray arrayWithCapacity:a4];
  double v20 = v5;
  double v7 = [v5 modelsSortedByStackOrder];
  BOOL v8 = [v7 reverseObjectEnumerator];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      double v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
      uint64_t v15 = [v14 imageComponent];
      if (v15)
      {
        double v16 = (void *)v15;
        double v17 = [v14 imageComponent];
        unsigned __int8 v18 = [v17 hidesImage];

        if ((v18 & 1) == 0)
        {
          [v6 insertObject:v14 atIndex:0];
          if ((unint64_t)[v6 count] >= a4) {
            break;
          }
        }
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

- (BOOL)_isNewItemModel:(id)a3
{
  id v4 = a3;
  id v5 = [(DRFlockLayout *)self viewsByItem];
  double v6 = [v5 objectForKey:v4];

  return v6 == 0;
}

- (id)_viewForItemModel:(id)a3 rotation:(double)a4 defaultCenter:(CGPoint)a5 appliedTransform:(CGAffineTransform *)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [v11 preview];
  if (!v20)
  {
    double v20 = +[_DUIPreview defaultPreviewWithFrame:](_DUIPreview, "defaultPreviewWithFrame:", v13, v15, v17, v19);
    objc_msgSend(v20, "setOriginalCenter:", x, y);
    long long v21 = [v11 currentClientItemViewModel];
    [v21 setPreview:v20];
  }
  id v22 = [(NSMapTable *)self->_viewsByItem objectForKey:v11];
  if (!v22)
  {
    id v22 = [objc_alloc((Class)_UIPlatterView) initWithDUIPreview:v20];
    [v22 setOrientationRotation:a4];
    [v20 originalCenter];
    if (v24 != CGPointZero.x || v23 != CGPointZero.y)
    {
      [v20 originalCenter];
      double x = v26;
      double y = v27;
    }
    objc_msgSend(v22, "setCenter:", x, y);
    [v22 setLifted:1];
    objc_msgSend(v22, "setAppliesOriginalRotation:", objc_msgSend(v11, "applyOriginalRotation"));
    long long v28 = *(_OWORD *)&a6->c;
    v38[0] = *(_OWORD *)&a6->a;
    v38[1] = v28;
    v38[2] = *(_OWORD *)&a6->tx;
    [v22 setAppliedTransform:v38];
    v29 = [v22 layer];
    [v29 setAllowsHitTesting:0];

    [(NSMapTable *)self->_viewsByItem setObject:v22 forKey:v11];
    uint64_t v30 = [(DRFlockLayout *)self _componentViewForItemModel:v11];
    [v22 setComponentView:v30];
    uint64_t v31 = [v11 preview];
    uint64_t v32 = (char *)[v31 previewMode];

    if ((unint64_t)(v32 - 3) >= 2)
    {
      id v33 = [v30 superview];
      id v34 = [v33 layer];

      [v34 setShouldRasterize:1];
      [v11 displayScale];
      objc_msgSend(v34, "setRasterizationScale:");
    }
    imageComponentByItemView = self->_imageComponentByItemView;
    v36 = [v11 imageComponent];
    [(NSMapTable *)imageComponentByItemView setObject:v36 forKey:v22];
  }
  return v22;
}

- (id)_componentViewForItemModel:(id)a3
{
  id v4 = [a3 imageComponent];
  id v5 = v4;
  id v6 = 0;
  if (a3 && v4)
  {
    if ([v4 representsPortal])
    {
      id v6 = [v5 portalView];
    }
    else
    {
      id v7 = objc_alloc((Class)UIView);
      [v5 frame];
      id v6 = objc_msgSend(v7, "initWithFrame:");
      BOOL v8 = +[CAContext objectForSlot:](CAContext, "objectForSlot:", [v5 slotID]);
      id v9 = [v6 layer];
      [v9 setContents:v8];
    }
    [v5 frame];
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAccessibilityIgnoresInvertColors:", objc_msgSend(v5, "ignoresAccessibilityFilters"));
  }

  return v6;
}

- (BOOL)_shouldScaleItemModel:(id)a3 withPotentialDrop:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 constrainSize] & 1) != 0
    || ([v5 preview],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isOversized],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else if ([v6 prefersFullSizePreview])
  {
    BOOL v9 = 0;
  }
  else
  {
    id v11 = [v5 preview];
    [v11 scaleFactor];
    BOOL v9 = v12 < 1.0;
  }
  return v9;
}

- (id)_badgeLayoutForPlatterView:(id)a3 totalItemDepth:(double)a4 orientation:(CGAffineTransform *)a5 count:(unint64_t)a6 potentialDrop:(id)a7 centroid:(CGPoint)a8
{
  id v12 = a3;
  id v13 = a7;
  double v14 = objc_opt_new();
  double v15 = [(DRFlockLayout *)self badgeContainer];
  double v16 = [(DRFlockLayout *)self badge];
  p_badgeAnchorPlatter = &self->_badgeAnchorPlatter;
  id WeakRetained = objc_loadWeakRetained((id *)p_badgeAnchorPlatter);
  if (WeakRetained)
  {
    id v19 = objc_loadWeakRetained((id *)p_badgeAnchorPlatter);
    BOOL v20 = v19 != v12;
  }
  else
  {
    BOOL v20 = 0;
  }

  objc_storeWeak((id *)p_badgeAnchorPlatter, v12);
  [v16 setItemCount:a6];
  [v16 intrinsicContentSize];
  double v22 = v21;
  double v24 = v23;
  id v25 = v13;
  double v53 = a5;
  BOOL v26 = [v25 preferredBadgeStyle] != (id)1
     && (a6 > 1
      || [v25 operation] == (id)1
      || ![v25 operation] && objc_msgSend(v25, "forbidden"));

  [v14 setVisible:v26];
  if (v20)
  {
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_100018E78;
    v84[3] = &unk_100055538;
    id v85 = v15;
    id v86 = v12;
    id v87 = v16;
    double v27 = +[DRFlockAnimatable animationBlock:v84];
    [v14 setOffsetAdjustment:v27];
  }
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100018EE4;
  v81[3] = &unk_100054C58;
  id v28 = v15;
  id v82 = v28;
  id v29 = v12;
  id v83 = v29;
  uint64_t v30 = +[DRFlockAnimatable animationBlock:v81];
  [v14 setPosition:v30];

  uint64_t v31 = [v28 superview];
  [v14 setJustBecameVisible:v31 == 0];

  uint64_t v32 = [v29 preview];
  [v32 initialBadgeLocation];
  double v34 = v33;
  uint64_t v36 = v35;

  unsigned __int8 v37 = [v14 justBecameVisible];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100018F20;
  v77[3] = &unk_100055560;
  if (v34 < 1.79769313e308) {
    unsigned __int8 v38 = v37;
  }
  else {
    unsigned __int8 v38 = 0;
  }
  BOOL v79 = v26;
  unsigned __int8 v80 = v38;
  id v39 = v28;
  id v78 = v39;
  v40 = +[DRFlockAnimatable animationBlock:v77];
  [v14 setAlpha:v40];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100018F44;
  v71[3] = &unk_100055588;
  unsigned __int8 v76 = v38;
  double v74 = v34;
  uint64_t v75 = v36;
  id v41 = v29;
  id v72 = v41;
  id v42 = v16;
  id v73 = v42;
  double v43 = +[DRFlockAnimatable animationBlock:v71];
  [v14 setOffset:v43];

  if (v26)
  {
    id v44 = v25;
    unint64_t v45 = (unint64_t)[v44 preferredBadgeStyle] - 2;
    if (v45 < 3)
    {
LABEL_30:

      [v42 setStyle:v45];
      objc_msgSend(v14, "setStyle:", objc_msgSend(v42, "style"));
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100018FF0;
      v62[3] = &unk_1000555B0;
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      id v63 = v42;
      double v66 = v22;
      double v67 = v24;
      long long v50 = *(_OWORD *)&v53->c;
      long long v68 = *(_OWORD *)&v53->a;
      long long v69 = v50;
      long long v70 = *(_OWORD *)&v53->tx;
      double v51 = +[DRFlockAnimatable animationBlock:v62];
      [v14 setSize:v51];

      CGFloat v49 = v63;
      goto LABEL_31;
    }
    id v46 = v44;
    if ([v46 operation] != (id)16)
    {
      if ([v46 operation] == (id)1)
      {
        unint64_t v45 = 1;
LABEL_29:

        goto LABEL_30;
      }
      if (![v46 operation])
      {
        if ([v46 forbidden]) {
          unint64_t v45 = 2;
        }
        else {
          unint64_t v45 = 0;
        }
        goto LABEL_29;
      }
    }
    unint64_t v45 = 0;
    goto LABEL_29;
  }
  [v14 setStyle:0];
  objc_msgSend(v42, "setBounds:", 0.0, 0.0, v22, v24);
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeScale(&v61, 0.2, 0.2);
  CGAffineTransform t1 = v61;
  memset(&v60, 0, sizeof(v60));
  long long v47 = *(_OWORD *)&v53->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&v53->a;
  *(_OWORD *)&t2.c = v47;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&v53->tx;
  CGAffineTransformConcat(&v60, &t1, &t2);
  if (v42) {
    [v42 transform];
  }
  else {
    memset(&v57, 0, sizeof(v57));
  }
  CGAffineTransform t1 = v60;
  if (CGAffineTransformEqualToTransform(&t1, &v57)) {
    goto LABEL_32;
  }
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100019080;
  _OWORD v54[3] = &unk_1000555D8;
  id v55 = v42;
  CGAffineTransform v56 = v60;
  CGFloat v48 = +[DRFlockAnimatable animationBlock:v54];
  [v14 setSize:v48];

  CGFloat v49 = v55;
LABEL_31:

LABEL_32:
  return v14;
}

- (NSMapTable)viewsByItem
{
  return self->_viewsByItem;
}

- (void)setViewsByItem:(id)a3
{
}

- (NSMapTable)transitioningViewsByItem
{
  return self->_transitioningViewsByItem;
}

- (void)setTransitioningViewsByItem:(id)a3
{
}

- (NSMapTable)imageComponentByItemView
{
  return self->_imageComponentByItemView;
}

- (void)setImageComponentByItemView:(id)a3
{
}

- (_DRBadgeContainer)badgeContainer
{
  return self->_badgeContainer;
}

- (void)setBadgeContainer:(id)a3
{
}

- (_UIDragBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (_UIPlatterView)badgeAnchorPlatter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeAnchorPlatter);
  return (_UIPlatterView *)WeakRetained;
}

- (void)setBadgeAnchorPlatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_badgeAnchorPlatter);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_badgeContainer, 0);
  objc_storeStrong((id *)&self->_imageComponentByItemView, 0);
  objc_storeStrong((id *)&self->_transitioningViewsByItem, 0);
  objc_storeStrong((id *)&self->_viewsByItem, 0);
}

@end