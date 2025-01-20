@interface CNUIPassKitWrapper
+ (BOOL)isPeerPaymentAvailable;
+ (id)urlForPeerPaymentWithHandle:(id)a3;
@end

@implementation CNUIPassKitWrapper

+ (BOOL)isPeerPaymentAvailable
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    v3 = softLinkPKPeerPaymentIsAvailable;
    LOBYTE(v2) = v3();
  }
  return v2;
}

+ (id)urlForPeerPaymentWithHandle:(id)a3
{
  return softLinkPKPeerPaymentGetSendPaymentSensitiveURL(a3, 0, 0);
}

@end