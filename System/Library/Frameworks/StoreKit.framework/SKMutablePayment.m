@interface SKMutablePayment
- (void)setAppleIDAuthorizationClientInfo:(id)a3;
- (void)setApplicationUsername:(NSString *)applicationUsername;
- (void)setIsStoreOriginated:(BOOL)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentDiscount:(SKPaymentDiscount *)paymentDiscount;
- (void)setProductIdentifier:(NSString *)productIdentifier;
- (void)setQuantity:(NSInteger)quantity;
- (void)setRequestData:(NSData *)requestData;
- (void)setRequestParameters:(id)a3;
- (void)setSimulatesAskToBuyInSandbox:(BOOL)simulatesAskToBuyInSandbox;
@end

@implementation SKMutablePayment

- (void)setApplicationUsername:(NSString *)applicationUsername
{
  internal = self->super._internal;
  if ((NSString *)internal[1] != applicationUsername)
  {
    v7 = internal;
    uint64_t v5 = [(NSString *)applicationUsername copy];
    v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (void)setIsStoreOriginated:(BOOL)a3
{
  *((unsigned char *)self->super._internal + 88) = a3;
}

- (void)setProductIdentifier:(NSString *)productIdentifier
{
  internal = self->super._internal;
  if ((NSString *)internal[4] != productIdentifier)
  {
    v7 = internal;
    uint64_t v5 = [(NSString *)productIdentifier copy];
    v6 = (void *)internal[4];
    internal[4] = v5;
  }
}

- (void)setQuantity:(NSInteger)quantity
{
  *((void *)self->super._internal + 6) = quantity;
}

- (void)setRequestData:(NSData *)requestData
{
  v4 = requestData;
  uint64_t v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    v6 = v5;
    CFErrorRef error = 0;
    CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.storekit.request-data", &error);
    if (v7)
    {
      v8 = v7;
      CFTypeID TypeID = CFBooleanGetTypeID();
      BOOL v10 = TypeID == CFGetTypeID(v8) && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      CFRelease(v8);
    }
    else
    {
      if (error)
      {
        NSLog(&cfstr_Sectaskcopyval.isa, error);
        CFRelease(error);
      }
      BOOL v10 = 0;
    }
    CFErrorRef error = 0;
    CFTypeRef v11 = SecTaskCopyValueForEntitlement(v6, @"com.apple.developer.storekit.request-data", &error);
    if (v11)
    {
      v12 = (void *)v11;
      CFTypeID v13 = CFBooleanGetTypeID();
      if (v13 == CFGetTypeID(v12) && CFBooleanGetValue((CFBooleanRef)v12)) {
        BOOL v10 = 1;
      }
      CFErrorRef v14 = (CFErrorRef)v12;
    }
    else
    {
      if (!error) {
        goto LABEL_18;
      }
      NSLog(&cfstr_Sectaskcopyval_0.isa, error);
      CFErrorRef v14 = error;
    }
    CFRelease(v14);
LABEL_18:
    CFRelease(v6);
    if (v10) {
      goto LABEL_20;
    }
  }
  NSLog(&cfstr_WarningThisApp.isa);
LABEL_20:
  if ([(NSData *)v4 length] > 0x2000) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The request data must be less than %d bytes", 0x2000);
  }
  internal = self->super._internal;
  if ((NSData *)internal[7] != v4)
  {
    v16 = internal;
    uint64_t v17 = [(NSData *)v4 copy];
    v18 = (void *)internal[7];
    internal[7] = v17;
  }
}

- (void)setSimulatesAskToBuyInSandbox:(BOOL)simulatesAskToBuyInSandbox
{
  *((unsigned char *)self->super._internal + 72) = simulatesAskToBuyInSandbox;
}

- (void)setPaymentDiscount:(SKPaymentDiscount *)paymentDiscount
{
  objc_storeStrong((id *)self->super._internal + 12, paymentDiscount);
  v4 = paymentDiscount;
}

- (void)setPartnerIdentifier:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[2] != a3)
  {
    CFTypeRef v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[2];
    internal[2] = v5;
  }
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[3] != a3)
  {
    CFTypeRef v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[3];
    internal[3] = v5;
  }
}

- (void)setRequestParameters:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[8] != a3)
  {
    CFTypeRef v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[8];
    internal[8] = v5;
  }
}

- (void)setAppleIDAuthorizationClientInfo:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[13] != a3)
  {
    CFTypeRef v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[13];
    internal[13] = v5;
  }
}

@end