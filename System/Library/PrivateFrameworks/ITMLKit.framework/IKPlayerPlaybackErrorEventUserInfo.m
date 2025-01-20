@interface IKPlayerPlaybackErrorEventUserInfo
- (BOOL)shouldStopDueToError;
- (IKPlayerPlaybackErrorEventUserInfo)initWithError:(id)a3 shouldStopDueToError:(BOOL)a4;
- (NSDictionary)properties;
- (NSError)error;
@end

@implementation IKPlayerPlaybackErrorEventUserInfo

- (IKPlayerPlaybackErrorEventUserInfo)initWithError:(id)a3 shouldStopDueToError:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKPlayerPlaybackErrorEventUserInfo;
  v8 = [(IKPlayerPlaybackErrorEventUserInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a3);
    v9->_shouldStopDueToError = a4;
  }

  return v9;
}

- (NSDictionary)properties
{
  v3 = [(NSError *)self->_error localizedFailureReason];
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v4 = [IKJSError alloc];
  error = self->_error;
  v6 = +[IKAppContext currentAppContext];
  id v7 = [(IKJSError *)v4 initWithError:error appContext:v6];

  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v8 setObject:v3 forKeyedSubscript:@"reason"];
  [v8 setObject:v7 forKeyedSubscript:@"error"];
  v9 = [NSNumber numberWithBool:self->_shouldStopDueToError];
  [v8 setObject:v9 forKeyedSubscript:@"shouldStopDueToError"];

  v10 = (void *)[v8 copy];
  return (NSDictionary *)v10;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)shouldStopDueToError
{
  return self->_shouldStopDueToError;
}

- (void).cxx_destruct
{
}

@end