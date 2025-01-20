@interface _SwiftUIMKMapView
- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithCoder:(id)a3;
- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithFrame:(CGRect)a3;
- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4;
@end

@implementation _SwiftUIMKMapView

- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithFrame:(CGRect)a3
{
  return (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView *)sub_22C1605E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithCoder:(id)a3
{
  return (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView *)sub_22C16066C(a3);
}

- (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC12SiriFindMyUIP33_40BE81B29A1033E4F292D7A1A13C1AC117_SwiftUIMKMapView *)sub_22C1606E8(a4, x, y, width, height);
}

@end