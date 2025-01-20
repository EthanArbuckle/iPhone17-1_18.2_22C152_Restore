@interface NSCKExportOperation
+ (NSString)entityPath;
- (unint64_t)status;
- (void)setStatus:(unint64_t)a3;
@end

@implementation NSCKExportOperation

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (unint64_t)status
{
  v2 = (void *)[(NSCKExportOperation *)self statusNum];

  return [v2 unsignedIntegerValue];
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];

  [(NSCKExportOperation *)self setStatusNum:v4];
}

@end