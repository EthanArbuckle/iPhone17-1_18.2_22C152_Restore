@interface CreateFlattenedScene
@end

@implementation CreateFlattenedScene

BOOL ____CreateFlattenedScene_block_invoke(uint64_t a1, uint64_t a2)
{
  return C3DNodeGetSkinner(a2) || C3DNodeGetMorpher(a2) != 0;
}

BOOL ____CreateFlattenedScene_block_invoke_2(int a1, uint64_t a2)
{
  return C3DNodeGetCamera(a2) || C3DNodeGetLight(a2) != 0;
}

@end