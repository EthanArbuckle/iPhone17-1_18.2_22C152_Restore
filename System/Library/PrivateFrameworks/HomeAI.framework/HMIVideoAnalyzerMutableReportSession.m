@interface HMIVideoAnalyzerMutableReportSession
+ (BOOL)supportsSecureCoding;
- (HMIVideoAnalyzerMutableReportSession)initWithCoder:(id)a3;
- (HMIVideoAnalyzerMutableReportSession)initWithSource:(id)a3;
- (NSMutableArray)fragments;
- (NSString)source;
- (id)attributeDescriptions;
- (id)description;
- (void)appendFragmentResult:(id)a3 redactFrames:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation HMIVideoAnalyzerMutableReportSession

- (HMIVideoAnalyzerMutableReportSession)initWithSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIVideoAnalyzerMutableReportSession;
  v6 = [(HMIVideoAnalyzerMutableReportSession *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    fragments = v7->_fragments;
    v7->_fragments = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)appendFragmentResult:(id)a3 redactFrames:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(HMIVideoAnalyzerMutableReportSession *)self fragments];
  v7 = [v6 redactedCopyWithFrameResults:v4 fragment:1];

  [v8 addObject:v7];
}

- (id)description
{
  return (id)MEMORY[0x270F30880](self, a2);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  BOOL v4 = [(HMIVideoAnalyzerMutableReportSession *)self source];
  id v5 = (void *)[v3 initWithName:@"Source" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMIVideoAnalyzerMutableReportSession *)self fragments];
  id v8 = (void *)[v6 initWithName:@"Fragments" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIVideoAnalyzerMutableReportSession *)self source];
  id v6 = NSStringFromSelector(sel_source);
  [v4 encodeObject:v5 forKey:v6];

  id v9 = [(HMIVideoAnalyzerMutableReportSession *)self fragments];
  v7 = (void *)[v9 copy];
  id v8 = NSStringFromSelector(sel_fragments);
  [v4 encodeObject:v7 forKey:v8];
}

- (HMIVideoAnalyzerMutableReportSession)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_source);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id v8 = (void *)MEMORY[0x263EFFA08];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v10 = [v8 setWithArray:v9];
  objc_super v11 = NSStringFromSelector(sel_fragments);
  v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];

  v18.receiver = self;
  v18.super_class = (Class)HMIVideoAnalyzerMutableReportSession;
  v13 = [(HMIVideoAnalyzerMutableReportSession *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_source, v7);
    uint64_t v15 = [v12 mutableCopy];
    fragments = v14->_fragments;
    v14->_fragments = (NSMutableArray *)v15;
  }
  return v14;
}

- (NSString)source
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSource:(id)a3
{
}

- (NSMutableArray)fragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end