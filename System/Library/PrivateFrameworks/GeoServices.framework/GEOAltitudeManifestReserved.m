@interface GEOAltitudeManifestReserved
- (id).cxx_construct;
@end

@implementation GEOAltitudeManifestReserved

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedIsolater, 0);
  left = self->_reservedTriggerData.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::destroy(left);
}

@end