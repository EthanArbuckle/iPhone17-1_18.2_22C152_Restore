@interface SHHapticsEndpoint
- (SHHapticsEndpoint)initWithAdamIDURL:(id)a3 isrcURL:(id)a4;
- (SHTokenizedURL)adamIDURL;
- (SHTokenizedURL)isrcURL;
@end

@implementation SHHapticsEndpoint

- (SHHapticsEndpoint)initWithAdamIDURL:(id)a3 isrcURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHHapticsEndpoint;
  v9 = [(SHHapticsEndpoint *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_adamIDURL, a3);
    objc_storeStrong((id *)&v10->_isrcURL, a4);
  }

  return v10;
}

- (SHTokenizedURL)adamIDURL
{
  return self->_adamIDURL;
}

- (SHTokenizedURL)isrcURL
{
  return self->_isrcURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isrcURL, 0);

  objc_storeStrong((id *)&self->_adamIDURL, 0);
}

@end