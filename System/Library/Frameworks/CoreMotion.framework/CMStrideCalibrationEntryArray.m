@interface CMStrideCalibrationEntryArray
- (CMStrideCalibrationEntryArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
@end

@implementation CMStrideCalibrationEntryArray

- (CMStrideCalibrationEntryArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v7 = (void *)MEMORY[0x1E4F28DC0];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v8, v11, v9, v10, 0);
    id v15 = (id)objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v7, v13, v12, a3, 0);

    return (CMStrideCalibrationEntryArray *)v15;
  }
  else
  {

    return 0;
  }
}

@end