@interface MDLUtility
+ (void)convertToUSDZ:(id)a3 writeToURL:(id)a4;
+ (void)convertToUSDZWithURL:(id)a3;
@end

@implementation MDLUtility

+ (void)convertToUSDZWithURL:(id)a3
{
}

+ (void)convertToUSDZ:(id)a3 writeToURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_20B1A804C();
  *(_OWORD *)v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)v21 = 0u;
  objc_msgSend_path(v5, v7, v8);
  id v9 = objc_claimAutoreleasedReturnValue();
  v12 = (char *)objc_msgSend_UTF8String(v9, v10, v11);
  sub_20B07F8E0(__p, v12);
  MEMORY[0x210530940](v21, __p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  objc_msgSend_path(v6, v13, v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  v18 = (char *)objc_msgSend_UTF8String(v15, v16, v17);
  sub_20B07F8E0(__p, v18);
  pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewARKitUsdzPackage();
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  if (SHIBYTE(v23) < 0) {
    operator delete(v22[1]);
  }
  if (SHIBYTE(v22[0]) < 0) {
    operator delete(v21[0]);
  }
}

@end