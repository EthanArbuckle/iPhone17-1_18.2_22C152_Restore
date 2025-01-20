@interface CNPRUISPosterAppearanceObservingAttachmentProvider
- (CNPRUISPosterAppearanceObservingAttachmentProvider)initWithConfiguration:(id)a3;
- (CNPRUISPosterAttachment)obscurableContentAttachment;
- (CNPRUISPosterAttachment)overlayContentAttachment;
- (PRUISPosterAppearanceObservingAttachmentProvider)wrappedProvider;
- (UIView)obscurableContentView;
- (UIView)overlayContentView;
- (UIView)vibrantObscurableContentView;
- (void)applyPosterAppearanceToObserver:(id)a3;
@end

@implementation CNPRUISPosterAppearanceObservingAttachmentProvider

- (void).cxx_destruct
{
}

- (PRUISPosterAppearanceObservingAttachmentProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void)applyPosterAppearanceToObserver:(id)a3
{
}

- (CNPRUISPosterAttachment)overlayContentAttachment
{
  v3 = [CNPRUISPosterAttachment alloc];
  v4 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self->_wrappedProvider overlayContentAttachment];
  v5 = [(CNPRUISPosterAttachment *)v3 initWithAttachment:v4];

  return v5;
}

- (CNPRUISPosterAttachment)obscurableContentAttachment
{
  v3 = [CNPRUISPosterAttachment alloc];
  v4 = [(PRUISPosterAppearanceObservingAttachmentProvider *)self->_wrappedProvider obscurableContentAttachment];
  v5 = [(CNPRUISPosterAttachment *)v3 initWithAttachment:v4];

  return v5;
}

- (UIView)vibrantObscurableContentView
{
  return (UIView *)[(PRUISPosterAppearanceObservingAttachmentProvider *)self->_wrappedProvider vibrantObscurableContentView];
}

- (UIView)obscurableContentView
{
  return (UIView *)[(PRUISPosterAppearanceObservingAttachmentProvider *)self->_wrappedProvider obscurableContentView];
}

- (UIView)overlayContentView
{
  return (UIView *)[(PRUISPosterAppearanceObservingAttachmentProvider *)self->_wrappedProvider overlayContentView];
}

- (CNPRUISPosterAppearanceObservingAttachmentProvider)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPRUISPosterAppearanceObservingAttachmentProvider;
  v5 = [(CNPRUISPosterAppearanceObservingAttachmentProvider *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)getPRUISPosterAppearanceObservingAttachmentProviderClass[0]());
    v7 = [v4 wrappedPosterConfiguration];
    uint64_t v8 = [v6 initWithPRSConfiguration:v7];
    wrappedProvider = v5->_wrappedProvider;
    v5->_wrappedProvider = (PRUISPosterAppearanceObservingAttachmentProvider *)v8;
  }
  return v5;
}

@end