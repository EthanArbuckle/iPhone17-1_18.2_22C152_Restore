@interface CEKFluidBehaviorSettings
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)smoothingAndProjectionEnabled;
- (CAFrameRateRange)frameRateRange;
- (NSString)name;
- (double)_effectiveTrackingDampingRatio;
- (double)_effectiveTrackingResponse;
- (double)_effectiveTrackingRetargetImpulse;
- (double)dampingRatio;
- (double)dampingRatioSmoothing;
- (double)deceleration;
- (double)inertialProjectionDeceleration;
- (double)inertialTargetSmoothingRatio;
- (double)response;
- (double)responseSmoothing;
- (double)retargetImpulse;
- (double)settlingDuration;
- (double)trackingDampingRatio;
- (double)trackingDampingRatioSmoothing;
- (double)trackingResponse;
- (double)trackingResponseSmoothing;
- (double)trackingRetargetImpulse;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)behaviorType;
- (unint64_t)hash;
- (unsigned)highFrameRateReason;
- (void)setBehaviorType:(int64_t)a3;
- (void)setDampingRatio:(double)a3;
- (void)setDampingRatioSmoothing:(double)a3;
- (void)setDeceleration:(double)a3;
- (void)setDefaultCriticallyDampedValues;
- (void)setDefaultValues;
- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)setInertialProjectionDeceleration:(double)a3;
- (void)setInertialTargetSmoothingRatio:(double)a3;
- (void)setName:(id)a3;
- (void)setResponse:(double)a3;
- (void)setResponseSmoothing:(double)a3;
- (void)setRetargetImpulse:(double)a3;
- (void)setSmoothingAndProjectionEnabled:(BOOL)a3;
- (void)setTrackingDampingRatio:(double)a3;
- (void)setTrackingDampingRatioSmoothing:(double)a3;
- (void)setTrackingResponse:(double)a3;
- (void)setTrackingResponseSmoothing:(double)a3;
- (void)setTrackingRetargetImpulse:(double)a3;
@end

@implementation CEKFluidBehaviorSettings

- (void)setDefaultValues
{
  [(CEKFluidBehaviorSettings *)self setBehaviorType:2];
  [(CEKFluidBehaviorSettings *)self setDeceleration:0.998];
  [(CEKFluidBehaviorSettings *)self setDampingRatio:0.845];
  [(CEKFluidBehaviorSettings *)self setResponse:0.531];
  [(CEKFluidBehaviorSettings *)self setTrackingDampingRatio:0.86];
  [(CEKFluidBehaviorSettings *)self setTrackingResponse:0.15];
  [(CEKFluidBehaviorSettings *)self setRetargetImpulse:0.0];
  [(CEKFluidBehaviorSettings *)self setTrackingRetargetImpulse:0.0];
  [(CEKFluidBehaviorSettings *)self setDampingRatioSmoothing:0.0];
  [(CEKFluidBehaviorSettings *)self setResponseSmoothing:0.0];
  [(CEKFluidBehaviorSettings *)self setTrackingDampingRatioSmoothing:0.0];
  [(CEKFluidBehaviorSettings *)self setTrackingResponseSmoothing:0.0];
  [(CEKFluidBehaviorSettings *)self setSmoothingAndProjectionEnabled:0];
}

- (void)setDefaultCriticallyDampedValues
{
  [(CEKFluidBehaviorSettings *)self setDefaultValues];
  [(CEKFluidBehaviorSettings *)self setDampingRatio:1.0];
  [(CEKFluidBehaviorSettings *)self setResponse:0.336];
}

- (double)_effectiveTrackingDampingRatio
{
  if ([(CEKFluidBehaviorSettings *)self behaviorType] == 1)
  {
    [(CEKFluidBehaviorSettings *)self dampingRatio];
  }
  else
  {
    [(CEKFluidBehaviorSettings *)self trackingDampingRatio];
  }
  return result;
}

- (double)_effectiveTrackingResponse
{
  if ([(CEKFluidBehaviorSettings *)self behaviorType] == 1)
  {
    [(CEKFluidBehaviorSettings *)self response];
  }
  else
  {
    [(CEKFluidBehaviorSettings *)self trackingResponse];
  }
  return result;
}

- (double)_effectiveTrackingRetargetImpulse
{
  if ([(CEKFluidBehaviorSettings *)self behaviorType] == 1)
  {
    [(CEKFluidBehaviorSettings *)self retargetImpulse];
  }
  else
  {
    [(CEKFluidBehaviorSettings *)self trackingRetargetImpulse];
  }
  return result;
}

- (CAFrameRateRange)frameRateRange
{
  float minimum = self->_frameRateRange.minimum;
  float maximum = self->_frameRateRange.maximum;
  float preferred = self->_frameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  self->_frameRateRange = a3;
  self->_highFrameRateReason = a4;
}

