@interface DDRTaskEraseWalletPasses
- (PKPassLibrary)passLibrary;
- (double)estimatedTime;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)configure;
- (void)run;
- (void)setEstimatedTime:(double)a3;
- (void)setPassLibrary:(id)a3;
@end

@implementation DDRTaskEraseWalletPasses

- (void)configure
{
  id v3 = objc_alloc_init((Class)PKPassLibrary);
  [(DDRTaskEraseWalletPasses *)self setPassLibrary:v3];

  id v4 = [(DDRTaskEraseWalletPasses *)self passLibrary];
  -[DDRTaskEraseWalletPasses setEstimatedTime:](self, "setEstimatedTime:", (double)(unint64_t)[v4 estimatedTimeToResetApplePay]);
}

- (void)run
{
  id v2 = [(DDRTaskEraseWalletPasses *)self passLibrary];
  [v2 resetApplePayWithDiagnosticReason:@"Device Data Reset"];
}

- (double)estimatedTimeOfCompletion
{
  [(DDRTaskEraseWalletPasses *)self estimatedTime];
  return result;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.eraseWalletPasses";
}

- (double)estimatedTime
{
  return self->_estimatedTime;
}

- (void)setEstimatedTime:(double)a3
{
  self->_estimatedTime = a3;
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (void)setPassLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end