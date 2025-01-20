@interface PageSignature
@end

@implementation PageSignature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->signatureLayer, 0);

  objc_storeStrong((id *)&self->annotation, 0);
}

@end