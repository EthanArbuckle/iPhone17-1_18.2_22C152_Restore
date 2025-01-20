@interface FetchRequestTask
- (ApprovalRequest)request;
- (FetchRequestTask)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)perform;
- (void)setIdentifier:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation FetchRequestTask

- (FetchRequestTask)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FetchRequestTask;
  v5 = [(FetchRequestTask *)&v9 init];
  if (v5)
  {
    if ([v4 containsString:@"_"])
    {
      v6 = [v4 componentsSeparatedByString:@"_"];
      if ((unint64_t)[v6 count] >= 2)
      {
        uint64_t v7 = [v6 lastObject];

        id v4 = (id)v7;
      }
    }
    objc_storeStrong((id *)&v5->_identifier, v4);
  }

  return v5;
}

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100010430;
  v4[3] = &unk_1000385C8;
  v4[4] = self;
  v2 = [(FetchRequestTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end