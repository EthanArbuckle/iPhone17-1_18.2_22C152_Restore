@interface _KSTextReplacementEntry(Sorting)
- (__CFString)shortcutForSorting;
@end

@implementation _KSTextReplacementEntry(Sorting)

- (__CFString)shortcutForSorting
{
  result = (__CFString *)[a1 shortcut];
  if (!result) {
    return &stru_2703C6C20;
  }
  return result;
}

@end