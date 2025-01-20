@interface HPSSpatialProfileSingleStepPillContainerView
- (BOOL)leftEarStateComplete;
- (BOOL)leftSectionCompleted;
- (BOOL)rightEarStateComplete;
- (BOOL)rightSectionCompleted;
- (BSUICAPackageView)micaView;
- (HPSSpatialProfileSingleStepPillContainerView)initWithFrame:(CGRect)a3;
- (NSArray)layerMappingLeft;
- (NSArray)layerMappingRight;
- (NSMutableArray)pillsStatusArray;
- (NSMutableSet)animatedFaceLayers;
- (unint64_t)leftPillIndex;
- (unint64_t)middleMinusOne;
- (unint64_t)middlePlusOne;
- (unint64_t)middleZero;
- (unint64_t)rightPillIndex;
- (void)animateFaceAnglesIfneeded:(id)a3 withCompletion:(id)a4;
- (void)fillPill:(unint64_t)a3 updatePillsForPoseStatus:(id)a4 withCompletion:(id)a5;
- (void)setAnimatedFaceLayers:(id)a3;
- (void)setLayerMappingLeft:(id)a3;
- (void)setLayerMappingRight:(id)a3;
- (void)setLeftEarStateComplete:(BOOL)a3;
- (void)setLeftPillIndex:(unint64_t)a3;
- (void)setMicaView:(id)a3;
- (void)setMiddleMinusOne:(unint64_t)a3;
- (void)setMiddlePlusOne:(unint64_t)a3;
- (void)setMiddleZero:(unint64_t)a3;
- (void)setPillsStatusArray:(id)a3;
- (void)setRightEarStateComplete:(BOOL)a3;
- (void)setRightPillIndex:(unint64_t)a3;
- (void)updatePillsForPoseStatus:(id)a3 pillCount:(unsigned int *)a4 alongSideAction:(id)a5;
@end

@implementation HPSSpatialProfileSingleStepPillContainerView

- (HPSSpatialProfileSingleStepPillContainerView)initWithFrame:(CGRect)a3
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)HPSSpatialProfileSingleStepPillContainerView;
  v3 = -[HPSSpatialProfileSingleStepPillContainerView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_rightEarStateComplete = 0;
    v3->_leftEarStateComplete = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    animatedFaceLayers = v4->_animatedFaceLayers;
    v4->_animatedFaceLayers = (NSMutableSet *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:33];
    pillsStatusArray = v4->_pillsStatusArray;
    v4->_pillsStatusArray = (NSMutableArray *)v7;

    uint64_t v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    do
      [(NSMutableArray *)v4->_pillsStatusArray setObject:v10 atIndexedSubscript:v9++];
    while (v9 != 33);
    v4->_middleZero = 16;
    v4->_middleMinusOne = 15;
    v4->_middlePlusOne = 17;
    v4->_leftPillIndex = 1;
    v4->_rightPillIndex = 1;
    id v11 = objc_alloc(MEMORY[0x1E4F4F8A0]);
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v11 initWithPackageName:@"Lines_Layout" inBundle:v12];
    micaView = v4->_micaView;
    v4->_micaView = (BSUICAPackageView *)v13;

    [(BSUICAPackageView *)v4->_micaView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HPSSpatialProfileSingleStepPillContainerView *)v4 addSubview:v4->_micaView];
    layerMappingLeft = v4->_layerMappingLeft;
    v4->_layerMappingLeft = (NSArray *)&unk_1F40ABB00;

    layerMappingRight = v4->_layerMappingRight;
    v4->_layerMappingRight = (NSArray *)&unk_1F40ABB18;

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(BSUICAPackageView *)v4->_micaView leadingAnchor];
    v31 = [(HPSSpatialProfileSingleStepPillContainerView *)v4 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v34[0] = v30;
    v29 = [(BSUICAPackageView *)v4->_micaView trailingAnchor];
    v28 = [(HPSSpatialProfileSingleStepPillContainerView *)v4 trailingAnchor];
    v17 = [v29 constraintEqualToAnchor:v28];
    v34[1] = v17;
    v18 = [(BSUICAPackageView *)v4->_micaView topAnchor];
    v19 = [(HPSSpatialProfileSingleStepPillContainerView *)v4 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v34[2] = v20;
    v21 = [(BSUICAPackageView *)v4->_micaView bottomAnchor];
    v22 = [(HPSSpatialProfileSingleStepPillContainerView *)v4 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v34[3] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    [v27 activateConstraints:v24];

    v25 = [(BSUICAPackageView *)v4->_micaView publishedObjectWithName:@"mid_0"];
    [(BSUICAPackageView *)v4->_micaView setState:@"Min" onLayer:v25 animated:0 transitionSpeed:0 completion:1.0];
  }
  return v4;
}

- (void)updatePillsForPoseStatus:(id)a3 pillCount:(unsigned int *)a4 alongSideAction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 yawAngles];
  uint64_t v10 = [v9 debugDescription];
  NSLog(&cfstr_SpatialProfile_18.isa, v10);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke;
  v27[3] = &unk_1E6EA8278;
  id v11 = v8;
  id v28 = v11;
  [(HPSSpatialProfileSingleStepPillContainerView *)self animateFaceAnglesIfneeded:v7 withCompletion:v27];
  v12 = [v7 yawAngles];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    uint64_t v14 = 0;
    unsigned int v15 = 1;
    do
    {
      v16 = [v7 yawAngles];
      v17 = [v16 objectAtIndexedSubscript:v14];

      if ([v17 captured])
      {
        v18 = [(NSMutableArray *)self->_pillsStatusArray objectAtIndexedSubscript:v14];
        char v19 = [v18 BOOLValue];

        if ((v19 & 1) == 0)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_3;
          v24[3] = &unk_1E6EA8D40;
          id v25 = v11;
          v26 = a4;
          [(HPSSpatialProfileSingleStepPillContainerView *)self fillPill:v14 updatePillsForPoseStatus:v7 withCompletion:v24];
        }
      }

      uint64_t v14 = v15;
      v20 = [v7 yawAngles];
      unint64_t v21 = [v20 count];
    }
    while (v21 > v15++);
  }
}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_4;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  uint64_t v1 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_4(uint64_t result)
{
  return result;
}

