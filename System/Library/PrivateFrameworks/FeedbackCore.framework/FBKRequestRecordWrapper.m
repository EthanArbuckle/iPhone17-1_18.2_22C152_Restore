@interface FBKRequestRecordWrapper
- (BOOL)isFailure;
- (FBKRequestRecord)wrappedObject;
- (FBKRequestRecordWrapper)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8;
- (FBKRequestRecordWrapper)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5;
- (void)setIsFailure:(BOOL)a3;
- (void)setWrappedObject:(id)a3;
@end

@implementation FBKRequestRecordWrapper

- (FBKRequestRecordWrapper)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FBKRequestRecordWrapper;
  v11 = [(FBKRequestRecordWrapper *)&v15 init];
  if (v11)
  {
    v12 = [(DEDRequestRecord *)[FBKRequestRecord alloc] initWithURL:v8 httpMethod:v9 responseData:v10];
    wrappedObject = v11->_wrappedObject;
    v11->_wrappedObject = v12;
  }
  return v11;
}

- (FBKRequestRecordWrapper)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FBKRequestRecordWrapper;
  v20 = [(FBKRequestRecordWrapper *)&v24 init];
  if (v20)
  {
    v21 = [(DEDRequestRecord *)[FBKRequestRecord alloc] initWithRequest:v14 response:v15 session:v16 cookies:v17 body:v18 error:v19];
    wrappedObject = v20->_wrappedObject;
    v20->_wrappedObject = v21;
  }
  return v20;
}

- (void)setIsFailure:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FBKRequestRecordWrapper *)self wrappedObject];
  [v4 setIsFailure:v3];
}

- (FBKRequestRecord)wrappedObject
{
  return self->_wrappedObject;
}

- (void)setWrappedObject:(id)a3
{
}

- (BOOL)isFailure
{
  return self->_isFailure;
}

- (void).cxx_destruct
{
}

@end