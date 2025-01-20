@interface _KSTextReplacementEntry(Sorting)
- (__CFString)shortcutForSorting;
@end

@implementation _KSTextReplacementEntry(Sorting)

- (__CFString)shortcutForSorting
{
  result = (__CFString *)[a1 shortcut];
  if (!result) {
    return &stru_26E29DC78;
  }
  return result;
}

@end