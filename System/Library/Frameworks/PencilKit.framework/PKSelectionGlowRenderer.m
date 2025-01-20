@interface PKSelectionGlowRenderer
+ (id)sharedStrokePathCache;
+ (void)invalidateSharedStrokePathCache;
- (CGPoint)editMenuLocation;
- (PKSelectionGlowRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4;
- (PKSelectionModificationKnob)_newKnobWithLocation:(uint64_t)a1;
- (double)_widthForStroke:(uint64_t)a1;
- (id)_accessibilityUserTestingChildren;
- (id)_affordanceForLocationInSelectionView:(double)a3 inputType:(double)a4;
- (id)adornmentLayer;
- (id)initForLiveSelectionWithRenderingDelegate:(id)a3;
- (id)lassoPath;
- (id)setKnobsVisible:(id *)result;
- (uint64_t)_didEndDragKnobLocation:(uint64_t)a3 knobDragMode:(unint64_t)a4;
- (uint64_t)_highlightColor;
- (uint64_t)_resetKnobAppearance;
- (void)_createPathAroundStrokes:(uint64_t)a1 inDrawing:(void *)a2 isLive:(void *)a3 liveScrollOffset:(int)a4;
- (void)_didBeginDraggingSelection;
- (void)_didEndDraggingSelection;
- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6;
- (void)_setupHighlightIfNecessary;
- (void)_updateKnobAppearanceForDragAtKnobLocation:(double)a3 point:(double)a4 otherKnobPoint:(double)a5 selectionType:(double)a6 touchType:;
- (void)_updateKnobAppearanceForDragAtKnobLocation:(unint64_t)a3 point:(uint64_t)a4 knobDragMode:(uint64_t)a5 selectionType:(double)a6 touchType:(double)a7;
- (void)_willBeginDragKnobLocation:(unint64_t)a3 atPoint:(double)a4 knobDragMode:(double)a5;
@end

@implementation PKSelectionGlowRenderer

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSelectionGlowRenderer;
  v5 = [(PKSelectionGlowRenderer *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tiles = v6->_tiles;
    v6->_tiles = v7;

    -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)v6);
  }

  return v6;
}

- (void)_setupHighlightIfNecessary
{
  if (a1 && !*(void *)(a1 + 8))
  {
    uint64_t v2 = [MEMORY[0x1E4F39BE8] layer];
    v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v2;

    uint64_t v4 = [MEMORY[0x1E4F39BE8] layer];
    v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v4;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v7 = [*(id *)(a1 + 80) drawing];
    [WeakRetained scaleForDrawing:v7];
    double v9 = v8;

    [*(id *)(a1 + 8) setContentsScale:v9];
    [*(id *)(a1 + 8) addSublayer:*(void *)(a1 + 16)];
    if (!*(void *)(a1 + 24))
    {
      objc_super v10 = -[PKSelectionGlowRenderer _newKnobWithLocation:](a1, 0);
      v11 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v10;

      [*(id *)(a1 + 8) addSublayer:*(void *)(a1 + 24)];
    }
    if (!*(void *)(a1 + 32))
    {
      v12 = -[PKSelectionGlowRenderer _newKnobWithLocation:](a1, 1);
      v13 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v12;

      [*(id *)(a1 + 8) addSublayer:*(void *)(a1 + 32)];
    }
    v14 = [*(id *)(a1 + 80) strokes];
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)a1, [v14 count] != 0);

    v15 = *(void **)(a1 + 80);
    if (v15)
    {
      [v15 bounds];
      v18 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 0.0, 0.0, v9 * v16, v9 * v17);
      v19 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v18;
      id v20 = v18;

      id v22 = [*(id *)(a1 + 80) strokes];
      v21 = [*(id *)(a1 + 80) drawing];

      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:](a1, v22, v21, 0);
    }
  }
}

- (PKSelectionModificationKnob)_newKnobWithLocation:(uint64_t)a1
{
  uint64_t v4 = [PKSelectionModificationKnob alloc];
  v5 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](a1);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  char v7 = [WeakRetained isRTL];
  if (v4)
  {
    BOOL v8 = v7;
    v19.receiver = v4;
    v19.super_class = (Class)PKSelectionModificationKnob;
    double v9 = (PKSelectionModificationKnob *)objc_msgSendSuper2(&v19, sel_init);
    uint64_t v4 = v9;
    if (v9)
    {
      LODWORD(v10) = 1.0;
      [(PKSelectionModificationKnob *)v9 setOpacity:v10];
      uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
      knobLayer = v4->_knobLayer;
      v4->_knobLayer = (CALayer *)v11;

      uint64_t v13 = [MEMORY[0x1E4F39BE8] layer];
      knobTailLayer = v4->_knobTailLayer;
      v4->_knobTailLayer = (CALayer *)v13;

      v4->_knobColor = CGColorRetain(v5);
      -[PKSelectionModificationKnob _updateKnobAppearance]((id *)&v4->super.super.isa);
      v4->_isRTL = v8;
      v4->_knobLocation = a2;
      [(PKSelectionModificationKnob *)v4 addSublayer:v4->_knobLayer];
      [(PKSelectionModificationKnob *)v4 addSublayer:v4->_knobTailLayer];
      [(PKSelectionModificationKnob *)v4 setIsAccessibilityElement:1];
    }
  }

  v15 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v15 userInterfaceIdiom] == 1) {
    double v16 = 14.0;
  }
  else {
    double v16 = 13.0;
  }

  -[PKSelectionModificationKnob setFrame:](v4, "setFrame:", 0.0, 0.0, v16, v16 + v16);
  double v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  -[PKSelectionModificationKnob setContentsScale:](v4, "setContentsScale:");

  return v4;
}

