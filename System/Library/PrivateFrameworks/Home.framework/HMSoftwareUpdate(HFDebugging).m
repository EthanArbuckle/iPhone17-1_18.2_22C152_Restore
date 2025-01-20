@interface HMSoftwareUpdate(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMSoftwareUpdate(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = NSStringFromHMSoftwareUpdateState([a1 state]);
  [v5 setObject:v6 forKeyedSubscript:@"state"];

  v7 = [a1 version];
  [v5 setObject:v7 forKeyedSubscript:@"version"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "downloadSize"));
  [v5 setObject:v8 forKeyedSubscript:@"downloadSize"];

  if ([v4 detailLevel])
  {
    v9 = [a1 documentation];
    [v5 setObject:v9 forKeyedSubscript:@"documentation"];
  }
  else
  {
    objc_msgSend(v5, "appendBool:withName:", objc_msgSend(a1, "isDocumentationAvailable"), @"documentationAvailable");
  }
  v10 = [a1 releaseDate];
  [v5 appendObject:v10 withName:@"releaseDate" options:1];

  if ([v4 detailLevel] == 2)
  {
    [a1 updateType];
    v11 = HMSoftwareUpdateUpdateTypeToString();
    [v5 setObject:v11 forKeyedSubscript:@"updateType"];

    v12 = NSString;
    v13 = [a1 delegate];
    v14 = objc_msgSend(v12, "stringWithFormat:", @"%p", v13);
    [v5 setObject:v14 forKeyedSubscript:@"delegate"];
  }
  return v5;
}

@end