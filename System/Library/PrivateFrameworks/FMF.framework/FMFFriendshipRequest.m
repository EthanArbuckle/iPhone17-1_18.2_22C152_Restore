@interface FMFFriendshipRequest
+ (BOOL)supportsSecureCoding;
+ (id)friendshipRequestToHandles:(id)a3 fromHandle:(id)a4 withType:(int64_t)a5 groupId:(id)a6 withEndDate:(id)a7;
- (FMFFriendshipRequest)initWithCoder:(id)a3;
- (FMFFriendshipRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 ofType:(int64_t)a5 groupId:(id)a6 endDate:(id)a7 requestId:(id)a8;
- (FMFHandle)fromHandle;
- (NSDate)endDate;
- (NSSet)toHandles;
- (NSString)groupId;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setToHandles:(id)a3;
@end

@implementation FMFFriendshipRequest

- (FMFFriendshipRequest)initWithFromHandle:(id)a3 toHandle:(id)a4 ofType:(int64_t)a5 groupId:(id)a6 endDate:(id)a7 requestId:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a3;
  v19 = (FMFFriendshipRequest *)objc_alloc_init((Class)objc_opt_class());

  [(FMFFriendshipRequest *)v19 setRequestType:a5];
  [(FMFFriendshipRequest *)v19 setFromHandle:v18];

  if (v14)
  {
    v20 = [MEMORY[0x263EFFA08] setWithObject:v14];
    [(FMFFriendshipRequest *)v19 setToHandles:v20];
  }
  [(FMFFriendshipRequest *)v19 setEndDate:v15];
  [(FMFFriendshipRequest *)v19 setRequestId:v16];

  [(FMFFriendshipRequest *)v19 setGroupId:v17];
  return v19;
}

+ (id)friendshipRequestToHandles:(id)a3 fromHandle:(id)a4 withType:(int64_t)a5 groupId:(id)a6 withEndDate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init((Class)objc_opt_class());
  [v15 setToHandles:v14];

  [v15 setRequestType:a5];
  [v15 setEndDate:v11];

  [v15 setGroupId:v12];
  [v15 setFromHandle:v13];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRequestType:", -[FMFFriendshipRequest requestType](self, "requestType"));
  v5 = [(FMFFriendshipRequest *)self requestId];
  [v4 setRequestId:v5];

  v6 = [(FMFFriendshipRequest *)self fromHandle];
  [v4 setFromHandle:v6];

  v7 = [(FMFFriendshipRequest *)self toHandles];
  [v4 setToHandles:v7];

  v8 = [(FMFFriendshipRequest *)self endDate];
  [v4 setEndDate:v8];

  v9 = [(FMFFriendshipRequest *)self groupId];
  [v4 setGroupId:v9];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[FMFFriendshipRequest requestType](self, "requestType"), @"requestType");
  v5 = [(FMFFriendshipRequest *)self requestId];
  [v4 encodeObject:v5 forKey:@"requestId"];

  v6 = [(FMFFriendshipRequest *)self fromHandle];
  [v4 encodeObject:v6 forKey:@"fromHandle"];

  v7 = [(FMFFriendshipRequest *)self toHandles];
  [v4 encodeObject:v7 forKey:@"toHandles"];

  v8 = [(FMFFriendshipRequest *)self endDate];
  [v4 encodeObject:v8 forKey:@"endDate"];

  id v9 = [(FMFFriendshipRequest *)self groupId];
  [v4 encodeObject:v9 forKey:@"groupId"];
}

- (FMFFriendshipRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (FMFFriendshipRequest *)objc_alloc_init((Class)objc_opt_class());
  -[FMFFriendshipRequest setRequestType:](v5, "setRequestType:", [v4 decodeIntegerForKey:@"requestType"]);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
  [(FMFFriendshipRequest *)v5 setRequestId:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromHandle"];
  [(FMFFriendshipRequest *)v5 setFromHandle:v7];

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"toHandles"];
  [(FMFFriendshipRequest *)v5 setToHandles:v11];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  [(FMFFriendshipRequest *)v5 setEndDate:v12];

  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupId"];

  [(FMFFriendshipRequest *)v5 setGroupId:v13];
  return v5;
}

- (id)description
{
  int64_t v3 = [(FMFFriendshipRequest *)self requestType];
  if (!v3)
  {
    v8 = NSString;
    uint64_t v9 = objc_opt_class();
    v6 = [(FMFFriendshipRequest *)self toHandles];
    v7 = [(FMFFriendshipRequest *)self endDate];
    [v8 stringWithFormat:@"<%@ %p [%@ :Type => FMFFriendshipRequestTypeOffer, Expires: %@]>", v9, self, v6, v7];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = NSString;
    uint64_t v5 = objc_opt_class();
    v6 = [(FMFFriendshipRequest *)self fromHandle];
    v7 = [(FMFFriendshipRequest *)self endDate];
    [v4 stringWithFormat:@"<%@ %p [%@ :Type => FMFFriendshipRequestTypeAsk, Expires: %@]>", v5, self, v6, v7];
    v10 = LABEL_5:;

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
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

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
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
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);

  objc_storeStrong((id *)&self->_fromHandle, 0);
}

@end