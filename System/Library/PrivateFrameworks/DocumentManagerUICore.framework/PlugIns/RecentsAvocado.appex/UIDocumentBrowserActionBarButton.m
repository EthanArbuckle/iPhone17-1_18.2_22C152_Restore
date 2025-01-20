@interface UIDocumentBrowserActionBarButton
- (UIDocumentBrowserAction)docAction;
- (_TtC14RecentsAvocado32UIDocumentBrowserActionBarButton)init;
- (_TtC14RecentsAvocado32UIDocumentBrowserActionBarButton)initWithCoder:(id)a3;
- (void)setDocAction:(id)a3;
@end

@implementation UIDocumentBrowserActionBarButton

- (UIDocumentBrowserAction)docAction
{
  return (UIDocumentBrowserAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction));
}

- (void)setDocAction:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction) = (Class)a3;
  id v3 = a3;
}

- (_TtC14RecentsAvocado32UIDocumentBrowserActionBarButton)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIDocumentBrowserActionBarButton();
  return [(UIDocumentBrowserActionBarButton *)&v3 init];
}

- (_TtC14RecentsAvocado32UIDocumentBrowserActionBarButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIDocumentBrowserActionBarButton();
  return [(UIDocumentBrowserActionBarButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado32UIDocumentBrowserActionBarButton_docAction));
}

@end