- (void)fillPill:(unint64_t)a3 updatePillsForPoseStatus:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t leftPillIndex = self->_leftPillIndex;
  unint64_t rightPillIndex = self->_rightPillIndex;
  [v8 currentYawAngle];
  NSLog(&cfstr_SpatialProfile_19.isa, a3, leftPillIndex, rightPillIndex, v12);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke;
  block[3] = &unk_1E6EA8DE0;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a3;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke(uint64_t a1)
{
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2 == v3[60] || v2 == v3[59])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2;
    v22[3] = &unk_1E6EA8D68;
    objc_copyWeak(&v24, &location);
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    [v3 animateFaceAnglesIfneeded:v4 withCompletion:v22];

    objc_destroyWeak(&v24);
    goto LABEL_20;
  }
  uint64_t v5 = (void *)[objc_alloc(NSNumber) initWithBool:1];
  [*(id *)(*(void *)(a1 + 32) + 416) setObject:v5 atIndexedSubscript:*(void *)(a1 + 56)];

  unint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(v7 + 464);
  if (v6 < v8)
  {
    uint64_t v9 = 448;
    unint64_t v10 = *(void *)(v7 + 448);
    if (v10 >= 6)
    {
      unint64_t v11 = [*(id *)(v7 + 432) count];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v10 < v11)
      {
        uint64_t v12 = [*(id *)(v7 + 432) objectAtIndexedSubscript:*(void *)(v7 + 448)];
LABEL_13:
        unsigned int v15 = (__CFString *)v12;
        uint64_t v7 = *(void *)(a1 + 32);
LABEL_15:
        ++*(void *)(v7 + v9);
        goto LABEL_16;
      }
    }
    goto LABEL_14;
  }
  if (v6 > v8)
  {
    uint64_t v9 = 456;
    unint64_t v13 = *(void *)(v7 + 456);
    if (v13 >= 6)
    {
      unint64_t v14 = [*(id *)(v7 + 440) count];
      uint64_t v7 = *(void *)(a1 + 32);
      if (v13 < v14)
      {
        uint64_t v12 = [*(id *)(v7 + 440) objectAtIndexedSubscript:*(void *)(v7 + 456)];
        goto LABEL_13;
      }
    }
LABEL_14:
    unsigned int v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(v7 + 416), "setObject:atIndexedSubscript:", &unk_1F40ABBF0);
  unsigned int v15 = @"mid_0";