- (id)setKnobsVisible:(id *)result
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t v3 = a2 ^ 1u;
    [result[3] setHidden:v3];
    [*(id *)(v2 + 32) setHidden:v3];
    uint64_t v4 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](v2);
    -[PKSelectionModificationKnob setKnobColor:](*(id **)(v2 + 24), v4);
    v5 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](v2);
    v6 = *(id **)(v2 + 32);
    return -[PKSelectionModificationKnob setKnobColor:](v6, v5);
  }
  return result;
}

- (uint64_t)_highlightColor
{
  if (!a1) {
    return 0;
  }
  v1 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v3 = [WeakRetained selectionColor];

  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"internalSettings.drawing.enableLassolessSelectionDebugColors"];

  if (!v5) {
    return v3;
  }
  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = [v6 currentIntersectionAlgorithm];

  switch(v7)
  {
    case 0:
      BOOL v8 = [MEMORY[0x1E4FB1618] systemRedColor];
      break;
    case 1:
      BOOL v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
      break;
    case 2:
      BOOL v8 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      break;
    case 3:
      BOOL v8 = [MEMORY[0x1E4FB1618] systemYellowColor];
      break;
    default:
      return v3;
  }
  id v9 = v8;
  uint64_t v10 = [v9 CGColor];

  return v10;
}

- (id)adornmentLayer
{
  return self->_highlightLayer;
}

- (PKSelectionGlowRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKSelectionGlowRenderer;
  id v9 = [(PKSelectionGlowRenderer *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tiles = v10->_tiles;
    v10->_tiles = v11;
  }
  return v10;
}

+ (id)sharedStrokePathCache
{
  self;
  if (_MergedGlobals_114 != -1) {
    dispatch_once(&_MergedGlobals_114, &__block_literal_global_3);
  }
  v0 = (void *)qword_1EB3C5DF0;

  return v0;
}

void __48__PKSelectionGlowRenderer_sharedStrokePathCache__block_invoke()
{
  v0 = objc_alloc_init(PKLRUCache);
  v1 = (void *)qword_1EB3C5DF0;
  qword_1EB3C5DF0 = (uint64_t)v0;

  if (qword_1EB3C5DF0) {
    *(void *)(qword_1EB3C5DF0 + 64) = 0x4000000;
  }
}

+ (void)invalidateSharedStrokePathCache
{
  self;
  +[PKSelectionGlowRenderer sharedStrokePathCache]();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  -[PKLRUCache removeAllObjects]((uint64_t)v0);
}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (id)_affordanceForLocationInSelectionView:(double)a3 inputType:(double)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v28[0] = *(void *)(a1 + 24);
    v28[1] = v7;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = (id)[v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      if (a2) {
        double v11 = 20.0;
      }
      else {
        double v11 = 40.0;
      }
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (v13)
          {
            v30.origin.CGFloat x = -[PKSelectionModificationKnob _rectForKnob](*(void *)(*((void *)&v23 + 1)
                                                                                 + 8 * i));
            CGFloat x = v30.origin.x;
            CGFloat y = v30.origin.y;
            double width = v30.size.width;
            CGFloat height = v30.size.height;
            double MidX = CGRectGetMidX(v30);
            v31.origin.CGFloat x = x;
            v31.origin.CGFloat y = y;
            v31.size.double width = width;
            v31.size.CGFloat height = height;
            double MidY = CGRectGetMidY(v31);
            objc_msgSend(v13, "frame", (void)v23);
            if (sqrt((a4 - (MidY + v21)) * (a4 - (MidY + v21)) + (a3 - (MidX + v20)) * (a3 - (MidX + v20))) < v11 + width * 0.5
              && ![v13 isHidden])
            {
              id v9 = v13;
              goto LABEL_16;
            }
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_didBeginDraggingSelection
{
}

- (void)_didEndDraggingSelection
{
  LODWORD(v2) = 1.0;
  [(CALayer *)self->_highlightLayer setOpacity:v2];
}

- (CGPoint)editMenuLocation
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  id v10 = a4;
  id v8 = a5;
  int v9 = [(PKSelectionModificationKnob *)self->_leftKnob isHidden];
  if (v10 && v8)
  {
    if (v9)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)self);
      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:]((uint64_t)self, v10, v8, 1);
      -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 1);
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      -[PKSelectionGlowRenderer _setupHighlightIfNecessary]((uint64_t)self);
      -[PKSelectionGlowRenderer _createPathAroundStrokes:inDrawing:isLive:liveScrollOffset:]((uint64_t)self, v10, v8, 1);
      -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 1);
    }
  }
  else
  {
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)&self->super.isa, 0);
    [(CALayer *)self->_strokePathsTilesLayer setSublayers:0];
    [(NSMutableDictionary *)self->_tiles removeAllObjects];
  }
}

