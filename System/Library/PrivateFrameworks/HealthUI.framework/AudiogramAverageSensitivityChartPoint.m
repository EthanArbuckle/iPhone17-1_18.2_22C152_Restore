@interface AudiogramAverageSensitivityChartPoint
- (_TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint)init;
- (id)allYValues;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation AudiogramAverageSensitivityChartPoint

- (id)xValueAsGenericType
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_xCoord));
}

- (id)yValue
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord));
}

- (id)yValueForKey:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord));
}

- (id)allYValues
{
  sub_1E0B5CE0C(0, (unint64_t *)&qword_1EAD69A40, MEMORY[0x1E4FBBE00]);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1E0F07C90;
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord);
  *(void *)(v3 + 56) = sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6D9E0);
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)userInfo
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_averageSensitivity);
  char v4 = *((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_isLeftEar);
  id v5 = (objc_class *)type metadata accessor for AudiogramAverageSensitivityChartData();
  v6 = objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC8HealthUI36AudiogramAverageSensitivityChartData_averageSensitivity] = v3;
  v6[OBJC_IVAR____TtC8HealthUI36AudiogramAverageSensitivityChartData_isLeftEar] = v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v7 = self;
  v8 = [(AudiogramAverageSensitivityChartPoint *)&v10 init];

  return v8;
}

- (_TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint)init
{
  result = (_TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_xCoord));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUIP33_2A1C24F28D3D74C6BE1A5464632B356C37AudiogramAverageSensitivityChartPoint_yCoord);
}

@end