@interface TDCustomArtworkProduction
- (BOOL)hasCustomDateOfLastChange;
- (void)setDateOfLastChange:(id)a3;
- (void)setHasCustomDateOfLastChange:(BOOL)a3;
@end

@implementation TDCustomArtworkProduction

- (void)setDateOfLastChange:(id)a3
{
  if (![(TDCustomArtworkProduction *)self hasCustomDateOfLastChange])
  {
    [(TDCustomArtworkProduction *)self setPrimitiveValue:a3 forKey:@"dateOfLastChange"];
  }
}

- (BOOL)hasCustomDateOfLastChange
{
  return self->_hasCustomDateOfLastChange;
}

- (void)setHasCustomDateOfLastChange:(BOOL)a3
{
  self->_hasCustomDateOfLastChange = a3;
}

@end