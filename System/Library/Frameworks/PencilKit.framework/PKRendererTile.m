@interface PKRendererTile
+ (double)layerFrameForLevel:(uint64_t)a3 offset:(uint64_t)a4;
+ (void)drawingFrameForLayerFrame:(CGFloat)a3 drawingTransform:(CGFloat)a4 contentScale:(double)a5;
- (BOOL)lockAndSetFramebufferThreadSafe:(BOOL)a1;
- (BOOL)lockAndSetMultiplyFramebufferThreadSafe:(BOOL)a1;
- (PKRendererTileProperties)properties;
- (double)tileLayer;
- (double)tileMultiplyLayer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)framebuffer;
- (id)initWithLevel:(long long *)a3 offset:(char)a4 drawingTransform:(double)a5 contentsScale:(double)a6 sixChannelMode:(double)a7;
- (id)multiplyFramebuffer;
- (uint64_t)_clearFramebuffers;
- (uint64_t)_lockAndSetFramebuffer:(uint64_t)a1;
- (uint64_t)_lockAndSetMultiplyFramebuffer:(uint64_t)a1;
- (uint64_t)recreatePurgedTileLayersIfPossible;
- (void)clearFramebuffersThreadSafe;
- (void)dealloc;
- (void)purgeTileLayers;
- (void)updateDisableTransactionActions:(int)a3 reloadContents:;
- (void)updateLastUsedTimestamp;
@end

@implementation PKRendererTile

- (id)initWithLevel:(long long *)a3 offset:(char)a4 drawingTransform:(double)a5 contentsScale:(double)a6 sixChannelMode:(double)a7
{
  if (!a1) {
    return 0;
  }
  v36.receiver = a1;
  v36.super_class = (Class)PKRendererTile;
  id v13 = objc_msgSendSuper2(&v36, sel_init);
  id v14 = v13;
  if (v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = (void *)*((void *)v13 + 15);
    *((void *)v13 + 15) = v15;

    *((double *)v13 + 21) = a5;
    *((double *)v13 + 22) = a6;
    v17 = (void *)*((void *)v13 + 17);
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
    *((void *)v13 + 16) = a2;
    *((void *)v13 + 17) = v18;

    *((unsigned char *)v13 + 82) = a4;
    long long v19 = *a3;
    long long v20 = a3[2];
    *((_OWORD *)v13 + 3) = a3[1];
    *((_OWORD *)v13 + 4) = v20;
    *((_OWORD *)v13 + 2) = v19;
    *((double *)v13 + 19) = a7;
    atomic_store(*(unint64_t *)&a7, (unint64_t *)v13 + 1);
    [*((id *)v13 + 11) setContentsScale:a7];
    [*((id *)v13 + 12) setContentsScale:a7];
    long long v33 = *a3;
    long long v34 = a3[1];
    long long v35 = a3[2];
    double v21 = +[PKRendererTile layerFrameForLevel:(uint64_t)PKRendererTile offset:*((void *)v13 + 16)];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v37[0] = v33;
    v37[1] = v34;
    v37[2] = v35;
    +[PKRendererTile drawingFrameForLayerFrame:drawingTransform:contentScale:](v21, v22, v24, v26, *((double *)v13 + 19), (uint64_t)PKRendererTile, v37);
    *((void *)v13 + 23) = v28;
    *((void *)v13 + 24) = v29;
    *((void *)v13 + 25) = v30;
    *((void *)v13 + 26) = v31;
    if (fabs(v21) != INFINITY && fabs(v23) != INFINITY && fabs(v25) != INFINITY && fabs(v27) != INFINITY)
    {
      *((double *)v13 + 27) = v21;
      *((double *)v13 + 28) = v23;
      *((double *)v13 + 29) = v25;
      *((double *)v13 + 30) = v27;
      -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v13);
      objc_msgSend(*((id *)v13 + 11), "setFrame:", v21, v23, v25, v27);
      objc_msgSend(*((id *)v13 + 12), "setFrame:", v21, v23, v25, v27);
    }
    *((void *)v13 + 20) = 0;
    objc_msgSend(*((id *)v13 + 11), "setOpacity:", 0.0, v33, v34, v35);
    [*((id *)v13 + 12) setOpacity:0.0];
    -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v13);
  }
  return v14;
}

- (void)updateLastUsedTimestamp
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    atomic_store(v2, (unint64_t *)(a1 + 24));
  }
}

