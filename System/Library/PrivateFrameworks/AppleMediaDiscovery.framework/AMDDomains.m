@interface AMDDomains
+ (int64_t)getCodeForDomain:(id)a3;
@end

@implementation AMDDomains

+ (int64_t)getCodeForDomain:(id)a3
{
  v12[8] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (!getCodeForDomain__domainMap)
    {
      v11[0] = @"apps";
      v12[0] = &unk_26BEC18E0;
      v11[1] = @"books";
      v12[1] = &unk_26BEC18F8;
      v11[2] = @"commerce";
      v12[2] = &unk_26BEC1910;
      v11[3] = @"music";
      v12[3] = &unk_26BEC1928;
      v11[4] = @"fitness";
      v12[4] = &unk_26BEC1940;
      v11[5] = @"podcasts";
      v12[5] = &unk_26BEC1958;
      v11[6] = @"video";
      v12[6] = &unk_26BEC1970;
      v11[7] = @"common";
      v12[7] = &unk_26BEC1988;
      id v3 = (id)[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];
      v4 = (void *)getCodeForDomain__domainMap;
      getCodeForDomain__domainMap = (uint64_t)v3;
    }
    id v7 = (id)[(id)getCodeForDomain__domainMap objectForKey:location[0]];
    if (v7) {
      int64_t v6 = [v7 unsignedIntValue];
    }
    else {
      int64_t v6 = 0;
    }
    int64_t v10 = v6;
    int v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    int64_t v10 = 0;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

@end