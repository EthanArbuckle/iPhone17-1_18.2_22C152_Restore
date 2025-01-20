@interface AMDPirTest
+ (id)testPir:(id)a3;
@end

@implementation AMDPirTest

+ (id)testPir:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (![location[0] count]) {
    [v17 setObject:@"Nothing to do" forKey:@"error"];
  }
  id v16 = (id)[location[0] objectForKey:TEST_PIR];
  if (!v16) {
    goto LABEL_19;
  }
  id obj = v18;
  id v10 = +[AMDJSCipherMLQueryHandler triggerPIRKVFetch:v16 withError:&obj];
  objc_storeStrong(&v18, obj);
  id v15 = v10;
  if (v18)
  {
    v23 = @"error";
    id v9 = (id)[v18 localizedDescription];
    v24[0] = v9;
    id v20 = (id)[NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

    int v13 = 1;
  }
  else
  {
    [v17 setObject:v15 forKey:TEST_PIR];
    int v13 = 0;
  }
  objc_storeStrong(&v15, 0);
  if (!v13)
  {
LABEL_19:
    id v3 = (id)[location[0] objectForKey:TEST_PEC];
    id v4 = v16;
    id v16 = v3;

    if (!v16) {
      goto LABEL_13;
    }
    id v11 = v18;
    id v8 = +[AMDJSCipherMLQueryHandler triggerPECCall:v16 withError:&v11];
    objc_storeStrong(&v18, v11);
    id v12 = v8;
    if (v18)
    {
      v21 = @"error";
      id v7 = (id)[v18 localizedDescription];
      id v22 = v7;
      id v20 = (id)[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

      int v13 = 1;
    }
    else
    {
      [v17 setObject:v12 forKey:TEST_PEC];
      int v13 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (!v13)
    {
LABEL_13:
      id v20 = v17;
      int v13 = 1;
    }
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  v5 = v20;

  return v5;
}

@end