- (void)dealloc
{
  id v3 = self->_tileLayer;
  v4 = self->_tileMultiplyLayer;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__PKRendererTile_dealloc__block_invoke;
  aBlock[3] = &unk_1E64C5870;
  v5 = v3;
  v11 = v5;
  v6 = v4;
  v12 = v6;
  v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v7[2](v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  if (self->_framebufferIsLocked) {
    -[PKMetalFramebuffer decrementNonPurgeableCount](self->_framebuffer);
  }
  if (self->_multiplyFramebufferIsLocked) {
    -[PKMetalFramebuffer decrementNonPurgeableCount](self->_multiplyFramebuffer);
  }
  v8 = +[PKRendererTileController sharedController]();
  -[PKRendererTileController didTeardownTile:]((uint64_t)v8, (uint64_t)self);

  v9.receiver = self;
  v9.super_class = (Class)PKRendererTile;
  [(PKRendererTile *)&v9 dealloc];
}

void __25__PKRendererTile_dealloc__block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) superlayer];

  if (v2)
  {
    id v3 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Removed tileLayer from superlayer", buf, 2u);
    }

    [*(id *)(a1 + 32) removeFromSuperlayer];
  }
  v4 = [*(id *)(a1 + 40) superlayer];

  if (v4)
  {
    v5 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Removed tileMultiplyLayer from superlayer", v6, 2u);
    }

    [*(id *)(a1 + 40) removeFromSuperlayer];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PKRendererTile alloc];
  int64_t level = self->_level;
  double x = self->_offset.x;
  double y = self->_offset.y;
  long long v8 = *(_OWORD *)&self->_drawingTransform.c;
  v17[0] = *(_OWORD *)&self->_drawingTransform.a;
  v17[1] = v8;
  v17[2] = *(_OWORD *)&self->_drawingTransform.tx;
  objc_super v9 = (double *)[(PKRendererTile *)v4 initWithLevel:v17 offset:self->_sixChannelMode drawingTransform:x contentsScale:y sixChannelMode:self->_contentsScale];
  v10 = v9;
  if (v9)
  {
    double v11 = self->_frame.origin.x;
    double v12 = self->_frame.origin.y;
    double width = self->_frame.size.width;
    double height = self->_frame.size.height;
    v9[27] = v11;
    v9[28] = v12;
    v9[29] = width;
    v9[30] = height;
    -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v9);
    objc_msgSend(*((id *)v10 + 11), "setFrame:", v11, v12, width, height);
    objc_msgSend(*((id *)v10 + 12), "setFrame:", v11, v12, width, height);
  }
  CGPoint origin = self->_drawingFrame.origin;
  *(CGSize *)(v10 + 25) = self->_drawingFrame.size;
  *(CGPoint *)(v10 + 23) = origin;
  return v10;
}

