@interface UIResponder(FirstResponderFinder)
+ (id)_ms_currentFirstResponder;
- (id)_ms_findFirstResponder:()FirstResponderFinder;
@end

@implementation UIResponder(FirstResponderFinder)

+ (id)_ms_currentFirstResponder
{
  objc_storeWeak(&currentFirstResponder, 0);
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  [v0 sendAction:sel__ms_findFirstResponder_ to:0 from:0 forEvent:0];

  id WeakRetained = objc_loadWeakRetained(&currentFirstResponder);

  return WeakRetained;
}

- (id)_ms_findFirstResponder:()FirstResponderFinder
{
  return objc_storeWeak(&currentFirstResponder, obj);
}

@end