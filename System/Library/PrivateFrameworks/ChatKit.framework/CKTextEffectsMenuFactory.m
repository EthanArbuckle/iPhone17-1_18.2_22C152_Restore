@interface CKTextEffectsMenuFactory
+ (id)effectKeyCommandsWithAction:(SEL)a3;
+ (id)effectMenuCommandsWithAction:(SEL)a3;
+ (id)inlineEffectMenuActionsWithHandler:(id)a3;
+ (id)inlineEffectMenuActionsWithHandler:(id)a3 activeTextEffectType:(int64_t)a4;
+ (id)inlineEffectMenuWithHandler:(id)a3;
+ (id)inlineEffectMenuWithHandler:(id)a3 activeTextEffectType:(int64_t)a4;
+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6 selectedText:(id)a7;
+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 selectedText:(id)a6;
+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6 selectedText:(id)a7;
+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 selectedText:(id)a6;
+ (id)textStylePaletteMenuWithActiveTextStyles:(unint64_t)a3 selectedText:(id)a4 handler:(id)a5;
+ (id)textStylePaletteMenuWithHandler:(id)a3;
- (CKTextEffectsMenuFactory)init;
@end

@implementation CKTextEffectsMenuFactory

+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6 selectedText:(id)a7
{
  return sub_18EF1F43C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (uint64_t)a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC20textStyleKeyCommands6action15configureImages0L16AttributedTitles06activeC6Styles08selectedC0SaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VSStFZ_0, (unint64_t *)&qword_1E922AAF0);
}

+ (id)effectKeyCommandsWithAction:(SEL)a3
{
  return sub_18EF1F5C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))_s7ChatKit22TextEffectsMenuFactoryC17effectKeyCommands6actionSaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_tFZ_0, (unint64_t *)&qword_1E922AAF0);
}

+ (id)textStylePaletteMenuWithHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC016textStylePaletteE006activeC6Styles08selectedC07handlerSo6UIMenuCSo06IMTextH0V_SSyAK_So8UIActionCtctFZ_0(0, 0, 0xE000000000000000, (uint64_t)sub_18F642A98, v4);
  v6 = v5;
  swift_release();

  return v6;
}

+ (id)textStylePaletteMenuWithActiveTextStyles:(unint64_t)a3 selectedText:(id)a4 handler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_18F7B97E0();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  _s7ChatKit22TextEffectsMenuFactoryC016textStylePaletteE006activeC6Styles08selectedC07handlerSo6UIMenuCSo06IMTextH0V_SSyAK_So8UIActionCtctFZ_0(a3, v7, v9, (uint64_t)sub_18F642A04, v10);
  v12 = v11;
  swift_bridgeObjectRelease();
  swift_release();

  return v12;
}

+ (id)textStyleKeyCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 selectedText:(id)a6
{
  unint64_t v6 = _s7ChatKit22TextEffectsMenuFactoryC20textStyleKeyCommands6action15configureImages0L16AttributedTitles06activeC6Styles08selectedC0SaySo12UIKeyCommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VSStFZ_0((uint64_t)a3, a4, a5, 0);
  sub_18F50E004(v6);
  swift_bridgeObjectRelease();
  sub_18EF3528C(0, &qword_1E923A1F8);
  uint64_t v7 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 selectedText:(id)a6
{
  _s7ChatKit22TextEffectsMenuFactoryC17textStyleCommands6action15configureImages0K16AttributedTitles06activeC6Styles08selectedC0SaySo9UICommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VSStFZ_0((uint64_t)a3, a4, a5, 0);
  sub_18EF3528C(0, &qword_1E923A1F8);
  unint64_t v6 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)textStyleCommandsWithAction:(SEL)a3 configureImages:(BOOL)a4 configureAttributedTitles:(BOOL)a5 activeTextStyles:(unint64_t)a6 selectedText:(id)a7
{
  return sub_18EF1F43C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, (uint64_t)a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))_s7ChatKit22TextEffectsMenuFactoryC17textStyleCommands6action15configureImages0K16AttributedTitles06activeC6Styles08selectedC0SaySo9UICommandCG10ObjectiveC8SelectorVSg_S2bSo06IMTextH0VSStFZ_0, &qword_1E923A1F8);
}

+ (id)inlineEffectMenuWithHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE07handlerSo6UIMenuCySo06IMTextH4TypeV_So8UIActionCtc_tFZ_0((uint64_t)sub_18F642A98, v4);
  unint64_t v6 = v5;
  swift_release();

  return v6;
}

+ (id)inlineEffectMenuWithHandler:(id)a3 activeTextEffectType:(int64_t)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE07handler06activecH4TypeSo6UIMenuCySo06IMTexthK0V_So8UIActionCtc_AJtFZ_0((uint64_t)sub_18F642A98, v6, a4);
  uint64_t v8 = v7;
  swift_release();

  return v8;
}

+ (id)inlineEffectMenuActionsWithHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE7Actions7handler06activecH4TypeSaySo8UIActionCGySo06IMTexthL0V_AHtc_AKtFZ_0((uint64_t)sub_18F642A98, v4, 0);
  swift_release();
  sub_18EF3528C(0, (unint64_t *)&qword_1E922B820);
  v5 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)inlineEffectMenuActionsWithHandler:(id)a3 activeTextEffectType:(int64_t)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  _s7ChatKit22TextEffectsMenuFactoryC012inlineEffectE7Actions7handler06activecH4TypeSaySo8UIActionCGySo06IMTexthL0V_AHtc_AKtFZ_0((uint64_t)sub_18F642A98, v6, a4);
  swift_release();
  sub_18EF3528C(0, (unint64_t *)&qword_1E922B820);
  uint64_t v7 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)effectMenuCommandsWithAction:(SEL)a3
{
  return sub_18EF1F5C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, _s7ChatKit22TextEffectsMenuFactoryC06effectE8Commands6actionSaySo9UICommandCG10ObjectiveC8SelectorVSg_tFZ_0, &qword_1E923A1F8);
}

- (CKTextEffectsMenuFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextEffectsMenuFactory();
  return [(CKTextEffectsMenuFactory *)&v3 init];
}

@end