- (void)_createPathAroundStrokes:(uint64_t)a1 inDrawing:(void *)a2 isLive:(void *)a3 liveScrollOffset:(int)a4
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (v7 && [v7 count])
    {
      id v157 = v8;
      id v9 = v8;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v219.double a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v219.double c = v10;
      *(_OWORD *)&v219.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      if (a4)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
        v12 = WeakRetained;
        if (WeakRetained) {
          [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
        }
        else {
          memset(&v222, 0, sizeof(v222));
        }
        CGAffineTransform v219 = v222;
      }
      else
      {
        [*(id *)(a1 + 80) bounds];
        double v14 = v13;
        double v16 = v15;
        id v17 = objc_loadWeakRetained((id *)(a1 + 88));
        v18 = [*(id *)(a1 + 80) drawing];
        [v17 scaleForDrawing:v18];
        CGFloat v20 = v19;

        memset(&v222, 0, sizeof(v222));
        CGAffineTransformMakeTranslation(&v222, -v14, -v16);
        CGAffineTransformMakeScale(&t2, v20, v20);
        CGAffineTransform t1 = v222;
        CGAffineTransformConcat(&v219, &t1, &t2);
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      CGAffineTransform v218 = v219;
      aBlock[2] = __86__PKSelectionGlowRenderer__createPathAroundStrokes_inDrawing_isLive_liveScrollOffset___block_invoke;
      aBlock[3] = &unk_1E64C5EE8;
      aBlock[4] = a1;
      v172 = (double (**)(void *, void))_Block_copy(aBlock);
      id v21 = objc_loadWeakRetained((id *)(a1 + 88));
      [v21 attachmentBoundsForDrawing:v9];
      CGFloat v183 = v23;
      CGFloat r2 = v22;
      CGFloat v175 = v25;
      CGFloat v179 = v24;

      locatiouint64_t n = (id *)(a1 + 88);
      long long v26 = (id *)objc_loadWeakRetained((id *)(a1 + 88));
      v159 = v26;
      if (v26) {
        id v27 = objc_loadWeakRetained(v26 + 15);
      }
      else {
        id v27 = 0;
      }
      v28 = [v9 uuid];
      v29 = [v27 _attachmentForUUID:v28];

      if (a4 && [v29 isExternalAttachment])
      {
        CGRect v30 = [v29 viewRep];
        [v30 frame];
        CGFloat v183 = v32;
        CGFloat r2 = v31;
        CGFloat v175 = v34;
        CGFloat v179 = v33;
      }
      id v152 = v9;
      v160 = v29;
      CGFloat v36 = *MEMORY[0x1E4F1DB20];
      CGFloat v35 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v38 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v37 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v39 = v7;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v213 objects:v228 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v214;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v214 != v42) {
              objc_enumerationMutation(v39);
            }
            v230.origin.CGFloat x = v172[2](v172, *(void *)(*((void *)&v213 + 1) + 8 * i));
            CGFloat x = v230.origin.x;
            CGFloat y = v230.origin.y;
            CGFloat width = v230.size.width;
            CGFloat height = v230.size.height;
            v246.origin.CGFloat y = v183;
            v246.origin.CGFloat x = r2;
            v246.size.CGFloat height = v175;
            v246.size.CGFloat width = v179;
            if (CGRectIntersectsRect(v230, v246))
            {
              v231.origin.CGFloat x = x;
              v231.origin.CGFloat y = y;
              v231.size.CGFloat width = width;
              v231.size.CGFloat height = height;
              v247.origin.CGFloat x = v36;
              v247.origin.CGFloat y = v35;
              v247.size.CGFloat width = v38;
              v247.size.CGFloat height = v37;
              CGRect v232 = CGRectUnion(v231, v247);
              CGFloat v36 = v232.origin.x;
              CGFloat v35 = v232.origin.y;
              CGFloat v38 = v232.size.width;
              CGFloat v37 = v232.size.height;
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v213 objects:v228 count:16];
        }
        while (v41);
      }
      int v155 = a4;
      id v158 = v7;
      v163 = v39;

      v233.origin.CGFloat y = v183;
      v233.origin.CGFloat x = r2;
      v233.size.CGFloat height = v175;
      v233.size.CGFloat width = v179;
      v248.origin.CGFloat x = v36;
      v248.origin.CGFloat y = v35;
      v248.size.CGFloat width = v38;
      v248.size.CGFloat height = v37;
      CGRect v234 = CGRectUnion(v233, v248);
      double v48 = v234.origin.x;
      double v49 = v234.origin.y;
      r2double a = v234.size.width;
      double v50 = v234.size.height;
      v51 = (void *)MEMORY[0x1E4F1CA80];
      v52 = [*(id *)(a1 + 64) allKeys];
      v161 = [v51 setWithArray:v52];

      LODWORD(v53) = 1050253722;
      [*(id *)(a1 + 16) setOpacity:v53];
      v162 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v176 = vcvtpd_s64_f64(v50 * 0.00390625);
      uint64_t v184 = a1;
      if (v176 >= 1)
      {
        uint64_t v180 = 0;
        uint64_t v54 = vcvtpd_s64_f64(r2a * 0.00390625);
        do
        {
          if (v54 >= 1)
          {
            for (uint64_t j = 0; j != v54; ++j)
            {
              v235.size.CGFloat width = 256.0;
              v235.origin.CGFloat x = v48 + (double)j * 256.0;
              v235.origin.CGFloat y = v49 + (double)v180 * 256.0;
              v235.size.CGFloat height = 256.0;
              v249.origin.CGFloat x = v48;
              v249.origin.CGFloat y = v49;
              v249.size.CGFloat width = r2a;
              v249.size.CGFloat height = v50;
              CGRect v236 = CGRectIntersection(v235, v249);
              double v56 = v236.origin.x;
              double v57 = v236.origin.y;
              double v58 = v236.size.width;
              double v59 = v236.size.height;
              if (!CGRectIsNull(v236))
              {
                v60 = [MEMORY[0x1E4F1CA48] array];
                long long v209 = 0u;
                long long v210 = 0u;
                long long v211 = 0u;
                long long v212 = 0u;
                id v61 = v163;
                uint64_t v62 = [v61 countByEnumeratingWithState:&v209 objects:v227 count:16];
                if (v62)
                {
                  uint64_t v63 = v62;
                  uint64_t v64 = *(void *)v210;
                  do
                  {
                    for (uint64_t k = 0; k != v63; ++k)
                    {
                      if (*(void *)v210 != v64) {
                        objc_enumerationMutation(v61);
                      }
                      uint64_t v66 = *(void *)(*((void *)&v209 + 1) + 8 * k);
                      v237.origin.CGFloat x = v172[2](v172, v66);
                      v250.origin.CGFloat x = v56;
                      v250.origin.CGFloat y = v57;
                      v250.size.CGFloat width = v58;
                      v250.size.CGFloat height = v59;
                      if (CGRectIntersectsRect(v237, v250)) {
                        [v60 addObject:v66];
                      }
                    }
                    uint64_t v63 = [v61 countByEnumeratingWithState:&v209 objects:v227 count:16];
                  }
                  while (v63);
                }

                if ([v60 count])
                {
                  v67 = -[PKSelectionTileProperties initWithFrame:strokes:]([PKSelectionTileProperties alloc], "initWithFrame:strokes:", v60, v56, v57, v58, v59);
                  [v162 addObject:v67];
                }
                a1 = v184;
              }
            }
          }
          ++v180;
        }
        while (v180 != v176);
      }
      v68 = (void *)[v162 mutableCopy];
      [v68 minusSet:v161];
      v69 = (void *)[v161 mutableCopy];
      [v69 minusSet:v162];
      long long v207 = 0u;
      long long v208 = 0u;
      long long v205 = 0u;
      long long v206 = 0u;
      id v70 = v69;
      uint64_t v71 = [v70 countByEnumeratingWithState:&v205 objects:v226 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = *(void *)v206;
        do
        {
          for (uint64_t m = 0; m != v72; ++m)
          {
            if (*(void *)v206 != v73) {
              objc_enumerationMutation(v70);
            }
            uint64_t v75 = *(void *)(*((void *)&v205 + 1) + 8 * m);
            v76 = [*(id *)(a1 + 64) objectForKeyedSubscript:v75];
            [v76 removeFromSuperlayer];
            [*(id *)(a1 + 64) removeObjectForKey:v75];
          }
          uint64_t v72 = [v70 countByEnumeratingWithState:&v205 objects:v226 count:16];
        }
        while (v72);
      }
      v154 = v70;

      long long v203 = 0u;
      long long v204 = 0u;
      long long v201 = 0u;
      long long v202 = 0u;
      id v77 = v68;
      uint64_t v78 = [v77 countByEnumeratingWithState:&v201 objects:v225 count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v80 = *(void *)v202;
        do
        {
          for (uint64_t n = 0; n != v79; ++n)
          {
            if (*(void *)v202 != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = *(void **)(*((void *)&v201 + 1) + 8 * n);
            v83 = [[PKSelectionTile alloc] initWithProperties:v82];
            [v82 frame];
            -[PKSelectionTile setFrame:](v83, "setFrame:");
            [*(id *)(a1 + 64) setObject:v83 forKeyedSubscript:v82];
            [*(id *)(a1 + 16) addSublayer:v83];
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:&v201 objects:v225 count:16];
        }
        while (v79);
      }

      long long v199 = 0u;
      long long v200 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      obuint64_t j = v77;
      uint64_t v168 = [obj countByEnumeratingWithState:&v197 objects:v224 count:16];
      if (v168)
      {
        uint64_t v166 = *(void *)v198;
        uint64_t v181 = *MEMORY[0x1E4F3A458];
        uint64_t v177 = *MEMORY[0x1E4F3A478];
        do
        {
          uint64_t v84 = 0;
          do
          {
            if (*(void *)v198 != v166) {
              objc_enumerationMutation(obj);
            }
            uint64_t v170 = v84;
            v85 = *(void **)(*((void *)&v197 + 1) + 8 * v84);
            r2b = [*(id *)(a1 + 64) objectForKeyedSubscript:v85];
            long long v193 = 0u;
            long long v194 = 0u;
            long long v195 = 0u;
            long long v196 = 0u;
            id v173 = [v85 strokes];
            uint64_t v86 = [v173 countByEnumeratingWithState:&v193 objects:v223 count:16];
            if (v86)
            {
              uint64_t v87 = v86;
              uint64_t v88 = *(void *)v194;
              do
              {
                for (iuint64_t i = 0; ii != v87; ++ii)
                {
                  if (*(void *)v194 != v88) {
                    objc_enumerationMutation(v173);
                  }
                  v90 = *(void **)(*((void *)&v193 + 1) + 8 * ii);
                  +[PKSelectionGlowRenderer sharedStrokePathCache]();
                  v91 = (char *)objc_claimAutoreleasedReturnValue();
                  v92 = [v90 _strokeUUID];
                  v93 = -[PKLRUCache objectForKey:](v91, v92);

                  if (v93)
                  {
                    v94 = CGPathRetain((CGPathRef)[v93 CGPath]);
                  }
                  else
                  {
                    LODWORD(v222.a) = 0;
                    v94 = (const CGPath *)[v90 newSelectionPathRepresentationWithPointsCount:&v222];
                    v95 = +[PKSelectionGlowRenderer sharedStrokePathCache]();
                    v96 = [MEMORY[0x1E4FB14C0] bezierPathWithCGPath:v94];
                    v97 = [v90 _strokeUUID];
                    -[PKLRUCache setObject:forKey:cost:]((uint64_t)v95, v96, v97, 16 * SLODWORD(v222.a));
                  }
                  v98 = [MEMORY[0x1E4F39C88] layer];
                  memset(&v222, 0, sizeof(v222));
                  [v85 frame];
                  CGFloat v100 = -v99;
                  [v85 frame];
                  CGAffineTransformMakeTranslation(&v222, v100, -v101);
                  memset(&t2, 0, sizeof(t2));
                  if (v90) {
                    [v90 _transform];
                  }
                  else {
                    memset(&v192, 0, sizeof(v192));
                  }
                  CGAffineTransform t1 = v219;
                  CGAffineTransformConcat(&t2, &v192, &t1);
                  CGAffineTransform v191 = t2;
                  CGAffineTransform v190 = v222;
                  CGAffineTransformConcat(&t1, &v191, &v190);
                  CGAffineTransform t2 = t1;
                  v102 = CGPathCreateMutableCopyByTransformingPath(v94, &t2);
                  v103 = [MEMORY[0x1E4FB1BA8] mainScreen];
                  [v103 scale];
                  objc_msgSend(v98, "setContentsScale:");

                  [v98 setPath:v102];
                  v104 = [v90 _strokeMask];

                  if (v104)
                  {
                    a1 = v184;
                    [v98 setFillColor:-[PKSelectionGlowRenderer _highlightColor](v184)];
                    double v105 = 10.0;
                  }
                  else
                  {
                    [v98 setFillColor:0];
                    a1 = v184;
                    double v105 = -[PKSelectionGlowRenderer _widthForStroke:](v184, v90) + 10.0;
                  }
                  [v98 setLineWidth:v105];
                  [v98 setLineCap:v181];
                  [v98 setLineJoin:v177];
                  [v98 setStrokeColor:-[PKSelectionGlowRenderer _highlightColor](a1)];
                  CGPathRelease(v94);
                  CGPathRelease(v102);
                  [r2b addSublayer:v98];
                }
                uint64_t v87 = [v173 countByEnumeratingWithState:&v193 objects:v223 count:16];
              }
              while (v87);
            }

            uint64_t v84 = v170 + 1;
          }
          while (v170 + 1 != v168);
          uint64_t v168 = [obj countByEnumeratingWithState:&v197 objects:v224 count:16];
        }
        while (v168);
      }

      id v7 = v158;
      v106 = v160;
      if (v155 && v160 && [v160 isExternalAttachment])
      {
        uint64_t v107 = [(id)a1 adornmentLayer];
        v108 = (void *)v107;
        if (v159 && v107 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v109 = [v160 contentWindowCoordinateSpace];
          v110 = [v160 contentScaledCoordinateSpace];
          id v111 = objc_loadWeakRetained(v159 + 15);
          [v111 frame];
          objc_msgSend(v109, "convertRect:toCoordinateSpace:", v110);
          objc_msgSend(v108, "setFrame:");

          if (objc_opt_respondsToSelector()) {
            [v159 updateLiveSelectionForStrokesInLayer:v108 inDrawing:v152];
          }

          v106 = v160;
        }
      }
      if (!*(unsigned char *)(a1 + 48))
      {
        double a = v219.a;
        r2double c = v219.b;
        double d = v219.d;
        tCGFloat x = v219.tx;
        double c = v219.c;
        tCGFloat y = v219.ty;
        id v112 = v163;
        id v113 = objc_loadWeakRetained(location);
        v114 = [v113 _firstStrokesInStrokes:v112];

        id v115 = objc_loadWeakRetained(location);
        v116 = [v115 _lastStrokesInStrokes:v112];

        +[PKDrawing _boundingBoxForStrokeArray:v114];
        CGFloat v118 = v117;
        CGFloat v120 = v119;
        CGFloat v122 = v121;
        CGFloat v124 = v123;
        +[PKDrawing _boundingBoxForStrokeArray:v116];
        CGFloat v167 = v125;
        CGFloat v169 = v126;
        CGFloat v128 = v127;
        CGFloat v130 = v129;
        double MinX = *MEMORY[0x1E4F1DAD8];
        double MaxY = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        id v133 = objc_loadWeakRetained(location);
        LOBYTE(v115) = [v133 isRTL];

        uint64_t v134 = [v114 count];
        double v164 = MinX;
        double v156 = MaxY;
        if (v115)
        {
          double v135 = MinX;
          CGFloat v136 = v128;
          double v137 = MaxY;
          CGFloat v138 = v130;
          double MinY = v137;
          double MaxX = v135;
          if (v134)
          {
            v238.origin.CGFloat x = v118;
            v238.origin.CGFloat y = v120;
            v238.size.CGFloat width = v122;
            v238.size.CGFloat height = v124;
            double MaxX = CGRectGetMaxX(v238);
            v239.origin.CGFloat x = v118;
            v239.origin.CGFloat y = v120;
            v239.size.CGFloat width = v122;
            v239.size.CGFloat height = v124;
            double MinY = CGRectGetMinY(v239);
          }
          if ([v116 count])
          {
            v240.origin.CGFloat x = v167;
            v240.origin.CGFloat y = v169;
            CGFloat v141 = v136;
            v240.size.CGFloat width = v136;
            v240.size.CGFloat height = v138;
            double MinX = CGRectGetMinX(v240);
            v241.origin.CGFloat x = v167;
            v241.origin.CGFloat y = v169;
            v241.size.CGFloat width = v141;
            v241.size.CGFloat height = v138;
            double MaxY = CGRectGetMaxY(v241);
          }
          else
          {
            double MaxY = v156;
            double MinX = v164;
          }
        }
        else
        {
          if (v134)
          {
            v242.origin.CGFloat x = v118;
            v242.origin.CGFloat y = v120;
            v242.size.CGFloat width = v122;
            v242.size.CGFloat height = v124;
            double MinX = CGRectGetMinX(v242);
            v243.origin.CGFloat x = v118;
            v243.origin.CGFloat y = v120;
            v243.size.CGFloat width = v122;
            v243.size.CGFloat height = v124;
            double MaxY = CGRectGetMinY(v243);
          }
          if ([v116 count])
          {
            v244.origin.CGFloat x = v167;
            v244.origin.CGFloat y = v169;
            v244.size.CGFloat width = v128;
            v244.size.CGFloat height = v130;
            CGFloat v142 = CGRectGetMaxX(v244);
            v245.size.CGFloat width = v128;
            double MaxX = v142;
            v245.origin.CGFloat x = v167;
            v245.origin.CGFloat y = v169;
            v245.size.CGFloat height = v130;
            double MinY = CGRectGetMaxY(v245);
          }
          else
          {
            double MinY = v156;
            double MaxX = v164;
          }
        }
        double v143 = tx + c * MaxY + a * MinX;
        double v144 = ty + d * MaxY + r2c * MinX;
        double v145 = tx + c * MinY + a * MaxX;
        double v146 = ty + d * MinY + r2c * MaxX;
        id v147 = objc_loadWeakRetained(location);
        int v148 = [v147 isRTL];

        if (v148) {
          double v149 = -1.0;
        }
        else {
          double v149 = 1.0;
        }
        double v150 = v144 - v149;
        double v151 = v146 + v149;
        objc_msgSend(*(id *)(a1 + 24), "setPosition:", v143 + -1.0, v150);
        objc_msgSend(*(id *)(a1 + 32), "setPosition:", v145 + 1.0, v151);

        v106 = v160;
      }

      id v8 = v157;
    }
    else
    {
      [*(id *)(a1 + 16) setSublayers:0];
      [*(id *)(a1 + 64) removeAllObjects];
    }
  }
}