- (PKRendererTileProperties)properties
{
  if (a1)
  {
    unint64_t v2 = a1;
    id v3 = [PKRendererTileProperties alloc];
    CGFloat a = v2[1]._drawingTransform.a;
    tdouble y = v2[1]._drawingTransform.ty;
    double v6 = *(double *)&v2[2].super.isa;
    long long v7 = *(_OWORD *)&v2->_drawingTransform.b;
    v9[0] = *(_OWORD *)&v2->_offset.y;
    v9[1] = v7;
    v9[2] = *(_OWORD *)&v2->_drawingTransform.d;
    a1 = -[PKRendererTileProperties initWithLevel:offset:drawingTransform:sixChannelMode:](v3, "initWithLevel:offset:drawingTransform:sixChannelMode:", *(void *)&a, v9, BYTE2(v2->_drawingTransform.ty), ty, v6);
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (double)layerFrameForLevel:(uint64_t)a3 offset:(uint64_t)a4
{
  self;
  self;
  double v7 = round(exp2((double)a4) * 256.0);

  return DKDRoundedRectForScale(a1 * v7, a2 * v7, v7, v7, 1.0);
}

+ (void)drawingFrameForLayerFrame:(CGFloat)a3 drawingTransform:(CGFloat)a4 contentScale:(double)a5
{
  self;
  long long v13 = a7[1];
  *(_OWORD *)&v14.CGFloat a = *a7;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tdouble x = a7[2];
  CGAffineTransformInvert(&v15, &v14);
  v16.origin.double x = a1;
  v16.origin.double y = a2;
  v16.size.double width = a3;
  v16.size.double height = a4;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  DKDRoundedRectForScale(v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, a5);
}

- (void)updateDisableTransactionActions:(int)a3 reloadContents:
{
  if (a1)
  {
    [MEMORY[0x1E4F39CF8] begin];
    if (*(unsigned char *)(a1 + 84)) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = a2 == 0;
    }
    if (!v7) {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    if (a3)
    {
      [*(id *)(a1 + 88) reloadValueForKeyPath:@"contents"];
      [*(id *)(a1 + 96) reloadValueForKeyPath:@"contents"];
    }
    *(void *)(a1 + 160) = 0x3FF0000000000000;
    LODWORD(v6) = 1.0;
    [*(id *)(a1 + 88) setOpacity:v6];
    LODWORD(v8) = 1.0;
    [*(id *)(a1 + 96) setOpacity:v8];
    [MEMORY[0x1E4F39CF8] commit];
    -[PKRendererTile updateLastUsedTimestamp](a1);
  }
}

- (double)tileLayer
{
  if (a1)
  {
    uint64_t v1 = a1;
    unint64_t v2 = (void *)*((void *)a1 + 11);
    if (v2)
    {
LABEL_12:
      a1 = v2;
      goto LABEL_13;
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v4 = (void *)*((void *)v1 + 11);
    *((void *)v1 + 11) = v3;

    objc_msgSend(*((id *)v1 + 11), "setFrame:", v1[27], v1[28], v1[29], v1[30]);
    [*((id *)v1 + 11) setContentsScale:v1[19]];
    [*((id *)v1 + 11) setHidden:*((unsigned __int8 *)v1 + 84)];
    double v5 = v1[20];
    *(float *)&double v5 = v5;
    [*((id *)v1 + 11) setOpacity:v5];
    [*((id *)v1 + 11) setAllowsGroupOpacity:0];
    uint64_t v6 = *((void *)v1 + 13);
    if (!v6 || !*((unsigned char *)v1 + 80))
    {
LABEL_11:
      [MEMORY[0x1E4F39CF8] commit];
      unint64_t v2 = (void *)*((void *)v1 + 11);
      goto LABEL_12;
    }
    if (*((unsigned char *)v1 + 82))
    {
      BOOL v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A248]];
      [*((id *)v1 + 11) setCompositingFilter:v7];

      uint64_t v6 = *((void *)v1 + 13);
      double v8 = (void *)*((void *)v1 + 11);
      if (!v6)
      {
        uint64_t v9 = 0;
LABEL_10:
        [v8 setContents:v9];
        goto LABEL_11;
      }
    }
    else
    {
      double v8 = (void *)*((void *)v1 + 11);
    }
    uint64_t v9 = *(void *)(v6 + 56);
    goto LABEL_10;
  }
LABEL_13:

  return a1;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  int64_t level = self->_level;
  double x = self->_offset.x;
  double y = self->_offset.y;
  uint64_t v9 = NSStringFromCGRect(self->_frame);
  v10 = (void *)v9;
  if (self->_outOfDate) {
    double v11 = @" outOfDate";
  }
  else {
    double v11 = &stru_1F1FB2C00;
  }
  unint64_t v12 = atomic_load((unint64_t *)&self->_renderCount);
  long long v13 = [v3 stringWithFormat:@"<%@ %p [%ld, (%ld, %ld)] frame=%@%@ renderCount:%ld opacity:%d hidden:%d>", v5, self, level, (uint64_t)x, (uint64_t)y, v9, v11, v12, (int)self->_opacity, self->_hidden];

  return v13;
}

- (double)tileMultiplyLayer
{
  if (a1)
  {
    uint64_t v1 = a1;
    unint64_t v2 = (void *)*((void *)a1 + 12);
    if (!v2)
    {
      if (*((unsigned char *)a1 + 82))
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        id v3 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
        v4 = (void *)*((void *)v1 + 12);
        *((void *)v1 + 12) = v3;

        objc_msgSend(*((id *)v1 + 12), "setFrame:", v1[27], v1[28], v1[29], v1[30]);
        [*((id *)v1 + 12) setContentsScale:v1[19]];
        [*((id *)v1 + 12) setHidden:*((unsigned __int8 *)v1 + 84)];
        double v5 = v1[20];
        *(float *)&double v5 = v5;
        [*((id *)v1 + 12) setOpacity:v5];
        [*((id *)v1 + 12) setAllowsGroupOpacity:0];
        if (*((void *)v1 + 14) && *((unsigned char *)v1 + 81))
        {
          uint64_t v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A0]];
          [*((id *)v1 + 12) setCompositingFilter:v6];

          uint64_t v7 = *((void *)v1 + 14);
          if (v7) {
            uint64_t v8 = *(void *)(v7 + 56);
          }
          else {
            uint64_t v8 = 0;
          }
          [*((id *)v1 + 12) setContents:v8];
        }
        [MEMORY[0x1E4F39CF8] commit];
        unint64_t v2 = (void *)*((void *)v1 + 12);
      }
      else
      {
        unint64_t v2 = 0;
      }
    }
    a1 = v2;
  }

  return a1;
}

