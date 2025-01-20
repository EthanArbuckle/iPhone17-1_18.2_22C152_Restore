@interface HMIVideoAnalyzerFragmentResult
+ (BOOL)supportsSecureCoding;
- (HMIVideoAnalyzerDynamicConfiguration)configuration;
- (HMIVideoAnalyzerFragmentResult)initWithCoder:(id)a3;
- (HMIVideoAnalyzerFragmentResult)initWithFragment:(id)a3 events:(id)a4 frameResults:(id)a5 thumbnails:(id)a6 configuration:(id)a7 outcome:(id)a8;
- (HMIVideoAnalyzerResultOutcome)outcome;
- (HMIVideoFragment)fragment;
- (NSArray)frameResults;
- (NSArray)thumbnails;
- (NSSet)events;
- (NSString)description;
- (id)attributeDescriptions;
- (id)maxConfidenceEventForEventClass:(Class)a3;
- (id)maxConfidenceEvents;
- (id)redactedCopyWithFrameResults:(BOOL)a3 fragment:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIVideoAnalyzerFragmentResult

- (HMIVideoAnalyzerFragmentResult)initWithFragment:(id)a3 events:(id)a4 frameResults:(id)a5 thumbnails:(id)a6 configuration:(id)a7 outcome:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMIVideoAnalyzerFragmentResult;
  v18 = [(HMIVideoAnalyzerFragmentResult *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fragment, a3);
    objc_storeStrong((id *)&v19->_events, a4);
    objc_storeStrong((id *)&v19->_frameResults, a5);
    objc_storeStrong((id *)&v19->_thumbnails, a6);
    objc_storeStrong((id *)&v19->_configuration, a7);
    objc_storeStrong((id *)&v19->_outcome, a8);
  }

  return v19;
}

- (id)redactedCopyWithFrameResults:(BOOL)a3 fragment:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(HMIVideoAnalyzerFragmentResult *)self frameResults];
  v8 = [(HMIVideoAnalyzerFragmentResult *)self thumbnails];
  if (v5)
  {
    v9 = [(HMIVideoAnalyzerFragmentResult *)self frameResults];
    uint64_t v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_29);

    v11 = [(HMIVideoAnalyzerFragmentResult *)self thumbnails];
    uint64_t v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_3);

    v8 = (void *)v12;
    v7 = (void *)v10;
  }
  v13 = [(HMIVideoAnalyzerFragmentResult *)self fragment];
  v14 = v13;
  if (v4)
  {
    uint64_t v15 = [v13 redactedCopy];

    v14 = (void *)v15;
  }
  id v16 = objc_alloc((Class)objc_opt_class());
  id v17 = [(HMIVideoAnalyzerFragmentResult *)self events];
  v18 = [(HMIVideoAnalyzerFragmentResult *)self configuration];
  v19 = [(HMIVideoAnalyzerFragmentResult *)self outcome];
  v20 = (void *)[v16 initWithFragment:v14 events:v17 frameResults:v7 thumbnails:v8 configuration:v18 outcome:v19];

  return v20;
}

uint64_t __72__HMIVideoAnalyzerFragmentResult_redactedCopyWithFrameResults_fragment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 redactedCopy];
}

uint64_t __72__HMIVideoAnalyzerFragmentResult_redactedCopyWithFrameResults_fragment___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 redactedCopy];
}

- (id)maxConfidenceEventForEventClass:(Class)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  BOOL v5 = [(HMIVideoAnalyzerFragmentResult *)self frameResults];
  v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_6);
  v7 = [(HMIVideoAnalyzerFragmentResult *)self events];
  v8 = [v7 allObjects];
  v9 = [v6 arrayByAddingObjectsFromArray:v8];

  uint64_t v10 = objc_msgSend(v9, "na_flatMap:", &__block_literal_global_9_3);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_3;
  v15[3] = &__block_descriptor_40_e31_B16__0__HMIVideoAnalyzerEvent_8lu32l8;
  v15[4] = a3;
  v11 = objc_msgSend(v10, "na_filter:", v15);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_4;
  v14[3] = &unk_26477BE58;
  v14[4] = &v16;
  objc_msgSend(v11, "na_each:", v14);
  id v12 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v12;
}

id __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  v3 = [v2 allObjects];

  return v3;
}

uint64_t __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 allEvents];
}

uint64_t __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

