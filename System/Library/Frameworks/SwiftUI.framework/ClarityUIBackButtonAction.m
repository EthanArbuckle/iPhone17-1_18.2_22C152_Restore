@interface ClarityUIBackButtonAction
- (_TtC7SwiftUI25ClarityUIBackButtonAction)init;
- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithCoder:(id)a3;
- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithXPCDictionary:(id)a3;
@end

@implementation ClarityUIBackButtonAction

- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIBackButtonAction();
  return [(ClarityUIBackButtonAction *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned BSActionResponse) -> ();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC7SwiftUI25ClarityUIBackButtonAction *)ClarityUIBackButtonAction.init(info:timeout:forResponseOn:withHandler:)(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC7SwiftUI25ClarityUIBackButtonAction)init
{
  return (_TtC7SwiftUI25ClarityUIBackButtonAction *)@objc ClarityUIBackButtonAction.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIBackButtonAction);
}

- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithXPCDictionary:(id)a3
{
  return (_TtC7SwiftUI25ClarityUIBackButtonAction *)@objc ClarityUIBackButtonAction.init(xpcDictionary:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC7SwiftUI25ClarityUIBackButtonAction)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI25ClarityUIBackButtonAction *)@objc ClarityUIBackButtonAction.init(xpcDictionary:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end