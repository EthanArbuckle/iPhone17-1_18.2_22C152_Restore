@interface HMDCharacteristicWriteTuple
@end

@implementation HMDCharacteristicWriteTuple

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end