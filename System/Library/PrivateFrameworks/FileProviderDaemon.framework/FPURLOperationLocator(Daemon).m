@interface FPURLOperationLocator(Daemon)
- (id)startAccessingLocator;
@end

@implementation FPURLOperationLocator(Daemon)

- (id)startAccessingLocator
{
  v1 = [a1 asURL];
  v2 = v1;
  if (v1 && [v1 startAccessingSecurityScopedResource])
  {
    v3 = (void *)MEMORY[0x1E4F25CB0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__FPURLOperationLocator_Daemon__startAccessingLocator__block_invoke;
    v6[3] = &unk_1E6A73FE8;
    id v7 = v2;
    v4 = [v3 tokenWithBlock:v6];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end