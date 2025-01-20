@interface IASAnalyzer
- (BOOL)shouldBeGarbageCollected;
- (IASAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4;
- (IASAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5;
- (IASAnalyzerErrors)sessionErrors;
- (IASSessionManager)sessionManagerDelegate;
- (NSUUID)analyzerSessionId;
- (_NSRange)depthRange;
- (id)eventHandler;
- (void)setAnalyzerSessionId:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setSessionErrors:(id)a3;
- (void)setSessionManagerDelegate:(id)a3;
@end

@implementation IASAnalyzer

- (IASAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4
{
  return (IASAnalyzer *)objc_msgSend_initWithAnalyzerSessionId_sessionManagerDelegate_eventHandler_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (IASAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)IASAnalyzer;
  v11 = [(IASAnalyzer *)&v22 init];
  if (v11)
  {
    v12 = objc_alloc_init(IASAnalyzerErrors);
    objc_msgSend_setSessionErrors_(v11, v13, (uint64_t)v12, v14);

    objc_msgSend_setEventHandler_(v11, v15, (uint64_t)v10, v16);
    objc_msgSend_setAnalyzerSessionId_(v11, v17, (uint64_t)v8, v18);
    objc_msgSend_setSessionManagerDelegate_(v11, v19, (uint64_t)v9, v20);
  }

  return v11;
}

- (BOOL)shouldBeGarbageCollected
{
  return 0;
}

- (_NSRange)depthRange
{
  NSUInteger length = self->depthRange.length;
  NSUInteger location = self->depthRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)eventHandler
{
  return self->eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (NSUUID)analyzerSessionId
{
  return self->analyzerSessionId;
}

- (void)setAnalyzerSessionId:(id)a3
{
}

- (IASSessionManager)sessionManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sessionManagerDelegate);
  return (IASSessionManager *)WeakRetained;
}

- (void)setSessionManagerDelegate:(id)a3
{
}

- (IASAnalyzerErrors)sessionErrors
{
  return self->sessionErrors;
}

- (void)setSessionErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sessionErrors, 0);
  objc_destroyWeak((id *)&self->sessionManagerDelegate);
  objc_storeStrong((id *)&self->analyzerSessionId, 0);
  objc_storeStrong(&self->eventHandler, 0);
}

@end