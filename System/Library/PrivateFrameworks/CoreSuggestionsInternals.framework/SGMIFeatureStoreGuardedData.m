@interface SGMIFeatureStoreGuardedData
@end

@implementation SGMIFeatureStoreGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_columnsToZero, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end