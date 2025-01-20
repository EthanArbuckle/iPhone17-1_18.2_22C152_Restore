@interface IMDRecord
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (IMDRecord)retain;
- (unint64_t)hash;
@end

@implementation IMDRecord

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (IMDRecord)retain
{
  return (IMDRecord *)MEMORY[0x1F40D8EC0](self, a2);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

@end