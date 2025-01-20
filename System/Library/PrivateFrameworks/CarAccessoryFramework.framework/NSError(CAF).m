@interface NSError(CAF)
+ (id)CAF_elementParseFailedForCharacteristic:()CAF;
+ (id)CAF_elementParseFailedForDataSupportType:()CAF;
+ (id)CAF_errorWithCode:()CAF userInfo:;
+ (id)CAF_groupRequestAlreadyPerformed;
+ (id)CAF_groupRequestErrors:()CAF;
+ (id)CAF_groupRequestNilForCharacteristics:()CAF;
+ (id)CAF_groupRequestWithNoCharacteristics;
+ (id)CAF_invalidDataForFormat:()CAF;
+ (id)CAF_outOfRangeErrorForValue:()CAF min:max:;
+ (id)CAF_outOfRangeErrorForValue:()CAF range:;
+ (id)CAF_plistConversionFailedForError:()CAF;
+ (id)CAF_writeToReadonlyError;
@end

@implementation NSError(CAF)

+ (id)CAF_errorWithCode:()CAF userInfo:
{
  v5 = (void *)[a4 mutableCopy];
  v6 = [MEMORY[0x263EFF910] now];
  [v5 setObject:v6 forKeyedSubscript:CAFErrorDateCreated];

  v7 = [MEMORY[0x263F087E8] errorWithDomain:CAFErrorDomain code:a3 userInfo:v5];

  return v7;
}

+ (id)CAF_outOfRangeErrorForValue:()CAF range:
{
  v21[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F08A30];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setNumberStyle:1];
  v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v20 = *MEMORY[0x263F08320];
  v10 = NSString;
  v11 = [v8 stringFromNumber:v7];

  v12 = [v6 minimum];
  v13 = [v8 stringFromNumber:v12];
  v14 = [v6 maximum];

  v15 = [v8 stringFromNumber:v14];
  v16 = [v10 stringWithFormat:@"%@ is out of range.  min=%@ max=%@", v11, v13, v15];
  v21[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v18 = objc_msgSend(v9, "CAF_errorWithCode:userInfo:", 100, v17);

  return v18;
}

+ (id)CAF_outOfRangeErrorForValue:()CAF min:max:
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = (objc_class *)MEMORY[0x263F08A30];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 setNumberStyle:1];
  v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v21 = *MEMORY[0x263F08320];
  v13 = NSString;
  v14 = [v11 stringFromNumber:v10];

  v15 = [v11 stringFromNumber:v9];

  v16 = [v11 stringFromNumber:v8];

  v17 = [v13 stringWithFormat:@"%@ is out of range.  min=%@ max=%@", v14, v15, v16];
  v22[0] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v19 = objc_msgSend(v12, "CAF_errorWithCode:userInfo:", 100, v18);

  return v19;
}

+ (id)CAF_writeToReadonlyError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"characteristic is not writable";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 101, v1);

  return v2;
}

+ (id)CAF_invalidDataForFormat:()CAF
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  if (a3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Data format is not kCFPropertyListBinaryFormat_v1_0.  format=%@", a3, *MEMORY[0x263F08320]];
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 102, v5);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "CAF_errorWithCode:userInfo:", 102, 0);
  }
  return v6;
}

+ (id)CAF_plistConversionFailedForError:()CAF
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  if (a3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Plist conversion failed. errorString=%@", a3, *MEMORY[0x263F08320]];
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 103, v5);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "CAF_errorWithCode:userInfo:", 103, 0);
  }
  return v6;
}

+ (id)CAF_elementParseFailedForDataSupportType:()CAF
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  if (a3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Failed parsing element(s) for dataSupport type %@", a3, *MEMORY[0x263F08320]];
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v5);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "CAF_errorWithCode:userInfo:", 104, 0);
  }
  return v6;
}

+ (id)CAF_elementParseFailedForCharacteristic:()CAF
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  if (a3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Failed parsing element(s) for characteristic %@", a3, *MEMORY[0x263F08320]];
    v9[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v5);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "CAF_errorWithCode:userInfo:", 104, 0);
  }
  return v6;
}

+ (id)CAF_groupRequestWithNoCharacteristics
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v1 = [NSString stringWithFormat:@"GroupRequest was performed with no characteristics"];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v3 = objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 104, v2);

  return v3;
}

+ (id)CAF_groupRequestAlreadyPerformed
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v1 = [NSString stringWithFormat:@"GroupRequest was already performed"];
  v6[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v3 = objc_msgSend(v0, "CAF_errorWithCode:userInfo:", 104, v2);

  return v3;
}

+ (id)CAF_groupRequestNilForCharacteristics:()CAF
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  v10[0] = *MEMORY[0x263F08320];
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"GroupRequest was nil"];
  v10[1] = CAFErrorCharacteristics;
  v11[0] = v6;
  v11[1] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v8 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v7);

  return v8;
}

+ (id)CAF_groupRequestErrors:()CAF
{
  v11[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  v10[0] = *MEMORY[0x263F08320];
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"GroupRequest multiple errors"];
  v10[1] = CAFErrorErrors;
  v11[0] = v6;
  v11[1] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v8 = objc_msgSend(v3, "CAF_errorWithCode:userInfo:", 104, v7);

  return v8;
}

@end