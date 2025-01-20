@interface WebAuthenticationPresentationContextProvider
- (_TtC12FinanceKitUI44WebAuthenticationPresentationContextProvider)init;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
@end

@implementation WebAuthenticationPresentationContextProvider

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E88]), sel_init);

  return v3;
}

- (_TtC12FinanceKitUI44WebAuthenticationPresentationContextProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WebAuthenticationPresentationContextProvider();
  return [(WebAuthenticationPresentationContextProvider *)&v3 init];
}

@end