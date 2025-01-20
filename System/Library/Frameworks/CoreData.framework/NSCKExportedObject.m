@interface NSCKExportedObject
+ (NSString)entityPath;
- (int64_t)changeType;
- (unint64_t)type;
- (void)setChangeType:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NSCKExportedObject

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (unint64_t)type
{
  v2 = (void *)[(NSCKExportedObject *)self typeNum];

  return [v2 unsignedIntegerValue];
}

- (void)setType:(unint64_t)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];

  [(NSCKExportedObject *)self setTypeNum:v4];
}

- (int64_t)changeType
{
  v2 = (void *)[(NSCKExportedObject *)self changeTypeNum];

  return [v2 unsignedIntegerValue];
}

- (void)setChangeType:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];

  [(NSCKExportedObject *)self setChangeTypeNum:v4];
}

@end