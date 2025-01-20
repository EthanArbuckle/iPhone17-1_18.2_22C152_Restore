@interface PKVisualizationManager
+ (id)availableRecognitionStatusKeys;
+ (id)localizedNameForRecognitionStatusKey:(id)a3;
- (BOOL)recognitionStatusReportingEnabled;
- (CHVisualizationManager)chVisualizationManager;
- (PKVisualizationManager)delegate;
- (PKVisualizationManager)initWithRecognitionSession:(id)a3;
- (id)valueForRecognitionStatusKey:(id)a3;
- (void)dealloc;
- (void)setChVisualizationManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecognitionStatusReportingEnabled:(BOOL)a3;
- (void)visualizationManagerDidUpdateSessionStatus:(id)a3;
@end

@implementation PKVisualizationManager

- (PKVisualizationManager)initWithRecognitionSession:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKVisualizationManager;
  id v3 = a3;
  v4 = [(PKVisualizationManager *)&v10 init];
  id v5 = objc_alloc(MEMORY[0x1E4F5C0E0]);
  uint64_t v6 = objc_msgSend(v5, "initWithRecognitionSession:", v3, v10.receiver, v10.super_class);

  chVisualizationManager = v4->_chVisualizationManager;
  v4->_chVisualizationManager = (CHVisualizationManager *)v6;

  v8 = [(PKVisualizationManager *)v4 chVisualizationManager];
  [v8 setDelegate:v4];

  return v4;
}

- (void)dealloc
{
  id v3 = [(PKVisualizationManager *)self chVisualizationManager];
  [v3 setDelegate:0];

  [(PKVisualizationManager *)self setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)PKVisualizationManager;
  [(PKVisualizationManager *)&v4 dealloc];
}

- (BOOL)recognitionStatusReportingEnabled
{
  v2 = [(PKVisualizationManager *)self chVisualizationManager];
  char v3 = [v2 statusReportingEnabled];

  return v3;
}

- (void)setRecognitionStatusReportingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKVisualizationManager *)self chVisualizationManager];
  [v4 setStatusReportingEnabled:v3];
}

+ (id)availableRecognitionStatusKeys
{
  return (id)[MEMORY[0x1E4F5C0E0] availableRecognitionSessionStatusKeys];
}

+ (id)localizedNameForRecognitionStatusKey:(id)a3
{
  return (id)[MEMORY[0x1E4F5C0E0] localizedNameForRecognitionSessionStatusKey:a3];
}

- (id)valueForRecognitionStatusKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKVisualizationManager *)self chVisualizationManager];
  uint64_t v6 = [v5 valueForRecognitionStatusKey:v4];

  return v6;
}

- (void)visualizationManagerDidUpdateSessionStatus:(id)a3
{
  uint64_t v4 = [(PKVisualizationManager *)self delegate];
  id v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    char v6 = objc_opt_respondsToSelector();
    id v5 = v7;
    if (v6)
    {
      [v7 visualizationManagerDidUpdateRecognitionStatus:self];
      id v5 = v7;
    }
  }
}

- (PKVisualizationManager)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKVisualizationManager *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHVisualizationManager)chVisualizationManager
{
  return self->_chVisualizationManager;
}

- (void)setChVisualizationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chVisualizationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end