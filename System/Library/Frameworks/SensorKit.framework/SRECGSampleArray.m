@interface SRECGSampleArray
- (SRECGSampleArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
@end

@implementation SRECGSampleArray

- (SRECGSampleArray)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F42958]) initWithBinarySampleRepresentation:a3 metadata:a4];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [[SRElectrocardiogramSample alloc] initWithHAECGSample:v8];
      v11 = (SRECGSampleArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v10, 0);

      return v11;
    }
    else
    {

      v13 = (objc_class *)MEMORY[0x263EFF8C0];
      return (SRECGSampleArray *)objc_alloc_init(v13);
    }
  }
  else
  {

    return 0;
  }
}

@end