LABEL_16:
  id v16 = [*(id *)(*(void *)(a1 + 32) + 424) publishedObjectWithName:v15];
  NSLog(&cfstr_SpatialProfile_21.isa, *(void *)(a1 + 56), v15, *(void *)(*(void *)(a1 + 32) + 448), *(void *)(*(void *)(a1 + 32) + 456));
  if (v15)
  {
    dispatch_time_t v17 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_120;
    block[3] = &unk_1E6EA8DB8;
    block[4] = *(void *)(a1 + 32);
    id v19 = v16;
    objc_copyWeak(&v21, &location);
    id v20 = *(id *)(a1 + 48);
    dispatch_after(v17, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v21);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_20:
  objc_destroyWeak(&location);
}

uint64_t __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void *)(*(void *)(a1 + 32) + 456) == *(void *)(*(void *)(a1 + 32) + 464);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setRightEarStateComplete:v2];

  BOOL v5 = *(void *)(*(void *)(a1 + 32) + 448) == *(void *)(*(void *)(a1 + 32) + 464);
  id v6 = objc_loadWeakRetained(v3);
  [v6 setLeftEarStateComplete:v5];

  id v7 = objc_loadWeakRetained(v3);
  LODWORD(v6) = [v7 rightEarStateComplete];
  id v8 = objc_loadWeakRetained(v3);
  unsigned int v9 = [v8 leftEarStateComplete];
  id v10 = objc_loadWeakRetained(v3);
  unint64_t v11 = [v10 pillsStatusArray];
  uint64_t v12 = [v11 componentsJoinedByString:@","];
  NSLog(&cfstr_SpatialProfile_20.isa, v6, v9, v12);

  unint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v13();
}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_120(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 424);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2_124;
  v4[3] = &unk_1E6EA8D90;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v3 setState:@"Max" onLayer:v2 animated:1 transitionSpeed:v4 completion:1.0];

  objc_destroyWeak(&v6);
}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2_124(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_3;
  block[3] = &unk_1E6EA8D68;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

uint64_t __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_3(uint64_t a1)
{
  BOOL v2 = *(void *)(*(void *)(a1 + 32) + 456) == *(void *)(*(void *)(a1 + 32) + 464);
  v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setRightEarStateComplete:v2];

  BOOL v5 = *(void *)(*(void *)(a1 + 32) + 448) == *(void *)(*(void *)(a1 + 32) + 464);
  id v6 = objc_loadWeakRetained(v3);
  [v6 setLeftEarStateComplete:v5];

  id v7 = objc_loadWeakRetained(v3);
  LODWORD(v6) = [v7 rightEarStateComplete];
  id v8 = objc_loadWeakRetained(v3);
  unsigned int v9 = [v8 leftEarStateComplete];
  id v10 = objc_loadWeakRetained(v3);
  unint64_t v11 = [v10 pillsStatusArray];
  uint64_t v12 = [v11 componentsJoinedByString:@","];
  NSLog(&cfstr_SpatialProfile_20.isa, v6, v9, v12);

  unint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v13();
}

