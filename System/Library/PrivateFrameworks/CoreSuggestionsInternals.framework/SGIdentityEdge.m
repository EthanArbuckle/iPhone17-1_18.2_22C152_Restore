@interface SGIdentityEdge
@end

@implementation SGIdentityEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->b, 0);
  objc_storeStrong((id *)&self->a, 0);
}

@end