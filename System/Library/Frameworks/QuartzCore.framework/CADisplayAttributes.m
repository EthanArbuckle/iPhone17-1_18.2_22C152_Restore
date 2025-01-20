@interface CADisplayAttributes
- (BOOL)legacyHDMIEDID;
- (id).cxx_construct;
- (id)_initWithAttributes:(EDIDAttributes *)a3;
- (int64_t)bt2020YCC;
- (int64_t)dolbyVision;
- (int64_t)hdrStaticMetadataType1;
- (int64_t)pqEOTF;
- (unsigned)manufacturerID;
- (unsigned)productID;
- (unsigned)serialNumber;
- (unsigned)weekOfManufacture;
- (unsigned)yearOfManufacture;
@end

@implementation CADisplayAttributes

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *(void *)((char *)self + 21) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((_DWORD *)self + 12) = 0;
  return self;
}

- (unsigned)serialNumber
{
  return self->_edid_attributes.serial_number;
}

- (unsigned)yearOfManufacture
{
  return self->_edid_attributes.year_of_manufacture;
}

- (unsigned)weekOfManufacture
{
  return self->_edid_attributes.week_of_manufacture;
}

- (unsigned)productID
{
  return self->_edid_attributes.product_id;
}

- (unsigned)manufacturerID
{
  return self->_edid_attributes.manufacturer_id;
}

- (BOOL)legacyHDMIEDID
{
  return self->_edid_attributes.legacyHDMI;
}

- (int64_t)bt2020YCC
{
  return self->_edid_attributes.bt2020YCC;
}

- (int64_t)hdrStaticMetadataType1
{
  return self->_edid_attributes.hdrStaticMetadataType1;
}

- (int64_t)pqEOTF
{
  return self->_edid_attributes.pqEOTF;
}

- (int64_t)dolbyVision
{
  return self->_edid_attributes.dolbyVision;
}

- (id)_initWithAttributes:(EDIDAttributes *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CADisplayAttributes;
  id result = [(CADisplayAttributes *)&v6 init];
  if (result) {
    BOOL v5 = (char *)result + 8 == (char *)a3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&a3->dolbyVision;
    *((_DWORD *)result + 6) = a3->discreteMediaRefreshRate;
    *((unsigned char *)result + 28) = a3->legacyHDMI;
    *((_OWORD *)result + 2) = *(_OWORD *)&a3->product_id;
    *((_DWORD *)result + 12) = a3->serial_number;
  }
  return result;
}

@end