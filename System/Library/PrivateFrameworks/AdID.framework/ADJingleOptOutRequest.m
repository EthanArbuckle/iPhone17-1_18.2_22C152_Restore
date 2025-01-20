@interface ADJingleOptOutRequest
- (id)init:(id)a3 state:(BOOL)a4 timestamp:(double)a5 completionHandler:(id)a6;
@end

@implementation ADJingleOptOutRequest

- (id)init:(id)a3 state:(BOOL)a4 timestamp:(double)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  v19[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)ADJingleOptOutRequest;
  id v8 = [(ADJingleRequest *)&v17 init:a3 withCompletion:a6];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x263F24280];
    if (!v7) {
      v10 = (void *)MEMORY[0x263F24278];
    }
    [v8 setBagKey:*v10];
    v18[0] = @"dsid";
    v11 = [v9 DSID];
    v18[1] = @"oo-timestamp";
    v19[0] = v11;
    v12 = [NSNumber numberWithDouble:a5];
    v19[1] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    v14 = objc_msgSend(v13, "AD_jsonString");
    v15 = [v14 dataUsingEncoding:4];
    [v9 setRequestBody:v15];
  }
  return v9;
}

@end