@interface _NTKParmesanPreviewValidatorImplementation
- (_NTKParmesanPreviewValidatorImplementation)initWithPFLCValidator:(id)a3;
- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4;
@end

@implementation _NTKParmesanPreviewValidatorImplementation

- (_NTKParmesanPreviewValidatorImplementation)initWithPFLCValidator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NTKParmesanPreviewValidatorImplementation;
  v6 = [(_NTKParmesanPreviewValidatorImplementation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_validator, a3);
  }

  return v7;
}

- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  validator = self->_validator;
  v13 = (void (**)(id, BOOL))a4;
  objc_msgSend_coverageOfTimeLabel_(validator, v9, v10, v11, x, y, width, height);
  v13[2](v13, v12 <= 0.18);
}

- (void).cxx_destruct
{
}

@end