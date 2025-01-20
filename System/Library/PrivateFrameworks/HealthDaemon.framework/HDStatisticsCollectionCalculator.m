@interface HDStatisticsCollectionCalculator
+ (BOOL)supportsSecureCoding;
+ (id)calculatorForArchivedRepresentation:(id)a3 error:(id *)a4;
+ (id)calculatorForCategoryType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6;
+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6;
+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6 computationMethod:(int64_t)a7;
- (BOOL)addSampleValue:(double)a3 startTime:(double)a4 endTime:(double)a5 sourceID:(int64_t)a6 error:(id *)a7;
- (BOOL)invalidateInterval:(id)a3 error:(id *)a4;
- (BOOL)performAddSampleTransaction:(id)a3 error:(id *)a4;
- (BOOL)performInitialStatisticsTransaction:(id)a3 error:(id *)a4;
- (BOOL)queryForInitialStatisticsWithError:(id *)a3;
- (BOOL)setMaskedIntervals:(id)a3 error:(id *)a4;
- (HDStatisticsCollectionCalculator)initWithCoder:(id)a3;
- (HDStatisticsCollectionCalculatorDataSource)dataSource;
- (HDStatisticsCollectionCalculatorSourceOrderProvider)sourceOrderProvider;
- (HKQuantityType)quantityType;
- (NSArray)maskedIntervals;
- (NSDateInterval)dateInterval;
- (_HKDateIntervalCollection)intervalCollection;
- (double)mergeGranularity;
- (id).cxx_construct;
- (id)archivedRepresentationWithError:(id *)a3;
- (id)bundleIdentifierForSourceID:(int64_t)a3;
- (id)currentStatistics;
- (id)sourceForSourceID:(int64_t)a3;
- (id)statisticsHandler;
- (int64_t)computationMethod;
- (unint64_t)mergeStrategy;
- (unint64_t)options;
- (void)configureMergeAnchor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initForQuantityType:(void *)a3 intervalCollection:(uint64_t)a4 options:(uint64_t)a5 mergeStrategy:(uint64_t)a6 computationMethod:;
- (void)orderSourceIDs:(void *)a3;
- (void)reset;
- (void)setDataSource:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setMergeGranularity:(double)a3;
- (void)setSourceOrderProvider:(id)a3;
- (void)setStatisticsConfiguration:(id)a3;
- (void)setStatisticsHandler:(id)a3;
@end

@implementation HDStatisticsCollectionCalculator

+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = [HDStatisticsCollectionCalculator alloc];
  uint64_t v12 = _HKStatisticsComputationMethodForQuantityType(v9, a5);
  v13 = -[HDStatisticsCollectionCalculator initForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:](v11, v9, v10, a5, a6, v12);

  return v13;
}

- (void)initForQuantityType:(void *)a3 intervalCollection:(uint64_t)a4 options:(uint64_t)a5 mergeStrategy:(uint64_t)a6 computationMethod:
{
  id v10 = a2;
  id v11 = a3;
  if (a1)
  {
    v75.receiver = a1;
    v75.super_class = (Class)HDStatisticsCollectionCalculator;
    uint64_t v12 = objc_msgSendSuper2(&v75, sel_init);
    a1 = v12;
    if (v12)
    {
      v12[3] = a6;
      switch(a6)
      {
        case 0:
          id v13 = v10;
          id v14 = v11;
          v15 = a1;
          id v16 = v13;
          id v17 = v14;
          v18 = v15;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 1:
          id v19 = v10;
          id v20 = v11;
          v21 = a1;
          id v22 = v19;
          id v23 = v20;
          v24 = v21;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 2:
          id v25 = v10;
          id v26 = v11;
          v27 = a1;
          id v28 = v25;
          id v29 = v26;
          v30 = v27;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 3:
          id v31 = v10;
          id v32 = v11;
          v33 = a1;
          id v34 = v31;
          id v35 = v32;
          v36 = v33;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 4:
          id v37 = v10;
          id v38 = v11;
          v39 = a1;
          id v40 = v37;
          id v41 = v38;
          v42 = v39;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 5:
          id v43 = v10;
          id v44 = v11;
          v45 = a1;
          id v46 = v43;
          id v47 = v44;
          v48 = v45;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 6:
          id v49 = v10;
          id v50 = v11;
          v51 = a1;
          id v52 = v49;
          id v53 = v50;
          v54 = v51;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 7:
          id v55 = v10;
          id v56 = v11;
          v57 = a1;
          id v58 = v55;
          id v59 = v56;
          v60 = v57;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 8:
          id v61 = v10;
          id v62 = v11;
          v63 = a1;
          id v64 = v61;
          id v65 = v62;
          v66 = v63;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        case 9:
          id v67 = v10;
          id v68 = v11;
          v69 = a1;
          id v70 = v67;
          id v71 = v68;
          v72 = v69;
          if ((a4 & 0x40) == 0)
          {
            if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
              operator new();
            }
            operator new();
          }
          if ((_HKStatisticsOptionBaselineRelativeQuantities() & a4) != 0) {
            operator new();
          }
          operator new();
        default:
          objc_storeWeak((id *)(v12[1] + 8), v12);
          v73 = (void *)a1[4];
          a1[4] = MEMORY[0x1E4F1CBF0];

          break;
      }
    }
  }

  return a1;
}