void __66__HMIVideoAnalyzerFragmentResult_maxConfidenceEventForEventClass___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  id v14 = v4;
  if (v7)
  {
    v8 = [v4 confidence];
    [v8 value];
    double v10 = v9;
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) confidence];
    [v11 value];
    double v13 = v12;

    if (v10 <= v13) {
      goto LABEL_5;
    }
    v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

- (id)maxConfidenceEvents
{
  v3 = +[HMIVideoAnalyzerEvent eventClasses];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMIVideoAnalyzerFragmentResult_maxConfidenceEvents__block_invoke;
  v6[3] = &unk_26477BE80;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

uint64_t __53__HMIVideoAnalyzerFragmentResult_maxConfidenceEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) maxConfidenceEventForEventClass:a2];
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v21[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMIVideoAnalyzerFragmentResult *)self maxConfidenceEvents];
  v19 = [v20 allObjects];
  id v4 = (void *)[v3 initWithName:@"Max Confidence Events" value:v19];
  v21[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = [(HMIVideoAnalyzerFragmentResult *)self frameResults];
  uint64_t v7 = (void *)[v5 initWithName:@"Frame Results" value:v6];
  v21[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  double v9 = [(HMIVideoAnalyzerFragmentResult *)self thumbnails];
  double v10 = (void *)[v8 initWithName:@"Thumbnails" value:v9];
  v21[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  double v12 = [(HMIVideoAnalyzerFragmentResult *)self fragment];
  double v13 = (void *)[v11 initWithName:@"Fragment" value:v12];
  v21[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v15 = [(HMIVideoAnalyzerFragmentResult *)self configuration];
  uint64_t v16 = (void *)[v14 initWithName:@"Configuration" value:v15];
  v21[4] = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:5];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIVideoAnalyzerFragmentResult)initWithCoder:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_fragment);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  double v10 = [v8 setWithArray:v9];
  id v11 = NSStringFromSelector(sel_events);
  double v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];

  double v13 = (void *)MEMORY[0x263EFFA08];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  uint64_t v15 = [v13 setWithArray:v14];
  uint64_t v16 = NSStringFromSelector(sel_frameResults);
  id v17 = [v4 decodeObjectOfClasses:v15 forKey:v16];

  uint64_t v18 = (void *)MEMORY[0x263EFFA08];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v20 = [v18 setWithArray:v19];
  id v21 = NSStringFromSelector(sel_thumbnails);
  id v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];

  uint64_t v23 = objc_opt_class();
  objc_super v24 = NSStringFromSelector(sel_configuration);
  v25 = [v4 decodeObjectOfClass:v23 forKey:v24];

  uint64_t v26 = objc_opt_class();
  v27 = NSStringFromSelector(sel_outcome);
  v28 = [v4 decodeObjectOfClass:v26 forKey:v27];

  v29 = [(HMIVideoAnalyzerFragmentResult *)self initWithFragment:v7 events:v12 frameResults:v17 thumbnails:v22 configuration:v25 outcome:v28];
  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMIVideoAnalyzerFragmentResult *)self fragment];
  v6 = NSStringFromSelector(sel_fragment);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(HMIVideoAnalyzerFragmentResult *)self events];
  id v8 = NSStringFromSelector(sel_events);
  [v4 encodeObject:v7 forKey:v8];

  double v9 = [(HMIVideoAnalyzerFragmentResult *)self frameResults];
  double v10 = NSStringFromSelector(sel_frameResults);
  [v4 encodeObject:v9 forKey:v10];

  id v11 = [(HMIVideoAnalyzerFragmentResult *)self thumbnails];
  double v12 = NSStringFromSelector(sel_thumbnails);
  [v4 encodeObject:v11 forKey:v12];

  double v13 = [(HMIVideoAnalyzerFragmentResult *)self configuration];
  id v14 = NSStringFromSelector(sel_configuration);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(HMIVideoAnalyzerFragmentResult *)self outcome];
  uint64_t v15 = NSStringFromSelector(sel_outcome);
  [v4 encodeObject:v16 forKey:v15];
}

- (HMIVideoFragment)fragment
{
  return (HMIVideoFragment *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)thumbnails
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMIVideoAnalyzerResultOutcome)outcome
{
  return (HMIVideoAnalyzerResultOutcome *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)frameResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMIVideoAnalyzerDynamicConfiguration)configuration
{
  return (HMIVideoAnalyzerDynamicConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)events
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_frameResults, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_thumbnails, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
}

@end