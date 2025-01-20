@interface TestFlightUploadSubTask
- (id)acceptHeaderValue;
- (id)contentTypeHeaderValue;
@end

@implementation TestFlightUploadSubTask

- (id)acceptHeaderValue
{
  return @"application/protobuf";
}

- (id)contentTypeHeaderValue
{
  return @"application/protobuf";
}

- (void).cxx_destruct
{
}

@end