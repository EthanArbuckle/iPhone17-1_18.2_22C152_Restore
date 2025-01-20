@interface AUABooleanProperty
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int)a5 andData:(void *)a6 forClient:(int)a7;
- (_TtC9AUASDCore18AUABooleanProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5;
@end

@implementation AUABooleanProperty

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  *a5 = 8;
  v8 = self;
  v9.super.super.isa = Bool._bridgeToObjectiveC()().super.super.isa;
  v10 = *(void **)a6;
  *(NSNumber *)a6 = v9;

  return 1;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int)a5 andData:(void *)a6 forClient:(int)a7
{
  NSNumber v9 = self;
  unsigned int v10 = [(AUABooleanProperty *)v9 isSettable];
  if (a5 == 8) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v11 == 1)
  {
    if (!a6)
    {
      __break(1u);
      return v10;
    }
    id v12 = *(id *)a6;
    static Bool._conditionallyBridgeFromObjectiveC(_:result:)();

    v9->ASDCustomProperty_opaque[OBJC_IVAR____TtC9AUASDCore18AUABooleanProperty_isSet] = 0;
  }

  LOBYTE(v10) = v11;
  return v10;
}

- (_TtC9AUASDCore18AUABooleanProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
}

@end