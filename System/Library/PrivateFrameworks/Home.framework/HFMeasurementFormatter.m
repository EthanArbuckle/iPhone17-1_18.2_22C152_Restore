@interface HFMeasurementFormatter
- (HFMeasurementFormatter)init;
- (HFMeasurementFormatter)initWithMeasurementBlock:(id)a3;
- (NSString)unitDescription;
- (id)measurementBlock;
- (id)stringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4;
- (void)setMeasurementBlock:(id)a3;
@end

@implementation HFMeasurementFormatter

- (HFMeasurementFormatter)initWithMeasurementBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HFMeasurementFormatter.m", 22, @"Invalid parameter not satisfying: %@", @"measurementBlock" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)HFMeasurementFormatter;
  v6 = [(NSMeasurementFormatter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(NSMeasurementFormatter *)v6 setUnitStyle:1];
    [(HFMeasurementFormatter *)v7 setMeasurementBlock:v5];
  }

  return v7;
}

- (HFMeasurementFormatter)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFMeasurementFormatter.m" lineNumber:32 description:@"Use -initWithMeasurementBlock:"];

  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(HFMeasurementFormatter *)self measurementBlock];
    v6 = ((void (**)(void, id))v5)[2](v5, v4);
    v7 = [(NSMeasurementFormatter *)self stringFromMeasurement:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HFMeasurementFormatter;
    v7 = [(NSMeasurementFormatter *)&v9 stringForObjectValue:v4];
  }

  return v7;
}

- (NSString)unitDescription
{
  return 0;
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(HFMeasurementFormatter *)self measurementBlock];
    v8 = ((void (**)(void, id))v7)[2](v7, v6);

    if (!a4)
    {
      if (qword_26AB2EDB8 != -1) {
        dispatch_once(&qword_26AB2EDB8, &__block_literal_global_30);
      }
      id v9 = objc_alloc(MEMORY[0x263F08980]);
      [v8 doubleValue];
      uint64_t v10 = objc_msgSend(v9, "initWithDoubleValue:unit:", _MergedGlobals_222);

      v8 = (void *)v10;
    }
    v11 = [(NSMeasurementFormatter *)self stringFromMeasurement:v8];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFMeasurementFormatter;
    v11 = [(NSMeasurementFormatter *)&v13 stringForObjectValue:v6];
  }

  return v11;
}

uint64_t __56__HFMeasurementFormatter_stringForObjectValue_withUnit___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:&stru_26C081158];
  uint64_t v1 = _MergedGlobals_222;
  _MergedGlobals_222 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)measurementBlock
{
  return self->_measurementBlock;
}

- (void)setMeasurementBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end