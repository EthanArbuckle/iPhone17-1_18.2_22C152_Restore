@interface CAMStartPanoramaCommand
- (CAMPanoramaCaptureRequest)_request;
- (CAMStartPanoramaCommand)initWithCoder:(id)a3;
- (CAMStartPanoramaCommand)initWithRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStartPanoramaCommand

- (CAMStartPanoramaCommand)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartPanoramaCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMStartPanoramaCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartPanoramaCommand;
  id v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMPanoramaCaptureCommandRequest"];
    request = v5->__request;
    v5->__request = (CAMPanoramaCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMStartPanoramaCommand *)self _request];
  [v4 encodeObject:v5 forKey:@"CAMPanoramaCaptureCommandRequest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMStartPanoramaCommand;
  id v4 = [(CAMCaptureCommand *)&v9 copyWithZone:a3];
  id v5 = [(CAMStartPanoramaCommand *)self _request];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMStartPanoramaCommand *)self _request];
  [v4 startPanoramaCaptureWithRequest:v5];
}

- (CAMPanoramaCaptureRequest)_request
{
  return self->__request;
}

- (void).cxx_destruct
{
}

@end