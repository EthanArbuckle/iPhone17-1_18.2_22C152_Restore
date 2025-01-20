@interface FKSuggestionsOrderBanner
- (FKSuggestionsOrderBanner)initWithData:(id)a3 error:(id *)a4;
- (id)bannerAttributedSubtitle;
- (id)merchantName;
- (id)orderDeepLink;
- (id)walletLogo;
@end

@implementation FKSuggestionsOrderBanner

- (FKSuggestionsOrderBanner)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FKSuggestionsOrderBanner;
  v7 = [(FKSuggestionsOrderBanner *)&v12 init];
  if (v7
    && (v8 = [[_TtC12FinanceKitUI22SuggestionsOrderBanner alloc] init:v6 error:a4], orderBanner = v7->_orderBanner, v7->_orderBanner = v8, orderBanner, !v7->_orderBanner))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)merchantName
{
  return [(SuggestionsOrderBanner *)self->_orderBanner merchantName];
}

- (id)bannerAttributedSubtitle
{
  return [(SuggestionsOrderBanner *)self->_orderBanner bannerAttributedSubtitle];
}

- (id)walletLogo
{
  return +[SuggestionsOrderBanner walletLogo];
}

- (id)orderDeepLink
{
  return [(SuggestionsOrderBanner *)self->_orderBanner orderDeepLink];
}

- (void).cxx_destruct
{
}

@end