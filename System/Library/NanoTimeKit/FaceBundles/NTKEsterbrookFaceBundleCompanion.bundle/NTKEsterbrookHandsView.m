@interface NTKEsterbrookHandsView
- (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView)initWithCoder:(id)a3;
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
@end

@implementation NTKEsterbrookHandsView

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  return sub_246AB2F20(a3);
}

- (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView)initWithCoder:(id)a3
{
  result = (_TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView *)sub_246AD8EB0();
  __break(1u);
  return result;
}

- (id)hourHandConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NTKEsterbrookHandsView();
  v2 = (char *)v5.receiver;
  id result = [(CLKUIAnalogHandsView *)&v5 hourHandConfiguration];
  if (result)
  {
    id v4 = result;
    objc_msgSend(result, sel_setHandLength_, *(double *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView_metrics], v5.receiver, v5.super_class);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)minuteHandConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NTKEsterbrookHandsView();
  v2 = (char *)v5.receiver;
  id result = [(CLKUIAnalogHandsView *)&v5 minuteHandConfiguration];
  if (result)
  {
    id v4 = result;
    objc_msgSend(result, sel_setHandLength_, *(double *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView_metrics + 8], v5.receiver, v5.super_class);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)secondHandConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NTKEsterbrookHandsView();
  v2 = (char *)v5.receiver;
  id result = [(CLKUIAnalogHandsView *)&v5 secondHandConfiguration];
  if (result)
  {
    id v4 = result;
    objc_msgSend(result, sel_setHandLength_, *(double *)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion22NTKEsterbrookHandsView_metrics + 16], v5.receiver, v5.super_class);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end