- (double)settlingDuration
{
  v3 = [MEMORY[0x1E4F39C90] animation];
  [v3 setMass:1.0];
  [(CEKFluidBehaviorSettings *)self dampingRatio];
  double v5 = v4;
  [(CEKFluidBehaviorSettings *)self response];
  double v7 = sqrt(6.28318531 / v6 * (6.28318531 / v6));
  double v8 = v5 * (v7 + v7);
  objc_msgSend(v3, "setStiffness:");
  [v3 setDamping:v8];
  [v3 settlingDuration];
  double v10 = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v54 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t behaviorType = self->_behaviorType;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke;
  v85[3] = &unk_1E63CD5F0;
  id v6 = v4;
  id v86 = v6;
  v53 = [v54 appendInteger:behaviorType counterpart:v85];
  name = self->_name;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_2;
  v83[3] = &unk_1E63CD618;
  id v8 = v6;
  id v84 = v8;
  v52 = [v53 appendString:name counterpart:v83];
  double deceleration = self->_deceleration;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_3;
  v81[3] = &unk_1E63CD640;
  id v10 = v8;
  id v82 = v10;
  v51 = [v52 appendDouble:v81 counterpart:deceleration];
  double dampingRatio = self->_dampingRatio;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_4;
  v79[3] = &unk_1E63CD640;
  id v12 = v10;
  id v80 = v12;
  v50 = [v51 appendCGFloat:v79 counterpart:dampingRatio];
  double response = self->_response;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_5;
  v77[3] = &unk_1E63CD640;
  id v14 = v12;
  id v78 = v14;
  v49 = [v50 appendCGFloat:v77 counterpart:response];
  double retargetImpulse = self->_retargetImpulse;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_6;
  v75[3] = &unk_1E63CD640;
  id v16 = v14;
  id v76 = v16;
  v48 = [v49 appendCGFloat:v75 counterpart:retargetImpulse];
  double trackingDampingRatio = self->_trackingDampingRatio;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_7;
  v73[3] = &unk_1E63CD640;
  id v18 = v16;
  id v74 = v18;
  v47 = [v48 appendCGFloat:v73 counterpart:trackingDampingRatio];
  double trackingResponse = self->_trackingResponse;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_8;
  v71[3] = &unk_1E63CD640;
  id v20 = v18;
  id v72 = v20;
  v46 = [v47 appendCGFloat:v71 counterpart:trackingResponse];
  double trackingRetargetImpulse = self->_trackingRetargetImpulse;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_9;
  v69[3] = &unk_1E63CD640;
  id v22 = v20;
  id v70 = v22;
  v23 = [v46 appendCGFloat:v69 counterpart:trackingRetargetImpulse];
  BOOL smoothingAndProjectionEnabled = self->_smoothingAndProjectionEnabled;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_10;
  v67[3] = &unk_1E63CD668;
  id v25 = v22;
  id v68 = v25;
  v26 = [v23 appendBool:smoothingAndProjectionEnabled counterpart:v67];
  double dampingRatioSmoothing = self->_dampingRatioSmoothing;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_11;
  v65[3] = &unk_1E63CD640;
  id v28 = v25;
  id v66 = v28;
  v29 = [v26 appendCGFloat:v65 counterpart:dampingRatioSmoothing];
  double responseSmoothing = self->_responseSmoothing;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_12;
  v63[3] = &unk_1E63CD640;
  id v31 = v28;
  id v64 = v31;
  v32 = [v29 appendCGFloat:v63 counterpart:responseSmoothing];
  double trackingDampingRatioSmoothing = self->_trackingDampingRatioSmoothing;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_13;
  v61[3] = &unk_1E63CD640;
  id v34 = v31;
  id v62 = v34;
  v35 = [v32 appendCGFloat:v61 counterpart:trackingDampingRatioSmoothing];
  double trackingResponseSmoothing = self->_trackingResponseSmoothing;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_14;
  v59[3] = &unk_1E63CD640;
  id v37 = v34;
  id v60 = v37;
  v38 = [v35 appendCGFloat:v59 counterpart:trackingResponseSmoothing];
  double inertialTargetSmoothingRatio = self->_inertialTargetSmoothingRatio;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_15;
  v57[3] = &unk_1E63CD640;
  id v40 = v37;
  id v58 = v40;
  v41 = [v38 appendCGFloat:v57 counterpart:inertialTargetSmoothingRatio];
  double inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_16;
  v55[3] = &unk_1E63CD640;
  id v56 = v40;
  id v43 = v40;
  v44 = [v41 appendCGFloat:v55 counterpart:inertialProjectionDeceleration];
  LOBYTE(v40) = [v44 isEqual];

  return (char)v40;
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) behaviorType];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deceleration];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dampingRatio];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) response];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) retargetImpulse];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingDampingRatio];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingResponse];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingRetargetImpulse];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) smoothingAndProjectionEnabled];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) dampingRatioSmoothing];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) responseSmoothing];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingDampingRatioSmoothing];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) trackingResponseSmoothing];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) inertialTargetSmoothingRatio];
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) inertialProjectionDeceleration];
}

