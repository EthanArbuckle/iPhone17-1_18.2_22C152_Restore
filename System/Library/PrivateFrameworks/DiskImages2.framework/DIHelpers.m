@interface DIHelpers
+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5;
+ (id)copyDevicePathWithStatfs:(statfs *)a3;
+ (id)stringWithImageFormat:(int64_t)a3;
+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4;
@end

@implementation DIHelpers

+ (id)stringWithImageFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return off_2644A2538[a3 - 1];
  }
}

+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4
{
  id v5 = a3;
  v17 = 0;
  v6 = [v5 lowercaseString];
  uint64_t v7 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v5, "length") - 1);

  if ((int)v7 <= 106)
  {
    if (v7 == 98)
    {
      unint64_t v8 = 1;
      goto LABEL_12;
    }
    if (v7 == 103)
    {
      unint64_t v8 = 0x40000000;
      goto LABEL_12;
    }
  }
  else
  {
    switch(v7)
    {
      case 'k':
        unint64_t v8 = 1024;
        goto LABEL_12;
      case 'm':
        unint64_t v8 = 0x100000;
        goto LABEL_12;
      case 't':
        unint64_t v8 = 0x10000000000;
LABEL_12:
        uint64_t v9 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);

        id v5 = (id)v9;
        goto LABEL_13;
    }
  }
  v15 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  int v16 = [v15 characterIsMember:v7];

  if (!v16)
  {
    unint64_t v13 = 0;
    goto LABEL_16;
  }
  unint64_t v8 = a4;
LABEL_13:
  id v5 = v5;
  v10 = (const char *)[v5 UTF8String];
  double v11 = strtod(v10, &v17);
  v12 = (char *)(v17 - v10);
  unint64_t v13 = 0;
  if (v12 == (char *)[v5 length] && v11 > 0.0) {
    unint64_t v13 = (a4 + vcvtpd_u64_f64(v11 * (double)v8) - 1) / a4;
  }
LABEL_16:

  return v13;
}

+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = (void *)MEMORY[0x263F08B50];
  uint64_t v9 = NSURL;
  id v10 = a4;
  double v11 = [v9 fileURLWithPath:v7];
  v12 = [v8 launchedTaskWithExecutableURL:v11 arguments:v10 error:a5 terminationHandler:0];

  if (v12)
  {
    [v12 waitUntilExit];
    if ([v12 terminationStatus])
    {
      unint64_t v13 = NSString;
      v14 = [v7 lastPathComponent];
      v15 = [v13 stringWithFormat:@"%@ failed with error code %d", v14, objc_msgSend(v12, "terminationStatus")];
      BOOL v16 = +[DIError failWithEnumValue:154 verboseInfo:v15 error:a5];
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)copyDevicePathWithStatfs:(statfs *)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a3 || _FSGetLocationFromStatfs((uint64_t)a3, v7, 0x400uLL)) {
    return 0;
  }
  v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"/dev/%s", v7);
  if ([v4 hasPrefix:@"/dev/disk"]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v3 = v5;

  return v3;
}

@end