- (void)animateFaceAnglesIfneeded:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke;
  block[3] = &unk_1E6EA82C8;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) currentYawAngle];
  if (v2 == -100.0)
  {
    NSLog(&cfstr_SpatialProfile_22.isa);
  }
  else
  {
    [*(id *)(a1 + 32) currentYawAngle];
    BOOL v4 = v3 < 0.0;
    [*(id *)(a1 + 32) currentYawAngle];
    double v6 = v5;
    id v7 = [*(id *)(a1 + 32) yawAngles];
    id v8 = [v7 objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 480)];
    int v9 = [v8 captured];

    id v10 = [*(id *)(a1 + 32) yawAngles];
    id v11 = [v10 objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 472)];
    int v12 = [v11 captured];

    if (v12
      && ([*(id *)(*(void *)(a1 + 40) + 416) objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 472)], id v13 = objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "intValue"), v13, !v14))
    {
      [*(id *)(*(void *)(a1 + 40) + 416) setObject:&unk_1F40ABC20 atIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 472)];
      id v19 = [*(id *)(a1 + 40) pillsStatusArray];
      id v20 = [v19 componentsJoinedByString:@","];
      NSLog(&cfstr_SpatialProfile_23.isa, v20);

      BOOL v4 = 1;
      unint64_t v18 = &unk_1F40ABB30;
    }
    else if (v9 {
           && ([*(id *)(*(void *)(a1 + 40) + 416) objectAtIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 480)], unsigned int v15 = objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "intValue"), v15, !v16))
    }
    {
      [*(id *)(*(void *)(a1 + 40) + 416) setObject:&unk_1F40ABC20 atIndexedSubscript:*(void *)(*(void *)(a1 + 40) + 480)];
      id v21 = [*(id *)(a1 + 40) pillsStatusArray];
      v22 = [v21 componentsJoinedByString:@","];
      NSLog(&cfstr_SpatialProfile_24.isa, v22);

      BOOL v4 = 0;
      unint64_t v18 = &unk_1F40ABB48;
    }
    else
    {
      double v17 = fabs(v6);
      if (v17 >= 24.0)
      {
        unint64_t v18 = &unk_1F40ABB60;
      }
      else if (v17 >= 18.0)
      {
        unint64_t v18 = &unk_1F40ABB78;
      }
      else if (v17 >= 12.0)
      {
        unint64_t v18 = &unk_1F40ABB90;
      }
      else if (v17 >= 6.0)
      {
        unint64_t v18 = &unk_1F40ABBA8;
      }
      else
      {
        unint64_t v18 = 0;
      }
    }
    id location = 0;
    objc_initWeak(&location, *(id *)(a1 + 40));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_165;
    v24[3] = &unk_1E6EA8E58;
    BOOL v27 = v4;
    objc_copyWeak(&v26, &location);
    id v23 = *(void **)(a1 + 48);
    void v24[4] = *(void *)(a1 + 40);
    char v28 = v9;
    char v29 = v12;
    id v25 = v23;
    [v18 enumerateObjectsUsingBlock:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_165(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%i", objc_msgSend(v3, "intValue"), *(unsigned __int8 *)(a1 + 56));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v6 = [WeakRetained animatedFaceLayers];
  char v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    int v9 = [v8 animatedFaceLayers];
    [v9 addObject:v4];

    if (*(unsigned char *)(a1 + 56)) {
      id v10 = &OBJC_IVAR___HPSSpatialProfileSingleStepPillContainerView__layerMappingLeft;
    }
    else {
      id v10 = &OBJC_IVAR___HPSSpatialProfileSingleStepPillContainerView__layerMappingRight;
    }
    id v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + *v10), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntValue"));
    int v12 = [*(id *)(*(void *)(a1 + 32) + 424) publishedObjectWithName:v11];
    dispatch_time_t v13 = dispatch_time(0, 700000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_2;
    block[3] = &unk_1E6EA8E30;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    __int16 v22 = *(_WORD *)(a1 + 57);
    uint64_t v14 = *(void *)(a1 + 32);
    unsigned int v15 = *(void **)(a1 + 40);
    id v18 = v12;
    uint64_t v19 = v14;
    id v20 = v15;
    id v16 = v12;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v21);
  }
}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_2(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v4 = [WeakRetained micaView];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_3;
  v7[3] = &unk_1E6EA8E08;
  __int16 v10 = *(_WORD *)(a1 + 64);
  objc_copyWeak(&v9, v2);
  double v6 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  [v4 setState:@"Max" onLayer:v5 animated:1 transitionSpeed:v7 completion:1.0];

  objc_destroyWeak(&v9);
}

