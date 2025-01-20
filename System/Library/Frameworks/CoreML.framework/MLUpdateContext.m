@interface MLUpdateContext
+ (MLUpdateContext)updateContextWithTask:(id)a3 model:(id)a4 event:(int64_t)a5 metrics:(id)a6 parameters:(id)a7;
+ (id)updateContextForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6;
- (MLModel)model;
- (MLUpdateProgressEvent)event;
- (MLUpdateTask)task;
- (NSDictionary)metrics;
- (NSDictionary)parameters;
- (NSError)error;
- (id)description;
- (void)setError:(id)a3;
- (void)setEvent:(int64_t)a3;
- (void)setMetrics:(id)a3;
- (void)setModel:(id)a3;
- (void)setParameters:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation MLUpdateContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setMetrics:(id)a3
{
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (MLUpdateProgressEvent)event
{
  return self->_event;
}

- (void)setModel:(id)a3
{
}

- (MLModel)model
{
  return (MLModel *)self->_model;
}

- (void)setTask:(id)a3
{
}

- (MLUpdateTask)task
{
  return self->_task;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MLUpdateContext *)self task];
  v5 = [(MLUpdateContext *)self model];
  v6 = +[MLUpdateProgressHandlersUtils progressEventsToString:[(MLUpdateContext *)self event]];
  v7 = [(MLUpdateContext *)self metrics];
  v8 = [(MLUpdateContext *)self parameters];
  v9 = [v3 stringWithFormat:@"task: %p, \nmodel: %p, \nevent: %@, \nmetrics: %@, \nparameters: %@", v4, v5, v6, v7, v8];

  return v9;
}

+ (id)updateContextForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6
{
  id v9 = a6;
  v10 = +[MLUpdateContext updateContextWithTask:0 model:0 event:a3 metrics:a4 parameters:a5];
  [v10 setError:v9];

  return v10;
}

+ (MLUpdateContext)updateContextWithTask:(id)a3 model:(id)a4 event:(int64_t)a5 metrics:(id)a6 parameters:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_opt_new();
  [v15 setTask:v14];

  [v15 setModel:v13];
  [v15 setEvent:a5];
  [v15 setMetrics:v12];

  [v15 setParameters:v11];

  return (MLUpdateContext *)v15;
}

@end