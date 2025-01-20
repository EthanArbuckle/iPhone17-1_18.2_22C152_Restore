@interface PKInputPointBaseFilter
- ($F30B99E357B462A7BBD676CBC61D9025)currentFilteredPoint;
- (PKInputPointBaseFilter)init;
- (void)resetFilter;
@end

@implementation PKInputPointBaseFilter

- (PKInputPointBaseFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKInputPointBaseFilter;
  result = [(PKInputPointBaseFilter *)&v3 init];
  if (result)
  {
    result->_filteredPoint.estimatedActiveInputPropertiesExpectingUpdates = 0;
    *(_OWORD *)&result->_filteredPoint.length = 0u;
    *(_OWORD *)&result->_filteredPoint.rollAngle = 0u;
    *(_OWORD *)&result->_filteredPoint.zPosition = 0u;
    *(_OWORD *)&result->_filteredPoint.predicted = 0u;
    *(_OWORD *)&result->_filteredPoint.azimuth = 0u;
    *(_OWORD *)&result->_filteredPoint.velocity = 0u;
    *(_OWORD *)&result->_numInputPoints = 0u;
    *(_OWORD *)&result->_filteredPoint.var0.location.y = 0u;
  }
  return result;
}

- (void)resetFilter
{
  self->_filteredPoint.estimatedActiveInputPropertiesExpectingUpdates = 0;
  *(_OWORD *)&self->_filteredPoint.length = 0u;
  *(_OWORD *)&self->_filteredPoint.rollAngle = 0u;
  *(_OWORD *)&self->_filteredPoint.zPosition = 0u;
  *(_OWORD *)&self->_filteredPoint.predicted = 0u;
  *(_OWORD *)&self->_filteredPoint.azimuth = 0u;
  *(_OWORD *)&self->_filteredPoint.velocity = 0u;
  *(_OWORD *)&self->_numInputPoints = 0u;
  *(_OWORD *)&self->_filteredPoint.var0.location.y = 0u;
}

- ($F30B99E357B462A7BBD676CBC61D9025)currentFilteredPoint
{
  long long v3 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var9 = v3;
  long long v4 = *(_OWORD *)&self[1].var0.var1.y;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->var14;
  *(_OWORD *)&retstr->var13 = v4;
  long long v5 = *(_OWORD *)&self->var4;
  retstr->var0 = *($047367E7237D93BB26E796C35D3A0ACE *)&self->var2;
  *(_OWORD *)&retstr->var1 = v5;
  long long v6 = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var5 = v6;
  return self;
}

@end