uint64_t __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 56) || *(unsigned char *)(result + 57))
  {
    BOOL v2 = *(void *)(*(void *)(result + 32) + 456) == *(void *)(*(void *)(result + 32) + 464);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    [WeakRetained setRightEarStateComplete:v2];

    BOOL v4 = *(void *)(*(void *)(v1 + 32) + 448) == *(void *)(*(void *)(v1 + 32) + 464);
    id v5 = objc_loadWeakRetained((id *)(v1 + 48));
    [v5 setLeftEarStateComplete:v4];

    id v6 = objc_loadWeakRetained((id *)(v1 + 48));
    LODWORD(v5) = [v6 rightEarStateComplete];
    id v7 = objc_loadWeakRetained((id *)(v1 + 48));
    unsigned int v8 = [v7 leftEarStateComplete];
    id v9 = objc_loadWeakRetained((id *)(v1 + 48));
    __int16 v10 = [v9 pillsStatusArray];
    id v11 = [v10 componentsJoinedByString:@","];
    NSLog(&cfstr_SpatialProfile_20.isa, v5, v8, v11);

    int v12 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v12();
  }
  return result;
}

- (BOOL)leftSectionCompleted
{
  BOOL v3 = [(HPSSpatialProfileSingleStepPillContainerView *)self leftEarStateComplete];
  BOOL v4 = [(HPSSpatialProfileSingleStepPillContainerView *)self pillsStatusArray];
  id v5 = [v4 componentsJoinedByString:@","];
  NSLog(&cfstr_SpatialProfile_25.isa, v3, v5);

  id v6 = [(HPSSpatialProfileSingleStepPillContainerView *)self pillsStatusArray];
  id v7 = [v6 objectAtIndexedSubscript:self->_middleMinusOne];
  if ([v7 BOOLValue]) {
    BOOL v8 = [(HPSSpatialProfileSingleStepPillContainerView *)self leftEarStateComplete];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)rightSectionCompleted
{
  BOOL v3 = [(HPSSpatialProfileSingleStepPillContainerView *)self pillsStatusArray];
  BOOL v4 = [v3 objectAtIndexedSubscript:self->_middlePlusOne];
  if ([v4 BOOLValue]) {
    BOOL v5 = [(HPSSpatialProfileSingleStepPillContainerView *)self rightEarStateComplete];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSMutableArray)pillsStatusArray
{
  return self->_pillsStatusArray;
}

- (void)setPillsStatusArray:(id)a3
{
}

- (BSUICAPackageView)micaView
{
  return self->_micaView;
}

- (void)setMicaView:(id)a3
{
}

- (NSArray)layerMappingLeft
{
  return self->_layerMappingLeft;
}

- (void)setLayerMappingLeft:(id)a3
{
}

- (NSArray)layerMappingRight
{
  return self->_layerMappingRight;
}

- (void)setLayerMappingRight:(id)a3
{
}

- (unint64_t)leftPillIndex
{
  return self->_leftPillIndex;
}

- (void)setLeftPillIndex:(unint64_t)a3
{
  self->_unint64_t leftPillIndex = a3;
}

- (unint64_t)rightPillIndex
{
  return self->_rightPillIndex;
}

- (void)setRightPillIndex:(unint64_t)a3
{
  self->_unint64_t rightPillIndex = a3;
}

- (unint64_t)middleZero
{
  return self->_middleZero;
}

- (void)setMiddleZero:(unint64_t)a3
{
  self->_middleZero = a3;
}

- (unint64_t)middleMinusOne
{
  return self->_middleMinusOne;
}

- (void)setMiddleMinusOne:(unint64_t)a3
{
  self->_middleMinusOne = a3;
}

- (unint64_t)middlePlusOne
{
  return self->_middlePlusOne;
}

- (void)setMiddlePlusOne:(unint64_t)a3
{
  self->_middlePlusOne = a3;
}

- (NSMutableSet)animatedFaceLayers
{
  return self->_animatedFaceLayers;
}

- (void)setAnimatedFaceLayers:(id)a3
{
}

- (BOOL)rightEarStateComplete
{
  return self->_rightEarStateComplete;
}

- (void)setRightEarStateComplete:(BOOL)a3
{
  self->_rightEarStateComplete = a3;
}

- (BOOL)leftEarStateComplete
{
  return self->_leftEarStateComplete;
}

- (void)setLeftEarStateComplete:(BOOL)a3
{
  self->_leftEarStateComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedFaceLayers, 0);
  objc_storeStrong((id *)&self->_layerMappingRight, 0);
  objc_storeStrong((id *)&self->_layerMappingLeft, 0);
  objc_storeStrong((id *)&self->_micaView, 0);

  objc_storeStrong((id *)&self->_pillsStatusArray, 0);
}

@end