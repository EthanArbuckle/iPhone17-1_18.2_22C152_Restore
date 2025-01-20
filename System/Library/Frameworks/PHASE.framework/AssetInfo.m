@interface AssetInfo
@end

@implementation AssetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->type, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end