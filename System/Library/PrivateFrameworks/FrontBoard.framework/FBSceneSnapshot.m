@interface FBSceneSnapshot
- (BOOL)capture;
- (BOOL)hasProtectedContent;
- (CGAffineTransform)_baseTransformForSnapshotContext:(SEL)a3 rootContext:(id)a4;
- (CGImage)CGImage;
- (FBSceneSnapshot)initWithScene:(id)a3 snapshotContext:(id)a4;
- (FBSceneSnapshotContext)context;
- (IOSurface)IOSurface;
- (IOSurface)fallbackIOSurface;
- (id)_collectLayersToSnapshotFromScene:(id)a3 withSnapshotContext:(id)a4 rootContext:(id)a5;
@end

@implementation FBSceneSnapshot

- (FBSceneSnapshot)initWithScene:(id)a3 snapshotContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) { {
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneSnapshot initWithScene:snapshotContext:]");
  }
  }
  v27.receiver = self;
  v27.super_class = (Class)FBSceneSnapshot;
  v9 = [(FBSceneSnapshot *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scene, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = [(FBSceneSnapshot *)v10 _collectLayersToSnapshotFromScene:v10->_scene withSnapshotContext:v8 rootContext:v8];
    id v12 = objc_alloc(MEMORY[0x1E4F62B50]);
    v13 = [v7 settings];
    v14 = [v13 displayConfiguration];
    v15 = (void *)[v12 initWithDisplayConfiguration:v14 layers:v11];

    objc_msgSend(v15, "setOpaque:", objc_msgSend(v8, "isOpaque"));
    [v8 scale];
    objc_msgSend(v15, "setScale:");
    v16 = [v8 clientExtendedData];
    objc_msgSend(v15, "setAllowsProtectedContent:", objc_msgSend(v16, "BOOLForSetting:", 281330800));

    [v8 frame];
    double v18 = v17;
    double v20 = v19;
    if (![v8 orientation])
    {
      v21 = [v8 settings];
      [v21 interfaceOrientation];
      int IsLandscape = BSInterfaceOrientationIsLandscape();

      if (IsLandscape) { {
        double v23 = v18;
      }
      }
      else {
        double v23 = v20;
      }
      if (IsLandscape) { {
        double v18 = v20;
      }
      }
      double v20 = v23;
    }
    objc_msgSend(v15, "setSnapshotSize:", v18, v20);
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F62B48]) initWithSnapshotContext:v15];
    snapshot = v10->_snapshot;
    v10->_snapshot = (_FBSSnapshot *)v24;
  }
  return v10;
}

- (BOOL)hasProtectedContent
{
  v2 = [(FBSceneSnapshot *)self fallbackIOSurface];
  BOOL v3 = v2 != 0;

  return v3;
}

- (IOSurface)IOSurface
{
  return (IOSurface *)[(_FBSSnapshot *)self->_snapshot IOSurface];
}

- (CGImage)CGImage
{
  return (CGImage *)[(_FBSSnapshot *)self->_snapshot CGImage];
}

- (BOOL)capture
{
  return [(_FBSSnapshot *)self->_snapshot capture];
}

- (IOSurface)fallbackIOSurface
{
  return (IOSurface *)[(_FBSSnapshot *)self->_snapshot fallbackIOSurface];
}

