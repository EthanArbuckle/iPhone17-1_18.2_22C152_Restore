@interface MCMActionArgumentBase
- (MCMActionArgumentBase)initWithString:(id)a3;
- (NSString)string;
- (NSURL)fileURL;
@end

@implementation MCMActionArgumentBase

- (void).cxx_destruct
{
  p_string = &self->_string;

  objc_storeStrong((id *)p_string, 0);
}

- (NSString)string
{
  return self->_string;
}

- (NSURL)fileURL
{
  return 0;
}

- (MCMActionArgumentBase)initWithString:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMActionArgumentBase;
  v6 = [(MCMActionArgumentBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_string, a3);
  }

  return v7;
}

@end