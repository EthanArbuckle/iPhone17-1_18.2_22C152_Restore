@interface BKSCATransform3DContainer
@end

@implementation BKSCATransform3DContainer

uint64_t __44___BKSCATransform3DContainer_protobufSchema__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F808] buildSchemaForClass:objc_opt_class() builder:&__block_literal_global_11359];
  uint64_t v1 = protobufSchema_schema_11358;
  protobufSchema_schema_11358 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __44___BKSCATransform3DContainer_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_transform" forTag:1];
}

@end