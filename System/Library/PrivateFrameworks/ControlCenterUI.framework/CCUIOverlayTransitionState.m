@interface CCUIOverlayTransitionState
+ (BOOL)isSignificantStatusBarTransitionFrom:(id)a3 to:(id)a4;
+ (BOOL)isSignificantTransitionFrom:(id)a3 to:(id)a4;
+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5;
+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6;
+ (id)fullyDismissedState;
+ (id)fullyPresentedState;
- (BOOL)isInteractive;
- (NSString)description;
- (double)clampedPresentationProgress;
- (double)nonZeroPresentationProgress;
- (double)pagingProgress;
- (double)presentationProgress;
- (double)progress;
- (double)snappedPresentationProgress;
- (double)snappedStatusBarPresentationProgress;
- (id)_initWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)type;
@end

@implementation CCUIOverlayTransitionState

+ (BOOL)isSignificantStatusBarTransitionFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isSignificantTransitionFrom:v6 to:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    [v6 snappedStatusBarPresentationProgress];
    [v7 snappedStatusBarPresentationProgress];
    int v8 = BSFloatEqualToFloat() ^ 1;
  }

  return v8;
}

- (double)snappedStatusBarPresentationProgress
{
  [(CCUIOverlayTransitionState *)self clampedPresentationProgress];
  double v3 = v2;
  double v4 = CCUIPortraitHeaderHeight();
  double v5 = v4 - CCUIStatusBarHeight();
  return fmax(fmin(floor(v3 * (v5 / (CCUIStatusBarHeight() * 0.75))), 1.0), 0.0);
}

+ (BOOL)isSignificantTransitionFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && (int v7 = [v5 isInteractive], v7 == objc_msgSend(v6, "isInteractive"))
    && (uint64_t v8 = [v5 type], v8 == objc_msgSend(v6, "type")))
  {
    [v5 snappedPresentationProgress];
    [v6 snappedPresentationProgress];
    int v9 = BSFloatEqualToFloat() ^ 1;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

+ (id)fullyDismissedState
{
  if (fullyDismissedState_onceToken != -1) {
    dispatch_once(&fullyDismissedState_onceToken, &__block_literal_global_13);
  }
  double v2 = (void *)fullyDismissedState_transitionState;

  return v2;
}

uint64_t __49__CCUIOverlayTransitionState_fullyDismissedState__block_invoke()
{
  fullyDismissedState_transitionState = +[CCUIOverlayTransitionState stateWithType:2 interactive:0 progress:1.0];

  return MEMORY[0x1F41817F8]();
}

+ (id)fullyPresentedState
{
  if (fullyPresentedState_onceToken != -1) {
    dispatch_once(&fullyPresentedState_onceToken, &__block_literal_global_13);
  }
  double v2 = (void *)fullyPresentedState_transitionState;

  return v2;
}

uint64_t __49__CCUIOverlayTransitionState_fullyPresentedState__block_invoke()
{
  fullyPresentedState_transitionState = +[CCUIOverlayTransitionState stateWithType:1 interactive:0 progress:1.0];

  return MEMORY[0x1F41817F8]();
}

+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5
{
  return (CCUIOverlayTransitionState *)[a1 stateWithType:a3 interactive:a4 progress:a5 pagingProgress:0.0];
}

+ (CCUIOverlayTransitionState)stateWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6
{
  id v6 = (void *)[objc_alloc((Class)a1) _initWithType:a3 interactive:a4 progress:a5 pagingProgress:a6];

  return (CCUIOverlayTransitionState *)v6;
}

- (id)_initWithType:(unint64_t)a3 interactive:(BOOL)a4 progress:(double)a5 pagingProgress:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CCUIOverlayTransitionState;
  id result = [(CCUIOverlayTransitionState *)&v13 init];
  if (result)
  {
    *((void *)result + 2) = a3;
    *((unsigned char *)result + 8) = a4;
    *((double *)result + 3) = a5;
    *((double *)result + 4) = a6;
    double v11 = 1.0 - a5;
    if (a3 != 2) {
      double v11 = a5;
    }
    double v12 = fmax(fmin(v11, 1.0), 0.0);
    *((double *)result + 5) = v11;
    *((double *)result + 6) = v12;
    *((double *)result + 7) = fmax(v11, 0.0);
    *((double *)result + 8) = floor(v12);
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(CCUIOverlayTransitionState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  double v2 = [(CCUIOverlayTransitionState *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(CCUIOverlayTransitionState *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIOverlayTransitionState *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CCUIOverlayTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6A89968;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __68__CCUIOverlayTransitionState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = NSStringFromCCUIOverlayTransitionType(*(void *)(*(void *)(a1 + 40) + 16));
  [v2 appendString:v3 withName:@"type"];

  id v4 = (id)[*(id *)(a1 + 32) appendFloat:@"progress" withName:*(double *)(*(void *)(a1 + 40) + 24)];
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"pagingProgress" withName:*(double *)(*(void *)(a1 + 40) + 32)];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"interactive"];
  id v7 = (id)[*(id *)(a1 + 32) appendFloat:@"presentationProgress" withName:*(double *)(*(void *)(a1 + 40) + 40)];
  id v8 = (id)[*(id *)(a1 + 32) appendFloat:@"clampedPresentationProgress" withName:*(double *)(*(void *)(a1 + 40) + 48)];
  id v9 = (id)[*(id *)(a1 + 32) appendFloat:@"nonZeroPresentationProgress" withName:*(double *)(*(void *)(a1 + 40) + 56)];
  return (id)[*(id *)(a1 + 32) appendFloat:@"snappedPresentationProgress" withName:*(double *)(*(void *)(a1 + 40) + 64)];
}

- (unint64_t)type
{
  return self->_type;
}

- (double)progress
{
  return self->_progress;
}

- (double)pagingProgress
{
  return self->_pagingProgress;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (double)clampedPresentationProgress
{
  return self->_clampedPresentationProgress;
}

- (double)nonZeroPresentationProgress
{
  return self->_nonZeroPresentationProgress;
}

- (double)snappedPresentationProgress
{
  return self->_snappedPresentationProgress;
}

@end