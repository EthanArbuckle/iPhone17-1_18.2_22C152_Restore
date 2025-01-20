@interface AUAGainControl
- (BOOL)changeDecibelValue:(float)a3;
- (BOOL)changeScalarValue:(float)a3;
- (_TtC9AUASDCore14AUAGainControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10;
@end

@implementation AUAGainControl

- (BOOL)changeDecibelValue:(float)a3
{
  v4 = self;
  char v5 = sub_1000A4AB8(a3);

  return v5 & 1;
}

- (BOOL)changeScalarValue:(float)a3
{
  float v4 = *(float *)&self->ASDLevelControl_opaque[OBJC_IVAR____TtC9AUASDCore14AUAGainControl_range]
     + (float)(*(float *)&self->featureUnit[OBJC_IVAR____TtC9AUASDCore14AUAGainControl_range]
             * (float)((float)((float)(*(float *)&self->ASDLevelControl_opaque[OBJC_IVAR____TtC9AUASDCore14AUAGainControl_range
                                                                             + 4]
                                     - *(float *)&self->ASDLevelControl_opaque[OBJC_IVAR____TtC9AUASDCore14AUAGainControl_range])
                             / *(float *)&self->featureUnit[OBJC_IVAR____TtC9AUASDCore14AUAGainControl_range])
                     * a3));
  char v5 = self;
  *(float *)&double v6 = v4;
  unsigned int v7 = [(AUAGainControl *)v5 changeDecibelValue:v6];
  if (v7)
  {
    *(float *)&double v8 = a3;
    [(AUAGainControl *)v5 setScalarValue:v8];
  }

  return v7;
}

- (_TtC9AUASDCore14AUAGainControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10
{
  id v10 = a9;
  result = (_TtC9AUASDCore14AUAGainControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end