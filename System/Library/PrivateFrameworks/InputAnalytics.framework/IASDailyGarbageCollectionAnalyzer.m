@interface IASDailyGarbageCollectionAnalyzer
- (BOOL)shouldBeGarbageCollected;
- (IASDailyGarbageCollectionAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4;
- (IASDailyGarbageCollectionAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5;
- (NSDate)dateOfLastAction;
- (void)consumeAction:(id)a3;
- (void)setDateOfLastAction:(id)a3;
@end

@implementation IASDailyGarbageCollectionAnalyzer

- (IASDailyGarbageCollectionAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)IASDailyGarbageCollectionAnalyzer;
  v7 = [(IASAnalyzer *)&v12 initWithAnalyzerSessionId:a3 sessionManagerDelegate:a4];
  if (v7)
  {
    v8 = objc_msgSend_date(MEMORY[0x263EFF910], v4, v5, v6);
    objc_msgSend_setDateOfLastAction_(v7, v9, (uint64_t)v8, v10);
  }
  return v7;
}

- (IASDailyGarbageCollectionAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)IASDailyGarbageCollectionAnalyzer;
  v8 = [(IASAnalyzer *)&v13 initWithAnalyzerSessionId:a3 sessionManagerDelegate:a4 eventHandler:a5];
  if (v8)
  {
    v9 = objc_msgSend_date(MEMORY[0x263EFF910], v5, v6, v7);
    objc_msgSend_setDateOfLastAction_(v8, v10, (uint64_t)v9, v11);
  }
  return v8;
}

- (void)consumeAction:(id)a3
{
  objc_msgSend_date(MEMORY[0x263EFF910], a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDateOfLastAction_(self, v5, (uint64_t)v7, v6);
}

- (BOOL)shouldBeGarbageCollected
{
  uint64_t v5 = (void *)MEMORY[0x263EFF910];
  uint64_t v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3);
  v9 = objc_msgSend_dateWithTimeInterval_sinceDate_(v5, v7, (uint64_t)v6, v8, -86400.0);

  objc_super v13 = objc_msgSend_dateOfLastAction(self, v10, v11, v12);
  LOBYTE(v6) = objc_msgSend_compare_(v9, v14, (uint64_t)v13, v15) != -1;

  return (char)v6;
}

- (NSDate)dateOfLastAction
{
  return self->_dateOfLastAction;
}

- (void)setDateOfLastAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end