- (double)_widthForStroke:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    [v3 _maxWidthForStroke];
    double v6 = v5;
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    [v7 userInterfaceIdiom];

    if (v4)
    {
      [v4 transform];
      double v8 = *((double *)&v22 + 1);
      double v9 = *(double *)&v22;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
      double v8 = 0.0;
      double v9 = 0.0;
    }
    double v10 = sqrt(v8 * v8 + v9 * v9);
    double v11 = objc_msgSend(v4, "ink", v22, v23, v24);
    v12 = [v11 behavior];
    double v13 = [v12 renderingDescriptor];
    uint64_t v14 = [v13 type];
    double v15 = 0.0;
    if (!v14) {
      double v15 = 2.0;
    }
    double v16 = v15 + v6 * v10;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v18 = [*(id *)(a1 + 80) drawing];
    [WeakRetained scaleForDrawing:v18];
    double v20 = v16 * v19;
  }
  else
  {
    double v20 = 0.0;
  }

  return v20;
}

void __86__PKSelectionGlowRenderer__createPathAroundStrokes_inDrawing_isLive_liveScrollOffset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 renderBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = -[PKSelectionGlowRenderer _widthForStroke:](*(void *)(a1 + 32), v3);

  v15.origin.CGFloat x = v5;
  v15.origin.CGFloat y = v7;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v11;
  CGRect v16 = CGRectInset(v15, -(v12 + 10.0), -(v12 + 10.0));
  long long v13 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v14.double a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v14.double c = v13;
  *(_OWORD *)&v14.tCGFloat x = *(_OWORD *)(a1 + 72);
  CGRectApplyAffineTransform(v16, &v14);
}

