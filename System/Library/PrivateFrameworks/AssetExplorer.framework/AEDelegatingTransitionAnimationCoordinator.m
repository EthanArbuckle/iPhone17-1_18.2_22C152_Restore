@interface AEDelegatingTransitionAnimationCoordinator
- (AEDelegatingTransitionAnimationCoordinator)initWithWrappedCoordinator:(id)a3;
- (BOOL)enableDoubleSidedAnimations;
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (PXTileTransitionAnimationCoordinator)_wrappedCoordinator;
- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8;
- (void)setEnableDoubleSidedAnimations:(BOOL)a3;
@end

@implementation AEDelegatingTransitionAnimationCoordinator

- (void).cxx_destruct
{
}

- (PXTileTransitionAnimationCoordinator)_wrappedCoordinator
{
  return self->__wrappedCoordinator;
}

- (void)setEnableDoubleSidedAnimations:(BOOL)a3
{
  self->_enableDoubleSidedAnimations = a3;
}

- (BOOL)enableDoubleSidedAnimations
{
  return self->_enableDoubleSidedAnimations;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  if (![(AEDelegatingTransitionAnimationCoordinator *)self enableDoubleSidedAnimations]) {
    goto LABEL_6;
  }
  v14 = [(AEDelegatingTransitionAnimationCoordinator *)self _wrappedCoordinator];
  long long v15 = *(_OWORD *)&a3->var1[5];
  v34[2] = *(_OWORD *)&a3->var1[3];
  v34[3] = v15;
  v34[4] = *(_OWORD *)&a3->var1[7];
  unint64_t v35 = a3->var1[9];
  long long v16 = *(_OWORD *)&a3->var1[1];
  v34[0] = *(_OWORD *)&a3->var0;
  v34[1] = v16;
  long long v17 = *(_OWORD *)&a4->var7.height;
  v33[8] = *(_OWORD *)&a4->var6;
  v33[9] = v17;
  long long v18 = *(_OWORD *)&a4->var8.size.height;
  v33[10] = *(_OWORD *)&a4->var8.origin.y;
  v33[11] = v18;
  long long v19 = *(_OWORD *)&a4->var3.c;
  v33[4] = *(_OWORD *)&a4->var3.a;
  v33[5] = v19;
  long long v20 = *(_OWORD *)&a4->var4;
  v33[6] = *(_OWORD *)&a4->var3.tx;
  v33[7] = v20;
  CGSize size = a4->var0.size;
  v33[0] = a4->var0.origin;
  v33[1] = size;
  CGSize var2 = a4->var2;
  v33[2] = a4->var1;
  v33[3] = var2;
  long long v23 = *(_OWORD *)&a6->var7.height;
  v32[8] = *(_OWORD *)&a6->var6;
  v32[9] = v23;
  long long v24 = *(_OWORD *)&a6->var8.size.height;
  v32[10] = *(_OWORD *)&a6->var8.origin.y;
  v32[11] = v24;
  long long v25 = *(_OWORD *)&a6->var3.c;
  v32[4] = *(_OWORD *)&a6->var3.a;
  v32[5] = v25;
  long long v26 = *(_OWORD *)&a6->var4;
  v32[6] = *(_OWORD *)&a6->var3.tx;
  v32[7] = v26;
  CGSize v27 = a6->var0.size;
  v32[0] = a6->var0.origin;
  v32[1] = v27;
  CGSize v28 = a6->var2;
  v32[2] = a6->var1;
  v32[3] = v28;
  char v29 = [v14 useDoubleSidedAnimationForUpdatedTileWithIdentifier:v34 fromGeometry:v33 fromUserData:v12 toGeometry:v32 toUserData:v13];

  if (v29)
  {
    LOBYTE(v30) = 1;
    goto LABEL_7;
  }
  if (a3->var0 - 3 > 2 || a3->var1[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    LOBYTE(v30) = 0;
    goto LABEL_7;
  }
  LOBYTE(v30) = 0;
  if (a3->var1[0] == 1215219281 && v12 != v13) {
    int v30 = [v12 isEqual:v13] ^ 1;
  }
LABEL_7:

  return v30;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  id v12 = a7;
  id v13 = [(AEDelegatingTransitionAnimationCoordinator *)self _wrappedCoordinator];
  long long v14 = *(_OWORD *)&a5->var1[5];
  v24[2] = *(_OWORD *)&a5->var1[3];
  v24[3] = v14;
  v24[4] = *(_OWORD *)&a5->var1[7];
  unint64_t v25 = a5->var1[9];
  long long v15 = *(_OWORD *)&a5->var1[1];
  v24[0] = *(_OWORD *)&a5->var0;
  v24[1] = v15;
  long long v16 = *(_OWORD *)&a6->var7.height;
  v23[8] = *(_OWORD *)&a6->var6;
  v23[9] = v16;
  long long v17 = *(_OWORD *)&a6->var8.size.height;
  v23[10] = *(_OWORD *)&a6->var8.origin.y;
  v23[11] = v17;
  long long v18 = *(_OWORD *)&a6->var3.c;
  v23[4] = *(_OWORD *)&a6->var3.a;
  v23[5] = v18;
  long long v19 = *(_OWORD *)&a6->var4;
  v23[6] = *(_OWORD *)&a6->var3.tx;
  v23[7] = v19;
  CGSize size = a6->var0.size;
  v23[0] = a6->var0.origin;
  v23[1] = size;
  CGSize var2 = a6->var2;
  v23[2] = a6->var1;
  v23[3] = var2;
  LOBYTE(a6) = [v13 getFinalGeometry:a3 finalUserData:a4 forDisappearingTileWithIdentifier:v24 fromGeometry:v23 fromUserData:v12];

  return (char)a6;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12 = a7;
  id v13 = [(AEDelegatingTransitionAnimationCoordinator *)self _wrappedCoordinator];
  long long v14 = *(_OWORD *)&a5->var1[5];
  v24[2] = *(_OWORD *)&a5->var1[3];
  v24[3] = v14;
  v24[4] = *(_OWORD *)&a5->var1[7];
  unint64_t v25 = a5->var1[9];
  long long v15 = *(_OWORD *)&a5->var1[1];
  v24[0] = *(_OWORD *)&a5->var0;
  v24[1] = v15;
  long long v16 = *(_OWORD *)&a6->var7.height;
  v23[8] = *(_OWORD *)&a6->var6;
  v23[9] = v16;
  long long v17 = *(_OWORD *)&a6->var8.size.height;
  v23[10] = *(_OWORD *)&a6->var8.origin.y;
  v23[11] = v17;
  long long v18 = *(_OWORD *)&a6->var3.c;
  v23[4] = *(_OWORD *)&a6->var3.a;
  v23[5] = v18;
  long long v19 = *(_OWORD *)&a6->var4;
  v23[6] = *(_OWORD *)&a6->var3.tx;
  v23[7] = v19;
  CGSize size = a6->var0.size;
  v23[0] = a6->var0.origin;
  v23[1] = size;
  CGSize var2 = a6->var2;
  v23[2] = a6->var1;
  v23[3] = var2;
  LOBYTE(a6) = [v13 getInitialGeometry:a3 initialUserData:a4 forAppearingTileWithIdentifier:v24 toGeometry:v23 toUserData:v12];

  return (char)a6;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  long long v16 = [(AEDelegatingTransitionAnimationCoordinator *)self _wrappedCoordinator];
  long long v17 = *(_OWORD *)&a3->var1[5];
  v35[2] = *(_OWORD *)&a3->var1[3];
  v35[3] = v17;
  v35[4] = *(_OWORD *)&a3->var1[7];
  unint64_t v36 = a3->var1[9];
  long long v18 = *(_OWORD *)&a3->var1[1];
  v35[0] = *(_OWORD *)&a3->var0;
  v35[1] = v18;
  long long v19 = *(_OWORD *)&a5->var7.height;
  v34[8] = *(_OWORD *)&a5->var6;
  v34[9] = v19;
  long long v20 = *(_OWORD *)&a5->var8.size.height;
  v34[10] = *(_OWORD *)&a5->var8.origin.y;
  v34[11] = v20;
  long long v21 = *(_OWORD *)&a5->var3.c;
  v34[4] = *(_OWORD *)&a5->var3.a;
  _OWORD v34[5] = v21;
  long long v22 = *(_OWORD *)&a5->var4;
  v34[6] = *(_OWORD *)&a5->var3.tx;
  v34[7] = v22;
  CGSize size = a5->var0.size;
  v34[0] = a5->var0.origin;
  v34[1] = size;
  CGSize var2 = a5->var2;
  v34[2] = a5->var1;
  v34[3] = var2;
  long long v25 = *(_OWORD *)&a7->var7.height;
  v33[8] = *(_OWORD *)&a7->var6;
  v33[9] = v25;
  long long v26 = *(_OWORD *)&a7->var8.size.height;
  v33[10] = *(_OWORD *)&a7->var8.origin.y;
  v33[11] = v26;
  long long v27 = *(_OWORD *)&a7->var3.c;
  v33[4] = *(_OWORD *)&a7->var3.a;
  v33[5] = v27;
  long long v28 = *(_OWORD *)&a7->var4;
  v33[6] = *(_OWORD *)&a7->var3.tx;
  v33[7] = v28;
  CGSize v29 = a7->var0.size;
  v33[0] = a7->var0.origin;
  v33[1] = v29;
  CGSize v30 = a7->var2;
  v33[2] = a7->var1;
  v33[3] = v30;
  v31 = [v16 optionsForAnimatingTileWithIdentifier:v35 animationType:a4 fromGeometry:v34 fromUserData:v15 toGeometry:v33 toUserData:v14];

  return v31;
}

- (AEDelegatingTransitionAnimationCoordinator)initWithWrappedCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEDelegatingTransitionAnimationCoordinator;
  v6 = [(AEDelegatingTransitionAnimationCoordinator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__wrappedCoordinator, a3);
    v7->_enableDoubleSidedAnimations = 1;
  }

  return v7;
}

@end