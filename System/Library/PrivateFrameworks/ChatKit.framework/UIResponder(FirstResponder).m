@interface UIResponder(FirstResponder)
+ (id)currentFirstResponder;
- (id)findFirstResponder:()FirstResponder;
@end

@implementation UIResponder(FirstResponder)

+ (id)currentFirstResponder
{
  objc_storeWeak(&currentFirstResponder, 0);
  v0 = [MEMORY[0x1E4F42738] sharedApplication];
  [v0 sendAction:sel_findFirstResponder_ to:0 from:0 forEvent:0];

  id WeakRetained = objc_loadWeakRetained(&currentFirstResponder);

  return WeakRetained;
}

- (id)findFirstResponder:()FirstResponder
{
  return objc_storeWeak(&currentFirstResponder, obj);
}

@end