- (void)_willBeginDragKnobLocation:(unint64_t)a3 atPoint:(double)a4 knobDragMode:(double)a5
{
  if (a1)
  {
    *(void *)(a1 + 40) = a3;
    *(void *)(a1 + 56) = a2;
    *(unsigned char *)(a1 + 48) = 1;
    if (a3 <= 2)
    {
      [(PKSelectionModificationKnob *)*(id **)(a1 + 32) didBeginBrushSelection];
      [(PKSelectionModificationKnob *)*(id **)(a1 + 24) didBeginBrushSelection];
      [(PKSelectionGlowRenderer *)a1 _updateKnobAppearanceForDragAtKnobLocation:a3 point:1 knobDragMode:2 selectionType:a4 touchType:a5];
      uint64_t v11 = 32;
      if (!a2) {
        uint64_t v11 = 24;
      }
      id v13 = *(id *)(a1 + v11);
      [v13 setHidden:0];
      double v12 = (CGColor *)-[PKSelectionGlowRenderer _highlightColor](a1);
      -[PKSelectionModificationKnob setKnobColor:]((id *)v13, v12);
    }
  }
}

- (void)_updateKnobAppearanceForDragAtKnobLocation:(unint64_t)a3 point:(uint64_t)a4 knobDragMode:(uint64_t)a5 selectionType:(double)a6 touchType:(double)a7
{
  if (a1)
  {
    uint64_t v13 = 32;
    if (!a2) {
      uint64_t v13 = 24;
    }
    id v14 = *(id *)(a1 + v13);
    if (a3 > 2)
    {
      [(PKSelectionGlowRenderer *)a1 _resetKnobAppearance];
      [v14 frame];
      double v25 = v24;
      double v27 = v26;
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_msgSend(v14, "setFrame:", a6 - v25 * 0.5, a7 - v27 * 0.5, v25, v27);
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      double v16 = 5.75;
      if (a5 == 2) {
        double v16 = 3.5;
      }
      double v17 = 6.5;
      double v18 = 5.0;
      if (a5 == 2)
      {
        double v17 = 5.0;
        double v18 = 2.0;
      }
      if (a4 == 1) {
        double v17 = v18;
      }
      if (a4 != 2) {
        double v16 = v17;
      }
      CATransform3DMakeScale(&v28, v16, v16, 1.0);
      [v14 setTransform:&v28];
      [v14 frame];
      double v20 = v19;
      double v22 = v21;
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_msgSend(v14, "setFrame:", a6 - v20 * 0.5, a7 - v22 * 0.5, v20, v22);
      [MEMORY[0x1E4F39CF8] commit];
      id v23 = *(id *)(a1 + 24);
      if (v23 == v14) {
        id v23 = *(id *)(a1 + 32);
      }
      [v23 setOpacity:0.0];
    }
  }
}

