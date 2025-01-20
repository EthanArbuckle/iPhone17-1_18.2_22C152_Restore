@interface CLSError
+ (id)errorForCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
@end

@implementation CLSError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CLSErrorDomain" code:a3 localizedDescription:a4];
}

+ (id)errorForCode:(int64_t)a3
{
  switch(a3)
  {
    case -8:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Incomplete data";
      break;
    case -7:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Not authorized";
      break;
    case -6:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Feature not supported";
      break;
    case -5:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Already in use";
      break;
    case -4:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Cancelled";
      break;
    case -3:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Not found";
      break;
    case -2:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Not implemented";
      break;
    case -1:
      v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      v6 = @"Internal error";
      break;
    default:
      if (a3 == -1000)
      {
        v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v5 = v4;
        v6 = @"<rdar://problem/24271713> PHImageManager requestImageForAsset returned nil result";
      }
      else
      {
        v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v5 = v4;
        v6 = @"Unknown error";
      }
      break;
  }
  v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CLSErrorDomain" code:a3 localizedDescription:v7];

  return v8;
}

@end