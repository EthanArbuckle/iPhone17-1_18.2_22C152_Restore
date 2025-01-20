@interface HKPathToValidationSchema
@end

@implementation HKPathToValidationSchema

void ___HKPathToValidationSchema_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 pathForResource:@"CDA_SDTC" ofType:@"xsd" inDirectory:@"cda_validation"];
  v1 = (void *)_HKPathToValidationSchema__pathToValidationSchema;
  _HKPathToValidationSchema__pathToValidationSchema = v0;
}

@end