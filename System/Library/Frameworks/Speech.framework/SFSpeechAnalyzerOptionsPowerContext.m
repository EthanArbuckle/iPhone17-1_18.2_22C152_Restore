@interface SFSpeechAnalyzerOptionsPowerContext
- (NSString)ane;
- (NSString)cpu;
- (NSString)gpu;
- (SFSpeechAnalyzerOptionsPowerContext)initWithAne:(id)a3 cpu:(id)a4 gpu:(id)a5;
@end

@implementation SFSpeechAnalyzerOptionsPowerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpu, 0);
  objc_storeStrong((id *)&self->_cpu, 0);

  objc_storeStrong((id *)&self->_ane, 0);
}

- (NSString)gpu
{
  return self->_gpu;
}

- (NSString)cpu
{
  return self->_cpu;
}

- (NSString)ane
{
  return self->_ane;
}

- (SFSpeechAnalyzerOptionsPowerContext)initWithAne:(id)a3 cpu:(id)a4 gpu:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)SFSpeechAnalyzerOptionsPowerContext;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(SFSpeechAnalyzerOptionsPowerContext *)&v18 init];
  uint64_t v11 = objc_msgSend(v9, "copy", v18.receiver, v18.super_class);

  ane = v10->_ane;
  v10->_ane = (NSString *)v11;

  uint64_t v13 = [v8 copy];
  cpu = v10->_cpu;
  v10->_cpu = (NSString *)v13;

  uint64_t v15 = [v7 copy];
  gpu = v10->_gpu;
  v10->_gpu = (NSString *)v15;

  return v10;
}

@end