- (uint64_t)_lockAndSetFramebuffer:(uint64_t)a1
{
  v4 = a2;
  if (a1)
  {
    double v5 = *(uint64_t **)(a1 + 104);
    if (v5 == v4)
    {
      double v5 = v4;
      if (*(unsigned char *)(a1 + 80))
      {
        a1 = 1;
        goto LABEL_14;
      }
    }
    else if (*(unsigned char *)(a1 + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](v5);
      uint64_t v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;

      *(unsigned char *)(a1 + 80) = 0;
      double v5 = *(uint64_t **)(a1 + 104);
    }
    *(void *)(a1 + 104) = 0;

    if (-[PKMetalFramebuffer incrementNonPurgeableCount](v4))
    {
      objc_storeStrong((id *)(a1 + 104), a2);
      *(unsigned char *)(a1 + 80) = 1;
      if (v4) {
        uint64_t v7 = v4[7];
      }
      else {
        uint64_t v7 = 0;
      }
      [*(id *)(a1 + 88) setContents:v7];
      if (*(unsigned char *)(a1 + 82))
      {
        uint64_t v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A248]];
        [*(id *)(a1 + 88) setCompositingFilter:v8];
      }
    }
    else
    {
      [*(id *)(a1 + 88) setContents:0];
      [*(id *)(a1 + 88) setCompositingFilter:0];
    }
    a1 = *(unsigned char *)(a1 + 80) != 0;
  }
LABEL_14:

  return a1;
}

- (uint64_t)_lockAndSetMultiplyFramebuffer:(uint64_t)a1
{
  v4 = a2;
  if (a1)
  {
    double v5 = *(uint64_t **)(a1 + 112);
    if (v5 == v4)
    {
      double v5 = v4;
      if (*(unsigned char *)(a1 + 81))
      {
        a1 = 1;
        goto LABEL_13;
      }
    }
    else if (*(unsigned char *)(a1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](v5);
      uint64_t v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = 0;

      *(unsigned char *)(a1 + 81) = 0;
      double v5 = *(uint64_t **)(a1 + 112);
    }
    *(void *)(a1 + 112) = 0;

    if (-[PKMetalFramebuffer incrementNonPurgeableCount](v4))
    {
      objc_storeStrong((id *)(a1 + 112), a2);
      *(unsigned char *)(a1 + 81) = 1;
      if (v4) {
        uint64_t v7 = v4[7];
      }
      else {
        uint64_t v7 = 0;
      }
      [*(id *)(a1 + 96) setContents:v7];
      uint64_t v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A0]];
      [*(id *)(a1 + 96) setCompositingFilter:v8];
    }
    else
    {
      [*(id *)(a1 + 96) setCompositingFilter:0];
      [*(id *)(a1 + 96) setContents:0];
    }
    a1 = *(unsigned char *)(a1 + 81) != 0;
  }
LABEL_13:

  return a1;
}

- (BOOL)lockAndSetFramebufferThreadSafe:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      char v4 = -[PKRendererTile _lockAndSetFramebuffer:](a1, v3);
      *((unsigned char *)v10 + 24) = v4;
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PKRendererTile_lockAndSetFramebufferThreadSafe___block_invoke;
      block[3] = &unk_1E64CAD88;
      uint64_t v8 = &v9;
      block[4] = a1;
      id v7 = v3;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    a1 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

