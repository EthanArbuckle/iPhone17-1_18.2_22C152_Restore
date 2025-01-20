@interface NLPModelTrainingDelegate
- (BOOL)modelTrainerShouldStop:(id)a3;
- (NLPModelTrainingDelegate)initWithLogHandler:(id)a3;
- (void)modelTrainer:(id)a3 logMessage:(id)a4;
@end

@implementation NLPModelTrainingDelegate

- (NLPModelTrainingDelegate)initWithLogHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLPModelTrainingDelegate;
  v5 = [(NLPModelTrainingDelegate *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = MEMORY[0x1AD0BBB20](v4);
    id logHandler = v6->_logHandler;
    v6->_id logHandler = (id)v7;
  }
  return v6;
}

- (void)modelTrainer:(id)a3 logMessage:(id)a4
{
  char v10 = 0;
  id logHandler = self->_logHandler;
  v6 = (void (*)(void *, id, char *))logHandler[2];
  id v7 = a4;
  v6(logHandler, v7, &v10);
  id v8 = v7;
  v9 = (const char *)[v8 UTF8String];

  puts(v9);
  if (v10) {
    self->_stop = 1;
  }
}

- (BOOL)modelTrainerShouldStop:(id)a3
{
  return self->_stop;
}

- (void).cxx_destruct
{
}

@end