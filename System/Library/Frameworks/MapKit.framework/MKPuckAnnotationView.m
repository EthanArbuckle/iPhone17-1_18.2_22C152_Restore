@interface MKPuckAnnotationView
@end

@implementation MKPuckAnnotationView

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLegacyConfiguration];
}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (_MKLinkedOnOrAfterReleaseSet(3081)) {
      char BOOL = GEOConfigGetBOOL();
    }
    else {
      char BOOL = 0;
    }
    *((unsigned char *)v3 + 1136) = BOOL;
    objc_msgSend(*((id *)v3 + 154), "setFaux3DEnabled:");
    [v3 _updateBaseImage];
    [v3 _updateShadowImage];
    [v3 _createOrRemoveFaux3DRingsIfNecessary];
    [v3 _updateFaux3DColors];
    [v3 _updateFaux3DLayers];
    id WeakRetained = v3;
  }
}

uint64_t __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GEOConfigGetDouble();
  objc_msgSend(WeakRetained, "_setMinimumAccuracyRadius:");
}

void __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOConfigGetDouble();
    WeakRetained[175] = v1;
    [WeakRetained _updateFromMap];
  }
}

uint64_t __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) removeAnimationForKey:@"show/hide"];
  [*(id *)(*(void *)(a1 + 32) + 1120) removeFromSuperlayer];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1120);
  *(void *)(v2 + 1120) = 0;

  [*(id *)(*(void *)(a1 + 32) + 1112) removeFromSuperlayer];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 1112);
  *(void *)(v4 + 1112) = 0;

  [*(id *)(*(void *)(a1 + 32) + 1232) removeAnimationForKey:@"show/hide"];
  v6 = *(void **)(*(void *)(a1 + 32) + 1024);

  return [v6 removeAnimationForKey:@"show/hide"];
}

id __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F39BE8] layer];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1112);
  *(void *)(v3 + 1112) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "_mapkit_setActionsToRemoveDefaultImplicitActions");
  [*(id *)(*(void *)(a1 + 32) + 1080) position];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "setPosition:");
  v5 = [*(id *)(a1 + 32) layer];
  [v5 insertSublayer:*(void *)(*(void *)(a1 + 32) + 1112) above:*(void *)(*(void *)(a1 + 32) + 1024)];

  v6 = [*(id *)(a1 + 32) _createFakePuckLayer];
  objc_msgSend(v6, "setPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 1024);
  if (v8)
  {
    [v8 transform];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  v9 = *(void **)(v7 + 1112);
  v21[4] = v26;
  v21[5] = v27;
  v21[6] = v28;
  v21[7] = v29;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  v21[3] = v25;
  [v9 setTransform:v21];
  v10 = *(void **)(*(void *)(a1 + 32) + 1096);
  if (v10)
  {
    [v10 transform];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  v12[4] = v17;
  v12[5] = v18;
  v12[6] = v19;
  v12[7] = v20;
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  v12[3] = v16;
  [v6 setTransform:v12];
  [*(id *)(*(void *)(a1 + 32) + 1112) addSublayer:v6];

  return v6;
}

void __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperlayer];
  [*(id *)(a1 + 40) removeFromSuperlayer];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2 == *(void **)(v3 + 1120))
  {
    *(void *)(v3 + 1120) = 0;

    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(void **)(v4 + 1112);
    *(void *)(v4 + 1112) = 0;
  }
}

void __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = +[MKThreadContext currentContext];
  objc_msgSend(v2, "_CA_setDisableActions:", 1);

  [*(id *)(*(void *)(a1 + 32) + 1224) setHidden:0];
  [*(id *)(a1 + 40) removeFromSuperlayer];
  [*(id *)(a1 + 48) removeFromSuperlayer];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3 == *(void **)(v4 + 1120))
  {
    *(void *)(v4 + 1120) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 1112);
    *(void *)(v5 + 1112) = 0;

    [*(id *)(*(void *)(a1 + 32) + 1232) removeAnimationForKey:@"show/hide"];
  }
  id v7 = +[MKThreadContext currentContext];
  objc_msgSend(v7, "_CA_setDisableActions:", 0);
}

void __42___MKPuckAnnotationView__updateGlyphImage__block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() innerDiameter];
  double v3 = v2 + -8.0;
  [*(id *)(*(void *)(a1 + 32) + 1040) size];
  double v4 = v3;
  if (v5 < v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 1040) size];
    double v4 = v6;
  }
  [*(id *)(*(void *)(a1 + 32) + 1040) size];
  if (v7 < v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 1040) size];
    double v3 = v8;
  }
  [*(id *)(*(void *)(a1 + 32) + 1176) bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  long long v17 = [*(id *)(a1 + 32) layer];
  [v17 contentsScale];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1056), "setFrame:", round(v18 * (v10 + (v14 - v4) * 0.5)) / v18, round(v18 * (v12 + (v16 - v3) * 0.5)) / v18, v4, v3);

  id v19 = *(id *)(*(void *)(a1 + 32) + 1040);
  if ([v19 renderingMode] != 1)
  {
    uint64_t v20 = objc_msgSend(v19, "_mapkit_templateImageWithTintColor:", *(void *)(*(void *)(a1 + 32) + 1048));

    id v19 = (id)v20;
  }
  id v21 = v19;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1056), "setContents:", objc_msgSend(v21, "CGImage"));
}

uint64_t __37___MKPuckAnnotationView__removePulse__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1224) removeFromSuperlayer];
  }
  return result;
}

uint64_t __68___MKPuckAnnotationView__updateShowHeadingLayer_animatedIfPossible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

@end