uint64_t __50__PKRendererTile_lockAndSetFramebufferThreadSafe___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[PKRendererTile _lockAndSetFramebuffer:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  unint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (BOOL)lockAndSetMultiplyFramebufferThreadSafe:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      char v4 = -[PKRendererTile _lockAndSetMultiplyFramebuffer:](a1, v3);
      *((unsigned char *)v10 + 24) = v4;
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__PKRendererTile_lockAndSetMultiplyFramebufferThreadSafe___block_invoke;
      block[3] = &unk_1E64CAD88;
      uint64_t v8 = &v9;
      block[4] = a1;
      id v7 = v3;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    a1 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

uint64_t __58__PKRendererTile_lockAndSetMultiplyFramebufferThreadSafe___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[PKRendererTile _lockAndSetMultiplyFramebuffer:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  unint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (uint64_t)_clearFramebuffers
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(result + 104));
      *(unsigned char *)(v1 + 80) = 0;
    }
    unint64_t v2 = *(void **)(v1 + 104);
    *(void *)(v1 + 104) = 0;

    [*(id *)(v1 + 88) setContents:0];
    [*(id *)(v1 + 88) setCompositingFilter:0];
    if (*(unsigned char *)(v1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(v1 + 112));
      *(unsigned char *)(v1 + 81) = 0;
    }
    id v3 = *(void **)(v1 + 112);
    *(void *)(v1 + 112) = 0;

    [*(id *)(v1 + 96) setContents:0];
    char v4 = *(void **)(v1 + 96);
    return [v4 setCompositingFilter:0];
  }
  return result;
}

- (void)clearFramebuffersThreadSafe
{
  if (a1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      -[PKRendererTile _clearFramebuffers](a1);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PKRendererTile_clearFramebuffersThreadSafe__block_invoke;
      block[3] = &unk_1E64C5368;
      block[4] = a1;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __45__PKRendererTile_clearFramebuffersThreadSafe__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[PKRendererTile _clearFramebuffers](*(void *)(a1 + 32));
  unint64_t v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (id)framebuffer
{
  if (a1)
  {
    if (*((unsigned char *)a1 + 80)) {
      a1 = (id *)a1[13];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)multiplyFramebuffer
{
  if (a1)
  {
    if (*((unsigned char *)a1 + 81)) {
      a1 = (id *)a1[14];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)purgeTileLayers
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(a1 + 104));
      *(unsigned char *)(a1 + 80) = 0;
    }
    if (*(unsigned char *)(a1 + 81))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(a1 + 112));
      *(unsigned char *)(a1 + 81) = 0;
    }
    [*(id *)(a1 + 88) removeFromSuperlayer];
    [*(id *)(a1 + 88) setContents:0];
    unint64_t v2 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    [*(id *)(a1 + 96) removeFromSuperlayer];
    [*(id *)(a1 + 96) setContents:0];
    id v3 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;
  }
}

- (uint64_t)recreatePurgedTileLayersIfPossible
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 88) && (*(void *)(result + 96) || !*(unsigned char *)(result + 82))) {
      return 1;
    }
    unint64_t v2 = *(unsigned char **)(result + 104);
    if (v2 && !*(unsigned char *)(v1 + 80) && -[PKMetalFramebuffer incrementNonPurgeableCount](v2)) {
      *(unsigned char *)(v1 + 80) = 1;
    }
    id v3 = *(unsigned char **)(v1 + 112);
    if (v3 && !*(unsigned char *)(v1 + 81) && -[PKMetalFramebuffer incrementNonPurgeableCount](v3)) {
      *(unsigned char *)(v1 + 81) = 1;
    }
    if (!*(void *)(v1 + 104) || *(unsigned char *)(v1 + 80)) {
      id v4 = -[PKRendererTile tileLayer]((double *)v1);
    }
    if (*(unsigned char *)(v1 + 82) && (!*(void *)(v1 + 112) || *(unsigned char *)(v1 + 81))) {
      id v5 = -[PKRendererTile tileMultiplyLayer]((double *)v1);
    }
    if (*(void *)(v1 + 88))
    {
      if (*(void *)(v1 + 96)) {
        return 1;
      }
      return *(unsigned char *)(v1 + 82) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedStrokes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_multiplyFramebuffer, 0);
  objc_storeStrong((id *)&self->_framebuffer, 0);
  objc_storeStrong((id *)&self->_tileMultiplyLayer, 0);

  objc_storeStrong((id *)&self->_tileLayer, 0);
}

@end