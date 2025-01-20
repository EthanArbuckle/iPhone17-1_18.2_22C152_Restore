@interface CRNFluidSplitViewInteraction
+ (id)newWithSplitViewController:(id)a3;
- (id)composerBlock;
@end

@implementation CRNFluidSplitViewInteraction

+ (id)newWithSplitViewController:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;
  id v6 = v3;

  uint64_t v7 = [v6 viewControllerForColumn:1];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [v6 viewControllerForColumn:0];
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (id)composerBlock
{
  id v3 = [(UIViewController *)self->_supplementalController view];
  double v4 = CRNViewFrameInWindow(v3);
  double MidpointAlongSide = CRNCGRectGetMidpointAlongSide(1, v4, v5, v6, v7);
  uint64_t v10 = v9;

  v11 = [(UIViewController *)self->_supplementalController view];
  double v12 = CRNViewFrameInWindow(v11);
  double v16 = CRNCGRectGetMidpointAlongSide(3, v12, v13, v14, v15);
  uint64_t v18 = v17;

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __45__CRNFluidSplitViewInteraction_composerBlock__block_invoke;
  v21[3] = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
  *(double *)&v21[4] = MidpointAlongSide;
  v21[5] = v10;
  *(double *)&v21[6] = v16;
  v21[7] = v18;
  v19 = (void *)MEMORY[0x237E0E480](v21);
  return v19;
}

void __45__CRNFluidSplitViewInteraction_composerBlock__block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "touchDown:", v3, v4);
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 1.0);
  [v5 advanceTime:0.2];
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 1.0);
  [v5 advanceTime:0.2];
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 0.6);
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 0.6);
  objc_msgSend(v5, "moveToPoint:duration:", a1[6], a1[7], 0.3);
  objc_msgSend(v5, "moveToPoint:duration:", a1[4], a1[5], 0.3);
  objc_msgSend(v5, "liftUp:", a1[4], a1[5]);
  [v5 advanceTime:0.5];
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.6);
  [v5 advanceTime:2.0];
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", a1[6], a1[7], a1[4], a1[5], 0.6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryController, 0);
  objc_storeStrong((id *)&self->_supplementalController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
}

@end