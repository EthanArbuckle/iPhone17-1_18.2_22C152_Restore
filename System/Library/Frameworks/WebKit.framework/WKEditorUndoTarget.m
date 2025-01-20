@interface WKEditorUndoTarget
- (void)redoEditing:(id)a3;
- (void)undoEditing:(id)a3;
@end

@implementation WKEditorUndoTarget

- (void)undoEditing:(id)a3
{
  v3 = (WebKit::WebEditCommandProxy *)[a3 command];

  WebKit::WebEditCommandProxy::unapply(v3);
}

- (void)redoEditing:(id)a3
{
  v3 = (WebKit::WebEditCommandProxy *)[a3 command];

  WebKit::WebEditCommandProxy::reapply(v3);
}

@end