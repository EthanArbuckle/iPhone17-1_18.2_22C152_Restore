@interface _SwiftUIMKMapView
- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithCoder:(id)a3;
- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3;
- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4;
@end

@implementation _SwiftUIMKMapView

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return -[_SwiftUIMKMapView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return [(_SwiftUIMKMapView *)&v5 initWithCoder:a3];
}

- (_TtC15_MapKit_SwiftUI17_SwiftUIMKMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for _SwiftUIMKMapView();
  return -[_SwiftUIMKMapView initWithFrame:locationManager:](&v10, sel_initWithFrame_locationManager_, a4, x, y, width, height);
}

@end