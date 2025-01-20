@interface UIKeyboardImpl_TFExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (_NSRange)_selectedTextRangeForInputDelegate:(id)a3;
- (id)_textInInputDelegate:(id)a3;
@end

@implementation UIKeyboardImpl_TFExtras

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (_NSRange)_selectedTextRangeForInputDelegate:(id)a3
{
  id v3 = a3;
  v4 = [v3 selectedTextRange];
  v5 = [v3 beginningOfDocument];
  v6 = [v4 start];
  uint64_t v7 = [v3 offsetFromPosition:v5 toPosition:v6];

  v8 = [v4 end];
  uint64_t v9 = [v3 offsetFromPosition:v5 toPosition:v8];

  NSUInteger v10 = v7;
  NSUInteger v11 = v9 - v7;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)_textInInputDelegate:(id)a3
{
  id v3 = a3;
  v4 = [v3 beginningOfDocument];
  v5 = [v3 endOfDocument];
  v6 = [v3 textRangeFromPosition:v4 toPosition:v5];
  uint64_t v7 = [v3 textInRange:v6];

  return v7;
}

@end