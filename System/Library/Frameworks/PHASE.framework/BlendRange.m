@interface BlendRange
@end

@implementation BlendRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->blendEnvelope, 0);

  objc_storeStrong((id *)&self->subtree, 0);
}

@end