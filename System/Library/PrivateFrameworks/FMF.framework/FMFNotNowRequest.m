@interface FMFNotNowRequest
+ (BOOL)supportsSecureCoding;
+ (id)notNowRequestToHandles:(id)a3 fromHandle:(id)a4;
- (FMFHandle)fromHandle;
- (FMFNotNowRequest)initWithCoder:(id)a3;
- (FMFNotNowRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 requestId:(id)a5;
- (NSSet)toHandles;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setToHandles:(id)a3;
@end

@implementation FMFNotNowRequest

- (FMFNotNowRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 requestId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (FMFNotNowRequest *)objc_alloc_init((Class)objc_opt_class());

  [(FMFNotNowRequest *)v11 setFromHandle:v10];
  if (v8)
  {
    v12 = [MEMORY[0x263EFFA08] setWithObject:v8];
    [(FMFNotNowRequest *)v11 setToHandles:v12];
  }
  [(FMFNotNowRequest *)v11 setRequestId:v9];

  return v11;
}

+ (id)notNowRequestToHandles:(id)a3 fromHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setToHandles:v6];

  [v7 setFromHandle:v5];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(FMFNotNowRequest *)self requestId];
  [v4 setRequestId:v5];

  id v6 = [(FMFNotNowRequest *)self fromHandle];
  [v4 setFromHandle:v6];

  id v7 = [(FMFNotNowRequest *)self toHandles];
  [v4 setToHandles:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFNotNowRequest *)self requestId];
  [v4 encodeObject:v5 forKey:@"requestId"];

  id v6 = [(FMFNotNowRequest *)self fromHandle];
  [v4 encodeObject:v6 forKey:@"fromHandle"];

  id v7 = [(FMFNotNowRequest *)self toHandles];
  [v4 encodeObject:v7 forKey:@"toHandles"];
}

- (FMFNotNowRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (FMFNotNowRequest *)objc_alloc_init((Class)objc_opt_class());
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
  [(FMFNotNowRequest *)v5 setRequestId:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromHandle"];
  [(FMFNotNowRequest *)v5 setFromHandle:v7];

  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"toHandles"];

  [(FMFNotNowRequest *)v5 setToHandles:v11];
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMFNotNowRequest *)self fromHandle];
  id v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (FMFHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
}

- (NSSet)toHandles
{
  return self->_toHandles;
}

- (void)setToHandles:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);

  objc_storeStrong((id *)&self->_fromHandle, 0);
}

@end