- (unint64_t)hash
{
  v21 = [MEMORY[0x1E4F4F758] builder];
  id v20 = [v21 appendInteger:self->_behaviorType];
  v19 = [v20 appendString:self->_name];
  id v18 = [v19 appendDouble:self->_deceleration];
  v17 = [v18 appendCGFloat:self->_dampingRatio];
  id v16 = [v17 appendCGFloat:self->_response];
  v15 = [v16 appendCGFloat:self->_retargetImpulse];
  v3 = [v15 appendCGFloat:self->_trackingDampingRatio];
  id v4 = [v3 appendCGFloat:self->_trackingResponse];
  double v5 = [v4 appendCGFloat:self->_trackingRetargetImpulse];
  id v6 = [v5 appendBool:self->_smoothingAndProjectionEnabled];
  double v7 = [v6 appendCGFloat:self->_dampingRatioSmoothing];
  id v8 = [v7 appendCGFloat:self->_responseSmoothing];
  double v9 = [v8 appendCGFloat:self->_trackingDampingRatioSmoothing];
  id v10 = [v9 appendCGFloat:self->_trackingResponseSmoothing];
  v11 = [v10 appendCGFloat:self->_inertialTargetSmoothingRatio];
  id v12 = [v11 appendCGFloat:self->_inertialProjectionDeceleration];
  unint64_t v14 = [v12 hash];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (![(CEKFluidBehaviorSettings *)self isEqual:v4])
  {
    objc_storeStrong((id *)(v4 + 144), self->_name);
    *(void *)(v4 + 32) = self->_behaviorType;
    *(double *)(v4 + 40) = self->_deceleration;
    *(double *)(v4 + 48) = self->_dampingRatio;
    *(double *)(v4 + 56) = self->_response;
    *(double *)(v4 + 72) = self->_trackingDampingRatio;
    *(double *)(v4 + 80) = self->_trackingResponse;
    *(double *)(v4 + 64) = self->_retargetImpulse;
    *(double *)(v4 + 88) = self->_trackingRetargetImpulse;
    *(double *)(v4 + 96) = self->_dampingRatioSmoothing;
    *(double *)(v4 + 104) = self->_responseSmoothing;
    *(double *)(v4 + 112) = self->_trackingDampingRatioSmoothing;
    *(double *)(v4 + 120) = self->_trackingResponseSmoothing;
    *(unsigned char *)(v4 + 24) = self->_smoothingAndProjectionEnabled;
    *(double *)(v4 + 128) = self->_inertialTargetSmoothingRatio;
    *(double *)(v4 + 136) = self->_inertialProjectionDeceleration;
  }
  return (id)v4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 == 1)
  {
    [(CEKFluidBehaviorSettings *)self _effectiveTrackingDampingRatio];
    retstr->var0 = v8;
    [(CEKFluidBehaviorSettings *)self _effectiveTrackingResponse];
    retstr->var1 = v9;
    [(CEKFluidBehaviorSettings *)self _effectiveTrackingRetargetImpulse];
    retstr->var10 = v10;
    CAFrameRateRange result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)[(CEKFluidBehaviorSettings *)self smoothingAndProjectionEnabled];
    if (result)
    {
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_trackingDampingRatioSmoothing;
      if (!a4)
      {
        *(_WORD *)&retstr->var2 = 257;
        *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_dampingRatio;
      }
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_dampingRatio;
    retstr->var10 = self->_retargetImpulse;
    CAFrameRateRange result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)[(CEKFluidBehaviorSettings *)self smoothingAndProjectionEnabled];
    if (result)
    {
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_dampingRatioSmoothing;
      if (a4 == 1)
      {
        double inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
        retstr->var8 = self->_inertialTargetSmoothingRatio * self->_trackingResponse;
        retstr->var9 = inertialProjectionDeceleration;
      }
    }
  }
  return result;
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)setBehaviorType:(int64_t)a3
{
  self->_int64_t behaviorType = a3;
}

- (double)deceleration
{
  return self->_deceleration;
}

- (void)setDeceleration:(double)a3
{
  self->_double deceleration = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_double dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_double response = a3;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_double retargetImpulse = a3;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_double trackingDampingRatio = a3;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (void)setTrackingResponse:(double)a3
{
  self->_double trackingResponse = a3;
}

- (double)trackingRetargetImpulse
{
  return self->_trackingRetargetImpulse;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  self->_double trackingRetargetImpulse = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  return self->_smoothingAndProjectionEnabled;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  self->_BOOL smoothingAndProjectionEnabled = a3;
}

- (double)dampingRatioSmoothing
{
  return self->_dampingRatioSmoothing;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  self->_double dampingRatioSmoothing = a3;
}

- (double)responseSmoothing
{
  return self->_responseSmoothing;
}

- (void)setResponseSmoothing:(double)a3
{
  self->_double responseSmoothing = a3;
}

- (double)trackingDampingRatioSmoothing
{
  return self->_trackingDampingRatioSmoothing;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  self->_double trackingDampingRatioSmoothing = a3;
}

- (double)trackingResponseSmoothing
{
  return self->_trackingResponseSmoothing;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  self->_double trackingResponseSmoothing = a3;
}

- (double)inertialTargetSmoothingRatio
{
  return self->_inertialTargetSmoothingRatio;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  self->_double inertialTargetSmoothingRatio = a3;
}

- (double)inertialProjectionDeceleration
{
  return self->_inertialProjectionDeceleration;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  self->_double inertialProjectionDeceleration = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end