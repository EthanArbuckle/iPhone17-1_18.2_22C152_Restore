@interface ADTimerTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADTimerTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  if (a4) {
    objc_msgSend(a5, "ad_aceResponseCommandGenericErrorRepresentation", a3);
  }
  else {
  v5 = objc_msgSend(a5, "_ad_timerResponseForResponse:", a3);
  }
  return v5;
}

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "_ad_timerRequestRepresentation");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

@end