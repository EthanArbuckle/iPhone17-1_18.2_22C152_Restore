@interface FIQuantityIntervalController
- (BOOL)_updateTriggerWithSample:(id)a3;
- (BOOL)allSlicesFinalized;
- (BOOL)intervalComplete;
- (BOOL)isIntervalEndDate;
- (FIQuantityIntervalController)initWithIntervalQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5 trackedQuantityTypes:(id)a6;
- (void)addSample:(id)a3;
@end

@implementation FIQuantityIntervalController

- (FIQuantityIntervalController)initWithIntervalQuantityType:(id)a3 threshold:(id)a4 startDate:(id)a5 trackedQuantityTypes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FIQuantityIntervalController;
  v14 = [(FIQuantityIntervalController *)&v20 init];
  if (v14)
  {
    v15 = [[FIIntervalQuantityTrigger alloc] initWithQuantityType:v10 startDate:v12 threshold:v11];
    quantityTrigger = v14->_quantityTrigger;
    v14->_quantityTrigger = v15;

    uint64_t v17 = +[FIMutableTimeSliceGroup timeSliceGroupForQuantityTypes:v13 startDate:v12];
    sliceGroup = v14->_sliceGroup;
    v14->_sliceGroup = (FIMutableTimeSliceGroup *)v17;
  }
  return 0;
}

- (void)addSample:(id)a3
{
  id v7 = a3;
  [(FIMutableTimeSliceGroup *)self->_sliceGroup updateSlicesWithSample:v7];
  if ([(FIQuantityIntervalController *)self _updateTriggerWithSample:v7])
  {
    BOOL v4 = [(FIIntervalQuantityTrigger *)self->_quantityTrigger triggered];
    sliceGroup = self->_sliceGroup;
    if (v4)
    {
      v6 = [(FIIntervalQuantityTrigger *)self->_quantityTrigger triggeredDate];
      [(FIMutableTimeSliceGroup *)sliceGroup updateSlicesWithEndDate:v6];
    }
    else
    {
      v6 = [v7 endDate];
      [(FIMutableTimeSliceGroup *)sliceGroup commitAllSlicesToDate:v6];
    }
  }
}

- (BOOL)_updateTriggerWithSample:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 quantityType];
  v6 = [(FIIntervalQuantityTrigger *)self->_quantityTrigger quantityType];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    quantityTrigger = self->_quantityTrigger;
    id v16 = 0;
    v9 = [(FIIntervalQuantityTrigger *)quantityTrigger addingSample:v4 error:&v16];
    id v10 = v16;
    id v11 = self->_quantityTrigger;
    self->_quantityTrigger = v9;

    if (!v10)
    {
      BOOL v13 = 1;
      goto LABEL_7;
    }
    _HKInitializeLogging();
    id v12 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR))
    {
      v15 = self->_quantityTrigger;
      *(_DWORD *)buf = 138412802;
      id v18 = v4;
      __int16 v19 = 2112;
      objc_super v20 = v15;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_error_impl(&dword_21C74B000, v12, OS_LOG_TYPE_ERROR, "Adding sample %@ to quantity trigger %@ caused error: %@", buf, 0x20u);
    }
  }
  BOOL v13 = 0;
LABEL_7:

  return v13;
}

- (BOOL)intervalComplete
{
  return [(FIIntervalQuantityTrigger *)self->_quantityTrigger triggered];
}

- (BOOL)isIntervalEndDate
{
  v2 = [(FIIntervalQuantityTrigger *)self->_quantityTrigger triggeredDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allSlicesFinalized
{
  return [(FIMutableTimeSliceGroup *)self->_sliceGroup allSlicesFinalized];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceGroup, 0);
  objc_storeStrong((id *)&self->_quantityTrigger, 0);
}

@end