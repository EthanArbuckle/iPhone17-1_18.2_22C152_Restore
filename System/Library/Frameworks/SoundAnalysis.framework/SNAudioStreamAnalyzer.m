@interface SNAudioStreamAnalyzer
- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6;
- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error;
- (SNAudioStreamAnalyzer)init;
- (SNAudioStreamAnalyzer)initWithFormat:(AVAudioFormat *)format;
- (SNAudioStreamAnalyzer)initWithImpl:(id)a3;
- (SNAudioStreamAnalyzer)new;
- (id)detailedDescription;
- (id)impl;
- (void)analyzeAudioBuffer:(AVAudioBuffer *)audioBuffer atAudioFramePosition:(AVAudioFramePosition)audioFramePosition;
- (void)completeAnalysis;
- (void)removeAllRequests;
- (void)removeRequest:(id)request;
@end

@implementation SNAudioStreamAnalyzer

- (SNAudioStreamAnalyzer)init
{
  return 0;
}

- (SNAudioStreamAnalyzer)new
{
  return 0;
}

- (SNAudioStreamAnalyzer)initWithFormat:(AVAudioFormat *)format
{
  v4 = format;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioStreamAnalyzer;
  v5 = [(SNAudioStreamAnalyzer *)&v12 init];
  if (v5)
  {
    id v11 = 0;
    v6 = [[_SNAudioStreamAnalyzer alloc] initWithFormat:v4 error:&v11];
    id v7 = v11;
    impl = v5->_impl;
    v5->_impl = v6;

    if (!v5->_impl)
    {
      v9 = +[SNError exceptionFromError:v7];
      [v9 raise];
    }
  }

  return v5;
}

- (SNAudioStreamAnalyzer)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNAudioStreamAnalyzer;
  v6 = [(SNAudioStreamAnalyzer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_impl, a3);
  }

  return v7;
}

- (BOOL)addRequest:(id)request withObserver:(id)observer error:(NSError *)error
{
  return [(_SNAudioStreamAnalyzer *)self->_impl addRequest:request withObserver:observer error:error];
}

- (void)removeRequest:(id)request
{
}

- (void)removeAllRequests
{
}

- (void)analyzeAudioBuffer:(AVAudioBuffer *)audioBuffer atAudioFramePosition:(AVAudioFramePosition)audioFramePosition
{
}

- (void)completeAnalysis
{
}

- (id)detailedDescription
{
  return (id)MEMORY[0x1F4181798](self->_impl, sel_detailedDescription);
}

- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self->_impl, sel_addRequest_completionHandler_resultsHandler_error_);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
}

@end