- (id)_collectLayersToSnapshotFromScene:(id)a3 withSnapshotContext:(id)a4 rootContext:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v8;
  id v11 = v9;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1E4F1CA70];
  v14 = [v8 layerManager];
  v15 = [v14 layers];
  v16 = [v13 orderedSetWithOrderedSet:v15];

  double v17 = [v11 layersToExclude];
  [v16 minusSet:v17];

  uint64_t v18 = [MEMORY[0x1E4F1CA70] orderedSet];
  memset(&v69, 0, sizeof(v69));
  v53 = self;
  v54 = v12;
  double v19 = self;
  double v20 = (void *)v18;
  v50 = v11;
  [(FBSceneSnapshot *)v19 _baseTransformForSnapshotContext:v11 rootContext:v12];
  memset(&v68, 0, sizeof(v68));
  CGAffineTransform m = v69;
  CATransform3DMakeAffineTransform(&v68, &m);
  v21 = &off_1E5C49000;
  v51 = +[FBSceneManager keyboardScene];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v22 = v16;
  uint64_t v57 = [v22 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v57)
  {
    uint64_t v23 = *(void *)v65;
    id v52 = v22;
    uint64_t v56 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v65 != v23) { {
          objc_enumerationMutation(v22);
        }
        }
        v25 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v26 = [v25 contextID];
        if (v26)
        {
          uint64_t v27 = v26;
          id v28 = objc_alloc(MEMORY[0x1E4F62B58]);
          long long v60 = *(_OWORD *)&v68.m31;
          long long v61 = *(_OWORD *)&v68.m33;
          long long v62 = *(_OWORD *)&v68.m41;
          long long v63 = *(_OWORD *)&v68.m43;
          *(_OWORD *)&m.a = *(_OWORD *)&v68.m11;
          *(_OWORD *)&m.c = *(_OWORD *)&v68.m13;
          *(_OWORD *)&m.tx = *(_OWORD *)&v68.m21;
          long long v59 = *(_OWORD *)&v68.m23;
          v29 = (FBSceneSnapshotContext *)[v28 initWithContextID:v27 baseTransform:&m];
          if (v29) { {
            [v20 addObject:v29];
          }
          }
          goto LABEL_24;
        }
        v30 = [v25 externalSceneID];

        if (v30)
        {
          v31 = [v21[82] sharedInstance];
          v32 = [v25 externalSceneID];
          v29 = [v31 sceneWithIdentifier:v32];

          v33 = [v10 identifier];
          v34 = [(FBSceneSnapshotContext *)v29 clientSettings];
          v35 = [v34 preferredSceneHostIdentifier];
          if ([v33 isEqualToString:v35])
          {

LABEL_16:
            v43 = [[FBSceneSnapshotContext alloc] initWithScene:v29];
            v44 = [(FBSceneSnapshot *)v53 _collectLayersToSnapshotFromScene:v29 withSnapshotContext:v43 rootContext:v54];
            uint64_t v23 = v56;
            if ([v44 count]) { {
              [v20 unionOrderedSet:v44];
            }
            }

            goto LABEL_24;
          }
          v38 = [v10 identityToken];
          [(FBSceneSnapshotContext *)v29 clientSettings];
          v39 = v20;
          v41 = v40 = v10;
          v42 = [v41 preferredSceneHostIdentity];
          int v55 = BSEqualObjects();

          id v22 = v52;
          v10 = v40;
          double v20 = v39;
          v21 = &off_1E5C49000;

          if (v55) { {
            goto LABEL_16;
          }
          }
          uint64_t v23 = v56;
LABEL_24:

          continue;
        }
        if ([v25 isKeyboardLayer])
        {
          if (v51 != v10) { {
            continue;
          }
          }
          v29 = [[FBSceneSnapshotContext alloc] initWithScene:v10];
          v36 = v53;
          v37 = v10;
LABEL_22:
          v48 = [(FBSceneSnapshot *)v36 _collectLayersToSnapshotFromScene:v37 withSnapshotContext:v29 rootContext:v54];
          [v20 unionOrderedSet:v48];

          id v22 = v52;
          goto LABEL_24;
        }
        if ([v25 isKeyboardProxyLayer])
        {
          v45 = [v51 identityToken];
          v46 = [v25 proxiedKeyboardOwner];
          int v47 = [v45 isEqual:v46];

          id v22 = v52;
          if (v47)
          {
            v29 = [[FBSceneSnapshotContext alloc] initWithScene:v51];
            v36 = v53;
            v37 = v51;
            goto LABEL_22;
          }
        }
      }
      uint64_t v57 = [v22 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v57);
  }

  return v20;
}

