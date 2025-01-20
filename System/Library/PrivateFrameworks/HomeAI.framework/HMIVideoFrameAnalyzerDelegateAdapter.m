@interface HMIVideoFrameAnalyzerDelegateAdapter
- (id)frameAnalyzerDidAnalyzeFrame;
- (id)frameAnalyzerDidProduceAnalysisStateUpdate;
- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4;
- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4;
- (void)setFrameAnalyzerDidAnalyzeFrame:(id)a3;
- (void)setFrameAnalyzerDidProduceAnalysisStateUpdate:(id)a3;
@end

@implementation HMIVideoFrameAnalyzerDelegateAdapter

- (void)frameAnalyzer:(id)a3 didAnalyzeFrame:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoFrameAnalyzerDelegateAdapter *)self frameAnalyzerDidAnalyzeFrame];

  if (v7)
  {
    v8 = [(HMIVideoFrameAnalyzerDelegateAdapter *)self frameAnalyzerDidAnalyzeFrame];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)frameAnalyzer:(id)a3 didProduceAnalysisStateUpdate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoFrameAnalyzerDelegateAdapter *)self frameAnalyzerDidProduceAnalysisStateUpdate];

  if (v7)
  {
    v8 = [(HMIVideoFrameAnalyzerDelegateAdapter *)self frameAnalyzerDidProduceAnalysisStateUpdate];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)frameAnalyzerDidAnalyzeFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameAnalyzerDidAnalyzeFrame:(id)a3
{
}

- (id)frameAnalyzerDidProduceAnalysisStateUpdate
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameAnalyzerDidProduceAnalysisStateUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameAnalyzerDidProduceAnalysisStateUpdate, 0);
  objc_storeStrong(&self->_frameAnalyzerDidAnalyzeFrame, 0);
}

@end