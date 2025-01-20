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
    return off_1001BEAD0[a3 - 1];
  }
}

+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4
{
  id v5 = a3;
  v17 = 0;
  v6 = [v5 lowercaseString];
  id v7 = objc_msgSend(v6, "characterAtIndex:", (char *)objc_msgSend(v5, "length") - 1);

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
        uint64_t v9 = objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v5, "length") - 1);

        id v5 = (id)v9;
        goto LABEL_13;
    }
  }
  v15 = +[NSCharacterSet decimalDigitCharacterSet];
  unsigned int v16 = [v15 characterIsMember:v7];

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
  if (v12 == [v5 length] && v11 > 0.0) {
    unint64_t v13 = (a4 + vcvtpd_u64_f64(v11 * (double)v8) - 1) / a4;
  }
LABEL_16:

  return v13;
}

+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[NSURL fileURLWithPath:v7];
  v10 = +[NSTask launchedTaskWithExecutableURL:v9 arguments:v8 error:a5 terminationHandler:0];

  if (v10)
  {
    [v10 waitUntilExit];
    if ([v10 terminationStatus])
    {
      double v11 = [v7 lastPathComponent];
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ failed with error code %d", v11, [v10 terminationStatus]);
      BOOL v13 = +[DIError failWithEnumValue:154 verboseInfo:v12 error:a5];
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)copyDevicePathWithStatfs:(statfs *)a3
{
  if (!a3 || _FSGetLocationFromStatfs((uint64_t)a3, v7, 0x400uLL)) {
    return 0;
  }
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"/dev/%s", v7);
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