@interface SNAudioFileAnalyzer
- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error;
- (SNAudioFileAnalyzer)initWithImpl:(id)a3;
- (SNAudioFileAnalyzer)initWithURL:(NSURL *)url error:(NSError *)error;
- (id)detailedDescription;
- (id)impl;
- (void)analyze;
- (void)analyzeInRange:(id *)a3;
- (void)analyzeWithCompletionHandler:(void *)completionHandler;
- (void)cancelAnalysis;
- (void)removeAllRequests;
- (void)removeRequest:(id)request;
@end

@implementation SNAudioFileAnalyzer

- (SNAudioFileAnalyzer)initWithURL:(NSURL *)url error:(NSError *)error
{
  v6 = url;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioFileAnalyzer;
  v7 = [(SNAudioFileAnalyzer *)&v12 init];
  if (v7
    && (v8 = [[_SNAudioFileAnalyzer alloc] initWithURL:v6 error:error], impl = v7->_impl, v7->_impl = v8, impl, !v7->_impl))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (SNAudioFileAnalyzer)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAudioFileAnalyzer;
  v6 = [(SNAudioFileAnalyzer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (void)analyze
{
}

- (void)analyzeInRange:(id *)a3
{
  impl = self->_impl;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  [(_SNAudioFileAnalyzer *)impl analyzeInRange:v5];
}

- (void)analyzeWithCompletionHandler:(void *)completionHandler
{
}

- (void)cancelAnalysis
{
}

- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error
{
  return [(_SNAudioFileAnalyzer *)self->_impl addRequest:request withObserver:observer error:error];
}

- (void)removeRequest:(id)request
{
}

- (void)removeAllRequests
{
}

- (id)detailedDescription
{
  return (id)MEMORY[0x1F4181798](self->_impl, sel_detailedDescription);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end