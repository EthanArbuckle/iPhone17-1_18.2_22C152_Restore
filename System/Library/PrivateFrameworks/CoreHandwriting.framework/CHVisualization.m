@interface CHVisualization
- (BOOL)wantsInputDrawings;
- (CHRecognitionSession)recognitionSession;
- (CHVisualization)initWithRecognitionSession:(id)a3;
- (CHVisualizationDelegate)delegate;
- (int64_t)layeringPriority;
- (void)setDelegate:(id)a3;
@end

@implementation CHVisualization

- (CHVisualization)initWithRecognitionSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHVisualization;
  v6 = [(CHVisualization *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recognitionSession, a3);
  }

  return v7;
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHVisualizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CHVisualizationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
}

- (int64_t)layeringPriority
{
  return 1;
}

- (BOOL)wantsInputDrawings
{
  return 0;
}

@end