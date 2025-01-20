@interface _MXExtensionVendorContext
- (id)_errorForVendor:(id)a3 requestDispatcher:(id)a4;
- (void)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5;
- (void)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5;
- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4;
@end

@implementation _MXExtensionVendorContext

- (void)handleRequest:(id)a3 requestDispatcher:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = [(_MXExtensionVendorContext *)self _principalObject];
  v11 = [(_MXExtensionVendorContext *)self _errorForVendor:v10 requestDispatcher:v8];
  if (v11) {
    v9[2](v9, 0, v11);
  }
  else {
    [v8 dispatchRequest:v12 vendor:v10 completion:v9];
  }
}

- (void)startSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4 toObserver:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(_MXExtensionVendorContext *)self _principalObject];
  v11 = [(_MXExtensionVendorContext *)self _errorForVendor:v10 requestDispatcher:v8];
  if (v11)
  {
    [v9 receiveUpdatedResponse:0 error:v11];
  }
  else
  {
    objc_storeStrong((id *)&self->_observer, a5);
    [v8 startSendingUpdatesForRequest:v12 vendor:v10 toObserver:v9];
  }
}

- (void)stopSendingUpdatesForRequest:(id)a3 requestDispatcher:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_observer)
  {
    v7 = [(_MXExtensionVendorContext *)self _principalObject];
    id v8 = [(_MXExtensionVendorContext *)self _errorForVendor:v7 requestDispatcher:v6];
    observer = self->_observer;
    if (v8)
    {
      [(_MXExtensionResponseObserver *)observer receiveUpdatedResponse:0 error:v8];
    }
    else
    {
      self->_observer = 0;

      [v6 stopSendingUpdatesForRequest:v10 vendor:v7];
    }
  }
}

- (id)_errorForVendor:(id)a3 requestDispatcher:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 11;
LABEL_12:
    id v9 = [v10 _errorWithExtensionServiceError:v11];
    goto LABEL_13;
  }
  if (!v6)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 12;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = 13;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    id v9 = 0;
    goto LABEL_13;
  }
  id v8 = [v7 serviceProtocol];
  if (v8)
  {
    if ([v5 conformsToProtocol:v8])
    {

      goto LABEL_8;
    }
    uint64_t v13 = 7;
  }
  else
  {
    uint64_t v13 = 14;
  }
  id v9 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:v13];

LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
}

@end