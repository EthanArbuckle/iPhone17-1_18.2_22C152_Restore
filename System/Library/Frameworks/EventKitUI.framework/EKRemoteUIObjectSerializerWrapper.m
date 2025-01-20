@interface EKRemoteUIObjectSerializerWrapper
- (_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper)init;
- (id)serializedRepresentationWithEkObject:(id)a3;
- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4;
@end

@implementation EKRemoteUIObjectSerializerWrapper

- (_TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper)init
{
  id v3 = objc_allocWithZone((Class)sub_1B411E828());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return [(EKRemoteUIObjectSerializerWrapper *)&v7 init];
}

- (id)serializedRepresentationWithEkObject:(id)a3 obfuscateKeyProperties:(BOOL)a4
{
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  id v6 = a3;
  objc_super v7 = self;
  id v8 = v5;
  v9 = (void *)sub_1B411E808();

  return v9;
}

- (id)serializedRepresentationWithEkObject:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  id v5 = a3;
  id v6 = self;
  id v7 = v4;
  id v8 = (void *)sub_1B411E818();

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer));
}

@end