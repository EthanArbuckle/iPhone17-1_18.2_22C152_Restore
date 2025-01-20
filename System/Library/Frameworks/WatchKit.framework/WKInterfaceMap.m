@interface WKInterfaceMap
- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImage:(id)a4 centerOffset:(CGPoint)a5;
- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImageNamed:(id)a4 centerOffset:(CGPoint)a5;
- (void)addAnnotation:(CLLocationCoordinate2D)a3 withPinColor:(int64_t)a4;
- (void)removeAllAnnotations;
- (void)setRegion:(id *)a3;
- (void)setVisibleMapRect:(id)a3;
@end

@implementation WKInterfaceMap

- (void)setVisibleMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  v12[4] = *MEMORY[0x263EF8340];
  v7 = [NSNumber numberWithDouble:a3.var0.var0];
  v12[0] = v7;
  v8 = [NSNumber numberWithDouble:v5];
  v12[1] = v8;
  v9 = [NSNumber numberWithDouble:var0];
  v12[2] = v9;
  v10 = [NSNumber numberWithDouble:var1];
  v12[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  [(WKInterfaceObject *)self _sendValueChanged:v11 forProperty:@"rect"];
}

- (void)setRegion:(id *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  v21[4] = *MEMORY[0x263EF8340];
  if (v4 < -180.0 || v4 > 180.0 || v3 < -90.0 || v3 > 90.0 || v5 < 0.0 || v5 > 180.0 || v6 < 0.0 || v6 > 360.0)
  {
    v16 = NSString;
    v17 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&v3, *(void *)&v4];
    v18 = [v16 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v17, *(void *)&v8, *(void *)&v7];

    id v20 = [v16 stringWithFormat:@"Invalid Region %@", v18];

    v19 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:v20 userInfo:0];
    [v19 raise];
  }
  else
  {
    v11 = [NSNumber numberWithDouble:a3];
    v21[0] = v11;
    v12 = [NSNumber numberWithDouble:v9];
    v21[1] = v12;
    v13 = [NSNumber numberWithDouble:v8];
    v21[2] = v13;
    v14 = [NSNumber numberWithDouble:v7];
    v21[3] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [(WKInterfaceObject *)self _sendValueChanged:v15 forProperty:@"region"];
  }
}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImage:(id)a4 centerOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v16[4] = *MEMORY[0x263EF8340];
  v10 = NSNumber;
  id v11 = a4;
  v12 = [v10 numberWithDouble:latitude];
  v16[0] = v12;
  v13 = [NSNumber numberWithDouble:longitude];
  v16[1] = v13;
  v16[2] = v11;
  v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  v16[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];

  [(WKInterfaceObject *)self _sendValueChanged:v15 forProperty:@"annotation"];
}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withImageNamed:(id)a4 centerOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v17[4] = *MEMORY[0x263EF8340];
  v10 = NSNumber;
  id v11 = a4;
  v12 = [v10 numberWithDouble:latitude];
  v17[0] = v12;
  v13 = [NSNumber numberWithDouble:longitude];
  v17[1] = v13;
  v14 = (void *)[v11 copy];

  v17[2] = v14;
  v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  v17[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  [(WKInterfaceObject *)self _sendValueChanged:v16 forProperty:@"annotation"];
}

- (void)addAnnotation:(CLLocationCoordinate2D)a3 withPinColor:(int64_t)a4
{
  double longitude = a3.longitude;
  v11[3] = *MEMORY[0x263EF8340];
  double v7 = [NSNumber numberWithDouble:a3.latitude];
  double v8 = objc_msgSend(NSNumber, "numberWithDouble:", longitude, v7);
  v11[1] = v8;
  double v9 = [NSNumber numberWithInteger:a4];
  v11[2] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  [(WKInterfaceObject *)self _sendValueChanged:v10 forProperty:@"annotation"];
}

- (void)removeAllAnnotations
{
}

@end