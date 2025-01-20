@interface UITextView
- (BOOL)_replaceAnimatedTextPlaceholderWith:(id)a3 completion:(id)a4;
- (void)_insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4 completion:(id)a5;
- (void)_insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5;
@end

@implementation UITextView

- (void)_insertAnimatedTextPlaceholderAtLocation:(id)a3 numLines:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(UITextView *)self insertAnimatedTextPlaceholderAtLocation:v9 numLines:v8 completion:a4];
  }
  else
  {
    [(UITextView *)self insertAnimatedTextPlaceholderAtLocation:v9 numLines:a4];

    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000047C0;
    block[3] = &unk_1001E9890;
    id v12 = v8;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    id v9 = v12;
  }
}

- (BOOL)_replaceAnimatedTextPlaceholderWith:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [(UITextView *)self replaceAnimatedTextPlaceholderWith:v7 completion:v6];
  }
  else
  {
    [(UITextView *)self replaceAnimatedTextPlaceholderWith:v7];

    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000048E4;
    block[3] = &unk_1001E9890;
    id v12 = v6;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    unsigned __int8 v8 = 1;
    id v7 = v12;
  }

  return v8;
}

- (void)_insertAttributedText:(id)a3 withAnimationStyle:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    [(UITextView *)self insertAttributedText:v8 withAnimationStyle:a4 completion:v9];
  }
  else
  {
    if (v8) {
      [(UITextView *)self insertAttributedText:v8];
    }
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004A04;
    block[3] = &unk_1001E9890;
    id v12 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

@end