- (void)_updateKnobAppearanceForDragAtKnobLocation:(double)a3 point:(double)a4 otherKnobPoint:(double)a5 selectionType:(double)a6 touchType:
{
  if (a1)
  {
    if (a2) {
      uint64_t v12 = 32;
    }
    else {
      uint64_t v12 = 24;
    }
    uint64_t v13 = *(void **)(a1 + v12);
    if (a2) {
      uint64_t v14 = 24;
    }
    else {
      uint64_t v14 = 32;
    }
    id v28 = v13;
    id v15 = *(id *)(a1 + v14);
    [(PKSelectionGlowRenderer *)a1 _resetKnobAppearance];
    double v17 = 1.0;
    if (a2 == 1) {
      double v17 = -1.0;
    }
    double v18 = a5 + v17;
    double v19 = a6 + v17;
    [v28 frame];
    double v21 = v20;
    double v23 = v22;
    [v15 frame];
    double v25 = v24;
    double v27 = v26;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend(v28, "setFrame:", a3 - v21 * 0.5, a4 - v23 * 0.5, v21, v23);
    objc_msgSend(v15, "setFrame:", v18 - v25 * 0.5, v19 - v27 * 0.5, v25, v27);
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (uint64_t)_resetKnobAppearance
{
  if (result)
  {
    uint64_t v2 = result;
    LODWORD(a2) = 1.0;
    [*(id *)(result + 24) setOpacity:a2];
    LODWORD(v3) = 1.0;
    [*(id *)(v2 + 32) setOpacity:v3];
    double v4 = *(void **)(v2 + 24);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v12 = v18;
    long long v19 = v13;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v10 = v20;
    long long v21 = v11;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v14 = *MEMORY[0x1E4F39B10];
    long long v8 = v14;
    long long v15 = v9;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v6 = v16;
    long long v17 = v7;
    [v4 setTransform:&v14];
    CGFloat v5 = *(void **)(v2 + 32);
    long long v18 = v12;
    long long v19 = v13;
    long long v20 = v10;
    long long v21 = v11;
    long long v14 = v8;
    long long v15 = v9;
    long long v16 = v6;
    long long v17 = v7;
    return [v5 setTransform:&v14];
  }
  return result;
}

- (uint64_t)_didEndDragKnobLocation:(uint64_t)a3 knobDragMode:(unint64_t)a4
{
  if (result)
  {
    uint64_t v4 = result;
    if (a4 <= 2)
    {
      [(PKSelectionModificationKnob *)*(id **)(result + 32) didEndBrushSelection];
      [(PKSelectionModificationKnob *)*(id **)(v4 + 24) didEndBrushSelection];
    }
    long long v6 = [*(id *)(v4 + 80) strokes];
    -[PKSelectionGlowRenderer setKnobsVisible:]((id *)v4, [v6 count] != 0);

    *(unsigned char *)(v4 + 48) = 0;
    return [(PKSelectionGlowRenderer *)v4 _resetKnobAppearance];
  }
  return result;
}

- (id)_accessibilityUserTestingChildren
{
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  v11.receiver = self;
  v11.super_class = (Class)PKSelectionGlowRenderer;
  uint64_t v4 = [(PKSelectionGlowRenderer *)&v11 _accessibilityUserTestingChildren];
  double v5 = [v3 arrayWithArray:v4];

  leftKnob = self->_leftKnob;
  if (leftKnob)
  {
    [(PKSelectionModificationKnob *)leftKnob opacity];
    if (v7 > 0.0) {
      [v5 addObject:self->_leftKnob];
    }
  }
  rightKnob = self->_rightKnob;
  if (rightKnob)
  {
    [(PKSelectionModificationKnob *)rightKnob opacity];
    if (v9 > 0.0) {
      [v5 addObject:self->_rightKnob];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_rightKnob, 0);
  objc_storeStrong((id *)&self->_leftKnob, 0);
  objc_storeStrong((id *)&self->_strokePathsTilesLayer, 0);

  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end