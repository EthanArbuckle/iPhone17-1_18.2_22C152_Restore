@interface _GCFLocalizedPlaceholderString
+ (__objc2_class)sharedPlaceholderString;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (id)_realizedString;
- (id)key;
- (unint64_t)length;
- (unint64_t)retainCount;
@end

@implementation _GCFLocalizedPlaceholderString

+ (__objc2_class)sharedPlaceholderString
{
  return &sharedPlaceholderString_PlaceholderString;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (id)_realizedString
{
  return &stru_26BED82A0;
}

- (id)key
{
  return &stru_26BED82A0;
}

- (unint64_t)length
{
  return 0;
}

@end