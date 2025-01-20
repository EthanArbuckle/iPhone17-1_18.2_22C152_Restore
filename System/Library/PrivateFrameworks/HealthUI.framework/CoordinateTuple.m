@interface CoordinateTuple
- (_HKAnnotatedHorizontalLineBlockCoordinate)coordinate;
- (_HKAnnotatedHorizontalLineBlockCoordinate)originalCoordinate;
- (void)setCoordinate:(id)a3;
- (void)setOriginalCoordinate:(id)a3;
@end

@implementation CoordinateTuple

- (_HKAnnotatedHorizontalLineBlockCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (_HKAnnotatedHorizontalLineBlockCoordinate)originalCoordinate
{
  return self->_originalCoordinate;
}

- (void)setOriginalCoordinate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCoordinate, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end