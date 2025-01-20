@interface MCMAMFIEncodedQuery
- (MCMAMFIEncodedQuery)initWithLoggingName:(id)a3 encodedQuery:(id)a4;
- (NSData)encodedQuery;
- (NSString)loggingName;
@end

@implementation MCMAMFIEncodedQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedQuery, 0);

  objc_storeStrong((id *)&self->_loggingName, 0);
}

- (NSData)encodedQuery
{
  return self->_encodedQuery;
}

- (NSString)loggingName
{
  return self->_loggingName;
}

- (MCMAMFIEncodedQuery)initWithLoggingName:(id)a3 encodedQuery:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMAMFIEncodedQuery;
  v9 = [(MCMAMFIEncodedQuery *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingName, a3);
    objc_storeStrong((id *)&v10->_encodedQuery, a4);
  }

  return v10;
}

@end