@interface ADJingleSegmentRequest
- (id)init:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation ADJingleSegmentRequest

- (id)init:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5
{
  v20[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)ADJingleSegmentRequest;
  id v6 = [(ADJingleRequest *)&v16 init:a3 withCompletion:a5];
  v7 = v6;
  if (v6)
  {
    [v6 setBagKey:*MEMORY[0x263F24288]];
    if (a4)
    {
      v19[0] = @"dsid";
      v8 = [v7 DSID];
      v20[0] = v8;
      v20[1] = @"1";
      v19[1] = @"ioflag";
      v19[2] = @"gflag";
      v20[2] = @"1";
      v9 = NSDictionary;
      v10 = v20;
      v11 = v19;
    }
    else
    {
      v17[0] = @"dsid";
      v8 = [v7 DSID];
      v18[0] = v8;
      v18[1] = @"0";
      v17[1] = @"ioflag";
      v17[2] = @"gflag";
      v18[2] = @"1";
      v9 = NSDictionary;
      v10 = v18;
      v11 = v17;
    }
    v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:3];

    v13 = objc_msgSend(v12, "AD_jsonString");
    v14 = [v13 dataUsingEncoding:4];
    [v7 setRequestBody:v14];
  }
  return v7;
}

@end