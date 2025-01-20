@interface UINavigationController(HUModalPresentation)
- (id)finishPresentation:()HUModalPresentation animated:;
@end

@implementation UINavigationController(HUModalPresentation)

- (id)finishPresentation:()HUModalPresentation animated:
{
  id v7 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke;
  v16 = &unk_1E6388F60;
  id v8 = v7;
  id v17 = v8;
  v18 = a1;
  if (!__75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke((uint64_t)&v13))
  {
    v9 = NSStringFromSelector(a2);
    v10 = [a1 presentedViewController];
    NSLog(&cfstr_ReceivedCallTo.isa, v9, v8, a1, v10, v13, v14, v15, v16);
  }
  v11 = objc_msgSend(a1, "hu_dismissViewControllerAnimated:", a4);

  return v11;
}

@end