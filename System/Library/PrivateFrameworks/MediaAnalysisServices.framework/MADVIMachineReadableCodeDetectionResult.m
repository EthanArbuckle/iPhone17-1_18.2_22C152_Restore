@interface MADVIMachineReadableCodeDetectionResult
+ (BOOL)supportsSecureCoding;
- (MADVIMachineReadableCodeDetectionResult)initWithCoder:(id)a3;
- (MADVIMachineReadableCodeDetectionResult)initWithObservations:(id)a3;
- (NSArray)observations;
- (NSArray)resultItems;
- (double)executionTimeInterval;
- (id)description;
- (unint64_t)executionNanoseconds;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIMachineReadableCodeDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIMachineReadableCodeDetectionResult)initWithObservations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  v6 = [(MADResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observations, a3);
  }

  return v7;
}

- (MADVIMachineReadableCodeDetectionResult)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  id v5 = [(MADResult *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v7 = (void *)getVNBarcodeObservationClass_softClass;
    uint64_t v19 = getVNBarcodeObservationClass_softClass;
    if (!getVNBarcodeObservationClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getVNBarcodeObservationClass_block_invoke;
      v15[3] = &unk_1E6CAD0C8;
      v15[4] = &v16;
      __getVNBarcodeObservationClass_block_invoke((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v16, 8);
    v20[1] = objc_opt_class();
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v10 = [v6 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Observations"];
    observations = v5->_observations;
    v5->_observations = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_observations, @"Observations", v5.receiver, v5.super_class);
}

- (unint64_t)executionNanoseconds
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  return [(MADResult *)&v3 executionNanoseconds];
}

- (double)executionTimeInterval
{
  v3.receiver = self;
  v3.super_class = (Class)MADVIMachineReadableCodeDetectionResult;
  [(MADResult *)&v3 executionTimeInterval];
  return result;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"observations: %@>", self->_observations];
  return v3;
}

- (NSArray)resultItems
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = self->_observations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v10 = [MADVIMachineReadableCodeDetectionResultItem alloc];
        objc_msgSend(v9, "topLeft", (void)v32);
        double v12 = v11;
        double v14 = v13;
        [v9 topRight];
        double v16 = v15;
        double v18 = v17;
        [v9 bottomLeft];
        double v20 = v19;
        double v22 = v21;
        [v9 bottomRight];
        double v24 = v23;
        double v26 = v25;
        v27 = [v9 symbology];
        v28 = [v9 payloadStringValue];
        v29 = [v9 barcodeDescriptor];
        v30 = -[MADVIMachineReadableCodeDetectionResultItem initWithTopLeft:topRight:bottomLeft:bottomRight:symbology:payload:andDescriptor:](v10, "initWithTopLeft:topRight:bottomLeft:bottomRight:symbology:payload:andDescriptor:", v27, v28, v29, v12, v14, v16, v18, v20, v22, v24, v26);
        [v3 addObject:v30];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
}

@end