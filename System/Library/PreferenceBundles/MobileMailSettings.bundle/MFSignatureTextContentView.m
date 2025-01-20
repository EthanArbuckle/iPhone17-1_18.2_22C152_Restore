@interface MFSignatureTextContentView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
@end

@implementation MFSignatureTextContentView

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("paste:" == a3)
  {
    v7 = +[UIPasteboard generalPasteboard];
    LODWORD(self) = [v7 hasImages] ^ 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFSignatureTextContentView;
    LOBYTE(self) = [(MFSignatureTextContentView *)&v9 canPerformAction:a3 withSender:v6];
  }

  return (char)self;
}

@end