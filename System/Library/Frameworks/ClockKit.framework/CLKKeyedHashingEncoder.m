@interface CLKKeyedHashingEncoder
- (BOOL)allowsKeyedCoding;
- (BOOL)isFinished;
- (BOOL)requiresSecureCoding;
- (CLKKeyedHashingEncoder)init;
- (NSData)encodedData;
- (uint64_t)encodeInt:(unsigned int)a3 forKey:;
- (uint64_t)encodeInteger:(unint64_t)a3 forKey:;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDataObject:(id)a3;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
- (void)encodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)finishEncoding;
@end

@implementation CLKKeyedHashingEncoder

- (CLKKeyedHashingEncoder)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 0;
  uint64_t v4 = OBJC_IVAR___CLKKeyedHashingEncoder_keyValuePairs;
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)sub_21C603CA0(MEMORY[0x263F8EE78]);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(CLKKeyedHashingEncoder *)&v7 init];
}

- (BOOL)requiresSecureCoding
{
  return 0;
}

- (void)finishEncoding
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state) = 1;
}

- (NSData)encodedData
{
  v2 = self;
  uint64_t v3 = KeyedHashingEncoder.encodedData.getter();
  unint64_t v5 = v4;

  v6 = (void *)sub_21C60A4F0();
  sub_21C605ED0(v3, v5);

  return (NSData *)v6;
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___CLKKeyedHashingEncoder_state);
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  unint64_t v5 = (void *)*MEMORY[0x263F08168];
  id v6 = objc_allocWithZone(MEMORY[0x263EFF940]);
  objc_super v7 = self;
  id v8 = v5;
  v9 = (void *)sub_21C60A590();
  id v10 = objc_msgSend(v6, sel_initWithName_reason_userInfo_, v8, v9, 0);

  objc_msgSend(v10, sel_raise);
  abort();
}

- (void)encodeDataObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_21C60A500();

  id v6 = (void *)*MEMORY[0x263F08168];
  id v7 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v8 = v6;
  v9 = (void *)sub_21C60A590();
  id v10 = objc_msgSend(v7, sel_initWithName_reason_userInfo_, v8, v9, 0);

  objc_msgSend(v10, sel_raise);
  abort();
}

- (void)encodeObject:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_21C60A640();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v3 = self;
  }
  unint64_t v5 = (void *)*MEMORY[0x263F08168];
  id v6 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v7 = v5;
  id v8 = (void *)sub_21C60A590();
  id v9 = objc_msgSend(v6, sel_initWithName_reason_userInfo_, v7, v8, 0);

  objc_msgSend(v9, sel_raise);
  abort();
}

- (void)encodeRootObject:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_21C60A640();
  swift_unknownObjectRelease();
  sub_21C606050((uint64_t)v6, (uint64_t)v5);
  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v5, 0xD000000000000021, 0x800000021C618EF0);
  sub_21C6060AC((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = self;
    swift_unknownObjectRetain();
    sub_21C60A640();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    id v8 = a4;
    id v9 = self;
  }
  uint64_t v10 = sub_21C60A5A0();
  uint64_t v12 = v11;

  KeyedHashingEncoder.encode(_:forKey:)((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();
  sub_21C6060AC((uint64_t)v13);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = sub_21C60A5A0();
  id v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (uint64_t)encodeInt:(unsigned int)a3 forKey:
{
  uint64_t v5 = sub_21C60A5A0();
  uint64_t v7 = v6;
  id v8 = a1;
  _s8ClockKit19KeyedHashingEncoderC10encodeCInt_6forKeyys5Int32V_SStF_0(a3, v5, v7);

  return swift_bridgeObjectRelease();
}

- (uint64_t)encodeInteger:(unint64_t)a3 forKey:
{
  uint64_t v5 = sub_21C60A5A0();
  uint64_t v7 = v6;
  id v8 = a1;
  sub_21C604AEC(a3, v5, v7);

  return swift_bridgeObjectRelease();
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  uint64_t v6 = sub_21C60A5A0();
  id v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  uint64_t v6 = sub_21C60A5A0();
  id v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  KeyedHashingEncoder.encode(_:forKey:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5
{
  uint64_t v8 = sub_21C60A5A0();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  KeyedHashingEncoder.encodeBytes(_:length:forKey:)(a3, a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_21C60A640();

    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v5 = self;
  }
  uint64_t v8 = (void *)*MEMORY[0x263F08168];
  id v9 = objc_allocWithZone(MEMORY[0x263EFF940]);
  id v10 = v8;
  uint64_t v11 = (void *)sub_21C60A590();
  id v12 = objc_msgSend(v9, sel_initWithName_reason_userInfo_, v10, v11, 0);

  objc_msgSend(v12, sel_raise);
  abort();
}

- (void).cxx_destruct
{
}

@end