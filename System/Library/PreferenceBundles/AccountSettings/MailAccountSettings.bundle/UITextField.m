@interface UITextField
- (void)setCursorPosition:(unint64_t)a3;
@end

@implementation UITextField

- (void)setCursorPosition:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [(UITextField *)self text];
    id v6 = [v5 length];

    if ((unint64_t)v6 >= a3) {
      unint64_t v7 = a3;
    }
    else {
      unint64_t v7 = (unint64_t)v6;
    }
    -[UITextField setSelectionRange:](self, "setSelectionRange:", v7, 0);
  }
}

@end