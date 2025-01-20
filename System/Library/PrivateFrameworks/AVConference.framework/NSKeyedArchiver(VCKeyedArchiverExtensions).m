@interface NSKeyedArchiver(VCKeyedArchiverExtensions)
+ (id)newSecureArchivedDataWithRootObject:()VCKeyedArchiverExtensions;
@end

@implementation NSKeyedArchiver(VCKeyedArchiverExtensions)

+ (id)newSecureArchivedDataWithRootObject:()VCKeyedArchiverExtensions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initForWritingWithMutableData:v4];
  [v5 setRequiresSecureCoding:1];
  [v5 encodeObject:a3 forKey:*MEMORY[0x1E4F284E8]];
  [v5 finishEncoding];

  return v4;
}

@end