@interface SPSlicingInterfaceInfo
+ (id)_coreTelephonyInterface:(id)a3;
+ (id)_coreTelephonyInterfaceList:(id)a3;
- (NSArray)trafficDescriptors;
- (NSString)interface;
- (id)description;
- (void)setInterface:(id)a3;
- (void)setTrafficDescriptors:(id)a3;
@end

@implementation SPSlicingInterfaceInfo

+ (id)_coreTelephonyInterface:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_opt_new();
    v5 = [v3 interface];
    [v4 setInterface:v5];

    v6 = [v3 trafficDescriptors];

    v7 = +[SPSlicingDescriptor _coreTelephonyDescritorList:v6];
    [v4 setTrafficDescriptors:v7];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_coreTelephonyInterfaceList:(id)a3
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
          v10 = +[SPSlicingInterfaceInfo _coreTelephonyInterface:](SPSlicingInterfaceInfo, "_coreTelephonyInterface:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
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
  v4 = [(SPSlicingInterfaceInfo *)self interface];
  id v5 = [(SPSlicingInterfaceInfo *)self trafficDescriptors];
  id v6 = +[NSString stringWithFormat:@"<%@: interface=%@ descriptors=%@>", v3, v4, v5];

  return v6;
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (void)setTrafficDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end