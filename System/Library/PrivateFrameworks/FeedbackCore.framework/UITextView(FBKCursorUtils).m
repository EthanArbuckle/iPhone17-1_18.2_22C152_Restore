@interface UITextView(FBKCursorUtils)
- (BOOL)isCursorIsAtEndOfDocument;
- (double)currentCursorRect;
- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:;
@end

@implementation UITextView(FBKCursorUtils)

- (BOOL)isCursorIsAtEndOfDocument
{
  uint64_t v2 = [a1 selectedRange];
  v3 = [a1 text];
  uint64_t v4 = [v3 length];

  return v2 == v4;
}

- (double)currentCursorRect
{
  uint64_t v2 = [a1 selectedRange];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return *MEMORY[0x263F001A8];
  }
  uint64_t v4 = v2;
  v5 = [a1 beginningOfDocument];
  v6 = [a1 positionFromPosition:v5 offset:v4];

  [a1 caretRectForPosition:v6];
  double v3 = v7;

  return v3;
}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:
{
  id v8 = a5;
  id v9 = a1;
  [v9 currentCursorRect];
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  if (!CGRectEqualToRect(v27, *MEMORY[0x263F001A8]))
  {
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    if (!CGRectIsEmpty(v28))
    {
      objc_msgSend(v9, "convertRect:toView:", v8, x, y, width, height);
      double v16 = v14 + v15;
      [v8 frame];
      double v18 = v17 - a2;
      double v19 = v16 - (v17 - a2);
      [v8 contentOffset];
      double v21 = v20;
      [v8 contentOffset];
      double v23 = v22;
      if (v19 == 1.79769313e308)
      {
        v24 = +[FBKLog appHandle];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[UITextView(FBKCursorUtils) scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:](v24);
        }
      }
      else if (height + a3 + v16 - v21 > v18)
      {
        double v25 = height + a3 + v19;
        v26 = +[FBKLog appHandle];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[UITextView(FBKCursorUtils) scrollTableToAvoidKeyboardInTableView:keyboardHeight:withPadding:](v26);
        }

        objc_msgSend(v8, "setContentOffset:animated:", 0, v23, v25);
      }
    }
  }
}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "offset is too large", v1, 2u);
}

- (void)scrollTableToAvoidKeyboardInTableView:()FBKCursorUtils keyboardHeight:withPadding:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "moving table", v1, 2u);
}

@end