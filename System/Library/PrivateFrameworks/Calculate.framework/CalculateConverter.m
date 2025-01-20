@interface CalculateConverter
+ (BOOL)needsRefresh;
+ (BOOL)refreshCurrencyCache;
+ (BOOL)refreshCurrencyCacheIfNeeded;
+ (id)currencyCacheLastRefreshDate;
@end

@implementation CalculateConverter

+ (BOOL)refreshCurrencyCacheIfNeeded
{
  if (!+[StocksKitCurrencyCache isEnabled])
  {
    v4 = +[CalculateCurrencyCache shared];
    char v5 = [v4 refreshIfNeeded];
    goto LABEL_5;
  }
  v2 = +[StocksKitCurrencyCache shared];
  int v3 = [v2 needsRefresh];

  if (v3)
  {
    v4 = +[StocksKitCurrencyCache shared];
    char v5 = [v4 refreshSynchronously];
LABEL_5:
    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)refreshCurrencyCache
{
  if (+[StocksKitCurrencyCache isEnabled])
  {
    v2 = +[StocksKitCurrencyCache shared];
    char v3 = [v2 refreshSynchronously];
  }
  else
  {
    v2 = +[CalculateCurrencyCache shared];
    char v3 = [v2 refresh];
  }
  BOOL v4 = v3;

  return v4;
}

+ (BOOL)needsRefresh
{
  BOOL v2 = +[StocksKitCurrencyCache isEnabled];
  char v3 = off_1E6364F60;
  if (v2) {
    char v3 = &off_1E63650E8;
  }
  BOOL v4 = [(__objc2_class *)*v3 shared];
  char v5 = [v4 needsRefresh];

  return v5;
}

+ (id)currencyCacheLastRefreshDate
{
  if (+[StocksKitCurrencyCache isEnabled])
  {
    BOOL v2 = objc_opt_new();
  }
  else
  {
    char v3 = +[CalculateCurrencyCache shared];
    BOOL v2 = [v3 lastRefreshDate];
  }
  return v2;
}

@end