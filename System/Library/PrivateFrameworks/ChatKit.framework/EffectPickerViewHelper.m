@interface EffectPickerViewHelper
+ (id)viewControllerWithHandler:(id)a3 effectPickerExtensionDetails:(id)a4;
- (_TtC7ChatKit22EffectPickerViewHelper)init;
@end

@implementation EffectPickerViewHelper

+ (id)viewControllerWithHandler:(id)a3 effectPickerExtensionDetails:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a4;
  v8 = (void *)sub_18F617220((uint64_t)sub_18F617564, v6, v7);

  swift_release();

  return v8;
}

- (_TtC7ChatKit22EffectPickerViewHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffectPickerViewHelper();
  return [(EffectPickerViewHelper *)&v3 init];
}

@end