+ (id)calculatorForCategoryType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [MEMORY[0x1E4F2B618] countUnit];
  id v13 = +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:v10 aggregationStyle:1 canonicalUnit:v12];

  id v14 = [a1 calculatorForQuantityType:v13 intervalCollection:v11 options:a5 mergeStrategy:a6];

  return v14;
}

+ (id)calculatorForQuantityType:(id)a3 intervalCollection:(id)a4 options:(unint64_t)a5 mergeStrategy:(unint64_t)a6 computationMethod:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = -[HDStatisticsCollectionCalculator initForQuantityType:intervalCollection:options:mergeStrategy:computationMethod:]([HDStatisticsCollectionCalculator alloc], v11, v12, a5, a6, a7);

  return v13;
}

- (HKQuantityType)quantityType
{
  return (HKQuantityType *)*((id *)self->_implementation.__ptr_.__value_ + 2);
}

- (_HKDateIntervalCollection)intervalCollection
{
  return (_HKDateIntervalCollection *)*((id *)self->_implementation.__ptr_.__value_ + 5);
}

- (unint64_t)options
{
  return *((void *)self->_implementation.__ptr_.__value_ + 3);
}

- (unint64_t)mergeStrategy
{
  return *((void *)self->_implementation.__ptr_.__value_ + 4);
}

- (double)mergeGranularity
{
  (*(void (**)(void))(*(void *)self->_implementation.__ptr_.__value_ + 16))();
  return result;
}

- (BOOL)setMaskedIntervals:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (NSArray *)[v6 copy];
  maskedIntervals = self->_maskedIntervals;
  self->_maskedIntervals = v7;

  __p = 0;
  id v28 = 0;
  uint64_t v29 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "startDate", (void)v23);
        [v14 timeIntervalSinceReferenceDate];
        double v16 = v15;
        id v17 = [v13 endDate];
        [v17 timeIntervalSinceReferenceDate];
        if (v18 >= v16) {
          double v19 = v16;
        }
        else {
          double v19 = v18;
        }
        if (v16 >= v18) {
          double v20 = v16;
        }
        else {
          double v20 = v18;
        }
        HKIntervalMask<double>::_insertInterval((uint64_t *)&__p, v19, v20);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v10);
  }

  char v21 = (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, void **, id *))(*(void *)self->_implementation.__ptr_.__value_ + 64))(self->_implementation.__ptr_.__value_, &__p, a4);
  if (__p)
  {
    id v28 = __p;
    operator delete(__p);
  }

  return v21;
}

- (void)setMergeGranularity:(double)a3
{
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)(*(uint64_t (**)(void))(*(void *)self->_implementation.__ptr_.__value_ + 32))();
}

- (void)setDateInterval:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(void *)self->_implementation.__ptr_.__value_
                                                                                + 40))(self->_implementation.__ptr_.__value_, a3);
}

- (void)configureMergeAnchor:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(void *)self->_implementation.__ptr_.__value_
                                                                                + 48))(self->_implementation.__ptr_.__value_, a3);
}

