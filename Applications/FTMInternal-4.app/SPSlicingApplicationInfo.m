@interface SPSlicingApplicationInfo
+ (id)_coreTelephonyAppInfoList:(id)a3;
+ (id)_coreTelephonyApplicationInfo:(id)a3;
- (NSArray)interfaces;
- (NSNumber)foreground;
- (NSString)bundleId;
- (id)description;
- (void)setBundleId:(id)a3;
- (void)setForeground:(id)a3;
- (void)setInterfaces:(id)a3;
@end

@implementation SPSlicingApplicationInfo

+ (id)_coreTelephonyApplicationInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_opt_new();
    v5 = [v3 bundleId];
    [v4 setBundleId:v5];

    v6 = [v3 foreground];
    [v4 setForeground:v6];

    v7 = [v3 interfaces];

    v8 = +[SPSlicingInterfaceInfo _coreTelephonyInterfaceList:v7];
    [v4 setInterfaces:v8];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_coreTelephonyAppInfoList:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[SPSlicingApplicationInfo _coreTelephonyApplicationInfo:](SPSlicingApplicationInfo, "_coreTelephonyApplicationInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  id v11 = [v4 copy];

  return v11;
}

- (id)description
{
  id v3 = [(id)objc_opt_class() description];
  v4 = [(SPSlicingApplicationInfo *)self bundleId];
  id v5 = [(SPSlicingApplicationInfo *)self foreground];
  id v6 = [(SPSlicingApplicationInfo *)self interfaces];
  id v7 = +[NSString stringWithFormat:@"<%@: bundleId=%@ foreground=%@ interfaces=%@>", v3, v4, v5, v6];

  return v7;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSNumber)foreground
{
  return self->_foreground;
}

- (void)setForeground:(id)a3
{
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_foreground, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end