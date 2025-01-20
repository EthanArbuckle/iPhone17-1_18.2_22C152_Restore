@interface CNGeminiInteraction
- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5;
- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5 destinationContactIdentifier:(id)a6;
- (NSString)contactIdentifier;
- (NSString)handle;
- (int64_t)directionality;
- (int64_t)transport;
@end

@implementation CNGeminiInteraction

- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5
{
  return [(CNGeminiInteraction *)self initWithTransport:a3 directionality:a4 destinationHandle:a5 destinationContactIdentifier:0];
}

- (CNGeminiInteraction)initWithTransport:(int64_t)a3 directionality:(int64_t)a4 destinationHandle:(id)a5 destinationContactIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNGeminiInteraction;
  v12 = [(CNGeminiInteraction *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_transport = a3;
    v12->_directionality = a4;
    uint64_t v14 = [v10 copy];
    handle = v13->_handle;
    v13->_handle = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (int64_t)transport
{
  return self->_transport;
}

- (int64_t)directionality
{
  return self->_directionality;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end