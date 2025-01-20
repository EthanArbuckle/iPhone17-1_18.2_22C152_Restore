@interface CoreDAVPutStreamTask
- (id)requestBody;
- (id)requestBodyStream;
@end

@implementation CoreDAVPutStreamTask

- (id)requestBodyStream
{
  v2 = (void *)MEMORY[0x263EFF950];
  v3 = [(CoreDAVPostOrPutTask *)self requestDataPayload];
  v4 = [v2 inputStreamWithData:v3];

  return v4;
}

- (id)requestBody
{
  return 0;
}

@end