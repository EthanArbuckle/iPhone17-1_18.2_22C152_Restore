@interface _MXExtensionRequestDispatcher
+ (BOOL)supportsSecureCoding;
- (_MXExtensionRequestDispatcher)initWithCoder:(id)a3;
- (void)dispatchRequest:(id)a3 vendor:(id)a4 completion:(id)a5;
- (void)startSendingUpdatesForRequest:(id)a3 vendor:(id)a4 toObserver:(id)a5;
@end

@implementation _MXExtensionRequestDispatcher

- (_MXExtensionRequestDispatcher)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MXExtensionRequestDispatcher;
  return [(_MXExtensionRequestDispatcher *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dispatchRequest:(id)a3 vendor:(id)a4 completion:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = (void (**)(id, void, id))a5;
  id v7 = [v5 _errorWithExtensionServiceError:15];
  v6[2](v6, 0, v7);
}

- (void)startSendingUpdatesForRequest:(id)a3 vendor:(id)a4 toObserver:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a5;
  id v7 = [v5 _errorWithExtensionServiceError:15];
  [v6 receiveUpdatedResponse:0 error:v7];
}

@end