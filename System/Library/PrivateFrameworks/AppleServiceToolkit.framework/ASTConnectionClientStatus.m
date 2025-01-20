@interface ASTConnectionClientStatus
- (ASTConnectionClientStatus)initWithClientStatus:(id)a3;
- (id)endpoint;
@end

@implementation ASTConnectionClientStatus

- (ASTConnectionClientStatus)initWithClientStatus:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASTConnectionClientStatus;
  v5 = [(ASTMaterializedConnection *)&v10 init];
  if (v5)
  {
    v6 = [v4 payload];

    if (v6)
    {
      v7 = [v4 payload];
      [(ASTMaterializedConnection *)v5 addBody:v7 gzip:+[ASTConnectionUtilities isGzipEnabled]];

      v8 = [v4 base64Signature];
      [(ASTMaterializedConnection *)v5 setSignature:v8];
    }
  }

  return v5;
}

- (id)endpoint
{
  return @"clientstatus";
}

@end