- (void)setStatisticsHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  id statisticsHandler = self->_statisticsHandler;
  self->_id statisticsHandler = v5;

  if (v4)
  {
    objc_initWeak(&location, self);
    value = self->_implementation.__ptr_.__value_;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__HDStatisticsCollectionCalculator_setStatisticsHandler___block_invoke;
    v8[3] = &unk_1E6308F88;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, void *))(*(void *)value + 72))(value, v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, void))(*(void *)self->_implementation.__ptr_.__value_
                                                                                      + 72))(self->_implementation.__ptr_.__value_, 0);
  }
}

void __57__HDStatisticsCollectionCalculator_setStatisticsHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (HDStatisticsCollectionCalculatorDataSource)dataSource
{
  return (HDStatisticsCollectionCalculatorDataSource *)(*(uint64_t (**)(void))(*(void *)self->_implementation.__ptr_.__value_
                                                                            + 80))();
}

- (void)setDataSource:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(void *)self->_implementation.__ptr_.__value_
                                                                                + 88))(self->_implementation.__ptr_.__value_, a3);
}

- (void)setStatisticsConfiguration:(id)a3
{
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(void *)self->_implementation.__ptr_.__value_
                                                                                + 56))(self->_implementation.__ptr_.__value_, a3);
}

- (BOOL)addSampleValue:(double)a3 startTime:(double)a4 endTime:(double)a5 sourceID:(int64_t)a6 error:(id *)a7
{
  *(double *)id v13 = a3;
  *(double *)&v13[1] = a4;
  *(double *)&v13[2] = a5;
  v13[3] = a6;
  char v14 = 1;
  id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v10 timeIntervalSinceReferenceDate];
  BOOL v15 = v11 <= a5;

  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, void *, id *))(*(void *)self->_implementation.__ptr_.__value_ + 104))(self->_implementation.__ptr_.__value_, v13, a7);
}

- (BOOL)performAddSampleTransaction:(id)a3 error:(id *)a4
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, id, id *))(*(void *)self->_implementation.__ptr_.__value_
                                                                                                + 112))(self->_implementation.__ptr_.__value_, a3, a4);
}

- (BOOL)performInitialStatisticsTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  value = self->_implementation.__ptr_.__value_;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__HDStatisticsCollectionCalculator_performInitialStatisticsTransaction_error___block_invoke;
  v11[3] = &unk_1E6308FB0;
  v11[4] = self;
  id v12 = v6;
  v8 = *(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, void *, id *))(*(void *)value + 112);
  id v9 = v6;
  LOBYTE(a4) = v8(value, v11, a4);

  return (char)a4;
}

uint64_t __78__HDStatisticsCollectionCalculator_performInitialStatisticsTransaction_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 120))(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)queryForInitialStatisticsWithError:(id *)a3
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, HDStatisticsCollectionCalculator *, id *))(*(void *)self->_implementation.__ptr_.__value_ + 136))(self->_implementation.__ptr_.__value_, self, a3);
}

- (BOOL)invalidateInterval:(id)a3 error:(id *)a4
{
  return (*(uint64_t (**)(_HDStatisticsCollectionCalculatorImplementation *, id, id *))(*(void *)self->_implementation.__ptr_.__value_
                                                                                                + 128))(self->_implementation.__ptr_.__value_, a3, a4);
}

- (void)reset
{
}

- (id)currentStatistics
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_implementation.__ptr_.__value_ + 96))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:*((void *)self->_implementation.__ptr_.__value_ + 2) forKey:@"quantity_type"];
  [v5 encodeInteger:self->_computationMethod forKey:@"computation_method"];
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(void *)self->_implementation.__ptr_.__value_
  id v4 = + 32))(self->_implementation.__ptr_.__value_);
  [v5 encodeObject:v4 forKey:@"date_interval"];

  [v5 encodeInteger:*((void *)self->_implementation.__ptr_.__value_ + 3) forKey:@"options"];
  [v5 encodeInteger:*((void *)self->_implementation.__ptr_.__value_ + 4) forKey:@"merge_strategy"];
  [v5 encodeObject:*((void *)self->_implementation.__ptr_.__value_ + 5) forKey:@"interval_collection"];
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *))(*(void *)self->_implementation.__ptr_.__value_
                                                                            + 16))(self->_implementation.__ptr_.__value_);
  objc_msgSend(v5, "encodeDouble:forKey:", @"merge_granularity");
  (*(void (**)(_HDStatisticsCollectionCalculatorImplementation *, id))(*(void *)self->_implementation.__ptr_.__value_
                                                                                + 152))(self->_implementation.__ptr_.__value_, v5);
}

