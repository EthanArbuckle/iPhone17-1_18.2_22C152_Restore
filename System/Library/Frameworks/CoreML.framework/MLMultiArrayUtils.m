@interface MLMultiArrayUtils
+ (id)stringForDataType:(int64_t)a3;
@end

@implementation MLMultiArrayUtils

+ (id)stringForDataType:(int64_t)a3
{
  if (a3 > 65599)
  {
    if (a3 == 65600)
    {
      v4 = @"Double";
    }
    else
    {
      if (a3 != 131104)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"MLMultiArrayDataTypeInvalid (%d)", a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      v4 = @"Int32";
    }
  }
  else
  {
    if (a3 != 65552)
    {
      if (a3 == 65568)
      {
        v4 = @"Float32";
        return v4;
      }
      goto LABEL_12;
    }
    v4 = @"Float16";
  }
  return v4;
}

@end