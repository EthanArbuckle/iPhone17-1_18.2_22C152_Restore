@interface JFXCompositionExporter
+ (Class)compositionClass;
- (JFXComposition)composition;
- (JFXCompositionExporter)initWithClipsDataSource:(id)a3;
- (JFXCompositionPlayableElementsDataSource)clipsDataSource;
- (JFXExportDelegate)delegate;
- (JFXReaderWriterExportController)exportController;
- (NSDate)exportEndTime;
- (NSDate)exportStartTime;
- (double)timeElapsedDuringExport;
- (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5;
- (unsigned)parentCode;
- (void)cancelWithStatus:(int64_t)a3;
- (void)dealloc;
- (void)didFinishExport:(int64_t)a3;
- (void)exportAnalyticsForSessionBegin;
- (void)exportAnalyticsForSessionCompleteWithStatus:(int64_t)a3 exportMachDuration:(unint64_t)a4;
- (void)exportProgressedTo:(float)a3;
- (void)setComposition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExportController:(id)a3;
- (void)setExportEndTime:(id)a3;
- (void)setExportStartTime:(id)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)startWithPresets:(id)a3 toFilePath:(id)a4 poster:(id)a5;
- (void)tearDown;
@end

@implementation JFXCompositionExporter

- (JFXCompositionExporter)initWithClipsDataSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JFXCompositionExporter;
  v6 = [(JFXCompositionExporter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clipsDataSource, a3);
    id v8 = objc_alloc((Class)[(id)objc_opt_class() compositionClass]);
    v9 = [(JFXCompositionExporter *)v7 clipsDataSource];
    uint64_t v10 = [v8 initWithClipsDataSource:v9];
    composition = v7->_composition;
    v7->_composition = (JFXComposition *)v10;

    [v5 renderSize];
    -[JFXComposition setViewSize:](v7->_composition, "setViewSize:");
    [(JFXComposition *)v7->_composition applyExportProperties];
  }

  return v7;
}

- (void)setParentCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(JFXCompositionExporter *)self composition];
  [v4 setParentCode:v3];
}

- (unsigned)parentCode
{
  v2 = [(JFXCompositionExporter *)self composition];
  unsigned int v3 = [v2 parentCode];

  return v3;
}

- (unint64_t)estimatedFileSizeForDuration:(int)a3 frameRate:(double)a4 preset:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = [(JFXCompositionExporter *)self composition];
  [v9 viewSize];
  unint64_t v12 = +[JFXExportController estimatedFileSizeForDuration:frameRate:preset:size:](JFXExportController, "estimatedFileSizeForDuration:frameRate:preset:size:", v6, v8, a4, v10, v11);

  return v12;
}

- (void)startWithPresets:(id)a3 toFilePath:(id)a4 poster:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFF910];
  id v10 = a5;
  id v11 = a3;
  unint64_t v12 = [v9 date];
  [(JFXCompositionExporter *)self setExportStartTime:v12];

  objc_super v13 = JFXLog_export();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [(JFXCompositionExporter *)self exportStartTime];
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_INFO, "Starting export to %@ at %@", (uint8_t *)&v20, 0x16u);
  }
  v15 = [JFXReaderWriterExportController alloc];
  v16 = [(JFXCompositionExporter *)self composition];
  v17 = [(JFXExportController *)v15 initWithWithComposition:v16 presets:v11 toFile:v8 poster:v10 delegate:self];

  [(JFXCompositionExporter *)self setExportController:v17];
  v18 = [(JFXCompositionExporter *)self exportController];
  [v18 beginAsynchronousExport];

  v19 = [(JFXCompositionExporter *)self exportController];
  [v19 startProgressTimer];
}

- (void)tearDown
{
  [(JFXCompositionExporter *)self setComposition:0];
  [(JFXCompositionExporter *)self setExportController:0];
}

- (void)cancelWithStatus:(int64_t)a3
{
  id v5 = [(JFXCompositionExporter *)self exportController];
  [v5 cancelExportWithStatus:a3];

  [(JFXCompositionExporter *)self tearDown];
}

- (void)dealloc
{
  [(JFXCompositionExporter *)self tearDown];
  v3.receiver = self;
  v3.super_class = (Class)JFXCompositionExporter;
  [(JFXCompositionExporter *)&v3 dealloc];
}

- (double)timeElapsedDuringExport
{
  objc_super v3 = [(JFXCompositionExporter *)self exportEndTime];
  id v4 = [(JFXCompositionExporter *)self exportStartTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

+ (Class)compositionClass
{
  return (Class)objc_opt_class();
}

- (void)exportProgressedTo:(float)a3
{
  uint64_t v5 = [(JFXCompositionExporter *)self delegate];
  if (v5)
  {
    double v6 = (void *)v5;
    v7 = [(JFXCompositionExporter *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v10 = [(JFXCompositionExporter *)self delegate];
      *(float *)&double v9 = a3;
      [v10 exportProgressedTo:v9];
    }
  }
}

- (void)didFinishExport:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  [(JFXCompositionExporter *)self setExportEndTime:v5];

  double v6 = JFXLog_export();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [(JFXCompositionExporter *)self exportEndTime];
    int v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_INFO, "Finished exporting at %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = [(JFXCompositionExporter *)self delegate];
  if (v8)
  {
    double v9 = (void *)v8;
    id v10 = [(JFXCompositionExporter *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unint64_t v12 = [(JFXCompositionExporter *)self delegate];
      [v12 didFinishExport:a3];
    }
  }
  [(JFXCompositionExporter *)self tearDown];
}

- (void)exportAnalyticsForSessionBegin
{
  uint64_t v3 = [(JFXCompositionExporter *)self delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(JFXCompositionExporter *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(JFXCompositionExporter *)self delegate];
      [v7 exportAnalyticsForSessionBegin];
    }
  }
}

- (void)exportAnalyticsForSessionCompleteWithStatus:(int64_t)a3 exportMachDuration:(unint64_t)a4
{
  uint64_t v7 = [(JFXCompositionExporter *)self delegate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    double v9 = [(JFXCompositionExporter *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(JFXCompositionExporter *)self delegate];
      [v11 exportAnalyticsForSessionCompleteWithStatus:a3 exportMachDuration:a4];
    }
  }
}

- (JFXExportDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

- (JFXComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
}

- (JFXReaderWriterExportController)exportController
{
  return self->_exportController;
}

- (void)setExportController:(id)a3
{
}

- (NSDate)exportStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExportStartTime:(id)a3
{
}

- (NSDate)exportEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExportEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportEndTime, 0);
  objc_storeStrong((id *)&self->_exportStartTime, 0);
  objc_storeStrong((id *)&self->_exportController, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end