- (HDStatisticsCollectionCalculator)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity_type"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval_collection"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"options"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"merge_strategy"];
  uint64_t v9 = _HKStatisticsComputationMethodForQuantityType(v5, v7);
  if ([v4 containsValueForKey:@"computation_method"]) {
    uint64_t v9 = [v4 decodeIntegerForKey:@"computation_method"];
  }
  uint64_t v10 = [(id)objc_opt_class() calculatorForQuantityType:v5 intervalCollection:v6 options:v7 mergeStrategy:v8 computationMethod:v9];

  if (v10)
  {
    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date_interval"];
    if (v11) {
      [(id)v10 setDateInterval:v11];
    }
    [v4 decodeDoubleForKey:@"merge_granularity"];
    objc_msgSend((id)v10, "setMergeGranularity:");
    (*(void (**)(void, id))(**(void **)(v10 + 8) + 160))(*(void *)(v10 + 8), v4);
  }
  return (HDStatisticsCollectionCalculator *)v10;
}

- (id)archivedRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)calculatorForArchivedRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:a4];

  return v6;
}

- (id)bundleIdentifierForSourceID:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceOrderProvider);
  id v5 = [WeakRetained sourceForSourceID:a3];
  id v6 = [v5 bundleIdentifier];

  return v6;
}

- (id)sourceForSourceID:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceOrderProvider);
  id v5 = [WeakRetained sourceForSourceID:a3];

  return v5;
}

