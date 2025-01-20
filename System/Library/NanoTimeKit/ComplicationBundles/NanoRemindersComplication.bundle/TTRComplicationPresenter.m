@interface TTRComplicationPresenter
+ (Class)templateGeneratorClassForComplicationFamily:(int64_t)a3;
+ (id)templateGeneratorForComplicationFamily:(int64_t)a3;
- (NSURL)launchURLForTimelineEntries;
- (TTRComplicationPresenter)initWithModelSource:(id)a3 router:(id)a4 complicationFamily:(int64_t)a5;
- (TTRComplicationPresenterDelegate)delegate;
- (TTRComplicationRouting)router;
- (TTRComplicationTemplateGenerating)templateGenerator;
- (TTRComplicationTimelineModelSource)modelSource;
- (TTRComplicationViewModel)viewModel;
- (void)complicationTimelineModelSourceModelDidChange:(id)a3;
- (void)pauseViewModelUpdates;
- (void)resumeViewModelUpdates;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation TTRComplicationPresenter

- (TTRComplicationPresenter)initWithModelSource:(id)a3 router:(id)a4 complicationFamily:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TTRComplicationPresenter;
  v11 = [(TTRComplicationPresenter *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_modelSource, a3);
    [(TTRComplicationTimelineModelSource *)v12->_modelSource setDelegate:v12];
    objc_storeStrong((id *)&v12->_router, a4);
    v13 = [(id)objc_opt_class() templateGeneratorForComplicationFamily:a5];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = +[REMLog ui];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_AFA0(a5, v16);
      }

      v15 = objc_alloc_init(TTREmptyComplicationTemplateGenerator);
    }
    templateGenerator = v12->_templateGenerator;
    v12->_templateGenerator = (TTRComplicationTemplateGenerating *)v15;

    [(TTRComplicationPresenter *)v12 complicationTimelineModelSourceModelDidChange:v12->_modelSource];
  }

  return v12;
}

- (void)complicationTimelineModelSourceModelDidChange:(id)a3
{
  id v4 = a3;
  v5 = [TTRComplicationTimelineViewModel alloc];
  id v8 = [v4 model];

  v6 = [(TTRComplicationPresenter *)self templateGenerator];
  v7 = [(TTRComplicationTimelineViewModel *)v5 initWithTimelineModel:v8 templateGenerator:v6];
  [(TTRComplicationPresenter *)self setViewModel:v7];
}

- (void)pauseViewModelUpdates
{
  id v2 = [(TTRComplicationPresenter *)self modelSource];
  [v2 pauseUpdates];
}

- (void)resumeViewModelUpdates
{
  id v2 = [(TTRComplicationPresenter *)self modelSource];
  [v2 resumeUpdates];
}

- (NSURL)launchURLForTimelineEntries
{
  v3 = [(TTRComplicationPresenter *)self viewModel];
  id v4 = +[NSDate date];
  v5 = [v3 entriesInSameDayAsDate:v4 limit:1];

  v6 = [(TTRComplicationPresenter *)self router];
  v7 = objc_msgSend(v6, "launchURLForTimelineWithEntryCount:", objc_msgSend(v5, "count"));

  return (NSURL *)v7;
}

+ (Class)templateGeneratorClassForComplicationFamily:(int64_t)a3
{
  if (NTKComplicationFamilyUtilitarianLargeNarrow == a3 || (unint64_t)a3 <= 0xC && ((0x1FDFu >> a3) & 1) != 0)
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return (Class)v3;
}

+ (id)templateGeneratorForComplicationFamily:(int64_t)a3
{
  id v3 = objc_alloc_init((Class)[a1 templateGeneratorClassForComplicationFamily:a3]);

  return v3;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
  id v4 = [(TTRComplicationPresenter *)self delegate];
  [v4 complicationPresenterDidUpdateViewModel:self];
}

- (TTRComplicationViewModel)viewModel
{
  return self->_viewModel;
}

- (TTRComplicationPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTRComplicationPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TTRComplicationTimelineModelSource)modelSource
{
  return self->_modelSource;
}

- (TTRComplicationRouting)router
{
  return self->_router;
}

- (TTRComplicationTemplateGenerating)templateGenerator
{
  return self->_templateGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateGenerator, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_modelSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end