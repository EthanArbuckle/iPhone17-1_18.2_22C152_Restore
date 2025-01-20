@interface _MLCANESliceParameters
+ (id)sliceUnitParametersWith:(id)a3;
- (NSArray)sliceParams;
- (_MLCANESliceParameters)initWithSliceParams:(id)a3;
@end

@implementation _MLCANESliceParameters

+ (id)sliceUnitParametersWith:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSliceParams:v4];

  return v5;
}

- (_MLCANESliceParameters)initWithSliceParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANESliceParameters;
  v6 = [(_MLCANESliceParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sliceParams, a3);
  }

  return v7;
}

- (NSArray)sliceParams
{
  return self->_sliceParams;
}

- (void).cxx_destruct
{
}

@end