- (void)orderSourceIDs:(void *)a3
{
  while (2)
  {
    uint64_t v10 = a2;
    v250 = a2 - 1;
    v242 = a2 - 3;
    double v11 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          id v12 = v11;
          uint64_t v13 = (char *)v10 - (char *)v11;
          unint64_t v14 = v10 - v11;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                uint64_t v116 = *v11;
                v117 = *a3;
                v118 = [NSNumber numberWithLongLong:*(a2 - 1)];
                unint64_t v119 = [v117 indexOfObject:v118];
                v120 = *a3;
                v121 = [NSNumber numberWithLongLong:v116];
                unint64_t v122 = [v120 indexOfObject:v121];

                if (v119 < v122)
                {
                  uint64_t v123 = *v12;
                  *id v12 = *(a2 - 1);
                  *(a2 - 1) = v123;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v11, v11 + 1, v250, a3);
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v11, v11 + 1, v11 + 2, v250, a3);
                break;
              case 5uLL:
                std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *,0>(v11, v11 + 1, v11 + 2, v11 + 3, v250, a3);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          v249 = v11;
          if (v13 <= 191)
          {
            v124 = v11 + 1;
            BOOL v126 = v11 == v10 || v124 == v10;
            if (a5)
            {
              if (!v126)
              {
                uint64_t v127 = 0;
                v128 = v11;
                do
                {
                  uint64_t v130 = *v128;
                  uint64_t v129 = v128[1];
                  v128 = v124;
                  v131 = *a3;
                  v132 = objc_msgSend(NSNumber, "numberWithLongLong:", v129, v242);
                  unint64_t v133 = [v131 indexOfObject:v132];
                  v134 = *a3;
                  v135 = [NSNumber numberWithLongLong:v130];
                  unint64_t v136 = [v134 indexOfObject:v135];

                  if (v133 < v136)
                  {
                    uint64_t v137 = *v128;
                    uint64_t v138 = v127;
                    while (1)
                    {
                      *(uint64_t *)((char *)v249 + v138 + 8) = *(uint64_t *)((char *)v249 + v138);
                      if (!v138) {
                        break;
                      }
                      uint64_t v139 = *(uint64_t *)((char *)v249 + v138 - 8);
                      v140 = *a3;
                      v141 = [NSNumber numberWithLongLong:v137];
                      unint64_t v142 = [v140 indexOfObject:v141];
                      v143 = *a3;
                      v144 = [NSNumber numberWithLongLong:v139];
                      unint64_t v145 = [v143 indexOfObject:v144];

                      v138 -= 8;
                      if (v142 >= v145)
                      {
                        v146 = (uint64_t *)((char *)v249 + v138 + 8);
                        goto LABEL_80;
                      }
                    }
                    v146 = v249;
LABEL_80:
                    uint64_t *v146 = v137;
                  }
                  v124 = v128 + 1;
                  v127 += 8;
                }
                while (v128 + 1 != a2);
              }
            }
            else if (!v126)
            {
              do
              {
                uint64_t v226 = *v12;
                uint64_t v225 = v12[1];
                id v12 = v124;
                v227 = *a3;
                v228 = objc_msgSend(NSNumber, "numberWithLongLong:", v225, v242);
                unint64_t v229 = [v227 indexOfObject:v228];
                v230 = *a3;
                v231 = [NSNumber numberWithLongLong:v226];
                unint64_t v232 = [v230 indexOfObject:v231];

                if (v229 < v232)
                {
                  uint64_t v233 = *v12;
                  v234 = v12;
                  do
                  {
                    uint64_t v235 = *(v12 - 2);
                    *id v12 = *(v12 - 1);
                    v236 = *a3;
                    v237 = [NSNumber numberWithLongLong:v233];
                    unint64_t v238 = [v236 indexOfObject:v237];
                    v239 = *a3;
                    v240 = [NSNumber numberWithLongLong:v235];
                    unint64_t v241 = [v239 indexOfObject:v240];

                    --v12;
                  }
                  while (v238 < v241);
                  *id v12 = v233;
                  id v12 = v234;
                }
                v124 = v12 + 1;
              }
              while (v12 + 1 != a2);
            }
            return;
          }
          if (!a4)
          {
            if (v11 != v10)
            {
              unint64_t v243 = (char *)v10 - (char *)v11;
              int64_t v147 = (v14 - 2) >> 1;
              int64_t v254 = v147;
              uint64_t v246 = v10 - v11;
              do
              {
                int64_t v148 = v147;
                if (v254 >= v147)
                {
                  uint64_t v149 = (2 * v147) | 1;
                  v150 = &v249[v149];
                  uint64_t v151 = 2 * v147 + 2;
                  int64_t v244 = v147;
                  if (v151 < (uint64_t)v14)
                  {
                    v153 = v150 + 1;
                    uint64_t v152 = v150[1];
                    v154 = *a3;
                    v155 = [NSNumber numberWithLongLong:*v150];
                    unint64_t v156 = [v154 indexOfObject:v155];
                    v157 = *a3;
                    v158 = [NSNumber numberWithLongLong:v152];
                    unint64_t v159 = [v157 indexOfObject:v158];

                    if (v156 >= v159) {
                      v150 = &v249[v149];
                    }
                    else {
                      v150 = v153;
                    }
                    if (v156 < v159) {
                      uint64_t v149 = v151;
                    }
                    int64_t v148 = v244;
                  }
                  v160 = &v249[v148];
                  v161 = v150;
                  uint64_t v162 = *v160;
                  v163 = *a3;
                  v164 = objc_msgSend(NSNumber, "numberWithLongLong:", *v150, v243);
                  unint64_t v165 = [v163 indexOfObject:v164];
                  v166 = *a3;
                  v167 = [NSNumber numberWithLongLong:v162];
                  unint64_t v168 = [v166 indexOfObject:v167];

                  unint64_t v14 = v246;
                  if (v165 >= v168)
                  {
                    uint64_t v251 = *v160;
                    do
                    {
                      v169 = v161;
                      uint64_t *v160 = *v161;
                      if (v254 < v149) {
                        break;
                      }
                      uint64_t v170 = (2 * v149) | 1;
                      v171 = &v249[v170];
                      uint64_t v172 = 2 * v149 + 2;
                      if (v172 >= (uint64_t)v14)
                      {
                        unint64_t v182 = v14;
                        uint64_t v257 = v170;
                      }
                      else
                      {
                        v173 = v171 + 1;
                        uint64_t v174 = v171[1];
                        v175 = *a3;
                        v176 = [NSNumber numberWithLongLong:*v171];
                        unint64_t v177 = [v175 indexOfObject:v176];
                        v178 = *a3;
                        v179 = [NSNumber numberWithLongLong:v174];
                        unint64_t v180 = [v178 indexOfObject:v179];

                        v171 = &v249[v170];
                        if (v177 >= v180)
                        {
                          uint64_t v181 = v170;
                        }
                        else
                        {
                          v171 = v173;
                          uint64_t v181 = v172;
                        }
                        uint64_t v257 = v181;
                        unint64_t v182 = v246;
                      }
                      v161 = v171;
                      v183 = *a3;
                      v184 = [NSNumber numberWithLongLong:*v171];
                      unint64_t v185 = [v183 indexOfObject:v184];
                      v186 = *a3;
                      v187 = [NSNumber numberWithLongLong:v251];
                      unint64_t v188 = [v186 indexOfObject:v187];

                      v160 = v169;
                      unint64_t v14 = v182;
                      uint64_t v149 = v257;
                    }
                    while (v185 >= v188);
                    uint64_t *v169 = v251;
                    int64_t v148 = v244;
                  }
                }
                int64_t v147 = v148 - 1;
              }
              while (v148);
              uint64_t v189 = v243 >> 3;
              v190 = v249;
              do
              {
                uint64_t v191 = 0;
                uint64_t v247 = *v190;
                int64_t v192 = (unint64_t)(v189 - 2) >> 1;
                int64_t v252 = v192;
                uint64_t v255 = v189;
                do
                {
                  v193 = &v190[v191 + 1];
                  uint64_t v194 = (2 * v191) | 1;
                  uint64_t v195 = 2 * v191 + 2;
                  if (v195 < v189)
                  {
                    uint64_t v258 = (uint64_t)&v190[v191 + 1];
                    v197 = &v190[v191 + 2];
                    uint64_t v196 = *v197;
                    v198 = *a3;
                    v199 = [NSNumber numberWithLongLong:*v193];
                    unint64_t v200 = [v198 indexOfObject:v199];
                    v201 = *a3;
                    v202 = [NSNumber numberWithLongLong:v196];
                    unint64_t v203 = [v201 indexOfObject:v202];

                    uint64_t v189 = v255;
                    v193 = (uint64_t *)v258;
                    if (v200 < v203)
                    {
                      v193 = v197;
                      uint64_t v194 = v195;
                    }
                    int64_t v192 = v252;
                  }
                  uint64_t *v190 = *v193;
                  v190 = v193;
                  uint64_t v191 = v194;
                }
                while (v194 <= v192);
                v204 = a2 - 1;
                if (v193 == a2 - 1)
                {
                  uint64_t *v193 = v247;
                }
                else
                {
                  uint64_t *v193 = *v204;
                  uint64_t *v204 = v247;
                  uint64_t v205 = (char *)v193 - (char *)v249 + 8;
                  if (v205 >= 9)
                  {
                    unint64_t v206 = (((unint64_t)v205 >> 3) - 2) >> 1;
                    v207 = &v249[v206];
                    v208 = v193;
                    uint64_t v209 = *v193;
                    v210 = *a3;
                    v211 = [NSNumber numberWithLongLong:*v207];
                    unint64_t v212 = [v210 indexOfObject:v211];
                    v213 = *a3;
                    v214 = [NSNumber numberWithLongLong:v209];
                    unint64_t v215 = [v213 indexOfObject:v214];

                    uint64_t v189 = v255;
                    if (v212 < v215)
                    {
                      v216 = v208;
                      uint64_t v259 = *v208;
                      do
                      {
                        v217 = v207;
                        uint64_t *v216 = *v207;
                        if (!v206) {
                          break;
                        }
                        unint64_t v206 = (v206 - 1) >> 1;
                        v207 = &v249[v206];
                        v218 = *a3;
                        v219 = [NSNumber numberWithLongLong:*v207];
                        unint64_t v220 = [v218 indexOfObject:v219];
                        v221 = *a3;
                        v222 = [NSNumber numberWithLongLong:v259];
                        unint64_t v223 = [v221 indexOfObject:v222];

                        v216 = v217;
                      }
                      while (v220 < v223);
                      uint64_t v189 = v255;
                      uint64_t *v217 = v259;
                    }
                  }
                }
                --a2;
                BOOL v224 = v189-- <= 2;
                v190 = v249;
              }
              while (!v224);
            }
            return;
          }
          unint64_t v15 = v14 >> 1;
          double v16 = &v11[v14 >> 1];
          if ((unint64_t)v13 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v12, &v12[v14 >> 1], v250, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v12 + 1, v16 - 1, a2 - 2, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v12 + 2, &v12[v15 + 1], v242, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(v16 - 1, v16, &v12[v15 + 1], a3);
            uint64_t v17 = *v12;
            *id v12 = *v16;
            *double v16 = v17;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *>(&v12[v14 >> 1], v12, v250, a3);
          }
          uint64_t v256 = a4 - 1;
          if (a5) {
            break;
          }
          uint64_t v18 = *v12;
          double v19 = *a3;
          double v20 = [NSNumber numberWithLongLong:*(v12 - 1)];
          unint64_t v21 = [v19 indexOfObject:v20];
          id v22 = *a3;
          long long v23 = [NSNumber numberWithLongLong:v18];
          unint64_t v24 = [v22 indexOfObject:v23];

          if (v21 < v24) {
            break;
          }
          uint64_t v69 = *v12;
          uint64_t v70 = *v250;
          id v71 = *a3;
          v72 = [NSNumber numberWithLongLong:*v12];
          unint64_t v73 = [v71 indexOfObject:v72];
          v74 = *a3;
          objc_super v75 = [NSNumber numberWithLongLong:v70];
          unint64_t v76 = [v74 indexOfObject:v75];

          if (v73 >= v76)
          {
            v84 = v12 + 1;
            do
            {
              double v11 = v84;
              if (v84 >= a2) {
                break;
              }
              uint64_t v85 = *v84;
              v86 = *a3;
              v87 = [NSNumber numberWithLongLong:v69];
              unint64_t v88 = [v86 indexOfObject:v87];
              v89 = *a3;
              v90 = [NSNumber numberWithLongLong:v85];
              unint64_t v91 = [v89 indexOfObject:v90];

              v84 = v11 + 1;
            }
            while (v88 >= v91);
          }
          else
          {
            double v11 = v12;
            do
            {
              uint64_t v77 = v11[1];
              ++v11;
              v78 = *a3;
              v79 = objc_msgSend(NSNumber, "numberWithLongLong:", v69, v242);
              unint64_t v80 = [v78 indexOfObject:v79];
              v81 = *a3;
              v82 = [NSNumber numberWithLongLong:v77];
              unint64_t v83 = [v81 indexOfObject:v82];
            }
            while (v80 >= v83);
          }
          v92 = a2;
          if (v11 < a2)
          {
            v92 = a2;
            do
            {
              uint64_t v93 = *--v92;
              v94 = *a3;
              v95 = objc_msgSend(NSNumber, "numberWithLongLong:", v69, v242);
              unint64_t v96 = [v94 indexOfObject:v95];
              v97 = *a3;
              v98 = [NSNumber numberWithLongLong:v93];
              unint64_t v99 = [v97 indexOfObject:v98];
            }
            while (v96 < v99);
          }
          while (v11 < v92)
          {
            uint64_t v100 = *v11;
            uint64_t *v11 = *v92;
            uint64_t *v92 = v100;
            do
            {
              uint64_t v101 = v11[1];
              ++v11;
              v102 = *a3;
              v103 = objc_msgSend(NSNumber, "numberWithLongLong:", v69, v242);
              unint64_t v104 = [v102 indexOfObject:v103];
              v105 = *a3;
              v106 = [NSNumber numberWithLongLong:v101];
              unint64_t v107 = [v105 indexOfObject:v106];
            }
            while (v104 >= v107);
            do
            {
              uint64_t v108 = *--v92;
              v109 = *a3;
              v110 = [NSNumber numberWithLongLong:v69];
              unint64_t v111 = [v109 indexOfObject:v110];
              v112 = *a3;
              v113 = [NSNumber numberWithLongLong:v108];
              unint64_t v114 = [v112 indexOfObject:v113];
            }
            while (v111 < v114);
          }
          v115 = v11 - 1;
          BOOL v5 = v11 - 1 >= v12;
          BOOL v6 = v11 - 1 == v12;
          uint64_t v10 = a2;
          if (v11 - 1 != v12) {
            *id v12 = *v115;
          }
          a5 = 0;
          uint64_t *v115 = v69;
          a4 = v256;
        }
        uint64_t v25 = 0;
        uint64_t v26 = *v12;
        do
        {
          v27 = *a3;
          id v28 = objc_msgSend(NSNumber, "numberWithLongLong:", v12[v25 + 1], v242);
          unint64_t v29 = [v27 indexOfObject:v28];
          v30 = *a3;
          uint64_t v31 = [NSNumber numberWithLongLong:v26];
          unint64_t v32 = [v30 indexOfObject:v31];

          ++v25;
        }
        while (v29 < v32);
        v33 = &v12[v25];
        id v34 = v10;
        BOOL v6 = v25 == 1;
        id v35 = v33;
        if (v6)
        {
          id v34 = v10;
          do
          {
            if (v35 >= v34) {
              break;
            }
            uint64_t v43 = *--v34;
            id v44 = *a3;
            v45 = [NSNumber numberWithLongLong:v43];
            unint64_t v46 = [v44 indexOfObject:v45];
            id v47 = *a3;
            v48 = [NSNumber numberWithLongLong:v26];
            unint64_t v49 = [v47 indexOfObject:v48];
          }
          while (v46 >= v49);
        }
        else
        {
          do
          {
            uint64_t v36 = *--v34;
            id v37 = *a3;
            id v38 = [NSNumber numberWithLongLong:v36];
            unint64_t v39 = [v37 indexOfObject:v38];
            id v40 = *a3;
            id v41 = [NSNumber numberWithLongLong:v26];
            unint64_t v42 = [v40 indexOfObject:v41];
          }
          while (v39 >= v42);
        }
        if (v35 >= v34)
        {
          id v67 = v35 - 1;
        }
        else
        {
          v245 = v35;
          id v50 = v35;
          v51 = v34;
          do
          {
            uint64_t v52 = *v50;
            *id v50 = *v51;
            uint64_t *v51 = v52;
            do
            {
              uint64_t v53 = v50[1];
              ++v50;
              v54 = *a3;
              id v55 = [NSNumber numberWithLongLong:v53];
              unint64_t v56 = [v54 indexOfObject:v55];
              v57 = *a3;
              id v58 = [NSNumber numberWithLongLong:v26];
              unint64_t v59 = [v57 indexOfObject:v58];
            }
            while (v56 < v59);
            do
            {
              uint64_t v60 = *--v51;
              id v61 = *a3;
              id v62 = [NSNumber numberWithLongLong:v60];
              unint64_t v63 = [v61 indexOfObject:v62];
              id v64 = *a3;
              id v65 = [NSNumber numberWithLongLong:v26];
              unint64_t v66 = [v64 indexOfObject:v65];
            }
            while (v63 >= v66);
          }
          while (v50 < v51);
          id v67 = v50 - 1;
          id v35 = v245;
          uint64_t v10 = a2;
        }
        a1 = v249;
        a4 = v256;
        if (v67 != v249) {
          uint64_t *v249 = *v67;
        }
        *id v67 = v26;
        if (v35 >= v34) {
          break;
        }
