@interface HRExpandedContentItemLearnMore
- (HRExpandedContentItemLearnMore)initWithURLIdentifier:(int64_t)a3 delegate:(id)a4;
- (HRLinkTextViewDelegate)delegate;
- (int64_t)urlIdentifier;
- (void)setDelegate:(id)a3;
- (void)setUrlIdentifier:(int64_t)a3;
@end

@implementation HRExpandedContentItemLearnMore

- (HRExpandedContentItemLearnMore)initWithURLIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HRExpandedContentItemLearnMore;
  v7 = [(HRExpandedContentItemLearnMore *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_urlIdentifier = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (int64_t)urlIdentifier
{
  return self->_urlIdentifier;
}

- (void)setUrlIdentifier:(int64_t)a3
{
  self->_urlIdentifier = a3;
}

- (HRLinkTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HRLinkTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end