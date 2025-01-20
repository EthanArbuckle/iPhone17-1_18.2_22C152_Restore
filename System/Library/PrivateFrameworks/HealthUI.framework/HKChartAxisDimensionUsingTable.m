@interface HKChartAxisDimensionUsingTable
- (HKChartAxisDimensionUsingTable)initWithStepSizeTable:(HKStepSizeTableEntryDefn *)a3 stepSizeTableSize:(int64_t)a4 displayType:(id)a5 unitController:(id)a6;
- (HKDisplayType)displayType;
- (HKStepSizeTableEntryDefn)_findStepSize:(double)a3 allowEqual:(BOOL)a4;
- (HKStepSizeTableEntryDefn)stepSizeTable;
- (HKUnitPreferenceController)unitController;
- (double)niceStepSizeLargerThan:(double)a3;
- (double)ticksPerStepSize:(double)a3;
- (id)endingLabelsFactorOverride;
- (id)formatterForLabelStepSize:(double)a3;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
- (int64_t)stepSizeTableSize;
@end

@implementation HKChartAxisDimensionUsingTable

- (HKChartAxisDimensionUsingTable)initWithStepSizeTable:(HKStepSizeTableEntryDefn *)a3 stepSizeTableSize:(int64_t)a4 displayType:(id)a5 unitController:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKChartAxisDimensionUsingTable;
  v13 = [(HKChartAxisDimensionUsingTable *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_stepSizeTable = a3;
    v13->_stepSizeTableSize = a4;
    objc_storeStrong((id *)&v13->_displayType, a5);
    objc_storeStrong((id *)&v14->_unitController, a6);
  }

  return v14;
}

- (double)niceStepSizeLargerThan:(double)a3
{
  return *(double *)[(HKChartAxisDimensionUsingTable *)self _findStepSize:0 allowEqual:a3];
}

- (double)ticksPerStepSize:(double)a3
{
  return (double)[(HKChartAxisDimensionUsingTable *)self _findStepSize:1 allowEqual:a3][8];
}

- (id)formatterForLabelStepSize:(double)a3
{
  return 0;
}

- (id)endingLabelsFactorOverride
{
  return 0;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  return [(HKDisplayType *)self->_displayType hk_interactiveChartAxisStringFromValue:a3 defaultNumberFormatter:0 unitController:self->_unitController];
}

- (HKStepSizeTableEntryDefn)_findStepSize:(double)a3 allowEqual:(BOOL)a4
{
  int64_t stepSizeTableSize = self->_stepSizeTableSize;
  int64_t v5 = stepSizeTableSize - 1;
  if (stepSizeTableSize >= 1)
  {
    int64_t v6 = 0;
    stepSizeTable = self->_stepSizeTable;
    do
    {
      if (a4)
      {
        if (stepSizeTable->var0 >= a3) {
          goto LABEL_9;
        }
      }
      else if (stepSizeTable->var0 > a3)
      {
LABEL_9:
        int64_t v5 = v6;
        return &self->_stepSizeTable[v5];
      }
      ++v6;
      ++stepSizeTable;
    }
    while (stepSizeTableSize != v6);
  }
  return &self->_stepSizeTable[v5];
}

- (HKStepSizeTableEntryDefn)stepSizeTable
{
  return self->_stepSizeTable;
}

- (int64_t)stepSizeTableSize
{
  return self->_stepSizeTableSize;
}

- (HKDisplayType)displayType
{
  return (HKDisplayType *)objc_getProperty(self, a2, 24, 1);
}

- (HKUnitPreferenceController)unitController
{
  return (HKUnitPreferenceController *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end