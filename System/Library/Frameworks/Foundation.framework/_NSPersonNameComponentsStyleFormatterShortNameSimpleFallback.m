@interface _NSPersonNameComponentsStyleFormatterShortNameSimpleFallback
- (id)fallbackStyleFormatter;
- (id)keysOfInterest;
- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4;
@end

@implementation _NSPersonNameComponentsStyleFormatterShortNameSimpleFallback

- (id)stringFromComponents:(id)a3 attributesByRange:(id)a4
{
  if (!-[_NSPersonNameComponentsStyleFormatter fullComponentsAreValid:](self, "fullComponentsAreValid:")) {
    return 0;
  }
  id v7 = [(_NSPersonNameComponentsStyleFormatter *)self _formattedStringFromOrderedKeys:[(_NSPersonNameComponentsStyleFormatter *)self _orderedNonEmptyKeysFromComponents:a3] components:a3 attributesByRange:a4];
  if (v7)
  {
    v8 = v7;
    if ([v7 length]) {
      return v8;
    }
  }
  v9 = [[_NSPersonNameComponentsStyleFormatterMedium alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];

  return [(_NSPersonNameComponentsStyleFormatter *)v9 stringFromComponents:a3 attributesByRange:a4];
}

- (id)keysOfInterest
{
  id result = self->super.super._keysOfInterest;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"familyName", @"givenName", 0);
    self->super.super._keysOfInterest = (NSSet *)result;
  }
  return result;
}

- (id)fallbackStyleFormatter
{
  v2 = [[_NSPersonNameComponentsStyleFormatterMedium alloc] initWithMasterFormatter:[(_NSPersonNameComponentsStyleFormatter *)self masterFormatter]];

  return v2;
}

@end