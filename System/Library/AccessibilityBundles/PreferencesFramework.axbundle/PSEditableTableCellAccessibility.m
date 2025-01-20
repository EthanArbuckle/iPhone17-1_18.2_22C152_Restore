@interface PSEditableTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAlwaysReturnsChild;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityChildren;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation PSEditableTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSEditableTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 1;
}

- (id)_accessibilityChildren
{
  v9.receiver = self;
  v9.super_class = (Class)PSEditableTableCellAccessibility;
  v3 = [(PSEditableTableCellAccessibility *)&v9 _accessibilityChildren];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_0];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 objectAtIndex:v4];
  }
  [v5 setIsAccessibilityElement:0];
  v6 = [(PSEditableTableCellAccessibility *)self safeValueForKey:@"textField"];
  v7 = [v5 accessibilityLabel];
  [v6 setAccessibilityLabel:v7];

  return v3;
}

uint64_t __58__PSEditableTableCellAccessibility__accessibilityChildren__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  NSClassFromString(&cfstr_Uitabletextacc.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(PSEditableTableCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(PSEditableTableCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 _accessibilitySelectedTextRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(PSEditableTableCellAccessibility *)self safeValueForKey:@"textField"];
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(PSEditableTableCellAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    NSUInteger v4 = [(PSEditableTableCellAccessibility *)self accessibilityUserDefinedLabel];
    goto LABEL_10;
  }
  NSUInteger v4 = [(PSEditableTableCellAccessibility *)self safeValueForKey:@"title"];
  if (![v4 length])
  {
    NSUInteger v5 = [(PSEditableTableCellAccessibility *)self accessibilityIdentification];
    if ([v5 isEqualToString:@"AASpecifierUsername"])
    {
      NSUInteger v6 = @"account.username.label";
    }
    else
    {
      if (![v5 isEqualToString:@"AASpecifierPassword"])
      {
LABEL_9:

        goto LABEL_10;
      }
      NSUInteger v6 = @"account.password.label";
    }
    uint64_t v7 = accessibilityLocalizedString(v6);

    NSUInteger v4 = (void *)v7;
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(PSEditableTableCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PSEditableTableCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

@end