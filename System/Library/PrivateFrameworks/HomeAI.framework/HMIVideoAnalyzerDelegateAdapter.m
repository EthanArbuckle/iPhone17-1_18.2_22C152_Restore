@interface HMIVideoAnalyzerDelegateAdapter
- (id)analyzerDidAnalyzeFragmentWithResult;
- (id)analyzerDidAnalyzeFrameWithResult;
- (id)analyzerDidCreateTimelapseFragment;
- (id)analyzerDidFailWithError;
- (id)analyzerDidProduceAnalysisStateUpdate;
- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4;
- (void)analyzer:(id)a3 didAnalyzeFrameWithResult:(id)a4;
- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4;
- (void)analyzer:(id)a3 didFailWithError:(id)a4;
- (void)analyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4;
- (void)setAnalyzerDidAnalyzeFragmentWithResult:(id)a3;
- (void)setAnalyzerDidAnalyzeFrameWithResult:(id)a3;
- (void)setAnalyzerDidCreateTimelapseFragment:(id)a3;
- (void)setAnalyzerDidFailWithError:(id)a3;
- (void)setAnalyzerDidProduceAnalysisStateUpdate:(id)a3;
@end

@implementation HMIVideoAnalyzerDelegateAdapter

- (void)analyzer:(id)a3 didAnalyzeFrameWithResult:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidAnalyzeFrameWithResult];

  if (v7)
  {
    v8 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidAnalyzeFrameWithResult];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)analyzer:(id)a3 didAnalyzeFragmentWithResult:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidAnalyzeFragmentWithResult];

  if (v7)
  {
    v8 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidAnalyzeFragmentWithResult];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)analyzer:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidFailWithError];

  if (v7)
  {
    v8 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidFailWithError];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)analyzer:(id)a3 didCreateTimelapseFragment:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidCreateTimelapseFragment];

  if (v7)
  {
    v8 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidCreateTimelapseFragment];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)analyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidProduceAnalysisStateUpdate];

  if (v7)
  {
    v8 = [(HMIVideoAnalyzerDelegateAdapter *)self analyzerDidProduceAnalysisStateUpdate];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)analyzerDidAnalyzeFrameWithResult
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAnalyzerDidAnalyzeFrameWithResult:(id)a3
{
}

- (id)analyzerDidAnalyzeFragmentWithResult
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAnalyzerDidAnalyzeFragmentWithResult:(id)a3
{
}

- (id)analyzerDidFailWithError
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setAnalyzerDidFailWithError:(id)a3
{
}

- (id)analyzerDidCreateTimelapseFragment
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAnalyzerDidCreateTimelapseFragment:(id)a3
{
}

- (id)analyzerDidProduceAnalysisStateUpdate
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setAnalyzerDidProduceAnalysisStateUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyzerDidProduceAnalysisStateUpdate, 0);
  objc_storeStrong(&self->_analyzerDidCreateTimelapseFragment, 0);
  objc_storeStrong(&self->_analyzerDidFailWithError, 0);
  objc_storeStrong(&self->_analyzerDidAnalyzeFragmentWithResult, 0);
  objc_storeStrong(&self->_analyzerDidAnalyzeFrameWithResult, 0);
}

@end