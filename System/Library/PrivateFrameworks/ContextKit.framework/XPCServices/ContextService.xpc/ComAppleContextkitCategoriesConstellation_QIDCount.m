@interface ComAppleContextkitCategoriesConstellation_QIDCount
- (ComAppleContextkitCategoriesConstellation_QIDCount)initWithNSString:(id)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_QIDCount

- (ComAppleContextkitCategoriesConstellation_QIDCount)initWithNSString:(id)a3 withInt:(int)a4
{
  self->count_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_QIDCount;
  [(ComAppleContextkitCategoriesConstellation_QIDCount *)&v3 dealloc];
}

@end