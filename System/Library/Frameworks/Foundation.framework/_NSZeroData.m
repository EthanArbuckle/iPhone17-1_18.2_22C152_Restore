@interface _NSZeroData
+ (id)data;
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (_NSZeroData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (const)bytes;
- (id)_dispatchData;
- (unint64_t)length;
- (unint64_t)retainCount;
@end

@implementation _NSZeroData

+ (id)data
{
  if (qword_1EB1ECB50 != -1) {
    dispatch_once(&qword_1EB1ECB50, &__block_literal_global_240_0);
  }
  return (id)_MergedGlobals_35;
}

- (unint64_t)length
{
  return 0;
}

- (const)bytes
{
  return 0;
}

- (BOOL)_isCompact
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1;
}

- (_NSZeroData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  BOOL v7 = a5;
  _NSDataReinitializationBreak();
  id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);

  return (_NSZeroData *)[v10 initWithBytes:a3 length:a4 copy:v7 deallocator:a6];
}

- (id)_dispatchData
{
  return (id)MEMORY[0x1E4F14410];
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

@end