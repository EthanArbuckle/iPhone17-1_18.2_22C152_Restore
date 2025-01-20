@interface AVSecondScreenContentViewConnection
- (AVSecondScreenContentViewConnection)initWithContentView:(id)a3;
- (void)dealloc;
- (void)startUpdates;
@end

@implementation AVSecondScreenContentViewConnection

- (void)startUpdates
{
  v3 = [(AVSecondScreenConnection *)self observationController];

  if (!v3)
  {
    v4 = [[AVObservationController alloc] initWithOwner:self];
    [(AVSecondScreenConnection *)self setObservationController:v4];

    v5 = [(AVSecondScreenConnection *)self observationController];
    id v6 = (id)[v5 startObserving:self keyPath:@"player.currentItem.asset" observationHandler:&__block_literal_global_189];

    [(AVSecondScreenConnection *)self _updatePreferredDisplayCriteria];
  }
}

uint64_t __51__AVSecondScreenContentViewConnection_startUpdates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updatePreferredDisplayCriteria];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(AVSecondScreenConnection *)self observationController];
  [v3 stopAllObservation];

  v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AVSecondScreenContentViewConnection dealloc]";
    __int16 v8 = 1024;
    int v9 = 380;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVSecondScreenContentViewConnection;
  [(AVSecondScreenConnection *)&v5 dealloc];
}

- (AVSecondScreenContentViewConnection)initWithContentView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVSecondScreenContentViewConnection;
  objc_super v5 = [(AVSecondScreenContentViewConnection *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(AVSecondScreenConnection *)v5 setContentView:v4];
  }

  return v6;
}

@end