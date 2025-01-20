@interface PHNetworkUnavailableAlert
+ (id)alertWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5;
- (PHNetworkUnavailableAlert)initWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5;
- (UIAlertController)alertController;
- (id)alternateButtonTitle;
- (id)defaultButtonTitle;
- (id)message;
- (id)otherButtonTitle;
- (id)title;
- (void)alternateResponse;
- (void)defaultResponse;
- (void)handleAlertDidFinish;
- (void)otherResponse;
- (void)setAlertController:(id)a3;
@end

@implementation PHNetworkUnavailableAlert

+ (id)alertWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCallProvider:v9 dialType:a4 senderIdentityUUID:v8];

  return v10;
}

- (id)title
{
  v2 = [(PHNetworkUnavailableAlert *)self alertController];
  v3 = [v2 title];

  return v3;
}

- (id)message
{
  v2 = [(PHNetworkUnavailableAlert *)self alertController];
  v3 = [v2 message];

  return v3;
}

- (id)defaultButtonTitle
{
  v2 = [(PHNetworkUnavailableAlert *)self alertController];
  v3 = [v2 actions];

  if ([v3 count])
  {
    v4 = [v3 lastObject];
    v5 = [v4 title];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)alternateButtonTitle
{
  v2 = [(PHNetworkUnavailableAlert *)self alertController];
  v3 = [v2 actions];

  if ((unint64_t)[v3 count] < 2)
  {
    v5 = 0;
  }
  else
  {
    v4 = [v3 firstObject];
    v5 = [v4 title];
  }

  return v5;
}

- (id)otherButtonTitle
{
  v2 = [(PHNetworkUnavailableAlert *)self alertController];
  v3 = [v2 actions];

  if ((unint64_t)[v3 count] < 3)
  {
    v5 = 0;
  }
  else
  {
    v4 = [v3 objectAtIndex:1];
    v5 = [v4 title];
  }

  return v5;
}

- (void)defaultResponse
{
  v3 = [(PHNetworkUnavailableAlert *)self alertController];
  id v6 = [v3 actions];

  if ([v6 count])
  {
    v4 = [v6 lastObject];
    v5 = [v4 handler];

    if (v5)
    {
      v5[2](v5, 0);
    }
  }
  [(PHNetworkUnavailableAlert *)self handleAlertDidFinish];
}

- (void)alternateResponse
{
  v3 = [(PHNetworkUnavailableAlert *)self alertController];
  id v6 = [v3 actions];

  if ((unint64_t)[v6 count] >= 2)
  {
    v4 = [v6 firstObject];
    v5 = [v4 handler];

    if (v5)
    {
      v5[2](v5, 0);
    }
  }
  [(PHNetworkUnavailableAlert *)self handleAlertDidFinish];
}

- (void)otherResponse
{
  v3 = [(PHNetworkUnavailableAlert *)self alertController];
  id v6 = [v3 actions];

  if ((unint64_t)[v6 count] >= 3)
  {
    v4 = [v6 objectAtIndex:1];
    v5 = [v4 handler];

    if (v5)
    {
      v5[2](v5, 0);
    }
  }
  [(PHNetworkUnavailableAlert *)self handleAlertDidFinish];
}

- (void)handleAlertDidFinish
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHNetworkUnavailableAlertDidFinishNotification" object:0];
}

- (PHNetworkUnavailableAlert)initWithCallProvider:(id)a3 dialType:(int64_t)a4 senderIdentityUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHNetworkUnavailableAlert;
  id v10 = [(PHNetworkUnavailableAlert *)&v14 init];
  if (v10)
  {
    uint64_t v11 = +[UIAlertController networkUnavailableAlertControllerWithCallProvider:v8 dialType:a4 senderIdentityUUID:v9];
    alertController = v10->_alertController;
    v10->_alertController = (UIAlertController *)v11;
  }
  return v10;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end