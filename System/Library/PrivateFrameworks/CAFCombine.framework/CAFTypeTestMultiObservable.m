@interface CAFTypeTestMultiObservable
- (NSString)description;
- (_TtC10CAFCombine26CAFTypeTestMultiObservable)init;
- (void)dealloc;
- (void)serviceDidFinishGroupUpdate:(id)a3;
- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)typeTestMultiService:(id)a3 didUpdateName:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayBool:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayData:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayFloat:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt16:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt32:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt64:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt8:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayRawData:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayString:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt16:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt32:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt64:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt8:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestBool:(BOOL)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItem:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItemList:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItemValue:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItems:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestData:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestDimensionUnitRawValue:(unsigned __int16)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestEnum:(unsigned __int8)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestFloat:(float)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestInt16:(signed __int16)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestInt32:(int)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestInt64:(int64_t)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestInt8:(char)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestRawData:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestString:(id)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestUInt32:(unsigned int)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestUInt64:(unint64_t)a4;
- (void)typeTestMultiService:(id)a3 didUpdateTestUInt8:(unsigned __int8)a4;
- (void)typeTestMultiService:(id)a3 didUpdateUserVisibleLabel:(id)a4;
@end

@implementation CAFTypeTestMultiObservable

- (NSString)description
{
  v2 = self;
  uint64_t v3 = CAFTypeTestMultiObservable.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x24C59DAA0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)dealloc
{
  v2 = self;
  CAFTypeTestMultiObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10CAFCombine26CAFTypeTestMultiObservable)init
{
}

- (void)typeTestMultiService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestBool:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestBool:)();
}

- (void)typeTestMultiService:(id)a3 didUpdateTestUInt8:(unsigned __int8)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt8:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt16:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestUInt32:(unsigned int)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt32:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestUInt64:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestUInt64:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestInt8:(char)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestInt8:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestInt16:(signed __int16)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestInt16:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestInt32:(int)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestInt32:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestInt64:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestInt64:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestFloat:(float)a4
{
  id v5 = a3;
  id v6 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestFloat:)();
}

- (void)typeTestMultiService:(id)a3 didUpdateTestString:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestString:)();

  swift_bridgeObjectRelease();
}

- (void)typeTestMultiService:(id)a3 didUpdateTestData:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestData:)((int)self, (int)a2, (int)a3, (int)a4, (int)CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestData:), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestRawData:(id)a4
{
  @objc CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestData:)((int)self, (int)a2, (int)a3, (int)a4, (int)CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestRawData:), v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestEnum:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestEnum:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestDimensionUnitRawValue:(unsigned __int16)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestDimensionUnitRawValue:)((uint64_t)v7, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItem:)((uint64_t)v8, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayBool:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt8:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt16:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt32:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayUInt64:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt8:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt16:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt32:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayInt64:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayFloat:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayString:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayData:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestArrayRawData:(id)a4
{
}

- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItems:)((uint64_t)v8, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItemValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItemValue:)((uint64_t)v8, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateTestComplexItemList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CAFTypeTestMultiObservable.typeTestMultiService(_:didUpdateTestComplexItemList:)((uint64_t)v8, a4);
}

- (void)typeTestMultiService:(id)a3 didUpdateName:(id)a4
{
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = self;
  CAFTypeTestMultiObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  CAFTypeTestMultiObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);
}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4 = a3;
  int v5 = self;
  CAFTypeTestMultiObservable.serviceDidFinishGroupUpdate(_:)();
}

@end