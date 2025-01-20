@interface _XREngineeringTypePackedEncodingParser
+ (id)_elementNameToClassMap;
- (XREngineeringTypeBitpackedEncodingConvention)convention;
- (void)_handleCompletion;
- (void)_handleStart;
- (void)setConvention:(id)a3;
@end

@implementation _XREngineeringTypePackedEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA218 != -1) {
    dispatch_once(&qword_2687AA218, &unk_26E752810);
  }
  v2 = (void *)qword_2687AA210;

  return v2;
}

- (void)_handleStart
{
  self->_convention = (XREngineeringTypeBitpackedEncodingConvention *)objc_opt_new();

  MEMORY[0x270F9A758]();
}

- (void)_handleCompletion
{
  v3 = self->super.parent->parent;
  [self v4:v5 v6:v7];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setEncodingConvention:v8 withTransitionContext:v11 completion:v9];
}

- (XREngineeringTypeBitpackedEncodingConvention)convention
{
  return self->_convention;
}

- (void)setConvention:(id)a3
{
}

- (void).cxx_destruct
{
}

@end