LABEL_32:
        std::__introsort<std::_ClassicAlgPolicy,-[HDStatisticsCollectionCalculator orderSourceIDs:]::$_0 &,long long *,false>(v249, v67, a3, v256, a5 & 1);
        a5 = 0;
        double v11 = v67 + 1;
      }
      BOOL v68 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(HDStatisticsCollectionCalculator *)v249 orderSourceIDs:a3];
      double v11 = v67 + 1;
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,[(HDStatisticsCollectionCalculator *)v67 + 1 orderSourceIDs:a3])
      {
        break;
      }
      if (!v68) {
        goto LABEL_32;
      }
    }
    a2 = v67;
    if (!v68) {
      continue;
    }
    break;
  }
}

- (int64_t)computationMethod
{
  return self->_computationMethod;
}

- (NSArray)maskedIntervals
{
  return self->_maskedIntervals;
}

- (id)statisticsHandler
{
  return self->_statisticsHandler;
}

- (HDStatisticsCollectionCalculatorSourceOrderProvider)sourceOrderProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceOrderProvider);

  return (HDStatisticsCollectionCalculatorSourceOrderProvider *)WeakRetained;
}

- (void)setSourceOrderProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceOrderProvider);
  objc_storeStrong((id *)&self->_maskedIntervals, 0);
  objc_storeStrong(&self->_statisticsHandler, 0);
  value = self->_implementation.__ptr_.__value_;
  self->_implementation.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end