@interface VOTUINemethViewFactory
+ (id)createSwiftUIViewWithDismissAction:(id)a3 setBrailleUnicodeTable:(id)a4 unsetBrailleUnicodeTable:(id)a5;
- (VOTUINemethViewFactory)init;
@end

@implementation VOTUINemethViewFactory

+ (id)createSwiftUIViewWithDismissAction:(id)a3 setBrailleUnicodeTable:(id)a4 unsetBrailleUnicodeTable:(id)a5
{
  uint64_t v8 = type metadata accessor for VOTUINemethView();
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a3);
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  id v18 = objc_allocWithZone((Class)type metadata accessor for VOTUINemethVC());
  swift_retain();
  swift_retain();
  swift_retain();
  sub_18D20((uint64_t)sub_2322C, v15, (uint64_t)sub_2322C, v16, (uint64_t)sub_2322C, v17, (uint64_t)v11);
  v19 = (void *)sub_27830();
  swift_release();
  swift_release();
  swift_release();

  return v19;
}

- (VOTUINemethViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VOTUINemethViewFactory();
  return [(VOTUINemethViewFactory *)&v3 init];
}

@end