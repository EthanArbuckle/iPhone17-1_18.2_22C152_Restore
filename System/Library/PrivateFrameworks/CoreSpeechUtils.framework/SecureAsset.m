@interface SecureAsset
- (BOOL)containsCategoryWithCategory:(id)a3;
- (BOOL)containsKeyWithKey:(id)a3 category:(id)a4;
- (BOOL)getBoolWithKey:(id)a3 category:(id)a4 defaultValue:(BOOL)a5;
- (NSString)resourcePath;
- (SecureAsset)init;
- (SecureAsset)initWithResourcePath:(id)a3 assetFileName:(id)a4;
- (float)getFloatWithKey:(id)a3 category:(id)a4 defaultValue:(float)a5;
- (id)assetPath;
- (id)getConfigDataWithFileName:(id)a3 prefix:(id)a4;
- (id)getDataWithFileName:(id)a3;
- (id)getDictionaryArrayWithKey:(id)a3 category:(id)a4;
- (id)getDictionaryWithKey:(id)a3 category:(id)a4;
- (id)getMemoryIndexWithKey:(id)a3 category:(id)a4;
- (id)getStringArrayWithKey:(id)a3 category:(id)a4;
- (id)getStringWithCategory:(id)a3;
- (id)getStringWithKey:(id)a3 category:(id)a4;
- (id)getStringWithKey:(id)a3 category:(id)a4 defaultValue:(id)a5;
- (int64_t)getIntWithKey:(id)a3 category:(id)a4 defaultValue:(int64_t)a5;
- (unint64_t)getUnsignedLongLongValueWithKey:(id)a3 category:(id)a4 defaultValue:(unint64_t)a5;
@end

@implementation SecureAsset

- (NSString)resourcePath
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24C78B7F0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (SecureAsset)initWithResourcePath:(id)a3 assetFileName:(id)a4
{
  uint64_t v4 = sub_24C78B6A0();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C78B650();
  uint64_t v7 = sub_24C78B800();
  return (SecureAsset *)SecureAsset.init(resourcePath:assetFileName:)((uint64_t)v6, v7, v8);
}

- (id)assetPath
{
  v2 = self;
  SecureAsset.assetPath()();

  v3 = (void *)sub_24C78B7F0();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)containsKeyWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  LOBYTE(v8) = SecureAsset.containsKey(key:category:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (BOOL)containsCategoryWithCategory:(id)a3
{
  uint64_t v4 = sub_24C78B800();
  v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = SecureAsset.containsCategory(category:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (float)getFloatWithKey:(id)a3 category:(id)a4 defaultValue:(float)a5
{
  uint64_t v7 = sub_24C78B800();
  v9 = v8;
  uint64_t v10 = sub_24C78B800();
  Swift::String v12 = v11;
  Swift::String v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  float v16 = SecureAsset.getFloat(key:category:defaultValue:)(v14, v15, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

- (unint64_t)getUnsignedLongLongValueWithKey:(id)a3 category:(id)a4 defaultValue:(unint64_t)a5
{
  return sub_24C788538(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SecureAsset.getUnsignedLongLongValue(key:category:defaultValue:));
}

- (id)getStringWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  object = SecureAsset.getString(key:category:)(v12, v13).value._object;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (object)
  {
    Swift::String v15 = (void *)sub_24C78B7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v15 = 0;
  }
  return v15;
}

- (id)getStringWithKey:(id)a3 category:(id)a4 defaultValue:(id)a5
{
  sub_24C78B800();
  sub_24C78B800();
  sub_24C78B800();
  v6 = self;
  uint64_t v7 = (void *)sub_24C78B7F0();
  uint64_t v8 = (void *)sub_24C78B7F0();
  id v9 = [(SecureAsset *)v6 getStringWithKey:v7 category:v8];

  if (v9)
  {
    sub_24C78B800();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  uint64_t v10 = (void *)sub_24C78B7F0();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)getStringWithCategory:(id)a3
{
  uint64_t v4 = sub_24C78B800();
  v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = SecureAsset.getString(category:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v10 = (void *)sub_24C78B7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (BOOL)getBoolWithKey:(id)a3 category:(id)a4 defaultValue:(BOOL)a5
{
  uint64_t v7 = sub_24C78B800();
  id v9 = v8;
  uint64_t v10 = sub_24C78B800();
  Swift::String v12 = v11;
  Swift::String v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  Swift::Bool v16 = SecureAsset.getBool(key:category:defaultValue:)(v14, v15, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

- (id)getStringArrayWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  unint64_t v14 = (unint64_t)SecureAsset.getStringArray(key:category:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    Swift::String v15 = (void *)sub_24C78B960();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v15 = 0;
  }
  return v15;
}

- (int64_t)getIntWithKey:(id)a3 category:(id)a4 defaultValue:(int64_t)a5
{
  return sub_24C788538(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SecureAsset.getInt(key:category:defaultValue:));
}

- (id)getDictionaryArrayWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  unint64_t v14 = (unint64_t)SecureAsset.getDictionaryArray(key:category:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697EDBF0);
    Swift::String v15 = (void *)sub_24C78B960();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v15 = 0;
  }
  return v15;
}

- (id)getDictionaryWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  unint64_t v14 = (unint64_t)SecureAsset.getDictionary(key:category:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
    Swift::String v15 = (void *)sub_24C78B7B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v15 = 0;
  }
  return v15;
}

- (id)getDataWithFileName:(id)a3
{
  if (!a3) {
    goto LABEL_3;
  }
  uint64_t v4 = sub_24C78B800();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  swift_retain();
  uint64_t v8 = [(SecureAsset *)v7 resourcePath];
  uint64_t v9 = sub_24C78B800();
  uint64_t v11 = v10;

  uint64_t v12 = sub_24C782AC0(v9, v11, v4, v6);
  unint64_t v14 = v13;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (v14 >> 60 != 15)
  {
    Swift::String v15 = (void *)sub_24C78B6D0();
    sub_24C775B1C(v12, v14);
  }
  else
  {
LABEL_3:
    Swift::String v15 = 0;
  }
  return v15;
}

- (id)getConfigDataWithFileName:(id)a3 prefix:(id)a4
{
  uint64_t v6 = sub_24C78B800();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_24C78B800();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = self;
  uint64_t v12 = SecureAsset.getConfigData(fileName:prefix:)(v6, v8, v9, (uint64_t)a4);
  unint64_t v14 = v13;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14 >> 60 == 15)
  {
    Swift::String v15 = 0;
  }
  else
  {
    Swift::String v15 = (void *)sub_24C78B6D0();
    sub_24C775B1C(v12, v14);
  }
  return v15;
}

- (id)getMemoryIndexWithKey:(id)a3 category:(id)a4
{
  uint64_t v5 = sub_24C78B800();
  uint64_t v7 = v6;
  uint64_t v8 = sub_24C78B800();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  SecureAsset.getMemoryIndex(key:category:)(v14, v12, v13);
  Swift::Bool v16 = v15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

- (SecureAsset)init
{
  result = (SecureAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end