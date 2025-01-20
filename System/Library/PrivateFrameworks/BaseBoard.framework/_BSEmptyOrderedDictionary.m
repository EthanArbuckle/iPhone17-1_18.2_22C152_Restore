@interface _BSEmptyOrderedDictionary
+ (id)emptyDictionary;
@end

@implementation _BSEmptyOrderedDictionary

+ (id)emptyDictionary
{
  self;
  if (qword_1EB21B3C0 != -1) {
    dispatch_once(&qword_1EB21B3C0, &__block_literal_global_240);
  }
  v0 = (void *)qword_1EB21B3B8;
  return v0;
}

@end