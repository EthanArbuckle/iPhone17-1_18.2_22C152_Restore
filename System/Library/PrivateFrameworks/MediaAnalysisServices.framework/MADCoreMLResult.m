@interface MADCoreMLResult
+ (BOOL)supportsSecureCoding;
+ (id)resultWithVisionResults:(id)a3;
- (MADCoreMLResult)initWithCoder:(id)a3;
- (MADCoreMLResult)initWithVisionResults:(id)a3;
- (NSArray)observations;
- (id)description;
- (int)_packageCoreMLObservations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADCoreMLResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLResult;
  v5 = [(MADResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CoreMLObservations"];
    observations = v5->_observations;
    v5->_observations = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADCoreMLResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_observations forKey:@"CoreMLObservations"];
}

- (MADCoreMLResult)initWithVisionResults:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLResult;
  v6 = [(MADResult *)&v11 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_visionResults, a3),
        [(MADCoreMLResult *)v7 _packageCoreMLObservations]))
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }
  uint64_t v9 = v8;

  return v9;
}

+ (id)resultWithVisionResults:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithVisionResults:v4];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"%@: %lu count>", @"CoreMLObservations", -[NSArray count](self->_observations, "count")];
  return v3;
}

- (int)_packageCoreMLObservations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  visionResults = self->_visionResults;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MADCoreMLResult__packageCoreMLObservations__block_invoke;
  v9[3] = &unk_1E6CAD160;
  id v5 = v3;
  id v10 = v5;
  [(NSArray *)visionResults enumerateObjectsUsingBlock:v9];
  p_observations = &self->_observations;
  objc_storeStrong((id *)p_observations, v3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(NSArray *)*p_observations count];
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[MADCoreMLResult] Packaged %lu observations", buf, 0xCu);
  }

  return 0;
}

void __45__MADCoreMLResult__packageCoreMLObservations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 featureName];
    v6 = [v4 featureValue];
    uint64_t v7 = +[MADCoreMLObservation entryWithFeatureName:v5 featureValue:v6];

    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __45__MADCoreMLResult__packageCoreMLObservations__block_invoke_cold_1((uint64_t)v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[MADCoreMLResult] Ignoring non-compatible result class - %@", (uint8_t *)&v9, 0xCu);
  }
}

- (NSArray)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_visionResults, 0);
}

void __45__MADCoreMLResult__packageCoreMLObservations__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[MADCoreMLResult] Failed to create coreML result from %@", (uint8_t *)&v1, 0xCu);
}

@end