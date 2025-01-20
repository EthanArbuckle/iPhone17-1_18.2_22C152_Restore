@interface MFSignatureWebDocumentView
+ (id)standardTextViewPreferences;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
@end

@implementation MFSignatureWebDocumentView

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
    v9.super_class = (Class)MFSignatureWebDocumentView;
    LOBYTE(self) = [(MFSignatureWebDocumentView *)&v9 canPerformAction:a3 withSender:v6];
  }

  return (char)self;
}

+ (id)standardTextViewPreferences
{
  v2 = (void *)qword_40BF8;
  if (!qword_40BF8)
  {
    WebThreadLock();
    id v3 = [objc_alloc((Class)WebPreferences) initWithIdentifier:@"com.apple.uikit.text"];
    v4 = (void *)qword_40BF8;
    qword_40BF8 = (uint64_t)v3;

    [(id)qword_40BF8 setAutosaves:0];
    [(id)qword_40BF8 setJavaEnabled:0];
    [(id)qword_40BF8 setJavaScriptEnabled:0];
    [(id)qword_40BF8 setPlugInsEnabled:0];
    [(id)qword_40BF8 setDatabasesEnabled:0];
    [(id)qword_40BF8 setLocalStorageEnabled:0];
    [(id)qword_40BF8 setOfflineWebApplicationCacheEnabled:0];
    [(id)qword_40BF8 setDiskImageCacheEnabled:0];
    [(id)qword_40BF8 setAcceleratedDrawingEnabled:0];
    v2 = (void *)qword_40BF8;
  }

  return v2;
}

@end