@interface ClimateTargetTemperatureZoneSelectionButton.LabelsView
- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)init;
- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithCoder:(id)a3;
- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ClimateTargetTemperatureZoneSelectionButton.LabelsView

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)init
{
  return (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)sub_10000F950();
}

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView_temperatureLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ClimateTargetTemperatureZoneSelectionButton.LabelsView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[ClimateTargetTemperatureZoneSelectionButton.LabelsView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_100007310(0, (unint64_t *)&qword_1000E7AB0);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = static NSObject.== infix(_:_:)();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView)initWithFrame:(CGRect)a3
{
  result = (_TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7Climate43ClimateTargetTemperatureZoneSelectionButton10LabelsView_temperatureLabel));
}

@end