@interface _HDStatisticsCollectionQueryPendingSeries
@end

@implementation _HDStatisticsCollectionQueryPendingSeries

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantities, 0);
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_series, 0);
}

@end