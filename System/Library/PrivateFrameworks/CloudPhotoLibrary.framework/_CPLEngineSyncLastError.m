@interface _CPLEngineSyncLastError
@end

@implementation _CPLEngineSyncLastError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end