@interface PQLConnection
- (void)setAutoRollbackHandlerForSwift:(id)a3;
@end

@implementation PQLConnection

- (void)setAutoRollbackHandlerForSwift:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008CE84;
  v5[3] = &unk_100A69F50;
  id v6 = a3;
  id v4 = v6;
  [(PQLConnection *)self setAutoRollbackHandler:v5];
}

@end