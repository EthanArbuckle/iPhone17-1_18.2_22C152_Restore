@interface MDMHTTPTransaction
+ (id)reauthRequiredMAIDError;
+ (id)reauthRequiredThirdPartyError;
+ (id)unauthorizedByServerError;
- (BOOL)isCheckIn;
- (BOOL)isCheckout;
- (MDMHTTPTransaction)initWithURL:(id)a3 data:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isCheckin:(BOOL)a9 isCheckout:(BOOL)a10 isShortTransaction:(BOOL)a11 rmAccountID:(id)a12;
- (MDMHTTPTransaction)initWithURL:(id)a3 downloadURL:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isShortTransaction:(BOOL)a9 rmAccountID:(id)a10;
- (MDMHTTPTransaction)initWithURL:(id)a3 identity:(__SecIdentity *)a4 pinnedCertificates:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isShortTransaction:(BOOL)a8 rmAccountID:(id)a9;
- (NSString)rmAccountID;
- (void)_commonInit:(__SecIdentity *)a3 timeout:(unint64_t)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 rmAccountID:(id)a8;
- (void)_updateAuthentication;
- (void)resetAuthentication;
- (void)setRmAccountID:(id)a3;
@end

@implementation MDMHTTPTransaction

- (MDMHTTPTransaction)initWithURL:(id)a3 data:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isCheckin:(BOOL)a9 isCheckout:(BOOL)a10 isShortTransaction:(BOOL)a11 rmAccountID:(id)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  id v18 = a4;
  id v19 = a6;
  id v20 = a12;
  uint64_t v21 = *MEMORY[0x1E4F5E720];
  v27.receiver = self;
  v27.super_class = (Class)MDMHTTPTransaction;
  v22 = [(DMCHTTPTransaction *)&v27 initWithURL:a3 method:v21];
  v23 = v22;
  if (v22)
  {
    if (a11) {
      uint64_t v24 = 30;
    }
    else {
      uint64_t v24 = 60;
    }
    [(MDMHTTPTransaction *)v22 _commonInit:a5 timeout:v24 pinnedSecCertificateRefs:v19 pinningRevocationCheckRequired:v13 signMessage:v12 rmAccountID:v20];
    v23->_isCheckIn = a9;
    v23->_isCheckout = a10;
    if (a10) {
      [(DMCHTTPTransaction *)v23 setIgnoreAuthenticatorError:1];
    }
    v25 = &kMDMContentTypeCheckin;
    if (!a9 && !a10) {
      v25 = &kMDMContentTypeMDM;
    }
    [(DMCHTTPTransaction *)v23 setContentType:*v25];
    [(DMCHTTPTransaction *)v23 setData:v18];
  }

  return v23;
}

- (MDMHTTPTransaction)initWithURL:(id)a3 identity:(__SecIdentity *)a4 pinnedCertificates:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isShortTransaction:(BOOL)a8 rmAccountID:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a5;
  id v16 = a9;
  uint64_t v17 = *MEMORY[0x1E4F5E710];
  v22.receiver = self;
  v22.super_class = (Class)MDMHTTPTransaction;
  id v18 = [(DMCHTTPTransaction *)&v22 initWithURL:a3 method:v17];
  id v19 = v18;
  if (v18)
  {
    if (v9) {
      uint64_t v20 = 60;
    }
    else {
      uint64_t v20 = 120;
    }
    [(MDMHTTPTransaction *)v18 _commonInit:a4 timeout:v20 pinnedSecCertificateRefs:v15 pinningRevocationCheckRequired:v11 signMessage:v10 rmAccountID:v16];
  }

  return v19;
}

- (MDMHTTPTransaction)initWithURL:(id)a3 downloadURL:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isShortTransaction:(BOOL)a9 rmAccountID:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a6;
  id v17 = a10;
  uint64_t v18 = *MEMORY[0x1E4F5E710];
  v23.receiver = self;
  v23.super_class = (Class)MDMHTTPTransaction;
  id v19 = [(DMCHTTPTransaction *)&v23 initWithURL:a3 method:v18 downloadURL:a4];
  uint64_t v20 = v19;
  if (v19)
  {
    if (a9) {
      uint64_t v21 = 60;
    }
    else {
      uint64_t v21 = 120;
    }
    [(MDMHTTPTransaction *)v19 _commonInit:a5 timeout:v21 pinnedSecCertificateRefs:v16 pinningRevocationCheckRequired:v11 signMessage:v10 rmAccountID:v17];
  }

  return v20;
}

- (void)_commonInit:(__SecIdentity *)a3 timeout:(unint64_t)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 rmAccountID:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  double v13 = (double)a4;
  id v14 = a8;
  id v15 = a5;
  [(DMCHTTPTransaction *)self setTimeout:v13];
  [(DMCHTTPTransaction *)self setUserAgent:@"MDM/1.0"];
  [(DMCHTTPTransaction *)self setIdentity:a3];
  [(DMCHTTPTransaction *)self setPinnedSecCertificateRefs:v15];

  [(DMCHTTPTransaction *)self setPinningRevocationCheckRequired:v9];
  [(MDMHTTPTransaction *)self setRmAccountID:v14];

  [(MDMHTTPTransaction *)self _updateAuthentication];
  if (v8)
  {
    [(DMCHTTPTransaction *)self setCMSSignatureHeaderName:@"Mdm-Signature"];
  }
}

- (void)resetAuthentication
{
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DD340000, v3, OS_LOG_TYPE_DEBUG, "Reset authentication in MDMHTTPTransaction", v4, 2u);
  }
  [(MDMHTTPTransaction *)self _updateAuthentication];
}

- (void)_updateAuthentication
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(MDMHTTPTransaction *)self rmAccountID];

  v4 = *(NSObject **)(DMCLogObjects() + 8);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      v6 = v4;
      v7 = [(MDMHTTPTransaction *)self rmAccountID];
      int v10 = 138543362;
      BOOL v11 = v7;
      _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_DEBUG, "RMAccount ID provided to MDMHTTPTransaction: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    BOOL v8 = [(MDMHTTPTransaction *)self rmAccountID];
    BOOL v9 = +[MDMAccountUtilities authenticatorForRMAccountID:v8];
    [(DMCHTTPTransaction *)self setAuthenticator:v9];
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_DEBUG, "No RMAccount ID provided to MDMHTTPTransaction", (uint8_t *)&v10, 2u);
  }
}

+ (id)unauthorizedByServerError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E748];
  v4 = DMCErrorArray();
  BOOL v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12020, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)reauthRequiredMAIDError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E748];
  v4 = DMCErrorArray();
  BOOL v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12095, v4, *MEMORY[0x1E4F5E6C0], 0);

  return v5;
}

+ (id)reauthRequiredThirdPartyError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E748];
  v4 = DMCErrorArray();
  BOOL v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12096, v4, *MEMORY[0x1E4F5E6C0], 0);

  return v5;
}

- (BOOL)isCheckIn
{
  return self->_isCheckIn;
}

- (BOOL)isCheckout
{
  return self->_isCheckout;
}

- (NSString)rmAccountID
{
  return self->_rmAccountID;
}

- (void)setRmAccountID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end