@interface AVAudioSessionIOBinding
- (AVAudioSession)session;
- (AVAudioSessionIOBinding)initWithSession:(id)a3;
- (AVAudioSessionIOBinding)initWithSession:(id)a3 streams:(id)a4 error:(id *)a5;
- (NSArray)streams;
- (id)description;
@end

@implementation AVAudioSessionIOBinding

- (AVAudioSessionIOBinding)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSessionIOBinding;
  v6 = [(AVAudioSessionIOBinding *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AVAudioSessionIOBinding *)self session];
  id v5 = [(AVAudioSessionIOBinding *)self streams];
  v6 = [v3 stringWithFormat:@"<AVAudioSessionIOBinding@%p: session %@, streams %@>", self, v4, v5];

  return v6;
}

- (AVAudioSessionIOBinding)initWithSession:(id)a3 streams:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"Bad parameter";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a5 = [v10 errorWithDomain:@"AVAudioSession Error" code:-50 userInfo:v11];

      a5 = 0;
    }
  }
  else
  {
    a5 = [[AVAudioSessionIOBinding alloc] initWithSession:v8];
  }

  return (AVAudioSessionIOBinding *)a5;
}

- (AVAudioSession)session
{
  return self->_session;
}

- (NSArray)streams
{
  return self->_streams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end