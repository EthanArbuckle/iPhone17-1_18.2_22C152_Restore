@interface _SuggestionsMessageBodyLoaderClient
- (BOOL)wantsContentsOfType:(int64_t)a3;
- (_SuggestionsMessageBodyLoaderClient)initWithLibrary:(id)a3 message:(id)a4 semaphore:(id)a5;
- (double)ordering;
- (id)message;
- (int64_t)priority;
- (void)dealloc;
@end

@implementation _SuggestionsMessageBodyLoaderClient

- (_SuggestionsMessageBodyLoaderClient)initWithLibrary:(id)a3 message:(id)a4 semaphore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SuggestionsMessageBodyLoaderClient;
  v12 = [(_SuggestionsMessageBodyLoaderClient *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_message, a4);
    objc_storeStrong((id *)&v13->_semaphore, a5);
  }

  return v13;
}

- (int64_t)priority
{
  return 0;
}

- (double)ordering
{
  v3 = [(MFMailMessage *)self->_message headersIfAvailable];

  if (!v3) {
    return 0.0;
  }
  message = self->_message;

  [(MFMailMessage *)message dateReceivedAsTimeIntervalSince1970];
  return result;
}

- (id)message
{
  return self->_message;
}

- (BOOL)wantsContentsOfType:(int64_t)a3
{
  return a3 == 1;
}

- (void)dealloc
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  v3.receiver = self;
  v3.super_class = (Class)_SuggestionsMessageBodyLoaderClient;
  [(_SuggestionsMessageBodyLoaderClient *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

@end