@interface HKSleepStageCoordinate
- (HKSleepStageCoordinate)initWithXValue:(double)a3 asleepUnspecifiedYValues:(id)a4 asleepDeepYValues:(id)a5 asleepCoreYValues:(id)a6 asleepRemYValues:(id)a7 awakeValues:(id)a8 inBedYValues:(id)a9 yValues:(id)a10 highlighted:(BOOL)a11 userInfo:(id)a12;
- (NSArray)asleepCoreYValues;
- (NSArray)asleepDeepYValues;
- (NSArray)asleepRemYValues;
- (NSArray)asleepUnspecifiedYValues;
- (NSArray)awakeValues;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation HKSleepStageCoordinate

- (HKSleepStageCoordinate)initWithXValue:(double)a3 asleepUnspecifiedYValues:(id)a4 asleepDeepYValues:(id)a5 asleepCoreYValues:(id)a6 asleepRemYValues:(id)a7 awakeValues:(id)a8 inBedYValues:(id)a9 yValues:(id)a10 highlighted:(BOOL)a11 userInfo:(id)a12
{
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  v28.receiver = self;
  v28.super_class = (Class)HKSleepStageCoordinate;
  id v23 = a8;
  v20 = [(HKSleepPeriodCoordinate *)&v28 initWithXValue:MEMORY[0x1E4F1CBF0] asleepYValues:a9 inBedYValues:a10 yValues:0 upperGoalYValue:0 lowerGoalYValue:a11 highlighted:a3 userInfo:a12];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_awakeValues, a8);
    objc_storeStrong((id *)&v21->_asleepUnspecifiedYValues, a4);
    objc_storeStrong((id *)&v21->_asleepDeepYValues, a5);
    objc_storeStrong((id *)&v21->_asleepCoreYValues, a6);
    objc_storeStrong((id *)&v21->_asleepRemYValues, a7);
  }

  return v21;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  long long v6 = *(_OWORD *)&a3->c;
  long long v53 = *(_OWORD *)&a3->a;
  aBlock[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke;
  aBlock[3] = &unk_1E6D54D80;
  aBlock[4] = self;
  long long v54 = v6;
  long long v55 = *(_OWORD *)&a3->tx;
  v7 = _Block_copy(aBlock);
  asleepUnspecifiedYValues = self->_asleepUnspecifiedYValues;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_2;
  v50[3] = &unk_1E6D54DA8;
  id v9 = v7;
  id v51 = v9;
  v35 = [(NSArray *)asleepUnspecifiedYValues hk_map:v50];
  asleepRemYValues = self->_asleepRemYValues;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_3;
  v48[3] = &unk_1E6D54DA8;
  id v11 = v9;
  id v49 = v11;
  v12 = [(NSArray *)asleepRemYValues hk_map:v48];
  asleepCoreYValues = self->_asleepCoreYValues;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_4;
  v46[3] = &unk_1E6D54DA8;
  id v14 = v11;
  id v47 = v14;
  v15 = [(NSArray *)asleepCoreYValues hk_map:v46];
  asleepDeepYValues = self->_asleepDeepYValues;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_5;
  v44[3] = &unk_1E6D54DA8;
  id v17 = v14;
  id v45 = v17;
  v18 = [(NSArray *)asleepDeepYValues hk_map:v44];
  v19 = [(HKSleepStageCoordinate *)self awakeValues];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_6;
  v42[3] = &unk_1E6D54DA8;
  id v20 = v17;
  id v43 = v20;
  v21 = objc_msgSend(v19, "hk_map:", v42);

  v22 = [(HKSleepPeriodCoordinate *)self inBedYValues];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_7;
  v40[3] = &unk_1E6D54DA8;
  id v41 = v20;
  id v34 = v20;
  id v23 = objc_msgSend(v22, "hk_map:", v40);

  id v24 = [(HKSleepPeriodCoordinate *)self yValues];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  long long v25 = *(_OWORD *)&v4->c;
  long long v37 = *(_OWORD *)&v4->a;
  long long v38 = v25;
  v36[2] = __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_8;
  v36[3] = &unk_1E6D54DD0;
  v36[4] = self;
  long long v39 = *(_OWORD *)&v4->tx;
  id v26 = objc_msgSend(v24, "hk_map:", v36);

  [(HKSleepPeriodCoordinate *)self xValue];
  CGFloat v28 = v4->tx + v4->c * 0.0 + v4->a * v27;
  id v29 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v4) = [(HKSleepPeriodCoordinate *)self highlighted];
  v30 = [(HKSleepPeriodCoordinate *)self userInfo];
  LOBYTE(v33) = (_BYTE)v4;
  v31 = (void *)[v29 initWithXValue:v35 asleepUnspecifiedYValues:v18 asleepDeepYValues:v15 asleepCoreYValues:v12 asleepRemYValues:v21 awakeValues:v23 inBedYValues:v28 yValues:v26 highlighted:v33 userInfo:v30];

  return v31;
}

id __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 xValue];
  double v6 = v5;
  v7 = [v4 value];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [NSNumber numberWithDouble:*(double *)(a1 + 80) + v9 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v6];
  uint64_t v11 = [v4 continuation];

  v12 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v10 continuation:v11];

  return v12;
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__HKSleepStageCoordinate_copyWithTransform_roundToViewScale___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 xValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  double v9 = *(double *)(a1 + 80) + v8 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v6;
  v10 = NSNumber;
  return [v10 numberWithDouble:v9];
}

- (NSArray)awakeValues
{
  return self->_awakeValues;
}

- (NSArray)asleepUnspecifiedYValues
{
  return self->_asleepUnspecifiedYValues;
}

- (NSArray)asleepDeepYValues
{
  return self->_asleepDeepYValues;
}

- (NSArray)asleepCoreYValues
{
  return self->_asleepCoreYValues;
}

- (NSArray)asleepRemYValues
{
  return self->_asleepRemYValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asleepRemYValues, 0);
  objc_storeStrong((id *)&self->_asleepCoreYValues, 0);
  objc_storeStrong((id *)&self->_asleepDeepYValues, 0);
  objc_storeStrong((id *)&self->_asleepUnspecifiedYValues, 0);
  objc_storeStrong((id *)&self->_awakeValues, 0);
}

@end