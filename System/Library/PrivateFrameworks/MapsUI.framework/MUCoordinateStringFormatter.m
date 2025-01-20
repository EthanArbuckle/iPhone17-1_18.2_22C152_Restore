@interface MUCoordinateStringFormatter
- (BOOL)isCoarseLocation;
- (id)_coordinatePartStringForValue:(double)a3 positiveSymbol:(int)a4 negativeSymbol:(int)a5;
- (id)stringFromCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCoarseLocation:(BOOL)a3;
@end

@implementation MUCoordinateStringFormatter

- (id)stringFromCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  v11[2] = *MEMORY[0x1E4F143B8];
  v5 = [(MUCoordinateStringFormatter *)self _coordinatePartStringForValue:1 positiveSymbol:5 negativeSymbol:a3.latitude];
  v6 = [(MUCoordinateStringFormatter *)self _coordinatePartStringForValue:7 positiveSymbol:3 negativeSymbol:longitude];
  v11[0] = v5;
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8 = _MULocalizedStringFromThisBundle(@"Coordinates delimeter");
  v9 = [v7 componentsJoinedByString:v8];

  return v9;
}

- (id)_coordinatePartStringForValue:(double)a3 positiveSymbol:(int)a4 negativeSymbol:(int)a5
{
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = -a3;
  }
  v7 = MKLocalizedAbbreviationForCompassPoint();
  if ([(MUCoordinateStringFormatter *)self isCoarseLocation]) {
    v8 = @"Coordinates value [Placecard][Coarse Location]";
  }
  else {
    v8 = @"Coordinates value [Placecard][Precise Location]";
  }
  v9 = _MULocalizedStringFromThisBundle(v8);
  v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, *(void *)&v6, v7);

  return v10;
}

- (BOOL)isCoarseLocation
{
  return self->_coarseLocation;
}

- (void)setCoarseLocation:(BOOL)a3
{
  self->_coarseLocation = a3;
}

@end