- (CGAffineTransform)_baseTransformForSnapshotContext:(SEL)a3 rootContext:(id)a4
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = MEMORY[0x1E4F1DAB8];
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v47 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v46;
  long long v45 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tx = v45;
  id v11 = [v8 settings];
  uint64_t v12 = [v11 interfaceOrientation];

  if (BSInterfaceOrientationIsValid()) { {
    uint64_t v13 = v12;
  }
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = [v9 settings];
  uint64_t v15 = [v14 interfaceOrientation];

  int IsValid = BSInterfaceOrientationIsValid();
  double v17 = [(FBScene *)self->_scene settings];
  uint64_t v18 = [v17 displayConfiguration];
  [v18 bounds];

  [v9 frame];
  double v20 = v19;
  double v22 = v21;
  if ([v9 orientation])
  {
    uint64_t v23 = 1;
  }
  else
  {
    if (IsValid) { {
      uint64_t v23 = v15;
    }
    }
    else {
      uint64_t v23 = 1;
    }
    int IsLandscape = BSInterfaceOrientationIsLandscape();
    if (IsLandscape) { {
      double v25 = v20;
    }
    }
    else {
      double v25 = v22;
    }
    if (IsLandscape) { {
      double v20 = v22;
    }
    }
    double v22 = v25;
  }
  if (v13 != v23)
  {
    uint64_t v26 = [v8 settings];
    [v26 frame];

    if (v13 != 1) { {
      BSConvertRectFromOrientationToOrientation();
    }
    }
    BSRectGetCenter();
    memset(&v54, 0, sizeof(v54));
    CGAffineTransformMakeTranslation(&v54, -v27, -v28);
    *(_OWORD *)&t1.a = v47;
    *(_OWORD *)&t1.c = v46;
    *(_OWORD *)&t1.tx = v45;
    CGAffineTransform t2 = v54;
    CGAffineTransformConcat(retstr, &t1, &t2);
    if (v13 != 1)
    {
      if (v13 == 3)
      {
        double v29 = 1.57079633;
      }
      else if (v13 == 4)
      {
        double v29 = -1.57079633;
      }
      else
      {
        double v29 = 3.14159265;
        if (v13 != 2) { {
          double v29 = 0.0;
        }
        }
      }
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeRotation(&v51, v29);
      BSIntegralTransform();
      long long v30 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v30;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransform v49 = t1;
      CGAffineTransformConcat(&t2, &v50, &v49);
      long long v31 = *(_OWORD *)&t2.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
      *(_OWORD *)&retstr->c = v31;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
    }
    if (v23 != 1)
    {
      if (v23 == 3)
      {
        double v32 = 1.57079633;
      }
      else if (v23 == 4)
      {
        double v32 = -1.57079633;
      }
      else
      {
        double v32 = 3.14159265;
        if (v23 != 2) { {
          double v32 = 0.0;
        }
        }
      }
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeRotation(&v48, -v32);
      BSIntegralTransform();
      long long v33 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v33;
      *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransform v49 = t1;
      CGAffineTransformConcat(&t2, &v50, &v49);
      long long v34 = *(_OWORD *)&t2.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
      *(_OWORD *)&retstr->c = v34;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
      BSConvertRectFromOrientationToOrientation();
    }
    BSRectGetCenter();
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeTranslation(&t1, v35, v36);
    long long v37 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v37;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransform v49 = t1;
    CGAffineTransformConcat(&t2, &v50, &v49);
    long long v38 = *(_OWORD *)&t2.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
    *(_OWORD *)&retstr->c = v38;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  }
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeTranslation(&v54, -v20, -v22);
  long long v39 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v39;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransform v50 = v54;
  CGAffineTransformConcat(&t1, &t2, &v50);
  long long v40 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v40;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  [v9 scale];
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v41, v41);
  long long v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v50.c = v42;
  *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransform v49 = t1;
  CGAffineTransformConcat(&t2, &v50, &v49);
  long long v43 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v43;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;

  return result;
}

- (FBSceneSnapshotContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end